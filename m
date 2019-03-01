From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Fri, 1 Mar 2019 15:25:05 +0900
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228144306.GA138215@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
Message-ID:
 <CAK7LNARTHJP=HzyBg_oBBL4whpxHXeijqk=zKLYpt=1GBLNGAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190301062505.Z2mHVlAu9LEzN3lRfURoKaXqG4rWm2DoFA1JbXUwYwo@z>

On Fri, Mar 1, 2019@12:06 AM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Thu, Feb 28, 2019@11:17:51AM +0900, Masahiro Yamada wrote:
> > Hi Joel,
> >
> >
> > On Thu, Feb 28, 2019 at 4:40 AM Joel Fernandes (Google)
> > <joel@joelfernandes.org> wrote:
> > >
> > > Introduce in-kernel headers and other artifacts which are made available
> > > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > > it possible to build kernel modules, run eBPF programs, and other
> > > tracing programs that need to extend the kernel for tracing purposes
> > > without any dependency on the file system having headers and build
> > > artifacts.
> > >
> > > On Android and embedded systems, it is common to switch kernels but not
> > > have kernel headers available on the file system. Raw kernel headers
> > > also cannot be copied into the filesystem like they can be on other
> > > distros, due to licensing and other issues. There's no linux-headers
> > > package on Android. Further once a different kernel is booted, any
> > > headers stored on the file system will no longer be useful. By storing
> > > the headers as a compressed archive within the kernel, we can avoid these
> > > issues that have been a hindrance for a long time.
> > >
> > > The feature is also buildable as a module just in case the user desires
> > > it not being part of the kernel image. This makes it possible to load
> > > and unload the headers on demand. A tracing program, or a kernel module
> > > builder can load the module, do its operations, and then unload the
> > > module to save kernel memory. The total memory needed is 3.8MB.
> > >
> > > The code to read the headers is based on /proc/config.gz code and uses
> > > the same technique to embed the headers.
> >
> >
> >
> > Please let me ask a question about the actual use-case.
> >
> >
> > To build embedded systems including Android,
> > I use an x86 build machine.
> >
> > In other words, I cross-compile vmlinux and in-tree modules.
> > So,
> >
> >   target-arch: arm64
> >   host-arch:   x86
> >
> >
> >
> > > To build a module, the below steps have been tested on an x86 machine:
> > > modprobe kheaders
> > > rm -rf $HOME/headers
> > > mkdir -p $HOME/headers
> > > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > > cd my-kernel-module
> > > make -C $HOME/headers M=$(pwd) modules
> > > rmmod kheaders
> >
> > I am guessing the user will run these commands
> > on the target system.
> > In other words, external modules are native-compiled.
> > So,
> >
> >   target-arch: arm64
> >   host-arch:   arm64
> >
> >
> > Is this correct?
> >
> >
> > If I understood the assumed use-case correctly,
> > kheaders.tar.xw will contain host-programs compiled for x86,
> > which will not work on the target system.
> >
>
> You are right, the above commands in the commit message work only if the
> host/target are same arch due to scripts.
>
> However we can build with arm64 device connected to a host, like this (which
> I tested):
>
> adb shell modprobe kheaders; adb pull /proc/kheaders.tar.xz
> rm -rf $HOME/headers; mkdir -p $HOME/headers
> tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> cd my-kernel-module
> make -C $HOME/headers M=$(pwd) ARCH=arm64 CROSS_COMPILE=aarch64- modules
> adb push test.ko /data/; adb shell rmmod kheaders
>
> The other way we can make this work is using x86 usermode emulation inside a
> chroot on the Android device which will make the earlier commands work. One
> thing to note is that Android also runs on x86 hardware so the commands in
> the commit message will work even for x86 Android targets already.
>
> Also note that this the "module building" part is really only one of the
> usecases. eBPF is another which needs the headers - and the headers are vast
> majority of the archive. Headers take 3.1MB out of 3.6MB of the archive on
> arm64 builds.
>
> How do you want to proceed here, should I mention these points in the commit
> message?



I do not request a re-spin just for a matter of commit log,
but this version produces an empty tarball.
So, you will have a chance to update the patch anyway.

In the next version, it would be nice to note that
"external modules must be built on the same host arch
as built vmlinux".




Let me ask one more question.

I guess this patch is motivated by
how difficult to convey kernel headers
from vendors to users.

In that situation, how will the user find
the right compiler to use for building external modules?




Greg KH said:

We don't ever support the system of loading a module built with anything
other than the _exact_ same compiler than the kernel was.


For the full context, see this:
https://lore.kernel.org/patchwork/patch/836247/#1031547


-- 
Best Regards
Masahiro Yamada
