Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59F82DB78C
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 01:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647043; cv=none; b=hUDeyo9U11KDHj74syR7U9bJY3d4V800DpUTJ370CqNBCDsPcUsHXtPXdDIxY55hls5v7A7EpD0SbGKEI++ZVt53SJ2c+gSPcor+vf1tcSJLNZdC5SDwpWzCzc3Q+HEM3nwPmeoXWu19GXdZl2Px0YvRNN3LpeDpNmGFms1jQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647043; c=relaxed/simple;
	bh=PIpaOhaxNUj5p39NIRWj1/IzJ+oNM7ndFQiuq7U/4OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HbnrypfZhzmJDjXWmiJqFmvrdxL7waJNvtMCLGsgCF17Mc+zj8+1hzngjpaASh1q4Isg0/p4Thvk9a8WbHoiK9exBxVzOMbIiAI7161BbegwYN5Bdc7srXEfv5VFwI8wqZ6d1VBmFA2TQ++mk4ncx5Eko2nJqukhdOTVqORnKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jJEanMdq; arc=none smtp.client-ip=91.218.175.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jJEanMdq"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PIpaOhaxNUj5p39NIRWj1/IzJ+oNM7ndFQiuq7U/4OY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790647038; v=1; x=1791251838;
 b=jJEanMdqL3UFc2ls72u1krsTljt7l/xA1tCTUmkNq2hEvKL1/Tj/1wEjJiVPWFgdPD6Fz7Er
 De4ENNCkYwfdXpnx2flMLA8dzFJ19rv0wG6hXQoLFroeOZ6Sc0ouw9UnirBlIUiHHlH0r5TZNEa
 /MzEGU76Rs295hnMF+ZxDVIE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c5cb103bf4a5bf94;
	Tue, 29 Sep 2026 01:57:18 +0000
X-Mizu-Trace-ID: c5cb103bf4a5bf94
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 29 Sep 2026 09:57:01 +0800
Subject: [PATCH net] selftests: fib_tests: use per-test return value in
 subtests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrA3EgGK8ShEx9Z92QFLJBBGCd
 29w+S3eK6RIAqWpKZRwisovVnRtQ+/vGj8wslWTs26w3o1GsfPCEpYMzWrsZnv2A1YOgWp0JLB
 cz/BFEZnm+/4DvI0wpGUAAAA=
X-Change-ID: 20260928-self_fib_tests-0d05f96eafbb
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, Ido Schimmel <idosch@mellanox.com>, 
 David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

fib_tests mixes use of $ret for both per-test return value and global exit
code. If an earlier subtest fails and a later function sets ret=0, the
script will exit with status 0 even though [FAIL] lines were printed.

Use RET as the per-test return value, as already defined in lib.sh. The
exit code ret will only be set in log_test().

Fixes: 607bd2e502f5 ("selftests: fib_tests: Add test cases for IPv4/IPv6 FIB")
Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/all/178961184152.22033.9267194009793243294@kernel.org
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index b338bfb196a2..9ce5623b049c 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -369,7 +369,7 @@ fib_carrier_local_test()
 
 fib_carrier_unicast_test()
 {
-	ret=0
+	RET=0
 
 	echo
 	echo "Single path route carrier test"
@@ -685,12 +685,12 @@ fib6_notify_test()
 
 	err=`cat errors.txt |grep "Message too long"`
 	if [ -z "$err" ];then
-		ret=0
+		RET=0
 	else
-		ret=1
+		RET=1
 	fi
 
-	log_test $ret 0 "ipv6 route add notify"
+	log_test "$RET" 0 "ipv6 route add notify"
 
 	kill_process %%
 
@@ -732,12 +732,12 @@ fib_notify_test()
 
 	err=`cat errors.txt |grep "Message too long"`
 	if [ -z "$err" ];then
-		ret=0
+		RET=0
 	else
-		ret=1
+		RET=1
 	fi
 
-	log_test $ret 0 "ipv4 route add notify"
+	log_test "$RET" 0 "ipv4 route add notify"
 
 	kill_process %%
 
@@ -763,9 +763,9 @@ check_rt_num()
 
     if [ $num -ne $expected ]; then
 	echo "FAIL: Expected $expected routes, got $num"
-	ret=1
+	RET=1
     else
-	ret=0
+	RET=0
     fi
 }
 
@@ -812,7 +812,7 @@ fib6_gc_test()
 	sleep $GC_WAIT_TIME
 	$NS_EXEC sysctl -wq net.ipv6.route.flush=1
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection"
+	log_test "$RET" 0 "ipv6 route garbage collection"
 
 	reset_dummy_10
 
@@ -830,7 +830,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (with permanent routes)"
+	log_test "$RET" 0 "ipv6 route garbage collection (with permanent routes)"
 
 	reset_dummy_10
 
@@ -848,7 +848,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (replace with expires)"
+	log_test "$RET" 0 "ipv6 route garbage collection (replace with expires)"
 
 	reset_dummy_10
 
@@ -868,7 +868,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 5 $($IP -6 route list |grep -v expires|grep 2001:20::|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (replace with permanent)"
+	log_test "$RET" 0 "ipv6 route garbage collection (replace with permanent)"
 
 	# Delete dummy_10 and remove all routes
 	$IP link del dev dummy_10
@@ -923,7 +923,7 @@ fib6_gc_test()
 	# rt6_nh_dump_exceptions() just skips expired exceptions.
 	$NS_EXEC sysctl -wq net.ipv6.route.flush=1
 	check_rt_num 0 $($IP -6 route list cache | grep 2001:10:: | wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (promote to permanent routes)"
+	log_test "$RET" 0 "ipv6 route garbage collection (promote to permanent routes)"
 
 	$IP neigh del fe80:dead::3 lladdr 00:11:22:33:44:55 dev veth1 router
 	$IP link del veth1
@@ -960,7 +960,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (RA message)"
+	log_test "$RET" 0 "ipv6 route garbage collection (RA message)"
 
 	set +e
 
@@ -1589,7 +1589,7 @@ fib6_ra_to_static()
 	# Expire is back, on-link route is now owned by RA again
 	check_rt_num 2 $($IP -6 route list |grep expires|wc -l)
 
-	log_test $ret 0 "ipv6 promote RA route to static"
+	log_test "$RET" 0 "ipv6 promote RA route to static"
 
 	# Prepare for RA route with gateway
 	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra_rt_info_max_plen=64
@@ -1606,7 +1606,7 @@ fib6_ra_to_static()
 
 	check_rt_num 2 "$($IP -6 route list | grep -c "nexthop via")"
 
-	log_test "$ret" 0 "ipv6 RA route with nexthop do not merge into ECMP with static"
+	log_test "$RET" 0 "ipv6 RA route with nexthop do not merge into ECMP with static"
 
 	set +e
 
@@ -1651,18 +1651,18 @@ fib6_temp_addr_renewal() {
 	# Restore it
 	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#3600 -e
 
-	ret=1
+	RET=1
 	for i in $(seq 1 25); do
 		sleep 1
 		num_dep="$($IP -6 addr | grep -c "temporary deprecated" || true)"
 		num_tot="$($IP -6 addr | grep -c "temporary" || true)"
 
 		if [ "$num_dep" -eq 1 ] && [ "$num_tot" -ge 2 ]; then
-			ret=0
+			RET=0
 			break
 		fi
 	done
-	log_test "$ret" 0 "IPv6 temporary address cleanly deprecated and regenerated"
+	log_test "$RET" 0 "IPv6 temporary address cleanly deprecated and regenerated"
 
 	set +e
 

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20260928-self_fib_tests-0d05f96eafbb

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

