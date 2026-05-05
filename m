Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F83537E3
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985429; cv=none; b=kCKh4wriOV0UdCbqa/JfIwpLZEI+QspF72NCR5SSVgJjbKdJELjtjZ66eBubHL/OJ9QI/PTDwA/kC1ak3mDFp7eVGVOq7DakZ/GYYf5reoGAXEYPpVHFmlUpk/yKL7BnhhruvQCbrqJhq2glfCcfexncIr4TwR9mv5sawCasSbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985429; c=relaxed/simple;
	bh=rpxghfr26FQh1HuaKwtjstHUrfl2oZ07Us0O76zjWks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5LeQs3W29R2JTKQxnTjxjLtQNfMlxTo9korkok8R53UO2Oa2nNkpy137ukBJWvJf/sm/AHwnBDPeKkkttHEk+4KlLDbtck72XWH6DHs/VbN/iIktKodnp4535VR0thjulS8zOKoEpLbvpd9dqBRcO92cBz+6/vmpiexWLCLvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmiBpldo; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmiBpldo"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbe437b072so3214673a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985427; x=1778590227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGEfb93ktgl3f/5UYg0ZpYbUgmiWQzqYOfMzkPyrudk=;
        b=hmiBpldooizuIxQHq3BXa3ABv4mBp8vCN0t3j1wZRe6E9PFR/wxADedHx3solynrF9
         Lvz70FB09W23hCqJxctDir0RYCqQZ82LO76PoV73fd3FdctmITMqChofmIvJdTqWBg13
         Zk5u7Q+kk1ecoDW9xoVfp0WDliZ2py3eLXkzjc8UYKSENec6SNGqrhLwnss7zTo5qalX
         T/v4wfEUdVRVLguvlwzD6PANuhaVqMFBe7UdO4mVE486sarI1Uh8O28GyUysRe2jVNsz
         d9TCL7xlfjB+g4hwas8RvnzjUHn2+f6T2p5dbBndtza0h79iMD4wgpLYw3MQG/4miSpm
         aOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985427; x=1778590227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGEfb93ktgl3f/5UYg0ZpYbUgmiWQzqYOfMzkPyrudk=;
        b=qfKRRvVODTi2uAT4Wui6mYhaeItcfBEDBTW15r/iRzO0K5Jk2OX1ct4Cq7wjHreHhm
         EkMqPJ3+w6Ta7TVobRKJI1emEqeC407xhtgj97zUsiOj2L9lxmlg+OBqj2c2wXRT6BDM
         RNh5O1trcDKP7Ch12cBExQWr0VAkx3CnXDZN0+ta72Px8wN0kYfOy9Z/Ni+PXSSpOoxf
         bCkyuQUv3GjyenKBYJGq0+gm/UT/zg/HbImBeLIdwyRJzi0ioAW29LDbPikhKX+igymp
         F60azu+0P3K4edvMa6D3xzZP9bqzPc3SyV06NemXQf4X6fOaYlD0cBnAhwYh5IsZker0
         KMPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GCfFhaoPALk4jM/SZpPNg5YH9/GOJywZeI6nQcKcFCW+4hwb8/Xohr4Zkr6Jwmcmq87KoQzMHSBzxvWDFI80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvri5mEYIq8TOK0QxtveM3H7iXhEkUtWazF4K67QRQVknwXlfk
	Jr38Bcy1l8i3bZs2c+UD/W3E3uMEUYyrD7nQaVe7q29/HUOX3S7wPTRR
X-Gm-Gg: AeBDieu9D73+A3ucnAQ/vwmAx6NG6Fv6L4aUSOA2LKfXcR7hnWpZ5UgaBzx7gZ7lcNP
	wZHBzhsz92YCaon9nj802fEt62yoi70OANEXkJ9catuhRuQYF0Iy9HB+ryZTgNp6nz0x0Wv8vyB
	+tyZQrpmwhAbBPPbcz3glBIWnlITCQ5ibKmSFTwIA02X764Pbx6q/s1jQV2NB7W9WdovIkSembv
	PUacWMWg82tJTBY0rITMinx6AeaiKhlBPF4pJqXGYwMeTSno1HJ9vsLVZmbjYR+iVex2V8GUFNJ
	zXNWzeG8k105GazqI14X1duBNhkfXOhHTzuH3lW3Fm8E/hbi3Vbxj6mk+PQ63xAiEHI1AE8s6xl
	X04HBkN0LzjulAOyCoR97q5mOBYPr/IWipFRgyxnAltKKSr5VYce9b8p3sdwXC/1AI4SdSg67jI
	mtH9wxQDYloQR4inZGcDTuu2F5sw==
