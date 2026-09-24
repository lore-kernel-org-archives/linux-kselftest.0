Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517742E42C
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236092; cv=none; b=uOP6kYMWzevJp48okKFm2UaEf8MqtJ5rudI6ZWHY9rNwAHvLXBdEI/iuOxtOAwT/QR4Is3zEhMyCvJybRW+eWZxp9xS/Z1sFjrbCr2sp68gpne0k4CEwRw2lQUAT4IJ9LWP/47XnGDQtRPvQCh1fLLusBYyUOEn/SNFVwJEQfqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236092; c=relaxed/simple;
	bh=bH274XugTDBg+Ol2Bj/ZxdXGPoi6sO7mSG6A3PNRQzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NP5oLo8hTbFnsyaz94ojpVE9k/fnYuSpB6iw51Y/UYGiz5Bzi7vIBZ/M1aS0h83n3SaVehWNdq8beNwSKKNRQMLxe3oYuQ4ybHb3iaDBijLJxH2AgPkGTJ1+gpDM3KCK6FWsmzsJvFdKIhQ/SFHsC0asFPptluKtutN8lC0DD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lg1enmjG; arc=none smtp.client-ip=91.218.175.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lg1enmjG"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bH274XugTDBg+Ol2Bj/ZxdXGPoi6sO7mSG6A3PNRQzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790236087; v=1; x=1790840887;
 b=Lg1enmjGbffZrMhdsBSHpQc1gNY+BcfoB2gU7u4Uu38ra5Esda53tcu7HgXrAFdcaEKMDvyO
 SGGk2RW+1xL5eAqyrG6pYYppygLUsFp69WYJd7e38szkBRWWi4McOvb0rbkwTzioEgA0zxGNRlI
 jBBSPdyuux0SUI4NVsbfhBpE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d255814f95ed67a1;
	Thu, 24 Sep 2026 07:48:07 +0000
X-Mizu-Trace-ID: d255814f95ed67a1
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 24 Sep 2026 15:47:56 +0800
Subject: [PATCH net-next v5] selftests: net: move log_test to lib file and
 remove duplicate code
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-self_log_test-v5-1-1f00bd383146@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQ0YrDIBAF0F8pPq+LMxo1+7T/sZSQmrGVDWaJI
 i0h/14JhXbTx8vl3IFZWKI5UGJfh4XNVEIKU6yh+Tgwd+njmXgYamYoUAsLyBONvhunc5cpZX4
 ymnpvJKH0rJq/mXy4bns/LFLmka6ZHWtzCSlP8207VGDrH5tyt1mAA/fWngCEsQrp+/c2hjilT
 xe3qYIvXMKeY+U09EhWtcL59o3LJ2+h2XNZeQ/GoAWjpVRvXL1w3D+kqMqV0422Arwd3D++rus
 d7bETanIBAAA=
X-Change-ID: 20260812-self_log_test-b76eaf73e23f
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Many test scripts under tools/testing/selftests/net/ each define their
own log_test() function with near-identical logic for comparing a return
code against an expected value and printing OK/FAIL. Add a shared
log_test_expected() to lib.sh so we can replace each local definitions.

The function is named log_test_expected() rather than log_test() because
lib.sh already exports log_test() with a different signature used by
the forwarding tests.

Most of the checks in log_test_expected() are the same as log_test()
in other tests. The differences are:

- The function always returns 0 to avoid influencing later code.
- On failure with VERBOSE=1, the actual and expected return codes are
  printed (echo "    rc=$rc, expected $expected").
- A PAUSE_ON_FAIL check is added via pause_on_fail() for scripts that
  did not have one.
- A PAUSE=yes check is added for scripts that did not have one.
- A trailing [ "$VERBOSE" = "1" ] && echo is added for scripts that
  did not have one.

Several tests required special handling:

- fcnal-test.sh
  - Print format: it uses %-70s, while log_test_expected() uses %-60s.
  - The old code always printed "expected rc $expected; actual rc $rc"
    on failure. The new code only prints when VERBOSE=1.
  - The old [ "${VERBOSE}" = "1" ] && echo ran before the comparison;
    now it runs after the PAUSE check.
- fdb_flush.sh
  - It used local ret, nsuccess, and nfail, which are not used outside
    the function. The log_test_expected() uses global variables as all
    other tests do.
- fib-onlink-tests.sh
  - Print format: it uses %-50s, while log_test_expected() uses %-60s.
- srv6_end_dx*.sh and srv6_end_flavors_test.sh
  - These three tests previously defined ksft_skip locally instead of
    sourcing lib.sh. They now source lib.sh, which provides ksft_skip
    and other framework constants. Note that srv6_end_flavors_test.sh
    previously declared ksft_skip as readonly; the lib.sh definition
    does not use readonly.
- test_bridge_neigh_suppress.sh
  - The test use ksft_exit_status_merge "$ret" "$ksft_fail", which always
    set ret=1 as ksft_fail has the maximum weight. So in the lib we
    just discarded ksft_exit_status_merge and set ret to 1 directly.

In addition to the above, 13 tests that previously used "TEST:" now use
"    TEST:" (4-space prefix), and srv6 tests plus vrf_strict_mode_test.sh
that previously used "\n    TEST:" (newline + 4-space prefix) now with no
leading newline.

The fib_nexthops.sh test is skipped because it has a ksft_skip check that
needs special handling.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Sashiko previously reported two issues that are unrelated to this patch.

- fdb_flush.sh, fib-onlink-tests.sh and l2tp.sh can print [FAIL]
  subtests while exiting with status 0.
- fib_tests.sh uses the same global `ret` that the shared helper
  treats as cumulative exit status as per-test scratch storage.

These issues will be addressed in separate patches since they are not
related to this one.

