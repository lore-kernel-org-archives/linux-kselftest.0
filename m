Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03003148D2
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780107305; cv=none; b=M1AGTCyrrP4KN1CpDuS8efaXyAXwQqcrYfCZAAklZ8ZlVth6L4WQWmb6tvBqWDiZ4rFy0jhVXxG0lQhReSfPEYrXKkvuMkKahCLY+RKjLBp2Dgs8Jf+npZyNX4a0JsWMiqjEYW5nYHbI6DQSY7lo8wGYGILiAd/dLXbk2eDXPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780107305; c=relaxed/simple;
	bh=8+8eewby6tCNXhI7PtA6+ck9wTW1UcajL2XqbVrzwOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNbJoJxmwLfx5mdNrwhx6Oiwo85iBfxIax5fAhbxuBDzbyUZfjb9aiEDNRx5WmnMSaVaEpQLRjcO1JXkkHgUeMq1rYErgS+dNyYP3IPi7w2lGzGbw0U5S0CVrg79dbqxDQefGFL6AJdSkW0ptVqLf5Y6HMmgkfQacON0y+pLWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsVcDVvh; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsVcDVvh"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f590dd91so916798eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 19:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780107303; x=1780712103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6zD0KOajb7NsFpcEukeTlW8n3/6TkB9MtUuXmii4w4=;
        b=VsVcDVvhLGKZFJXp6ikisEkeXi3a4gdyWbkNNvNMpgwmNim4C+/100Nyf62HeiuBzS
         ONUt48CmSbTvqtjudX8RVYL8yaC6AulTgsQ9BtK13qB5qiqQmPEt/gKMXMUBVa8r+Xi9
         1QY1Y8ghdatlF68g2VIG3Gb4O/Ns5SRvUKiUkfMrohG1OSxa5qKaW7r/H245DRdHbhse
         rJ9E8nqzoBcCuGYASEklv3VWFaJToqTVjeqDjEf52xvqoTFf2siZXmU0nsSoepLncVie
         RxOthJz7PL3CejVTD/5SHZxMC+Fcymzozz38q1X//1Ch+jABhk+u+Ai6wdUdKDQ8pS2t
         Riag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780107303; x=1780712103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6zD0KOajb7NsFpcEukeTlW8n3/6TkB9MtUuXmii4w4=;
        b=KzkBammFvV59yGcYihgnJ2flL9WMujrxOuciAalLT33kT/kfCN9Cs7BOPpNOIoLVHa
         3PeGMwMWtite0qV6RvNY1XPjLRqj30gjXqMw55nEwdx8PdxrznYfj97PyCJAMY9+v+lO
         lXawPjdv/gAA8ymIm/4QEM/TB0iomtaK2L+nYDpbtFCgYNbbELIahtoBl9Rs1YoeA7YR
         UwvI6u2wp2CRlJsNq+X49LD67efdB30HsRl+P3243YpKBz5Yxg3943IwwR6sjhaYL2Va
         WswtrVILYJpnckwTuCVk1HiA4NdksBYg70l3yRGST83+18c7UI3k+4BkXWO5+n043vc4
         HrJw==
X-Forwarded-Encrypted: i=1; AFNElJ+DSa/2qZEUz9HWwiC1vLUxK08Ojp3c0eLpJwnIcwqtIHornggFWQwY+uNJIEgJp0P+xftWfAC0AoPDi4lbjPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT10mb2wyQVJjn94tsMCxc3wz6Iks26NzShOTPqmKHr4vbR+bv
	hiIL0sKjjSyHovL9OEV+2EkNtZdcH2ttjDppXLqfEG6wQM9Jhf21JKu1
X-Gm-Gg: Acq92OGjKE7EvLI80jBAyJo675tPq2qu5ZSAPWr77+gQ4UlUvyQW37sNR2gAhVp28vz
	hJJEnRYd1kgrgk5+0KTIVlE1Mo95J5ZwJWTM92I8pi/JY0yZR8kcH9uHLZxwFXjK8Ll7ZY8Teyu
	AhgKEx0SEhHxlSgWL5opAeOCBot5Bv2Rox9tmDqPJw1Gz52thJHUDXv2Yx+t30OQO4Vwko7dMqT
	pTEFiHSs2jhsI6HICHyd/66aFvXZMA9WhLmnAgthDkzhVFuackg6Ao+BmMtYr7vlR1guGngUIZh
	osoaXgdui2OhJ2Ej4m9RaaBSRfD2fyIodyeRhRYY6V51pMYJekfOrJyOwnk5PasjaJq4GzevBoJ
	KglSKUnWD1kt5AzVh0GAW/YsYsQX9IjCCjnjMaQC6iviZHaibCzF52akHO31YI5MV1jlfdE4yzL
	1c6AyUkcRttUsUr9/DdKiEdkGkPwE=
