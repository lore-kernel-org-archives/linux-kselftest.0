Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56739A7F2
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750888; cv=none; b=aiblDDnraxQfPwexdC8SMOkHVecf6gliRyJa+7eyXF2IWEiqELTr6MDXmYe3btCEcx086+XTN9b2AHgHS/NUAGuR3UEIjMs8RpA9VuOsxAQughpmi92qcZ26C3SRB9tnpgmDc1XKupdxmp5k7rIal94B4m0QArunUSTqF6KXGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750888; c=relaxed/simple;
	bh=vJo8Et4Ka70jEcKej5D2UJ2IvboGkJfqC0GtAqic2aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWzXiyuon8vRyfCasV7OyTwE+Gg0Ef3ckJux7HCjzpllZNuemsM0wtwReOnpMnKEu0NFniS1JXaXj05kyLR3lzJ6T4KBv4QXrN2iGUFvCnVNuPPpFVtLrpFBa1rjBmgjbTTlvcSPbYvKZU/xeaSPSQv+Nll9nhZRTLI/FMmqOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnsm68sa; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnsm68sa"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69b905c10ddso136652eaf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778750886; x=1779355686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80AXNXJ5hpSRtR/OIpPH7OUMQU6bBhqaMTgSESMPNUo=;
        b=Qnsm68sams7CFubm0Y1UwEBYNsi5zodm2fuVHjnWn3FGRxpbsgVUty0dRgGi733+zv
         oVnYbme1csi96Afabiv3V0N1Q90sYYQrPVyxxER5CqEnA+DHx1NALnzu5wuSDGOoVXRX
         p2Wc6TUY2T9QvVAali+7l3exvRMYlJ6Kus8v1gwXoEzcNYcBNJz1ve5EyTG6FIM8lPZf
         W8d0gOumGO713Olt9EyfeOf0QBc49lYozpbXxeAXhTsejC0/b4wVT1OJiHH5jbThduyh
         XBqSpB5RJiGs9QkYXyjaX1WSRECxN/hIvBZJ2kk59dJPHy6umCc/t3ki1O+CYEr7asDZ
         JicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750886; x=1779355686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80AXNXJ5hpSRtR/OIpPH7OUMQU6bBhqaMTgSESMPNUo=;
        b=CqYgIAz+WF/nPLFx2bxaFVLOC65eUnuKRP1SkkOuuw6d4Xeu4f9KcQL8oo7xJw47Qk
         rpnAYBJGBP/T1gQwirLlfcs3JXauvXv8PUU66ZwnXFK8DTW5s88rI4SIMkQ3koHhVcCG
         Z/XwMyjGal5WNyVBUcWK7JK78l6ohj0v6N+r81Jo1hKG59BSB5PSDRQGVU/iJus+Gam+
         wK9i0oPZkSFotWkFZ3vBBcdc2BRahM2w4sUhZ6vB5mgGvnBRm4wTTKT5tu+cRnwDhyFB
         iuZKf61Dy266AXGQvQpJ/+jnxP7To1qmHi5tejM0tjdyAEz/T8myJ0H2M7MPpaRxKfW2
         NLHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PxGgaBql4xdcYj6ittkHAXdeN5tuLFRsJ7bG6ch2NH+G66cHMFEES9/mppRgjbiN9E6JIKam5gvxgyAUBDJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxljN4gmm4pQbckXRHNwH4qTyy2dBVkPnh9fQR+MSzilN9OPS36
	xOQ5LBt7ZJm2WJttX04N6honC2GABBddkzBAaerBczPr46jQh3c1LfCd
X-Gm-Gg: Acq92OEYQiIvr0FAjxhrPO3MVlXOJczteSIYooMOcjulV50IBMGnlRI2yTdvxLWuAlj
	nZiJpmj1qT8AZCZmfNdjBcwavCDHeuyxgsdqkt3eMie/N/g8h3Yc1Uh1XwJekZTQRuWtOGpuCzA
	sUF4s+GM0WtYd+Tb0gL91RQfxO4XyIYJ7dTf7VzYGIpmCqas7fAP1D4kA3hUlNTvYShE4ValM20
	Oyo9ULU7CqIBexQYf5CURm0KhpZwpnFMdQp+Q2bgqPJiBQ/rM/fWvpQDI1FdZ5ew5/yxfOr4Vcb
	QNwLqKZvaeOX7AdyyjL+cVXDW7g6VwgwBTMgfw8fGTuRhNCccaofSDz1su+pVWIt3dvWt2C4Sfw
	CLUI47Qj6WQ64EgopxCSk+1gGoNpY9bJAzhF7GwxVs/AH/F41pcgTG/w8I+8A8fLyMG2ddNPrHv
	RjOQIh7u6ruZIjxecUzFng4JivXg==
X-Received: by 2002:a05:6820:c8c:b0:696:7b19:9cf3 with SMTP id 006d021491bc7-69b7a9d7b8cmr3538431eaf.8.1778750885870;
        Thu, 14 May 2026 02:28:05 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b8ccdc7fdsm863512eaf.14.2026.05.14.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:28:05 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	echaudro@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dev@openvswitch.org,
	i.maximets@redhat.com,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next] selftests: openvswitch: add dec_ttl action support and test
