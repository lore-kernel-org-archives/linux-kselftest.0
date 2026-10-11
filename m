Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3329ACCD;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791682890; cv=none; b=pPydgc1LD7hEfXxD5f6BZXwNP9mW5DnvhHXmLWEuVaXe/9seCCM6kHj0KdTDZfvt1e8LAMr0NsZDaA80UQEkz0PxuL/itkZz3E5wOYmmHd+erKA695xDzU6sgidzYn9bs2HT/NLjTTC5bqMquvepDXLKHMUGRk/QRtLwlYKBhlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791682890; c=relaxed/simple;
	bh=JOqthLJNDgnkrr8WzV/xZURDm5fGLtm9hYL6Z3QePOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjad/wMlOur9pJ7tidHeEYnNV7UtzDCz5cKupwFi3JF/sW17ieXWJcio9/XnotNLlFN1E4BYv+QhsijynblKlPyJJ62yxq9oLNWAyWNgWBArzZwBY/yxPKAi8PBGcCzfXdZTgvUMLG5K1GYr0SmGlWspAHT24CxYeek5SbTqcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0Dl08Q4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0Dl08Q4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78DFDC2BCFC;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791682889;
	bh=JOqthLJNDgnkrr8WzV/xZURDm5fGLtm9hYL6Z3QePOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g0Dl08Q4xu17genCn+xTRr9Zrdr5ahU+PmyPeVD/DaX1f6ORUCXgH+zk2t5oECaJn
	 08OXXmHhrC8PNxorR8Wy4rILKuXQnwxyxC5YxJNAvrOfl+unJGQDNSiKmuqfjm0u/H
	 h2orknO1MeA5kmK5ZhBD1ztpHDI5mBIFOTB7cd3yZsg64zHKjnoI+M4gT1kxvP+K5X
	 eJDLppUBQ/R4XJnj2+QWOvu6bH3u4KnMYRwWOIUF88c1x4JAx+OU8tEHN/SbHflgPk
	 B2BtE7n730+4dDOzJ7PZ5XJtxhFjybVhrEmbC370htGYPRwLjGkXquyV+arsp6bqmB
	 VeGG/2IgCbKlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65492CA9EC7;
	Sun, 11 Oct 2026 01:41:29 +0000 (UTC)
From: Brad Fitzpatrick via B4 Relay <devnull+bradfitz.tailscale.com@kernel.org>
Date: Sun, 11 Oct 2026 01:41:28 +0000
Subject: [PATCH net 2/2] selftests: net: add a test for GRO of GRE over FOU
 and GUE
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-bradfitz-gre-fou-gro-b4-v1-2-df713aad1531@tailscale.com>
References: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
In-Reply-To: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Brad Fitzpatrick <bradfitz@tailscale.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791682889; l=6313;
 i=bradfitz@tailscale.com; s=20261011; h=from:subject:message-id;
 bh=vjzrvcYUSd9pHlNqOyUjxwSHaXeXL6ZpqdPWnkAvhdk=;
 b=RKGXZx8cGy9UYoy8rInsK8UbWDvb5zLMOA16Tu6teqN7bA48J3tU2lqHqpWEOxYrw9GTZMQq0
 bKf0RfWP+1aAg5FQF22iUGbnR64Aqmw/euwf9bCUhOimgjNyoOHFE6r
X-Developer-Key: i=bradfitz@tailscale.com; a=ed25519;
 pk=RL25YdOUenVJzQaiZDrw/Aqu9ZEwUQBon30yMHGsIKY=
X-Endpoint-Received: by B4 Relay for bradfitz@tailscale.com/20261011 with
 auth_id=1152
X-Original-From: Brad Fitzpatrick <bradfitz@tailscale.com>
Reply-To: bradfitz@tailscale.com

From: Brad Fitzpatrick <bradfitz@tailscale.com>

Send bulk TCP through GRE tunnels carried over UDP by FOU and by GUE,
each over IPv4 and IPv6, with GRO on at the receiving veth and
segmentation off at the sender so the receiver gets wire-sized packets
to merge. Check that the receiver counts no UDP errors.

Verified under virtme-ng: without the previous patch, all four cases
fail, with the encapsulation socket counting every merged packet in
UdpInErrors or Udp6InErrors. With it, they pass in a few seconds.

Assisted-by: LLM
Signed-off-by: Brad Fitzpatrick <bradfitz@tailscale.com>
---
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/fou_gre_gro.sh | 164 +++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 590b33e16d9f..55101ed41c52 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -42,6 +42,7 @@ TEST_PROGS := \
 	fib_rule_tests.sh \
 	fib_tests.sh \
 	fin_ack_lat.sh \
+	fou_gre_gro.sh \
 	fou_mcast_encap.sh \
 	fq_band_pktlimit.sh \
 	gre_gso.sh \
