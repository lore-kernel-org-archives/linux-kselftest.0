From: christian.brauner at canonical.com (Christian Brauner)
Date: Sun, 6 May 2018 10:15:56 +0200
Subject: [PATCH 07/24] selftests: filesystems: return Kselftest Skip code
 for skipped tests
In-Reply-To: <20180505011328.32078-7-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-7-shuah@kernel.org>
Message-ID: <20180506081555.GA9705@gmail.com>

On Fri, May 04, 2018 at 07:13:11PM -0600, Shuah Khan (Samsung OSG) wrote:
> When devpts_pts test is skipped because of unmet dependencies and/or
> unsupported configuration, it exits with error which is treated as
> a fail by the Kselftest framework. This leads to false negative
> result even when the test could not be run.
> 
> In another case, it returns pass for a skipped test reporting a false
> postive.
> 
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run.
> 
> Change it to use ksft_exit_skip() when test is skipped.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Acked-by: Christian Brauner <christian.brauner at ubuntu.com>

Thanks, Shuah!
Christian

> ---
>  tools/testing/selftests/filesystems/devpts_pts.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
> index b9055e974289..0f2d9f427944 100644
> --- a/tools/testing/selftests/filesystems/devpts_pts.c
> +++ b/tools/testing/selftests/filesystems/devpts_pts.c
> @@ -11,6 +11,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/mount.h>
>  #include <sys/wait.h>
> +#include "../kselftest.h"
>  
>  static bool terminal_dup2(int duplicate, int original)
>  {
> @@ -125,10 +126,12 @@ static int do_tiocgptpeer(char *ptmx, char *expected_procfd_contents)
>  		if (errno == EINVAL) {
>  			fprintf(stderr, "TIOCGPTPEER is not supported. "
>  					"Skipping test.\n");
> -			fret = EXIT_SUCCESS;
> +			fret = KSFT_SKIP;
> +		} else {
> +			fprintf(stderr,
> +				"Failed to perform TIOCGPTPEER ioctl\n");
> +			fret = EXIT_FAILURE;
>  		}
> -
> -		fprintf(stderr, "Failed to perform TIOCGPTPEER ioctl\n");
>  		goto do_cleanup;
>  	}
>  
> @@ -281,7 +284,7 @@ int main(int argc, char *argv[])
>  	if (!isatty(STDIN_FILENO)) {
>  		fprintf(stderr, "Standard input file desciptor is not attached "
>  				"to a terminal. Skipping test\n");
> -		exit(EXIT_FAILURE);
> +		exit(KSFT_SKIP);
>  	}
>  
>  	ret = unshare(CLONE_NEWNS);
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
