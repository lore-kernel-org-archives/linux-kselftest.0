Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CA35DA67
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 00:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470930; cv=none; b=GOY0zE6hOTUQTFx6M4d1WGLSnDKHZOT5A26KVptfy07lZu6gNXWcNuD8dQ++Ig6teH78HIdwGgYueSczrnBK6f8zY3yrYJ+RH3UunmJDJ5wpyHZboThr6fkYSNOqt+vW4X97eNXnfw7Kc+RZoyXVK7LHg2PU5QhZqo74zyR+PYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470930; c=relaxed/simple;
	bh=WAsPmEZVvRA/T6DiuQXnMzZDBgmO54sGxakUzENVzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJ5HuadxAi3mtpY2Tl9ove1dIXH8Q3JBo8SmIGvs7krg497cJGiokPZdiD2qPy4XokoGOZA3FvkM2/Y+xVMIjrm8D9LY1qm+s8M6dk7D9apydQBEqg7zzx2bgAx3elW+/lq0vGl/4W6Gn6Yrq6uFanpUY2LssLPyEpi184Oqlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnLW8m3o; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnLW8m3o"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so105597e87.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783470922; x=1784075722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFHiFXwaKLZiXoZo2rfqn6zyHU8j+Hw/VzDITD1bBIo=;
        b=HnLW8m3oYkdJaf5xlTHJCRIJR/SIFEkH/STg9d8B1ylu0PtISL5/JA0aKnL9HN/8FK
         ehnoCSM6dyiUcLExfs50vIR5JUYNVM4uRRjtFye0u18Q2Rk1tYiDhB7BtT87DRau/Z+/
         nNLGUEBpxGP2SrJWB7b63WzytDFnklNYuX+stOKruBiOjG93Z9Zp0HHDuqCseQi3/8Az
         u5OuTYyeL9yzr1zF0t2t79mXoyStW5od5T8PfA2egFxSgXzM/nUCbmsFrQjWkWaRtI7n
         IwSXZGoZNmVi3HGXFR9Ln2CsIByc7kiTBM3T9qRj9eeYP7G/G1atXkOhLhGNRqehQVr1
         LU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783470922; x=1784075722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFHiFXwaKLZiXoZo2rfqn6zyHU8j+Hw/VzDITD1bBIo=;
        b=DzaMZqMwgsnT4Unb3G0vE2ZNz/TW/MZODh63ZWG1TeuvTk+Cd3WBMtqmeL0vN/iC8L
         nU9wihehgC5FrT2ilRdjYkSsZE6m6x9CKd+LtAINNnHlTMCc1bsIRHlsBWz5QmyattM0
         y+SqISUQt4sJWhXnWBkFHwVZKb2qmznko88gamiXnR5zczyEgEW65Pznv+11FZu/6/e2
         psAiJV1YT/rNEYqgkZ3LY1KzGpXJT5miWHKOwfu0kBUHl8v3rYrs/ZH7SiVDYf9ylVOq
         Q5VNxlUYEHu/DEGSCd/LU1csb/FPsLqrvb5Ux0tJLRhy9xkaKrmXnOOx7EjJ6AI8XKXv
         TJTw==
X-Forwarded-Encrypted: i=1; AHgh+RpNEjCL8WlORnqgsY6E+EWbORIXuagXdxftblmNXNSjYg8wu4ZjNfZjJm3WaLmD2K3SFgAX2ZEZJpI/NEPGtnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ++YsxmbuuomOv6qXQ5bWeYpH7bqGyDl1jj1/BSUaozFoMmzS
	3MmVvNDm7CgiNkoCfNSBz9koi+OMXdXkRp9pVxmzZ6trEWQn1UZvuupU
X-Gm-Gg: AfdE7clxIlA3gMfpZ61lM4Vaz33Xgqw1AGpKNIN15ix7lPN78S3O1V2+jVg7/Et+eW1
	mOyslCGx1XjQsCaOPn8Q3Cs1UPnFFa4hhZRNPy5expS5eqNVVJLZI4R9af1ZxyJDxiJXxFOIQ3S
	06qpgLEqPlDgk90/mIvcHCWc3pWMG84UVSeSQGqo0BsRWxPdhdqyu0LTIjR5Wdiu2FmdtuePy8M
	PtDmREd8ivKrPlB5rV9f+iZ3pi6BnyXY4VH5xvh46xMK0XtMz1uugR2NQ5RQnJkpN/BYfxy8wjM
	yFvrgex7rqUdtGXoBpdQM13fqnYEayi26bf4hx13waERtrWsPGaeYI6jsVsvSgGbO5wWOejz6m1
	Op3tJVqIkjwfVBLjdNcVDFKe+ZF9nTNeBt1czi0kw81qSpJYLvLuA8uuassep40T1wVKMTGTYEq
	CruwqlA1VBoxGyYs3n7ECyDh7AHygdOR6VxbTBb6xB//yHggBcUtL4UVfx+H5Tlwiz4tK5v2kaT
	hDtmn4bnKLHdsE=
