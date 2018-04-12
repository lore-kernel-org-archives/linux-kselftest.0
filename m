From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Thu, 12 Apr 2018 10:12:28 -0500
Subject: [PATCH] selftests/intel_pstate: Enhance table printing
Message-ID: <1523545962-5281-1-git-send-email-daniel.diaz@linaro.org>

Using coreutils' pr, a nicer table is printed out with the
results.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/intel_pstate/run.sh | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
index bde31a0..a40068b 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -92,18 +92,28 @@ done
 
 [ $EVALUATE_ONLY -eq 0 ] && cpupower frequency-set -g powersave --max=${max_freq}MHz >& /dev/null
 
-echo "=============================================================================="
+echo "========================================================================"
 echo "The marketing frequency of the cpu is $mkt_freq MHz"
 echo "The maximum frequency of the cpu is $max_freq MHz"
 echo "The minimum frequency of the cpu is $min_freq MHz"
 
 # make a pretty table
-echo "Target      Actual      Difference     MSR(0x199)     max_perf_pct"
+echo "Target Actual Difference MSR(0x199) max_perf_pct" | tr " " "\n" > /tmp/result.tab
 for freq in `seq $max_freq -100 $min_freq`
 do
 	result_freq=$(cat /tmp/result.${freq} | grep "cpu MHz" | awk ' { print $4 } ' | awk -F "." ' { print $1 } ')
 	msr=$(cat /tmp/result.${freq} | grep "msr" | awk ' { print $3 } ')
 	max_perf_pct=$(cat /tmp/result.${freq} | grep "max_perf_pct" | awk ' { print $2 } ' )
-	echo " $freq        $result_freq          $(($result_freq-$freq))          $msr          $(($max_perf_pct*$max_freq))"
+	cat >> /tmp/result.tab << EOF
+$freq
+$result_freq
+$((result_freq - freq))
+$msr
+$((max_perf_pct * max_freq))
+EOF
 done
+
+# print the table
+pr -aTt -5 < /tmp/result.tab
+
 exit 0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
