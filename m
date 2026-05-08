Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7273E8688
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247820; cv=none; b=eWiHpE+JaY/VOTK1Ddua0NX2ERt3y/wDrRzvMLr0XHHp+rh3dn+58bCZROke8Uhkmk6BmWVwNbqUJGvDpB2Ug9IyiJN7TsOaAfTkuJi1g14e2Gl9mntPJo21EiBm4BdwjSUm1StQtciYRA93b48kMBupsdXqedWSzTCOrHh/3yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247820; c=relaxed/simple;
	bh=QbDAcqmCs39fePaBHuY30LnIJo4+WAkx22s1UP1/KKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrfvB9E6dPZhfgQ/HG5uw31gZTkEUMiLQG3lsNaW3gXnvEGUAAE/NyKbMiaqyQ2dAMijGafNOyI6ntjqhyIR1byrSTJENy7ERG+8elHeM722Sh2Btvc7W86nadafCf4OdgzQhWWABbAGdBrYkt0osfG1cB6yBekYU2vVC0lfV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFYN6zP9; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFYN6zP9"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-42fe552aedeso714478fac.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778247818; x=1778852618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G++PmIEZH/3IDDChHFNdq5UZKsic2mGL2G/u53vWWPc=;
        b=UFYN6zP9IjzK2OCGFAdUrGI6JQR6HbBcfL1bCmwk6c1sMVx/K4Yp/MdFeqoXr1fxmz
         hytjyq8u8q9TcvTpC4qwJWeOFGgmflng5MPM9PhmDeDZZBSI1naZHm6Hg2HBUv0GH0CK
         ypbHaKx1qfbQSaoocxnnwzZ2SIDxeULxKchpPwPISPp9rvHB4Npq8rcNzHglFZHVNw9m
         YdKUx0oc4F8TTMo4Wf5E8nIAMjqrHQRxP/3myxwtSLnFx3eVtNbg3JX+n0kWUcpry1Ni
         8pQ9U2ZaJrUgL42YhzlNNoY5A+/0Ht4i+W21/MUOw1PXLPlbeSaBJ+Qa8lMwEQ2+gRr6
         vl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247818; x=1778852618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G++PmIEZH/3IDDChHFNdq5UZKsic2mGL2G/u53vWWPc=;
        b=J461P2+3mJsvGhWY0FsQl9fQQo7Fa8JHMGDXcNnGV1Pltj5eO8fMwH2/2gwfr5vHdF
         0aGm7jprJ0fQrWhkvAHgr3jfjkAvZYsC2RPxrz6P9rICO5eZtGrXMv7rksxwZee75Xwu
         w6nY/R4nFoe5uhsNG7KU3tIOODCvZ9hKo31j1Kmnl8zT13KnAlbOchJ3QM19N03zqCv9
         klG6McPBuwZB3eImrN/669GuSPCPkH6apegvgZ+SygUGv8FHs/fXqGJLQhb8DOvCyn7n
         ft950dpGLiprYHRkbx6/YZS0FkHAAqlh11yrvnCSnJacV2V1bluCBYtXFxUHKy2sSA5d
         smlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YjV9RSJMD0bgmzb2Y9JIS2ErZU5q9fr5Tx74GcBsBQIt1OkXGWTr+3ndmJJmDyv5wzTNAsr0toAvSdH5jmDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqY5IQawXQ7FHujFsQBHF86Wu6pa/8FQ+YdZV8v6F4Q5EJ2fGz
	9g7qMwkUm9n0V90zuiZmxeggL7j+uSwW2c+G3TDJ5N8kQya3ngkC/Si0zNCP4FBn86k=
X-Gm-Gg: AeBDievMXajw21Qt+v1dvFZZRKIf5gsThN/ae6LUnrcr0nsmSYTH/mMfnwc5ov5Lj4q
	YD4UOvYCVanuMFsVG47Oidhbrs9iJgIW+y9dw8sb6wSRln85/V6nSvVHZEeOFpS3Z9Kvz4gprkV
	S/55B6u3dye6+hqwAwG9cRkMTxLHjUjGm89OON69SySb5LxPFD5SzqAVIeTnlVjihvL2JGwNW21
	jANrRrxWzmxcqLZvYC6uIG0Jiqqm1q6gJap/TJtX0ZytzeEaj2ibhKJ2qNWhUIX1xSUo05Sg6MP
	EDUOKKjrwr2BUQ0rn2hB88iZS3cNHEcEK1op+033PPIQ7IW5luuzbEV9+GxTV45aFiX3dotKf7E
	t2b92jMcdL8MBgxzgpmWGex0uxGFDtESeu9IBcq4e7IW/XeA0/utM2G2UWgco/wSxL7FWw7I43z
	5YDCsL9ghlatSQIi0=
X-Received: by 2002:a05:6820:61e:b0:67b:bd89:90ed with SMTP id 006d021491bc7-69998d30169mr7387370eaf.41.1778247818205;
        Fri, 08 May 2026 06:43:38 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c76cc4sm1119108eaf.6.2026.05.08.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:43:37 -0700 (PDT)
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
Subject: [PATCH net-next v8 2/2] selftests: openvswitch: add pop_vlan test
Date: Fri,  8 May 2026 21:43:08 +0800
Message-ID: <20260508134308.2857449-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508134308.2857449-1-houminxi@gmail.com>
References: <20260508134308.2857449-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
Rely on ping success/failure for verification -- no tcpdump or
pcap files needed.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/openvswitch.sh  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index b327d3061ed5..a0e8e6cbd301 100755
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
+	[ -z "$ns1veth10mac" ] && \
+		{ info "failed to get ns1veth10mac"; return 1; }
+	ns2mac=$(ip -n ns2 link show ns2veth \
+		| awk '/link\/ether/ {print $2}')
+	[ -z "$ns2mac" ] && \
+		{ info "failed to get ns2mac"; return 1; }
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
+	# Negative: forward without pop_vlan -- tagged frame
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
+	# push_vlan restores tag on return path -- ping succeeds
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

