From: karim.yaghmour at opersys.com (Karim Yaghmour)
Date: Wed, 13 Feb 2019 17:50:10 -0500
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190211143600.15021-1-joel@joelfernandes.org>
References: <20190211143600.15021-1-joel@joelfernandes.org>
Message-ID: <c035159d-3a56-61d8-bad6-79401b25a227@opersys.com>


On 2/11/19 9:35 AM, Joel Fernandes (Google) wrote:
> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.txz file). This archive makes
> it possible to build kernel modules, run eBPF programs, and other
> tracing programs that need to extend the kernel for tracing purposes
> without any dependency on the file system having headers and build
> artifacts.
> 
> On Android and embedded systems, it is common to switch kernels but not
> have kernel headers available on the file system. Raw kernel headers
> also cannot be copied into the filesystem like they can be on other
> distros, due to licensing and other issues. There's no linux-headers
> package on Android. Further once a different kernel is booted, any
> headers stored on the file system will no longer be useful. By storing
> the headers as a compressed archive within the kernel, we can avoid these
> issues that have been a hindrance for a long time.
> 
> The feature is also buildable as a module just in case the user desires
> it not being part of the kernel image. This makes it possible to load
> and unload the headers on demand. A tracing program, or a kernel module
> builder can load the module, do its operations, and then unload the
> module to save kernel memory. The total memory needed is 3.8MB.
> 
> The code to read the headers is based on /proc/config.gz code and uses
> the same technique to embed the headers.
> 
> To build a module, the below steps have been tested on an x86 machine:
> modprobe kheaders
> rm -rf $HOME/headers
> mkdir -p $HOME/headers
> tar -xvf /proc/kheaders.txz -C $HOME/headers >/dev/null
> cd my-kernel-module
> make -C $HOME/headers M=$(pwd) modules
> rmmod kheaders
> 
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

Acked-by: Karim Yaghmour <karim.yaghmour at opersys.com>

> ---
> 
> Changes since v1:
> - removed IKH_EXTRA variable, not needed (Masahiro Yamada)
> - small fix ups to selftest
>     - added target to main Makefile etc
>     - added MODULE_LICENSE to test module
>     - made selftest more quiet
> 
> Changes since RFC:
> Both changes bring size down to 3.8MB:
> - use xz for compression
> - strip comments except SPDX lines
> - Call out the module name in Kconfig
> - Also added selftests in second patch to ensure headers are always
> working.
> 
>   Documentation/dontdiff    |  1 +
>   init/Kconfig              | 11 ++++++
>   kernel/.gitignore         |  2 ++
>   kernel/Makefile           | 27 ++++++++++++++
>   kernel/kheaders.c         | 74 +++++++++++++++++++++++++++++++++++++++
>   scripts/gen_ikh_data.sh   | 19 ++++++++++
>   scripts/strip-comments.pl |  8 +++++
>   7 files changed, 142 insertions(+)
>   create mode 100644 kernel/kheaders.c
>   create mode 100755 scripts/gen_ikh_data.sh
>   create mode 100755 scripts/strip-comments.pl

[snip]

-- 
Karim Yaghmour
CEO - Opersys inc. / www.opersys.com
http://twitter.com/karimyaghmour