X-Received: by 2002:a05:6512:6894:20b0:5ae:c454:3746 with SMTP id 2adb3069b0e04-5b0114a23bemr40809e87.43.1783470921889;
        Tue, 07 Jul 2026 17:35:21 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.182.77])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8dcsm4083867e87.11.2026.07.07.17.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:35:19 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/2] selftests: net: add FOU multicast encapsulation resubmit test
Date: Wed,  8 Jul 2026 03:35:04 +0300
Message-ID: <a5b65f092d22a12b52fc536c0565b948cd8ecae3.1783372173.git.littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783372173.git.littlesmilingcloud@gmail.com>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a selftest to verify that FOU-encapsulated packets addressed to a
multicast destination are correctly resubmitted to the inner protocol
handler (GRE) via the UDP multicast delivery path.  Both IPv4 and IPv6
paths are tested.

The test creates two network namespaces connected by a veth pair with
a FOU/GRETAP (IPv4) and FOU/ip6gretap (IPv6) tunnel using multicast
remote addresses (239.0.0.1 and ff0e::1).  Ping is sent through each
tunnel and received packets are counted on the receiver's tunnel
interface.

The veth pair is created directly inside the namespaces to avoid
possible name collisions with devices in the root namespace.

Static neighbor entries are configured on the sender because ARP/ND
replies from the receiver cannot traverse the unidirectional multicast
tunnel back to the sender.

The early demux optimization (net.ipv4.ip_early_demux, which controls
both IPv4 and IPv6) is disabled on the receiver to force packets
through __udp4_lib_mcast_deliver() / __udp6_lib_mcast_deliver(), which
is the code path being tested.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
Assisted-by: Claude:claude-opus-4-6
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   2 +
 .../testing/selftests/net/fou_mcast_encap.sh  | 172 ++++++++++++++++++
 3 files changed, 175 insertions(+)
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
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index e1ce35c2abbe..96fffca6547c 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -38,6 +38,8 @@ CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
+CONFIG_IPV6_FOU=m
+CONFIG_IPV6_FOU_TUNNEL=m
 CONFIG_IPV6_GRE=m
 CONFIG_IPV6_ILA=m
 CONFIG_IPV6_IOAM6_LWTUNNEL=y
diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
new file mode 100755
index 000000000000..70210d39fba3
--- /dev/null
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -0,0 +1,172 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that UDP encapsulation (FOU) correctly handles packet resubmit
+# when packets are delivered via the multicast UDP delivery path.
+#
+# When a FOU-encapsulated packet arrives with a multicast destination IP,
+# __udp4_lib_mcast_deliver() / __udp6_lib_mcast_deliver() must resubmit
+# it to the inner protocol handler (e.g., GRE) rather than consuming it.
+# This test verifies both IPv4 and IPv6 paths by creating a FOU/GRETAP
+# tunnel with a multicast remote address and sending ping through it.
+#
+# The early demux optimization can mask this issue by routing packets via
+# the unicast path (udp[6]_unicast_rcv_skb), so we disable it to force
+# packets through the multicast delivery function.
+
+source lib.sh
+
+NSENDER=""
+NRECV=""
+
+FOU_PORT4=4797
+FOU_PORT6=4798
+MCAST4=239.0.0.1
+MCAST6=ff0e::1
+
+TUN4_S=192.168.99.1
+TUN4_R=192.168.99.2
+TUN6_S=2001:db8:99::1
+TUN6_R=2001:db8:99::2
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+setup_common() {
+	setup_ns NSENDER NRECV
+
+	# Create veth pair directly inside namespaces to avoid name
+	# collisions with devices in the root namespace.
+	ip link add veth_s netns "$NSENDER" type veth \
+		peer name veth_r netns "$NRECV"
+
+	ip -n "$NSENDER" link set veth_s up
+	ip -n "$NRECV" link set veth_r up
+
+	# Same sysctl controls early demux for both IPv4 and IPv6.
+	ip netns exec "$NRECV" sysctl -wq net.ipv4.ip_early_demux=0
+}
+
+setup_ipv4() {
+	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for
+	# these tests, so no module load is needed here.
+	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
+	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
+
+	# Join multicast group on receiver
+	ip -n "$NRECV" addr add "$MCAST4/32" dev veth_r autojoin
+
+	ip -n "$NSENDER" route add 239.0.0.0/8 dev veth_s
+	ip -n "$NRECV" route add 239.0.0.0/8 dev veth_r
+
+	# Sender: GRETAP with FOU encap (no FOU listener needed on TX side)
+	ip -n "$NSENDER" link add eoudp4 type gretap \
+		remote "$MCAST4" local 10.0.0.1 \
+		encap fou encap-sport "$FOU_PORT4" encap-dport "$FOU_PORT4" \
+		key "$MCAST4"
+	ip -n "$NSENDER" link set eoudp4 up
+	ip -n "$NSENDER" addr add "$TUN4_S/24" dev eoudp4
+
+	# Receiver: FOU listener + GRETAP
+	ip netns exec "$NRECV" ip fou add port "$FOU_PORT4" ipproto 47
+	ip -n "$NRECV" link add eoudp4 type gretap \
+		remote "$MCAST4" local 10.0.0.2 \
+		encap fou encap-sport "$FOU_PORT4" encap-dport "$FOU_PORT4" \
+		key "$MCAST4"
+	ip -n "$NRECV" link set eoudp4 up
+	ip -n "$NRECV" addr add "$TUN4_R/24" dev eoudp4
+
+	# Static neigh on sender: ARP replies cannot traverse the
+	# unidirectional multicast tunnel.
+	local recv_mac
+	recv_mac=$(ip -n "$NRECV" link show eoudp4 | awk '/ether/{print $2}')
+	ip -n "$NSENDER" neigh add "$TUN4_R" lladdr "$recv_mac" dev eoudp4
+}
+
+setup_ipv6() {
+	# Skip cleanly if IPv6 or the fou6 module is not available.
+	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
+	modprobe -q fou6 || return "$ksft_skip"
+
+	ip -n "$NSENDER" addr add 2001:db8::1/64 dev veth_s nodad
+	ip -n "$NRECV" addr add 2001:db8::2/64 dev veth_r nodad
+
+	# Join multicast group on receiver
+	ip -n "$NRECV" addr add "$MCAST6/128" dev veth_r autojoin
+
+	ip -n "$NSENDER" -6 route add ff00::/8 dev veth_s
+	ip -n "$NRECV" -6 route add ff00::/8 dev veth_r
+
+	# Sender: ip6gretap with FOU encap
+	ip -n "$NSENDER" link add eoudp6 type ip6gretap \
+		remote "$MCAST6" local 2001:db8::1 \
+		encap fou encap-sport "$FOU_PORT6" encap-dport "$FOU_PORT6" \
+		key 42
+	ip -n "$NSENDER" link set eoudp6 up
+	ip -n "$NSENDER" addr add "$TUN6_S/64" dev eoudp6 nodad
+
+	# Receiver: FOU listener (IPv6) + ip6gretap
+	ip netns exec "$NRECV" ip fou add port "$FOU_PORT6" ipproto 47 -6
+	ip -n "$NRECV" link add eoudp6 type ip6gretap \
+		remote "$MCAST6" local 2001:db8::2 \
+		encap fou encap-sport "$FOU_PORT6" encap-dport "$FOU_PORT6" \
+		key 42
+	ip -n "$NRECV" link set eoudp6 up
+	ip -n "$NRECV" addr add "$TUN6_R/64" dev eoudp6 nodad
+
+	# Static neigh on sender: neighbor discovery cannot traverse the
+	# unidirectional multicast tunnel.
+	local recv_mac
+	recv_mac=$(ip -n "$NRECV" link show eoudp6 | awk '/ether/{print $2}')
+	ip -n "$NSENDER" neigh add "$TUN6_R" lladdr "$recv_mac" dev eoudp6
+}
+
+get_rx_packets() {
+	local dev="$1"
+
+	ip -n "$NRECV" -s link show "$dev" | awk '/RX:/{getline; print $2}'
+}
+
+run_ping_test() {
+	local family="$1"
+	local dev="$2"
+	local dst="$3"
+	local name="$4"
+	local count=100
+	local rx_before rx_after rx_delta
+
+	# Warmup: let any initial broadcast/ND traffic settle
+	ip netns exec "$NSENDER" ping "$family" -c 1 -W 1 "$dst" \
+		>/dev/null 2>&1
+	sleep 1
+
+	rx_before=$(get_rx_packets "$dev")
+	ip netns exec "$NSENDER" ping "$family" -i 0.01 -c $count -W 1 "$dst" \
+		>/dev/null 2>&1
+	sleep 1
+	rx_after=$(get_rx_packets "$dev")
+
+	rx_delta=$((rx_after - rx_before))
+
+	if [ "$rx_delta" -ge "$count" ]; then
+		RET=$ksft_pass
+	else
+		RET=$ksft_fail
+	fi
+	log_test "$name (received $rx_delta/$count)"
+}
+
+setup_common
+setup_ipv4
+run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
+
+if setup_ipv6; then
+	run_ping_test -6 eoudp6 "$TUN6_R" "FOU/ip6gretap IPv6 multicast encap resubmit"
+else
+	log_test_skip "FOU/ip6gretap IPv6 multicast encap resubmit"
+fi
+
+exit "$EXIT_STATUS"
-- 
2.47.3

