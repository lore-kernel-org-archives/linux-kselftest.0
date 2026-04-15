Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562A21CA13
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279135; cv=none; b=RXnmObZ1RpsHcKH8bM2unsaEReiHlDXhhDju8LZ2EAIgUOmVcxwsdaJXWuHlinSMTiQSwrzQEYGD2JlREMiaDQozMGF0JVftBLE77cpKNfg4vX7SXyKV27lkjU/E6rLzcft1z4ExaAt7zOnnCTATf+RjbEywfjksuLgaxfFNdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279135; c=relaxed/simple;
	bh=2NBoU68MoEb6tabflloQxM4Y0+PZOEURSqv8hhh6XWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OO4D5SRGaDVAaHdfr8YCTfD26l5f7B0zTYUHk17dJOcbdesrWwz4jNpXvnWpcd2t75apGuBrcoOX1x7TyfxvktwprDWxM/cf78S71oAqJX5c213wMQbt1QTMfEyGgFjaOM7c+nLDmMhBvHPxtiAttPgeJEWZsLN5Gnl25vdiNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2aubf1o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2aubf1o"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a29e6110so76361805e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279133; x=1776883933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQhlpKS2BSyq0738gAtdb37OSAxAE8MeKj2xvPQlbfc=;
        b=c2aubf1olYkpFt8BbV1z01QoXGxHOWlZ8+jLzjkCi2Xj9m+whUbgf0NLUJsyHc09b0
         WBnPdAYJdLpGoVJSYeUY98Ig0LwuZtVSwhw4GiJILSbtoJTcAF2dOck1Ye6HQ2+p3d+E
         I2XInjz+u/rJDiEvQmd5rtKUcxDiA7mEzlvIpzELjjLmpJHsiPbWPXZsgExQoY6rj2GB
         cvFACXDFp9rOOaH2JOgp6eWfitkwjnCJ1OIhHt+4+U7viwbRollVAGMfPXkWqorAUy4x
         A+9FI67xSMzCoRw0bv0vUXuZFWLmzjxJzKTxWU6cg0tv2GfqGNpF1pd1Z6Iw/WT+EzZB
         aUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279133; x=1776883933;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQhlpKS2BSyq0738gAtdb37OSAxAE8MeKj2xvPQlbfc=;
        b=PggYRV6ZvLQNMTmuf/O5cZy44jxb9+RQWOxLb9w3rRHjhAOJUTjDhe7KRYrcBOhC8r
         mMNTB+xnZR9ii5fw0fAxZ6aA0EAE5ir+jfKQxAMW/JPYIWnmWjbj+LjiaAon2yGnM3Cc
         xHO8P56PeVXir+EqD19pBmocGZP0DNMw1dxTczBomPnkzKveabtqW6iHRQWyW4Qu0oFm
         jzBhOrvQU87PWCHCDZ7s8CfWWUxgY39td1mvc6o8DnJhV5odQJsHDSkDxWv3b3P8ZFPO
         2jtFKP7e4ApsQn0BvrFbARmIPBT0h2Y6PEAjtJrNJU8A7LSxggyBpOaS/zlvF3PlgtnM
         eXyA==
X-Forwarded-Encrypted: i=1; AFNElJ/xkUYDg8VUkvYXfz41UDMx+6mIie91eruMmIU+vUNOE/fLQjVX3jjp1SFEmv0bQe4nCWIR+GIaKH4rmtHTRY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8t4SnWHErsVv36ODJfNWsHT8lLEIJE+DEGlquLdyX9RUOSYpq
	VL7Y4EI9DsRunHxLo+fcwXgDflX3PibPWCUnqxTz9xLtYuX57474iCN/
X-Gm-Gg: AeBDievHxp3Lfk4FAUiJmkhlVfwAtEoRT44u7pDwVzvFgG5nIiMOjZTKJjgTdfXmHXg
	lObrLOGSsJoOn+KDrsrvKFGYVVzk8G+EM+wrII8pjvHBuTzU18nWlclYH+yz7YuiKMYLCA7RwpB
	FDT133+cyIMGabBfmz/xM5ldekQ+U1T1IHGT0UDrBHk8wIRFPqP7RKyerIBZrczVemez4SbrOFs
	RtAmyaK2Wo7tNXdimhtAmxeI57UyaOi97hKzMgX6RAYFla6gNmR4rOzjCnz37k8p0Pu3c8O+AjJ
	L/7vP6puQEiDahbExmXHLfv0uyac0dIiJjuHURd3r0Q5ia5YEpB5xXnFWfo4upOP/PG+3JavEY4
	1YuZVHzXIzOGOiDUu1Qv1V6rUJW3mV2xFYy2uaI3JEs6tXRxzUWcHlLGQFq2THJW0vmpH76gjAx
	Prb5tS7bCL0COK5xbjUJxLnHjfWgFXZS458LM1LPamG48xb5YIPdzA3lXUX09XaIk2SnYplT9CP
	L4=
X-Received: by 2002:a05:600c:8b27:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488d687664emr298405715e9.17.1776279132500;
        Wed, 15 Apr 2026 11:52:12 -0700 (PDT)
