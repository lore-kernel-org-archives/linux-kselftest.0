From: joel at joelfernandes.org (Joel Fernandes)
Date: Thu, 28 Feb 2019 14:10:36 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228135343.23kzkilig3bsioov@e107158-lin.cambridge.arm.com>
 <20190228144759.GA156098@google.com>
 <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
Message-ID: <20190228191036.GA203889@google.com>

On Thu, Feb 28, 2019 at 05:04:59PM +0100, Dietmar Eggemann wrote:
[...]                      ^
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

I'm glad mainline fixed your issue though as you said in the other thread ;-)
I will refer to your email here later when doing backports if I hit the issue.

> Another point which supports the functionality your patch provides is the
> fact that maintainers don't want to see new TRACE_EVENTs in their code. So
> here your patch comes handy when using ebpf for tracing in embedded
> environments.

Yes, I agree. One can also use the series to build custom kernel modules
which can also contain tracepoints in their own right. Glad you also find it
useful. I will CC you on it for next spin.

thanks,

 - Joel
