Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E33385A5
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 02:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734009; cv=none; b=MbC9Wo1PmKkH3P9x6w5vvGnJvO9CmfkEl1HcfECIUCica4D57pZjtpN4KXzb+4nAESdfCTSRWrh+gEKiwCqHB/7V9d7DF91oGI6a5wqzrBTDKmt9/t0ggFuVwUQz1Pe24gll45DiT9uBHAMomt2FfvcmzTqtOj46vGWUsMEXZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734009; c=relaxed/simple;
	bh=jMips3+FZBXuIixKWdRfLebaiayb1vhjySsdj1aIq1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PPRnCHXEJPh/TsRjcjq7Zrc6V6pqFZ+bEs9VMtPBGMJ56FjFzfhVrFg3vw7bN2N/xeXLgWryF5G3hZYLsSIj88ri5kTxzFiXjXbxzfj7XxK2AZcFlCfJrSGyOxTbLUvELBoeXAi8c69M1Mrf9xrUAUjrcl5DEm0DZJ5luem08UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ggz0ySXf; arc=none smtp.client-ip=95.215.58.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ggz0ySXf"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jMips3+FZBXuIixKWdRfLebaiayb1vhjySsdj1aIq1Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790734005; v=1; x=1791338805;
 b=ggz0ySXf7UZ8vP7qTyZaRczHPxMfymnYx5TJCl1yAl/aTUuFDi1D+jCCTIQHPn1A1+IKOXk7
 jNo19Y1uP3cTvPjI4F5LWwHg/xJlbAdj4LFyZU/11B/ENiyR9bFuS8z+2vyjgmLxWf3XN1t/CO9
 T9I1nSbyFduuN+2b7J7NFaQI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5d095c98bfbb9fde;
	Wed, 30 Sep 2026 02:06:44 +0000
X-Mizu-Trace-ID: 5d095c98bfbb9fde
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Wed, 30 Sep 2026 10:06:24 +0800
Subject: [PATCH net-next v2] selftests: fib_tests: use per-test return
 value in subtests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-self_fib_tests-v2-1-3053e649d341@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQqDMBBEf0X23JQYqdSe+h9FJImbulSiZENQJ
 P/eID31MIfHMG8OYAyEDI/qgICJmBZfQF0qsJP2bxQ0FgYlVSs7dReMsxscmSEiRxZylDfXtai
 dMVBGa0BH2yl8gccoPG4R+tJMxHEJ+/mU6rP/Sbt/aapFLSRq0+rGNiXPzz6TX/hqPfQ55y98E
 LW5twAAAA==
X-Change-ID: 20260928-self_fib_tests-0d05f96eafbb
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, Ido Schimmel <idosch@mellanox.com>, 
 David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

fib_tests mixes use of $ret for both per-test return value and global exit
code. If an earlier subtest fails and a later function sets ret=0, the
script will exit with status 0 even though [FAIL] lines were printed.

Use RET as the per-test return value, as already defined in lib.sh. The
exit code ret will only be set in log_test().

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v2:
- target to net-next since this doesn't fix a regression (Ido Schimmel)
- remove RET in fib_carrier_unicast_test which is not used (Ido Schimmel)
- Link to v1: https://lore.kernel.org/r/20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn
---
 tools/testing/selftests/net/fib_tests.sh | 40 +++++++++++++++-----------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index b338bfb196a2..47184d201d33 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -369,8 +369,6 @@ fib_carrier_local_test()
 
 fib_carrier_unicast_test()
 {
-	ret=0
-
 	echo
 	echo "Single path route carrier test"
 
@@ -685,12 +683,12 @@ fib6_notify_test()
 
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
 
@@ -732,12 +730,12 @@ fib_notify_test()
 
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
 
@@ -763,9 +761,9 @@ check_rt_num()
 
     if [ $num -ne $expected ]; then
 	echo "FAIL: Expected $expected routes, got $num"
-	ret=1
+	RET=1
     else
-	ret=0
+	RET=0
     fi
 }
 
@@ -812,7 +810,7 @@ fib6_gc_test()
 	sleep $GC_WAIT_TIME
 	$NS_EXEC sysctl -wq net.ipv6.route.flush=1
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection"
+	log_test "$RET" 0 "ipv6 route garbage collection"
 
 	reset_dummy_10
 
@@ -830,7 +828,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (with permanent routes)"
+	log_test "$RET" 0 "ipv6 route garbage collection (with permanent routes)"
 
 	reset_dummy_10
 
@@ -848,7 +846,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (replace with expires)"
+	log_test "$RET" 0 "ipv6 route garbage collection (replace with expires)"
 
 	reset_dummy_10
 
@@ -868,7 +866,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 5 $($IP -6 route list |grep -v expires|grep 2001:20::|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (replace with permanent)"
+	log_test "$RET" 0 "ipv6 route garbage collection (replace with permanent)"
 
 	# Delete dummy_10 and remove all routes
 	$IP link del dev dummy_10
@@ -923,7 +921,7 @@ fib6_gc_test()
 	# rt6_nh_dump_exceptions() just skips expired exceptions.
 	$NS_EXEC sysctl -wq net.ipv6.route.flush=1
 	check_rt_num 0 $($IP -6 route list cache | grep 2001:10:: | wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (promote to permanent routes)"
+	log_test "$RET" 0 "ipv6 route garbage collection (promote to permanent routes)"
 
 	$IP neigh del fe80:dead::3 lladdr 00:11:22:33:44:55 dev veth1 router
 	$IP link del veth1
@@ -960,7 +958,7 @@ fib6_gc_test()
 	# Wait for GC
 	sleep $GC_WAIT_TIME
 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
-	log_test $ret 0 "ipv6 route garbage collection (RA message)"
+	log_test "$RET" 0 "ipv6 route garbage collection (RA message)"
 
 	set +e
 
@@ -1589,7 +1587,7 @@ fib6_ra_to_static()
 	# Expire is back, on-link route is now owned by RA again
 	check_rt_num 2 $($IP -6 route list |grep expires|wc -l)
 
-	log_test $ret 0 "ipv6 promote RA route to static"
+	log_test "$RET" 0 "ipv6 promote RA route to static"
 
 	# Prepare for RA route with gateway
 	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra_rt_info_max_plen=64
@@ -1606,7 +1604,7 @@ fib6_ra_to_static()
 
 	check_rt_num 2 "$($IP -6 route list | grep -c "nexthop via")"
 
-	log_test "$ret" 0 "ipv6 RA route with nexthop do not merge into ECMP with static"
+	log_test "$RET" 0 "ipv6 RA route with nexthop do not merge into ECMP with static"
 
 	set +e
 
@@ -1651,18 +1649,18 @@ fib6_temp_addr_renewal() {
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
base-commit: 8c2493eef43ab8592738a5398c74af268c0fefdf
change-id: 20260928-self_fib_tests-0d05f96eafbb

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

