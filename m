Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE9263F34
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 23:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776209293; cv=none; b=OD0hzpYv3EOYLEjMdNajRfxPy9Vo8Ca1NE6Es8YXxix0Si9oZAjK54M0VUYSC0cfNH7an2BoiKx15bg0yFOZnLAOxpqP5B21Uh4IOu30aKJDhaamJ9120ThWOczkDoFS35l2ta/xRBZrVVGQZkcVoXG/tOGDsnwnRai9Qk0SsgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776209293; c=relaxed/simple;
	bh=aYZRULxq+UDwCoSqziMpUqb5zkeflt/jUR+e0NsdbyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=d2RdEelegK3EQQxdNVgOMsyqbo0ggk1a6EGLLPOWaj9P86rk5FPDCCNAK4tf13TrMIKg9BLCOD9lDW+K6BkTIXppHwdqnC6vPxjji9nk3BezAY+RSybLUeULJ4gTNXmUpo+s/D9G4/w0rUem88KRzaim5QiVlrt/hbYWM8P9jXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHmF2XgP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHmF2XgP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c62fc8debso955603566b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 16:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776209290; x=1776814090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bHO+ZzL+lDSeWw1GERdEfrkm+6Yh9DAr7U7HlZQAIg=;
        b=lHmF2XgPVSqrpM/pRDdNERm1y5UBIXT+fGHRibi+dvXJ4ZPLOkUW/+GcywZOkXUDlk
         gIJRqUewG7magNtCDMajf9kubS2IDwDn29FO49y/Cpw/3cqty3uM4LpoWuUF0SelwLFQ
         dYLAGedJ8D6Z76UO3vpd6WbxHPNZInZF7HgcLsy68AEioqMwAhuy6OAhYVob5i6Vl4U1
         ZupVcOKAPBYodCwdhqfUMXQnXKqz9YwuvTtmp0mygH/eL77O5nuU/MqrgC1oCD3gA/yO
         9pkB7+dep6d4Ab/iGv/voUhNm02yVBTCUgRdzcDNQk5u1+LVhWZG3O9xW9H9QKn9mUZ0
         SRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776209290; x=1776814090;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bHO+ZzL+lDSeWw1GERdEfrkm+6Yh9DAr7U7HlZQAIg=;
        b=Be67mRvRyXUTPadvZ8T4THjZyedj5F/dQrZ02763ku/+ZB+Qh0RarmOE387oRrjaVR
         WFHFQXUQYGolrvSaBcn5JXnFw6Gii1egzcyVkHenGBdCmSv3pu7Ukdp07akUdxSJz0Ru
         V+tRR5ccgZMJCH7gpZF9WEIMpFUH3PL6Ux2oST+s1eoFVDZW4abOSEIi83u7BMRxgZvI
         1M05rAmZAHNmTf0qThRWFNDVBIZc+q1XWGfdiqVItECU851Xukff8T7/o2Wt+diLGtyl
         5FNhmhx5LqFwGPejc+QGkQjyp+87W3tmukRLD7AwWP458AndbsOdWqyq2RipAFRINPUP
         iWag==
X-Forwarded-Encrypted: i=1; AFNElJ/y+VnnReHKV5+CR5yDwOqGPeSotkRrn1w3DjXad8ifzHpefW338XaNCbqMDZ/T1jN8dokR25ZlEw0/XCcgeh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZM6BSHS54T8lddIxrlfh0CUom8a51B24nTEF4HS2g97HfMkG
	rSJNYej11+SpI7wNa4oGmQcWFClHCqh9sjyg/atNnjnqjlwfVQYefwGQ
