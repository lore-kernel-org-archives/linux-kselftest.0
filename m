From: shuah at kernel.org (Shuah Khan)
Date: Fri, 4 May 2018 13:47:54 -0600
Subject: [PATCH] selftests:intel_pstate: fixes typical crash of a testing
 script for Intel P-State driver
In-Reply-To: <20180429191226.14242-1-ahiliation@yahoo.co.in>
References: <20180429191226.14242-1-ahiliation@yahoo.co.in>
Message-ID: <62c2484a-b8fe-513c-a9c7-dff1f3f3979a@kernel.org>

On 04/29/2018 01:12 PM, Jeffrin Jose T wrote:
>  Testing script for Intel P-State driver crashes during
>  the run.  this patch fixes that crash and produce typical results.
> 
> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
> 
> ---
>  tools/testing/selftests/intel_pstate/run.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
> index c670359becc6..cd32aca8806f 100755
> --- a/tools/testing/selftests/intel_pstate/run.sh
> +++ b/tools/testing/selftests/intel_pstate/run.sh
> @@ -27,6 +27,7 @@
>  # and the test will error out in those cases.  The result.X file can be checked
>  # for consistency and modified to remove the extra MHz values.  The result.X
>  # files can be re-evaluated by setting EVALUATE_ONLY to 1 below.
> +#set -xv
>  
>  EVALUATE_ONLY=0
>  
> @@ -101,12 +102,13 @@ cpupower frequency-set -g powersave --max=${max_freq}MHz >& /dev/null
>  echo "Target      Actual      Difference     MSR(0x199)     max_perf_pct"
>  for freq in `seq $max_freq -100 $min_freq`
>  do
> -	result_freq=$(cat /tmp/result.${freq} | grep "cpu MHz" | awk ' { print $4 } ' | awk -F "." ' { print $1 } ')
> +       result_freq=$(cat /tmp/result.${freq} | grep "cpu MHz" \
>         | awk '{print $4}' | awk -F "." '{print $1}')
> +	result_freq=$(echo $result_freq | head -n1 | cut -d " " -f1)
>  	msr=$(cat /tmp/result.${freq} | grep "msr" | awk ' { print $3 } ')
>  	max_perf_pct=$(cat /tmp/result.${freq} | grep "max_perf_pct" | awk ' { print $2 } ' )
> -	if [ $result_freq -eq $freq ]; then
> +	if (( "$result_freq" == "$freq" ))
> +	then
>  		echo " $freq        $result_freq             0          $msr         $(($max_perf_pct*3300))"
>  	else
>  		echo " $freq        $result_freq          $(($result_freq-$freq))          $msr          $(($max_perf_pct*$max_freq))"
> 

Thanks. I will get this into 4.17-rc5

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
