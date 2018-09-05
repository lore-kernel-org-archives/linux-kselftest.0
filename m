From: shuah at kernel.org (Shuah Khan)
Date: Wed, 5 Sep 2018 10:57:27 -0600
Subject: [PATCH] selftests: memory-hotplug: add required configs
In-Reply-To: <1536141435-10097-1-git-send-email-Lei.Yang@windriver.com>
References: <1536141435-10097-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <18c9ce53-a2e8-1522-24ca-7289c028d767@kernel.org>

On 09/05/2018 03:57 AM, Lei Yang wrote:
> add CONFIG_MEMORY_HOTREMOVE=y in config
> without this config, /sys/devices/system/memory/memory*/removable
> always return 0, I endup getting an early skip during test
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/memory-hotplug/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/memory-hotplug/config b/tools/testing/selftests/memory-hotplug/config
> index 2fde301..a7e8cd5 100644
> --- a/tools/testing/selftests/memory-hotplug/config
> +++ b/tools/testing/selftests/memory-hotplug/config
> @@ -2,3 +2,4 @@ CONFIG_MEMORY_HOTPLUG=y
>  CONFIG_MEMORY_HOTPLUG_SPARSE=y
>  CONFIG_NOTIFIER_ERROR_INJECTION=y
>  CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
> +CONFIG_MEMORY_HOTREMOVE=y
> 

Thanks. Applied to linux-kselftest next

-- Shuah
