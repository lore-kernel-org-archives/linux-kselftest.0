Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C72367DF
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852803; cv=none; b=FYhBnzaLHDWcALqAvKTLaFi48v3L4jl2Xj6Agyd0fvBA751/ovs5Te7DZjIfr8E0SOGkGtRLGL0f9xvJ9Al08xSDI3x3eyJyxNvcHGa1Yh0m2QPxxwtI5Up9w0WTB43lGZwmvhZ8Jtl8vIru3CQX1xssKGkkOPUVxnsS38CnQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852803; c=relaxed/simple;
	bh=2OjH5YzjeBUoeaPP277vqkruRnNOJS7p/Ew+ZShy02E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvMw9iwQd7LtsRtYGM2GjAUhN7Cn269GsSM084o1OMgpjC89mgs1s+iAGtp/yN2ol6gykLHTnNIQ17yWbj2eSUJ06SEst7HAIMhLTtF83kX7onkWhjJqUm361nFnP9PTBuUbgz21d29zx827c/4+GY1TAIabNHS9jzOAFi+ZhdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXxXBj7E; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXxXBj7E"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab973140bso17004815ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852800; x=1785457600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cwyM4S2bg8hfvNuij/WIlfOVxWJQ3ABu4c6jeUUbeM=;
        b=sXxXBj7EFgTS7icuD/u4aqbycBqiJ97YyRNWn3tV1JLAUypEe0SpCG0+o5HX/xrMw1
         kG62k+qUckHIT0Gtg3mVFuTotMIhMVWR07b89ErgVBx8R9LdJmHY3KKVQYFgwGHmnoOW
         jQ2LVsDDiGbc4nIyc8b1rtYznbFwCiBuLy0Pf8u7H0ntMVTipXLUJxOmgT3VVO1g6hqF
         ArtHXlOsXDGqA1OYzTpSuGERfuA5Pc3p+qkxeL1KYy8NuwFAybQJyaI8ChtysGD/cEPv
         Ua5eoNyvfydSQtfFXTvEC6x88t8EILnlUbXkjlZpkLdDHCAm4kRYJhg3QkgZN1wUjDMX
         anyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852800; x=1785457600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cwyM4S2bg8hfvNuij/WIlfOVxWJQ3ABu4c6jeUUbeM=;
        b=niXdaVwMPpIHD3TT8Y9l9BmbXSqD5fuDkbWG6uqnrobh6ycXZa2bYO8gRar3XwvuVv
         u/XyXEFp9RtJDM+IANksxlwI9j8djxZ+4Fh94eWJ3Kle4cpGkyeieGtNLcdnEjpnqqwe
         jQ2r+ZAH+YF6KTeKmMzjYF5p/imAKUtvycefAAp4K+JEQYiz4P9KHnkEulBIIeAJyWsk
         P1xcPbNf2fr7oD8hTuImvDrRz/QB7Xd/lFYlWVTaiAAfqSKeUT3MjgBE6xpcmRYQPwXg
         dmirk+xNaslWtL5QDQQWAS+B0WEHIev3AcSb0whGUw/D3amrwBYyqeiutPH8w7NIQfTH
         ruvw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5gazlwThH6CmW+TH8aNskg3h15VOYRc5Bgr/v9Xjx1iKEEkU0P9vsISbvd4/8u4rOxXXejf8eQaLxw7ZG42s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRPD/loF62SvtmaKG+ObaxsJPjdgZa9GcitnfvQx0OmWEfM2g
	2nbVF1zkxbC4mJG7Pobq+bWODlYp/puYftgCjkBMztbs2rKWhHYnMPtE
X-Gm-Gg: AR+sD10A1iLO3+JO2FZl+GCoFKECBmFG/oZ534fqC2V0hKAhJsw4qljKmGmOUSfnBxi
	niEOJZlr8TcsSJa9nWHjZ6430c3s/Mz1q8CFefKt4BWr8om+Q4yL5UFM9H/PhMFfxmlBGqS8OzH
	G70FdqfQRgzZ1xrR92lIsIB45D0u67HoQzZCvAUBsiSuVpto6jsjKZxE4VaAblwA8K+5kpZ+mzS
	j0R56Q65+0k4Yr6DG8UNUu1psFPM78eSygrI5hfmT4GLDM2u/lLxr5IkVFvAQNsRNEVCRwoPV82
	+nOIdGjPDbJ5VZX/izNJie71LtzoYYmuAr2TIAZP1tekRUngrnK8Mmg1jcDxnqxbx586l+htmPY
	eftpbvNOk2SDq4wHbDOpOCNhPAkhnSRMaTAC5NVPEngfsqpRPJQMd0OQXMgSdr8BnziRTzyfGOo
	Mb1AsVC/CEGjlg0s0=
