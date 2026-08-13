Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6196643F4AD
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608769; cv=none; b=SPzgSXahPIf65KqTtoZBb6S0lT+IgfL1OPJjudEVwAorWeXQORZ2tPoytZqUraH1NkESAij9v1A4ee6v4lgFkchyWfViEzg6kK+QUX8B9jhm7EtLSXatGiTQqsz0vOo8svqJqYCCUUoztxhmvFPdyu7CiGDVlj1p16hr+SyvUbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608769; c=relaxed/simple;
	bh=G8QYV6FvStJP+UC6QsjD1IYgOcGuh5imddzIrcluMyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K+fM9G4krMCfZEA6MWfRsSCAZMqSOr5P72slgCiSucI/az649ExkYDV9qcrRfxvZRgTQfczSy96aNA11PLW94qT3MaPcMDn9HOrZhX73djYiE3RD6NLY5y7gEFv8RU+j4NTGQP/GVjC6EyHBsWE881ezQAfyDXNUWBp4cO2gJEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KejMFBlU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KejMFBlU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso518115a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786608760; x=1787213560; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1j1sUAC3C/yTTUAzBkUtjOwWCjnzjXaw/8AgTZR/C10=;
        b=KejMFBlULJejaCDYYPmWqSV4FeDwUlKVnDwC++XSnGr4CCXVf0UQYoUI1RJXeO7P0t
         7UqDMhn+vfhOz3tmdvK03ZkWunBxF/k3GRQYjbo6keN20UHuh2WvHBdgr7efCxUvuEUa
         xc68wbOOwhU1vLiFuOstD6/YEg3jOLoqeCHdjqoebhbd04TXYr69/f862s7fwZlTs/kw
         pWJivZORYBN/0VfFlaxdXUVP+p2dRG9Ds6ZgVrl1SuH8QFHbscBf50oUFTIAng/dYSPa
         kDU7zdyiMoasSjRByKTrN6rs12L7ZXJ66K0C7Ww5To1kpVx7AThxkRgOckp2fiBrZzVw
         YZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608760; x=1787213560;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1j1sUAC3C/yTTUAzBkUtjOwWCjnzjXaw/8AgTZR/C10=;
        b=f3k5zmxNsBvusVm3UwFK4p+4ra7I1rHK6lmQY3c9N7zJ/tUC+iCl4F58Smvs/LxUvC
         bb1Svf7MIAmSTYkH/qrqvnSsA3Z0XwaVP6WHTScKmdqfe7AEmel2zTUxicURuT9v5chs
         Xxj+QDeZaPaPgygwzZ5cS6imt8ZzhCBlE8SZ57ROSIHn5VE+hExW6akj/02iNgjLQITO
         pdWPl6rDuFs10znugFyM/au+uln+ulSRMTZXmogrO2+OUDoeNBdTejzFjeny+znn1447
         awCikHg8VKi2/uy3qUGvu8SSvN5xrR6YFk69NR8BIhVeRLboup4WBc273H80EYkmPwk/
         C1/A==
X-Forwarded-Encrypted: i=1; AHgh+RoMf3QPnt4lnyJV0u+aVLq4C9Er35Ne+CsKGb/J7V5d9alRGXMeZedeLZB/z4Yji2dVgMol4nr90S3xB9c54To=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJk2sbSfVWg00I95lGDxnl6So7gdz6KCeABOiKuWQ+twQGvLCN
	pIgYHFtBvqUSZLomw3mypOKWmE7w+fUGeaN+GElXsOzifh7IcKzAiYU6
X-Gm-Gg: AR+sD12quYL6j/dekt/6myhDIIXhtYB1aP/AfMd82j/FJUXVW0N0m1Bi0GQbrAdA1Bk
	FW3fuaBovSrLgUVyEZ2X9QEDhvyxG+vieDMtNFy+r8XqraZznqpn2evlasCxUoex5Yp4fU/9ZML
	koK6D/n/Iiy9DrJYXY/IJrhh1LWKd5j+qyY9r7P6iy84iHU53CaOy5WLKga55YCEMMSKlJeJGO0
	qBvTllUQiAAHbqn23c3iskMu8Bv7eRKHKGt0C85rKNgnJctwlelOuz1Vtqs1oXRuPqUbczOuLii
	e8IDxS/NJctVy21xmXbkoLI6mChA6xw2l7AtczVr8aE227NqgEh9lSHwuYnAd4XZV9wHsSZMC8Q
	alcbkp3eykDHfTBWZWK0GNAwllvemt+C2QZEDIx9xLlnW4MOiXOPfzqXXmy9Yee3a8oxYO4JqRH
	Cp5RVdoOgZ3HpqkzyJazsIGO37+B2OtRATE5D0mdAZ4suKT0Ldb5Krmd77rOaOLuvpCEUG73aZE
	K+TH1rrZaI=
X-Received: by 2002:a17:90a:e7c8:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3931f5b9ec6mr2235417a91.16.1786608759602;
        Thu, 13 Aug 2026 01:12:39 -0700 (PDT)
