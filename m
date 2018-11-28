From: daniel@iogearbox.net (Daniel Borkmann)
Date: Wed, 28 Nov 2018 22:14:07 +0100
Subject: [PATCH] selftests/bpf: add config fragment CONFIG_FTRACE_SYSCALLS
In-Reply-To: <1543332284-15694-1-git-send-email-naresh.kamboju@linaro.org>
References: <1543332284-15694-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <1522472d-f8de-ffab-ffa1-eed2d74fb2a4@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181128211407.IxybMnT2QOkgK5GHjJOsRrTNzfm0IVjH1rSbyExImE0@z>

On 11/27/2018 04:24 PM, Naresh Kamboju wrote:
> CONFIG_FTRACE_SYSCALLS=y is required for get_cgroup_id_user test case
> this test reads a file from debug trace path
> /sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/bpf/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 7f90d3645af8..37f947ec44ed 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -22,3 +22,4 @@ CONFIG_NET_CLS_FLOWER=m
>  CONFIG_LWTUNNEL=y
>  CONFIG_BPF_STREAM_PARSER=y
>  CONFIG_XDP_SOCKETS=y
> +CONFIG_FTRACE_SYSCALLS=y
> 

Applied to bpf-next, thanks!
