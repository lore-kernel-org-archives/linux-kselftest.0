Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C353ECBE5
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814951; cv=none; b=vDt3+5u3H2R/N4Yvg/5ogZecrJD0flV/ZN9DuP8bCwz9uTrUPCo4vyKvNOUgCNrwvxlZX71DDtNPa+154m2b+b9UKV8kAHbdf78Duhu2B/Bshccb8zpVF7O/LwXpK6L5hfyidglfVVlr58BaTsQFZV0j7Io0jzFCLkC9UuXDmA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814951; c=relaxed/simple;
	bh=tJ5AgHmPU81+bXp/Y3F1T3O00XWjFbNB1wRNx7RqxE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIDRn6KWOwt/EZ96/NsrpPZQfysXgp56Tl5OfiVfwFEQt1B/HHr4tmEk7Ey9VRroDH4ozFxPNMUa3AeOuLFsV6ej1RMgXPP8xUvlb9q3lRf5FBvJXy34vKn+uIoYqdDepW5A2bMAaXfSCgdH5flFtsiXppa4N6tHQbVcpkWg9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eX6+ia+x; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eX6+ia+x"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2135207a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782814950; x=1783419750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDnQ+qekbSxhRRRlAXPldbekViVZJ6Onugh7Hv1Mdig=;
        b=eX6+ia+x6DnKV3+wf2lZDfBQ2a3ExrfumM71J62mAHC17ZCuVpv7Mx8elF/YMGNaD4
         cw71bTJ0VRZjXwHJzXmemolO4cWY0aK+GYCWBHcosDo9KgW/MCABk2QK075abSscZVPf
         pVtSpdGWaJeLgYFn3ssyznXEBY2G+Vq3/OfW9xH/zIT8NKtvYW/Wh+h4wkVCGQj8YqL7
         U4+VRXnkocnR480CBnK2XLukmoSZL02WjTZxaP66D8NWTsuUXh36yAttJQHPrHzU8+BG
         7AtIeG5ok6gaMmxskV71DIxtOG2WJ/3Z4Cl6VDwYjFU9Ygb/S46MJSuO6lQ82w3S0AYZ
         FpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814950; x=1783419750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDnQ+qekbSxhRRRlAXPldbekViVZJ6Onugh7Hv1Mdig=;
        b=ELPpBAP5DiW72Rs9WIMEEWyWdn4rkMwnktrA5k8zkqsoSf7ia38k046CZi/8Ney4aA
         veDEyxyp+7VT0sDVcB7+fbOAXx3TswnTsr3ktz2ZO155YygAhLMLXBzVr92g5YMKgD1z
         gEvg0weLt17S2/JLJcWJFBu0KbRSDGu725PZkXB0uZ+P4Fpiot/+Ze68UZVpAieSNygM
         5Q1XJM74B4M6SD49/aQXcRnW0q5Egfdn99ukrZSHA5drtIfJuguXBXNYCdjZJ5fKKf9U
         NwS9Xzsw9Zk5sgXrkUOD9GhYHpKrBVSdHbt8NgkEbYG/ZuiOVzH+RxKlfCV5oKJpwiS4
         4JgQ==
X-Forwarded-Encrypted: i=1; AHgh+RojbkizxBJCo6F/w1KZNjIo8Hafmio4Bey++KDGXrjuKDa8xl697J9WSdafOSC62AzM5I412G6WCzKf3i3hvug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGH+tYLa/roC/sybmiZzHjKBwA1/dgDyYovYJoKVC7JFhSIzCz
	SAvd6hc8Jt21oUAaiC2xrrHBdajynFxkHWLvMnnxPvh+qYfGTtEL783i
X-Gm-Gg: AfdE7cmiFgpG1Gi8b8ldqyzkr4/fUQDEppfnezSndyJq+oEGHcBZ6GMLGRWT6bbbsba
	cSbUOI3yn7WlcCqxJWqpYUyfD4myORhRg6Ywv6wDAwgT7MokoYkmnvsXtlphAL/jgsDdSRgiHOm
	6elsaJKryFEATKY2ny2gV49BYseXffi20qFnQWRcblh3B6GbhmC1k3HQ/OnIqCa4VTdCYJfnf1o
	sKrRIbfsqh0iDLu5zFWvnt7cYPO2bK5MjtCqziJYi50DZa0q3pkjNyIXd/watBXcEZVcdHTacAQ
	Y/T7uKDdll093r1vm5t3wF4jsKbPcNJae4W0s55spoYlznTGg3AUAl7DYZjzdTipT/ts4hRVc9h
	LdOuYnsjcJ0lKazQXeIUiaAIb9RMA4m/vci3YUa4hEM6o7ayybhlXAluhes2B9i2pan5HLrEr5A
	tu+NuL
X-Received: by 2002:a17:90b:4b8d:b0:37f:9ce1:735b with SMTP id 98e67ed59e1d1-3805277fbadmr2212775a91.28.1782814949656;
        Tue, 30 Jun 2026 03:22:29 -0700 (PDT)
