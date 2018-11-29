From: pabeni@redhat.com (Paolo Abeni)
Date: Thu, 29 Nov 2018 10:49:48 +0100
Subject: [PATCH] selftests/bpf: add config fragment CONFIG_NF_NAT_IPV6
In-Reply-To: <1543483911-8955-1-git-send-email-naresh.kamboju@linaro.org>
References: <1543483911-8955-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <5f85281ce4d4e324d73500db2b55a8a7048a8e67.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181129094948.Rq69ajZnm6Ax7MnDoG4Hax_YWmnkcSBZgWK3txuHPNk@z>

Hi,

On Thu, 2018-11-29@15:01 +0530, Naresh Kamboju wrote:
> CONFIG_NF_NAT_IPV6=y is required for bpf test_sockmap test case
> Fixes,
> ip6tables v1.6.1: can't initialize ip6tables table `nat': Table does
> not exist
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/bpf/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 37f947ec44ed..d7076cf04a9d 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -23,3 +23,4 @@ CONFIG_LWTUNNEL=y
>  CONFIG_BPF_STREAM_PARSER=y
>  CONFIG_XDP_SOCKETS=y
>  CONFIG_FTRACE_SYSCALLS=y
> +CONFIG_NF_NAT_IPV6=y

AFAIK, the selftest Kconfig infra does not pull dependant CONFIG items 
('depends on '...) automatically: if the bpf test_sockmap test needs
CONFIG_NF_NAT_IPV6, you should also include non trivial chain of deps
up to whatever is currently explicitly requested.

On the other side, the self-tests already pull CONFIG_NF_NAT_IPV6=m for
'net' related tests, so if you run:

make kselftest-merge

before compiling the kernel for self-tests (which is AFAIK a mandatory
step) you should not get the reported error. Did you performed the
above step?

Cheers,

Paolo
