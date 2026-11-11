Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418728;
	b=nj2uQXNjKRcz9ZlIzj8Pkj2Dy6HBatTjJcI6FUyQU99gnXU9z6oDjlLa0nHeEjhKkP3x
	 H8+xP837SySzcEdY4p4CPjizGmky9DIVN83tEpPYLCggT2deLOvLRuVOSQWnn+Nw0sETe
	 /fj7WOXJEW7gCkHn6okF8wuXzFI7tGj87JGHQjwsrgNWGuCVlGjQUNRSdf0TWvZjAnBht
	 dLHBg1OU9XBuw3Q8efVe+p0RopdvFiGUrsJq+Nhl35B2vJ7hOdYpkR10meZeQ9zxS3Bhp
	 JgC1NFwwOLuQCs4+Pov0KP+IxsqGi0cSte4c7GsZKGiP9ttsQwLrSlbqdHmH3fMfaPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418728;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=cUbc/Rqi/W6SjVjzL1aeId1mISnneHjYaqTJySRLtyM=;
	b=XGshcjWdbXoWWyzKU9tbZierIQ7QiXzkdJpHHKtY6+W/izZXAu2Rt/zbcE7O69CSvufu
	 NaTKEpwvrkXDRGYQmXAp+U2IPW55mN3YHWPrfu8e9Jx91qYvgV8V31hmKp52arVbdi5gz
	 36RHqpCKs2L/+njmurw2NVu0xfsf117SCOTCdJVmzIF59rz3mAOnfFEixIM1zXA0Ysy8/
	 5YOxkdY0iloGGGpsoe30B2wruBRYK/INmacHQl/7ZteezrcUscj9yZ593cdngQBN+fHH2
	 qgEmx+PuL0FJJDdF4CYIY42L57ce7vRxRXPtNqdXECHYq/nBN5jAz0FdrgNQ6RR+okg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A0606A326;
	Wed, 11 Nov 2026 17:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4A0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id E5405481CD;
	Wed, 11 Nov 2026 18:38:44 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
Date: Wed, 11 Nov 2026 18:37:50 +0100
Subject: [PATCH RFC net 2/3] openvswitch: preserve the L3 header after
 stacked VLAN pushes
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-net_restore_the-v1-2-6aaeffa601c9@proxmox.com>
References: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
In-Reply-To: <20261111-net_restore_the-v1-0-6aaeffa601c9@proxmox.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Boris Sukholitko <boris.sukholitko@broadcom.com>, 
 Aaron Conole <aconole@redhat.com>, Eelco Chaudron <echaudro@redhat.com>, 
 Ilya Maximets <i.maximets@ovn.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dev@openvswitch.org, linux-kselftest@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>
X-Mailer: b4 0.17-dev
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794418723621

A second VLAN push moves network_header to the in-band VLAN header.
Subsequent OVS set actions still expect it to point at IP, so they can
modify the wrong bytes and corrupt the packet.

OVS needs to retain the L3 header immediately after the push. Repairing
it only in validate_xmit_skb() is too late for intervening actions and
would not cover packets without CHECKSUM_PARTIAL. Keep this fix separate
from TX validation because it protects action execution, not just offload
preparation. Conversely, fixing OVS alone does not protect packets tagged
by tc or BPF before transmit.

The generic skb_vlan_push() layout is retained for tc classification.
The OVS push-then-set selftest fails without this fix and passes with it
in QEMU.

Fixes: 938863727076 ("tc: adjust network header after 2nd vlan push")
Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 net/openvswitch/actions.c                          |  6 +++-
 .../selftests/net/openvswitch/openvswitch.sh       | 34 ++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..bf0bb5e6de2c 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -197,9 +197,10 @@ static int pop_vlan(struct sk_buff *skb, struct sw_flow_key *key)
 static int push_vlan(struct sk_buff *skb, struct sw_flow_key *key,
 		     const struct ovs_action_push_vlan *vlan)
 {
+	bool tag_present = skb_vlan_tag_present(skb);
 	int err;
 
-	if (skb_vlan_tag_present(skb)) {
+	if (tag_present) {
 		invalidate_flow_key(key);
 	} else {
 		key->eth.vlan.tci = vlan->vlan_tci;
@@ -207,6 +208,9 @@ static int push_vlan(struct sk_buff *skb, struct sw_flow_key *key,
 	}
 	err = skb_vlan_push(skb, vlan->vlan_tpid,
 			    ntohs(vlan->vlan_tci) & ~VLAN_CFI_MASK);
+	/* OVS actions and TX offloads expect network_header to stay at L3. */
+	if (!err && tag_present)
+		skb->network_header += VLAN_HLEN;
 	skb_reset_mac_len(skb);
 	return err;
 }
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..339e3e09e643 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -28,6 +28,7 @@ tests="
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
 	pop_vlan				vlan: POP_VLAN action strips tag
+	push_vlan_set				vlan: SET after stacked VLAN pushes
 	dec_ttl					ttl: dec_ttl decrements IP TTL
 	flow_set				flow-set: Flow modify
 	action_set				set: SET action rewrites fields
@@ -1501,6 +1502,39 @@ test_tunnel_metadata() {
 	return 0
 }
 
+test_push_vlan_set() {
+	local sbx="test_push_vlan_set"
+	local actions
+
+	sbx_add "$sbx" || return $?
+	ovs_add_dp "$sbx" vlandp || return 1
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns1 veth1 ns1veth 192.0.2.1/24 || return 1
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns2 veth2 ns2veth 192.0.2.2/24 || return 1
+
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+
+	# SET must address the IP header while both VLAN tags are present.
+	# Pop them afterwards so the receiver needs no VLAN configuration.
+	actions='push_vlan(vid=200,pcp=0,tpid=0x8100),'
+	actions+='push_vlan(vid=100,pcp=0,tpid=0x8100),'
+	actions+='set(ipv4(src=192.0.2.1,dst=192.0.2.2,'
+	actions+='proto=1,tos=0,ttl=63,frag=0)),pop_vlan,pop_vlan,2'
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0800),ipv4(proto=1),icmp()' \
+		"$actions" || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -c 3 -W 2 \
+		192.0.2.2 || return 1
+
+	return 0
+}
+
 test_pop_vlan() {
 	local sbx="test_pop_vlan"
 	sbx_add "$sbx" || return $?

-- 
2.47.3


