From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 7 Nov 2017 10:02:55 -0700
Subject: [Linux-kselftest-mirror] [PATCH v3 1/2] selftests: bpf:
 test_kmod.sh: check the module path before insmod
In-Reply-To: <1510072553-7753-1-git-send-email-naresh.kamboju@linaro.org>
References: <1510072553-7753-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <df3840b7-6ff5-37f3-2543-fc8067682562@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171107170255.QMgHiW9Z9Kav73WFk7NBB1edd4301wu0XBSODj4H5qc@z>

On 11/07/2017 09:35 AM, naresh.kamboju@linaro.org wrote:
> From: Naresh Kamboju <naresh.kamboju at linaro.org>

Odd to see this From: line in the patch. Could you take a look
and see where this is coming from? Your gitconfig perhaps.

I have to fix this up when I apply the patch which I would like
to avoid.

> 
> test_kmod.sh reported false failure when module not present.
> Instead check test_bpf.ko is present in the path before loading it.
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/bpf/test_kmod.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
> index 6d58cca8e235..2e5a1049e2f2 100755
> --- a/tools/testing/selftests/bpf/test_kmod.sh
> +++ b/tools/testing/selftests/bpf/test_kmod.sh
> @@ -9,9 +9,11 @@ test_run()
>  
>  	echo "[ JIT enabled:$1 hardened:$2 ]"
>  	dmesg -C
> -	insmod $SRC_TREE/lib/test_bpf.ko 2> /dev/null
> -	if [ $? -ne 0 ]; then
> -		rc=1
> +	if [ -f ${SRC_TREE}/lib/test_bpf.ko ]; then
> +		insmod ${SRC_TREE}/lib/test_bpf.ko 2> /dev/null

Hmm. Are you sure SRC_TREE is defined in all use-cases? What happens
when "cd tools/testing/selftests/bpf; make run_tests" is run?


> +		if [ $? -ne 0 ]; then
> +			rc=1
> +		fi
>  	fi
>  	rmmod  test_bpf 2> /dev/null
>  	dmesg | grep FAIL
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
