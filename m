From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 8 May 2018 10:22:17 +0200
Subject: [PATCH] selftests: kvm: update .gitignore with missing file
In-Reply-To: <20180423135725.3753-1-anders.roxell@linaro.org>
References: <20180423135725.3753-1-anders.roxell@linaro.org>
Message-ID: <CADYN=9KPSYmrAA_N-J-OLvn2+B1_hU5KK24-Q1V66j3cCmkNTw@mail.gmail.com>

On 23 April 2018 at 15:57, Anders Roxell <anders.roxell at linaro.org> wrote:
> Fixes: d5edb7f8e7ab ("kvm: selftests: add vmx_tsc_adjust_test")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/kvm/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index a546e052d19a..63fc1ab9248f 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -1,2 +1,3 @@
>  set_sregs_test
>  sync_regs_test
> +vmx_tsc_adjust_test
> --
> 2.17.0
>

ping.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
