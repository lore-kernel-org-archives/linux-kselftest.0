Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3DF3DA7ED
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168108; cv=none; b=J1QgPgVQgcJIChjfc5ebTG9IrBWnfiYoJiYBu7E5X1Afzqg2cEY03rUYnkarxLfClR1EU+1D+FOD2yrKB7TjS4SjT9g08QAUViFm2ypFV2Acr3+OqWtuypboAZIiHM3M1ZofVZr8OayFIOcC5+jgpoop9t2/MR81CEFyJqvS/sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168108; c=relaxed/simple;
	bh=+oUqAdz2UDStJoG/WRq5RTfbPQ0R9zEPWwyzRbVJTu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OxiSp1oQXFuRaQ4ueq6BDVKv+Ermo1e2FNLxe1uRO00z41bXnRjBr58wJ6tZT1d6NUd5J86qFomYAKuNZNLGl2vyvGEc4Bujs5hpVI2sVYYac5cv33hEVCmswJxAujJ3h4Xf5h5sb7OhN3oO9YvXVjWwq5mZwr1uyJyOdTFok24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wbzoDXu9; arc=none smtp.client-ip=91.218.175.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wbzoDXu9"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+oUqAdz2UDStJoG/WRq5RTfbPQ0R9zEPWwyzRbVJTu0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788168102; v=1; x=1788772902;
 b=wbzoDXu9wQ/o5o+fhtuNn8uEq9r1QIs9e0rrNdOnOPaTd0BDlOWDK9nrPa9GwJAeVGEq24Ox
 WJu9AlydOx3cWhHnZ0hHx++F7o4R6/OfFtJd9a6+FvZMLiGTdGEoOYyavAQ2qS5/TD+w1uL8ypA
 GkZiZIwPCL7WFemcJSWMXv1Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b46ef0517f2c204c;
	Mon, 31 Aug 2026 09:21:42 +0000
X-Mizu-Trace-ID: b46ef0517f2c204c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Mon, 31 Aug 2026 17:21:28 +0800
Subject: [PATCH net-next v2] selftests: net: move log_test to lib file and
 remove duplicate code
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQqDMBBFryKzbopJigld9R5FRO1Eh0pSMiEo4
 t0bpKsuH4///g6MkZDhXu0QMRNT8AXUpYJx7v2Egl6FQdWqqa1UgnFx3RKmLiEnMZgGe2c0Ku2
 gbD4RHa1n7wkek/C4JmiLmYlTiNt5lOXpf03918xSSOGsHaSsjb0pfLy3hXzg6+ihPY7jCxLdU
 xC1AAAA
X-Change-ID: 20260812-self_log_test-b76eaf73e23f
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hangbin Liu <hangbin.liu@linux.dev>, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Many test scripts under tools/testing/selftests/net/ each define their own
log_test() function with near-identical logic for comparing a return
code against an expected value and printing OK/FAIL. Add a shared
log_test_expected() to lib.sh and replace each local definition with a
thin wrapper that delegates to it.

The function is named log_test_expected() rather than log_test() because
lib.sh already exports log_test() with a different signature used by
the forwarding tests.

Two tests required special handling:

- icmp_redirect.sh passed a fourth "xfail" argument to log_test(). The
  underlying issue has been fixed and the argument is always absent now,
  so it is simply dropped.

