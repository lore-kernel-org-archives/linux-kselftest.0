Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5392E975E
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663365; cv=none; b=cEGOnSPbCEWYHiEQ628h7a3bBgs7EmtzBlNbFnhGNd7X/A2J+/Av+8iHGGqsnzF5/mUeQYjlOfCSu/Mh6ppZ3KOl6gsHbdFGhnFEYy5z7hDgb12HTRKmign35VfsVG+LgyGX4I7wAuTElLlQo/3bCtfGos/kdx9B8A7EQ4v1hTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663365; c=relaxed/simple;
	bh=Pem7FrMpCZKUNwLK6sAyJL5pwQ5WPLPrP7HowcZm8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJiNwGyf5sIcRa+2iBbhVHRkFAHjaiixZhsd/V3/tA0cJ9qVpG39198SQ8Mdc43uP79DC+4xY8I/ejxaUI1m7K/2sALmKX9kfZYcjK8fhl/GAvNvLPOW9hVVJcgjeMAm9ZFEQnIbPg2RyyDHrxda0KL26k3VRzcKlKgCji9rAok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoYMhQUi; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoYMhQUi"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-135e7f4a295so1104943c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 05:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780663362; x=1781268162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oG1vXqHQcbiuYcwvNOUmuFadaY3mRNi0k+ecX5oMwMA=;
        b=QoYMhQUi7VygD/FrVY7weBe397UME8w5vO1fkJawt+cf/MQf0IQiUWzMN9zY9Gw3tX
         I5Gm7V0lerFbY0FKVmh2XTwZ9CCCcmMuWE0WsZ3Gp6Ch35HSp9U/iHzVaDlZ/xECANlk
         bwUU1NZwqlNiEtmf0xPrcA+E6HATXBfrxCGrRgoSq3qmwp5Es+7PWL3Qoox4TmldZuLX
         VLEfh1ZyQTLwsG9I29WL4YSKoLpJ6ZFe/qELJHCqwMhmGNAartHe136ITw8ZxhIOah8s
         mw+0rGwpAT89Dli8H6Vn3GeV3EfEE9O8/x8gganYN3WJHZm7jKIwhKvhuD4F8kDMk0tq
         KQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780663362; x=1781268162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG1vXqHQcbiuYcwvNOUmuFadaY3mRNi0k+ecX5oMwMA=;
        b=nEcZp15AQK7xoQW/5E5OkfvHtuqmP3USfnTm9XiSeybqA12RKNiJy+Q8nmWgror2jT
         rOgDYXvLs3OOAKX06N2Xb1yGI2foBskyymKeGnfPVvlmiJH93ss3XwW1yYcHAO1Cy+iM
         vi8hg55E30KPc52ncIntm47EFoVPZ7Zlh2t4DZ9fv2/TPmqFIJ7yiJ925vY3u8ANAlmZ
         pC+JLvMcFDp03rCZM4j5SumFdIJt5cSyH6ffBBkkKBzsG8404uQyH2DqNdzn4/vdsvLB
         87/HdPhoSQrnlc4sCuMJW4sBlGM89vz32LUbquvftMDvMWrdoIRVB34pbAGoPdK4gnKp
         Cr/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9km6jdO3uaio0zSLURJAjUdY1Iuz7T+qmlS/u2IXEddys/ediNP6JfHNvekerNeXzknTffcGmH/AtOT+3Sr3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMB7lhe+XOaRD1vV4jB+qy8pAG2/ZTDWpe3x7WKBWsbWGMujv
	Rg7WtIfrMBTsnVqpMtCutgLJlaytPRm4GbC7bNBqfRvtHQ/QUWNB4COE
