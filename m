From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 14 Feb 2019 22:47:20 -0500
Subject: [PATCH v2 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
References: <20190211143600.15021-1-joel@joelfernandes.org>
 <20190215031926.ljzluy2cfxp64u6o@ast-mbp>
Message-ID: <20190215034720.GA230433@google.com>

On Thu, Feb 14, 2019 at 07:19:29PM -0800, Alexei Starovoitov wrote:
> On Mon, Feb 11, 2019 at 09:35:59AM -0500, Joel Fernandes (Google) wrote:
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
> 
> The set looks good to me and since the main use case is building bpf progs
> I can route it via bpf-next tree if there are no objections.
> Masahiro, could you please ack it?
> 

Yes, eBPF is one of the usecases. After this, I am also planning to send
patches to BCC so that it can use this feature when compiling C to eBPF.

Thanks!

 - Joel