- fib_nexthops.sh checked for ksft_skip (exit code 4) inside log_test(),
  but no test in the file produces that code. The check is removed,
  callers that need to report a skip should use log_test_skip() instead.
  Two callers compared against exit code 2 are left as-is since code 2
  correctly counts as a failure in the previous log_test().

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v2:
- Remove skip/xfail checking in lib.sh, as any command can exits with 2 or 4 (sashiko)
- Remove nskip counter in fib_nexthops.sh
- Link to v1: https://lore.kernel.org/r/20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn
---
 tools/testing/selftests/net/drop_monitor_tests.sh  | 13 +------
 tools/testing/selftests/net/fcnal-test.sh          | 29 +-------------
 tools/testing/selftests/net/fdb_flush.sh           | 35 +----------------
 tools/testing/selftests/net/fib-onlink-tests.sh    | 18 +--------
 .../selftests/net/fib_nexthop_multiprefix.sh       | 21 +----------
 tools/testing/selftests/net/fib_nexthop_nongw.sh   | 21 +----------
 tools/testing/selftests/net/fib_nexthops.sh        | 44 ++--------------------
 tools/testing/selftests/net/fib_rule_tests.sh      | 19 +---------
 tools/testing/selftests/net/fib_tests.sh           | 26 +------------
 tools/testing/selftests/net/gre_gso.sh             | 26 +------------
 tools/testing/selftests/net/icmp_redirect.sh       | 28 ++------------
 tools/testing/selftests/net/l2tp.sh                | 19 +---------
 tools/testing/selftests/net/lib.sh                 | 31 +++++++++++++++
 .../selftests/net/ndisc_unsolicited_na_test.sh     | 26 +------------
 .../selftests/net/srv6_encap_lookup_l3vpn_test.sh  | 19 +---------
 .../selftests/net/srv6_end_dt46_l3vpn_test.sh      | 19 +---------
 .../selftests/net/srv6_end_dt4_l3vpn_test.sh       | 19 +---------
 .../selftests/net/srv6_end_dt6_l3vpn_test.sh       | 19 +---------
 .../selftests/net/srv6_end_dx4_netfilter_test.sh   | 23 ++---------
 .../selftests/net/srv6_end_dx6_netfilter_test.sh   | 23 ++---------
 .../testing/selftests/net/srv6_end_flavors_test.sh | 23 ++---------
 .../selftests/net/srv6_end_next_csid_l3vpn_test.sh | 19 +---------
 .../net/srv6_end_x_next_csid_l3vpn_test.sh         | 19 +---------
 .../selftests/net/srv6_hencap_red_l3vpn_test.sh    | 19 +---------
 .../selftests/net/srv6_hl2encap_red_l2vpn_test.sh  | 19 +---------
 .../selftests/net/test_bridge_backup_port.sh       | 32 +---------------
 .../selftests/net/test_bridge_neigh_suppress.sh    | 33 +---------------
 tools/testing/selftests/net/test_vxlan_mdb.sh      | 32 +---------------
 .../selftests/net/test_vxlan_nolocalbypass.sh      | 32 +---------------
 .../selftests/net/test_vxlan_vnifiltering.sh       | 26 +------------
 tools/testing/selftests/net/vrf-xfrm-tests.sh      | 19 +---------
 tools/testing/selftests/net/vrf_route_leaking.sh   | 19 +---------
 .../testing/selftests/net/vrf_strict_mode_test.sh  | 19 +---------
 33 files changed, 73 insertions(+), 716 deletions(-)

diff --git a/tools/testing/selftests/net/drop_monitor_tests.sh b/tools/testing/selftests/net/drop_monitor_tests.sh
index 507d0a82f5f0..7da85608561b 100755
--- a/tools/testing/selftests/net/drop_monitor_tests.sh
+++ b/tools/testing/selftests/net/drop_monitor_tests.sh
@@ -18,18 +18,7 @@ DEVLINK_DEV=netdevsim/${DEV}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 setup()
diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index 890c3f8e51bb..a50609535fed 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -97,34 +97,7 @@ fi
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-	local ans
-
-	[ "${VERBOSE}" = "1" ] && echo
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "TEST: %-70s  [ OK ]\n" "${msg}"
-	else
-		nfail=$((nfail+1))
-		printf "TEST: %-70s  [FAIL]\n" "${msg}"
-		echo "    expected rc $expected; actual rc $rc"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read ans
-			[ "$ans" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read ans
-		[ "$ans" = "q" ] && exit 1
-	fi
+	log_test_expected "$1" "$2" "$3"
 
 	kill_procs
 }
diff --git a/tools/testing/selftests/net/fdb_flush.sh b/tools/testing/selftests/net/fdb_flush.sh
index 9931a1e36e3d..4965e52d5ef5 100755
--- a/tools/testing/selftests/net/fdb_flush.sh
+++ b/tools/testing/selftests/net/fdb_flush.sh
@@ -67,40 +67,7 @@ run_cmd()
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-	local nsuccess
-	local nfail
-	local ret
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 MAC_POOL_1="
diff --git a/tools/testing/selftests/net/fib-onlink-tests.sh b/tools/testing/selftests/net/fib-onlink-tests.sh
index e0d45292a298..a26075abf7d2 100755
--- a/tools/testing/selftests/net/fib-onlink-tests.sh
+++ b/tools/testing/selftests/net/fib-onlink-tests.sh
@@ -85,23 +85,7 @@ PBR_TABLE=101
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "    TEST: %-50s  [ OK ]\n" "${msg}"
-	else
-		nfail=$((nfail+1))
-		printf "    TEST: %-50s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 log_section()
diff --git a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
index e85248609af4..bd0b8a053ea1 100755
--- a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
+++ b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
@@ -23,26 +23,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/fib_nexthop_nongw.sh b/tools/testing/selftests/net/fib_nexthop_nongw.sh
index 1ccf56f10171..4d483cb83593 100755
--- a/tools/testing/selftests/net/fib_nexthop_nongw.sh
+++ b/tools/testing/selftests/net/fib_nexthop_nongw.sh
@@ -18,26 +18,7 @@ ret=0
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index 3d347126730a..4fd246ae81f0 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -70,44 +70,7 @@ nsid=100
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		if [[ $rc -eq $ksft_skip ]]; then
-			[[ $ret -eq 0 ]] && ret=$ksft_skip
-			nskip=$((nskip+1))
-			printf "TEST: %-60s  [SKIP]\n" "${msg}"
-		else
-			ret=1
-			nfail=$((nfail+1))
-			printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		fi
-
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
@@ -1230,7 +1193,7 @@ ipv6_fcnal_runtime()
 		run_cmd "ip netns exec $me ping -c1 -w$PING_TIMEOUT 2001:db8:101::1"
 		log_test $? 0 "Ping - group blackhole replaced with gateways"
 	else
