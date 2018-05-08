From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 8 May 2018 10:21:14 +0200
Subject: [PATCH] selftests: kvm: add .gitignore for generated files
In-Reply-To: <20180410134822.23990-1-anders.roxell@linaro.org>
References: <20180410134822.23990-1-anders.roxell@linaro.org>
Message-ID:
 <CADYN=9L-CBLjG=mtOOfzBC4EZt02idZKgnrj5bSvsfPVSFZpsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508082114.xasH0bg5fIrhCNtvPsYbIHKTPZ8j2ZrfFyTZdqPozxM@z>

On 10 April 2018@15:48, Anders Roxell <anders.roxell@linaro.org> wrote:
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/kvm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/.gitignore
>
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> new file mode 100644
> index 000000000000..a546e052d19a
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -0,0 +1,2 @@
> +set_sregs_test
> +sync_regs_test
> --
> 2.16.3
>

ping.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
