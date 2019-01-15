From: shuah at kernel.org (shuah)
Date: Mon, 14 Jan 2019 18:45:19 -0700
Subject: [PATCH] tools/testing/selftests/x86/unwind_vdso.c: Remove
 duplicate header
In-Reply-To: <5c3c7dfe.1c69fb81.7c853.0be7@mx.google.com>
References: <5c3c7dfe.1c69fb81.7c853.0be7@mx.google.com>
Message-ID: <3242d93b-bd3d-bce3-b912-bd28144a2e9d@kernel.org>

On 1/14/19 5:18 AM, Sabyasachi Gupta wrote:
> Remove sys/ucontext.h which is included more than once.
> 
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> ---
>   tools/testing/selftests/x86/unwind_vdso.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/unwind_vdso.c b/tools/testing/selftests/x86/unwind_vdso.c
> index 00a26a8..9731133 100644
> --- a/tools/testing/selftests/x86/unwind_vdso.c
> +++ b/tools/testing/selftests/x86/unwind_vdso.c
> @@ -44,7 +44,6 @@ int main()
>   #include <stdbool.h>
>   #include <sys/ptrace.h>
>   #include <sys/user.h>
> -#include <sys/ucontext.h>
>   #include <link.h>
>   #include <sys/auxv.h>
>   #include <dlfcn.h>
> 

Thanks for the patch. I will pull this in for 5.1-rc1

thanks,
-- Shuah