Date: Thu, 14 May 2026 17:27:47 +0800
Message-ID: <20260514092747.3653656-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dec_ttl action support to the OVS kernel datapath selftest
framework:

  - Add DecTtl nested NLA class to ovs-dpctl.py with proper
    OVS_DEC_TTL_ATTR_ACTION sub-attribute handling
  - Add parse support for dec_ttl(<inner_actions>) action string
    following the same pattern as clone()
  - Add dpstr output formatting for dec_ttl actions
  - Add test_dec_ttl() to openvswitch.sh that verifies:
    * Normal TTL packets are forwarded after decrement
    * TTL=1 packets are dropped (TTL expiry)
    * Graceful skip via ksft_skip if kernel lacks dec_ttl support

The DecTtl class uses late-binding type resolution to reference
ovsactions for its inner action list, avoiding circular references
at class definition time.

Tested with vng on x86_64, all OVS selftests pass.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 55 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 39 ++++++++++++-
 2 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 3cdd953f6813..200c36c4d7bf 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -28,6 +28,7 @@ tests="
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	tunnel_refcount				ovs: test tunnel vport reference cleanup
 	drop_reason				drop: test drop reasons are emitted
+	dec_ttl					ttl: dec_ttl action decrements IP TTL
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -244,6 +245,60 @@ usage() {
 }
 
 
+test_dec_ttl() {
+	sbx_add "test_dec_ttl" || return $?
+	ovs_add_dp "test_dec_ttl" decttl || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_dec_ttl" "decttl" "$ns" \
+			"${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	# Probe: check if kernel supports dec_ttl action.
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'dec_ttl()' &>/dev/null
+	if [ $? == 1 ]; then
+		info "no support for dec_ttl - skipping"
+		ovs_exit_sig
+		return $ksft_skip
+	fi
+
+	ovs_del_flows "test_dec_ttl" decttl
+
+	# ARP flows (bidirectional)
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	# IP flows with dec_ttl action
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
+		'dec_ttl(),2' || return 1
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+		'dec_ttl(),1' || return 1
+
+	info "verify connectivity with dec_ttl"
+	ovs_sbx "test_dec_ttl" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	info "verify TTL=1 is dropped by dec_ttl"
+	ovs_sbx "test_dec_ttl" ip netns exec client ping -c 1 -W 2 \
+		-t 1 10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail with TTL=1 and dec_ttl"
+		     return 1; }
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index bbe35e2718d2..a73ca98d7aef 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -388,11 +388,19 @@ class ovsactions(nla):
         ("OVS_ACTION_ATTR_CLONE", "recursive"),
         ("OVS_ACTION_ATTR_CHECK_PKT_LEN", "none"),
         ("OVS_ACTION_ATTR_ADD_MPLS", "none"),
-        ("OVS_ACTION_ATTR_DEC_TTL", "none"),
+        ("OVS_ACTION_ATTR_DEC_TTL", "DecTtl"),
         ("OVS_ACTION_ATTR_DROP", "uint32"),
         ("OVS_ACTION_ATTR_PSAMPLE", "psample"),
     )
 
+    class DecTtl(nla):
+        nla_flags = NLA_F_NESTED
+
+        nla_map = (
+            ("OVS_DEC_TTL_ATTR_UNSPEC", "none"),
+            ("OVS_DEC_TTL_ATTR_ACTION", "actions"),
+        )
+
     class psample(nla):
         nla_flags = NLA_F_NESTED
 
@@ -632,6 +640,13 @@ class ovsactions(nla):
                 print_str += "ct_clear"
             elif field[0] == "OVS_ACTION_ATTR_POP_VLAN":
                 print_str += "pop_vlan"
+            elif field[0] == "OVS_ACTION_ATTR_DEC_TTL":
+                datum = self.get_attr(field[0])
+                print_str += "dec_ttl("
+                subacts = datum.get_attr("OVS_DEC_TTL_ATTR_ACTION")
+                if subacts and subacts.get("attrs"):
+                    print_str += subacts.dpstr(more)
+                print_str += ")"
             elif field[0] == "OVS_ACTION_ATTR_POP_ETH":
                 print_str += "pop_eth"
             elif field[0] == "OVS_ACTION_ATTR_POP_NSH":
@@ -725,7 +740,21 @@ class ovsactions(nla):
                     actstr = actstr[strspn(actstr, ", ") :]
                     parsed = True
 
-            if parse_starts_block(actstr, "clone(", False):
+            if parse_starts_block(actstr, "dec_ttl(", False):
+                parencount += 1
+                subacts = ovsactions()
+                actstr = actstr[len("dec_ttl("):]
+                parsedLen = subacts.parse(actstr)
+                decttl = ovsactions.DecTtl()
+                decttl["attrs"].append(
+                    ("OVS_DEC_TTL_ATTR_ACTION", subacts)
+                )
+                self["attrs"].append(
+                    ("OVS_ACTION_ATTR_DEC_TTL", decttl)
+                )
+                actstr = actstr[parsedLen:]
+                parsed = True
+            elif parse_starts_block(actstr, "clone(", False):
                 parencount += 1
                 subacts = ovsactions()
                 actstr = actstr[len("clone("):]
@@ -896,6 +925,12 @@ class ovsactions(nla):
         return (totallen - len(actstr))
 
 
+# pyroute2 resolves nla_map types via getattr(self, name).
+# DecTtl needs "actions" to resolve to ovsactions, but
+# ovsactions is not defined when DecTtl class body runs.
+ovsactions.DecTtl.actions = ovsactions
+
+
 class ovskey(nla):
     nla_flags = NLA_F_NESTED
     nla_map = (
-- 
2.53.0

