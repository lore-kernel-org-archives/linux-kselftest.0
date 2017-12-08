From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 8 Dec 2017 17:29:48 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: net: Adding config
 fragment CONFIG_CGROUP_BPF=y
In-Reply-To: <1512674639-13764-1-git-send-email-naresh.kamboju@linaro.org>
References: <1512674639-13764-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <4cbe87de-c43e-30ae-b728-c44a83eaedbd@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171208162948.UK9Bb-WNWuMeEX8xPPpCIDivTjfT-G7nUJ4X3rT6jWA@z>

On 12/07/2017 08:23 PM, Naresh Kamboju wrote:
> CONFIG_CGROUP_BPF=y is required for test_dev_cgroup test case.
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/net/config | 1 +

Did you mean to add this to tools/testing/selftests/bpf/config instead?

test_dev_cgroup is under bpf selftests. Please respin for the correct
test suite.

>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index e57b4ac..02301c6 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -1,3 +1,4 @@
>  CONFIG_USER_NS=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_TEST_BPF=m
> +CONFIG_CGROUP_BPF=y
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