-		log_test 2 0 "Ping - multipath failed"
+		log_test $rc 0 "Ping - multipath failed"
 	fi
 
 	#
@@ -1887,7 +1850,7 @@ ipv4_fcnal_runtime()
 		run_cmd "ip netns exec $me ping -c1 -w$PING_TIMEOUT 172.16.101.1"
 		log_test $? 0 "Ping - group blackhole replaced with gateways"
 	else
-		log_test 2 0 "Ping - multipath failed"
+		log_test $rc 0 "Ping - multipath failed"
 	fi
 
 	#
@@ -2701,7 +2664,6 @@ done
 if [ "$TESTS" != "none" ]; then
 	printf "\nTests passed: %3d\n" ${nsuccess}
 	printf "Tests failed: %3d\n"   ${nfail}
-	printf "Tests skipped: %2d\n"  ${nskip}
 fi
 
 exit $ret
diff --git a/tools/testing/selftests/net/fib_rule_tests.sh b/tools/testing/selftests/net/fib_rule_tests.sh
index 5fbdd2a0b537..5d66b00e61b2 100755
--- a/tools/testing/selftests/net/fib_rule_tests.sh
+++ b/tools/testing/selftests/net/fib_rule_tests.sh
@@ -31,24 +31,7 @@ SELFTEST_PATH=""
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 setup()
diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index b338bfb196a2..7df967a2d669 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -24,31 +24,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 setup()
diff --git a/tools/testing/selftests/net/gre_gso.sh b/tools/testing/selftests/net/gre_gso.sh
index 5100d90f92d2..4ebe1ed6e9c9 100755
--- a/tools/testing/selftests/net/gre_gso.sh
+++ b/tools/testing/selftests/net/gre_gso.sh
@@ -16,31 +16,7 @@ PID=
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 setup()
diff --git a/tools/testing/selftests/net/icmp_redirect.sh b/tools/testing/selftests/net/icmp_redirect.sh
index b13c89a99ecb..e50860e60cbe 100755
--- a/tools/testing/selftests/net/icmp_redirect.sh
+++ b/tools/testing/selftests/net/icmp_redirect.sh
@@ -61,28 +61,7 @@ log_section()
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-	local xfail=$4
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	elif [ ${rc} -eq ${xfail} ]; then
-		printf "TEST: %-60s  [XFAIL]\n" "${msg}"
-		nxfail=$((nxfail+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 log_debug()
@@ -303,7 +282,7 @@ check_exception()
 		ip -netns $h1 ro get ${H1_VRF_ARG} ${H2_N2_IP} | \
 		grep -E -v 'mtu|redirected' | grep -q "cache"
 	fi
-	log_test $? 0 "IPv4: ${desc}" 0
+	log_test $? 0 "IPv4: ${desc}"
 
 	# No PMTU info for test "redirect" and "mtu exception plus redirect"
 	if [ "$with_redirect" = "yes" ] && [ "$desc" != "redirect exception plus mtu" ]; then
@@ -319,7 +298,7 @@ check_exception()
 		ip -netns $h1 -6 ro get ${H1_VRF_ARG} ${H2_N2_IP6} | \
 		grep -v "mtu" | grep -q "${R1_LLADDR}"
 	fi
-	log_test $? 0 "IPv6: ${desc}" 1
+	log_test $? 0 "IPv6: ${desc}"
 }
 
 run_ping()
@@ -530,6 +509,5 @@ fi
 
 printf "\nTests passed: %3d\n" ${nsuccess}
 printf "Tests failed: %3d\n"   ${nfail}
-printf "Tests xfailed: %3d\n"  ${nxfail}
 
 exit $ret
diff --git a/tools/testing/selftests/net/l2tp.sh b/tools/testing/selftests/net/l2tp.sh
index 88de7166c8ae..41e8b19d1bd3 100755
--- a/tools/testing/selftests/net/l2tp.sh
+++ b/tools/testing/selftests/net/l2tp.sh
@@ -23,24 +23,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 #
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
index d46d2cec89e4..3682a3b55d82 100644
--- a/tools/testing/selftests/net/lib.sh
+++ b/tools/testing/selftests/net/lib.sh
@@ -454,6 +454,37 @@ log_test_xfail()
 	RET=$ksft_xfail retmsg= log_test "$@"
 }
 