diff --git a/tools/testing/selftests/net/fou_gre_gro.sh b/tools/testing/selftests/net/fou_gre_gro.sh
new file mode 100755
index 000000000000..21ed50f647ae
--- /dev/null
+++ b/tools/testing/selftests/net/fou_gre_gro.sh
@@ -0,0 +1,164 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that GRE packets carried over UDP (FOU or GUE) get through when the
+# receiver merges them with GRO.
+#
+# Send bulk TCP through such tunnels with GRO on at the receiver, and
+# segmentation off at the sender so the receiver gets wire-sized packets
+# to merge, and check that the receiver counts no UDP errors (UdpInErrors
+# or Udp6InErrors). Also check that GRO really merged packets, by comparing
+# the UDP datagrams the receiver delivered with the packets its veth
+# received, so that a setup where GRO doesn't engage skips rather than
+# passes.
+
+source lib.sh
+
+NSEND=""
+NRECV=""
+
+FOU_PORT=5555
+TCP_PORT=9000
+SIZE_MB=4
+
+TUN_S=192.168.99.1
+TUN_R=192.168.99.2
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+# setup_tunnel creates the namespaces, the veth between them and a GRE
+# tunnel over UDP encapsulation $1 (fou or gue) over IPv$2. It returns
+# $ksft_skip if the kernel or iproute2 can't set it up.
+setup_tunnel() {
+	local encap=$1
+	local family=$2
+	local type=gre
+	local addr_s=10.0.0.1
+	local addr_r=10.0.0.2
+	local fou_args="ipproto 47"
+
+	if [ "$encap" = gue ]; then
+		fou_args=gue
+	fi
+	if [ "$family" = 6 ]; then
+		type=ip6gre
+		addr_s=2001:db8::1
+		addr_r=2001:db8::2
+		fou_args="$fou_args -6"
+	fi
+
+	setup_ns NSEND NRECV || return "$ksft_skip"
+
+	ip link add veth_s netns "$NSEND" type veth \
+		peer name veth_r netns "$NRECV" || return "$ksft_skip"
+	ip -n "$NSEND" addr add 10.0.0.1/24 dev veth_s
+	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
+	ip -n "$NSEND" addr add 2001:db8::1/64 dev veth_s nodad
+	ip -n "$NRECV" addr add 2001:db8::2/64 dev veth_r nodad
+	ip -n "$NSEND" link set veth_s up
+	ip -n "$NRECV" link set veth_r up
+
+	ip netns exec "$NRECV" ethtool -K veth_r gro on || return "$ksft_skip"
+	ip netns exec "$NSEND" ethtool -K veth_s tso off gso off \
+		tx-gre-segmentation off tx-gre-csum-segmentation off \
+		tx-udp_tnl-segmentation off tx-udp_tnl-csum-segmentation off ||
+		return "$ksft_skip"
+
+	# shellcheck disable=SC2086 # $fou_args is several arguments
+	ip netns exec "$NSEND" ip fou add port "$FOU_PORT" $fou_args ||
+		return "$ksft_skip"
+	# shellcheck disable=SC2086
+	ip netns exec "$NRECV" ip fou add port "$FOU_PORT" $fou_args ||
+		return "$ksft_skip"
+	ip -n "$NSEND" link add gre_t type "$type" \
+		local "$addr_s" remote "$addr_r" \
+		encap "$encap" encap-sport auto encap-dport "$FOU_PORT" ||
+		return "$ksft_skip"
+	ip -n "$NRECV" link add gre_t type "$type" \
+		local "$addr_r" remote "$addr_s" \
+		encap "$encap" encap-sport auto encap-dport "$FOU_PORT" ||
+		return "$ksft_skip"
+
+	ip -n "$NSEND" addr add "$TUN_S/30" dev gre_t
+	ip -n "$NRECV" addr add "$TUN_R/30" dev gre_t
+	ip -n "$NSEND" link set gre_t up
+	ip -n "$NRECV" link set gre_t up
+}
+
+# recv_counter prints the sum of the receiver's nstat counters "$@".
+recv_counter() {
+	ip netns exec "$NRECV" nstat -az "$@" |
+		awk '!/^#/ { n += $2 } END { print n + 0 }'
+}
+
+run_test() {
+	local encap=$1
+	local family=$2
+	local name="GRO of GRE in ${encap^^} over IPv$family"
+	local datagrams
+	local packets
+	local errors
+	local pid
+	local rc
+
+	RET=0
+
+	if ! setup_tunnel "$encap" "$family"; then
+		log_test_skip "$name"
+		cleanup_all_ns
+		return
+	fi
+
+	ip netns exec "$NRECV" socat -u \
+		TCP4-LISTEN:"$TCP_PORT",bind="$TUN_R",reuseaddr OPEN:/dev/null &
+	pid=$!
+	wait_local_port_listen "$NRECV" "$TCP_PORT" tcp
+
+	# The timeout only bounds failing runs; passing ones take under a second.
+	dd if=/dev/zero bs=1M count="$SIZE_MB" 2>/dev/null |
+		ip netns exec "$NSEND" timeout 20 \
+			socat -u STDIN TCP4:"$TUN_R":"$TCP_PORT"
+	rc=$?
+
+	# Check the UDP error count rather than the duration, which depends
+	# on the machine.
+	errors=$(recv_counter UdpInErrors Udp6InErrors)
+	check_err "$errors" "$errors UDP errors at the receiver"
+	check_err "$rc" "transfer failed"
+
+	# Without errors, a pass only means something if GRO merged packets:
+	# then the encapsulation socket sees far fewer datagrams than the
+	# veth received packets.
+	datagrams=$(recv_counter UdpInDatagrams Udp6InDatagrams)
+	packets=$(ip netns exec "$NRECV" \
+		cat /sys/class/net/veth_r/statistics/rx_packets)
+	if [ "$RET" -eq 0 ] && [ $((datagrams * 2)) -gt "$packets" ]; then
+		ret_set_ksft_status "$ksft_skip" \
+			"GRO didn't merge: $datagrams UDP datagrams from $packets packets"
+	fi
+
+	log_test "$name"
+	kill "$pid" 2>/dev/null
+	wait "$pid" 2>/dev/null
+	cleanup_all_ns
+}
+
+require_command socat
+require_command ethtool
+require_command nstat
+
+modprobe -q fou
+modprobe -q ip_gre
+modprobe -q fou6
+modprobe -q ip6_gre
+
+run_test fou 4
+run_test gue 4
+run_test fou 6
+run_test gue 6
+
+exit "$EXIT_STATUS"

-- 
2.43.0


