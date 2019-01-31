From: anders.roxell@linaro.org (Anders Roxell)
Date: Thu, 31 Jan 2019 20:09:01 +0100
Subject: [PATCH] selftests/kvm: add missing executables to .gitignore
In-Reply-To: <20190108092654.13113-1-anders.roxell@linaro.org>
References: <20190108092654.13113-1-anders.roxell@linaro.org>
Message-ID:
 <CADYN=9LXeLv=cxJSJmWLybHqDhDx=nG3arfc32cjwB42iSb7vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190131190901.GCV00dsR3UqCqEkNpO0qQa-DXuhPz8y0mpyzwtRYcYo@z>

On Tue, 8 Jan 2019@10:27, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Fixes: 2a31b9db1535 ("kvm: introduce manual dirty log reprotect")
> Fixes: 7edcb7343327 ("KVM: selftests: Add hyperv_cpuid test")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/kvm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 6210ba41c29e..51ffd8a8bc38 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -1,8 +1,10 @@
>  /x86_64/cr4_cpuid_sync_test
>  /x86_64/evmcs_test
> +/x86_64/hyperv_cpuid
>  /x86_64/platform_info_test
>  /x86_64/set_sregs_test
>  /x86_64/sync_regs_test
>  /x86_64/vmx_tsc_adjust_test
>  /x86_64/state_test
> +/clear_dirty_log_test
>  /dirty_log_test
> --
> 2.20.1
>

Does this make sense or should I redo it?

Cheers,
Anders
