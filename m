From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Tue, 26 Mar 2019 15:24:10 -0400
Subject: [PATCH v2 3/4] rcutorture: Select from only online CPUs
In-Reply-To: <20190326192411.198070-1-joel@joelfernandes.org>
References: <20190326192411.198070-1-joel@joelfernandes.org>
Message-ID: <20190326192411.198070-3-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190326192410.vYlB1vcpeUZCaRQAnMK1MnfUmDcAB9gieJUfpbtKP9k@z>

The rcutorture jitter.sh script selects a random CPU but does not check
if it is offline or online. This leads to taskset errors many times. On
my machine, hyper threading is disabled so half the cores are offline
causing taskset errors a lot of times. Let us fix this by checking from
only the online CPUs on the system.

Cc: rcu at vger.kernel.org
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 tools/testing/selftests/rcutorture/bin/jitter.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/jitter.sh b/tools/testing/selftests/rcutorture/bin/jitter.sh
index 3633828375e3..47bd9829dc55 100755
--- a/tools/testing/selftests/rcutorture/bin/jitter.sh
+++ b/tools/testing/selftests/rcutorture/bin/jitter.sh
@@ -47,10 +47,11 @@ do
 		exit 0;
 	fi
 
-	# Set affinity to randomly selected CPU
-	cpus=`ls /sys/devices/system/cpu/*/online |
+	# Set affinity to randomly selected online CPU
+	cpus=`grep 1 /sys/devices/system/cpu/*/online |
 		sed -e 's,/[^/]*$,,' -e 's/^[^0-9]*//' |
 		grep -v '^0*$'`
+
 	cpumask=`awk -v cpus="$cpus" -v me=$me -v n=$n 'BEGIN {
 		srand(n + me + systime());
 		ncpus = split(cpus, ca);
-- 
2.21.0.392.gf8f6787159e-goog