X-Gm-Gg: Acq92OE301XtSpVgu4PiLNVHgV9Q7LzEK2mYur8ShwaT5gCxvr2SGXH8G5EYkCuZIHO
	WTLy9lVb6IM+BFT+N3lwpfH3EBpFUFWzBao0tBT+3xwoN2lcY/h7m/Wm+eE7823od/vkWI2lBBz
	o0zkTBGBQsJmfHJdgRsIYq7R7M6ghLPVUo4g+MKGIRZfc5Lc+vyFXIbdggqjd522viYNvIKf3ib
	1S6GDpqIBB1Td6OMQ3/LGWb6sJiBDXr88FayI1E1EZjlmV28qAX8MwDTzOw3Z3onjX2tNEQOkm3
	w/ULv1vZJlm/FpPzWJWHObZ+UNfbyFGsccDXKuZsShWB3MAdOMzoCeber2Ndcvf24W63hvJYSNq
	vUfpOLDm0+9nKTwSRSwa8CFMtf830tCNg4ssBJ/9hO3QuhHbpyBy+Y+9rZm0hpxAuf89/C80z7h
	eyaov7QD1cPZkS+IdvnL8tKA31fgqO1wlN/PJGiA==
X-Received: by 2002:a05:7022:439a:b0:12d:c4b7:5625 with SMTP id a92af1059eb24-13807d373f0mr849609c88.9.1780663362025;
        Fri, 05 Jun 2026 05:42:42 -0700 (PDT)
