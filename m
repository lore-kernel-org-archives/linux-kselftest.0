Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875212D7D59
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360082; cv=none; b=DcooWCaSA+S4lSDrEPhOZtyTCUxPXgftSbH07qH4piUOEQmEgkZtT+l7uNA6P9LyqrWA81QHYBifgEmIhdqk4IvHvASI8GPBudNBnBZEQW27H6vc7S0N5DTspNVK+jw6Oe7pm7EtBj/B363CQ8XqW9o+YEHB5ITG5GyWxRnLhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360082; c=relaxed/simple;
	bh=wzwdF4M/UpXu4aQQwBuQUMYn7Bkhoxn804AI+JjangA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe+w2yfEY8JB9not2V5pGe4Z5+ns+irRe8tPwWYHXF/xw6OpuhNkTVXDqdd4p0tnnp5/uhROpY2HbQyEVKohn9uT32dvUfojwjzsP9QxZB0rZlrA3j48k+hijcr+bvwb0ctDOvtRYHF+iGe+mX4syqiZNpJsLV8JPYSJ+fWKYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb02RR0i; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb02RR0i"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-517583cb07aso21027501cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781360078; x=1781964878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siocUVnVf3eM8EdFHeQGn4LtXIWh8zfDsTIVT1+wz7M=;
        b=nb02RR0iNviiW379xNy9MKJ6MyZ79j0saEGXNOsLi0dARhrfGzKnOKD7p32QfP1dFH
         j4fCLT9UzogLVtyiFpRx03mMKMxoRaQx/KDmFI0e4NmRmzdUM9WnpUFPChzVRn/Al1Pj
         ggJjTcwYPWnylSpLB6mIIpUB/ZID28cJXNMIMUIX8lx5TkkVYwlDL2g0+K9NQ6xrVhda
         0qnYWu/CaPrdzYVICNG+whsrVQW3Me8CN45iwTOy8bCzIjktOVuLYFYlOhTcqgz0+tPs
         6bPiZ4FKnYcJZbYt3RbQeIYv+ET44mB//9X+UyKzOrrKD7n/VfF0XgJEWK2e7lVYNR+2
         sHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781360078; x=1781964878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siocUVnVf3eM8EdFHeQGn4LtXIWh8zfDsTIVT1+wz7M=;
        b=QiMqHjCS0fl4u4M7TLHFist1ZVd4diBFyM+ckaObP4EAylKJUnYVMWk0Jd1XFoTGXu
         zIYxD7QnYJniVuKztY/8I5trBziBEezk9oiyeAqeYuVijhxa8A1Z4BI4Z68cDzrk2YwS
         z2bo/2z8ST/GLMXiNjAh7gY4C/paxxzV8xSbEWjwsVHkV15RxM9jEgiRcWsmDzr9UaC4
         cZmtecRlNfBgmE+XM+7OvtOsu+eCMqkXuOSwOW/vX2VBXVlndQLUzld4Dwftjh+OOa4e
         f53gWrnsu+IRb4yIkRrKrK4zE5ss0ub6H4Sf399+KIa/i83UnOAf3EVX1H0tzQ5f+F3l
         Ov7g==
X-Forwarded-Encrypted: i=1; AFNElJ81ia6wskziMh4b/B01PpTFpkLMSvdpcqXDNkh2zotffzITKwm7d3INiYPMx1fpYMHqUdIqXoW5g/LJ/XHNguM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqtUgiU4cF1GNuqhxCIKBB7HdE1pQ5q/n4iA8Tkx7eYgvOvnK
	/+cxqOt6vsbWC+D2qAKv/zovyKD5e/uxUAqiJKCwwzdt6NA6WbX6L5ge
X-Gm-Gg: Acq92OHsf2idC6EPQhVrAyLOXftoWHo3XkiEBxyXjF+j1qy502CG8RQfDe1HhHuduyP
	C5WPPHJuhCskV4jh8ggrouV6TZubBvv+RjpmgKmjAC3VWlV27rHOuyuA0eCxziyW4QdXw6odztq
	HOcNobjkuMWZPq4hrB1tHu6AOmpIydrwTX1ANRb9xkZi6JyQ5mUC4LxbC0/+Sa5fSSAZq44ECzY
	VnUabAQfLeI+koBpQ3fv1wYOHYq0T4mB+5kDUAdyV7tUi2K1RrhUpD+aGNQ76q+aI6GZXflPvqP
	Row7qoWUKStmRMONAk0N0+fRhr9k0R0SvCDbuUFio0yR5oszblu+/yPNTfXrfTKC/WYJGnJiqVL
	8motUt2OWR6TvtQWcoLAYia3bI7XNizZm/rodU3+0AuuZpAq+5XhMNqITbyd66ZVHKmHYMbr3L1
	qUXadWuCuNtLzwTjatSA==
X-Received: by 2002:ac8:7fcb:0:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-5195359cdc0mr61668861cf.30.1781360078433;
        Sat, 13 Jun 2026 07:14:38 -0700 (PDT)
Received: from houminxi ([163.123.141.225])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb83db58sm48910991cf.27.2026.06.13.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 07:14:37 -0700 (PDT)
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
Subject: [PATCH net-next] selftests/net/openvswitch: add ICMPv6 echo type match test
Date: Sat, 13 Jun 2026 22:14:29 +0800
Message-ID: <20260613141429.3084962-1-houminxi@gmail.com>
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
correct wildcard mask (0xff for bytes, 0xffffffff for the label)
instead of using the value itself as the mask. The ipv4 counterpart
already does this via convert_int(); the ipv6 and icmp classes were
simply missing the fifth tuple element. Existing callers that pass
empty parentheses are unaffected because convert_int("") returns
(0, 0).

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
index e1ecfad2c03e..049791b2573b 100644
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
+                convert_int(32)),
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

