Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7A46EF6B
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798568; cv=none; b=XS3+xwbPuWiVpfxX8dIiXkIpmhvTa2Jssc3ZHNlfzcgSlsB7cNF20OLIQ9TfOjQoAFEOKcNzi5sU/IQUhj2ylrI0I1uuDkxfc5QWE1gE1Q5J2HBY4FYVdWiPyxewo2T+lwMENTofH22HoPhP6Oz5BCcMf2EaznKwt+bijTjdqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798568; c=relaxed/simple;
	bh=QLQaEzIvYSIkTz2cD8EzTLAAc5HmHplw2gWBKjsuX8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TgmFwS0o1JNFkbfU2wuafBNYNsUmZ7dJW2zsTssbS2CDKsKUIKKaZDp+q1TXypZ3T3+RgjFcm+uDsfNZZY7xkiDxj9GdrCW0nkaRX1tzx/8MvJaotWs++gJ7aZMAUQKtjw1hcR8EQk5UuxMsRsrJCegHU1lVES23rJLSQRgbxuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj1ocLAI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj1ocLAI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso751459a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798563; x=1792403363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nW9s5No7cnl56d7FIHcHMDsAYwjGzDzga7SpovNA6ys=;
        b=Wj1ocLAIJ/feTd6E/Kd1jA3p8rRWaibwPK329i2VptoWCflOwH/vbVjg2Dasmn5tj9
         zfAiytY1dyF6agSotmpn/iiVG7XXLLpy4ngW2xI21IUTir80SZM8ntawPwgA8RnJ6L1C
         3h9KzQiP2e6b/RnijTrRYJmfk5AIKrPxdVY7uLjsuH/jQOv5K8/5TUJC1UIHIt7OahJ1
         n25qKnCKgX5SMvFd4xy220/KpLyP3NtF8nPfNIEK6DJNoxng24tIDtQoLDb76ojViCU1
         84mRUML/3Y+RRkRoxrPFVm6uPtCrWWZ4CRAPDJ3gzP1m8gaSsHVeTFGxCLXKXTQOD24S
         KbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798563; x=1792403363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nW9s5No7cnl56d7FIHcHMDsAYwjGzDzga7SpovNA6ys=;
        b=D9UvID0uts5tMPzHSAHj2BNDJ2oFQZjVKa3DFD4PiIw0Hv98rZOAml95bUGoy3Jp6S
         Lbf9mde31fHWYY8knrVkgJ7d4N1rzE92MiazZMQdX/l+MQ1DrUA+qmW79zicWeUmfZ35
         FQn+usNkLz6VgagohYQ0Fe85E3xD9h84o8LORrPUnz0lp0cGUUaBd+UYPBfg/8xhZ6Ha
         dLuFL7lHTTyEirE1YiZ2vo5Z4OtNCE0VNrP4EVimG+lvbOavIqlxK6Rn2IKdiIjjbMWW
         njzNhr3ubZF2Hr7hmoAMEEWGo6htMzGhemSqozr9v6xl9haSEA1hqMHzhg2pQeWobRme
         etmA==
X-Forwarded-Encrypted: i=1; AKwUvBxmOCYoR++kvg9g1GjDk6UUyoxuoN6yOhr3FKfjw+3qSUi0RX6BeQJdsAXPbKE6tgrAB/nwUCj6ehkLgpqJwmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRsxoRRquQyJpXnj/Z4f4PCtKzCPM9SlqYACvfHWjZdpxz7Dol
	YqU95KCXFmNmyGpvXAmOcEnriXJX4tu335+Wa98dAczuFphLUMJVT8u2
X-Gm-Gg: AYBFou33zHMhctOM8C1Ji1jIentByPiY/uf3zJugUnFCZDAqI1L3Lvu4uWGCuFxE6/B
	TU8EncACNYYKgJalEKmUhdmWTd98vKDs/vnZ1CUIxMkq700JKe5wpIQr7yZwEj37vsUuNfqf9DB
	ngGOQQEGdvYAFcM29dMjBpR+0F3jTabGxb6q8tZL+ykWCKGMuNIjdxCd3l6KW8S+5mX5mVDCVuB
	mdubeVR0KEN1bGhhM28W21PGQBufwSc7iQW/rluSdymV1xeITLDdgzWk9W2EAHzNsMbeRJKYknF
	h5bj9uyxXTQQl0s0atxokI4UKRuy1aznwirtXkRpmVxtCnVU4kfqOMMcTQd/ToM6da7S+q99Lth
	5ZEvYDbARIc46bRXbKOjMu5L6QMdhqpYqnwVMqZhIs9YM8IWaZNKD6DSeIFoIXRQeTi8wJXUuA4
	37o/1wYPdEFP/SrcHixSKzIXwzk5ZliR4aFMf4Lzlvn4YMM0tZQ+fkc7Fz6NAokGoEZGcAyyQU3
	/BVFXfQsTNBJJAe6g5/0cS4/2YlSfPPPKHXweWb6Ts3
