From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 22 Feb 2018 20:57:36 +0100
Subject: [PATCH] selftest: fix kselftest-merge depend on
 'RUNTIME_TESTING_MENU'
In-Reply-To: <20180222115307.15063-1-zongbox@gmail.com>
References: <20180222115307.15063-1-zongbox@gmail.com>
Message-ID: <CADYN=9KgBp0+iGDL8x774UUadyo54Za4ESLPk2GUfqFz+7W02Q@mail.gmail.com>

On 22 February 2018 at 12:53, Zong Li <zongbox at gmail.com> wrote:
> Since the 'commit d3deafaa8b5c ("lib/: make RUNTIME_TESTS a menuconfig
> to ease disabling it all")', the make kselftest-merge cannot merge the
> config dependencies of kselftest to the existing .config file.
>
> These config dependencies of kselftest need to enable the
> 'CONFIG_RUNTIME_TESTING_MENU=y' at the same time.

Is this patch needed when patch sha 'f29c79906064 ("lib/Kconfig.debug: enable
RUNTIME_TESTING_MENU")' find its way into the kernel ?
I think it's in linux-next now.

Cheers,
Anders

>
> Signed-off-by: Zong Li <zong at andestech.com>
> Cc: Greentime Hu <greentime at andestech.com>
> ---
>  tools/testing/selftests/bpf/config         | 1 +
>  tools/testing/selftests/firmware/config    | 1 +
>  tools/testing/selftests/kmod/config        | 1 +
>  tools/testing/selftests/lib/config         | 1 +
>  tools/testing/selftests/net/config         | 1 +
>  tools/testing/selftests/static_keys/config | 1 +
>  tools/testing/selftests/sysctl/config      | 1 +
>  tools/testing/selftests/user/config        | 1 +
>  8 files changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 983dd25d49f4..d93b82144b19 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -1,3 +1,4 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_BPF=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_NET_CLS_BPF=m
> diff --git a/tools/testing/selftests/firmware/config b/tools/testing/selftests/firmware/config
> index c8137f70e291..01d7445ef007 100644
> --- a/tools/testing/selftests/firmware/config
> +++ b/tools/testing/selftests/firmware/config
> @@ -1 +1,2 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_FIRMWARE=y
> diff --git a/tools/testing/selftests/kmod/config b/tools/testing/selftests/kmod/config
> index 259f4fd6b5e2..37070985e428 100644
> --- a/tools/testing/selftests/kmod/config
> +++ b/tools/testing/selftests/kmod/config
> @@ -1,3 +1,4 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_KMOD=m
>  CONFIG_TEST_LKM=m
>  CONFIG_XFS_FS=m
> diff --git a/tools/testing/selftests/lib/config b/tools/testing/selftests/lib/config
> index 126933bcc950..d1fe14c2c8cb 100644
> --- a/tools/testing/selftests/lib/config
> +++ b/tools/testing/selftests/lib/config
> @@ -1,3 +1,4 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_PRINTF=m
>  CONFIG_TEST_BITMAP=m
>  CONFIG_PRIME_NUMBERS=m
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index 7177bea1fdfa..847a99873128 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -1,3 +1,4 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_USER_NS=y
>  CONFIG_BPF_SYSCALL=y
>  CONFIG_TEST_BPF=m
> diff --git a/tools/testing/selftests/static_keys/config b/tools/testing/selftests/static_keys/config
> index d538fb774b96..732d17f6b9a1 100644
> --- a/tools/testing/selftests/static_keys/config
> +++ b/tools/testing/selftests/static_keys/config
> @@ -1 +1,2 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_STATIC_KEYS=m
> diff --git a/tools/testing/selftests/sysctl/config b/tools/testing/selftests/sysctl/config
> index 6ca14800d755..772ce8c3c0d9 100644
> --- a/tools/testing/selftests/sysctl/config
> +++ b/tools/testing/selftests/sysctl/config
> @@ -1 +1,2 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_SYSCTL=y
> diff --git a/tools/testing/selftests/user/config b/tools/testing/selftests/user/config
> index 784ed8416324..f9f491fa4ae8 100644
> --- a/tools/testing/selftests/user/config
> +++ b/tools/testing/selftests/user/config
> @@ -1 +1,2 @@
> +CONFIG_RUNTIME_TESTING_MENU=y
>  CONFIG_TEST_USER_COPY=m
> --
> 2.16.1
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
