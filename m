Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641477;
	b=4ho67suGHz9qs6xx1madsHmTxRftUB3nAJhQY4fOR6w6m1QMcLPRWFZwga/aJCnzhHIw
	 u8ZJ3ry9vbE1fBg2uia3+S83CY20YCAvUd2MQeI9y8+BevWYZyWjisMfIijgSn4zgsSTk
	 pRcFhhx4d1tCZAee4FtT4Vg3+wuuTyShG9U3HEBwGG2qo1GRnhaAktyxmnxiVp6DJmOLA
	 C+HOiesB1jLvnHKuMnTKIKnYiAcTXQZ2lUOWyqLYwTezy1pb0yW401YIjLSpx8FFWTm8b
	 nb4MvUiZDmsdUjEW/gUQ/aIV8uJ6qu9ZJ4kOeIuT0fcgq+uh4CZ2b7M9sxfCgtU9xOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641477;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZfcxBCdH4MqkIE9uTkekLY0Z7Le/9jIC9EoyHz4x//g=;
	b=5NZnM7i7qn5RdLNAT521F/akMhtq4+oxiRN+7+JpYDJijR2AQZ5VCxh+3BQ7DbWbqFTv
	 tjlVHfYXivRuT8xpmQ/crC+VBZ4iMQV5ZDRo+JcsG8v7fCE6H61+HJBagsgEubc8LoIW4
	 fcfLkYknuf1uDuVdm/zfXgUMldOJIU7VkNilUocafx6/83buA8UxQzV8RtJlqizfkHngG
	 ddBN23jUkHeyMf59jJKeer5LaxPsseMxeslIn3CiSQhEHYoXEdkxHKTaxCiimN3rVSHMO
	 oSI8seqCF05/NfeluCsCfa/L41GCQB8Nkpp5rq92O77K2mM8d+G+F67J5WEsfNCo3uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c99Ulbb0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D7606A31E;
	Wed, 25 Nov 2026 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c99Ulbb0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795641476;
	b=0KpwdxIn4ZhE2yEkqbCiK/AI47ER5q5agQBQJAJmIxy5eOE+KmajM9dj7UZNU93zjs+L
	 c6mRSs5UaQkcRoEqETr9FKTcHz4QXEJpcZHdApwj2BVehXzeNjfgfpn6PuO2WrzpDMyeK
	 0wXMwKHGXe2ZOX84nQQqM13DetTxbo+lEm5DjjGKa6X4WXWwZ6GYP5CVmF+slUk5uIF1j
	 pkvZiF3shoJ5Cj7rp3HVdXYiBPxzeEs9F27HcNXmqLEm2lvTnMzfVbWR07LvBmXXDL/md
	 pG7JSie+6yniUo8qQ3WJQvXOtbD+UAUcoxo1Jgjj6SqbisaetxfgytVlmVF6oqu2y3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795641476;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZfcxBCdH4MqkIE9uTkekLY0Z7Le/9jIC9EoyHz4x//g=;
	b=vdFLfd9usGr9EgeZsDKYWKH4l4fjNPmEh5wTIGv3KLLsvm5OiNeOcsYkmAszXK0asAEK
	 N4GAv6OEZ7CCi7PMToNYIBukvNS0PoDsEN3/9TmKcYOHhypnRAht8a/007CI8Htza9XXU
	 hJPR1iAC520Yy5UwnQuAjqDI1Lg59levkNq0gjS49s7CM/b/zrhrr6FnKBmDnMd4ybUFI
	 jYJvASU0RQMbnz31RkipUY/Cb2nmw2zozsbiQ9h7r4sKuURn1BC4jIJMkMaG8sFOtNDYw
	 Z6WirhAUX6opI7f9jsRCEdkH7SpnoYp+ei6iIY5NpR8XGlk5mklYJrXiwMUydyTjYDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71BDB1F000D2;
	Wed, 25 Nov 2026 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795641476;
	bh=ZfcxBCdH4MqkIE9uTkekLY0Z7Le/9jIC9EoyHz4x//g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c99Ulbb0bwm8t05TLmzsHa5uhd+ILPbfLwaLgQvdaZE8wP3OW0aQ67HzA7nHUA5LS
	 GlsI5MFbir5/b/jI2Px5Lbg6urzFiGOAbBEYtN+NcuXFU0FOTuuL6xns4emgmVuc84
	 JJrw32NsG3Ze6laHa6RWNwy+CJAplSN8AeMx7uU4Dozj4LZlL6nxBOpasqEzOckVO4
	 tLVh3lJa475PIQRWwvyLLSboApJkocl133ZOes5eVLMer9KhS4v8/EbGNliVbOMcwK
	 8IfLC0cZ18XOKPUF78JQRmOTT2hUU7zAXMcuIuaszKRlECixDxRcL8zRYUsAr5OIFT
	 YqwmGZsa7kOEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 026314D067;
	Wed, 25 Nov 2026 21:17:47 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Date: Wed, 25 Nov 2026 14:17:47 -0700
