Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3E138F653
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514320; cv=none; b=XjtRMwjlYUmVk+YSPJTMLHeE6Qgq6tB4IoJ7JYH8vlGMDZgsaX2IwsEfIuBRmUTqziRtswmY6wpvGA3YhmNxkffPaeAIXYkRPaMgvPUSwOxnT72H3B0cuKJ2wSyAxmw62NGOCDfKVGnxvk6DvJd4ZduC5SbmZPcGVeINSwIphCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514320; c=relaxed/simple;
	bh=is0aUcqvIZ1xcT2jK43lwzQy9+ksca8vwiUx2SlLA9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouXUF7lfYkSteADq3fsa5A/dg8MOUFysxOTpbCCO4YbEuNsLqAf/ttr8mt/rWQX3lMwyI9x6DywkgbEnPOrrKnEx4KZbO/BMKCBZ90n1Bj1QOlxwTMY1jZ87X0PgFwdP0EaPSud4KTO0+83fh7jSD0GJoufTOjGHKB4arbXTZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2VSxmuZ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2VSxmuZ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so28602646d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514318; x=1782119118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvV17BgpJQmVQrI1yyaY3qROAJv7ED+Gi/LtXIZqMPI=;
        b=F2VSxmuZK3+lLiaTVErbvzZRXcA0gpZd111o4WAO/7BG2E47jI/iYOeprIWpPMJ7DT
         edFsRWqxMHU4K7Sd8Q3D0UDbeRhqUfgBr1aEX4Yfks42AjeWLGOsGujU6DEsXa7C64tj
         7I+UqBD6kA/a91zOzFprsyECq0COBq/I/Uk9a9q2C/EYfStgf5ux4UFp4xGGyc8PckAf
         3pjOma9ymSGyzmmjB9ZoH7JaGVlzl78NnK5ktAQH73+Y76bV0cz7sBFqs3TFX3rg4GKG
         zQu6m150M6jVXc+n4wb4CLKIln0+U9qpVOidX1Sm52UTfppfG56mFKlgWYEuM9o4tKgB
         XNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514318; x=1782119118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvV17BgpJQmVQrI1yyaY3qROAJv7ED+Gi/LtXIZqMPI=;
        b=CwBRUh61j6ZOY1Rn4G8ZPZs8nOyD+GtMHAI0z6fsx1w4o/AHWMeOx2elMd5CnfS2Y2
         lAHEo/gh2nlQeCjcYaY7Bs0LIKE2w60U5NkRCcqHfxp5Qd6YC3gUEAkBHZ2E5fifyHcM
         JY5nLRU+RfYd9JPJ42E9FGUNELmQPpPDJtjM15XTGLuQ6Wm9lIrakxAuMSl9REzHl+N2
         WatPfUN5c90jggOrp1sKsYubBDSK8Hgv9ueP4IUNvEkJC58KsEs9MyM4Cdre6/xPh23g
         6uvex4mJwlXkHM7RHKCiEQghb4Hkc4ImGljZFLDBhdm+d7QIVn/OQzSIss64FYh5p7z8
         F3DA==
X-Forwarded-Encrypted: i=1; AFNElJ/Pg9oUvWCECtqMIfeP4FTC6Sn3NwSz6hX3IqomUkc76UAnYN9bjo+gjLIpfjnujPFR6MrGZJRMfMi46WZmAt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNBP1CARTHVESDU2XMHEwcpdWxFVRSHZBj2EZSUWfboGTRbhW
	jrrj7NQ3JGKurYl7qS4nC2TpbZLs37N1ircAXb0owXLlvBbwyvPN51gk
X-Gm-Gg: Acq92OFusa+rxDs/SwVYucG1s7RhHVXtBggvDpnN544opkddG774QD+thRZOJJ1WVo0
	9wZ9RPRnofx+KNv8t9N1pyfU2NDobeHvOPuu/cggNoc8fhYPLeAJYlDcy96YGo1QckCQwf7v/Cx
	5E9bLaz5AOGbfauh9t42llJQ/Mof/u0W9J+nzzGfTu4HFz7dT7ksW4zL4grDg6C9JsTp+XB6sSx
	pDAxRmiTP0oFAk/D7rJ4pcrLLJP6prVIcwERAo1VrtJZ/e8LtjSb+h4Rkkr2q3lRBdx2pF4F/Le
	KW3afAE+JkvvkXB9+ALuFOkrJvazt1mYt+4V0hlGsNVmPNAVL5lg7T7lVI2uGsBRenYunp9qvqS
	DIfmULn0islolsOSZFNbpbTYwCUQ9muz7fLrJm8YgXA4CIj9K2xU5Q11yPmf1oiEFb/YBE46B+P
	OZRNua1aSgJEfMIe3d9hcJQaU=
X-Received: by 2002:ad4:5761:0:b0:8ae:62aa:665a with SMTP id 6a1803df08f44-8d32d858216mr244104566d6.28.1781514318228;
        Mon, 15 Jun 2026 02:05:18 -0700 (PDT)
Received: from houminxi.lan ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302114676sm109704966d6.20.2026.06.15.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:05:17 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2] selftests/net/openvswitch: add ICMPv6 echo type match test
Date: Mon, 15 Jun 2026 17:05:07 +0800
Message-ID: <20260615090507.3647256-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613141429.3084962-1-houminxi@gmail.com>
References: <20260613141429.3084962-1-houminxi@gmail.com>
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
v2: fix ovs_key_ipv6 label mask to use convert_int(20) instead of
    convert_int(32); the IPv6 flow label is 20 bits and the kernel
    rejects masks with bits 20-31 set in validate_set().

 .../selftests/net/openvswitch/openvswitch.sh  | 63 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 26 +++++---
 2 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index d533decca5c1..8923224fa88e 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -31,6 +31,7 @@ tests="
 	pop_vlan				vlan: POP_VLAN action strips tag
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
+	icmpv6					icmpv6: ICMPv6 echo type match
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -377,6 +378,68 @@ test_flow_set() {
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
-- 
2.54.0

