From: qais.yousef@arm.com (Qais Yousef)
Date: Thu, 28 Feb 2019 13:53:43 +0000
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190227193748.132301-1-joel@joelfernandes.org>
References: <20190227193748.132301-1-joel@joelfernandes.org>
Message-ID: <20190228135343.23kzkilig3bsioov@e107158-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228135343.gawgBdlJ_OsTvt1MKj0wry3bhxRECfGk19V9IpCdRNk@z>

Hi Joel

On 02/27/19 14:37, Joel Fernandes (Google) wrote:
> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> it possible to build kernel modules, run eBPF programs, and other
> tracing programs that need to extend the kernel for tracing purposes
> without any dependency on the file system having headers and build
> artifacts.

Thanks for doing this work. This will be a very helpful feature and simplify
the workflow, especially when dealing with multiple targets each with its own
kernel tree/version.

> 
> On Android and embedded systems, it is common to switch kernels but not
> have kernel headers available on the file system. Raw kernel headers
> also cannot be copied into the filesystem like they can be on other
> distros, due to licensing and other issues. There's no linux-headers
> package on Android. Further once a different kernel is booted, any

I use non-android systems quite often for development. And yes while getting
the headers on the target isn't always a problem but when moving across trees
or versions it's very easy to mess this up and having the headers embedded in
the kernel means you're always guaranteed to use the right headers. eBPF is my
main use case here.

> headers stored on the file system will no longer be useful. By storing
> the headers as a compressed archive within the kernel, we can avoid these
> issues that have been a hindrance for a long time.
> 
> The feature is also buildable as a module just in case the user desires
> it not being part of the kernel image. This makes it possible to load
> and unload the headers on demand. A tracing program, or a kernel module
> builder can load the module, do its operations, and then unload the
> module to save kernel memory. The total memory needed is 3.8MB.

[...]

> diff --git a/scripts/gen_ikh_data.sh b/scripts/gen_ikh_data.sh
> new file mode 100755
> index 000000000000..7329262bed2f
> --- /dev/null
> +++ b/scripts/gen_ikh_data.sh
> @@ -0,0 +1,76 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +spath="$(dirname "$(readlink -f "$0")")"
> +kroot="$spath/.."
> +outdir="$(pwd)"
> +tarfile=$1
> +cpio_dir=$outdir/$tarfile.tmp
> +
> +src_file_list=""
> +for f in $file_list; do

$file_list is not assigned here.

I applied the patches and I got an empty tar generated. Setting `file_list=$*`
fixed it for me - though not sure if this is the right fix to use. Last minute
change/cleanup accidently removed the line that assigns $file_list?

Cheers

--
Qais Yousef

> +	src_file_list="$src_file_list $(echo $f | grep -v OBJDIR)"
> +done
> +
> +obj_file_list=""
> +for f in $file_list; do
> +	f=$(echo $f | grep OBJDIR | sed -e 's/OBJDIR\///g')
> +	obj_file_list="$obj_file_list $f";
> +done
> +
> +# Support incremental builds by skipping archive generation
> +# if timestamps of files being archived are not changed.
> +
> +# This block is useful for debugging the incremental builds.
> +# Uncomment it for debugging.
> +# iter=1
> +# if [ ! -f /tmp/iter ]; then echo 1 > /tmp/iter;
> +# else; 	iter=$(($(cat /tmp/iter) + 1)); fi
> +# find $src_file_list -type f | xargs ls -lR > /tmp/src-ls-$iter
> +# find $obj_file_list -type f | xargs ls -lR > /tmp/obj-ls-$iter
> +
> +# modules.order and include/generated/compile.h are ignored because these are
> +# touched even when none of the source files changed. This causes pointless
> +# regeneration, so let us ignore them for md5 calculation.
> +pushd $kroot > /dev/null
> +src_files_md5="$(find $src_file_list -type f ! -name modules.order |
> +		grep -v "include/generated/compile.h"		   |
> +		xargs ls -lR | md5sum | cut -d ' ' -f1)"
> +popd > /dev/null
> +obj_files_md5="$(find $obj_file_list -type f ! -name modules.order |
> +		grep -v "include/generated/compile.h"		   |
> +		xargs ls -lR | md5sum | cut -d ' ' -f1)"
> +
> +if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
> +if [ -f kernel/kheaders.md5 ] &&
> +	[ "$(cat kernel/kheaders.md5|head -1)" == "$src_files_md5" ] &&
> +	[ "$(cat kernel/kheaders.md5|head -2|tail -1)" == "$obj_files_md5" ] &&
> +	[ "$(cat kernel/kheaders.md5|tail -1)" == "$tarfile_md5" ]; then
> +		exit
> +fi
> +
> +rm -rf $cpio_dir
> +mkdir $cpio_dir
> +
> +pushd $kroot > /dev/null
> +for f in $src_file_list;
> +	do find "$f" ! -name "*.c" ! -name "*.o" ! -name "*.cmd" ! -name ".*";
> +done | cpio --quiet -pd $cpio_dir
> +popd > /dev/null
> +
> +# The second CPIO can complain if files already exist which can
> +# happen with out of tree builds. Just silence CPIO for now.
> +for f in $obj_file_list;
> +	do find "$f" ! -name "*.c" ! -name "*.o" ! -name "*.cmd" ! -name ".*";
> +done | cpio --quiet -pd $cpio_dir >/dev/null 2>&1
> +
> +find  $cpio_dir -type f -print0 |
> +	xargs -0 -P8 -n1 -I {} sh -c "$spath/strip-comments.pl {}"
> +
> +tar -Jcf $tarfile -C $cpio_dir/ . > /dev/null
> +
> +echo "$src_files_md5" > kernel/kheaders.md5
> +echo "$obj_files_md5" >> kernel/kheaders.md5
> +echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
> +
> +rm -rf $cpio_dir
> diff --git a/scripts/strip-comments.pl b/scripts/strip-comments.pl
> new file mode 100755
> index 000000000000..f8ada87c5802
> --- /dev/null
> +++ b/scripts/strip-comments.pl
> @@ -0,0 +1,8 @@
> +#!/usr/bin/perl -pi
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# This script removes /**/ comments from a file, unless such comments
> +# contain "SPDX". It is used when building compressed in-kernel headers.
> +
> +BEGIN {undef $/;}
> +s/\/\*((?!SPDX).)*?\*\///smg;
> -- 
> 2.21.0.rc2.261.ga7da99ff1b-goog
