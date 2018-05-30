From: shuah at kernel.org (Shuah Khan)
Date: Wed, 30 May 2018 17:42:19 -0600
Subject: [RESEND PATCH] selftests: intel_pstate: notification about
 privilege required to run intel_pstate testing script
In-Reply-To: <20180530220339.6107-1-ahiliation@gmail.com>
References: <20180530220339.6107-1-ahiliation@gmail.com>
Message-ID: <16b7c1d5-3fe8-2bc9-6037-1fd61624f992@kernel.org>

On 05/30/2018 04:03 PM, Jeffrin Jose T wrote:
> The intel_pstate related testing script need root level privileges
> when trying to access certain file for the successful execution of
> the script.But this is not the case always like when using evaluation
> only mode, which only require user level privilege.
> 
> This patch is to notify the user about the privilege the script
> demands for the successful execution of the test.
> 
> Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>
> ---

I will take this patch and apply it to linux-kselftest next for 4.18-rc1.

For next time, this patch should have been tagged v2 not RESEND. Also please
include changes made since the last version in this spot after the Signed-off-by
line.

>  tools/testing/selftests/intel_pstate/run.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
> index 8576f6564307..e7008f614ad7 100755
> --- a/tools/testing/selftests/intel_pstate/run.sh
> +++ b/tools/testing/selftests/intel_pstate/run.sh
> @@ -38,6 +38,12 @@ if ! uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ | grep -q x86; then
>  	exit $ksft_skip
>  fi
>  
> +msg="skip all tests:"
> +if [ $UID != 0 ] && [ $EVALUATE_ONLY == 0 ]; then
> +    echo $msg please run this as root >&2
> +    exit $ksft_skip
> +fi
> +
>  max_cpus=$(($(nproc)-1))
>  
>  function run_test () {
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
