From: daniel.diaz at linaro.org (=?UTF-8?Q?Daniel_D=c3=adaz?=)
Date: Wed, 21 Feb 2018 15:37:13 -0600
Subject: [PATCH] selftests/bpf: update gitignore with test_libbpf_open
In-Reply-To: <20180221213001.18682-1-anders.roxell@linaro.org>
References: <20180221213001.18682-1-anders.roxell@linaro.org>
Message-ID: <537755db-cf7b-950d-6f30-871b3b412411@linaro.org>

On 02/21/2018 03:30 PM, Anders Roxell wrote:
> bpf builds a test program for loading BPF ELF files. Add the executable
> to the .gitignore list.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Tested-by: Daniel Díaz <daniel.diaz at linaro.org>

> ---
>  tools/testing/selftests/bpf/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
> index cc15af2e54fe..9cf83f895d98 100644
> --- a/tools/testing/selftests/bpf/.gitignore
> +++ b/tools/testing/selftests/bpf/.gitignore
> @@ -11,3 +11,4 @@ test_progs
>  test_tcpbpf_user
>  test_verifier_log
>  feature
> +test_libbpf_open
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