Received: from [192.168.110.119] ([216.236.36.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cce9897sm2386764a91.4.2026.08.13.01.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:12:37 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
Date: Thu, 13 Aug 2026 16:11:57 +0800
Subject: [PATCH net-next] selftests: net: move log_test to lib file and
 remove duplicate code
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MWwqAIBBG4a3EPCeUgUVbiYguvzUQFo6EIO096
 fF7OCeRwDOE+iKRx8PCl8uoy4LWY3Y7FG/ZpCttqq7WSnDa6bz2KUCCWlqD2bYNdGMpN7eH5fj
 /BnIIyiEGGt/3A8RQAqNpAAAA
X-Change-ID: 20260812-self_log_test-b76eaf73e23f
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

When reviewing the test code, I saw many tests using the same or similar
log_test functions. We can move them to lib.sh to save effort. However,
due to historical reasons, we moved the log_test from the forwarding lib
first, which has different usage. So, rename the log_test in the net
folder to log_test_expected. Since renaming all the log_test functions
in the test cases would change too many lines, I just use a wrapper in
the old code.

The fourth argument in icmp_redirect.sh is not needed, as the xfail issue
has already been fixed and it should always pass. But I still keep the
xfail logic in the log_test in lib.sh in case other tests need it.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/drop_monitor_tests.sh  | 13 +-------
 tools/testing/selftests/net/fcnal-test.sh          | 29 +---------------
 tools/testing/selftests/net/fdb_flush.sh           | 35 +------------------
 tools/testing/selftests/net/fib-onlink-tests.sh    | 18 +---------
 .../selftests/net/fib_nexthop_multiprefix.sh       | 21 +-----------
 tools/testing/selftests/net/fib_nexthop_nongw.sh   | 21 +-----------
 tools/testing/selftests/net/fib_nexthops.sh        | 39 +---------------------
 tools/testing/selftests/net/fib_rule_tests.sh      | 19 +----------
 tools/testing/selftests/net/fib_tests.sh           | 26 +--------------
 tools/testing/selftests/net/gre_gso.sh             | 26 +--------------
 tools/testing/selftests/net/icmp_redirect.sh       | 27 ++-------------
 tools/testing/selftests/net/l2tp.sh                | 19 +----------
 tools/testing/selftests/net/lib.sh                 | 38 +++++++++++++++++++++
 .../selftests/net/ndisc_unsolicited_na_test.sh     | 26 +--------------
 .../selftests/net/srv6_encap_lookup_l3vpn_test.sh  | 19 +----------
 .../selftests/net/srv6_end_dt46_l3vpn_test.sh      | 19 +----------
 .../selftests/net/srv6_end_dt4_l3vpn_test.sh       | 19 +----------
 .../selftests/net/srv6_end_dt6_l3vpn_test.sh       | 19 +----------
 .../selftests/net/srv6_end_dx4_netfilter_test.sh   | 23 ++-----------
 .../selftests/net/srv6_end_dx6_netfilter_test.sh   | 23 ++-----------
 .../testing/selftests/net/srv6_end_flavors_test.sh | 23 ++-----------
 .../selftests/net/srv6_end_next_csid_l3vpn_test.sh | 19 +----------
 .../net/srv6_end_x_next_csid_l3vpn_test.sh         | 19 +----------
 .../selftests/net/srv6_hencap_red_l3vpn_test.sh    | 19 +----------
 .../selftests/net/srv6_hl2encap_red_l2vpn_test.sh  | 19 +----------
 .../selftests/net/test_bridge_backup_port.sh       | 32 +-----------------
 .../selftests/net/test_bridge_neigh_suppress.sh    | 34 +------------------
 tools/testing/selftests/net/test_vxlan_mdb.sh      | 32 +-----------------
 .../selftests/net/test_vxlan_nolocalbypass.sh      | 32 +-----------------
 .../selftests/net/test_vxlan_vnifiltering.sh       | 26 +--------------
 tools/testing/selftests/net/vrf-xfrm-tests.sh      | 19 +----------
 tools/testing/selftests/net/vrf_route_leaking.sh   | 19 +----------
 .../testing/selftests/net/vrf_strict_mode_test.sh  | 19 +----------
 33 files changed, 78 insertions(+), 713 deletions(-)

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
index 3d347126730a..16fe92775ae0 100755
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
index b13c89a99ecb..0107af73aef4 100755
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
index d46d2cec89e4..e02a6a91ff91 100644
--- a/tools/testing/selftests/net/lib.sh
+++ b/tools/testing/selftests/net/lib.sh
@@ -454,6 +454,44 @@ log_test_xfail()
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
+	elif [ "${rc}" -eq "${ksft_skip}" ]; then
+		[[ "$ret" -eq 0 ]] && ret="$ksft_skip"
+		nskip=$((nskip+1))
+		printf "TEST: %-60s  [SKIP]\n" "${msg}"
+	elif [ "${rc}" -eq "${ksft_xfail}" ]; then
+		nxfail=$((nxfail+1))
+		printf "TEST: %-60s  [XFAIL]\n" "${msg}"
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
base-commit: ac155a26750a595703e7dadff84735456d75a479
change-id: 20260812-self_log_test-b76eaf73e23f

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