X-Received: by 2002:a17:90b:2681:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ab3a9127f1mr6855981a91.20.1791798563154;
        Mon, 12 Oct 2026 02:49:23 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac05cac83bsm3372342a91.10.2026.10.12.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:22 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2] selftests: openvswitch: Test SET on later IPv6 fragments
Date: Mon, 12 Oct 2026 15:20:00 +0530
Message-ID: <20261012095000.3188473-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Send the crafted later fragment through OVS_PACKET_CMD_EXECUTE to preserve the unset transport-header path from the report. Set frag=2 in the action key and match DEBUG_NET warnings at the skb header check rather than a potentially inlined helper. Skip when CONFIG_DEBUG_NET cannot be confirmed and enable CONFIG_DEBUG_KERNEL in the OVS fragment. Drop the flow-counter assertion because its SET-action dump relies on broken formatting.

Link: https://lore.kernel.org/r/20261009090629.1694991-1-sahaj123.sc@gmail.com
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |  1 +
 .../selftests/net/openvswitch/openvswitch.sh  | 33 ++++++++-------
 .../selftests/net/openvswitch/ovs-dpctl.py    | 40 +++++++++++++++++++
 .../net/openvswitch/ovs-ipv6-frag.py          | 27 ++++++++-----
 4 files changed, 76 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index b062ebbce0f0..5cb3c0d395f1 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -3,6 +3,7 @@ CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
 CONFIG_NETFILTER=y
+CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_NET=y
 CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index b9a4c4bf4067..394cd45a292d 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -67,11 +67,6 @@ ovs_wait() {
 	return 1
 }
 
