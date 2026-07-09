Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B53BD64E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598755; cv=none; b=ZUujfN+uLSdSNdq7E2mpYaJPGHNmDmln1dWseLjj+cRbwT0fJRB/TAMdG5zFCuYvCrC9EssWOCV3FyP1uirf4VjteJanHWtVhTpjucFTN1ZLkQK9I6nOKHzRUV0H7g49hxi5san1Dg2Gfakuctyo6Kpcl27phE1NM80PyYA+U2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598755; c=relaxed/simple;
	bh=Xpm6MQWDX7aRAweX1OV+RWi+RLDWSMe7HAgl/tiRlIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeHZiGU0wVk52+mWblZKpUGXOk4rwhuJOftgknVuNzyMUovMmKSGo6qKdqR4GuQINImBKhbNUBR2RBCHyDuJTImi1FPXIUxchFFM/BY6praq6iO5xCr8DOMYJQyMupmk0yWmaJx7/uCxyK8OQZgIjhZkJmWi/gEstAEWipzez2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Luztgaru; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Luztgaru"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1415191a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783598752; x=1784203552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvOYhABQBZgVCYLrX1qUOXEJIIllSDeJsuhmTp6V9I0=;
        b=LuztgarujTjh73/fdI918NkHjhm64W+5lURKYMSeS+raAbQqshtwJx/mW7kgpCSBKC
         2flspSNlrEne/j/6582stkGLYIberPknLCEIV43b2DcisGS0GFo9+ONKeB6ijvhHrRA1
         f/Sjz+QV6AC4ZoNDcJlAYOA49texq3cHOkz1F80fSJNW/0tZvv/c8qdWArjH1dHZgBrr
         TqmYuRushuWtGNr6Kb4QSYKpmNmDIYYLTDbifjyUKuF29/JRG9ZPyRmWnmqz4lGZ1hyU
         EaMFQm/pVpdkAklBBbrsr24dHPfmhE66o5xh4auqD4TSD4dY4ZlD2GmbrbHpm83x2HpG
         2eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598752; x=1784203552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvOYhABQBZgVCYLrX1qUOXEJIIllSDeJsuhmTp6V9I0=;
        b=oTVrqUrvyX5K+VU9yreTGpKtrMiw4vjiNnSl+krYGeTca4FZ4WHta/TS1AxZfCYmaa
         AfrL5wGkHD1CAOWpgKO1QnlLhc+uut8PqzAytMJLKuH+FCWdpCNcVHqLqJO2ghaGbNUd
         83D4XixRFDy/oX+vjdBqcLEwk/936iLI0nJw0CBt9dxAsZQLsjkcmh1maHGvwrY2OYtA
         flZ/HlfbEuTyF7mqxK6KJpPv+/45q6twwmiZ6PcxxdqM3zCJRV82l4lOUAkU8AF1KufP
         YBH6BFMEWGocmHs6irkCjTBbrUY8Mw4Z8ONLVNF/c762LKVt2NlFU/M3aNCr1nMN/XfT
         dcYw==
X-Forwarded-Encrypted: i=1; AHgh+RrRLfw8h/Y8zjy6gDwLJ5kzP0xApKV1Q0uHYJQhCQn4lxQi0b5ep8DaDMjIpeMNmd1rvfxbHHWkjOhlo/1nBrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2NxRpMpEvSAD2k3yllJHphxgy1+oz6rfu3R6r8XFJyeQcwWM
	P4ozhD9bPu2BorsDLDFb9wy2XkDzGFRzrsnKTbwmZz7mTXX9CPXYBD4h
X-Gm-Gg: AfdE7cnGBEnY/0fWlmLZ8f9vEpk32AVXx8PTOet7GMf0u7rtUJ9wsphCayP7nReVSWV
	nnmHZV1VULWRp/FTtKHKoK/NZGgSqGPmd0nr7BMOLosH3ap106YAm+DMedItgKCYiWgnSl/6ULa
	qQV96/Kc81OVIMME7vqEvB8mZg2+wdQ7baUFsip193F3U2HUan2ZN7TaqjKKsxXjMPl6SY3pabO
	0QsBPEmFtSaEHeFYVSy2tJAP89XacuSGLghjggULd+k8XdIl2p7YrpuAsDhI9lql9lM8D25nIqy
	PGx+bm4WzKfVF3OYHfycmu1ni77KSi9R/9eL+coNPNfS/Z37j5PQ2I5Jw0pVjE8dNoCABLCdBRS
	6RHgbbm/OFp5Z0Qz7DhFHVzvmOc2oAv5sGPHZPgpOqhnDJ8GIj6x4UROj5bvHre/tOZl8ooadcp
	1cvOoyB3ahxC8rWl2gbw==
X-Received: by 2002:a17:90b:350c:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-3893fe5b986mr7411064a91.5.1783598751625;
        Thu, 09 Jul 2026 05:05:51 -0700 (PDT)
Received: from houminxi ([104.167.197.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a52238e12sm1131084a91.0.2026.07.09.05.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:05:50 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v5] selftests/net/openvswitch: add ICMPv6 echo type match test
Date: Thu,  9 Jul 2026 08:05:41 -0400
Message-ID: <20260709120541.3556748-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Reviewed-by: Aaron Conole <aconole@redhat.com>
---
v4 -> v5: rebase onto latest net-next (2026-07-09), add ksft_skip probe for ICMPv6 key support
 .../selftests/net/openvswitch/openvswitch.sh  | 81 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 26 ++++--
 2 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index f75ee723415a..853dbc1b00d7 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -33,6 +33,7 @@ tests="
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
+	icmpv6					icmpv6: ICMPv6 echo type match
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -530,6 +531,86 @@ test_trunc() {
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
+	# Probe: check if kernel supports icmpv6 flow key.
+	ovs_add_flow "$t" icmpv6 \
+	    "in_port(1),eth(),$v6,icmpv6(type=128)" \
+	    '2' &>/dev/null
+	if [ $? -ne 0 ]; then
+		info "no support for icmpv6 key - skipping"
+		ovs_exit_sig
+		return $ksft_skip
+	fi
+	ovs_del_flows "$t" icmpv6
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
2.55.0

