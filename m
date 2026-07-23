Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E2918CBE1
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 01:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769501; cv=none; b=PYK8grOMvDQFBCqEajStHr8nzBA5cxwX6iKoOJnWKzDQmyh4SzhhYBzTrWUDIKUAwnTe6bQzcJINTzIo3pzTzCpaJVf+0+i7nucI9/3xVVmxQj/PUzTQamrNBNee22ZfWz2QjL1vy1nIVqfi2abSjN5RePL6qv/rO6rtzxpG7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769501; c=relaxed/simple;
	bh=5wHaj7ZOUiFnnwZQ/alCVlhWUyG6yyDr4ttHzSEM7CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiuYi11zVDymqK6BXAAr5YnIIX+xOQ0Mo5LV/DN1xYTLb4KiVhN6iwzmnnZgCc1JskSXHGuo7ugK6eqtNXg0uT0mdVOinx0fXAmfue5v/l8blmcSkx5ow2zYA4/7bQUz2hqiY6OtrISS8BjhJWCRxreriYHzJYLYgAQAy09tJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GP2QWW+V; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GP2QWW+V"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so74766b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769496; x=1785374296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeXwCH2Ww/TWsye8893nOWAwkN7miADAvxyyLX+SPtU=;
        b=GP2QWW+VZOK2rom4sdPM+NHKPqWysNvVXzRrEHU+xSNf/JmjNHme1aeT4O4HJE4Q/6
         0GZYTqOv/zOfXrVmvF6kAHQp9NOnqUehWD+xdMkK3he+Y6LuDFtHFuSUU3DChTRA8DnL
         AcU4vLRt+MTkv1CPqLn7ukNMCdwh0FsTI39e3OF1f73wagy8PPpYkQ2v6NSNuAfppx1/
         YQyMd95Ozey7TJqZKcHJkpGUEgEn4TLh4NY07dFgbVceTEWpi/zjWVYmGgqdhBcfQs/f
         O5Exsh/lJm6s3ACal9t8pibT44Wff6P/3JSh1jho19NvVwQFD0jMirc7b/GO1yPbnsC2
         cNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769496; x=1785374296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GeXwCH2Ww/TWsye8893nOWAwkN7miADAvxyyLX+SPtU=;
        b=FvA3maH2jSEZwSoTBbLLgIP5riPPo+iU/1tlPRyEcGkKD+p+e0YQwq1L+xAEwUnjc7
         3BPnbXArEn7ixgCCFQrRWmv6RB8fHqrDnPM97gLcH0qk48qPecJRKVtMf2imXiHheyc7
         9BlQXmu0YRxHUXQUUGnqNRuTxsWEHDHLuz0EsOapbYLBM59Y7cgNKx4o91txleBjV8oW
         xi5HwRoq9pNLmHLvRdcaXZe3JwY3hFUXZd3sS0M7vSqfvw/2SXugApeyUOQsST39DeFM
         crtRJsExt6BWwllGaX77TPCi34Du+UIJ3jt9cgp/l/eVcsIMaZcg9Y/adUkkMgH0cJ2W
         h/lA==
X-Forwarded-Encrypted: i=1; AHgh+RoVslWRvfcmiX3NNMqYdjT1+OcJ0IYAXmmwtloV5/JeqoaY7jMwpuhrVS2HDJJPftzXutfASXqeuVkWDDWJkXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwNKXOp1b7elzk166nje1bbjVar8Rp4pG276kgqk0KjJQ31ZM
	3sUGm70eZ3Y4XIPmMUFkOVm29rPfNnx5lO5i9PhDVUBdLphwGYXfsf1S
X-Gm-Gg: AR+sD11BnnF1Ew+MzNgyjsJsOKK1mPCQoR5yticjJVARYZIODmec4YNCPzJY9/HMX4l
	jfM/CbguMYXGRdlOiw/VoRUQxTy/G7N7/YEF53oAExuoYackK48jQWDTrGXWXawUEmeNyQPLb0c
	J+MzGR37uxGqczO79Bk8CiCcYoJgGuUdHb85vpXkOQ/P4qtO3Q656cnGyY2q62X9NreGV+cfifE
	09qJ1npa6opHx+5ucQMDaLMf87WwgnpqlkLuT9r4JOnSg3yxgY+QCzLOP+qB2H8TvsLY9kjMSEw
	A8hdnN+9hlUwpDspZwUZaaQbpxg5oT+PpMeDVX64OQX+AbvzYiWd6lBXFhoTNGJPwYhPNAqQqhR
	xO1TWEgVkC0bkMhHEHBH+6apDl0RDn/pDY8ZRnuco8ZeeA8RSSCheW6RatFq82ULYJiFw/xVR1H
	bfwSAX2JDyRLwmQVOCkH+JnQoDLw==
X-Received: by 2002:a05:6a00:b48:b0:848:438d:3665 with SMTP id d2e1a72fcca58-84e2bb3741dmr1332137b3a.41.1784769495728;
        Wed, 22 Jul 2026 18:18:15 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ea5c7sm2089045b3a.53.2026.07.22.18.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:18:14 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Thu, 23 Jul 2026 01:17:55 +0000