X-Received: by 2002:a05:7300:724d:b0:304:bce9:25fa with SMTP id 5a478bee46e88-304fa525843mr1077488eec.4.1780107302753;
        Fri, 29 May 2026 19:15:02 -0700 (PDT)
Received: from houminxi ([64.118.153.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c312csm3080012eec.6.2026.05.29.19.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 19:15:02 -0700 (PDT)
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
Subject: [PATCH net-next v5] selftests: openvswitch: add dec_ttl action support and test
Date: Sat, 30 May 2026 10:14:43 +0800
Message-ID: <20260530021443.1734484-1-houminxi@gmail.com>
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
Reviewed-by: Aaron Conole <aconole@redhat.com>
---
v5: shorten test list description to fix checkpatch line-length
    warning (85 cols -> 78 cols with tab expansion)
v4: fix three new pylint warnings introduced in v3:
    - add docstring to class dec_ttl (C0115)
    - suppress invalid-name for class dec_ttl (C0103)
    - rename parsedLen to parsed_len in the parser (C0103)
v3: rename NLA class from DecTtl to dec_ttl (snake_case)
v2: use dec_ttl(le_1(...)) format, consistent with odp-util.c
    (suggested by Aaron Conole)

 .../selftests/net/openvswitch/openvswitch.sh  | 55 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 39 ++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 8cd5b3d894ab..a415e9dec8cd 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -29,6 +29,7 @@ tests="
 	tunnel_refcount				ovs: test tunnel vport reference cleanup
 	drop_reason				drop: test drop reasons are emitted
 	pop_vlan				vlan: POP_VLAN action strips tag
+	dec_ttl					ttl: dec_ttl decrements IP TTL
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
index 3b6a26e265a4..3342e295293d 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -388,11 +388,21 @@ class ovsactions(nla):
         ("OVS_ACTION_ATTR_CLONE", "recursive"),
         ("OVS_ACTION_ATTR_CHECK_PKT_LEN", "none"),
         ("OVS_ACTION_ATTR_ADD_MPLS", "none"),
-        ("OVS_ACTION_ATTR_DEC_TTL", "none"),
+        ("OVS_ACTION_ATTR_DEC_TTL", "dec_ttl"),
         ("OVS_ACTION_ATTR_DROP", "uint32"),
         ("OVS_ACTION_ATTR_PSAMPLE", "psample"),
     )
 
+    class dec_ttl(nla):  # pylint: disable=invalid-name
+        """Nested OVS_DEC_TTL_ATTR_* sub-attributes."""
+
+        nla_flags = NLA_F_NESTED
+
+        nla_map = (
+            ("OVS_DEC_TTL_ATTR_UNSPEC", "none"),
+            ("OVS_DEC_TTL_ATTR_ACTION", "actions"),
+        )
+
     class psample(nla):
         nla_flags = NLA_F_NESTED
 
@@ -635,6 +645,13 @@ class ovsactions(nla):
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
@@ -786,6 +803,20 @@ class ovsactions(nla):
                 actstr = actstr[paren + 1:]
                 parsed = True
 
+            elif parse_starts_block(actstr, "dec_ttl(le_1(", False):
+                parencount += 2
+                subacts = ovsactions()
+                actstr = actstr[len("dec_ttl(le_1("):]
+                parsed_len = subacts.parse(actstr)
+                decttl = ovsactions.dec_ttl()
+                decttl["attrs"].append(
+                    ("OVS_DEC_TTL_ATTR_ACTION", subacts)
+                )
+                self["attrs"].append(
+                    ("OVS_ACTION_ATTR_DEC_TTL", decttl)
+                )
+                actstr = actstr[parsed_len:]
+                parsed = True
             elif parse_starts_block(actstr, "clone(", False):
                 parencount += 1
                 subacts = ovsactions()
@@ -957,6 +988,12 @@ class ovsactions(nla):
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