Received: from dau-home-pc ([89.222.123.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5f11sm7760661f8f.18.2026.04.15.11.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:52:11 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:52:08 +0300
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Message-ID: <ad_eWBo76OLcgPSA@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_dal164gVmImWl@dau-home-pc>

Add a selftest to verify that FOU-encapsulated packets addressed to a
multicast destination are correctly resubmitted to the inner protocol
handler (GRE) via the UDP multicast delivery path.

The test creates two network namespaces connected by a veth pair. The
receiver namespace has a FOU/GRETAP tunnel with a multicast remote
address (239.0.0.1). A Python helper script (fou_mcast_encap.py)
crafts GRE-over-UDP packets and sends them to the multicast address.

The early demux optimization (net.ipv4.ip_early_demux) is disabled on
the receiver to force packets through __udp4_lib_mcast_deliver(),
which is the code path that was previously broken.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 tools/testing/selftests/net/Makefile          |   2 +
 .../testing/selftests/net/fou_mcast_encap.py  |  81 ++++++++++++++
 .../testing/selftests/net/fou_mcast_encap.sh  | 105 ++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.py
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index a275ed584026..2b463dda5ac6 100644
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
@@ -195,6 +196,7 @@ TEST_GEN_PROGS := \
 
 TEST_FILES := \
 	fcnal-test.sh \
+	fou_mcast_encap.py \
 	in_netns.sh \
 	lib.sh \
 	settings \
diff --git a/tools/testing/selftests/net/fou_mcast_encap.py b/tools/testing/selftests/net/fou_mcast_encap.py
new file mode 100755
index 000000000000..0fd836c454a8
--- /dev/null
+++ b/tools/testing/selftests/net/fou_mcast_encap.py
@@ -0,0 +1,81 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""Send FOU/GRE encapsulated packets to a multicast destination.
+
+Build and send GRE-over-UDP (FOU) packets with a multicast outer
+destination IP. Used by fou_mcast_encap.sh to test that the UDP
+multicast delivery path correctly resubmits encapsulated packets
+to the inner protocol handler.
+"""
+
+import argparse
+import socket
+import struct
+
+
+def checksum(data):
+    """Compute Internet checksum (RFC 1071)."""
+    csum = 0
+    for i in range(0, len(data) - 1, 2):
+        csum += (data[i] << 8) + data[i + 1]
+    if len(data) % 2:
+        csum += data[-1] << 8
+    while csum >> 16:
+        csum = (csum & 0xFFFF) + (csum >> 16)
+    return ~csum & 0xFFFF
+
+
+def build_gre_encap_packet(dst_addr):
+    """Build a GRE/Ethernet/IP/ICMP payload for FOU encapsulation."""
+    gre_key = socket.inet_aton(dst_addr)
+    gre_hdr = struct.pack("!HH", 0x2000, 0x6558) + gre_key
+
+    dst_mac = b"\xff\xff\xff\xff\xff\xff"
+    src_mac = b"\x02\x00\x00\x00\x00\x01"
+    eth_hdr = dst_mac + src_mac + struct.pack("!H", 0x0800)
+
+    inner_ip_src = socket.inet_aton("192.168.99.1")
+    inner_ip_dst = socket.inet_aton("192.168.99.2")
+
+    icmp_payload = b"TESTFOU!" * 4
+    icmp_hdr = struct.pack("!BBHHH", 8, 0, 0, 0x1234, 1) + icmp_payload
+    icmp_csum = checksum(icmp_hdr)
+    icmp_hdr = struct.pack("!BBHHH", 8, 0, icmp_csum, 0x1234, 1) + icmp_payload
+
+    ip_len = 20 + len(icmp_hdr)
+    ip_hdr = struct.pack("!BBHHHBBH", 0x45, 0, ip_len, 0x1234, 0, 64, 1, 0)
+    ip_hdr += inner_ip_src + inner_ip_dst
+    ip_csum = checksum(ip_hdr)
+    ip_hdr = ip_hdr[:10] + struct.pack("!H", ip_csum) + ip_hdr[12:]
+
+    return gre_hdr + eth_hdr + ip_hdr + icmp_hdr
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Send FOU/GRE encapsulated packets to a multicast address"
+    )
+    parser.add_argument(
+        "-c", "--count", type=int, required=True,
+        help="number of packets to send",
+    )
+    parser.add_argument(
+        "-d", "--dst", default="239.0.0.1",
+        help="destination multicast address (default: 239.0.0.1)",
+    )
+    parser.add_argument(
+        "-p", "--port", type=int, default=4797,
+        help="destination UDP port (default: 4797)",
+    )
+    args = parser.parse_args()
+
+    payload = build_gre_encap_packet(args.dst)
+
+    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
+    for _ in range(args.count):
+        sock.sendto(payload, (args.dst, args.port))
+    sock.close()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
new file mode 100755
index 000000000000..1f9dbe7092f3
--- /dev/null
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -0,0 +1,105 @@
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
+	local script_dir
+	script_dir=$(dirname "$(readlink -f "$0")")
+
+	ip netns exec "$NSENDER" python3 "$script_dir/fou_mcast_encap.py" \
+		-c "$count" -d 239.0.0.1 -p 4797
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