Subject: [PATCH net-next v4 3/3] selftests: net: add coverage for fdb
 nexthop dst_port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-b4-vxlan-fdb-port-v4-3-46e3a2dd88a3@gmail.com>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784769488; l=7289;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=5wHaj7ZOUiFnnwZQ/alCVlhWUyG6yyDr4ttHzSEM7CU=;
 b=do5DeEEjrWxEHMZsOiwA73wLMesjbJiuvUygHyoHVnXmSeSdKj28drdit5lirzEPtdH3ETMB/
 wVrI49sZeQNBROTonjjktLioRDLPskV/0QqzcP3JN//pRV+OMei5akt
X-Developer-Key: i=jack4it@gmail.com; a=ed25519;
 pk=x8xh2Md9yNDil0xBOA9WA/oqC3O4Eg4rdlIul4YUktU=

Add coverage for the new per-nexthop VXLAN destination port
(NHA_DST_PORT).

In fib_nexthops.sh, new ipv4_fdb_port_fcnal() and ipv6_fdb_port_fcnal()
tests check that a dst_port is accepted on an fdb nexthop that has a
gateway and echoed back on dump, that it is rejected without a gateway
and rejected when zero, that a group may hold legs that differ only in
UDP port, and that a portless fdb nexthop omits the attribute.  The
tests SKIP when iproute2 lacks the "dst_port" keyword.

In test_vxlan_nh.sh, basic_tx_common() gains a second fdb nexthop group
whose nexthop carries a destination port that differs from the VXLAN
device default, plus a flower filter keyed on that port, to confirm the
per-nexthop port is used on the wire.  The test now requires an iproute2
with dst_port support.

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
 tools/testing/selftests/net/fib_nexthops.sh  | 81 ++++++++++++++++++++++++++++
 tools/testing/selftests/net/test_vxlan_nh.sh | 34 +++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index ac868a7316946..834ba1c0676c8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -30,6 +30,7 @@ IPV4_TESTS="
 	ipv4_large_res_grp
 	ipv4_compat_mode
 	ipv4_fdb_grp_fcnal
+	ipv4_fdb_port_fcnal
 	ipv4_mpath_select
 	ipv4_torture
 	ipv4_res_torture
@@ -44,6 +45,7 @@ IPV6_TESTS="
 	ipv6_large_res_grp
 	ipv6_compat_mode
 	ipv6_fdb_grp_fcnal
+	ipv6_fdb_port_fcnal
 	ipv6_mpath_select
 	ipv6_torture
 	ipv6_res_torture
@@ -432,6 +434,15 @@ check_nexthop_fdb_support()
 	fi
 }
 
+check_nexthop_fdb_port_support()
+{
+	$IP nexthop help 2>&1 | grep -q "dst_port"
+	if [ $? -ne 0 ]; then
+		echo "SKIP: iproute2 too old, missing nexthop dst_port support"
+		return $ksft_skip
+	fi
+}
+
 check_nexthop_res_support()
 {
 	$IP nexthop help 2>&1 | grep -q resilient
@@ -541,6 +552,41 @@ ipv6_fdb_grp_fcnal()
 	$IP link del dev vx10
 }
 
+ipv6_fdb_port_fcnal()
+{
+	echo
+	echo "IPv6 fdb nexthop dst_port functional"
+	echo "------------------------------------"
+
+	check_nexthop_fdb_port_support
+	if [ $? -eq $ksft_skip ]; then
+		return $ksft_skip
+	fi
+
+	# NHA_DST_PORT: optional per-nexthop VXLAN destination UDP port,
+	# letting an fdb nexthop group balance a flow across legs that share
+	# an underlay IP but listen on different UDP ports.
+	run_cmd "$IP nexthop add id 80 via 2001:db8:91::2 fdb dst_port 4790"
+	check_nexthop "id 80" "id 80 via 2001:db8:91::2 scope link fdb dst_port 4790"
+	log_test $? 0 "Fdb nexthop with dst_port"
+
+	run_cmd "$IP nexthop add id 81 fdb dst_port 4790"
+	log_test $? 2 "Fdb nexthop with dst_port but no gateway"
+
+	run_cmd "$IP nexthop add id 81 via 2001:db8:91::2 fdb dst_port 0"
+	log_test $? 2 "Fdb nexthop with dst_port 0"
+
+	run_cmd "$IP nexthop add id 82 via 2001:db8:91::2 fdb dst_port 4789"
+	run_cmd "$IP nexthop add id 83 via 2001:db8:91::3 fdb dst_port 5789"
+	run_cmd "$IP nexthop add id 106 group 82/83 fdb"
+	check_nexthop "id 106" "id 106 group 82/83 fdb"
+	log_test $? 0 "Fdb nexthop group with legs differing in dst_port"
+
+	run_cmd "$IP nexthop add id 84 via 2001:db8:91::2 fdb"
+	check_nexthop "id 84" "id 84 via 2001:db8:91::2 scope link fdb"
+	log_test $? 0 "Fdb nexthop without dst_port omits dst_port"
+}
+
 ipv4_fdb_grp_fcnal()
 {
 	local rc
@@ -641,6 +687,41 @@ ipv4_fdb_grp_fcnal()
 	$IP link del dev vx10
 }
 
