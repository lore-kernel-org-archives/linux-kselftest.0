From: guro at fb.com (Roman Gushchin)
Date: Mon, 11 Dec 2017 19:41:19 +0000
Subject: [Linux-kselftest-mirror] [PATCH] selftests: bpf: Adding config
 fragment CONFIG_CGROUP_BPF=y
In-Reply-To: <1513020323-29591-1-git-send-email-naresh.kamboju@linaro.org>
References: <1513020323-29591-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <20171211194113.GA1649@castle.DHCP.thefacebook.com>

Hi Naresh,

Looks good!

Thanks!

On Tue, Dec 12, 2017 at 12:55:23AM +0530, Naresh Kamboju wrote:
> CONFIG_CGROUP_BPF=y is required for test_dev_cgroup test case.
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/bpf/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 52d53ed..9d48973 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -3,3 +3,4 @@ CONFIG_BPF_SYSCALL=y
>  CONFIG_NET_CLS_BPF=m
>  CONFIG_BPF_EVENTS=y
>  CONFIG_TEST_BPF=m
> +CONFIG_CGROUP_BPF=y
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
