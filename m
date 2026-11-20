Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214833;
	b=nA+2I+eEaXeqPtQDxkoCyLjAwG0MP0Ib7wSHsrWAUgb2+3z3MNuUPahmO8XTZOU1WgEf
	 HbsEJpx89ixIm9au2UaV8DVCqy4fp9y40OyNvPDXs1s8jHWjw9Gw6w/77ayMNNmV9evZq
	 wEUGGM3D3UpL23yr7w5f1udALh8iSVjrxK4hK1CN00QL1TFWu3hIS6Ez6dBQnkaNlIcX5
	 itJKsMA8CDhWe4WU5aEFb8PiKqUvlij9V3MNlNDpcOyogpMuIOdi2ZrhrB+2s0gQXTUAM
	 b8TaFmkjR/7EJJ/jDL87EWNLpLxQBzMg6KV1rD8Gn+ecrW3z1xx2W8/YB+L2cUHa7kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214833;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sQk3umOpv10DrnEpRLSYg0JUGXu/IQfMVXqwisTX700=;
	b=gXfQLwIwNYULy0bugplaTIft1s7YHL/l24BtwpVcec7ph3Dq2oI//A94dns4ILGXpFP9
	 OgvOqWAi2vIW+Lp89zq5mn4LV3SV8I9j46fLRsFyMZ+xKKQp1u99BTPyuQph8szNdxjp1
	 08AvYVn+jZcMmuN/57I14hkeQxLMGNhPpHsjVFpzL3K8x9PjspzerPBgrm+Kf5sjZbomg
	 yCXakbHHADieVZLvJ+Y8qvbaTpgaLfpes6DWhVMWSxLJfbtkN2NYsaMkFVoyCcpUhRiHM
	 u5k5xifU8FzePyx+d40Lf3/16xei9jcgbiFpEaxvVC4DOAO4qNAJ8rjqlxUneNQWSLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UEiAoM5q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBDE606A69F;
	Fri, 20 Nov 2026 22:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UEiAoM5q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795214833;
	b=k2Tw0ppKHH4J9WHZzRhwT3dhq7OXORgrJfGDjmY1Huc/TqZOJPbfGEJ5CwDBmhz8Ru3H
	 hZ2oPNm3Qxs7pj6BlOapWVlP1FSH4SAuScL8lnL7Md/ezMsayXMuffVQ9YJGFr/WxhRGJ
	 LKIKQrVYEk4WfqE94sFvCj8wZe44azpMsTJUeuCtvTQWpo/BPu8u7X/M8XxXQWMvHp4UD
	 bNQ6MglZ7wa4K1AXZVqdVYwqYb9TIyg9Qt8tKmzlIW5eTuFCewem0xynQzpuUzT1fkJlK
	 lKLOVAqv/TJcgVz3hFnUL52DB+66fm+G6spq+ovD//xuIbCpgyQS+iFHdce9FwzuPGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795214833;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sQk3umOpv10DrnEpRLSYg0JUGXu/IQfMVXqwisTX700=;
	b=v123Hb9VAbvYqIr4LWWBWIxfJDVswuRnYIIlrO3a6rFs8RtbbzGT0hAqmOnmnfwNUpfX
	 7Aa5I+FC893cUY+EZFeUCR3OqYPcKGOdPINJW0I1560DcRTGIAd2l8s12eETqUSalRJcn
	 C2rL8CM3QD70itgSkRXMdv7VaWMTTjubj8l1b77L0JmM6llwNh9T39IpH5iJl1Jf/Z/cC
	 +B3SBp8IXPaQFEiQWJpCjEqTTdEZuRMyBoWQtY1jc7iWIrv8s0Cj07T5oD9KJjdmitZXL
	 iIVmgShOaQS2IWfJxl2Ybhn0ad9bNUsYn1CFXkwb0+x97EIUTgxa3faGBlyufd3K5wA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19DF91F000D3;
	Fri, 20 Nov 2026 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795214833;
	bh=sQk3umOpv10DrnEpRLSYg0JUGXu/IQfMVXqwisTX700=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UEiAoM5qTvr0iSY81kibgejWRRbD5NDmt/h/zKIm4qyG6Zvs4q23/2LG+Devgk2U7
	 gqJTTX9C0GXREopWqIxzEnuy9xmSou1XG+GgGKJ5fweBTKX8ftROEtnS9d6sTh4gk/
	 QTigrQYB4LGd2RM6cac6dPiFdDQx2QF6GOVLZqdT8SrK2HKSxJgoBjKPwvDInLZIBE
	 Ij4Bk2dfbctuHXtoLGPcAVubZ0kbBu8aHYGJPNqtA5nQgzfg4dgzEiFcgSwatdCpL4
	 DSlhlKr1Jcivpa3vwr6BOhxaQQ8NvxI3agAgs9UBBbT5AlebE95d9afN168DyZNbCO
	 VXvC0huONC/UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 963494BA65;
	Fri, 20 Nov 2026 22:47:06 +0000 (UTC)
