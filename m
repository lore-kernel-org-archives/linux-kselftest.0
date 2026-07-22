Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF6404BDD
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739384; cv=none; b=Xzz9PGMCaL4dbpiJEkkvnAAhd/yY8RrFMGhvLc3o8YGmNTfRqbHPuKrtRqAKJDpXpqh0STTrDu90Ieyxxm7z0lCo2ZlplgfYrtA3S9XwuYI+CBtgPV1lNllIxlrBbwz+YT5ALIEssSxu/Yt2W3rqM7jQHr5FLiTe3UA34ki31bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739384; c=relaxed/simple;
	bh=fYv45bTPv6rAMHoRjWxrBRIGiABY1LmdMqeDqcUiphw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW/YK6QhoLXnuNIm42sIZzD53plQpjAeCJyhaLVNKQu2Ho2LZzvJ6FDQbl6jJ6bm/+rPyR7x3OHEj6I98e54UbDFqIzqtNuKwRPhjBnUsSvjQIwhkgc009qgFhDIR2G7X7wqlf0g4QEvkFgWi3/wOSUsuyMDiQ8IrX4RuvBgLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lmd1i+f9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lmd1i+f9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49552f516beso26965e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784739381; x=1785344181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyvSsqSpfDY2oL4Eym940bEubjIgZeaLaQ/eKflDksk=;
        b=Lmd1i+f9S25x1x2qAYx4cdAOkhpkMrpvrd0egfm33q5hNC6dq3nHPjcJZom/36UkJH
         1QLAvXk94diiWLqaPOQHrGnQON9iXMl14nZQHFCn4mwQbAo1h4EnJROEaCem5IdiS/S9
         KwiAErJpNE6BCSJBe0Ztnv/OEVIfeRsrm034EamDGrRn6f+BQ8RqHHlRWU/uYIkzp0sd
         +5h/4aqDuvlr7mNWw6e9PJRqJjqhGPTueLLPTqbOOdPKWaMUkVaxI7jps6xungJ15ea0
         b8il8gWBFjwsIwpMqEhOC2aZfAWXmE5gJ7XZXSov4OpN2TBlCdZtALpD0Zq17SqSEVOf
         CnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739381; x=1785344181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GyvSsqSpfDY2oL4Eym940bEubjIgZeaLaQ/eKflDksk=;
        b=de66XRWT/fdWCOKgAY6yazUxJgO/wT47GsC5LYftlSMrHIPCrQ81a53i9AYQzNnldt
         UWrfVhfUszAZlowSR3p2LYdMaTocy0veh2C8O5V5FOidxLqBssyb6Qau2PbJW39pnxMH
         kSmyQnd4bNhwAJbj/rrNSxK11+H2+mG3gfioFNqU9b94S8GK+xo40K3Y8Dy1eWLyivbY
         3JzCA11BS9o7YQkpmg9ep2UbOUFRBCgMegW5YjK3SX1NUIJ47UqpWRbwcBJar54qB6ma
         gineeHYQ95p2454GUNGFBdPiEf7f1lZ+FHOmSJuxyEyz0+p9F8jbwFdQju2FctHo1GVE
         CzTw==
X-Forwarded-Encrypted: i=1; AHgh+RrLvDApF3JGtuZICRlBbqay85fNrl+40FAKTvkwyyQtKSc/io7cwXmoRimHtaviXd+7ycQVXvuqlm6toHcHxoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2COONRfCk7KBA2h3ONBKyTKcQTn+/JrNtIzOJd4TmgGFuJ65
	a5jsMeJ65IdPa3Heqo3Q1dkmIQZ5pdGY+4fJ5V4EiShOcrbZOV/HDmKi
X-Gm-Gg: AR+sD11FgzeUF27pdlquKgJ+xwCGFZ81OM5nQnQBiUVPKgYibWM5s0KmZ5RMaZpzy6n
	wYpBGNY/9/dvqrQDN+F+J0DOwrhLUpxLZCsrIMzOtTC4zUZB/7c9Bwd8dI8aAiKHccdHMRxWYsR
	SaqTGW4yqLXn77tEGREZw7K86WDNOOCYi0l7qXZAPNJb1RCLasYB1WzlpThalOlQCmxh+GMrU1+
	XcK4AMKHttWwDZHEKASjE1nls1GY8yDvZmVi1T27nRV6Eo3QJY2QtSghpjdgbKQ23Y1qbeJj1eC
	/i3a5up7xAyIbkzc7CIWS3arVYssiJJ76f/bLpf1CWqOyH67KfgHbVkwVnDEoscSNh8h9IGZvg4
	rE+EQOw4kW2bJ8WiRZaPXqMc5KjB5FeXF+FmGdheYSNjbyf0EguRRBdwoDCBoq8ko3y+vDLgWn2
	zC8Ur+B9jZa4YJrVsL5QwTccYnsjMv0IwWCunTzvsC3R4FG7auCymRgBgxlaB6IgKHlaK3NUxOd
	QH8De7Wnog4S6IOwS32UNPwc68VRs4g1zW+tTtrUHoaUV/5
