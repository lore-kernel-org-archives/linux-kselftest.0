Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A43C9890
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978659; cv=none; b=OH6VgFZVVEEOPosCTVetsMzbhCD0laln/k+Y7ux67g+k6XbKMZLsnW5d6PrbVHrlfPQVKiVxaAegBKpzIBfHH81mE7bwNFo3urW4vKz3DkA8jgb1sdRyfjzCm87oghB31jNFWvFTdLpziVtS4oiS4kf1iLRPSnu1Mgur98+2awE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978659; c=relaxed/simple;
	bh=LPKKzLAxEoXPH5mOcbq24gwcNHHJ3iPYqHxz0xV9nWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRwNDOGLP6Kr7Zj/HeOSD9o70OdXeVeofgdY4YQ9MV/omscc1DA6EMw14+zzK8f7cJ8OJ84/vs18DR9jaXbOQEYXbqkVVHOkdc+oadn0CqKB6geHXgr5TTzhAD01YB1ahXSPIx+97sYRibphkbr0xoKbhmQKF3w6PNyIuLJvbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM+roVe9; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM+roVe9"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-806449d108aso19724417b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 00:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782978652; x=1783583452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnSLH8TarCnofbwejfF0AMt0gJL72Ru2Rk6q84rX6ps=;
        b=OM+roVe9de9Mg6L10BfPWL+CzGN7eq4VB9nTmOa6iQ8AWJ/CRYMMQBFonxZP3G8404
         OrLy7OcYGosH/tcmdQ7NyztsayQP4YOp3WO+trqZ4MzPn65MdrYkzmNOEnXtb4wVYy7Y
         KQ1DZ2xscXpEF2syhr+Z60AL3FVvpTFqjIAYrsqdLmEgGaWbY3lnOPBaVI6s2DJAQoEm
         YU709uJk7a6ySXpmoeweMPbYpd1FbrRK8GE984TuqOcczJ3J3QIWSDAxEos9mnYkw0jo
         MxY7yHa9RwIPDi3Ayp7MKtY+IrJhWRXl+sfipSWp3xZ5ZK2KbZt7xc98YjGQpNlCI37T
         kBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978652; x=1783583452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnSLH8TarCnofbwejfF0AMt0gJL72Ru2Rk6q84rX6ps=;
        b=LL9kHL3F+fjX2aG6JkcHzRBZPRutkOdNkk7SoOm001yZLviFE8s2bqrgnyAMRBDkB4
         PtfqN98uFJGyG1DDBIvrZEdwVOS4pwNYyo8SeQE7gYudONulf/IdEIbtI+AfAqw7Gnpd
         a0mofOCjRKa+eRb6m1Q0tg/bjLEEXnRqbs5FKDnBHmLLddp0H+psVS/YSOERV0cI0c32
         1+8ksndLQ0MaqSzpIad6r+cv4eDuH0d78JGlGUJnm9u+y08QiSXKvLjzUJS4Jt4u+yO0
         hl+7KVEW5pMwY9g9QGhuwV81+bTRoNhC12VsLsvqzRV7TAN6ESjOsnB+vxr8OTdpHlbM
         dHsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPppf/VW05V2RH8Nu9jjx5avt377ebPC8e/d+3PpJ/33msRm1IAq9/Pnt6YWJb/VuowT9J6tSWI300jJ/8K4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa6n6XbXhxskBoziqKUyl7bImLXH2+DNDLFOsOs91MccL5XrNs
	DGSSLO+AqgetKDvu9uXxdnC01AjApVuXmIzcSsNTQ3ybPx1QV0PgUjpE
X-Gm-Gg: AfdE7cm6JU97bG++Nnu4ZbFpNYl7ETyeRpNyBgrxS2eaPorl0W7tOnYzHcKQ0WVdX1c
	KLfreBj9kh5I0D1q2bRV6oXveYO6yGz9Y49CdD1PAoQ57BehBatCofzZWngFRQ21u6p3H2OnYVU
	deLcYmGVMnVmYTecKWc6ihYH3U5DSmM6QMZinsadyn00VECFUxeogIfaVvPVeNrgvn9QdqxKu0F
	BoQy46VSxjHbz+AvGsfu1+1Wz6mB4uQzmDQ4SNoJ01uHz+PUIQGV3ldTU7oYj5p/cUih7dyAlSR
	cYmknE+DtHiqdF7q4Sg5xYhSnDADx7F/4qCXSFnZQULzJytknLEu0uKAGW374F+7K0Lulpkt/Vr
	oXqqEPvWuRHPaBDNbR6e3CS/uxD5z6saEnDBYBs84vWQYRcMhtcqG+mskGL21zS8je47+DmwNHF
	T72OeK
