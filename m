Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C354ADD86
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024263; cv=none; b=r9bNfxp0DN2BSTlz+609e2heEtAp1ve4om/CoSWHzsbHjtuhT2vgMrR+UqTPf5vq+dQ9a+z0SnLhXwFKWiozo2G81STTEiHyQC3yrCurfXMBAFmRPxpt1aW6jjT+lGWT1F6Yt4tzujApneMf9HhWpYPGS9LJGsc7jHeXc8dqr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024263; c=relaxed/simple;
	bh=JZcX41kc/PnmNGyLbsWtRkljYop+3TqNeiSZZrwHmck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MS7eFOPCwVeFmBFcBYf6BRz/J3nK2fFCQN81bwb5jbdZ2AnTU68K58d4+s+3l90MuXT0QfdALEvA7m3kDrfEUS0fSwCqTl7UCmRsYyid5POAL4oaRejJkBX7X7D5PZZkEU5Nv3Y8mTWBXdUZPo9btiYmGqe5pIFmqzDoDTT3XIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIK1piuF; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIK1piuF"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66061993294so6092914d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781024261; x=1781629061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=av7EYFBoj6gq1ZvLp6d893SbwiyvMCDkkTCv0M4AutE=;
        b=UIK1piuF1PzV/1g9rsMp2cDSLJyyX8YMAM6K5fC4Un4kAvMjLeVHS8Srd9M+B8GUlj
         O1tF/YuXyY/dKf+tsI0OaLMNFWO5Yfolvl2mA8jLgOPaExHB22gpNG3KUsiQAXYUQfh3
         AVkaVkXMCKJDgC6/ryp3MNvaR++cCVBq4tP4++qpdYqKU4fP+BTT0V8E+/gWQp1zj+0i
         zhSL3SgiZ3zGXwGdl/KVKRTRwMKX9oXkPNDd5xvl1GcriZ2oZNUdWq2wpk7WWlb3NjdI
         iq+SdjbfrUFnl/JLyV3QzN52GDEkZRLzpoa0s4vxkKoWSdAO/tiw0yqo22c9+0uS59Rf
         W4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024261; x=1781629061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av7EYFBoj6gq1ZvLp6d893SbwiyvMCDkkTCv0M4AutE=;
        b=BXjMjXfReKkpIaxiKwu4eEkgoMNZ9bxVD4bq5cLL+qRn4kv7sv6RW03JTqZb+h7i2W
         yXK1vy5kZqpz8HKtVlUeL0lXgygff0DzJqc69SfbDLHGazpUqG43GmYpdsP7FTsNfdu7
         /yn4EFxZp8+iDmc2qKpKTo0tQr+bB6zmUDKDqIdTqaDLgu3469pvRO/nfHhC/immKYu7
         i/8paA+ahE97wKMWC2Reajtq3xzSHThwCiEc7L3jadBJEo5Rt7ra6hyroIlCNijZRpdd
         kHKISx4lFAfGi8a0JQ+3kPg4L+971CEU00+aZBH/me3nvW6pJ5ON0P11H1VbLR8hKFP0
         u0+A==
X-Forwarded-Encrypted: i=1; AFNElJ8sBH274TQ92LwWghh9TiudlksDi/hwq/C1cTukQsbC6b+TbWOrSrRqI7u1Qs5zX4oWKcaBR4SbJlFrDD7oyxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzf27sTCbSJBex09QXN4de4oiTbqi9TR26/WNd6ZZ/C96A2z4t
	PDDilj6DH1yu3dGMlnydWXmSQpYPRuHKaOk2DlHYqlP4hIDCT+CGa/Yc
X-Gm-Gg: Acq92OGdQNtDhQIaQhhOvQxjpQ5lMAaOr75gLKhCGqd9X2YX81uWKNZQ54MTVtd5BPh
	Bb/z7OqK2aX3IwWjrqGlO3vAggA5TBqT3xGzumLVPJDN/yLbVQ1CLuftMMoznZ1+yW6zxQiImCW
	s9i2noBO+QRi87maGXVb2kMEL5Ouv0FliZ9mVwyu0IlzsWdD/UDUdiEPSbGfYhyEHAujTqJ3IWu
	1/T3m94v1hVmWdVJw/kn7sBoXzp8S7qJ85YbMWUUPmPdqdjOQnzag+njKgZU2cP3tnqKxes+lIF
	S59bRCnwahovI4/t8oqqnG4YDX1+PRMZMpZ5qOsVdlVMPNpofiLil9rcdt7d00kVxg+M7+9tqeQ
	cTax4FehVhjDL/ujtPFvPqHXJY9TmyDB+E8PWGV0lZ+J1wVK7AVQpvl7AQt/PqxyWdqqAhRWbKa
	7yT3aGgM4k2yuqxuilfMEzPIaAN7DYWx4cXGGZ
X-Received: by 2002:a05:690c:710a:b0:7bd:5579:185a with SMTP id 00721157ae682-7ed0c80a062mr196768697b3.25.1781024260523;
        Tue, 09 Jun 2026 09:57:40 -0700 (PDT)
Received: from houminxi ([23.133.88.228])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea215825d2sm99814537b3.16.2026.06.09.09.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:57:40 -0700 (PDT)
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
	amorenoz@redhat.com,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2] selftests/net/openvswitch: add flow modify test
Date: Wed, 10 Jun 2026 00:57:25 +0800
Message-ID: <20260609165725.107484-1-houminxi@gmail.com>
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
After the no-actions set, verify via dump-flows that the flow retained
its drop action.

Suggested-by: Aaron Conole <aconole@redhat.com>
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v1 -> v2:
  - Add dump-flows verification after no-actions mod-flow (Aaron)
  - Add docstring to mod_flow() (pylint C0116)
  - Use f-string in DP-not-found message (pylint C0209)
---
 .../selftests/net/openvswitch/openvswitch.sh  | 77 +++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    | 40 +++++++++-
 2 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 82f066a0ceed..d533decca5c1 100755
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
@@ -300,6 +318,65 @@ test_dec_ttl() {
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
+	info "verify flow retained drop action via dump"
+	python3 "$ovs_base/ovs-dpctl.py" dump-flows flowset \
+		| grep -q "actions:drop" || \
+		{ info "FAIL: flow not showing drop action"; return 1; }
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
index 3342e295293d..e1ecfad2c03e 100644
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
@@ -2738,6 +2739,25 @@ class OvsFlow(GenericNetlinkSocket):
             raise ne
         return reply
 
+    def mod_flow(self, dpifindex, flowmsg):
+        """Modify an existing flow in the kernel."""
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
@@ -3013,6 +3033,12 @@ def main(argv):
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
 
@@ -3110,6 +3136,14 @@ def main(argv):
         flow = OvsFlow.ovs_flow_msg()
         flow.parse(args.flow, args.acts, rep["dpifindex"])
         ovsflow.add_flow(rep["dpifindex"], flow)
+    elif hasattr(args, "modbr"):
+        rep = ovsdp.info(args.modbr, 0)
+        if rep is None:
+            print(f"DP '{args.modbr}' not found.")
+            return 1
+        flow = OvsFlow.ovs_flow_msg()
+        flow.parse(args.modflow, args.modacts, rep["dpifindex"])
+        ovsflow.mod_flow(rep["dpifindex"], flow)
     elif hasattr(args, "flsbr"):
         rep = ovsdp.info(args.flsbr, 0)
         if rep is None:
-- 
2.54.0

