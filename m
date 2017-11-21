From: shuah at kernel.org (Shuah Khan)
Date: Tue, 21 Nov 2017 08:43:37 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: posix_timers: Use
 common error handling code in two functions
In-Reply-To: <3ce187fa-a6df-a419-6924-ea12bf837972@users.sourceforge.net>
References: <3ce187fa-a6df-a419-6924-ea12bf837972@users.sourceforge.net>
Message-ID: <abce4f4e-a904-9bfe-7021-3cfd230d52ea@kernel.org>

On 11/21/2017 03:00 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring at users.sourceforge.net>
> Date: Tue, 21 Nov 2017 10:50:32 +0100
> 
> Add jump targets so that a bit of exception handling can be better reused
> at the end of these functions.
> 
> This issue was detected by using the Coccinelle software.

Please include Coccinelle report in the change log.

> 
> Signed-off-by: Markus Elfring <elfring at users.sourceforge.net>
> ---
>  tools/testing/selftests/timers/posix_timers.c | 32 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
> index 15cf56d32155..5c9fbb06194f 100644
> --- a/tools/testing/selftests/timers/posix_timers.c
> +++ b/tools/testing/selftests/timers/posix_timers.c
> @@ -104,10 +104,8 @@ static int check_itimer(int which)
>  		signal(SIGALRM, sig_handler);
>  
>  	err = gettimeofday(&start, NULL);
> -	if (err < 0) {
> -		perror("Can't call gettimeofday()\n");
> -		return -1;
> -	}
> +	if (err < 0)
> +		goto report_failure;

Instead of report_failure, makes this specific to the failure.
Something like, gettimeofday_error

> 
>  	err = setitimer(which, &val, NULL);
>  	if (err < 0) {
> @@ -123,10 +121,8 @@ static int check_itimer(int which)
>  		idle_loop();
>  
>  	err = gettimeofday(&end, NULL);
> -	if (err < 0) {
> -		perror("Can't call gettimeofday()\n");
> -		return -1;
> -	}
> +	if (err < 0)
> +		goto report_failure;
>  
>  	if (!check_diff(start, end))
>  		printf("[OK]\n");
> @@ -134,6 +130,10 @@ static int check_itimer(int which)
>  		printf("[FAIL]\n");
>  
>  	return 0;
> +
> +report_failure:
> +	perror("Can't call gettimeofday()\n");
> +	return -1;
>  }
>  
>  static int check_timer_create(int which)
> @@ -162,10 +162,8 @@ static int check_timer_create(int which)
>  	signal(SIGALRM, sig_handler);
>  
>  	err = gettimeofday(&start, NULL);
> -	if (err < 0) {
> -		perror("Can't call gettimeofday()\n");
> -		return -1;
> -	}
> +	if (err < 0)
> +		goto report_failure;
>  
>  	err = timer_settime(id, 0, &val, NULL);
>  	if (err < 0) {
> @@ -176,10 +174,8 @@ static int check_timer_create(int which)
>  	user_loop();
>  
>  	err = gettimeofday(&end, NULL);
> -	if (err < 0) {
> -		perror("Can't call gettimeofday()\n");
> -		return -1;
> -	}
> +	if (err < 0)
> +		goto report_failure;
>  
>  	if (!check_diff(start, end))
>  		printf("[OK]\n");
> @@ -187,6 +183,10 @@ static int check_timer_create(int which)
>  		printf("[FAIL]\n");
>  
>  	return 0;
> +
> +report_failure:
> +	perror("Can't call gettimeofday()\n");
> +	return -1;
>  }
>  
>  int main(int argc, char **argv)
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
