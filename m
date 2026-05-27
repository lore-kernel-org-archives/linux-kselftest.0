Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F33C4545
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869237; cv=none; b=cPR343Ql6Dt4Q3Nz4//sUJHJWkRb+gzVM1NuuKgnloI9XcTBtCF65w8DQi21pC5IFqWYbId7CZUA/1hMT+oZgVWzK4Lq+uhqB+42d/l3I6zkrApPeSysRJcNnBLAdQVe0ZLnQfsFcnz2njtQsg2r1rWxR1BzsuKJJBhTy7SZcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869237; c=relaxed/simple;
	bh=pf0LKLzwVWXDhWNsiU8NvDk5jh6olD3uksGabCLjYMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hG0gdybAUvwPqUJoqJFlHZU2vq0uqrbleQ48HFL54ra6sxqQfNGOPHehd00FTH+iYoy4twIt0pyWF1carAL7rN62g6+0LBzNUnNoWnQfkLv3QTMhkjLlIL+80NzxLf6ev8oGicAOCcl0+VdHbPxWhiiUI1tG4DpakSE9b0Fq060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SajTCLMV; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SajTCLMV"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-485462d9290so3367819b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779869234; x=1780474034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezb0aPRXiOggaGXZC6UVQiIgRgnViP2vjaDISs1PSDQ=;
        b=SajTCLMV3cRArxdaPwDT1ki9eELzLOHcjNIn4P5cILFkXCbsQkq4+xVZS8e+yygNsY
         t+bFIWjh8QaqjdTlqoWT7GprVygIsc0dEy2lW3zZtE7dvMnrcBGRfzg52S7ZNMNo4Wvp
         QwCii/5WPEHI+TRWT7n3zieju5iPOWWtATYnH3Tn7Rk/bdd8EEiT6YSuQ3FUUC79Ivd0
         VuzAL7czOPQ5+Dmz/D2cpF9fMNUxRhiF/XL/rmaHj+Jj1PMfN3tvryftZB54NzM/+rJu
         M54bOKEEY+t04l23Vk332GXfpHT2WKOSLLoKD0hH8JnA+1E7Yr6xbXEylUMvKyRmO4l6
         G3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869234; x=1780474034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezb0aPRXiOggaGXZC6UVQiIgRgnViP2vjaDISs1PSDQ=;
        b=KC2F3Ln+wXejWEhdKieb++S/fGtnCrnXke/2s2ZrmqqUdSsAJ/uicef5jn1bJf0N6P
         54WV321C66g62l+rD+6c8AfV7OZ23wQNwaGb2uNPeKFP0TXe7OMFXdtTxgShcwrXMG1b
         1cmn8hq3WdK1BXbnTkBslvW83MAeKITY2YHECGzHbIKrd50tXjifusxxk4pehk2dExAK
         3VL8a8jLZrJjgUsp1lyzwoI6QXgWJYqB+LPCAO9GueShAcxRrteFpSftxex5b6AxC1Fz
         3dAHiqcUj21CsX22Tw5jCQilXjEtjue1q8P5UXdRk4Dal8G7mX5nfQ2hI5Pdyl3Bj52r
         heKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/V1s6ofoJqJkZDP6t1d6m/h9wsjdQ/2A2jel7Zv+xKbj4mAyyRWnPkgqxVcCSssq4CU43O46Iy2Lz3ki55GfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsu97GlfFgqwd2bXZJaeYTfDdforj7bh26xc1GB9qb8Dhc6MGg
	0gn3ZOoreyu2+jxVphc+0x+sMcVZjysMb17qusa2mjtf4S72U8qRHEHSyeIoT8vT/48=
X-Gm-Gg: Acq92OE427t5pntFfhmCHcBv1cAbEjIUB9dLv5O+SfCsLK6rAoP7wBB3rAt8Da3hiCL
	+uKXgs55lJS6zdkkBA0458NSr5aeRKjwpQnAs13377JZ+6NyayEzwz8XshHTfyYCK8DKzW6Ldq/
	Iu4T+0833L8s0/6YGkdCGS4B9GZydcOApr6H8BSLzzqjXsEjraeWr1J3UQ+8y7g3QcBN18n56Ez
	8ZWVtcX5D+uA+7D7wbz0loC3VgDetafG6Ea30ESa+Sv2g6lqA+MW6NedR2eX/tdCckRKuoEkLes
	jeltom4jrpMHqZBMFF5/L/0NFa+pCCFUCDGw2EZvbePh7SBquusTQE2DQ7UjcGdghPJUbC3PFeI
	ZSLI5SgeaQMR2uy0hxtvUCa76ZCgWDyyI8+ciLOUFaFtJQLwHIvdUS2W9kubfFzdcQZNzpyRqPJ
	uyKovuAOVggjTRnHY=
X-Received: by 2002:a05:6808:190b:b0:485:4c7f:8f51 with SMTP id 5614622812f47-4854c7f9928mr10670285b6e.25.1779869234293;
        Wed, 27 May 2026 01:07:14 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63976dacsm15476676fac.11.2026.05.27.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:07:13 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v3] selftests: openvswitch: add dec_ttl action support and test
