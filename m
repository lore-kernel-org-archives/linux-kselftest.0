From: shuah@kernel.org (Shuah Khan)
Date: Wed, 8 Nov 2017 09:34:50 -0700
Subject: [Linux-kselftest-mirror] [PATCH 2/2] selftests: firmware: skip
 unsupported custom firmware fallback tests
In-Reply-To: <1510141660-31612-3-git-send-email-amit.pundir@linaro.org>
References: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
 <1510141660-31612-3-git-send-email-amit.pundir@linaro.org>
Message-ID: <4d94c89b-45cc-0238-bc4f-15f796693e84@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171108163450.6kscwn8tSD8uXDaJExITDIFKqHuWZDUDL_ahVGd1WYg@z>

On 11/08/2017 04:47 AM, Amit Pundir wrote:
> Ignore custom firmware loading and cancellation tests on older
> kernel releases, which do not support this feature.
> 
> Signed-off-by: Amit Pundir <amit.pundir at linaro.org>
> ---
>  tools/testing/selftests/firmware/fw_fallback.sh | 38 +++++++++++++++++--------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/firmware/fw_fallback.sh b/tools/testing/selftests/firmware/fw_fallback.sh
> index a52a3bab532b..72858c921eed 100755
> --- a/tools/testing/selftests/firmware/fw_fallback.sh
> +++ b/tools/testing/selftests/firmware/fw_fallback.sh
> @@ -86,6 +86,11 @@ load_fw_cancel()
>  
>  load_fw_custom()
>  {
> +	if [ ! -e "$DIR"/trigger_custom_fallback ]; then
> +		echo "$0: custom fallback loading trigger not supported" >&2

Please make this message consistent with the rest when a test is ignored
as in the following to make it clear what is being done.

fw_fallback.sh:	echo "usermode helper disabled so ignoring test"
fw_filesystem.sh:		echo "Configuration triggers not present, ignoring test"

> +		return 1
> +	fi
> +
>  	local name="$1"
>  	local file="$2"
>  
> @@ -108,11 +113,17 @@ load_fw_custom()
>  
>  	# Wait for request to finish.
>  	wait
> +	return 0
>  }
>  
>  
>  load_fw_custom_cancel()
>  {
> +	if [ ! -e "$DIR"/trigger_custom_fallback ]; then
> +		echo "$0: cancelling custom fallback trigger not supported" >&2

Please make this message consistent with the rest when a test is ignored
as in the following to make it clear what is being done.

fw_fallback.sh:	echo "usermode helper disabled so ignoring test"
fw_filesystem.sh:		echo "Configuration triggers not present, ignoring test"

If I missed ponting out any other instances of ignoring, please do the
same for them.

> +		return 1
> +	fi
> +
>  	local name="$1"
>  	local file="$2"
>  
> @@ -133,6 +144,7 @@ load_fw_custom_cancel()
>  
>  	# Wait for request to finish.
>  	wait
> +	return 0
>  }
>  
>  load_fw_fallback_with_child()
> @@ -227,20 +239,22 @@ else
>  	echo "$0: cancelling fallback mechanism works"
>  fi
>  
> -load_fw_custom "$NAME" "$FW"
> -if ! diff -q "$FW" /dev/test_firmware >/dev/null ; then
> -	echo "$0: firmware was not loaded" >&2
> -	exit 1
> -else
> -	echo "$0: custom fallback loading mechanism works"
> +if load_fw_custom "$NAME" "$FW" ; then
> +	if ! diff -q "$FW" /dev/test_firmware >/dev/null ; then
> +		echo "$0: firmware was not loaded" >&2
> +		exit 1
> +	else
> +		echo "$0: custom fallback loading mechanism works"
> +	fi
>  fi
>  
> -load_fw_custom_cancel "nope-$NAME" "$FW"
> -if diff -q "$FW" /dev/test_firmware >/dev/null ; then
> -	echo "$0: firmware was expected to be cancelled" >&2
> -	exit 1
> -else
> -	echo "$0: cancelling custom fallback mechanism works"
> +if load_fw_custom_cancel "nope-$NAME" "$FW" ; then
> +	if diff -q "$FW" /dev/test_firmware >/dev/null ; then
> +		echo "$0: firmware was expected to be cancelled" >&2
> +		exit 1
> +	else
> +		echo "$0: cancelling custom fallback mechanism works"
> +	fi
>  fi
>  
>  set +e
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