X-Received: by 2002:a05:600c:4f10:b0:493:b6a2:858d with SMTP id 5b1f17b1804b1-4956bd2100dmr19519525e9.6.1784739380587;
        Wed, 22 Jul 2026 09:56:20 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-150-230.78.51.pool.telefonica.de. [78.51.150.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm7288629f8f.22.2026.07.22.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:56:20 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	qingfang.deng@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net 4/4] selftests: net: hsr: add GRO super-packet forwarding test
Date: Wed, 22 Jul 2026 18:56:14 +0200
Message-ID: <20260722165614.124-5-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722165614.124-1-xiexinet@gmail.com>
References: <20260722165614.124-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test exercising the HSR forward path with GSO super-packets:
a TSO-enabled SAN behind the interlink streams TCP through an HSR
DUT to a peer node. The test verifies that:

* enslaved devices have GRO and HW-GRO disabled automatically,
* the HSR master does not advertise GSO/TSO features,
* the stream completes with zero retransmits, i.e. super-packets are
  unfolded per-frame at the forward entry instead of being tagged
  and forwarded as single oversized frames (the stream is rate-capped
  so the zero-retransmit discriminator is stable on CI-class hosts).

The one-shot iperf3 server runs inside a wrapper shell with its exact
PID recorded (pidfile appearance is polled, no startup race): cleanup
kills the server and wait(1)s the wrapper on every exit path, and the
success path waits and checks the server exit status, so neither the
server process nor the namespaces can leak. Environments whose
iproute2 lacks the HSR interlink syntax are skipped with ksft_skip.

Without the fixes the feature checks fail, and on drivers that hand
GRO super-packets to the HSR receive path the stream degrades or
stalls.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_gro_superpacket.sh  | 249 ++++++++++++++++++
 2 files changed, 250 insertions(+)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh

diff --git a/tools/testing/selftests/net/hsr/Makefile b/tools/testing/selftests/net/hsr/Makefile
index 31fb9326c..0d105476e 100644
--- a/tools/testing/selftests/net/hsr/Makefile
+++ b/tools/testing/selftests/net/hsr/Makefile
@@ -3,6 +3,7 @@
 top_srcdir = ../../../../..
 
 TEST_PROGS := \
+	hsr_gro_superpacket.sh \
 	hsr_ping.sh \
 	hsr_redbox.sh \
 	link_faults.sh \