Date: Wed, 27 May 2026 16:06:01 +0800
Message-ID: <20260527080601.615607-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dec_ttl action support to the OVS kernel datapath selftest
framework:

  - Add dec_ttl nested NLA class to ovs-dpctl.py with proper
    OVS_DEC_TTL_ATTR_ACTION sub-attribute handling
  - Add parse support for dec_ttl(le_1(<inner_actions>)) action
    string, consistent with the odp-util.c format where le_1()
    holds the actions taken when TTL reaches 1
  - Add dpstr output formatting for dec_ttl actions
  - Add test_dec_ttl() to openvswitch.sh that verifies:
    * Normal TTL packets are forwarded after decrement
    * TTL=1 packets are dropped (TTL expiry)
    * Graceful skip via ksft_skip if kernel lacks dec_ttl support

The dec_ttl class uses late-binding type resolution to reference
ovsactions for its inner action list, avoiding circular references
at class definition time.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v3: rename NLA class from DecTtl to dec_ttl (snake_case), consistent
    with psample, push_vlan, ctact and other nested nla classes in
    ovs-dpctl.py
v2: use dec_ttl(le_1(...)) format, consistent with odp-util.c
    (suggested by Aaron Conole)

 .../selftests/net/openvswitch/openvswitch.sh  | 55 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 37 ++++++++++++-
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 8cd5b3d894ab..3f0e437c34bb 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -29,6 +29,7 @@ tests="
 	tunnel_refcount				ovs: test tunnel vport reference cleanup
 	drop_reason				drop: test drop reasons are emitted
 	pop_vlan				vlan: POP_VLAN action strips tag
+	dec_ttl					ttl: dec_ttl action decrements IP TTL
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -245,6 +246,60 @@ usage() {
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
+		'dec_ttl(le_1())' &>/dev/null
+	if [ $? -ne 0 ]; then
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
+		'dec_ttl(le_1()),2' || return 1
+	ovs_add_flow "test_dec_ttl" decttl \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+		'dec_ttl(le_1()),1' || return 1
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
index 3b6a26e265a4..be9e324be12a 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -388,11 +388,19 @@ class ovsactions(nla):
         ("OVS_ACTION_ATTR_CLONE", "recursive"),
         ("OVS_ACTION_ATTR_CHECK_PKT_LEN", "none"),
         ("OVS_ACTION_ATTR_ADD_MPLS", "none"),
-        ("OVS_ACTION_ATTR_DEC_TTL", "none"),
+        ("OVS_ACTION_ATTR_DEC_TTL", "dec_ttl"),
         ("OVS_ACTION_ATTR_DROP", "uint32"),
         ("OVS_ACTION_ATTR_PSAMPLE", "psample"),
     )
 
+    class dec_ttl(nla):
+        nla_flags = NLA_F_NESTED
+
+        nla_map = (
+            ("OVS_DEC_TTL_ATTR_UNSPEC", "none"),
+            ("OVS_DEC_TTL_ATTR_ACTION", "actions"),
+        )
+
     class psample(nla):
         nla_flags = NLA_F_NESTED
 
@@ -635,6 +643,13 @@ class ovsactions(nla):
                 print_str += "ct_clear"
             elif field[0] == "OVS_ACTION_ATTR_POP_VLAN":
                 print_str += "pop_vlan"
+            elif field[0] == "OVS_ACTION_ATTR_DEC_TTL":
+                datum = self.get_attr(field[0])
+                print_str += "dec_ttl(le_1("
+                subacts = datum.get_attr("OVS_DEC_TTL_ATTR_ACTION")
+                if subacts and subacts.get("attrs"):
+                    print_str += subacts.dpstr(more)
+                print_str += "))"
             elif field[0] == "OVS_ACTION_ATTR_PUSH_VLAN":
                 datum = self.get_attr(field[0])
                 tpid = datum["vlan_tpid"]
@@ -786,6 +801,20 @@ class ovsactions(nla):
                 actstr = actstr[paren + 1:]
                 parsed = True
 
+            elif parse_starts_block(actstr, "dec_ttl(le_1(", False):
+                parencount += 2
+                subacts = ovsactions()
+                actstr = actstr[len("dec_ttl(le_1("):]
+                parsedLen = subacts.parse(actstr)
+                decttl = ovsactions.dec_ttl()
+                decttl["attrs"].append(
+                    ("OVS_DEC_TTL_ATTR_ACTION", subacts)
+                )
+                self["attrs"].append(
+                    ("OVS_ACTION_ATTR_DEC_TTL", decttl)
+                )
+                actstr = actstr[parsedLen:]
+                parsed = True
             elif parse_starts_block(actstr, "clone(", False):
                 parencount += 1
                 subacts = ovsactions()
@@ -957,6 +986,12 @@ class ovsactions(nla):
         return (totallen - len(actstr))
 
 
+# pyroute2 resolves nla_map types via getattr(self, name).
+# dec_ttl needs "actions" to resolve to ovsactions, but
+# ovsactions is not defined when dec_ttl class body runs.
+ovsactions.dec_ttl.actions = ovsactions
+
+
 class ovskey(nla):
     nla_flags = NLA_F_NESTED
     nla_map = (
-- 
2.54.0