X-Received: by 2002:a17:903:908:b0:2c9:97a7:3278 with SMTP id d9443c01a7336-2cfa6c88151mr60568995ad.41.1784852800250;
        Thu, 23 Jul 2026 17:26:40 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm42343205ad.20.2026.07.23.17.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 17:26:39 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Fri, 24 Jul 2026 00:26:18 +0000
Subject: [PATCH net-next v5 3/3] selftests: net: add coverage for fdb
 nexthop dst_port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-vxlan-fdb-port-v5-3-cd1c6aeee058@gmail.com>
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
In-Reply-To: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784852797; l=7433;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=2OjH5YzjeBUoeaPP277vqkruRnNOJS7p/Ew+ZShy02E=;
 b=GoS7LcmUixSn75R79SRbzKHWfMxXjMiA0g3o+BZWsKGzcdGMFGClUXH2+iJqPvgUgF8LaqsHH
 KoBlyR2NJyLBpuv5P57ZvAkRV+BgIUrVfv0/SvlqST4Mm5vLVxtYjk2
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
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: David Ahern <dsahern@kernel.org>
---
 tools/testing/selftests/net/fib_nexthops.sh  | 83 ++++++++++++++++++++++++++++
 tools/testing/selftests/net/test_vxlan_nh.sh | 40 +++++++++++++-
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index ac868a7316946..3d347126730a9 100755
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
@@ -541,6 +552,42 @@ ipv6_fdb_grp_fcnal()
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
+	check_nexthop "id 80" \
+		"id 80 via 2001:db8:91::2 scope link fdb dst_port 4790"
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
@@ -641,6 +688,42 @@ ipv4_fdb_grp_fcnal()
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
+	check_nexthop "id 30" \
+		"id 30 via 172.16.1.2 scope link fdb dst_port 4790"
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
index 20f3369f776b1..5ce6f27f6cf49 100755
--- a/tools/testing/selftests/net/test_vxlan_nh.sh
+++ b/tools/testing/selftests/net/test_vxlan_nh.sh
@@ -56,6 +56,17 @@ tc_stats_get()
 	tc_rule_handle_stats_get "dev dummy1 egress" 101 ".packets" "-n $ns1"
 }
 
+nh_stats_get_port()
+{
+	ip -n "$ns1" -s -j nexthop show id 20 | \
+		jq ".[][\"group_stats\"][][\"packets\"]"
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
@@ -90,6 +101,31 @@ basic_tx_common()
 	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" tc_stats_get > /dev/null
 	check_err $? "tc filter stats did not increase"
 
+	# Add a second FDB nexthop group whose nexthop carries a per-nexthop
+	# destination port (NHA_DST_PORT) that differs from the VXLAN device
+	# default. Matching outer traffic must egress with that port, so a
+	# separate flower filter keyed on the new port catches it.
+	run_cmd "tc -n $ns1 filter add dev dummy1 egress proto $proto \
+		pref 1 handle 102 flower ip_proto udp dst_ip $remote_addr \
+		dst_port 4790 action pass"
+
+	run_cmd "ip -n $ns1 nexthop add id 2 via $remote_addr fdb dst_port 4790"
+	run_cmd "ip -n $ns1 nexthop add id 20 group 2 fdb"
+
+	run_cmd "bridge -n $ns1 fdb add 00:11:22:33:44:66 dev vx0 \
+		self static nhid 20"
+
+	run_cmd "ip netns exec $ns1 mausezahn vx0 -a own \
+		-b 00:11:22:33:44:66 -c 1 -q"
+
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" \
+		nh_stats_get_port > /dev/null
+	check_err $? "FDB nexthop group stats did not increase (with port)"
+
+	busywait "$BUSYWAIT_TIMEOUT" until_counter_is "== 1" \
+		tc_stats_get_port > /dev/null
+	check_err $? "tc filter stats did not increase (with port)"
+
 	log_test "VXLAN FDB nexthop: $af_str basic Tx"
 }
 
@@ -210,8 +246,8 @@ require_command arping
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