+ipv4_fdb_port_fcnal()
+{
+	echo
+	echo "IPv4 fdb nexthop dst_port functional"
+	echo "------------------------------------"
+
+	check_nexthop_fdb_port_support
+	if [ $? -eq $ksft_skip ]; then
+		return $ksft_skip
+	fi
+
+	# NHA_DST_PORT: optional per-nexthop VXLAN destination UDP port,
+	# letting an fdb nexthop group balance a flow across legs that share
+	# an underlay IP but listen on different UDP ports.
+	run_cmd "$IP nexthop add id 30 via 172.16.1.2 fdb dst_port 4790"
+	check_nexthop "id 30" "id 30 via 172.16.1.2 scope link fdb dst_port 4790"
+	log_test $? 0 "Fdb nexthop with dst_port"
+
+	run_cmd "$IP nexthop add id 31 fdb dst_port 4790"
+	log_test $? 2 "Fdb nexthop with dst_port but no gateway"
+
+	run_cmd "$IP nexthop add id 31 via 172.16.1.2 fdb dst_port 0"
+	log_test $? 2 "Fdb nexthop with dst_port 0"
+
+	run_cmd "$IP nexthop add id 32 via 172.16.1.2 fdb dst_port 4789"
+	run_cmd "$IP nexthop add id 33 via 172.16.1.3 fdb dst_port 5789"
+	run_cmd "$IP nexthop add id 105 group 32/33 fdb"
+	check_nexthop "id 105" "id 105 group 32/33 fdb"
+	log_test $? 0 "Fdb nexthop group with legs differing in dst_port"
+
+	run_cmd "$IP nexthop add id 34 via 172.16.1.2 fdb"
+	check_nexthop "id 34" "id 34 via 172.16.1.2 scope link fdb"
+	log_test $? 0 "Fdb nexthop without dst_port omits dst_port"
+}
+
 ipv4_mpath_select()
 {
 	local rc dev match h addr
diff --git a/tools/testing/selftests/net/test_vxlan_nh.sh b/tools/testing/selftests/net/test_vxlan_nh.sh
index 20f3369f776b1..7b5dc1d37fa02 100755
--- a/tools/testing/selftests/net/test_vxlan_nh.sh
+++ b/tools/testing/selftests/net/test_vxlan_nh.sh
@@ -56,6 +56,16 @@ tc_stats_get()
 	tc_rule_handle_stats_get "dev dummy1 egress" 101 ".packets" "-n $ns1"
 }
 
+nh_stats_get_port()
+{
+	ip -n "$ns1" -s -j nexthop show id 20 | jq ".[][\"group_stats\"][][\"packets\"]"
+}
+
+tc_stats_get_port()
+{
+	tc_rule_handle_stats_get "dev dummy1 egress" 102 ".packets" "-n $ns1"
+}
+
 basic_tx_common()
 {
 	local af_str=$1; shift
@@ -90,6 +100,26 @@ basic_tx_common()
 	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" tc_stats_get > /dev/null
 	check_err $? "tc filter stats did not increase"
 
+	# Add a second FDB nexthop group whose nexthop carries a per-nexthop
+	# destination port (NHA_DST_PORT) that differs from the VXLAN device
+	# default. Matching outer traffic must egress with that port, so a
+	# separate flower filter keyed on the new port catches it.
+	run_cmd "tc -n $ns1 filter add dev dummy1 egress proto $proto pref 1 handle 102 \
+		flower ip_proto udp dst_ip $remote_addr dst_port 4790 action pass"
+
+	run_cmd "ip -n $ns1 nexthop add id 2 via $remote_addr fdb dst_port 4790"
+	run_cmd "ip -n $ns1 nexthop add id 20 group 2 fdb"
+
+	run_cmd "bridge -n $ns1 fdb add 00:11:22:33:44:66 dev vx0 self static nhid 20"
+
+	run_cmd "ip netns exec $ns1 mausezahn vx0 -a own -b 00:11:22:33:44:66 -c 1 -q"
+
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" nh_stats_get_port > /dev/null
+	check_err $? "FDB nexthop group stats did not increase (with port)"
+
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" tc_stats_get_port > /dev/null
+	check_err $? "tc filter stats did not increase (with port)"
+
 	log_test "VXLAN FDB nexthop: $af_str basic Tx"
 }
 
@@ -210,8 +240,8 @@ require_command arping
 require_command ndisc6
 require_command jq
 
-if ! ip nexthop help 2>&1 | grep -q "stats"; then
-	echo "SKIP: iproute2 ip too old, missing nexthop stats support"
+if ! ip nexthop help 2>&1 | grep -q "dst_port"; then
+	echo "SKIP: iproute2 ip too old, missing nexthop dst_port support"
 	exit "$ksft_skip"
 fi
 

-- 
2.43.0

