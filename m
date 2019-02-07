From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 7 Feb 2019 17:52:39 -0500
Subject: [PATCH 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190207211102.154634-1-joel@joelfernandes.org>
References: <20190207211102.154634-1-joel@joelfernandes.org>
Message-ID: <20190207175239.0607f5eb@gandalf.local.home>

On Thu,  7 Feb 2019 16:11:01 -0500
"Joel Fernandes (Google)" <joel at joelfernandes.org> wrote:

> +
> +# Build a list of in-kernel headers for building kernel modules
> +# Any other files will be stored in IKH_EXTRA variable.
> +ikh_file_list := include/
> +ikh_file_list += arch/$(ARCH)/Makefile
> +ikh_file_list += arch/$(ARCH)/include/
> +ikh_file_list += $(IKH_EXTRA)
> +ikh_file_list += scripts/
> +ikh_file_list += Makefile
> +ikh_file_list += Module.symvers
> +ifeq ($(CONFIG_STACK_VALIDATION), y)
> +ikh_file_list += $(objtree)/tools/objtool/objtool
> +endif
> +
> +$(obj)/kheaders.o: $(obj)/kheaders_data.h
> +
> +targets += kheaders_data.txz
> +
> +quiet_cmd_genikh = GEN     $(obj)/kheaders_data.txz
> +cmd_genikh = $(srctree)/scripts/gen_ikh_data.sh $@ $^ >/dev/null 2>&1
> +$(obj)/kheaders_data.txz: $(ikh_file_list) FORCE
> +	$(call cmd,genikh)
> +
> +filechk_ikheadersxz = (echo "static const char kernel_headers_data[] __used = KH_MAGIC_START"; cat $< | scripts/bin2c; echo "KH_MAGIC_END;")
> +
> +targets += kheaders_data.h
> +$(obj)/kheaders_data.h: $(obj)/kheaders_data.txz FORCE
> +	$(call filechk,ikheadersxz)
> diff --git a/scripts/gen_ikh_data.sh b/scripts/gen_ikh_data.sh
> new file mode 100755
> index 000000000000..609196b5cea2
> --- /dev/null
> +++ b/scripts/gen_ikh_data.sh
> @@ -0,0 +1,19 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +spath="$(dirname "$(readlink -f "$0")")"
> +
> +rm -rf $1.tmp
> +mkdir $1.tmp
> +
> +for f in "${@:2}";
> +	do find "$f" ! -name "*.c" ! -name "*.o" ! -name "*.cmd" ! -name ".*";

I wonder if it is a good idea to pick all files in the directories
defined in ikh_file_list, and not just explicitly list what we want,
with a '*.h' and such?


> +done | cpio -pd $1.tmp
> +
> +for f in $(find $1.tmp); do
> +	$spath/strip-comments.pl $f
> +done
> +
> +tar -Jcf $1 -C $1.tmp/ . > /dev/null
> +
> +rm -rf $1.tmp
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

Hmm, I'm also wondering if we could us the C pre-processor for the
stripping of everything from the header file. We would then even get
the header files only having what is necessary for the running kernel.

-- Steve