-ovs_flow_has_packets() {
-	python3 "$ovs_base/ovs-dpctl.py" dump-flows "$1" |
-		grep -Eq 'packets:[1-9][0-9]*,'
-}
-
 ovs_base=`pwd`
 sbxs=
 sbx_add () {
@@ -453,9 +448,23 @@ test_action_set() {
 
 test_ipv6_later_frag() {
 	local t="test_ipv6_later_frag"
-	local warning="WARNING:.*set_ipv6_addr"
+	local warning="WARNING:.*include/linux/skbuff\.h:"
+	local config=""
+	local config_file="/boot/config-$(uname -r)"
 	local before after
 
+	if [ -r /proc/config.gz ] && command -v zcat >/dev/null 2>&1; then
+		config=$(zcat /proc/config.gz 2>/dev/null |
+			grep -m1 -E '^(CONFIG_DEBUG_NET=y|# CONFIG_DEBUG_NET is not set)$' || true)
+	elif [ -r "$config_file" ]; then
+		config=$(grep -m1 -E '^(CONFIG_DEBUG_NET=y|# CONFIG_DEBUG_NET is not set)$' \
+			"$config_file" || true)
+	fi
+	if [ "$config" != "CONFIG_DEBUG_NET=y" ]; then
+		info "CONFIG_DEBUG_NET is disabled or kernel config unavailable - skipping"
+		return $ksft_skip
+	fi
+
 	if ! dmesg >/dev/null 2>&1; then
 		info "dmesg unavailable - cannot check for kernel warning"
 		return $ksft_skip
@@ -463,25 +472,19 @@ test_ipv6_later_frag() {
 
 	before=$(dmesg | grep -c "$warning" || true)
 	if [ "$before" -ne 0 ]; then
-		info "set_ipv6_addr warning already present - skipping"
+		info "skb transport-header warning already present - skipping"
 		return $ksft_skip
 	fi
 
 	sbx_add "$t" || return 1
 	ovs_add_dp "$t" fragtest || return 1
-	ovs_add_netns_and_veths "$t" fragtest client c0 c1 || return 1
-
-	ovs_add_flow "$t" fragtest \
-		'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=44)' \
-		'set(ipv6(src=2001:db8::99,proto=44)),drop' || return 1
 
-	ip netns exec client python3 "$ovs_base/ovs-ipv6-frag.py" c1 || \
+	ovs_sbx "$t" python3 "$ovs_base/ovs-ipv6-frag.py" fragtest || \
 		return 1
-	ovs_wait ovs_flow_has_packets fragtest || return 1
 
 	after=$(dmesg | grep -c "$warning" || true)
 	if [ "$after" -ne "$before" ]; then
-		info "set_ipv6_addr warning emitted for later IPv6 fragment"
+		info "skb transport-header warning emitted for later IPv6 fragment"
 		return 1
 	fi
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..a653353ec100 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -47,6 +47,7 @@ OVS_METER_FAMILY = "ovs_meter"
 OVS_CT_LIMIT_FAMILY = "ovs_ct_limit"
 
 OVS_DATAPATH_VERSION = 2
+OVS_PACKET_VERSION = 1
 OVS_DP_CMD_NEW = 1
 OVS_DP_CMD_DEL = 2
 OVS_DP_CMD_GET = 3
@@ -2218,6 +2219,28 @@ class OvsPacket(GenericNetlinkSocket):
         GenericNetlinkSocket.__init__(self)
         self.bind(OVS_PACKET_FAMILY, OvsPacket.ovs_packet_msg)
 
+    def execute_packet(self, dpifindex, packet, keystr, actstr):
+        msg = OvsPacket.ovs_packet_msg()
+        msg["cmd"] = self.OVS_PACKET_CMD_EXECUTE
+        msg["version"] = OVS_PACKET_VERSION
+        msg["reserved"] = 0
+        msg["dpifindex"] = dpifindex
+
+        key = ovskey()
+        key.parse(keystr)
+        actions = ovsactions()
+        actions.parse(actstr)
+
+        msg["attrs"].append(["OVS_PACKET_ATTR_PACKET", list(packet)])
+        msg["attrs"].append(["OVS_PACKET_ATTR_KEY", key])
+        msg["attrs"].append(["OVS_PACKET_ATTR_ACTIONS", actions])
+
+        return self.nlm_request(
+            msg,
+            msg_type=self.prid,
+            msg_flags=NLM_F_REQUEST | NLM_F_ACK,
+        )
+
     def upcall_handler(self, up=None):
         print("listening on upcall packet handler:", self.epid)
         while True:
@@ -3010,6 +3033,12 @@ def main(argv):
     delfscmd = subparsers.add_parser("del-flows")
     delfscmd.add_argument("flsbr", help="Datapath name")
 
+    execcmd = subparsers.add_parser("execute")
+    execcmd.add_argument("execdp", help="Datapath name")
+    execcmd.add_argument("execpacket", help="Ethernet packet as hexadecimal")
+    execcmd.add_argument("execkey", help="Flow key")
+    execcmd.add_argument("execacts", help="Flow actions")
+
     subparsers.add_parser("psample-events")
 
     args = parser.parse_args()
@@ -3088,6 +3117,17 @@ def main(argv):
         if args.dellink:
             ipr = pyroute2.iproute.IPRoute()
             ipr.link("del", index=ipr.link_lookup(ifname=args.delif)[0])
+    elif hasattr(args, "execdp"):
+        rep = ovsdp.info(args.execdp, 0)
+        if rep is None:
+            print("DP '%s' not found." % args.execdp)
+            return 1
+        ovspk.execute_packet(
+            rep["dpifindex"],
+            bytes.fromhex(args.execpacket),
+            args.execkey,
+            args.execacts,
+        )
     elif hasattr(args, "dumpdp"):
         rep = ovsdp.info(args.dumpdp, 0)
         if rep is None:
diff --git a/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py b/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py
index 869f9d6503ef..927676e83314 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-ipv6-frag.py
@@ -2,17 +2,19 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import ipaddress
+import os
 import socket
 import struct
+import subprocess
 import sys
 
 
 def main():
     if len(sys.argv) != 2:
-        print(f"Usage: {sys.argv[0]} INTERFACE", file=sys.stderr)
+        print(f"Usage: {sys.argv[0]} DATAPATH", file=sys.stderr)
         return 2
 
-    interface = sys.argv[1]
+    datapath = sys.argv[1]
     payload = bytes(range(8))
     # Offset 1 and M=1 make this a noninitial fragment.
     fragment = struct.pack("!BBHI", socket.IPPROTO_TCP, 0, 0x0009, 1)
@@ -33,14 +35,19 @@ def main():
     )
     packet = ethernet + ipv6 + fragment + payload
 
-    with socket.socket(
-        socket.AF_PACKET, socket.SOCK_RAW, socket.htons(0x0003)
-    ) as sock:
-        sock.bind((interface, 0))
-        sent = sock.send(packet)
-
-    if sent != len(packet):
-        raise OSError(f"short packet send: {sent} of {len(packet)} bytes")
+    ovs_dpctl = os.path.join(os.path.dirname(__file__), "ovs-dpctl.py")
+    subprocess.run(
+        [
+            sys.executable,
+            ovs_dpctl,
+            "execute",
+            datapath,
+            packet.hex(),
+            "eth(),eth_type(0x86dd),ipv6(proto=44)",
+            "set(ipv6(src=2001:db8::99,proto=44,frag=2)),drop",
+        ],
+        check=True,
+    )
     return 0
 
 
-- 
2.43.0

