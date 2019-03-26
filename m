From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Tue, 26 Mar 2019 15:24:11 -0400
Subject: [PATCH v2 4/4] rcutorture: Add cpu0 to the set of CPUs to add jitter
In-Reply-To: <20190326192411.198070-1-joel@joelfernandes.org>
References: <20190326192411.198070-1-joel@joelfernandes.org>
Message-ID: <20190326192411.198070-4-joel@joelfernandes.org>

jitter.sh currently does not add CPU0 to the list of CPUs for adding of
jitter. Let us add it to this list even when it is not hot-pluggable.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/rcutorture/bin/jitter.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
index 47bd9829dc55..26faf5824a1f 100755
--- a/tools/testing/selftests/rcutorture/bin/jitter.sh
+++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
@@ -49,8 +49,12 @@ do
 
 	# Set affinity to randomly selected online CPU
 	cpus=`grep 1 /sys/devices/system/cpu/*/online |
-		sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
-		grep -v '^0*$'`
+		sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//'`
+
+	# Do not leave out poor old cpu0 which may not be hot-pluggable
+	if [ ! -f "/sys/devices/system/cpu/cpu0/online" ]; then
+		cpus="0 $cpus"
+	fi
 
 	cpumask=`awk -v cpus="$cpus" -v me=$me -v n=$n 'BEGIN {
 		srand(n + me + systime());
-- 
2.21.0.392.gf8f6787159e-goog