diff --git a/tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh b/tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh
new file mode 100755
index 000000000..4b0a9ceea
--- /dev/null
+++ b/tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh
@@ -0,0 +1,249 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test HSR handling of GRO/GSO super-packets:
+#
+#  1. Enslaving a device to an HSR master disables GRO on it
+#     (dev_disable_gro()).
+#  2. The HSR master does not advertise GSO/TSO features.
+#  3. A TCP stream from a TSO-enabled SAN (which therefore emits GSO
+#     super-packets) is unfolded at the HSR forward entry and delivered
+#     per-frame: the transfer completes with zero retransmits.
+#
+# Topology (100.64.0.0/24):
+#
+#   ns_san                    ns_dut                      ns_peer
+#  +-----------+  interlink  +---------------+  LAN A/B  +-----------+
+#  | s0 [0.1]  |-------------| d_il   hsr0   |-----------| hsr1 [0.3]|
+#  +-----------+             | d_a / d_b     |           | p_a / p_b |
+#                            +---------------+           +-----------+
+#
+# SAN traffic reaches ns_peer only through hsr0's forward path
+# (interlink RX -> LAN A/B TX), so every SAN frame is tagged and
+# forwarded by the DUT.
+
+source ./hsr_common.sh
+
+ns_dut="hsr-gro-dut"
+ns_san="hsr-gro-san"
+ns_peer="hsr-gro-peer"
+san_ip="100.64.0.1"
+peer_ip="100.64.0.3"
+iperf_pid=""
+server_wrapper=""
+iperf_pidfile="/tmp/hsr_gro_iperf.pid"
+
+cleanup()
+{
+	if [ -n "${iperf_pid}" ] && [[ "${iperf_pid}" =~ ^[0-9]+$ ]]; then
+		kill "${iperf_pid}" 2>/dev/null
+	fi
+	if [ -n "${server_wrapper}" ]; then
+		# the wrapper waits on the server; reap it with a 5s bound so a
+		# live-but-unpublished server can never hang cleanup
+		for _ in $(seq 1 50); do
+			kill -0 "${server_wrapper}" 2>/dev/null || break
+			sleep 0.1
+		done
+		kill "${server_wrapper}" 2>/dev/null
+		wait "${server_wrapper}" 2>/dev/null
+		server_wrapper=""
+	fi
+	# last resort, namespace-scoped only: kill iperf3 processes that
+	# actually live in the peer netns. netns != pidns: a blind pkill
+	# would scan the host PID space and hit unrelated tests.
+	for _p in $(ip netns pids "$ns_peer" 2>/dev/null); do
+		if [ "$(cat /proc/$_p/comm 2>/dev/null)" = "iperf3" ]; then
+			kill "$_p" 2>/dev/null
+		fi
+	done
+	iperf_pid=""
+	rm -f "${iperf_pidfile}"
+	ip netns del "$ns_dut" 2>/dev/null
+	ip netns del "$ns_san" 2>/dev/null
+	ip netns del "$ns_peer" 2>/dev/null
+}
+
+trap cleanup EXIT
+
+check_tool()
+{
+	if ! command -v "$1" > /dev/null 2>&1; then
+		echo "SKIP: Could not run test without $1"
+		exit $ksft_skip
+	fi
+}
+
+nsx()
+{
+	ip netns exec "$1" bash -c "$2"
+}
+
+setup_topo()
+{
+	local ns
+
+	cleanup
+	for ns in "$ns_dut" "$ns_san" "$ns_peer"; do
+		ip netns add "$ns"
+	done
+
+	ip link add d_a netns "$ns_dut" type veth peer name p_a netns "$ns_peer"
+	ip link add d_b netns "$ns_dut" type veth peer name p_b netns "$ns_peer"
+	ip link add d_il netns "$ns_dut" type veth peer name s0 netns "$ns_san"
+
+	# HSR tags add 6 bytes per frame; give the LAN legs headroom.
+	for iface in d_a d_b; do
+		nsx "$ns_dut" "ip link set $iface mtu 1600; ip link set $iface up"
+	done
+	for iface in p_a p_b; do
+		nsx "$ns_peer" "ip link set $iface mtu 1600; ip link set $iface up"
+	done
+
+	nsx "$ns_dut" "ip link set d_il up"
+	nsx "$ns_san" "ip link set s0 up; ip addr add $san_ip/24 dev s0"
+
+	nsx "$ns_dut" "ip link add hsr0 type hsr \
+		slave1 d_a slave2 d_b interlink d_il proto 0; \
+		ip link set hsr0 up"
+	nsx "$ns_peer" "ip link add hsr1 type hsr \
+		slave1 p_a slave2 p_b proto 0; \
+		ip link set hsr1 up; ip addr add $peer_ip/24 dev hsr1"
+
+	# Let the nodes see each other's supervision frames.
+	sleep 2
+}
+
+check_feature()
+{
+	local ns="$1"
+	local iface="$2"
+	local feature="$3"
+	local want="$4"
+
+	if nsx "$ns" "ethtool -k $iface" | grep -q "^$feature: $want"; then
+		echo "INFO: $ns/$iface $feature is $want [ OK ]"
+	else
+		echo "FAIL: $ns/$iface $feature is not $want" 1>&2
+		ret=1
+	fi
+}
+
+do_gro_feature_checks()
+{
+	echo "INFO: Checking that enslavement disabled GRO."
+	check_feature "$ns_dut" d_a generic-receive-offload off
+	check_feature "$ns_dut" d_b generic-receive-offload off
+	check_feature "$ns_dut" d_il generic-receive-offload off
+	stop_if_error "GRO not disabled on enslaved devices."
+
+	echo "INFO: Checking that enslavement disabled HW-GRO."
+	check_feature "$ns_dut" d_a rx-gro-hw off
+	check_feature "$ns_dut" d_b rx-gro-hw off
+	check_feature "$ns_dut" d_il rx-gro-hw off
+	stop_if_error "HW-GRO not disabled on enslaved devices."
+
+	echo "INFO: Checking that the HSR master does not advertise GSO/TSO."
+	check_feature "$ns_dut" hsr0 generic-segmentation-offload off
+	check_feature "$ns_dut" hsr0 tcp-segmentation-offload off
+	stop_if_error "HSR master still advertises GSO/TSO."
+}
+
+start_iperf_server()
+{
+	# One-shot server, no -D: record its exact PID (netns shares the PID
+	# namespace). The wrapping shell waits on the server so the script can
+	# really wait(1) for the whole tree, on success and failure alike.
+	rm -f "${iperf_pidfile}"
+	( nsx "$ns_peer" "iperf3 -s -1 > /dev/null 2>&1 & echo \$! > ${iperf_pidfile}; wait" ) &
+	server_wrapper=$!
+	# the wrapper writes the pidfile asynchronously; wait for it to
+	# appear instead of racing the read
+	for _ in $(seq 1 50); do
+		[ -s "${iperf_pidfile}" ] && break
+		sleep 0.1
+	done
+	if [ ! -s "${iperf_pidfile}" ]; then
+		echo "FAIL: iperf3 server did not publish a pid (no pidfile)" 1>&2
+		ret=1
+		return 1
+	fi
+	iperf_pid=$(cat "${iperf_pidfile}")
+	if ! [[ "${iperf_pid}" =~ ^[0-9]+$ ]] || ! kill -0 "${iperf_pid}" 2>/dev/null; then
+		echo "FAIL: iperf3 server pid '${iperf_pid}' invalid or not alive" 1>&2
+		ret=1
+		return 1
+	fi
+	sleep 1
+	return 0
+}
+
+do_tso_stream_test()
+{
+	local out sender_retr
+
+	echo "INFO: Enabling TSO/GSO on the SAN interface."
+	nsx "$ns_san" "ethtool -K s0 tso on gso on"
+	check_feature "$ns_san" s0 tcp-segmentation-offload on
+	stop_if_error "Could not enable TSO on the SAN interface."
+
+	echo "INFO: Running 10s TCP stream SAN -> peer through the HSR DUT."
+	start_iperf_server || return
+		# rate-capped: the discriminator is per-frame unfold (completion with
+	# 0 retransmits), not max throughput; uncapped runs flap at VM/CI
+	# edge rates without indicating a functional problem.
+	out=$(nsx "$ns_san" "timeout 60 iperf3 -c $peer_ip -M 1446 -b 2G -t 10" 2>&1)
+	if [ $? -ne 0 ]; then
+		echo "FAIL: iperf3 client failed:" 1>&2
+		echo "$out" 1>&2
+		ret=1
+		return
+	fi
+
+	# success path: the one-shot server exits by itself; really wait for
+	# the wrapper to reap it, and check its exit status
+	wait "${server_wrapper}"
+	server_rc=$?
+	server_wrapper=""
+	iperf_pid=""
+	if [ "$server_rc" -ne 0 ]; then
+		echo "FAIL: iperf3 server exited with rc=$server_rc" 1>&2
+		ret=1
+		return
+	fi
+
+	sender_retr=$(echo "$out" | awk '/sender/ {print $(NF-1)}')
+	if [ -z "$sender_retr" ] || [ "$sender_retr" -ne 0 ]; then
+		echo "FAIL: retransmits during GSO unfold: ${sender_retr:-unknown}" 1>&2
+		echo "$out" 1>&2
+		ret=1
+		return
+	fi
+
+	echo "INFO: TCP stream completed with 0 retransmits [ OK ]"
+	echo "$out" | grep -E "sender|receiver"
+}
+
+check_prerequisites
+check_tool ethtool
+check_tool iperf3
+check_tool timeout
+
+# iproute2 must know the HSR interlink syntax.
+if ! ip link help hsr 2>&1 | grep -qi interlink; then
+	echo "SKIP: iproute2 has no HSR interlink support"
+	exit $ksft_skip
+fi
+
+setup_topo
+
+echo "INFO: Initial validation ping (SAN -> peer through the DUT)."
+do_ping "$ns_san" "$peer_ip"
+stop_if_error "Initial validation failed."
+
+do_gro_feature_checks
+do_tso_stream_test
+stop_if_error "GSO super-packet stream test failed."
+
+echo "INFO: All good."
+exit $ret
-- 
2.43.0

