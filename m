From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 28 Feb 2019 18:27:51 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228144306.GA138215@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
Message-ID: <20190228232751.GA218988@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228232751.Oy2gwy0L58ldi5tNC3BFe3MLku5Ybwy-jAzv1kDMEJI@z>

On Thu, Feb 28, 2019@09:43:06AM -0500, Joel Fernandes wrote:
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
> The other way we can make this work is using x86 usermode emulation inside a
> chroot on the Android device which will make the earlier commands work.

I verified the steps to build a module on my Pixel 3 (arm64) with Linux
kernel for arm64 compiled on my x86 host:

After building the headers, the steps were something like:

1.Build an x86 debian image with cross-gcc:

sudo qemu-debootstrap --arch amd64
  --include=make,gcc,gcc-aarch64-linux-gnu,perl,libelf1,python
  --variant=minbase $DIST $RUN_DIR http://ftp.us.debian.org/debian

2. Push qemu-x86_64-static (which I downloaded from the web) onto the device.

3. Tell binfmt_misc about qemu:
echo
':qemu-x86_64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x3e\x00:
\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/qemu-x86_64-static:OC'
> /proc/sys/fs/binfmt_misc/register

4. adb shell and then chroot into the image

5. follow all the steps in the commit message but set ARCH and CROSS_COMPILE
appropriately.

After Make, kernel module is cooked and ready :)

thanks,

 - Joel
