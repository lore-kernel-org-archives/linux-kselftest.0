From: qais.yousef@arm.com (Qais Yousef)
Date: Thu, 28 Feb 2019 16:48:01 +0000
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228135343.23kzkilig3bsioov@e107158-lin.cambridge.arm.com>
 <20190228144759.GA156098@google.com>
 <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
Message-ID: <20190228164801.iahwphx5o2zeks4n@e107158-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228164801.zxAKXbNing8-LfsGmfgOcRfucPyuSet368Wlg-guROM@z>

On 02/28/19 17:04, Dietmar Eggemann wrote:
> Hi Joel,
> 
> On 2/28/19 3:47 PM, Joel Fernandes wrote:
> > On Thu, Feb 28, 2019@01:53:43PM +0000, Qais Yousef wrote:
> > > Hi Joel
> > > 
> > > On 02/27/19 14:37, Joel Fernandes (Google) wrote:
> 
> [...]
> 
> > Ah good catch, I made this change for "file_list=${@:2}" in my tree but
> > forgot to push it. Below is the updated patch. Sorry and I'll refresh the
> > series with the change after we finish the discussion in the other thread.
> > Meanwhile the updated patch is as follows...
> > 
> > ---8<-----------------------
> > 
> > From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> > Subject: [PATCH v3.1] Provide in-kernel headers for making it easy to extend the kernel
> > 
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
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
> 
> This version gives me the header files on a v5.0-rc8 kernel on my arm64 box
> but does not compile anymore on v4.20:
> 
> kernel/kheaders.c:25:22: error: expected identifier or ‘(’ before string
> constant
>  #define KH_MAGIC_END "IKHD_ED"
>                       ^
> kernel/kheaders_data.h:1:1: note: in expansion of macro ‘KH_MAGIC_END’
>  KH_MAGIC_END;
>  ^~~~~~~~~~~~
> kernel/kheaders.c: In function ‘ikheaders_read_current’:
> kernel/kheaders.c:38:12: error: ‘kernel_headers_data’ undeclared (first use
> in this function); did you mean ‘kernel_headers_data_size’?
>             kernel_headers_data + KH_MAGIC_SIZE,
>             ^~~~~~~~~~~~~~~~~~~
>             kernel_headers_data_size
> kernel/kheaders.c:38:12: note: each undeclared identifier is reported only
> once for each function it appears in
> kernel/kheaders.c: In function ‘ikheaders_init’:
> kernel/kheaders.c:31:10: error: ‘kernel_headers_data’ undeclared (first use
> in this function); did you mean ‘kernel_headers_data_size’?
>   (sizeof(kernel_headers_data) - 1 - KH_MAGIC_SIZE * 2)
>           ^
> kernel/kheaders.c:57:23: note: in expansion of macro
> ‘kernel_headers_data_size’
>   proc_set_size(entry, kernel_headers_data_size);
>                        ^~~~~~~~~~~~~~~~~~~~~~~~
> kernel/kheaders.c: In function ‘ikheaders_read_current’:
> kernel/kheaders.c:40:1: warning: control reaches end of non-void function
> [-Wreturn-type]
>  }
> 
> 
> The reason for me to stay on v4.20 is that with v5.0-rc8 I don't have ebpf
> 'raw tracepoint' support any more on my arm64 board. But this issue is not
> related to your patch though.

And this is caused by a38d1107f937 (bpf: support raw tracepoints in modules)
which renamed bpf_find_raw_tracepoint() which bcc-tools relies on to detect if
raw tracepoints are supported..

https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py#L860

Speaking of fragile depedencies :-)

I guess the check can be extended to check for both symbols - but it'll stay
fragile. Not sure if they can do better.

I filed a bug

https://github.com/iovisor/bcc/issues/2240

--
Qais Yousef

> 
> Another point which supports the functionality your patch provides is the
> fact that maintainers don't want to see new TRACE_EVENTs in their code. So
> here your patch comes handy when using ebpf for tracing in embedded
> environments.
