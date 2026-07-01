Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5001534DB52
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782947465; cv=none; b=Uj1VSL7788EdCjoYNR2lXtUmAO0SFlBxMdxmZ3646TPr6hjIOLONJIYN++Ys5NmeUmaMTWPUa7JBc8NIXIThTBzHpbBl1iaUMWLTC+KQPcpCcb3WGs+fzR3KDMnWV0crNbwsIA0NuQAuQ49d7KlJLCHo0jyH+6nIUfq/L55yA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782947465; c=relaxed/simple;
	bh=aXRM6rleMtmqAGpHOgyjB5R1SPGt0HQzOmTZSePQYyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxoJU4rCozjmiFkkCwvz/o+z6+cGmqjKnt5fsi8NyklbqtSH+gIO/r7L4s99ctlzrHmE46KNTMo5KjT0fvDc0tziCIynsHK28IWYUJaIXz72lUjaAq1oYJtDHRyCsBxk9+JTwEwiSBxvNsrSqf4UQe4+bcGaaO+yI129HfYTO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dtw9qJwM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dtw9qJwM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso2043882a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 16:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782947463; x=1783552263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vd217j9BX8Lq/p1KnSze+ojMBVOwOcfGoPl0hFkSxs=;
        b=Dtw9qJwM77WF3+YZvu9pq1f46h+8kdE0rrD8is4mFTaMzSzFaO6SHfe2XKAAfQau+u
         UPidPhXCkwfr96GcRvbK6sHAHo3Vx5QX0rH4KnbpNcMmxBhLJpW8wUlJOgkcaM5Uxvl/
         OGE+V1wc3V3oB4Ns6nPHKWtq986rFYEPl5Y9VQNISt9gpvjGU4RlM2MORP5Dgl1SIi7/
         r6kpaLwfo2QI7np/9bgN/D6ZBnftc2Cn4ozcEaQ2tDofkvqHS8UQSk5weRtqhXRNzsN6
         c2BCu5pYqNMgf14rQAhvS7m/makxy4/cslB7VSKPbA3Nw6NrZDC0G6whoUdsdI6E54kl
         /CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782947463; x=1783552263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Vd217j9BX8Lq/p1KnSze+ojMBVOwOcfGoPl0hFkSxs=;
        b=esavVpy5OisOsZvDq8wC9Qiw6rroVI8GHQONES2yFnbJrzOTSpxIrpN/A3IlEijQKl
         nkAYgvpxf7ojAOonqMYdxJw7rORmFT+s1aNVvpcvqWWLLP+hWQIRR8rkqVlyCDdc0Wyc
         F/N+NgZFv1iWrEgWsYcQVguVdGkABpEBnb6DBM4Qcc5Mq93n6D9Rq8vN2S21LU6xA3nj
         ajPMYV1I7XdLAJE34zw9wbBYmA3YvGqGeAZD0ZnVNBsbnrcyxVZ1+9nxfZqpmFzIY7EC
         Pu7xnJR0P2XAKaMuHwxrjdfCxn+da9tcOonI650o3dDVg3DxHcNkfzwOtZAeAL2yPPP7
         N0cg==
X-Forwarded-Encrypted: i=1; AHgh+RqMj+6hVZf/umMrot1PE2Vr5BfWd7/+3PIs5I7Dc4owS0w3WGn7snfADWnfISrcMjEF6OfLmgexKqxE1d0HkNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjc9UABd7owl4qk8AzddLoEJ2AfBTKlcCkRrzUMTiDWS9vMCx
	DVoY24A9MwIqcl0mdRR3DkDnW4nvcuPONLfmc1J81Mfu1hNF19kaG509
X-Gm-Gg: AfdE7cnn8zGzfWWIxPXgZPgC4tahunVixMru4AAj9V23MA2F9QXyn6QbypsQYAXckon
	i/he/gOMogF4kwzELsyxxx06P8zgsEL6e2y9KaHOcZERnjDg1EhI3eFnbfgVjE25QhslARyrGBf
	ZHTmob1jCKbBRMpk/gqtmi0iYuZY/r/MexDPQWnuVsXFQtM05WSpilbjCMureqNRPyc3whAL66g
	NsgeWjoS4NpntvzjXtyRc5Ctmh3p+yOOd1fj9ruSbDnHhWgdwbVHiIr7UQ2zgn0SQEoZKZXJOrt
	+nqs5JYDrwzHziDJqixppGMfSUgtBAdBk2aZ3VzCwws0q26CEBKpi9GkwCY38CTnste63Pdrase
	Idv6gZAdsxnjgeAlx7g1zSWmkqXLstz4NiD3iTrB/FCrGmI0U8t/m20J6aD/qqThXUkJXTs6jU9
	8o93k8Hrbd3mZ+lG3YpFIXUh4htHf4uBBp4Gz/jqqXFIuRhwVsTiNrTe3rp06UnwBkrgLMRV1zH
	QW2Fw==
X-Received: by 2002:a17:906:515:b0:c12:acd3:bde9 with SMTP id a640c23a62f3a-c12ae7e94demr109519266b.45.1782947462673;
        Wed, 01 Jul 2026 16:11:02 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.164.115.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm30663466b.39.2026.07.01.16.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:11:02 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 2/2] selftests: net: add FOU multicast encapsulation resubmit test
Date: Thu,  2 Jul 2026 02:10:37 +0300
Message-ID: <a196b53a2829da66c982f88e82805afc498ea13b.1782945956.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782945956.git.littlesmilingcloud@gmail.com>
References: <cover.1782945956.git.littlesmilingcloud@gmail.com>
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

