From: mcgrof@kernel.org (Luis R. Rodriguez)
Date: Wed, 9 May 2018 19:27:54 +0000
Subject: [PATCH 08/24] selftests: firmware: return Kselftest Skip code
 for skipped tests
In-Reply-To: <20180505011328.32078-8-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-8-shuah@kernel.org>
Message-ID: <20180509192754.GS27853@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180509192754.PkJMuDhu7M7tEbuOm6iCk_fxfRZJSjLMNwqo4r2_c2o@z>

On Fri, May 04, 2018@07:13:12PM -0600, Shuah Khan (Samsung OSG) wrote:
> When firmware test(s) get skipped because of unmet dependencies and/or
> unsupported configuration, it returns 0 which is treated as a pass
> by the Kselftest framework. This leads to false positive result even
> when the test could not be run.
> 
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run.
> 
> Kselftest framework SKIP code is 4 and the framework prints appropriate
> messages to indicate that the test is skipped.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Luis R. Rodriguez <mcgrof at kernel.org>

  Luis

> ---
>  tools/testing/selftests/firmware/fw_fallback.sh   | 4 ++--
>  tools/testing/selftests/firmware/fw_filesystem.sh | 4 +++-
>  tools/testing/selftests/firmware/fw_lib.sh        | 7 +++++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/firmware/fw_fallback.sh b/tools/testing/selftests/firmware/fw_fallback.sh
> index 8e2e34a2ca69..70d18be46af5 100755
> --- a/tools/testing/selftests/firmware/fw_fallback.sh
> +++ b/tools/testing/selftests/firmware/fw_fallback.sh
> @@ -74,7 +74,7 @@ load_fw_custom()
>  {
>  	if [ ! -e "$DIR"/trigger_custom_fallback ]; then
>  		echo "$0: custom fallback trigger not present, ignoring test" >&2
> -		return 1
> +		exit $ksft_skip
>  	fi
>  
>  	local name="$1"
> @@ -107,7 +107,7 @@ load_fw_custom_cancel()
>  {
>  	if [ ! -e "$DIR"/trigger_custom_fallback ]; then
>  		echo "$0: canceling custom fallback trigger not present, ignoring test" >&2
> -		return 1
> +		exit $ksft_skip
>  	fi
>  
>  	local name="$1"
> diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
> index 6452d2129cd9..a4320c4b44dc 100755
> --- a/tools/testing/selftests/firmware/fw_filesystem.sh
> +++ b/tools/testing/selftests/firmware/fw_filesystem.sh
> @@ -30,6 +30,7 @@ fi
>  
>  if [ ! -e "$DIR"/trigger_async_request ]; then
>  	echo "$0: empty filename: async trigger not present, ignoring test" >&2
> +	exit $ksft_skip
>  else
>  	if printf '\000' >"$DIR"/trigger_async_request 2> /dev/null; then
>  		echo "$0: empty filename should not succeed (async)" >&2
> @@ -69,6 +70,7 @@ fi
>  # Try the asynchronous version too
>  if [ ! -e "$DIR"/trigger_async_request ]; then
>  	echo "$0: firmware loading: async trigger not present, ignoring test" >&2
> +	exit $ksft_skip
>  else
>  	if ! echo -n "$NAME" >"$DIR"/trigger_async_request ; then
>  		echo "$0: could not trigger async request" >&2
> @@ -89,7 +91,7 @@ test_config_present()
>  {
>  	if [ ! -f $DIR/reset ]; then
>  		echo "Configuration triggers not present, ignoring test"
> -		exit 0
> +		exit $ksft_skip
>  	fi
>  }
>  
> diff --git a/tools/testing/selftests/firmware/fw_lib.sh b/tools/testing/selftests/firmware/fw_lib.sh
> index 962d7f4ac627..6c5f1b2ffb74 100755
> --- a/tools/testing/selftests/firmware/fw_lib.sh
> +++ b/tools/testing/selftests/firmware/fw_lib.sh
> @@ -9,11 +9,14 @@ DIR=/sys/devices/virtual/misc/test_firmware
>  PROC_CONFIG="/proc/config.gz"
>  TEST_DIR=$(dirname $0)
>  
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
> +
>  print_reqs_exit()
>  {
>  	echo "You must have the following enabled in your kernel:" >&2
>  	cat $TEST_DIR/config >&2
> -	exit 1
> +	exit $ksft_skip
>  }
>  
>  test_modprobe()
> @@ -88,7 +91,7 @@ verify_reqs()
>  	if [ "$TEST_REQS_FW_SYSFS_FALLBACK" = "yes" ]; then
>  		if [ ! "$HAS_FW_LOADER_USER_HELPER" = "yes" ]; then
>  			echo "usermode helper disabled so ignoring test"
> -			exit 0
> +			exit $ksft_skip
>  		fi
>  	fi
>  }
> -- 
> 2.14.1
> 
> 

-- 
Do not panic
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
