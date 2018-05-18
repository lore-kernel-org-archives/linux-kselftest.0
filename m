From: shuah@kernel.org (Shuah Khan)
Date: Fri, 18 May 2018 13:19:11 -0600
Subject: [PATCH] selftest: intel_pstate: debug support message from
 aperf.c and return value fix.
In-Reply-To: <20180518140550.2280-1-ahiliation@yahoo.co.in>
References: <20180518140550.2280-1-ahiliation@yahoo.co.in>
Message-ID: <4f51f365-705a-211f-cccb-c634ea750dc6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180518191911.32n1Uh9g6SkKwZuU1h_ZC3AoJ9ib-dh2a0KqszgSGYM@z>

On 05/18/2018 08:05 AM, Jeffrin Jose T wrote:
> Additional message along with an error message which is more
> verbose for debug support from aperf.c and updated with the
> new return value "KSFT_SKIP".
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> ---
>  tools/testing/selftests/intel_pstate/aperf.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/intel_pstate/aperf.c b/tools/testing/selftests/intel_pstate/aperf.c
> index d21edea9c560..f6cd03a87493 100644
> --- a/tools/testing/selftests/intel_pstate/aperf.c
> +++ b/tools/testing/selftests/intel_pstate/aperf.c
> @@ -9,6 +9,8 @@
>  #include <sys/timeb.h>
>  #include <sched.h>
>  #include <errno.h>
> +#include <string.h>
> +#include "../kselftest.h"
>  
>  void usage(char *name) {
>  	printf ("Usage: %s cpunum\n", name);
> @@ -41,8 +43,8 @@ int main(int argc, char **argv) {
>  	fd = open(msr_file_name, O_RDONLY);
>  
>  	if (fd == -1) {
> -		perror("Failed to open");
> -		return 1;
> +		printf("/dev/cpu/%d/msr: %s\n", cpu, strerror(errno));
> +		return KSFT_SKIP;
>  	}
>  
>  	CPU_ZERO(&cpuset);
> 

Thanks. I will queue this up for 4.18-rc1

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