X-Gm-Gg: AeBDieshJN1+ZrEkNHqyZfhyAwAIBnhcgX0KMLpgwKFSHfp88PsBtu0CbTXOwvWxCHm
	jdQBjrAHouBUqq2lPhm5ZmiRgNC9qwADHPoQHOkJ0dzlsIUZoKMRLo5zkWP1aZS3HjaljuuqsPR
	DoKfMwjzUqDk0FWQl4qdLuBurEogTg3cwmScpkcrELy3ClM8Ez5n4kK44sWpINpbNq2uDaXBpfH
	ICw6pJb9DHpoSB3VDomlXZdkju3BRWc+3iYXG+nfyAtCKTFN+92TJsea+fvjh+rnwWtWGbSjjB6
	ekIih6kZxOTbFtPOH9B86Yh4WHTHPSDH/b0MIAbU+ImZLCl/cBKVx/cKj72Y1AEu2ygdUma04dT
	b9Hkv1Ahtwe+RFRi5J9GGgVS2fhC37AqSsXWZT0nQyExfN7pVYCarCnctHTL3mYrqDjcp6/d+WF
	hdfKwdxOmVNRfjjc+mpJMEFtgiO2BbYmsQJpuIfjeC8L+sN2OcXe0aNbWtWGlVquvAsfGFWPHcS
	xvr
X-Received: by 2002:a17:907:c78e:b0:b9c:4096:7893 with SMTP id a640c23a62f3a-b9d727a0d21mr1138652266b.14.1776209289945;
        Tue, 14 Apr 2026 16:28:09 -0700 (PDT)
