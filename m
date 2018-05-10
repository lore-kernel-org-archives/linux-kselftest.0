From: shuah at kernel.org (Shuah Khan)
Date: Thu, 10 May 2018 09:33:15 -0600
Subject: [PATCH] selftests: ftrace: Fixes for the testing script ftracetest
In-Reply-To: <20180510152108.19750-1-ahiliation@yahoo.co.in>
References: <20180510152108.19750-1-ahiliation@yahoo.co.in>
Message-ID: <4f351384-0308-c273-9df7-c1ad3bc500c4@kernel.org>

On 05/10/2018 09:21 AM, Jeffrin Jose T wrote:
> modified notification of permission requirement to run test
> to make it unified with standards
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> ---
>  tools/testing/selftests/ftrace/ftracetest | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index f9a9d424c980..0cc967344c07 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>  
>  # ftracetest - Ftrace test shell scripts
>  #
> @@ -29,8 +29,11 @@ errexit() { # message
>  }
>  
>  # Ensuring user privilege
> -if [ `id -u` -ne 0 ]; then
> -  errexit "this must be run by root user"
> +msg="skip all tests:"
> +
> +if [ $UID != 0 ]; then
> +    echo $msg please run this as root >&2
> +    exit $ksft_skip
>  fi
>  
>  # Utilities
> 

Hi Jeffrin,

I already have a patch out for this. Please make sure you aren't doing
duplicate work.

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
