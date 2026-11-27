Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817762;
	b=qiVC7TsHLt1UDx9mceVv6qnp8uxHu4B17be06M4kPO7PnpzB2AXbVn5JLpL0iEvKtGUZ
	 S1+sy75PKeCXO1ht7qPJ9C92fat6La7wT3wf4nvMhmrPoC2xmpx/+xYOMVgjvuGO7r+2N
	 Oe80gvT/sKN9u6CfE6hY2LJVbl2xfAzJm1LhL7TOI7LEZbjYwteRbPQ1ZW4q0mFba+u3W
	 pUn6ec7J3+pGlFMupnuTKJ7ZudC40zFRnqay5KjJKq/AE7WjyALBykfWjx0UZodikZ/Z1
	 fQEPGwiIYDq1Ke60yx9iVWcPqX3TirLkcgq6glarC37fWrzow5HYyXNJ0osrc7ggfZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J6WTuoae2eaoUsObFU92jMCFeDSqSwikp9KNnljndek=;
	b=IF40quiV8QaVVnHt1qUEbHAUS9b0E/X89BhqFtA4jSR/xUtjMEMmT68dYWv9BcE48UwL
	 GOGIGk3aWGLxY2zJvAnEHxLzaphhGg9GveqKZruqqgmIAYoFzBtiL8/nQXCG3ofI26W32
	 u/Nw7W/tOC9+qN1QZVE/ih6uZ7LfkhVwFfa32WeJcgOYx+QN4xwMsOdE0aWODrfkns6a9
	 TuhKch5B6hKsLzQ7xcLZndYPbwbO2whQFcjv/EUf9eIpSECoJgCVw6LqyM3eY7UV4/29v
	 IThU51io1fgTRlpj+Usgf0qcL2yQEnswaaRC+lnPaxLUbNR1KyMXfF24xSsgwE7EH5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5Rzxc+3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E69606A31C;
	Fri, 27 Nov 2026 22:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5Rzxc+3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795817761;
	b=2rdzXDRo25zjA0sNuVEB6qS1muJIN+aMtjo39p1bvIXb2hTYhGfzxuwBOMylVp5cCV3b
	 g90DGJPC/OjUbl1CUGt5xPNeDm+LJ0UNSlAhBkX7xq+TS2AmdRStLyFEFrzw1hJfGV2tg
	 djddRlhLYGrEcaUfzWUg/5K84C67sBPKHTgR90uKYFQBtMrJmGhLGOms94l2PZVF2RTnU
	 jQ5SwybX+JXwev/+GIkNoGsXuMRzeVsG1Zfr/uYHbdHggcs48dZWRcPGXw7XfSARuW/wM
	 erKpqZTyLICNV/ronSOpxHO5r3XYyNknApz/IKsFsTQ0dkUiiq/flruWm3eWshCBruQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795817761;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J6WTuoae2eaoUsObFU92jMCFeDSqSwikp9KNnljndek=;
	b=toqQgtRGCAayy1hT+sjG1pSlysEMqx7nhewWCOfFXET+d+dVm4O1iXPs5yEiocwUEzkZ
	 enPuGKVq8YGkpcrYFY0I6UdlUXbqnNrBjoVB8Cfauq9xhmHxxbHr3Br3EC/h0oCmPDhmy
	 AZJ2t89vq+op6T9AKs5hg+a6i0e0W8S+/LIcMiqUZg/T/FkzrvJ2xM1IKjEnEBbkIHMKp
	 yETDX1t+qJph4yj+42fbIW6G1ldnDE3Zqjp7s5I3fim4XDSvW+0PyfUwSUoxyL9HbMD38
	 oiwntCk4hau1MIERx8iWvg31Z2sYFpKXbkR8HIqe8xETeGYJu+D4my84YdUHhgAi3oQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 668DF1F00925;
	Fri, 27 Nov 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795817761;
	bh=J6WTuoae2eaoUsObFU92jMCFeDSqSwikp9KNnljndek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y5Rzxc+3Av4BFRTDgSL7kpaSrxzFNV6sP+viWWKI0TV65EN7uSIRdT+f9CuGXP+2f
	 Hbl4qVD3k99li+vYsh6cSdH7MQwuF6mfdVB9qfB2uuxRrhhj++zUgjYB2LyZgYOG1U
	 3wE2zL/EzarmdeBtsbs1HVZoLMPHZ0Yb1fZRH5BmrTkVbeLPhzaru7TRp0cQzsrAPR
	 Pd9nugKrCiNJup09gpov6guSdUCZDp/Ktl/fKOlW4gvVkZQ6ICzWLSFBxf5RDghGuu
	 TyvVLhYDeWbUYmtQjb2xZomkRwi9MEJVf/OWfUeW42/jy1nhWPrjb8OsdQ6ac7P05T
	 y1caOGFER3yLw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E519E4DE40;
	Fri, 27 Nov 2026 22:15:50 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Date: Fri, 27 Nov 2026 15:15:51 -0700
