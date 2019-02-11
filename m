From: joel@joelfernandes.org (Joel Fernandes)
Date: Mon, 11 Feb 2019 09:37:32 -0500
Subject: [PATCH 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNAREaZdc6=SgR215j25+By3upKe11EpRFZFC-fYAFa5roQ@mail.gmail.com>
References: <20190207211102.154634-1-joel@joelfernandes.org>
 <CAK7LNAREaZdc6=SgR215j25+By3upKe11EpRFZFC-fYAFa5roQ@mail.gmail.com>
Message-ID: <20190211143732.GA210318@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190211143732.XbrZUPYF08UGi13qlnjP46MCf2zrgwlGWZQTIsjIqwI@z>

On Mon, Feb 11, 2019@10:39:43AM +0900, Masahiro Yamada wrote:
> On Fri, Feb 8, 2019 at 6:13 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.txz file). This archive makes
> > it possible to build kernel modules, run eBPF programs, and other
> > tracing programs that need to extend the kernel for tracing purposes
> > without any dependency on the file system having headers and build
> > artifacts.
> >
> > On Android and embedded systems, it is common to switch kernels but not
> > have kernel headers available on the file system. Raw kernel headers
> > also cannot be copied into the filesystem like they can be on other
> > distros, due to licensing and other issues. There's no linux-headers
> > package on Android. Further once a different kernel is booted, any
> > headers stored on the file system will no longer be useful. By storing
> > the headers as a compressed archive within the kernel, we can avoid these
> > issues that have been a hindrance for a long time.
> >
> > The feature is also buildable as a module just in case the user desires
> > it not being part of the kernel image. This makes it possible to load
> > and unload the headers on demand. A tracing program, or a kernel module
> > builder can load the module, do its operations, and then unload the
> > module to save kernel memory. The total memory needed is 3.8MB.
> >
> > The code to read the headers is based on /proc/config.gz code and uses
> > the same technique to embed the headers.
> >
> > To build a module, the below steps have been tested on an x86 machine:
> > modprobe kheaders
> > rm -rf $HOME/headers
> > mkdir -p $HOME/headers
> > tar -xvf /proc/kheaders.txz -C $HOME/headers >/dev/null
> > cd my-kernel-module
> > make -C $HOME/headers M=$(pwd) modules
> > rmmod kheaders
> >
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > ---
> > Changes since RFC:
> > Both changes bring size down to 3.8MB:
> > - use xz for compression
> > - strip comments except SPDX lines
> > - Call out the module name in Kconfig
> > - Also added selftests in second patch to ensure headers are always
> > working.
> >
> >  Documentation/dontdiff    |  1 +
> >  arch/x86/Makefile         |  2 ++
> >  init/Kconfig              | 11 ++++++
> >  kernel/.gitignore         |  2 ++
> >  kernel/Makefile           | 29 +++++++++++++++
> >  kernel/kheaders.c         | 74 +++++++++++++++++++++++++++++++++++++++
> >  scripts/gen_ikh_data.sh   | 19 ++++++++++
> >  scripts/strip-comments.pl |  8 +++++
> >  8 files changed, 146 insertions(+)
> >  create mode 100644 kernel/kheaders.c
> >  create mode 100755 scripts/gen_ikh_data.sh
> >  create mode 100755 scripts/strip-comments.pl
> >
> > diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> > index 2228fcc8e29f..05a2319ee2a2 100644
> > --- a/Documentation/dontdiff
> > +++ b/Documentation/dontdiff
> > @@ -151,6 +151,7 @@ int8.c
> >  kallsyms
> >  kconfig
> >  keywords.c
> > +kheaders_data.h*
> >  ksym.c*
> >  ksym.h*
> >  kxgettext
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 88398fdf8129..ad176d669da4 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -240,6 +240,8 @@ archmacros:
> >  ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
> >  export ASM_MACRO_FLAGS
> >  KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
> > +IKH_EXTRA += arch/x86/kernel/macros.s
> > +export IKH_EXTRA
> 
> 
> This does not exist in any of released kernels.
> 
> See commit 6ac389346e6

Ok, thanks fixed it in v2 which I just sent and rebased on linus master branch. 

- Joel
