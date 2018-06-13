From: daniel at iogearbox.net (Daniel Borkmann)
Date: Wed, 13 Jun 2018 02:08:49 +0200
Subject: [PATCH] selftests: bpf: config: add config fragments
In-Reply-To: <20180612110510.11731-1-anders.roxell@linaro.org>
References: <20180612110510.11731-1-anders.roxell@linaro.org>
Message-ID: <d6851756-ae3b-09ec-f487-1eeece6bd4c6@iogearbox.net>

On 06/12/2018 01:05 PM, Anders Roxell wrote:
> Tests test_tunnel.sh fails due to config fragments ins't enabled.
> 
> Fixes: 933a741e3b82 ("selftests/bpf: bpf tunnel test.")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
> 
> All tests passes except ip6gretap that still fails. I'm unsure why.
> Ideas?

William (Cc) might be able to help you out.

Applied the one below in the mean-time to bpf, thanks!

> Cheers,
> Anders
> 
>  tools/testing/selftests/bpf/config | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 1eefe211a4a8..7eb613ffef55 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -7,3 +7,13 @@ CONFIG_CGROUP_BPF=y
>  CONFIG_NETDEVSIM=m
>  CONFIG_NET_CLS_ACT=y
>  CONFIG_NET_SCH_INGRESS=y
> +CONFIG_NET_IPIP=y
> +CONFIG_IPV6=y
> +CONFIG_NET_IPGRE_DEMUX=y
> +CONFIG_NET_IPGRE=y
> +CONFIG_IPV6_GRE=y
> +CONFIG_CRYPTO_USER_API_HASH=m
> +CONFIG_CRYPTO_HMAC=m
> +CONFIG_CRYPTO_SHA256=m
> +CONFIG_VXLAN=y
> +CONFIG_GENEVE=y
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
