Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A238A19046E
	for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782068698; cv=none; b=kOXJFuQsKc2VZ+MjbspF215gnZCJ/v0+wDHlQ2YfWJbg5ypiPYgQ9IV62cS7AVQJheYjLq1xi5suprwduG1Fmcu5sxafkMtPxugc7deA0CEPFtAnSzCWsTWOkhM3uvfn+XxnoOMDhDVkrewqGzX+dEFA6AUheRRbjtKtGm2XP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782068698; c=relaxed/simple;
	bh=aXRM6rleMtmqAGpHOgyjB5R1SPGt0HQzOmTZSePQYyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAJHQaoE7l2ryugC9fG3SweLkc9oTTMlAZif1eapMs6nkxbGPw7mGUDKeyuW7UmQhJUNvcWT2vEaR9ZQOHqPlHY/SjsGmmipqF/sVQYmsIOf9nudlq9A87apb2/Me55efM85P08Trrycp9dAUi0FupbfEohm3H72kHDAMnwjoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDrk2GSc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDrk2GSc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6977c0814d1so1857610a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782068695; x=1782673495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vd217j9BX8Lq/p1KnSze+ojMBVOwOcfGoPl0hFkSxs=;
        b=TDrk2GScixZ8fmReWUDeY/s7vMVWHhN81yKK5WccjYZ2HkMCxqJAcJeXxa9AgulqYh
         0K5pdzMEVcU/54rnDQtBtGZJMslqsjCcazs/IvqhdKV9tAesj9vt9UKgiQ27v3bsRCvK
         zTg3PjJ3qQtR9dUVZTYRkNAIH5jO34UvO32xXtA+r9i+k7TsQTpbheqUQ/y0WJbSyufi
         +wN9KV6DeroDvcdhU5DRg6B7Ya0xUiuYDN0Te+qLNXcriDzwa6sNFtURHYolc7pU50e6
         aAkuXdOrTwUzo7bfcwgRCt/NCsS4t1qrdHWFm+euzJqcRSdekFKoS0eJ9nzhhY9oTWgf
         N99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782068695; x=1782673495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Vd217j9BX8Lq/p1KnSze+ojMBVOwOcfGoPl0hFkSxs=;
        b=fYQif4fBZV89iV7y+185J6d1w5DBGGDHYusOOLIzSNd/PtMARoqZYsUHbHClf/Pkov
         vinnwc3UAd73gUY69sqCBnmBcSJ6rd5cWh3YFNgeyUKD4n+KS05IJ2tUqytJvF2bCjsc
         stPvUD8rO6AHUHxv4VUjDvjIZwCo0kjHwzXEsYRfKrkhP0FSX/1xXXO2kn+3ioS/1VKA
         amyg/VD6wGSSdLtLrdMG5fJPryBeASSFSFtx0Ol3VBg+F9sWEKcJfstG/BcX4QYjx/+V
         8vCXrGUif8y6Sn/qTNO4JNbyU4Iq/vmZmJyl6sIkUaxVxmZCrHbrDPRTThOK6h+rb2JJ
         TBmg==
X-Forwarded-Encrypted: i=1; AFNElJ90+1PEZt1aCRSwhXwaHCTiCj+87hxdPjozd4iNhkzDvvJqfCNry+PMG5Yx7Lh7STySYZnYRJKK0CYFn9jUFe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXRjaUE9JN/B5YHDrm6vu57TEnY9SYsuoBbuw3x7XEfdE9usF3
	iSa+4VKWNWuixt22eEIY8LgiDrD3+55SWhj8oFQRFIFDVRZcUSf3SgE1
X-Gm-Gg: AfdE7cnFuRhEtgcrGy+w1RiL+uEOyV1t1YLAoF22g0txRG50lkXugr8e0drPCLw+xAO
	NNHfBvEyB2ZgRdsJ2SOnNL5RH/XoI/F00V2oQbOIsBujqNwgGP1jcP5lXNlSBeMVDMxedEQt9Fb
	WbAcHT/Zo3Rbc5sWCB+TgMEwDA4/jUL4FElDA6jWvhqxhJzGkNzmMnoLjdtEnboe38my5XNhL79
	SbLyQteaY0N2flGidT78Q/tyLst4yYiqMMJwIt6+T630EGSpCTBgqYkfSvEhQRc96yKzdlhY4uK
	Xhe1YjIa4lOLVcTFgDo6qoHOtXQTvECPys5WNS9IFYFYnT7m+NSRxq3BIitYaQGDxaW13NQ3CE+
	J89i4QdPJajiEQ1EYMyCtg3URfRviImK2/WxgOj7CUQwJeqrxdmSFxes54PtXafhBQs/sXijFoP
	8P8U/9wig0a/+YTiWbGppyWzgue1XFlmnwXkv7enECWBTNePjuOC6KxSNFGR4A5goHkYZ9cvgDP
	rS6JQ==