X-Received: by 2002:a05:6830:920:b0:7dc:c43b:9599 with SMTP id 46e09a7af769-7e174a06448mr1554947a34.7.1777985426718;
        Tue, 05 May 2026 05:50:26 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca7a5e75sm9884812a34.2.2026.05.05.05.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:50:26 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v5 2/2] selftests: openvswitch: add pop_vlan test
Date: Tue,  5 May 2026 20:49:57 +0800
Message-ID: <20260505124957.1239812-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505124957.1239812-1-houminxi@gmail.com>
References: <20260505124957.1239812-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
correctly strips 802.1Q VLAN tags from frames.

Test structure:
- Baseline: untagged forwarding validates basic connectivity.
- Negative: forward without pop_vlan, tagged frame is invisible
  to ns2 (no VLAN sub-interface), ping fails.
- Positive: pop_vlan strips tag on forward path, push_vlan
  restores tag on return path, ping succeeds.

Use static ARP entries to avoid VLAN-tagged ARP complexity.
Rely on ping success/failure for verification — no tcpdump or
pcap files needed.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index b327d3061ed5..a64f4d515e83 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -27,6 +27,7 @@ tests="
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
+	pop_vlan				vlan: POP_VLAN action strips tag
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -830,6 +831,82 @@ test_tunnel_metadata() {
 	return 0
 }
 
+test_pop_vlan() {
+	modprobe -q 8021q 2>/dev/null || true
+	[ -d /sys/module/8021q ] || \
+		{ info "CONFIG_VLAN_8021Q missing"; return $ksft_skip; }
+
+	local sbx="test_pop_vlan"
+	sbx_add "$sbx" || return $?
+	ovs_add_dp "$sbx" vlandp || return 1
+
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns1 veth1 ns1veth 192.0.2.1/24 || return 1
+	ovs_add_netns_and_veths "$sbx" vlandp \
+		ns2 veth2 ns2veth 192.0.2.2/24 || return 1
+
+	# Baseline: untagged bidirectional forwarding
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -c 3 -W 2 \
+		192.0.2.2 || return 1
+
+	# VLAN topology: ns1 uses VLAN sub-interface, ns2 is plain
+	ip -n ns1 link add link ns1veth name ns1veth.10 \
+		type vlan id 10 || return 1
+	on_exit "ip -n ns1 link del ns1veth.10 2>/dev/null"
+	ip -n ns1 addr add 198.51.100.1/24 dev ns1veth.10 || return 1
+	ip -n ns1 link set ns1veth.10 up || return 1
+	ip -n ns2 addr add 198.51.100.2/24 dev ns2veth || return 1
+
+	ovs_del_flows "$sbx" vlandp
+
+	# Static ARP: avoids VLAN-tagged ARP complexity
+	local ns1veth10mac ns2mac
+	ns1veth10mac=$(ip -n ns1 link show ns1veth.10 \
+		| awk '/link\/ether/ {print $2}')
+	ns2mac=$(ip -n ns2 link show ns2veth \
+		| awk '/link\/ether/ {print $2}')
+	ip -n ns1 neigh replace 198.51.100.2 lladdr "$ns2mac" \
+		dev ns1veth.10 nud permanent || return 1
+	ip -n ns2 neigh replace 198.51.100.1 \
+		lladdr "$ns1veth10mac" \
+		dev ns2veth nud permanent || return 1
+
+	local vlan_match='in_port(1),eth(),eth_type(0x8100),'
+	vlan_match+='vlan(vid=10),'
+	vlan_match+='encap(eth_type(0x0800),'
+	vlan_match+='ipv4(src=198.51.100.1,proto=1),icmp())'
+
+	# Negative: forward without pop_vlan — tagged frame
+	# is invisible to ns2 (no VLAN sub-interface), ping fails
+	ovs_add_flow "$sbx" vlandp "$vlan_match" '2' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -I ns1veth.10 \
+		-c 3 -W 1 198.51.100.2 >/dev/null 2>&1 \
+		&& { info "FAIL: ping should fail without pop_vlan"
+		     return 1; }
+
+	ovs_del_flows "$sbx" vlandp
+
+	# Positive: pop_vlan strips tag on forward path,
+	# push_vlan restores tag on return path — ping succeeds
+	ovs_add_flow "$sbx" vlandp \
+		"$vlan_match" 'pop_vlan,2' || return 1
+	ovs_add_flow "$sbx" vlandp \
+		'in_port(2),eth(),eth_type(0x0800),ipv4()' \
+		'push_vlan(vid=10,pcp=0,tpid=0x8100),1' || return 1
+	ovs_sbx "$sbx" ip netns exec ns1 ping -I ns1veth.10 \
+		-c 3 -W 2 198.51.100.2 || return 1
+
+	return 0
+}
+
 run_test() {
 	(
 	tname="$1"
-- 
2.53.0