Received: from houminxi ([166.0.188.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380529ab9f4sm1425597a91.7.2026.06.30.03.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:22:29 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Minxi Hou <houminxi@gmail.com>,
	aconole@redhat.com,
	echaudro@redhat.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3] selftests/net/openvswitch: add ICMPv6 echo type match test
Date: Tue, 30 Jun 2026 18:22:25 +0800
Message-ID: <20260630102225.29733-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register OVS_KEY_ATTR_ICMPV6 in the flow key parser so that
icmpv6(type=...) can be used in flow specifications. Without this
registration the parser silently drops the token and the kernel
rejects the flow with EINVAL because the expected ICMPv6 key
attribute is missing.

While here, add convert_int() to the ovs_key_ipv6 and ovs_key_icmp
fields_map entries so that specifying a field value produces the
correct wildcard mask. The IPv6 flow label uses convert_int(20) to
produce a 20-bit mask (0x000FFFFF), matching the kernel constraint in
flow_netlink.c that rejects masks with bits 20-31 set; byte-wide
fields use convert_int(8). The ipv4 counterpart already does this via
convert_int(); the ipv6 and icmp classes were simply missing the fifth
tuple element. Existing callers that pass empty parentheses are
unaffected because convert_int("") returns (0, 0).

Add test_icmpv6 exercising the ICMPv6 echo flow key. The test uses
static neighbour entries to bypass NDP, then verifies in three steps:
install icmpv6(type=128) and icmpv6(type=129) flows and confirm ping
works, remove the flows and confirm ping fails, reinstall and confirm
recovery.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 63 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 26 +++++---
 2 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..2de01137bb50 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	icmpv6					icmpv6: ICMPv6 echo type match
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,68 @@ test_action_set() {
 	return 0
 }
 
+test_icmpv6() {
+	sbx_add "test_icmpv6" || return $?
+	ovs_add_dp "test_icmpv6" icmpv6 || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_icmpv6" "icmpv6" \
+			"$ns" "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
+	ip netns exec server ip link set s1 up
+
+	local cl_mac sl_mac
+	cl_mac=$(ip netns exec client \
+		ip link show c1 | awk '/link\/ether/ {print $2}')
+	[ -z "$cl_mac" ] && \
+		{ info "failed to get c1 hwaddr"; return 1; }
+	sl_mac=$(ip netns exec server \
+		ip link show s1 | awk '/link\/ether/ {print $2}')
+	[ -z "$sl_mac" ] && \
+		{ info "failed to get s1 hwaddr"; return 1; }
+	ip netns exec client \
+		ip -6 neigh add fd00::2 lladdr "$sl_mac" dev c1
+	ip netns exec server \
+		ip -6 neigh add fd00::1 lladdr "$cl_mac" dev s1
+
+	ovs_add_flow "test_icmpv6" icmpv6 \
+	  'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6(type=128)' \
+	  '2' || return 1
+	ovs_add_flow "test_icmpv6" icmpv6 \
+	  'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6(type=129)' \
+	  '1' || return 1
+
+	info "verify ICMPv6 echo with type-specific flows"
+	ovs_sbx "test_icmpv6" ip netns exec client \
+		ping -6 -c 1 -W 2 fd00::2 || return 1
+
+	ovs_del_flows "test_icmpv6" icmpv6
+
+	info "verify ping fails without echo flows"
+	ovs_sbx "test_icmpv6" ip netns exec client \
+		ping -6 -c 1 -W 2 fd00::2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail without flows"
+		     return 1; }
+
+	ovs_add_flow "test_icmpv6" icmpv6 \
+	  'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6(type=128)' \
+	  '2' || return 1
+	ovs_add_flow "test_icmpv6" icmpv6 \
+	  'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6(type=129)' \
+	  '1' || return 1
+
+	info "verify connectivity restored"
+	ovs_sbx "test_icmpv6" ip netns exec client \
+		ping -6 -c 1 -W 2 fd00::2 || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index e1ecfad2c03e..f3edd198223f 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1255,11 +1255,16 @@ class ovskey(nla):
                 lambda x: ipaddress.IPv6Address(x).packed if x else 0,
                 convert_ipv6,
             ),
-            ("label", "label", "%d", lambda x: int(x) if x else 0),
-            ("proto", "proto", "%d", lambda x: int(x) if x else 0),
-            ("tclass", "tclass", "%d", lambda x: int(x) if x else 0),
-            ("hlimit", "hlimit", "%d", lambda x: int(x) if x else 0),
-            ("frag", "frag", "%d", lambda x: int(x) if x else 0),
+            ("label", "label", "%d", lambda x: int(x) if x else 0,
+                convert_int(20)),
+            ("proto", "proto", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
+            ("tclass", "tclass", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
+            ("hlimit", "hlimit", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
+            ("frag", "frag", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
         )
 
         def __init__(
@@ -1344,8 +1349,10 @@ class ovskey(nla):
         )
 
         fields_map = (
-            ("type", "type", "%d", lambda x: int(x) if x else 0),
-            ("code", "code", "%d", lambda x: int(x) if x else 0),
+            ("type", "type", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
+            ("code", "code", "%d", lambda x: int(x) if x else 0,
+                convert_int(8)),
         )
 
         def __init__(
@@ -1982,6 +1989,11 @@ class ovskey(nla):
                 "icmp",
                 ovskey.ovs_key_icmp,
             ),
+            (
+                "OVS_KEY_ATTR_ICMPV6",
+                "icmpv6",
+                ovskey.ovs_key_icmpv6,
+            ),
             (
                 "OVS_KEY_ATTR_TCP_FLAGS",
                 "tcp_flags",

base-commit: cef9d6804030793cf8b8796fd6936197d065dd3e
-- 
2.54.0

