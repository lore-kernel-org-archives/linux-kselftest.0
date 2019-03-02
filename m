From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 1 Mar 2019 21:39:40 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNAShVt=zOPP1TUuBbR_H8kmc+zuLAyRXucjMMKrALkW_6A@mail.gmail.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
 <CAK7LNARTHJP=HzyBg_oBBL4whpxHXeijqk=zKLYpt=1GBLNGAA@mail.gmail.com>
 <20190301171954.GA217990@google.com>
 <CAK7LNAShVt=zOPP1TUuBbR_H8kmc+zuLAyRXucjMMKrALkW_6A@mail.gmail.com>
Message-ID: <20190302023940.GA55262@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190302023940.QQ9319wGgU-y8zYALsB0QzUsO5IGLPJJhOYCdSCN_VU@z>

On Sat, Mar 02, 2019@11:13:07AM +0900, Masahiro Yamada wrote:
> On Sat, Mar 2, 2019@3:03 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > On Fri, Mar 01, 2019@03:25:05PM +0900, Masahiro Yamada wrote:
> > [...]
> > > > > I am guessing the user will run these commands
> > > > > on the target system.
> > > > > In other words, external modules are native-compiled.
> > > > > So,
> > > > >
> > > > >   target-arch: arm64
> > > > >   host-arch:   arm64
> > > > >
> > > > >
> > > > > Is this correct?
> > > > >
> > > > >
> > > > > If I understood the assumed use-case correctly,
> > > > > kheaders.tar.xw will contain host-programs compiled for x86,
> > > > > which will not work on the target system.
> > > > >
> > > >
> > > > You are right, the above commands in the commit message work only if the
> > > > host/target are same arch due to scripts.
> > > >
> > > > However we can build with arm64 device connected to a host, like this (which
> > > > I tested):
> > > >
> > > > adb shell modprobe kheaders; adb pull /proc/kheaders.tar.xz
> > > > rm -rf $HOME/headers; mkdir -p $HOME/headers
> > > > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > > > cd my-kernel-module
> > > > make -C $HOME/headers M=$(pwd) ARCH=arm64 CROSS_COMPILE=aarch64- modules
> > > > adb push test.ko /data/; adb shell rmmod kheaders
> > > >
> > > > The other way we can make this work is using x86 usermode emulation inside a
> > > > chroot on the Android device which will make the earlier commands work. One
> > > > thing to note is that Android also runs on x86 hardware so the commands in
> > > > the commit message will work even for x86 Android targets already.
> > > >
> > > > Also note that this the "module building" part is really only one of the
> > > > usecases. eBPF is another which needs the headers - and the headers are vast
> > > > majority of the archive. Headers take 3.1MB out of 3.6MB of the archive on
> > > > arm64 builds.
> > > >
> > > > How do you want to proceed here, should I mention these points in the commit
> > > > message?
> > >
> > >
> > >
> > > I do not request a re-spin just for a matter of commit log,
> > > but this version produces an empty tarball.
> > > So, you will have a chance to update the patch anyway.
> > >
> > > In the next version, it would be nice to note that
> > > "external modules must be built on the same host arch
> > > as built vmlinux".
> >
> > Ok, I respun it with 1 more minor nit for arm64 building. Please take a look.
> 
> 
> I have not checked code-diff in v3 yet.
> 
> Anyway, I will add comments to v4
> if I notice something.

Ok. Since all your comments from previous series were addressed, it would be
nice to get your Acked-by tag for v4 unless you have further comments or
concerns.

> > > Let me ask one more question.
> > >
> > > I guess this patch is motivated by
> > > how difficult to convey kernel headers
> > > from vendors to users.
> > >
> > > In that situation, how will the user find
> > > the right compiler to use for building external modules?
> > >
> > >
> > >
> > >
> > > Greg KH said:
> > >
> > > We don't ever support the system of loading a module built with anything
> > > other than the _exact_ same compiler than the kernel was.
> > >
> > >
> > > For the full context, see this:
> > > https://lore.kernel.org/patchwork/patch/836247/#1031547
> >
> > IMO this issue is not related to this patch but is just an issue with
> > building external modules in general.
> 
> 
> I do not think it is an issue of the build system, at least.
> 
> As far as I understood Greg's comment, it is troublesome
> without the assumption that vmlinux and modules are built
> by the same compiler.
> It is related to this patch since this patch assumes use-cases
> where external modules are built in a completely different environment,
> where a different compiler is probably installed.

Yes, but what I'm trying to say is the same issue exists with all other
solutions today that do this. Such as debian you have linux-headers package.
A user could totally use the build artifacts obtained from somewhere to build
a kernel module with a completely different compiler. That issue has just to
do with the reality, and isn't an issue caused by any one solution such as
this one.  I agree care must be taken whenever user is building external
kernel modules independent of kernel sources.  Did I miss something else?

thanks a lot,

 - Joel