Subject: [PATCH net-next v2 2/2] selftests: net: add
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
Message-Id: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai>
References: <20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai>
In-Reply-To: <20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e@nexthop.ai>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7786; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=pCFpBhfKIxwlyAN8/jFlV/GpuTN55VV46c1c4t1xeJk=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrB1B5uhkB5G0WPoqQdg/04F3iPIWRMW545tFTO
 unK8kco5HuJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawdQeQAKCRDUyrJbtV/Q
 dgBdC/oDWzNLGABX1uSgVBYwRzvMu8FCpnwE3t/6K/43gMs9+jGOMHP8TYy/xnO3aCuuxwCswho
 UEAC6ChSXG/GTcecIidwB6s5ghCqPJdkLErw2D+ZPDnBBnGOyNo/JIsFDqFVUvpnlDBGqsgQu/I
 BCKf6MVGZDUtdwGuW0cHHmbEAV9VpbtNYm4a0y5vyMiu7uWbiyQkfC6wIKrde3n1y0vycNZaWLB
 Gaw1+xRfxnN4LdZZ7kJmcveC9T8bfuKVyoPu3qPPLDcd6FMDh7SrCJscBSR+7ywntfSxmzYdT0b
 tVFXNZbYoMj4fIw2ajgrEHs87NT8eY9HJZDXMhql19go6aiis7WkyRuUvhaSVY572/HR5SCeQDT
 Qi6XeIzAN6oY4kebI3Gc7B8TktNAvKMKv0txAxpVXb/HBxdPUM1ewTQlcY8IjJSf1f2koEZvQ6h
 GHBiqLOCflhUeprlNBCDgPIOEBK6N0+DcKctSz+4XbtD9Bfrozdz0/uQXV67/1iyxEwIg=
X-Developer-Key: i=kalash@nexthop.ai; a=openpgp;
 fpr=9629D7C79C7700B9C6F4F0B0D4CAB25BB55FD076
X-Endpoint-Received: by B4 Relay for kalash@nexthop.ai/default with
 auth_id=1588
X-Original-From: Kalash Nainwal <kalash@nexthop.ai>
Reply-To: kalash@nexthop.ai
Content-Transfer-Encoding: 7bit

From: Kalash Nainwal <kalash@nexthop.ai>

Check that with tcp_l3mdev_accept=1 and the port listed in
tcp_l3mdev_exempt_ports, a VRF connection goes to the VRF-bound
listener (in both listener creation orders) and is refused by an
unbound-only listener, and that default-VRF connections still reach
the unbound listener. Covers IPv4 and IPv6.

Signed-off-by: Kalash Nainwal <kalash@nexthop.ai>
---
 tools/testing/selftests/net/Makefile               |   1 +
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 260 +++++++++++++++++++++
 2 files changed, 261 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index c80dabbcc90..2a0b8453bfd 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -109,6 +109,7 @@ TEST_PROGS := \
 	stress_reuseport_listen.sh \
 	tcp_ecmp_failover.sh \
 	tcp_fastopen_backup_key.sh \
+	tcp_l3mdev_exempt_ports.sh \
 	test_bridge_backup_port.sh \
 	test_bridge_neigh_suppress.sh \
 	test_ingress_egress_chaining.sh \
diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
new file mode 100755
index 00000000000..da7f20bf2e9
--- /dev/null
+++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
@@ -0,0 +1,260 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test net.ipv4.tcp_l3mdev_exempt_ports.
+#
+# With tcp_l3mdev_accept=1, a listener that is not bound to a device also
+# matches connections that arrive in a VRF. For a port listed in
+# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VRF
+# may take such a connection. Connections in the default VRF are not
+# affected.
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
+# nettest server exit code when no connection arrives before its timeout
+SRV_TIMEOUT=2
+
+ALL_TESTS="
+	unbound_listener
+	vrf_and_unbound_listeners
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
+# listeners, so an unbound and a VRF-bound listener can share the port.
+# $1: IP version, $2: "vrf" or "unbound"
+start_server()
+{
+	local args=()
+
+	[ "$1" = 6 ] && args+=(-6)
+	[ "$2" = vrf ] && args+=(-I "$VRF")
+	ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" -t 3 -q &
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
+# $1: exit code of a server that must not have received a connection
+check_timeout()
+{
+	[ "$1" -eq "$SRV_TIMEOUT" ]
+	check_err $? "$2 exited with $1, expected timeout"
+}
+
+unbound_listener()
+{
+	local ver addr pid rc
+
+	for ver in 4 6; do
+		addr=$VRF_SRV4
+		[ "$ver" = 6 ] && addr=$VRF_SRV6
+
+		RET=0
+		set_exempt "$OTHER_PORT"
+		start_server "$ver" unbound
+		pid=$!
+		wait_listeners 1
+		check_err $? "listener did not start"
+		connect "$ns_c" "$ver" "$addr"
+		check_err $? "VRF connection failed"
+		wait "$pid"
+		check_err $? "unbound listener did not get the connection"
+		log_test "IPv$ver: not exempt, unbound listener gets VRF conn"
+
+		RET=0
+		set_exempt "$PORT"
+		start_server "$ver" unbound
+		pid=$!
+		wait_listeners 1
+		check_err $? "listener did not start"
+		connect "$ns_c" "$ver" "$addr"
+		check_fail $? "VRF connection succeeded"
+		wait "$pid"
+		rc=$?
+		check_timeout "$rc" "unbound listener"
+		log_test "IPv$ver: exempt, unbound listener gets no VRF conn"
+	done
+	set_exempt ""
+}
+
+# Both an unbound and a VRF-bound listener on the port. The VRF connection
+# must reach the VRF-bound one, whichever listener was created first.
+vrf_and_unbound_listeners()
+{
+	local ver addr order first second pid_first pid_second
+	local rc_first rc_second rc_vrf rc_unbound
+
+	set_exempt "$PORT"
+	for ver in 4 6; do
+		addr=$VRF_SRV4
+		[ "$ver" = 6 ] && addr=$VRF_SRV6
+
+		for order in "unbound vrf" "vrf unbound"; do
+			read -r first second <<< "$order"
+			RET=0
+
+			start_server "$ver" "$first"
+			pid_first=$!
+			wait_listeners 1
+			check_err $? "first listener did not start"
+			start_server "$ver" "$second"
+			pid_second=$!
+			wait_listeners 2
+			check_err $? "second listener did not start"
+
+			connect "$ns_c" "$ver" "$addr"
+			check_err $? "VRF connection failed"
+
+			wait "$pid_first"
+			rc_first=$?
+			wait "$pid_second"
+			rc_second=$?
+			if [ "$first" = vrf ]; then
+				rc_vrf=$rc_first
+				rc_unbound=$rc_second
+			else
+				rc_vrf=$rc_second
+				rc_unbound=$rc_first
+			fi
+			check_err "$rc_vrf" "VRF listener did not get the conn"
+			check_timeout "$rc_unbound" "unbound listener"
+
+			log_test "IPv$ver: exempt, $first first, VRF one wins"
+		done
+	done
+	set_exempt ""
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
+		wait_listeners 1
+		check_err $? "listener did not start"
+		connect "$ns_d" "$ver" "$addr"
+		check_err $? "default VRF connection failed"
+		wait "$pid"
+		check_err $? "unbound listener did not get the connection"
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


