Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49322F5468
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779985417; cv=none; b=B2sR4RfjrG/poTyHXeH6JKezW084yy7pMK7H3PNBfcMEgdsdTxzLx7wzctUyNAxznbmOU00ta7BD15QeKLxXBlcLy7cnE+S4cTBAGAHVDWd7xOi/djnKl9fk/FsOa1yl1i0STnlpdFFI9Y+oeJQY8yePbIlDC6NvAPLyS7lQHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779985417; c=relaxed/simple;
	bh=MIhgDp7K2Bx8ph7rfsCJg4mzM89NfsmfqsGKY+yk07E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqvYjWaxQ5Zz8BNN7AHB0HYI9JMRupHcEaUjb8aSrTnTZAAr0/vRne0hjcWevE5hOgGZnqxVx7GtjpiwyksMBInyZSq3o2yYfuEzum0kLqII2W3ZV7HWaG0XQJxZoNRCXMXy2CCFLfLfyD9JRKYvYKsOSLZMkD4iSw3316NntAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNd2R0SK; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNd2R0SK"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304d8e3bb72so1778622eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779985415; x=1780590215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69Nx/roug+F3DFPV7LqBlxwAPIUI+gEB6ZueMkgnBcM=;
        b=TNd2R0SKNONImXxxtR/nSSV217k5PC4CguwdTaYthcpNO/W0J974z2g3B6a7kJoePj
         j/p1KYNXIxGnr2baaFoYl3rOXxdoKQfzwCMGjCTPdb5vup2Lq90JigGoFvrpp+fHafoY
         L9HXlQqbF5vZ5MPOSJ/ibb1M2Kx/21Ns1bMX/U5UhQ7com3dWcPl3pyafHWPpmp/NBtj
         BgcFmaq3H4B7/HaXQfxIwd7/0fG626YybeRiJ2uU/4n9kuszHn6CzBS0Tc5GrD2uL/JG
         Vb5oyJnixmtf1A7Nwpd+IHVvr85dyaXp6c6iGbWCTE/rPgFQfUxSs2GG13GqpLk1yBgY
         vP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779985415; x=1780590215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69Nx/roug+F3DFPV7LqBlxwAPIUI+gEB6ZueMkgnBcM=;
        b=dCtUl57Ojo4NkFRXtME+fbkB30O+HwZOnRyX4y354vKd/M3lIeQ6Dh2zbT6zcrB4o/
         kySj7qpp2/y+cHzbqD2vEPUb+4/ZJGiKqvTGp68BMm1NJOHYN8tcbTDVmztkIO03HgdP
         9ietxE9Sn3hKdB8Ze+pb61OSVFF+8nhXpDi8On5p7z9C2dSzOr0G+Xl2hALs+ZQgRQ1X
         ykK8JyjWsS6pQ1vd4fT7sx/ml91KmHWv5PcZx+6GvGMc1cF0iRYbUtHq8ZL8Cm2HcKgX
         SU8mbGevXRd5r68lhIfVUu2HNrVZ1XonYKccG2GWvlxwmwBDLkwoXVkbwcsHckTTh8RJ
         lWBw==
X-Forwarded-Encrypted: i=1; AFNElJ+WaStIGtp4JEHDbrVZpOT23si2YdRkkzzREztNSLK0ZuP1pjMFvAiL5kuiz9Us9NRQrvWamuvFpd1E4HBCecA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfhbFOKOkA5y6tuxx52iNmx+TRwqeqf1hgbiIx7NWstXjHoIm
	30OkCyO4CC7IKtraNoi3M0HoUuw6azFAzYP4oRqCidXtQwWoqKER0CqD
X-Gm-Gg: Acq92OEFkBaDc/tBn2AT/xw3A1XnqQ2GSRWLRqaz3P1teK2RoY8+EArka2VUe6Tf5yq
	vbcB+YTpDTM+k7aFsfyMdPldOdwLvwtR/UGGlgI7xd6HhxItOK7h2haXin1Jsnoamw4hhNCNsKe
	8VD2CzJdu3jDhdCS04P6apG6lnovMa/KbvdOCvp6TQRltx/jUQSYaCZVhgGayWEseQRgkHyRt27
	NUWYK66uaWkC+wsgmPge6hfOtHxSllYntLvbX1ZVvOdAAZEM0wwjHHdlRhyIPVwXUHVJcesaPyW
	Wq0xvqKdUFqO5Qmjx3Z17qKgljEBIix0s9oXXjsWUZqr+xjK05Fvy2unUsegavAYd3MFb44uYyx
	T9nlHxfKfc9zEIj03Fw0I9pIOycgEpbGkFbG6NAMJt3kustwwe6GUcXsp40l0vv6FRiLvMN8tS3
	scSqC/Uzf1nlCsUCw4Xz0pA+XMVg==
X-Received: by 2002:a05:7300:e424:b0:304:819f:502b with SMTP id 5a478bee46e88-304819f518emr8243260eec.9.1779985414550;
        Thu, 28 May 2026 09:23:34 -0700 (PDT)
Received: from houminxi ([166.0.188.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230f1bsm15396602eec.14.2026.05.28.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:23:34 -0700 (PDT)
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
Subject: [PATCH net-next v4] selftests: openvswitch: add dec_ttl action support and test
Date: Fri, 29 May 2026 00:23:22 +0800
Message-ID: <20260528162322.58527-1-houminxi@gmail.com>
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
v4: fix three new pylint warnings introduced in v3:
    - add docstring to class dec_ttl (C0115)
    - suppress invalid-name for class dec_ttl (C0103, snake_case
      is consistent with other nested nla classes in this file)
    - rename parsedLen to parsed_len in the new parser block (C0103)
v3: rename NLA class from DecTtl to dec_ttl (snake_case), consistent
    with psample, push_vlan, ctact and other nested nla classes in
    ovs-dpctl.py
v2: use dec_ttl(le_1(...)) format, consistent with odp-util.c
    (suggested by Aaron Conole)

 .../selftests/net/openvswitch/openvswitch.sh  | 55 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 39 ++++++++++++-
 2 files changed, 93 insertions(+), 1 deletion(-)

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

