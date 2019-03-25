From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Mon, 25 Mar 2019 08:01:33 -0700
Subject: [PATCH] rcutorture: Select from only online CPUs
In-Reply-To: <20190323034619.15792-1-joel@joelfernandes.org>
References: <20190323034619.15792-1-joel@joelfernandes.org>
Message-ID: <20190325150133.GA4102@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325150133.Iu1DKiBm7-vyrb1pPG_5aOdtwxeUmX5Cw1bDeHSSv3E@z>

On Fri, Mar 22, 2019@11:46:19PM -0400, Joel Fernandes (Google) wrote:
> The rcutorture jitter.sh script selects a random CPU but does not check
> if it is offline or online. This leads to taskset errors many times. On
> my machine, hyper threading is disabled so half the cores are offline
> causing taskset errors a lot of times. Let us fix this by checking from
> only the online CPUs on the system.
> 
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

Good catch!

Please see below for one suggestion for simplification.

							Thanx, Paul

> ---
>  tools/testing/selftests/rcutorture/bin/jitter.sh | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
> index 3633828375e3..53bf9d99b5cd 100755
> --- a/tools/testing/selftests/rcutorture/bin/jitter.sh
> +++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
> @@ -47,10 +47,19 @@ do
>  		exit 0;
>  	fi
>  
> -	# Set affinity to randomly selected CPU
> +	# Set affinity to randomly selected online CPU
>  	cpus=`ls /sys/devices/system/cpu/*/online |

	cpus=`grep 1 /sys/devices/system/cpu/*/online |

>  		sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
>  		grep -v '^0*$'`

Of course, now I have no idea why I excluded CPU 0...  :-/

> +
> +	for c in $cpus; do
> +		if [ "$(cat /sys/devices/system/cpu/cpu$c/online)" == "1" ];
> +		then
> +			cpus_tmp="$cpus_tmp $c"
> +		fi
> +	done
> +	cpus=$cpus_tmp
> +
>  	cpumask=`awk -v cpus="$cpus" -v me=$me -v n=$n 'BEGIN {
>  		srand(n + me + systime());
>  		ncpus = split(cpus, ca);
> -- 
> 2.21.0.392.gf8f6787159e-goog
> 
