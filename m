From: colin.king at canonical.com (Colin Ian King)
Date: Thu, 10 Jan 2019 12:32:16 +0000
Subject: NACK: [PATCH] selftests: cpu-hotplug: fix case where CPUs offline >
 CPUs present
In-Reply-To: <20190110113725.12369-1-colin.king@canonical.com>
References: <20190110113725.12369-1-colin.king@canonical.com>
Message-ID: <49c597d3-65e6-3cde-ee43-906d8951aa90@canonical.com>

On 10/01/2019 11:37, Colin King wrote:
> From: Colin Ian King <colin.king at canonical.com>
> 
> The cpu-hotplug test assumes that we can offline the maximum CPU as
> described by /sys/devices/system/cpu/offline.  However, in the case
> where the number of CPUs exceeds like kernel configuration then
> the offline count can be greater than the present count and we end
> up trying to test the offlining of a CPU that is not available to
> offline.  Fix this by testing the maximum present CPU instead.
> 
> Also, the test currently offlines the CPU and does not online it,
> so fix this by onlining the CPU after the test.
> 
> Fixes: d89dffa976bc ("fault-injection: add selftests for cpu and memory hotplug")
> Signed-off-by: Colin Ian King <colin.king at canonical.com>
> ---
>  .../selftests/cpu-hotplug/cpu-on-off-test.sh      | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> index bab13dd025a6..8670fb38a40e 100755
> --- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> +++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> @@ -31,12 +31,17 @@ prerequisite()
>  	echo "CPU online/offline summary:"
>  	online_cpus=`cat $SYSFS/devices/system/cpu/online`
>  	online_max=${online_cpus##*-}
> +	echo "online_cpus = $online_cpus online_max = $online_max"

Bother, forgot to remove this debug.

>  
>  	if [[ "$online_cpus" = "$online_max" ]]; then
>  		echo "$msg: since there is only one cpu: $online_cpus"
>  		exit $ksft_skip
>  	fi
>  
> +	present_cpus=`cat $SYSFS/devices/system/cpu/present`
> +	present_max=${present_cpus##*-}
> +	echo "present_cpus = $present_cpus present_max = $present_max"
> +
>  	echo -e "\t Cpus in online state: $online_cpus"
>  
>  	offline_cpus=`cat $SYSFS/devices/system/cpu/offline`
> @@ -46,6 +51,7 @@ prerequisite()
>  		offline_max=${offline_cpus##*-}
>  	fi
>  	echo -e "\t Cpus in offline state: $offline_cpus"
> +

Ugh, I added a whitespace

>  }
>  
>  #
> @@ -151,6 +157,8 @@ online_cpus=0
>  online_max=0
>  offline_cpus=0
>  offline_max=0
> +present_cpus=0
> +present_max=0
>  
>  while getopts e:ahp: opt; do
>  	case $opt in
> @@ -190,9 +198,10 @@ if [ $allcpus -eq 0 ]; then
>  	online_cpu_expect_success $online_max
>  
>  	if [[ $offline_cpus -gt 0 ]]; then
> -		echo -e "\t offline to online to offline: cpu $offline_max"
> -		online_cpu_expect_success $offline_max
> -		offline_cpu_expect_success $offline_max
> +		echo -e "\t offline to online to offline: cpu $present_max"
> +		online_cpu_expect_success $present_max
> +		offline_cpu_expect_success $present_max
> +		online_cpu $present_max
>  	fi
>  	exit 0
>  else
> 
