From: joel at joelfernandes.org (Joel Fernandes)
Date: Wed, 3 Apr 2019 13:20:31 -0400
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAK7LNARcaVtgHvco-Q=E5jhOXduk=55g9AC7nFn2esFxnk9Naw@mail.gmail.com>
References: <20190211143600.15021-1-joel@joelfernandes.org>
 <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
 <20190325134947.GA187133@google.com>
 <20190327173103.GA205980@google.com>
 <CAK7LNARcaVtgHvco-Q=E5jhOXduk=55g9AC7nFn2esFxnk9Naw@mail.gmail.com>
Message-ID: <20190403172031.GA260189@google.com>

On Wed, Apr 03, 2019 at 04:48:37PM +0900, Masahiro Yamada wrote:
> On Thu, Mar 28, 2019 at 2:32 AM Joel Fernandes <joel at joelfernandes.org> wrote:
> >
> > On Mon, Mar 25, 2019 at 09:49:47AM -0400, Joel Fernandes wrote:
> > > On Thu, Feb 14, 2019 at 07:19:29PM -0800, Alexei Starovoitov wrote:
> > > > On Mon, Feb 11, 2019 at 09:35:59AM -0500, Joel Fernandes (Google) wrote:
> > > > > Introduce in-kernel headers and other artifacts which are made available
> > > > > as an archive through proc (/proc/kheaders.txz file). This archive makes
> > > > > it possible to build kernel modules, run eBPF programs, and other
> > > > > tracing programs that need to extend the kernel for tracing purposes
> > > > > without any dependency on the file system having headers and build
> > > > > artifacts.
> > > > >
> > > > > On Android and embedded systems, it is common to switch kernels but not
> > > > > have kernel headers available on the file system. Raw kernel headers
> > > > > also cannot be copied into the filesystem like they can be on other
> > > > > distros, due to licensing and other issues. There's no linux-headers
> > > > > package on Android. Further once a different kernel is booted, any
> > > > > headers stored on the file system will no longer be useful. By storing
> > > > > the headers as a compressed archive within the kernel, we can avoid these
> > > > > issues that have been a hindrance for a long time.
> > > >
> > > > The set looks good to me and since the main use case is building bpf progs
> > > > I can route it via bpf-next tree if there are no objections.
> > > > Masahiro, could you please ack it?
> > >
> > > FYI, Masahiro's comments were all address by v5:
> > > https://lore.kernel.org/patchwork/project/lkml/list/?series=387311
> > >
> > > I believe aren't more outstanding concerns. Could we consider it for v5.2?
> >
> > Just to highlight the problem, today I booted v5.0 on an emulated Android
> > device for some testing, that didn't have a set of prebuilt headers that we
> > have been packaging on well known kernels, to get around this issue. This
> > caused great pain and issues with what I was doing. I know me and many others
> > really want this. With this I can boot an emulated Android device with
> > IKCONFIG_PROC=y and run BCC with that that. Also I want to do the BCC side of
> > the development, but first want to know if we can merge this upstream.
> >
> > Masahiro, I believe due diligence has been done in solidifying it as posted
> > in the v5.  Anything else we need to do here? Are you with the patches?
> 
> 
> As you said, these updates are "cosmetic".
> Nobody is worried about (or interested in) them.
> Even if we miss something, they are fixable later.
> 
> I accept embedding headers in the kernel,
> but I do not like the part about external module build.
>  - kernel embeds build artifacts that depend on a
>    particular host-arch
>  - users do not know which compiler to use
> Perhaps, you may remember my concerns.
> https://lore.kernel.org/patchwork/patch/1046307/#1239501

Masahiro,
I think we already discussed this right. The compiler issue is a user-issue -
it is not a problem that has arisen because this patch. Anyone can build a
kernel module today without this patch - using a compiler that is different
from the running kernel. So I did not fully understand your concern. This
patch does not ship a compiler in the archive. The compiler is upto the user
based on user environment. They can already shoot themself in foot without
this patch.

Greg,
Would be great to get your thoughts here as well about Masami's concern.

Honestly, the "kernel module building artifacts" bit is a bonus with this
patch. The main thing we are adding or that we need is really the headers
(for BCC). I just thought shipping the kernel build artifacts would also be
awesome because people can now build kernel modules without needing a kernel
tree at all.

But I also want this stuff merged so if folks are really unhappy with the
module build artifacts and only want headers - then that's also fine with me
and I can yank them - that would also mean though that this work cannot be a
replacement for linux-headers package on distros, so that would be sad.

thanks!

- Joel

> 
> --
> Best Regards
> Masahiro Yamada
