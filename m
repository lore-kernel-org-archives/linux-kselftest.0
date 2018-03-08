From: dsahern at gmail.com (David Ahern)
Date: Thu, 8 Mar 2018 10:59:21 -0700
Subject: [PATCH] selftests/net: enable fragments for fib-onlink-tests
In-Reply-To: <20180308101723.19721-1-anders.roxell@linaro.org>
References: <20180308101723.19721-1-anders.roxell@linaro.org>
Message-ID: <4ee15d22-86d6-7e9e-4820-536cb38c9027@gmail.com>

On 3/8/18 3:17 AM, Anders Roxell wrote:
> We miss CONFIG_* fragments so test fib-onlink-tests.sh can do:
> ip li add lisa type vrf table 1101
> ip li add veth1 type veth peer name veth2
> 
> And the follow message occurs if it isn't enabled:
> Configuring interfaces
> RTNETLINK answers: Operation not supported
> 
> This enables for NET_NRF (and friends) and VETH so we can create a vrf
> table and veth.
> 
> Fixes: 153e1b84f477 ("selftests: Add FIB onlink tests")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/net/config | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index 7177bea1fdfa..6a75a3ea44ad 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -2,3 +2,8 @@ CONFIG_USER_NS=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_TEST_BPF=m
>  CONFIG_NUMA=y
> +CONFIG_NET_VRF=y
> +CONFIG_NET_L3_MASTER_DEV=y
> +CONFIG_IPV6=y
> +CONFIG_IPV6_MULTIPLE_TABLES=y
> +CONFIG_VETH=y
> 

Thanks for updating the config.

The recent pmtu test needs quite a bit of additional configs as well.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