Received: from houminxi ([64.118.153.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5489d17sm5495109c88.1.2026.06.05.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:42:41 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	amorenoz@redhat.com,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next] selftests/net/openvswitch: add flow modify test
Date: Fri,  5 Jun 2026 20:42:22 +0800
Message-ID: <20260605124222.963815-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mod_flow() and the mod-flow CLI command to ovs-dpctl.py, exercising
OVS_FLOW_CMD_SET. Add test_flow_set which first modifies an existing
flow with new actions and verifies the change via traffic, then modifies
the same flow without actions and verifies the kernel handles the
no-actions case gracefully.

The no-actions path is unreachable from userspace OVS tools (dpctl
mod-flow requires actions) but reachable via raw netlink. This is the
code path where Adrian Moreno found a possible kfree_skb of ERR_PTR
when reply allocation fails after locking.

Make parse() skip OVS_FLOW_ATTR_ACTIONS when actstr is None so the
kernel enters the post-lock allocation branch in ovs_flow_cmd_set().

Suggested-by: Aaron Conole <aconole@redhat.com>
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 72 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 39 +++++++++-
 2 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index a415e9dec8cd..71190bc662f9 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -30,6 +30,7 @@ tests="
 	drop_reason				drop: test drop reasons are emitted
 	pop_vlan				vlan: POP_VLAN action strips tag
 	dec_ttl					ttl: dec_ttl decrements IP TTL
+	flow_set				flow-set: Flow modify
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -193,6 +194,23 @@ ovs_add_flow () {
 	return 0
 }
 
+ovs_mod_flow () {
+	if [ -n "$4" ]; then
+		info "Modifying flow: sbx:$1 br:$2 flow:$3 act:$4"
+		ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py \
+			mod-flow "$2" "$3" "$4"
+	else
+		info "Modifying flow (no actions): sbx:$1 br:$2 flow:$3"
+		ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py \
+			mod-flow "$2" "$3"
+	fi
+	if [ $? -ne 0 ]; then
+		info "Flow modify [ $3 ] failed"
+		return 1
+	fi
+	return 0
+}
+
 ovs_del_flows () {
 	info "Deleting all flows from DP: sbx:$1 br:$2"
 	ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py del-flows "$2"
@@ -300,6 +318,60 @@ test_dec_ttl() {
 	return 0
 }
 
+test_flow_set() {
+	sbx_add "test_flow_set" || return $?
+	ovs_add_dp "test_flow_set" flowset || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "test_flow_set" "flowset" "$ns" \
+			"${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add 10.0.0.1/24 dev c1
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add 10.0.0.2/24 dev s1
+	ip netns exec server ip link set s1 up
+
+	ovs_add_flow "test_flow_set" flowset \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "test_flow_set" flowset \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+
+	local fwd_flow="ufid:00000001-0002-0003-0004-000500060007"
+	fwd_flow="$fwd_flow,in_port(1),eth(),eth_type(0x0800),ipv4()"
+
+	ovs_add_flow "test_flow_set" flowset "$fwd_flow" '2' \
+		|| return 1
+	ovs_add_flow "test_flow_set" flowset \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	info "verify initial forwarding"
+	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 || return 1
+
+	info "mod-flow with new actions (change to drop)"
+	ovs_mod_flow "test_flow_set" flowset "$fwd_flow" 'drop' \
+		|| return 1
+
+	info "verify traffic is now dropped"
+	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail after mod-flow to drop"
+		     return 1; }
+
+	info "mod-flow without actions"
+	ovs_mod_flow "test_flow_set" flowset "$fwd_flow" || return 1
+
+	info "verify drop actions unchanged"
+	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
+		10.0.0.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should still fail after no-actions set"
+		     return 1; }
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 3342e295293d..9113473d425f 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -2702,9 +2702,10 @@ class OvsFlow(GenericNetlinkSocket):
             self["attrs"].append(["OVS_FLOW_ATTR_KEY", k])
             self["attrs"].append(["OVS_FLOW_ATTR_MASK", m])
 
-            a = ovsactions()
-            a.parse(actstr)
-            self["attrs"].append(["OVS_FLOW_ATTR_ACTIONS", a])
+            if actstr is not None:
+                a = ovsactions()
+                a.parse(actstr)
+                self["attrs"].append(["OVS_FLOW_ATTR_ACTIONS", a])
 
     def __init__(self):
         GenericNetlinkSocket.__init__(self)
@@ -2738,6 +2739,24 @@ class OvsFlow(GenericNetlinkSocket):
             raise ne
         return reply
 
+    def mod_flow(self, dpifindex, flowmsg):
+        flowmsg["cmd"] = OVS_FLOW_CMD_SET
+        flowmsg["version"] = OVS_DATAPATH_VERSION
+        flowmsg["reserved"] = 0
+        flowmsg["dpifindex"] = dpifindex
+
+        try:
+            reply = self.nlm_request(
+                flowmsg,
+                msg_type=self.prid,
+                msg_flags=NLM_F_REQUEST | NLM_F_ACK,
+            )
+            reply = reply[0]
+        except NetlinkError as ne:
+            print(flowmsg)
+            raise ne
+        return reply
+
     def del_flows(self, dpifindex):
         """
         Send a del message to the kernel that will drop all flows.
@@ -3013,6 +3032,12 @@ def main(argv):
     addflcmd.add_argument("flow", help="Flow specification")
     addflcmd.add_argument("acts", help="Flow actions")
 
+    modflcmd = subparsers.add_parser("mod-flow")
+    modflcmd.add_argument("modbr", help="Datapath name")
+    modflcmd.add_argument("modflow", help="Flow specification")
+    modflcmd.add_argument("modacts", help="Flow actions",
+                          nargs="?", default=None)
+
     delfscmd = subparsers.add_parser("del-flows")
     delfscmd.add_argument("flsbr", help="Datapath name")
 
@@ -3110,6 +3135,14 @@ def main(argv):
         flow = OvsFlow.ovs_flow_msg()
         flow.parse(args.flow, args.acts, rep["dpifindex"])
         ovsflow.add_flow(rep["dpifindex"], flow)
+    elif hasattr(args, "modbr"):
+        rep = ovsdp.info(args.modbr, 0)
+        if rep is None:
+            print("DP '%s' not found." % args.modbr)
+            return 1
+        flow = OvsFlow.ovs_flow_msg()
+        flow.parse(args.modflow, args.modacts, rep["dpifindex"])
+        ovsflow.mod_flow(rep["dpifindex"], flow)
     elif hasattr(args, "flsbr"):
         rep = ovsdp.info(args.flsbr, 0)
         if rep is None:
-- 
2.54.0

