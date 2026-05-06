Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B7477E53
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073171; cv=none; b=FKunkEOYsWUQfuyBfz5REI6rSsKPnAlwvvLjYdae5Q8KnAwbUPZgwaMNxoiCH5U3tD63K2FtBppZ5oZynPGrs2A9inhntrL1w2uFv5SDmz/UB6fC5wfUGhFVgBskb3wPkFOdDFWwXjpJLnGRPJpQFDPbj4TbX5Ovq5J31HFBvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073171; c=relaxed/simple;
	bh=7anuFwbxVPib5Qwdrz+mL3upuMV9kt6FzTMasaXomEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uxh6LzttX/3wQO/sDQPiwOioPQJYopavEgJqMPX0TofZHucjQ4cmWMS7n6fo6O//OpIJbq1dDslbis+vZSB5egO/I/jlEiupMAU1f3tDwZB5Px/8uSlOxE8HqY0EH6hyC4oBzTeteKA0p5aHl/7wS3zuiceC3QojePIrwYSQxT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndtEbbpy; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndtEbbpy"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43496e6a964so2629516fac.2
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 06:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073169; x=1778677969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtDHstlKXDMwZVDImgv2Go/2LwRbeKrLJRmqWEJNiDM=;
        b=ndtEbbpyjL6PTXhGzuuXUUNYgkpn41uTsrQGl96ZzWth1JedXi82z/MV7y/CWRkfLY
         yLJ0Suk7lsfSJrOWqEuWxkHv8wN/8uhAAYS8rY+U5HBuSlqEtoAFyPDsW8EdYiSTTsHP
         +8eW5XDBXIoxNY0nUcbafblovAtET+oV3wjHGEVEPCedkIGHaU3F25rnFEwzVxu0DzsI
         DYn9XvYaJWVHpz1MGANLgMpOX/iC/r7A98KdkWsoWvvUQr5laCmeJVwkPE0S2Pc7yfp9
         Pzo2flvKcUBJ+dtajWe/rziU8/usCKaYm8YOK/ZbO7p6wGsi6diarzyN/dlB5Vn7J4mB
         hN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073169; x=1778677969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtDHstlKXDMwZVDImgv2Go/2LwRbeKrLJRmqWEJNiDM=;
        b=OcTGjO04M90TcDQbbKmWykjzsiEbqlzLI7FZoCt6JUUcOOFmroG+jLPyswpSwc9Zo2
         yVXYZ4xpBjIRD2fIWKcqY2yylkxdYTgjzvQeCgQFhJhq3FRd4TMYMBs7KgoEay3kL36s
         SJkWBcM1e++BPX9Rv0dTsMIGhbQmy41XAgylcaVkPosI3bV4k4+LWAu5rbujvlOwve+X
         kIp0MqT4pJ+J1kK/ABIp9SD8yBTx/575LScdz4vE3xY5LN5tdEhA6eu478r7TnJBpki7
         WO1GiJ9a/bHq1zMuOzS9t3NBYzFjJsqyvnSBfUXV19vyOSQH2A+BV5QPwfz8AfXCpn2f
         vOZA==
X-Forwarded-Encrypted: i=1; AFNElJ/BI1VVQZOsXs8WQXylsKYthqqynStYP8aSZznDTtIqGFdU1nvLyQ0Px5XjxSe5C+kzg5FcWI5ySF9u0nBpZEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6nxrhDPhhiQA1qAyJQyLB10NP9ey6El9UQCsdYeIHmD7KwfN
	OelbuqkkmJhMG7HvXU2x5jsRV7pnFmMPrVKDQcvpNESSGcux1kXhf3lV
X-Gm-Gg: AeBDiesc1ZMf522ytLOmQ6V8LXt0pjeI2uUhXFMweuTS5EmXKiw84Z18ZYtu5F4KblC
	aEs1UdIakD6sucD//VuD5iLNwO+DTVRayXF2Md7Uy7v623knoeDQ55WcO3FaC6FYCCmO8952ItJ
	6NjjzcDb+pgYCObM61ljKZf5Hxtl/igF1jG3S3JPSzLpNQOzLEoI4wYmZx7N2P1uHub/VihInDE
	Cdi6zSHk2rFnPKY8Sm3X/mKcBZu4D3VbxhwT/yYfDDw8/m2kHpr8qNDh5WTn6K1qFXcbkcVl5Gi
	41T2Zc6Ad2mGYcUqRDtffLVowdMBRIn3MZ9RxdG6rtWstsOn+zcVBPveab2R7EJGYFAdsCS8PHz
	AHoKTc8WGgS+ZBny7Yy5IM43HsVDJubrJytYJDAnHHuAhg01PyLVcht+xNyWY8qnjv5FLDPcQVM
	haIbBE2wmt3KJQccHQHU/tWCw6xw==
X-Received: by 2002:a05:6870:c18e:b0:42d:c200:4214 with SMTP id 586e51a60fabf-434f663b9ecmr1936790fac.18.1778073169035;
        Wed, 06 May 2026 06:12:49 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434548d9decsm17327859fac.3.2026.05.06.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:12:48 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/2] selftests: openvswitch: add pop_vlan test
Date: Wed,  6 May 2026 21:12:18 +0800
Message-ID: <20260506131218.1880852-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506131218.1880852-1-houminxi@gmail.com>
References: <20260506131218.1880852-1-houminxi@gmail.com>
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
index b327d3061ed5..a5636881760b 100755
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

