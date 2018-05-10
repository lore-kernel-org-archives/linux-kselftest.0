From: shuah@kernel.org (Shuah Khan)
Date: Thu, 10 May 2018 09:36:25 -0600
Subject: [PATCH] selftests: intel_pstate: Fixes for the testing script
 run.sh
In-Reply-To: <20180509221733.15182-1-ahiliation@yahoo.co.in>
References: <20180509221733.15182-1-ahiliation@yahoo.co.in>
Message-ID: <3530a166-8c57-6bd4-e4e2-b6019b492598@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180510153625.C9u8tMnSYIP3YILsRxHgW5UTY0lhnoW7ZaGywIcS2dA@z>

On 05/09/2018 04:17 PM, Jeffrin Jose T wrote:
> fix for notification of permission requirement to run test.
> fix for exit status value for test skipped.
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> ---
>  tools/testing/selftests/intel_pstate/run.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
> index c670359becc6..74983f74a9a1 100755
> --- a/tools/testing/selftests/intel_pstate/run.sh
> +++ b/tools/testing/selftests/intel_pstate/run.sh
> @@ -30,6 +30,13 @@
>  
>  EVALUATE_ONLY=0
>  
> +msg="skip all tests:"
> +
> +if [ $UID != 0 ] && [ $EVALUATE_ONLY == 0 ]; then
> +    echo $msg please run this as root >&2
> +    exit $ksft_skip
> +fi
> +
>  if ! uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ | grep -q x86; then
>  	echo "$0 # Skipped: Test can only run on x86 architectures."
>  	exit 0
> 

I have a patch out for this and your change conflicts with it. I am in the process
of pushing patches into linux-kselftest next. Please rebase this patch on top
of that.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