X-Received: by 2002:a05:690c:6201:b0:80c:aff6:9d47 with SMTP id 00721157ae682-812e8dfa5e7mr54752167b3.4.1782978652164;
        Thu, 02 Jul 2026 00:50:52 -0700 (PDT)
Received: from houminxi ([23.133.88.228])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm9451747b3.32.2026.07.02.00.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:50:51 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Minxi Hou <houminxi@gmail.com>,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4] selftests/net/openvswitch: add ICMPv6 echo type match test
Date: Thu,  2 Jul 2026 03:50:44 -0400
Message-ID: <20260702075044.1176798-1-houminxi@gmail.com>
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
static neighbour entries with nud permanent to prevent racy NDP, then
verifies in three steps: install icmpv6(type=128) and
icmpv6(type=129) flows and confirm ping works, remove the flows and
confirm ping fails, reinstall and confirm recovery.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 70 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 26 +++++--
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 2954245129a2..f88cefa71559 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -32,6 +32,7 @@ tests="
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
+	icmpv6					icmpv6: ICMPv6 echo type match
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -443,6 +444,75 @@ test_action_set() {
 	return 0
 }
 
+# icmpv6 test
+# - static neighbours to bypass NDP (nud permanent)
+# - icmpv6(type=128) echo request, icmpv6(type=129) echo reply
+# - remove flows and verify ping fails, reinstall and recover
+test_icmpv6() {
+	local t="test_icmpv6"
+	local v6="eth_type(0x86dd),ipv6(proto=58)"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" icmpv6 || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "$t" "icmpv6" \
+		    "$ns" "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
+	ip netns exec server ip link set s1 up
+
+	local cl_mac sl_mac
+	cl_mac=$(ip netns exec client ip link show c1 \
+	    | awk '/link\/ether/ {print $2}')
+	[ -z "$cl_mac" ] && \
+	    { info "failed to get c1 hwaddr"; return 1; }
+	sl_mac=$(ip netns exec server ip link show s1 \
+	    | awk '/link\/ether/ {print $2}')
+	[ -z "$sl_mac" ] && \
+	    { info "failed to get s1 hwaddr"; return 1; }
+	ip netns exec client ip -6 neigh add fd00::2 \
+	    lladdr "$sl_mac" nud permanent dev c1 || return 1
+	ip netns exec server ip -6 neigh add fd00::1 \
+	    lladdr "$cl_mac" nud permanent dev s1 || return 1
+
+	ovs_add_flow "$t" icmpv6 \
+	    "in_port(1),eth(),$v6,icmpv6(type=128)" \
+	    '2' || return 1
+	ovs_add_flow "$t" icmpv6 \
+	    "in_port(2),eth(),$v6,icmpv6(type=129)" \
+	    '1' || return 1
+
+	info "verify ICMPv6 echo with type-specific flows"
+	ovs_sbx "$t" ip netns exec client \
+	    ping -6 -c 1 -W 2 fd00::2 || return 1
+
+	ovs_del_flows "$t" icmpv6
+
+	info "verify ping fails without echo flows"
+	ovs_sbx "$t" ip netns exec client \
+	    ping -6 -c 1 -W 2 fd00::2 >/dev/null 2>&1 \
+	    && { info "ping should fail without flows"
+	         return 1; }
+
+	ovs_add_flow "$t" icmpv6 \
+	    "in_port(1),eth(),$v6,icmpv6(type=128)" \
+	    '2' || return 1
+	ovs_add_flow "$t" icmpv6 \
+	    "in_port(2),eth(),$v6,icmpv6(type=129)" \
+	    '1' || return 1
+
+	info "verify connectivity restored"
+	ovs_sbx "$t" ip netns exec client \
+	    ping -6 -c 1 -W 2 fd00::2 || return 1
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
-- 
2.54.0

