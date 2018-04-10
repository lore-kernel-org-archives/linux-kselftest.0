From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Tue, 10 Apr 2018 17:11:15 -0500
Subject: [PATCH] selftests/intel_pstate: Improve test, minor fixes
Message-ID: <1523398277-2066-1-git-send-email-daniel.diaz@linaro.org>

A few changes improve the overall usability of the test:
* fix a hard-coded maximum frequency (3300),
* don't adjust the CPU frequency if only evaluating results,
* fix a comparison for multiple frequencies.

A symptom of that last issue looked like this:
  ./run.sh: line 107: [: too many arguments
  ./run.sh: line 110: 3099
  3099
  3100-3100: syntax error in expression (error token is \"3099
  3100-3100\")

Because a check will count how many differente frequencies
there are among the CPUs of the system, and after they are
tallied another read is performed, which might produce
different results.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/intel_pstate/run.sh | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
index c670359..bde31a0 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -48,11 +48,12 @@ function run_test () {
 
 	echo "sleeping for 5 seconds"
 	sleep 5
-	num_freqs=$(cat /proc/cpuinfo | grep MHz | sort -u | wc -l)
-	if [ $num_freqs -le 2 ]; then
-		cat /proc/cpuinfo | grep MHz | sort -u | tail -1 > /tmp/result.$1
+	grep MHz /proc/cpuinfo | sort -u > /tmp/result.freqs
+	num_freqs=$(wc -l /tmp/result.freqs | awk ' { print $1 } ')
+	if [ $num_freqs -ge 2 ]; then
+		tail -n 1 /tmp/result.freqs > /tmp/result.$1
 	else
-		cat /proc/cpuinfo | grep MHz | sort -u > /tmp/result.$1
+		cp /tmp/result.freqs /tmp/result.$1
 	fi
 	./msr 0 >> /tmp/result.$1
 
@@ -82,21 +83,20 @@ _max_freq=$(cpupower frequency-info -l | tail -1 | awk ' { print $2 } ')
 max_freq=$(($_max_freq / 1000))
 
 
-for freq in `seq $max_freq -100 $min_freq`
+[ $EVALUATE_ONLY -eq 0 ] && for freq in `seq $max_freq -100 $min_freq`
 do
 	echo "Setting maximum frequency to $freq"
 	cpupower frequency-set -g powersave --max=${freq}MHz >& /dev/null
-	[ $EVALUATE_ONLY -eq 0 ] && run_test $freq
+	run_test $freq
 done
 
-echo "=============================================================================="
+[ $EVALUATE_ONLY -eq 0 ] && cpupower frequency-set -g powersave --max=${max_freq}MHz >& /dev/null
 
+echo "=============================================================================="
 echo "The marketing frequency of the cpu is $mkt_freq MHz"
 echo "The maximum frequency of the cpu is $max_freq MHz"
 echo "The minimum frequency of the cpu is $min_freq MHz"
 
-cpupower frequency-set -g powersave --max=${max_freq}MHz >& /dev/null
-
 # make a pretty table
 echo "Target      Actual      Difference     MSR(0x199)     max_perf_pct"
 for freq in `seq $max_freq -100 $min_freq`
@@ -104,10 +104,6 @@ do
 	result_freq=$(cat /tmp/result.${freq} | grep "cpu MHz" | awk ' { print $4 } ' | awk -F "." ' { print $1 } ')
 	msr=$(cat /tmp/result.${freq} | grep "msr" | awk ' { print $3 } ')
 	max_perf_pct=$(cat /tmp/result.${freq} | grep "max_perf_pct" | awk ' { print $2 } ' )
-	if [ $result_freq -eq $freq ]; then
-		echo " $freq        $result_freq             0          $msr         $(($max_perf_pct*3300))"
-	else
-		echo " $freq        $result_freq          $(($result_freq-$freq))          $msr          $(($max_perf_pct*$max_freq))"
-	fi
+	echo " $freq        $result_freq          $(($result_freq-$freq))          $msr          $(($max_perf_pct*$max_freq))"
 done
 exit 0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
