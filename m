From: smuckle.linux@gmail.com (Steve Muckle)
Date: Mon, 7 May 2018 17:03:41 -0700
Subject: [PATCH 06/24] selftests: exec: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-6-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-6-shuah@kernel.org>
Message-ID: <cb8cefa1-a355-789a-ff79-10c8e3393723@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508000341.lS6tgVnyqDatrR_xXpTRi91MWB299fGdsQA9nVwAJIA@z>

On 05/04/2018 06:13 PM, Shuah Khan (Samsung OSG) wrote:
> When execveat test is skipped because of unmet dependencies and/or
> unsupported configuration, it exits with error which is treated as
> a fail by the Kselftest framework. This leads to false negative
> result even when the test could not be run.
> 
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run.
> 
> Change it to use ksft_exit_skip() when kernel doesn't support execveat.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> ---
>   tools/testing/selftests/exec/execveat.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/exec/execveat.c b/tools/testing/selftests/exec/execveat.c
> index 67cd4597db2b..47cbf54d0801 100644
> --- a/tools/testing/selftests/exec/execveat.c
> +++ b/tools/testing/selftests/exec/execveat.c
> @@ -20,6 +20,8 @@
>   #include <string.h>
>   #include <unistd.h>
>   
> +#include "../kselftest.h"
> +
>   static char longpath[2 * PATH_MAX] = "";
>   static char *envp[] = { "IN_TEST=yes", NULL, NULL };
>   static char *argv[] = { "execveat", "99", NULL };
> @@ -249,8 +251,8 @@ static int run_tests(void)
>   	errno = 0;
>   	execveat_(-1, NULL, NULL, NULL, 0);
>   	if (errno == ENOSYS) {
> -		printf("[FAIL] ENOSYS calling execveat - no kernel support?\n");
> -		return 1;
> +		ksft_exit_skip(
> +			"ENOSYS calling execveat - no kernel support?\n");
>   	}
>   
>   	/* Change file position to confirm it doesn't affect anything */
> 
LGTM.

thanks,
Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