Subject: [PATCH net-next v3 2/2] selftests: net: add
 tcp_l3mdev_exempt_ports test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-tcp-l3mdev-exempt-ports-v3-2-f875b1184f26@nexthop.ai>
References: <20261127-tcp-l3mdev-exempt-ports-v3-0-f875b1184f26@nexthop.ai>
In-Reply-To: <20261127-tcp-l3mdev-exempt-ports-v3-0-f875b1184f26@nexthop.ai>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8762; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=JB0AlyIeGDOZNdLEDmQcmGtRfeZxLqLPys9K5j/F9xo=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrCgEVxpZOZaVZSeyAmuiI2LlSTqXdKvWsRgXOS
 C1caqWA0D+JAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawoBFQAKCRDUyrJbtV/Q
 dilwDACjTAKIOB3TQnGimjL/YQN6wijEgrOHiTAagLcHUDTRmpGFqpKxGv/io5xoLKioLgleG5i
 d7lBa3ZAqc2WCKFuuwev+Wt4ueG/pKbZIrNhJfLtuxGKvy/PBSr5GSvR23ZP0CfstUufU7crmA0
 bxxk2l9/K7l9Q0tSPC2aZnMPZ8KRj+w+6C8C2gaOwJacgzU7cvdD+twCgAx184O8Jbq/LtCpvBx
 A0FqVRPfpU0oo/mR1HAldGmoYZfQu0HADnUlMNReq36ggPbQUU2FulVQzUDt24PugRocZmd3nSF
 DHHASKtm9K53Kdo6hKj/prkddZdsmWHMbvAQWxyBRUn+9g1p0zgniwzGsJi/rAth+/g23uswd0I
 Tq4CO9wWLGRQb7dvIOJmXTOdwDpNbThT8DO+oHQ65P8zZgFnWAXWjntI2dPV1Qf9a1ZiFySPrxl
 efnlwDQdRonnJs2t9pUp2e0k71xsiKNEllHv73uadkD1C4hhAiVoNq5biqSJbAHsyFdTg=
X-Developer-Key: i=kalash@nexthop.ai; a=openpgp;
 fpr=9629D7C79C7700B9C6F4F0B0D4CAB25BB55FD076
X-Endpoint-Received: by B4 Relay for kalash@nexthop.ai/default with
 auth_id=1588
X-Original-From: Kalash Nainwal <kalash@nexthop.ai>
Reply-To: kalash@nexthop.ai
Content-Transfer-Encoding: 7bit

From: Kalash Nainwal <kalash@nexthop.ai>

Check that with tcp_l3mdev_accept=1 and the port listed in
tcp_l3mdev_exempt_ports, a VRF connection goes to the listener bound to
the VRF or to the receiving device (in both listener creation orders)
and is refused by an unbound-only listener, and that default-VRF
connections still reach the unbound listener. Covers IPv4 and IPv6.

Signed-off-by: Kalash Nainwal <kalash@nexthop.ai>
---
 tools/testing/selftests/net/Makefile               |   1 +
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 297 +++++++++++++++++++++
 2 files changed, 298 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index fb0a6466205..45b4c3c3738 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -110,6 +110,7 @@ TEST_PROGS := \
 	stress_reuseport_listen.sh \
 	tcp_ecmp_failover.sh \
 	tcp_fastopen_backup_key.sh \
+	tcp_l3mdev_exempt_ports.sh \
 	test_bridge_backup_port.sh \
 	test_bridge_neigh_suppress.sh \
 	test_ingress_egress_chaining.sh \
diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
new file mode 100755
index 00000000000..f98774b8ba4
--- /dev/null
+++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
@@ -0,0 +1,297 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test net.ipv4.tcp_l3mdev_exempt_ports.
+#
+# With tcp_l3mdev_accept=1, a listener that is not bound to a device also
+# matches connections that arrive in a VRF. For a port listed in
+# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VRF
+# or to the receiving device may take such a connection. Connections in
+# the default VRF are not affected.
+#
+#  ns_c (client in VRF)       ns_s (server)       ns_d (client, default VRF)
+#      veth0 ------------- veth_vrf [vrf red]
+#                             veth_def ----------------- veth0
+
+# ns_s, ns_c and ns_d are assigned by setup_ns, and the test functions
+# are called through ALL_TESTS.
+# shellcheck disable=SC2154,SC2329
+
+source lib.sh
+
+PORT=12345
+OTHER_PORT=23456
+VRF=red
+VRF_TABLE=1000
+
+VRF_SRV4=172.16.1.1
+VRF_CLI4=172.16.1.2
+DEF_SRV4=172.16.2.1
+DEF_CLI4=172.16.2.2
+VRF_SRV6=2001:db8:1::1
+VRF_CLI6=2001:db8:1::2
+DEF_SRV6=2001:db8:2::1
+DEF_CLI6=2001:db8:2::2
+
+# Servers that must not get a connection are stopped by the test, so this
+# only needs to be longer than any wait before the client connects.
+SRV_TIMEOUT=20
+
+ALL_TESTS="
+	unbound_listener
+	vrf_and_unbound_listeners
+	slave_and_unbound_listeners
+	default_vrf_unaffected
+"
+
+cleanup()
+{
+	cleanup_all_ns
+}
+
+setup_fail()
+{
+	echo "FAIL: setup"
+	exit "$ksft_fail"
+}
+
+setup()
+{
+	setup_ns ns_s ns_c ns_d || exit "$ksft_skip"
+
+	if ! ip -n "$ns_s" link add "$VRF" type vrf table "$VRF_TABLE"; then
+		echo "SKIP: VRF not supported"
+		exit "$ksft_skip"
+	fi
+
+	if ! ip netns exec "$ns_s" \
+	     test -e /proc/sys/net/ipv4/tcp_l3mdev_exempt_ports; then
+		echo "SKIP: net.ipv4.tcp_l3mdev_exempt_ports not supported"
+		exit "$ksft_skip"
+	fi
+
+	ip -n "$ns_s" -batch - <<-EOF || setup_fail
+		link set $VRF up
+		link add veth_vrf type veth peer name veth0 netns $ns_c
+		link set veth_vrf master $VRF
+		link set veth_vrf up
+		addr add $VRF_SRV4/24 dev veth_vrf
+		addr add $VRF_SRV6/64 dev veth_vrf nodad
+		link add veth_def type veth peer name veth0 netns $ns_d
+		link set veth_def up
+		addr add $DEF_SRV4/24 dev veth_def
+		addr add $DEF_SRV6/64 dev veth_def nodad
+	EOF
+
+	ip -n "$ns_c" -batch - <<-EOF || setup_fail
+		link set veth0 up
+		addr add $VRF_CLI4/24 dev veth0
+		addr add $VRF_CLI6/64 dev veth0 nodad
+	EOF
+
+	ip -n "$ns_d" -batch - <<-EOF || setup_fail
+		link set veth0 up
+		addr add $DEF_CLI4/24 dev veth0
+		addr add $DEF_CLI6/64 dev veth0 nodad
+	EOF
+
+	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_accept=1 ||
+		setup_fail
+}
+
+set_exempt()
+{
+	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_exempt_ports="$1"
+}
+
+# Start a server in the background. nettest sets SO_REUSEPORT on its
+# listeners, so an unbound and a device-bound listener can share the port.
+# $1: IP version, $2: device to bind to, or "unbound"
+start_server()
+{
+	local args=()
+
+	[ "$1" = 6 ] && args+=(-6)
+	[ "$2" != unbound ] && args+=(-I "$2")
+	ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" \
+		-t "$SRV_TIMEOUT" -q &
+}
+
+# Stop a server, ignoring its exit code.
+stop_server()
+{
+	kill "$1" 2>/dev/null
+	wait "$1" 2>/dev/null
+}
+
+# Stop a server that must not have received a connection. It must still
+# be running: had it accepted the connection or timed out, it would have
+# exited.
+# $1: pid, $2: name for the error message
+stop_idle_server()
+{
+	kill -0 "$1" 2>/dev/null
+	check_err $? "$2 exited, expected it to still be waiting"
+	stop_server "$1"
+}
+
+# $1: client netns, $2: IP version, $3: server address
+connect()
+{
+	local args=()
+
+	[ "$2" = 6 ] && args+=(-6)
+	ip netns exec "$1" nettest "${args[@]}" -r "$3" -p "$PORT" -t 2 -q
+}
+
+listeners_are()
+{
+	local n
+
+	n=$(ip netns exec "$ns_s" ss -Hltn "sport = :$PORT" | wc -l)
+	[ "$n" -eq "$1" ]
+}
+
+# $1: number of listeners to wait for on $PORT
+wait_listeners()
+{
+	slowwait 2 listeners_are "$1"
+}
+
+unbound_listener()
+{
+	local ver addr pid
+
+	for ver in 4 6; do
+		addr=$VRF_SRV4
+		[ "$ver" = 6 ] && addr=$VRF_SRV6
+
+		RET=0
+		set_exempt "$OTHER_PORT"
+		start_server "$ver" unbound
+		pid=$!
+		if wait_listeners 1; then
+			connect "$ns_c" "$ver" "$addr"
+			check_err $? "VRF connection failed"
+			wait "$pid"
+			check_err $? "unbound listener did not get the conn"
+		else
+			check_err 1 "listener did not start"
+			stop_server "$pid"
+		fi
+		log_test "IPv$ver: not exempt, unbound listener gets VRF conn"
+
+		RET=0
+		set_exempt "$PORT"
+		start_server "$ver" unbound
+		pid=$!
+		if wait_listeners 1; then
+			connect "$ns_c" "$ver" "$addr"
+			check_fail $? "VRF connection succeeded"
+			stop_idle_server "$pid" "unbound listener"
+		else
+			check_err 1 "listener did not start"
+			stop_server "$pid"
+		fi
+		log_test "IPv$ver: exempt, unbound listener gets no VRF conn"
+	done
+	set_exempt ""
+}
+
+# An unbound listener and a listener bound to $1 on the port. The VRF
+# connection must reach the bound one, whichever was created first.
+# $1: the VRF device, or the VRF slave device the connection arrives on
+bound_and_unbound_listeners()
+{
+	local dev=$1
+	local ver addr order first second pid_first pid_second
+	local pid_bound pid_unbound
+
+	set_exempt "$PORT"
+	for ver in 4 6; do
+		addr=$VRF_SRV4
+		[ "$ver" = 6 ] && addr=$VRF_SRV6
+
+		for order in "unbound $dev" "$dev unbound"; do
+			read -r first second <<< "$order"
+			RET=0
+
+			pid_second=
+			start_server "$ver" "$first"
+			pid_first=$!
+			if wait_listeners 1; then
+				start_server "$ver" "$second"
+				pid_second=$!
+			fi
+			if [ -z "$pid_second" ] || ! wait_listeners 2; then
+				check_err 1 "listeners did not start"
+				stop_server "$pid_first"
+				[ -n "$pid_second" ] &&
+					stop_server "$pid_second"
+				log_test "IPv$ver: exempt, $first first"
+				continue
+			fi
+
+			if [ "$first" = unbound ]; then
+				pid_unbound=$pid_first
+				pid_bound=$pid_second
+			else
+				pid_bound=$pid_first
+				pid_unbound=$pid_second
+			fi
+
+			connect "$ns_c" "$ver" "$addr"
+			check_err $? "VRF connection failed"
+			wait "$pid_bound"
+			check_err $? "$dev listener did not get the connection"
+			stop_idle_server "$pid_unbound" "unbound listener"
+
+			log_test "IPv$ver: exempt, $first first, $dev wins"
+		done
+	done
+	set_exempt ""
+}
+
+vrf_and_unbound_listeners()
+{
+	bound_and_unbound_listeners "$VRF"
+}
+
+slave_and_unbound_listeners()
+{
+	bound_and_unbound_listeners veth_vrf
+}
+
+default_vrf_unaffected()
+{
+	local ver addr pid
+
+	set_exempt "$PORT"
+	for ver in 4 6; do
+		addr=$DEF_SRV4
+		[ "$ver" = 6 ] && addr=$DEF_SRV6
+
+		RET=0
+		start_server "$ver" unbound
+		pid=$!
+		if wait_listeners 1; then
+			connect "$ns_d" "$ver" "$addr"
+			check_err $? "default VRF connection failed"
+			wait "$pid"
+			check_err $? "unbound listener did not get the conn"
+		else
+			check_err 1 "listener did not start"
+			stop_server "$pid"
+		fi
+		log_test "IPv$ver: exempt, unbound listener gets default conn"
+	done
+	set_exempt ""
+}
+
+trap cleanup EXIT
+
+check_gen_prog nettest
+setup
+tests_run
+
+exit "$EXIT_STATUS"

-- 
2.43.0