+# Log test result with expected return value
+log_test_expected()
+{
+	local rc=$1
+	local expected=$2
+	local msg="$3"
+
+	if [ "${rc}" -eq "${expected}" ]; then
+		nsuccess=$((nsuccess+1))
+		printf "TEST: %-60s  [ OK ]\n" "${msg}"
+	else
+		ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")
+		nfail=$((nfail+1))
+		printf "TEST: %-60s  [FAIL]\n" "${msg}"
+		if [ "$VERBOSE" = "1" ]; then
+			echo "    rc=$rc, expected $expected"
+		fi
+
+		pause_on_fail
+	fi
+
+	if [ "${PAUSE}" = "yes" ]; then
+		echo
+		echo "hit enter to continue, 'q' to quit"
+		read -r a
+		[ "$a" = "q" ] && exit 1
+	fi
+
+	[ "$VERBOSE" = "1" ] && echo
+}
+
 log_info()
 {
 	local msg=$1
diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
index 5db69dad0cfc..89072d30fc59 100755
--- a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
+++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
@@ -30,31 +30,7 @@ tcpdump_stderr=
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 setup()
diff --git a/tools/testing/selftests/net/srv6_encap_lookup_l3vpn_test.sh b/tools/testing/selftests/net/srv6_encap_lookup_l3vpn_test.sh
index d6249303b7ea..8241de6827de 100755
--- a/tools/testing/selftests/net/srv6_encap_lookup_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_encap_lookup_l3vpn_test.sh
@@ -202,24 +202,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read -r a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
index 50e37d3217ea..900a2ae42335 100755
--- a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
@@ -208,24 +208,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
index a649dba3cb77..50c636e84255 100755
--- a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
@@ -177,24 +177,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
index e408406d8489..1f785a7704be 100755
--- a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
@@ -178,24 +178,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
index e23210aa547f..aeddbef536d6 100755
--- a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
@@ -111,8 +111,8 @@
 # +---------------------------------------------------+
 #
 
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
+# shellcheck source=lib.sh
+source lib.sh
 
 readonly IPv6_RT_NETWORK=2001:11
 readonly IPv4_HS_NETWORK=10.0.0
@@ -126,24 +126,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
index 9e69a2ed5bc3..8fbeda1372e1 100755
--- a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
@@ -111,8 +111,8 @@
 # +---------------------------------------------------+
 #
 
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
+# shellcheck source=lib.sh
+source lib.sh
 
 readonly IPv6_RT_NETWORK=2001:11
 readonly IPv6_HS_NETWORK=cafe
@@ -126,24 +126,7 @@ PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 318487eda671..30a939392eea 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -194,8 +194,8 @@
 # after the IPv6 header. At this point, the packet with IPv6 DA=cafe::1 is sent
 # to the destination, i.e. hs-1.
 
-# Kselftest framework requirement - SKIP code is 4.
-readonly ksft_skip=4
+# shellcheck source=lib.sh
+source lib.sh
 
 readonly RDMSUFF="$(mktemp -u XXXXXXXX)"
 readonly DUMMY_DEVNAME="dum0"
@@ -224,24 +224,7 @@ nfail=0
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_next_csid_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_next_csid_l3vpn_test.sh
index 4bc135e5c22c..2e2ae21974ae 100755
--- a/tools/testing/selftests/net/srv6_end_next_csid_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_next_csid_l3vpn_test.sh
@@ -323,24 +323,7 @@ nfail=0
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_end_x_next_csid_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_x_next_csid_l3vpn_test.sh
index 34b781a2ae74..b492a7f0297f 100755
--- a/tools/testing/selftests/net/srv6_end_x_next_csid_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_x_next_csid_l3vpn_test.sh
@@ -368,24 +368,7 @@ nfail=0
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
index cd7d061e21f8..64ea4e2308b6 100755
--- a/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_hencap_red_l3vpn_test.sh
@@ -197,24 +197,7 @@ HAS_TUNSRC=false
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/srv6_hl2encap_red_l2vpn_test.sh b/tools/testing/selftests/net/srv6_hl2encap_red_l2vpn_test.sh
index 0979b5316fdf..31e41cc4922e 100755
--- a/tools/testing/selftests/net/srv6_hl2encap_red_l2vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_hl2encap_red_l2vpn_test.sh
@@ -146,24 +146,7 @@ nfail=0
 
 log_test()
 {
-	local rc="$1"
-	local expected="$2"
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()
diff --git a/tools/testing/selftests/net/test_bridge_backup_port.sh b/tools/testing/selftests/net/test_bridge_backup_port.sh
index 2a7224fe74f2..8bc76be2b2d3 100755
--- a/tools/testing/selftests/net/test_bridge_backup_port.sh
+++ b/tools/testing/selftests/net/test_bridge_backup_port.sh
@@ -56,37 +56,7 @@ PING_TIMEOUT=5
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/test_bridge_neigh_suppress.sh b/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
index e9ed0d750996..e42157907993 100755
--- a/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
+++ b/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
@@ -72,38 +72,7 @@ PAUSE=no
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		# shellcheck disable=SC2154
-		ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 	return 0
 }
 
diff --git a/tools/testing/selftests/net/test_vxlan_mdb.sh b/tools/testing/selftests/net/test_vxlan_mdb.sh
index 58da5de99ac4..cffbd9343d56 100755
--- a/tools/testing/selftests/net/test_vxlan_mdb.sh
+++ b/tools/testing/selftests/net/test_vxlan_mdb.sh
@@ -133,37 +133,7 @@ PAUSE=no
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/test_vxlan_nolocalbypass.sh b/tools/testing/selftests/net/test_vxlan_nolocalbypass.sh
index b8805983b728..c51ca0b532dd 100755
--- a/tools/testing/selftests/net/test_vxlan_nolocalbypass.sh
+++ b/tools/testing/selftests/net/test_vxlan_nolocalbypass.sh
@@ -24,37 +24,7 @@ PAUSE=no
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "$VERBOSE" = "1" ]; then
-			echo "    rc=$rc, expected $expected"
-		fi
-
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
-
-	[ "$VERBOSE" = "1" ] && echo
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
index 8deacc565afa..6fb5af013dac 100755
--- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
+++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
@@ -98,31 +98,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-		echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
-
-	if [ "${PAUSE}" = "yes" ]; then
-		echo
-		echo "hit enter to continue, 'q' to quit"
-		read a
-		[ "$a" = "q" ] && exit 1
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/vrf-xfrm-tests.sh b/tools/testing/selftests/net/vrf-xfrm-tests.sh
index b64dd891699d..a4617e5dace7 100755
--- a/tools/testing/selftests/net/vrf-xfrm-tests.sh
+++ b/tools/testing/selftests/net/vrf-xfrm-tests.sh
@@ -35,24 +35,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
 #
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd_host1()
diff --git a/tools/testing/selftests/net/vrf_route_leaking.sh b/tools/testing/selftests/net/vrf_route_leaking.sh
index ce34cb2e6e0b..abf106e0f0c0 100755
--- a/tools/testing/selftests/net/vrf_route_leaking.sh
+++ b/tools/testing/selftests/net/vrf_route_leaking.sh
@@ -99,24 +99,7 @@ log_section()
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ "${rc}" -eq "${expected}" ]; then
-		printf "TEST: %-60s  [ OK ]\n" "${msg}"
-		nsuccess=$((nsuccess+1))
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read -r a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/vrf_strict_mode_test.sh b/tools/testing/selftests/net/vrf_strict_mode_test.sh
index 01552b542544..7de1873362ba 100755
--- a/tools/testing/selftests/net/vrf_strict_mode_test.sh
+++ b/tools/testing/selftests/net/vrf_strict_mode_test.sh
@@ -16,24 +16,7 @@ TESTS="init testns mix"
 
 log_test()
 {
-	local rc=$1
-	local expected=$2
-	local msg="$3"
-
-	if [ ${rc} -eq ${expected} ]; then
-		nsuccess=$((nsuccess+1))
-		printf "\n    TEST: %-60s  [ OK ]\n" "${msg}"
-	else
-		ret=1
-		nfail=$((nfail+1))
-		printf "\n    TEST: %-60s  [FAIL]\n" "${msg}"
-		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
-			echo
-			echo "hit enter to continue, 'q' to quit"
-			read a
-			[ "$a" = "q" ] && exit 1
-		fi
-	fi
+	log_test_expected "$1" "$2" "$3"
 }
 
 print_log_test_results()

---
base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
change-id: 20260812-self_log_test-b76eaf73e23f

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

