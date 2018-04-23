From: daniel@iogearbox.net (Daniel Borkmann)
Date: Mon, 23 Apr 2018 23:34:39 +0200
Subject: [PATCH] selftests: bpf: update .gitignore with missing file
In-Reply-To: <20180423135057.951-1-anders.roxell@linaro.org>
References: <20180423135057.951-1-anders.roxell@linaro.org>
Message-ID: <5ea150a6-8af1-3aa8-7ff0-5fdb64054bab@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180423213439.HiUTsK_Ty2_9b9USvTR8HMI9f5RC6-eoXU97w8HPCaM@z>

On 04/23/2018 03:50 PM, Anders Roxell wrote:
> Fixes: c0fa1b6c3efc ("bpf: btf: Add BTF tests")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/bpf/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
> index 5e1ab2f0eb79..3e3b3ced3f7c 100644
> --- a/tools/testing/selftests/bpf/.gitignore
> +++ b/tools/testing/selftests/bpf/.gitignore
> @@ -15,3 +15,4 @@ test_libbpf_open
>  test_sock
>  test_sock_addr
>  urandom_read
> +test_btf

Against which tree is this? This doesn't apply to bpf-next. It would
apply against bpf tree, but c0fa1b6c3efc ("bpf: btf: Add BTF tests")
is part of bpf-next, so fits to neither of them.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
