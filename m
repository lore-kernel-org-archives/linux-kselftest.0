From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Thu, 28 Feb 2019 11:17:51 +0900
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190227193748.132301-1-joel@joelfernandes.org>
References: <20190227193748.132301-1-joel@joelfernandes.org>
Message-ID:
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228021751.rNhtnM1pauOIoGOit5XWxx9lywf1JMqxN0gxXhXE8-s@z>

Hi Joel,


On Thu, Feb 28, 2019 at 4:40 AM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> Introduce in-kernel headers and other artifacts which are made available
> as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
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



Please let me ask a question about the actual use-case.


To build embedded systems including Android,
I use an x86 build machine.

In other words, I cross-compile vmlinux and in-tree modules.
So,

  target-arch: arm64
  host-arch:   x86



> To build a module, the below steps have been tested on an x86 machine:
> modprobe kheaders
> rm -rf $HOME/headers
> mkdir -p $HOME/headers
> tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> cd my-kernel-module
> make -C $HOME/headers M=$(pwd) modules
> rmmod kheaders

I am guessing the user will run these commands
on the target system.
In other words, external modules are native-compiled.
So,

  target-arch: arm64
  host-arch:   arm64


Is this correct?


If I understood the assumed use-case correctly,
kheaders.tar.xw will contain host-programs compiled for x86,
which will not work on the target system.




Masahiro




> Additional notes:
> (1)
> A limitation of module building with this is, since Module.symvers is
> not available in the archive due to a cyclic dependency with building of
> the archive into the kernel or module binaries, the modules built using
> the archive will not contain symbol versioning (modversion). This is
> usually not an issue since the idea of this patch is to build a kernel
> module on the fly and load it into the same kernel. An appropriate
> warning is already printed by the kernel to alert the user of modules
> not having modversions when built using the archive. For building with
> modversions, the user can use traditional header packages. For our
> tracing usecases, we build modules on the fly with this so it is not a
> concern.
>
> (2) I have left IKHD_ST and IKHD_ED markers as is to facilitate
> future patches that would extract the headers from a kernel or module
> image.
>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---



--
Best Regards
Masahiro Yamada