X-Received: by 2002:a17:906:7944:b0:c0e:5a63:85df with SMTP id a640c23a62f3a-c0e5a642b5emr88280366b.30.1782068694741;
        Sun, 21 Jun 2026 12:04:54 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99977fsm230558266b.20.2026.06.21.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 12:04:53 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	davem@davemloft.net,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next RESEND v3 2/2] selftests: net: add FOU multicast encapsulation resubmit test
Date: Sun, 21 Jun 2026 22:04:12 +0300
Message-ID: <d453a15be455920b57b0da000a91ace4d01a0596.1782067871.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782067871.git.littlesmilingcloud@gmail.com>
References: <cover.1782067871.git.littlesmilingcloud@gmail.com> <cover.1777934869.git.littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a selftest to verify that FOU-encapsulated packets addressed to a
multicast destination are correctly resubmitted to the inner protocol
handler (GRE) via the UDP multicast delivery path.

The test creates two network namespaces connected by a veth pair with
a FOU/GRETAP tunnel using a multicast remote address (239.0.0.1).
Ping is sent through the tunnel and received packets are counted on
the receiver's tunnel interface.

A static neighbor entry is configured on the sender because ARP
replies from the receiver cannot traverse the unidirectional multicast
tunnel back to the sender.

The early demux optimization (net.ipv4.ip_early_demux) is disabled on
the receiver to force packets through __udp4_lib_mcast_deliver(),
which is the code path being tested.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 708d960ae07d..7e9ae937cffa 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -39,6 +39,7 @@ TEST_PROGS := \
 	fib_rule_tests.sh \
 	fib_tests.sh \
 	fin_ack_lat.sh \
+	fou_mcast_encap.sh \
 	fq_band_pktlimit.sh \
 	gre_gso.sh \
 	gre_ipv6_lladdr.sh \
diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
new file mode 100755
index 000000000000..8db9633f4c28
--- /dev/null
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -0,0 +1,112 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that UDP encapsulation (FOU) correctly handles packet resubmit
+# when packets are delivered via the multicast UDP delivery path.
+#
+# When a FOU-encapsulated packet arrives with a multicast destination IP,
+# __udp4_lib_mcast_deliver() must resubmit it to the inner protocol
+# handler (e.g., GRE) rather than consuming it. This test verifies that
+# by creating a FOU/GRETAP tunnel with a multicast remote address and
+# sending ping through it.
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
+	# Sender: GRETAP with FOU encap (no FOU listener needed on TX side)
+	ip -n "$NSENDER" link add eoudp0 type gretap \
+		remote 239.0.0.1 local 10.0.0.1 \
+		encap fou encap-sport 4797 encap-dport 4797 \
+		key 239.0.0.1
+	ip -n "$NSENDER" link set eoudp0 up
+	ip -n "$NSENDER" addr add 192.168.99.1/24 dev eoudp0
+
+	# Receiver: FOU listener + GRETAP
+	ip netns exec "$NRECV" ip fou add port 4797 ipproto 47
+	ip -n "$NRECV" link add eoudp0 type gretap \
+		remote 239.0.0.1 local 10.0.0.2 \
+		encap fou encap-sport 4797 encap-dport 4797 \
+		key 239.0.0.1
+	ip -n "$NRECV" link set eoudp0 up
+	ip -n "$NRECV" addr add 192.168.99.2/24 dev eoudp0
+
+	# Static neigh entry on sender: ARP replies cannot traverse the
+	# multicast tunnel back, so pre-populate the neighbor cache.
+	local recv_mac
+	recv_mac=$(ip -n "$NRECV" link show eoudp0 | awk '/ether/{print $2}')
+	ip -n "$NSENDER" neigh add 192.168.99.2 lladdr "$recv_mac" dev eoudp0
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
+	# Warmup: let any initial broadcast/ARP traffic settle
+	ip netns exec "$NSENDER" ping -c 1 -W 1 192.168.99.2 >/dev/null 2>&1
+	sleep 1
+
+	rx_before=$(get_rx_packets)
+	ip netns exec "$NSENDER" ping -c $count -W 1 192.168.99.2 >/dev/null 2>&1
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

