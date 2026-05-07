Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408B3BD650
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159776; cv=none; b=kJpl9A3BTZGYFtT8WWDBvHUCrP/SUqhThFVrGWl8axGQQL4HzGFgWEHIUyQOslIDbxjciCOuHsb+NrX0Ik7VBeOUapjeNvcj28McIJS19PWQXWybUIGJc2iLtkIG6FR/oaM8ggUB8fzgYz2oaWzB7gGI3lj0XiFFBASHZZBGfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159776; c=relaxed/simple;
	bh=S/+lPNFO1EPV7PWmJnmCZqDJVwmF1vQQCOD5Vbc4xGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwnQ8a8Hc44IF7GAcsDsNw4rmtklCILX8qubDLqQGJO1jKMWoTORdAh2bFudxJfpbId0UI8a3QgfdGgI68iDJj5C3m7Qa3XfvJP2XrBovLBkp/ZPtvQhE5e+rxbFPY2DJXYuOaeK2sw9jRVuz2Ed7dFkHxAPW4AJOF1G1w1qfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRfX+YQ9; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRfX+YQ9"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dcd17e19b6so510854a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778159771; x=1778764571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCencyebNV6RkeBeV6Zcfzu1ZdE6veaso03Op6l41qE=;
        b=iRfX+YQ9vsLaWfs6ATuiFDk9YuJLKXXy8S49lxeUrLmJVx4wxjZD/0qfl5g2MgBPpi
         pC0UHWf8ag5CMmZoeEYB+FVMgW+dh5CNpSdsq94lNeJqXJxn1WJ7GZZZGZAhsccyWBOu
         rC67AL0+nXZvNVkOYJx82hUImEyFqr421XqgLF4m/PQIsXaN+HuZXAK/AeKhe+Z8nfmO
         WvPUyc94zrEGfD+XUdl+xXObXXEeGyKuilf9GYj3gVrwM08NRp5y2z/ByVFhaCGjmcYs
         lmBZXrYCTPJDxiw/XjKkAPstZDNit4ErnUlrpOXCAXgxl1dg+4hwAquWA5+K9FMkHgRQ
         YOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159771; x=1778764571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCencyebNV6RkeBeV6Zcfzu1ZdE6veaso03Op6l41qE=;
        b=nAtAEILCBVKlH2VfwtH20ibVp0wi+3cUi9MQtMmNN8KWJ6YC/5qLXrXQA8ukIVQlpT
         Sm1ueg7XM4qcnvf0wb1b6U23NMRP43BgnzE0ghTl91HvB8wFVWvQL4AbKaG2Sdif+LSp
         Tunqh05wURiZU9C94fU7aIu9/Gje+gNsJX6h3Np4yqE/yRY3SOhJJOop4YQwtpRHWL9/
         YjZYQaAcXybkLudkRMw1bfmUL70XOUYW7NJvYK8/h+SG0mhBzOGzhdStDlIt4jxVnpo+
         frhGFp2SEQYfxalg8Qr9GBcPjp9/7pPPkt7LXAzsCh1wqet6G/YIC9fLmUn+NFNndJu3
         L6Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/eMzSgqXqg8QVpjonTIpsOf/IJHspXoZ3aibf4ainUsUUTKAGcjq5gPZpxNGG1UZQsppADdddXZwezAEP3kcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fODul1GrqgFPiiAd8vE/YCLh1iQqQaX1e06MksGTN2F9eVxt
	eqyqlZFftEl0VmRzaR8fMLcoQ4grfAglitGb/KibxN0w1PhEfh23MQ4E
X-Gm-Gg: AeBDievbuICf26a38Jdzh2C+126FTXr/8d32/mMH2ZiI7awyQmUbSCOkJuC2ZCVdXyR
	4WxmBk7xmVVGZT+LvOcHzqGiKbwh9C+oTlF9PnyIFAFXvNIWJLcSFxrNF/szApyjOs1D6rf/IGu
	LmakpReBm0U8khTfc0KAdRFZ+xphS6fLtfmtoadgCFHBwBqBIKgEsLK/oDSL7dTHFD3z5nFdgDV
	eyHLJUvRAFjIfLKK7/ZLrtWNf1ycRNZcQffayFe3RmspqHByqJuovMRSPjWFlSP7SeR7qBFm0XW
	A55jejfzWCHb3SVmy4i7CKzpJlUbhawzDlaNXsoXxK7DgCtu0aWDHpxX23q+4jn4MoX7tEJ1bDc
	XNFYiAGa6lYDKZicLzmup3vdqSJ2Ei0dOyyPAsWLyBm16n4I7qXL9MeYxdCi1uPsuAWCDoJkS7E
	xPYeVr3XeDAeB+PR16Buvy/yQjIw==
X-Received: by 2002:a05:6830:3592:b0:7db:b5c9:2d87 with SMTP id 46e09a7af769-7e1def36698mr4757801a34.11.1778159770507;
        Thu, 07 May 2026 06:16:10 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca826dbesm14047117a34.12.2026.05.07.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:16:09 -0700 (PDT)
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
Subject: [PATCH net-next v7 2/2] selftests: openvswitch: add pop_vlan test
Date: Thu,  7 May 2026 21:15:41 +0800
Message-ID: <20260507131541.2331771-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507131541.2331771-1-houminxi@gmail.com>
References: <20260507131541.2331771-1-houminxi@gmail.com>
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
 .../selftests/net/openvswitch/openvswitch.sh  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index b327d3061ed5..6d13ee8c2baf 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -27,6 +27,7 @@ tests="
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
+	pop_vlan				vlan: POP_VLAN action strips tag
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -830,6 +831,78 @@ test_tunnel_metadata() {
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

