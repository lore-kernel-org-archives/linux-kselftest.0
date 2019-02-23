From: sashal@kernel.org (Sasha Levin)
Date: Sat, 23 Feb 2019 16:05:56 -0500
Subject: [PATCH AUTOSEL 4.19 21/65] selftests: cpu-hotplug: fix case where
 CPUs offline > CPUs present
In-Reply-To: <20190223210640.200911-1-sashal@kernel.org>
References: <20190223210640.200911-1-sashal@kernel.org>
Message-ID: <20190223210640.200911-21-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190223210556.j1BDDSqvWaxp8A2wrq4w7CwSvCU2dGvsy_zw9ekgW2g@z>

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 2b531b6137834a55857a337ac17510d6436b6fbb ]

The cpu-hotplug test assumes that we can offline the maximum CPU as
described by /sys/devices/system/cpu/offline.  However, in the case
where the number of CPUs exceeds like kernel configuration then
the offline count can be greater than the present count and we end
up trying to test the offlining of a CPU that is not available to
offline.  Fix this by testing the maximum present CPU instead.

Also, the test currently offlines the CPU and does not online it,
so fix this by onlining the CPU after the test.

Fixes: d89dffa976bc ("fault-injection: add selftests for cpu and memory hotplug")
Signed-off-by: Colin Ian King <colin.king at canonical.com>
Signed-off-by: Shuah Khan <shuah at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 .../selftests/cpu-hotplug/cpu-on-off-test.sh        | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index bab13dd025a63..0d26b5e3f9667 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -37,6 +37,10 @@ prerequisite()
 		exit $ksft_skip
 	fi
 
+	present_cpus=`cat $SYSFS/devices/system/cpu/present`
+	present_max=${present_cpus##*-}
+	echo "present_cpus = $present_cpus present_max = $present_max"
+
 	echo -e "\t Cpus in online state: $online_cpus"
 
 	offline_cpus=`cat $SYSFS/devices/system/cpu/offline`
@@ -151,6 +155,8 @@ online_cpus=0
 online_max=0
 offline_cpus=0
 offline_max=0
+present_cpus=0
+present_max=0
 
 while getopts e:ahp: opt; do
 	case $opt in
@@ -190,9 +196,10 @@ if [ $allcpus -eq 0 ]; then
 	online_cpu_expect_success $online_max
 
 	if [[ $offline_cpus -gt 0 ]]; then
-		echo -e "\t offline to online to offline: cpu $offline_max"
-		online_cpu_expect_success $offline_max
-		offline_cpu_expect_success $offline_max
+		echo -e "\t offline to online to offline: cpu $present_max"
+		online_cpu_expect_success $present_max
+		offline_cpu_expect_success $present_max
+		online_cpu $present_max
 	fi
 	exit 0
 else
-- 
2.19.1
