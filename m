From: yhs@fb.com (Yonghong Song)
Date: Tue, 27 Nov 2018 18:00:02 +0000
Subject: [PATCH] selftests/bpf: add config fragment CONFIG_FTRACE_SYSCALLS
In-Reply-To: <1543332284-15694-1-git-send-email-naresh.kamboju@linaro.org>
References: <1543332284-15694-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <b8f390b1-6dd4-a437-f996-bee11617d1c0@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181127180002.JLRdGJN-iEeAMoBD5hTngvi39NEbcAGoHGGjHs1r4PE@z>



On 11/27/18 7:24 AM, Naresh Kamboju wrote:
> CONFIG_FTRACE_SYSCALLS=y is required for get_cgroup_id_user test case
> this test reads a file from debug trace path
> /sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>

Acked-by: Yonghong Song <yhs at fb.com>

> ---
>   tools/testing/selftests/bpf/config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 7f90d3645af8..37f947ec44ed 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -22,3 +22,4 @@ CONFIG_NET_CLS_FLOWER=m
>   CONFIG_LWTUNNEL=y
>   CONFIG_BPF_STREAM_PARSER=y
>   CONFIG_XDP_SOCKETS=y
> +CONFIG_FTRACE_SYSCALLS=y
> 