Changes in v5:
- define "local a" in log_test_expected as fcnal-test.sh also uses "a" in sub tests.
  Not using other variable name as this could protect pause_on_fail which also uses "a".
- Link to v4: https://lore.kernel.org/r/20260922-self_log_test-v4-1-4c656801f8dc@kylinos.cn

Changes in v4:
- drop the fib_nexthops.sh change since it need special handle for nskip (sashiko)
- set ret=1 in the lib function (sashiko)
- Link to v3: https://lore.kernel.org/r/20260915-self_log_test-v3-1-a17728176334@kylinos.cn

Changes in v3:
- Always return 0 for log_test_expected (Jakub)
- Add detailed change log in commit description.
- Link to v2: https://lore.kernel.org/r/20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn

Changes in v2:
- Remove skip/xfail checking in lib.sh, as any command can exits with 2 or 4 (sashiko)
- Remove nskip counter in fib_nexthops.sh
- Link to v1: https://lore.kernel.org/r/20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn
---
 tools/testing/selftests/net/drop_monitor_tests.sh  | 13 +-------
 tools/testing/selftests/net/fcnal-test.sh          | 29 +-----------------
 tools/testing/selftests/net/fdb_flush.sh           | 35 +---------------------
 tools/testing/selftests/net/fib-onlink-tests.sh    | 18 +----------
 .../selftests/net/fib_nexthop_multiprefix.sh       | 21 +------------
 tools/testing/selftests/net/fib_nexthop_nongw.sh   | 21 +------------
 tools/testing/selftests/net/fib_rule_tests.sh      | 19 +-----------
 tools/testing/selftests/net/fib_tests.sh           | 26 +---------------
 tools/testing/selftests/net/gre_gso.sh             | 26 +---------------
 tools/testing/selftests/net/icmp_redirect.sh       | 19 +-----------
 tools/testing/selftests/net/l2tp.sh                | 19 +-----------
 tools/testing/selftests/net/lib.sh                 | 34 +++++++++++++++++++++
 .../selftests/net/ndisc_unsolicited_na_test.sh     | 26 +---------------
 .../selftests/net/srv6_encap_lookup_l3vpn_test.sh  | 19 +-----------
 .../selftests/net/srv6_end_dt46_l3vpn_test.sh      | 19 +-----------
 .../selftests/net/srv6_end_dt4_l3vpn_test.sh       | 19 +-----------
 .../selftests/net/srv6_end_dt6_l3vpn_test.sh       | 19 +-----------
 .../selftests/net/srv6_end_dx4_netfilter_test.sh   | 23 ++------------
 .../selftests/net/srv6_end_dx6_netfilter_test.sh   | 23 ++------------
 .../testing/selftests/net/srv6_end_flavors_test.sh | 23 ++------------
 .../selftests/net/srv6_end_next_csid_l3vpn_test.sh | 19 +-----------
 .../net/srv6_end_x_next_csid_l3vpn_test.sh         | 19 +-----------
 .../selftests/net/srv6_hencap_red_l3vpn_test.sh    | 19 +-----------
 .../selftests/net/srv6_hl2encap_red_l2vpn_test.sh  | 19 +-----------
 .../selftests/net/test_bridge_backup_port.sh       | 32 +-------------------
 .../selftests/net/test_bridge_neigh_suppress.sh    | 34 +--------------------
 tools/testing/selftests/net/test_vxlan_mdb.sh      | 32 +-------------------
 .../selftests/net/test_vxlan_nolocalbypass.sh      | 32 +-------------------
 .../selftests/net/test_vxlan_vnifiltering.sh       | 26 +---------------
 tools/testing/selftests/net/vrf-xfrm-tests.sh      | 19 +-----------
 tools/testing/selftests/net/vrf_route_leaking.sh   | 19 +-----------
 .../testing/selftests/net/vrf_strict_mode_test.sh  | 19 +-----------
 32 files changed, 71 insertions(+), 669 deletions(-)

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
index 35357d02e823..e724f895ae2c 100755
--- a/tools/testing/selftests/net/icmp_redirect.sh
+++ b/tools/testing/selftests/net/icmp_redirect.sh
@@ -61,24 +61,7 @@ log_section()
 
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
 
 log_debug()
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
index d46d2cec89e4..b31bd6f6efd8 100644
--- a/tools/testing/selftests/net/lib.sh
+++ b/tools/testing/selftests/net/lib.sh
@@ -454,6 +454,40 @@ log_test_xfail()
 	RET=$ksft_xfail retmsg= log_test "$@"
 }
 
+# Log test result with expected return value
+log_test_expected()
+{
+	local rc=$1
+	local expected=$2
+	local msg="$3"
+	local a
+
+	if [ "${rc}" -eq "${expected}" ]; then
+		nsuccess=$((nsuccess+1))
+		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
+	else
+		ret="$ksft_fail"
+		nfail=$((nfail+1))
+		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
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
+
+	return 0
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
index 037e5fe1da2a..260170dc8443 100755
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
index 9a29e0d6c912..6d4d6a23ecc4 100755
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
index e9ed0d750996..9d2dc0faf741 100755
--- a/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
+++ b/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
@@ -72,39 +72,7 @@ PAUSE=no
 
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
-	return 0
+	log_test_expected "$1" "$2" "$3"
 }
 
 run_cmd()
diff --git a/tools/testing/selftests/net/test_vxlan_mdb.sh b/tools/testing/selftests/net/test_vxlan_mdb.sh
index f9600aabd4a2..2ebb4d8a3026 100755
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
base-commit: 528de6832b2194ae0b1d62b0925e0ac6cad1087c
change-id: 20260812-self_log_test-b76eaf73e23f

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

