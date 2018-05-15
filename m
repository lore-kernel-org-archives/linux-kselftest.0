From: shuah at kernel.org (Shuah Khan)
Date: Tue, 15 May 2018 14:22:58 -0600
Subject: [PATCH] selftest: intel_pstate: More accurate error message and
 also a debug support message from aperf.c
In-Reply-To: <20180514220154.9507-1-ahiliation@yahoo.co.in>
References: <20180514220154.9507-1-ahiliation@yahoo.co.in>
Message-ID: <f84c3812-8c4f-fa4a-962e-256dbc6d66df@kernel.org>

On 05/14/2018 04:01 PM, Jeffrin Jose T wrote:
> Fix for  aperf.c to produce the path of the file which is in mention
> during error report.CONFIG_X86_MSR=m support requirement is also mentioned.
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> ---
>  tools/testing/selftests/intel_pstate/aperf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/intel_pstate/aperf.c b/tools/testing/selftests/intel_pstate/aperf.c
> index d21edea9c560..da98c1673f08 100644
> --- a/tools/testing/selftests/intel_pstate/aperf.c
> +++ b/tools/testing/selftests/intel_pstate/aperf.c
> @@ -41,7 +41,9 @@ int main(int argc, char **argv) {
>  	fd = open(msr_file_name, O_RDONLY);
>  
>  	if (fd == -1) {
> -		perror("Failed to open")> +		printf("Failed to open /dev/cpu/%d/msr:", cpu);

Why are you deleting perror() and add a printf() for the error message perror()
printf()?

Why not collapse these messages into one and use strerror() to include the
error string? 
> +		printf(" No such file or directory:")

Not necessarily. open(0 could fail due to insufficient permissions. That is why
using strerror() or perror() is the correct way so the real error message gets
printed.

> +		printf(" Make sure CONFIG_X86_MSR=m support is Enabled\n");

Might not be the real reason why the opeN() failed.

>  		return 1;
>  	}

The return should be KSFT_SKIP instead of 1
>  
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