From: Kalash Nainwal via B4 Relay <devnull+kalash.nexthop.ai@kernel.org>
Date: Fri, 20 Nov 2026 15:47:06 -0700
Subject: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports
 test
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
Message-Id: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai>
References: <20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09@nexthop.ai>
In-Reply-To: <20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09@nexthop.ai>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kalash Nainwal <kalash@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7022; i=kalash@nexthop.ai;
 h=from:subject:message-id;
 bh=R6KTlYSmq1uGZkz3MBtbOKA3zSyYsCV0/QsHaQ3Fk+0=;
 b=owEB7QES/pANAwAKAdTKslu1X9B2AcsmYgBrAM3pAST6voGxbnPGaT8u6hs00fOprOQr0YwwL
 +FJ6jCnKTmJAbMEAAEKAB0WIQSWKdfHnHcAucb08LDUyrJbtV/QdgUCawDN6QAKCRDUyrJbtV/Q
 dkL5C/9mWc9H7+7qkzzUto3wpJID7vwg26Q5C2w1dQ5WEBU5Yfrbx8OGpDQioGQLTVnXwgO7EKr
 y++eqnjrQ2Pb5VUz+fDUCt9S1FQVddtugi1ACRYnn93JNmeuOLZeLY88HOH3k55iUIrZ/PsYdfU
 dPwgV6dTz0GYNu+iKGnxn9YpyedN6gtZ1YDrGXBR1m3Y+IYu5V116Tb6SDYN0NTKdzLDSvsm5As
 sGtp8oCoOHy0YBmxJp3O+AvGt2+2F6xP0M6xViR+YK1WfhdFgci6NXG2LBgDPx9xRldSH6amsmI
 7T8E2wWPkQFrKXD+6X48u8m/HWmbGSqycArLyLktP2zOhDj34bPG8tf61DMa2QnQfkfzEORMrRK
 dXbFy7VhJvswRDS/abArPXVioPXcLs6ELbA6Sc+huux+8kCbXPX4i27iL9w0mnzk7Ww5kwiOEiP
 doBhWvpIVpPG/FvWgEaaq2ICVQAC3mH/nClDK0yEhkr8ewcUvet2lM/jolNWhTA/sDdNo=
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
 .../selftests/net/tcp_l3mdev_exempt_ports.sh       | 213 +++++++++++++++++++++
 2 files changed, 214 insertions(+)

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
index 00000000000..f075abb9e8f
--- /dev/null
+++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
@@ -0,0 +1,213 @@
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
+#  ns_c (client in VRF)       ns_s (server)             ns_d (client in default VRF)
+#      veth0 ------------- veth_vrf [vrf red]
+#                             veth_def ----------------- veth0
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
+TESTS="
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
+setup()
+{
+	setup_ns ns_s ns_c ns_d || exit $ksft_skip
+
+	ip -n "$ns_s" link add "$VRF" type vrf table "$VRF_TABLE"
+	ip -n "$ns_s" link set "$VRF" up
+
+	ip -n "$ns_s" link add veth_vrf type veth peer name veth0 netns "$ns_c"
+	ip -n "$ns_s" link set veth_vrf master "$VRF"
+	ip -n "$ns_s" link set veth_vrf up
+	ip -n "$ns_s" addr add "$VRF_SRV4/24" dev veth_vrf
+	ip -n "$ns_s" addr add "$VRF_SRV6/64" dev veth_vrf nodad
+	ip -n "$ns_c" link set veth0 up
+	ip -n "$ns_c" addr add "$VRF_CLI4/24" dev veth0
+	ip -n "$ns_c" addr add "$VRF_CLI6/64" dev veth0 nodad
+
+	ip -n "$ns_s" link add veth_def type veth peer name veth0 netns "$ns_d"
+	ip -n "$ns_s" link set veth_def up
+	ip -n "$ns_s" addr add "$DEF_SRV4/24" dev veth_def
+	ip -n "$ns_s" addr add "$DEF_SRV6/64" dev veth_def nodad
+	ip -n "$ns_d" link set veth0 up
+	ip -n "$ns_d" addr add "$DEF_CLI4/24" dev veth0
+	ip -n "$ns_d" addr add "$DEF_CLI6/64" dev veth0 nodad
+
+	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_accept=1
+}
+
+ipver()
+{
+	[ "$1" = "-6" ] && echo 6 || echo 4
+}
+
+set_exempt()
+{
+	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_exempt_ports="$1"
+}
+
+# Start a server. nettest sets SO_REUSEPORT on its listeners, so an
+# unbound and a VRF-bound listener can share the port.
+# $1: "-6" or "", $2: "vrf" or "unbound"
+start_server()
+{
+	local dev_arg=""
+
+	[ "$2" = "vrf" ] && dev_arg="-I $VRF"
+	# shellcheck disable=SC2086
+	ip netns exec "$ns_s" ./nettest $1 -s $dev_arg -p "$PORT" -t 3 -q &
+}
+
+# $1: client netns, $2: "-6" or "", $3: server address
+connect()
+{
+	# shellcheck disable=SC2086
+	ip netns exec "$1" ./nettest $2 -r "$3" -p "$PORT" -t 2 -q
+}
+
+unbound_listener()
+{
+	local fam addr pid
+
+	for fam in "" "-6"; do
+		addr=$VRF_SRV4
+		[ "$fam" = "-6" ] && addr=$VRF_SRV6
+
+		RET=0
+		set_exempt "$OTHER_PORT"
+		start_server "$fam" unbound
+		pid=$!
+		wait_local_port_listen "$ns_s" "$PORT" tcp
+		connect "$ns_c" "$fam" "$addr"
+		check_err $? "VRF connection not accepted by unbound listener"
+		wait $pid
+		log_test "IPv$(ipver "$fam"): not exempt, VRF conn to unbound listener accepted"
+
+		RET=0
+		set_exempt "$PORT"
+		start_server "$fam" unbound
+		pid=$!
+		wait_local_port_listen "$ns_s" "$PORT" tcp
+		connect "$ns_c" "$fam" "$addr"
+		check_fail $? "VRF connection accepted by unbound listener"
+		wait $pid
+		log_test "IPv$(ipver "$fam"): exempt, VRF conn to unbound listener rejected"
+	done
+	set_exempt ""
+}
+
+# Both an unbound and a VRF-bound listener on the port. The VRF connection
+# must reach the VRF-bound one, whichever listener was created first.
+vrf_and_unbound_listeners()
+{
+	local fam addr order first second pid_first pid_second
+	local rc_first rc_second rc_vrf rc_unbound
+
+	set_exempt "$PORT"
+	for fam in "" "-6"; do
+		addr=$VRF_SRV4
+		[ "$fam" = "-6" ] && addr=$VRF_SRV6
+
+		for order in "unbound vrf" "vrf unbound"; do
+			read -r first second <<< "$order"
+			RET=0
+
+			start_server "$fam" "$first"
+			pid_first=$!
+			wait_local_port_listen "$ns_s" "$PORT" tcp
+			start_server "$fam" "$second"
+			pid_second=$!
+			sleep 0.2
+
+			connect "$ns_c" "$fam" "$addr"
+			check_err $? "VRF connection failed"
+
+			wait $pid_first
+			rc_first=$?
+			wait $pid_second
+			rc_second=$?
+			if [ "$first" = "vrf" ]; then
+				rc_vrf=$rc_first
+				rc_unbound=$rc_second
+			else
+				rc_vrf=$rc_second
+				rc_unbound=$rc_first
+			fi
+			check_err $rc_vrf "VRF-bound listener did not get the connection"
+			check_fail $rc_unbound "unbound listener got the connection"
+
+			log_test "IPv$(ipver "$fam"): exempt, $first first, VRF-bound listener wins"
+		done
+	done
+	set_exempt ""
+}
+
+default_vrf_unaffected()
+{
+	local fam addr pid
+
+	set_exempt "$PORT"
+	for fam in "" "-6"; do
+		addr=$DEF_SRV4
+		[ "$fam" = "-6" ] && addr=$DEF_SRV6
+
+		RET=0
+		start_server "$fam" unbound
+		pid=$!
+		wait_local_port_listen "$ns_s" "$PORT" tcp
+		connect "$ns_d" "$fam" "$addr"
+		check_err $? "default VRF connection not accepted"
+		wait $pid
+		check_err $? "unbound listener did not get the connection"
+		log_test "IPv$(ipver "$fam"): exempt, default VRF conn to unbound listener accepted"
+	done
+	set_exempt ""
+}
+
+trap cleanup EXIT
+
+if [ ! -x ./nettest ]; then
+	echo "SKIP: nettest not built"
+	exit "$ksft_skip"
+fi
+
+setup
+if ! ip netns exec "$ns_s" test -e /proc/sys/net/ipv4/tcp_l3mdev_exempt_ports; then
+	echo "SKIP: net.ipv4.tcp_l3mdev_exempt_ports not supported"
+	exit "$ksft_skip"
+fi
+
+tests_run
+
+exit "$EXIT_STATUS"

-- 
2.43.0