Received: from dau-home-pc ([185.229.191.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5b98sm451243466b.34.2026.04.14.16.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:28:08 -0700 (PDT)
Date: Wed, 15 Apr 2026 02:28:06 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Message-ID: <ad7NhoxmrFJAsXe7@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7MsSJOuUU6EGwS@dau-home-pc>

Add a selftest to verify that FOU-encapsulated packets addressed to a
multicast destination are correctly resubmitted to the inner protocol
handler (GRE) via the UDP multicast delivery path.

The test creates two network namespaces connected by a veth pair. The
receiver namespace has a FOU/GRETAP tunnel with a multicast remote
address (239.0.0.1). The sender crafts GRE-over-UDP packets and sends
them to the multicast address.

The early demux optimization (net.ipv4.ip_early_demux) is disabled on
the receiver to force packets through __udp4_lib_mcast_deliver(),
which is the code path that was previously broken.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 150 ++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a275ed584026..9b2a573e4af2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -38,6 +38,7 @@ TEST_PROGS := \
 	fib_rule_tests.sh \
 	fib_tests.sh \
 	fin_ack_lat.sh \
+	fou_mcast_encap.sh \
 	fq_band_pktlimit.sh \
 	gre_gso.sh \
 	gre_ipv6_lladdr.sh \
diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
new file mode 100755
index 000000000000..d4737d674862
--- /dev/null
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -0,0 +1,150 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that UDP encapsulation (FOU) correctly handles packet resubmit
+# when packets are delivered via the multicast UDP delivery path.
+#
+# When a FOU-encapsulated packet arrives with a multicast destination IP,
+# __udp4_lib_mcast_deliver() must resubmit it to the inner protocol
+# handler (e.g., GRE) rather than consuming it. This test verifies that
+# by creating a FOU/GRETAP tunnel with a multicast remote address, sending
+# encapsulated packets, and checking that they are correctly decapsulated.
+#
+# The early demux optimization can mask this issue by routing packets via
+# the unicast path (udp_unicast_rcv_skb), so we disable it to force
+# packets through __udp4_lib_mcast_deliver().
+
+source lib.sh
+
+NSENDER=""
+NRECV=""
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+setup() {
+	setup_ns NSENDER NRECV
+
+	ip link add veth_s type veth peer name veth_r
+	ip link set veth_s netns "$NSENDER"
+	ip link set veth_r netns "$NRECV"
+
+	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
+	ip -n "$NSENDER" link set veth_s up
+
+	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
+	ip -n "$NRECV" link set veth_r up
+
+	# Disable early demux to force multicast delivery path
+	ip netns exec "$NRECV" sysctl -wq net.ipv4.ip_early_demux=0
+
+	# Join multicast group on receiver
+	ip -n "$NRECV" addr add 239.0.0.1/32 dev veth_r autojoin
+
+	# Multicast routes
+	ip -n "$NRECV" route add 239.0.0.0/8 dev veth_r
+	ip -n "$NSENDER" route add 239.0.0.0/8 dev veth_s
+
+	# FOU listener
+	ip netns exec "$NRECV" ip fou add port 4797 ipproto 47
+
+	# GRETAP with multicast remote - this triggers __udp4_lib_mcast_deliver
+	ip -n "$NRECV" link add eoudp0 type gretap \
+		remote 239.0.0.1 local 10.0.0.2 \
+		encap fou encap-sport 4797 encap-dport 4797 \
+		key 239.0.0.1
+	ip -n "$NRECV" link set eoudp0 up
+	ip -n "$NRECV" addr add 192.168.99.2/24 dev eoudp0
+}
+
+send_fou_gre_packets() {
+	local count=$1
+
+	ip netns exec "$NSENDER" python3 -c "
+import socket, struct
+
+# GRE header: key flag set, proto=0x6558 (transparent ethernet bridging)
+gre_key = socket.inet_aton('239.0.0.1')
+gre_hdr = struct.pack('!HH', 0x2000, 0x6558) + gre_key
+
+# Inner Ethernet frame
+dst_mac = b'\xff\xff\xff\xff\xff\xff'
+src_mac = b'\x02\x00\x00\x00\x00\x01'
+eth_hdr = dst_mac + src_mac + struct.pack('!H', 0x0800)
+
+# Inner IP: 192.168.99.1 -> 192.168.99.2, ICMP echo
+inner_ip_src = socket.inet_aton('192.168.99.1')
+inner_ip_dst = socket.inet_aton('192.168.99.2')
+
+# ICMP echo request
+icmp_payload = b'TESTFOU!' * 4
+icmp_hdr = struct.pack('!BBHHH', 8, 0, 0, 0x1234, 1) + icmp_payload
+csum = 0
+for i in range(0, len(icmp_hdr), 2):
+    if i + 1 < len(icmp_hdr):
+        csum += (icmp_hdr[i] << 8) + icmp_hdr[i+1]
+    else:
+        csum += icmp_hdr[i] << 8
+while csum >> 16:
+    csum = (csum & 0xffff) + (csum >> 16)
+csum = ~csum & 0xffff
+icmp_hdr = struct.pack('!BBHHH', 8, 0, csum, 0x1234, 1) + icmp_payload
+
+# Inner IP header
+ip_len = 20 + len(icmp_hdr)
+ip_hdr = struct.pack('!BBHHHBBH', 0x45, 0, ip_len, 0x1234, 0, 64, 1, 0)
+ip_hdr += inner_ip_src + inner_ip_dst
+csum = 0
+for i in range(0, 20, 2):
+    csum += (ip_hdr[i] << 8) + ip_hdr[i+1]
+while csum >> 16:
+    csum = (csum & 0xffff) + (csum >> 16)
+csum = ~csum & 0xffff
+ip_hdr = ip_hdr[:10] + struct.pack('!H', csum) + ip_hdr[12:]
+
+payload = gre_hdr + eth_hdr + ip_hdr + icmp_hdr
+
+sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
+for _ in range($count):
+    sock.sendto(payload, ('239.0.0.1', 4797))
+sock.close()
+"
+}
+
+get_rx_packets() {
+	ip -n "$NRECV" -s link show eoudp0 | awk '/RX:/{getline; print $2}'
+}
+
+test_fou_mcast_encap() {
+	local count=100
+	local rx_before
+	local rx_after
+	local rx_delta
+
+	rx_before=$(get_rx_packets)
+	send_fou_gre_packets $count
+	sleep 1
+	rx_after=$(get_rx_packets)
+
+	rx_delta=$((rx_after - rx_before))
+
+	if [ "$rx_delta" -ge "$count" ]; then
+		echo "PASS: received $rx_delta/$count packets via multicast FOU/GRETAP"
+		return "$ksft_pass"
+	elif [ "$rx_delta" -gt 0 ]; then
+		echo "FAIL: only $rx_delta/$count packets received (partial delivery)"
+		return "$ksft_fail"
+	else
+		echo "FAIL: 0/$count packets received (multicast encap resubmit broken)"
+		return "$ksft_fail"
+	fi
+}
+
+echo "TEST: FOU/GRETAP multicast encapsulation resubmit"
+
+setup
+test_fou_mcast_encap
+exit $?
-- 
2.47.3

