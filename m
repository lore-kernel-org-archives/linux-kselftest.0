Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697707;
	b=Wyhd0vnYCrmEks/jpkqtcNDpjpLPLFLKYyuIuNpBYZqNDTIwXetOh4g8fu/Qm9i1OdoX
	 YJ2BdiVOhVqFxLG/mPqEGBsxfAqZrkf6nNTBdjHAS9J7mwCFwB7u38WFCFU4guLbsNpDF
	 qaQwohYqa3jxUBJb2XTBsuH/7bhxKCZsq0PJEotGc0rWFdxwfVc6C8hQTyDY7hNagiuN6
	 4GArns7hkgmr3DU96dAuMh3xT/QjfHPSmNhXXDrQl5xUL+0Ac7j+1MCV3FBimt368APZY
	 8TDVKo5RlqlZurGsas6prXXIp+LHmsC9CkseX27Ns83WVglXW9JR9Y7g/SHqDOR+YJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697707;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=+ecSSVU+Z7jC4/9UK3rjYlg7JVHEKjanA1NESCVvnbY=;
	b=B2p1zv5ykOAUP+mVPhsXDseEIl6HvBkFVTjbigdz3EMwmuqxIeXYzcrGcQHaJON0Yvgz
	 PyVvonXwZupKa35wuBv6XQ52eyKSaRwQgy4G9pVyHELMOU1uDxZlDswLzMkC3pnJQZUJv
	 AwaSUr1lvplQAwOO1RRU2x6l5UJc7axIsuEhIXCvRVt+Zg01uZTzkYHDb5hqHImOQvrLf
	 pldnPamEoo+vaaSDmhvoJ4kKQCF+QJUHf+8+C9W2FUjCkwTLpUD/0Ux87EsWqeeMhu9NH
	 csGS2N9VgvTL1vPXl+eXEzYax/ncZ3+x1hqVvXbJjwH5OW59tH7MUr5oXeHAol7jesw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UOT6gbEb;
	arc=none smtp.remote-ip=95.215.58.101
Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DC4606A33A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DC4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UOT6gbEb
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=u41R6CvdjgwQ5RmcVkl25GGYAs8un9CHwXt9ZAdHNvk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793697705; v=1; x=1794302505;
 b=UOT6gbEbq5FnO2xyDmDQ7e7IoyDo3iA64cbQmTuCCiB0mJEfYs3qoM9kK99jIn3sn7avRtTY
 4N45mwo6NDxRBNvty3HknXGQBNNz06SlnjCOJKDJfe9n7oaeh59HsVHqnkmbXVRH48QPp9c66zU
 UFqQMszlJl4cGdLU8xBO1jso=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b3b339ac542da68a;
	Tue, 03 Nov 2026 09:21:44 +0000
X-Mizu-Trace-ID: b3b339ac542da68a
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 03 Nov 2026 17:20:52 +0800
Subject: [PATCH net v2 3/3] selftests: net: add ioam6 ECMP test (RFC 9486
 C2)
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-ipv6_ioam_ecmp-v2-3-6ef0318bdb5e@kylinos.cn>
References: <20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e@kylinos.cn>
In-Reply-To: <20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e@kylinos.cn>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Add new test ioam6_ecmp.sh, verifying that the ECMP path taken with
IOAM options is identical to the path of the same packet without them
under the default hash policy 0, as required by RFC 9486 (C2).

  - transit input hashing: the sender inserts an IOAM Hop-by-Hop option
    (inline mode), the forwarder has a multipath route;
  - encapsulating node re-lookup: the forwarder itself encapsulates
    over a multipath route, with a plain ip6ip6 tunnel as the
    identical-packet-without-IOAM baseline.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 tools/testing/selftests/net/Makefile      |   1 +
 tools/testing/selftests/net/config        |   2 +
 tools/testing/selftests/net/ioam6_ecmp.sh | 348 ++++++++++++++++++++++++++++++
 3 files changed, 351 insertions(+)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 9180b9bec515..d15f118e70a2 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -52,6 +52,7 @@ TEST_PROGS := \
 	icmp_redirect.sh \
 	io_uring_zerocopy_tx.sh \
 	ioam6.sh \
+	ioam6_ecmp.sh \
 	ip6_gre_headroom.sh \
 	ip6_tunnel.sh \
 	ip_defrag.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index d4416f8bdcfd..e1de8c0410ef 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -38,6 +38,7 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_FOU=m
@@ -52,6 +53,7 @@ CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_RPL_LWTUNNEL=y
 CONFIG_IPV6_SEG6_LWTUNNEL=y
 CONFIG_IPV6_SIT=y
+CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_VTI=y
 CONFIG_IPVLAN=m
 CONFIG_IPVTAP=m
diff --git a/tools/testing/selftests/net/ioam6_ecmp.sh b/tools/testing/selftests/net/ioam6_ecmp.sh
new file mode 100755
index 000000000000..35a11f94c422
--- /dev/null
+++ b/tools/testing/selftests/net/ioam6_ecmp.sh
@@ -0,0 +1,348 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Verify RFC 9486 C2 for ECMP: with hash policy 0 (the default), the ECMP
+# nexthop chosen for a packet carrying IOAM options must be the same as for
+# the identical packet without them.
+#
+# Two scenarios, matching the two places where IOAM changed the hashed
+# IPv6 nexthdr:
+#
+# 1) transit node: alpha inserts an IOAM Hop-by-Hop option (inline mode);
+#    beta forwards with a multipath route. Policy 0 hashed the raw
+#    nexthdr (NEXTHDR_HOP vs IPPROTO_ICMPV6), so beta could pick a
+#    different ECMP sibling than for the same packet without IOAM.
+#
+# 2) encapsulating node: beta itself encapsulates over a multipath
+#    route. The ioam6 re-lookup hashed NEXTHDR_HOP instead of the
+#    transformed packet's real nexthdr (IPPROTO_IPV6). The baseline is
+#    the same encapsulation without the IOAM option: a plain ip6ip6
+#    tunnel (encaplimit none) over the same multipath route, with the
+#    same outer addresses.
+#
+# Hash policy 0 hashes addresses, the flow label and the nexthdr (not L4
+# ports), so whether both variants land on the same ECMP sibling depends
+# on the per-netns hash seed. Each test therefore repeats with several
+# seeds and fails on the first divergence: pre-fix kernels fail with
+# high probability, fixed kernels always pass.
+#
+# Topology:
+#
+#   alpha                   beta                      gamma
+#   veth0 2001:db8:1::2 <-> veth0 2001:db8:1::1
+#                           veth1 2001:db8:2:1::1 <-> veth0 2001:db8:2:1::2
+#                           veth2 2001:db8:2:2::1 <-> veth1 2001:db8:2:2::2
+#
+# beta's ECMP route: 2001:db8:2:1::2/128
+#   nexthop via 2001:db8:2:1::2 dev veth1
+#   nexthop via 2001:db8:2:2::2 dev veth2
+#
+# Scenario 1 sends to 2001:db8:2:1::2 (gamma). Scenario 2 sends to
+# 2001:db8:3::2, which beta encapsulates towards 2001:db8:2:1::2. The
+# link gamma received the packets on is detected from tc flower
+# counters (read via jq) on the ingress of gamma's veth0/veth1. The
+# filters match the exact measurement packets: ICMPv6 echo requests
+# for scenario 1, and the outer addresses of the ip6ip6 packets for
+# scenario 2 (flower classifies outer headers only).
+
+# shellcheck disable=SC2154,SC2329
+source lib.sh
+
+readonly PKTS=3
+readonly SEEDS="1 2 3 4 5 6 7 8 9 10 11 12"
+
+ip6tnl_loaded=0
+
+cleanup()
+{
+	cleanup_all_ns
+
+	if [ "$ip6tnl_loaded" != 0 ]; then
+		modprobe -r ip6_tunnel &>/dev/null || true
+	fi
+}
+
+# Replace the tc measurement filters on gamma's ECMP links. $1 is the
+# flower match list, e.g. "ip_proto icmpv6 type 128 src_ip <sender>"
+# for plain IPv6 echo requests, or the outer addresses for ip6ip6
+# packets (flower classifies the outer header only, see
+# FLOW_DISSECTOR_F_STOP_BEFORE_ENCAP in cls_flower).
+set_measure_filters()
+{
+	local match=$1
+	local dev
+
+	for dev in veth0 veth1; do
+		tc -n "$ns_gamma" qdisc del dev "$dev" clsact &>/dev/null
+		tc -n "$ns_gamma" qdisc add dev "$dev" clsact || return 1
+		# shellcheck disable=SC2086
+		tc -n "$ns_gamma" filter add dev "$dev" ingress pref 1 \
+			protocol ipv6 flower skip_hw $match action pass || return 1
+	done
+}
+
+# Number of packets counted by the measurement filter on gamma's $1.
+icmp_packets()
+{
+	tc -n "$ns_gamma" -s -j filter show dev "$1" ingress |
+		jq '[.[] | .options.actions[]?.stats |
+		    (.packets // .basic.packets // 0)] | add // 0'
+}
+
+# Send PKTS pings from alpha to $1 and report which of gamma's links
+# received them: "A" (veth0), "B" (veth1), "TIE" or "LOST:<a>:<b>".
+measure_link()
+{
+	local dst=$1
+	local a0 b0 da db
+
+	a0=$(icmp_packets veth0)
+	b0=$(icmp_packets veth1)
+
+	ip netns exec "$ns_alpha" \
+		ping -6 -q -c "$PKTS" -i 0.2 -W 1 "$dst" &>/dev/null || true
+
+	da=$(($(icmp_packets veth0) - a0))
+	db=$(($(icmp_packets veth1) - b0))
+
+	if [ $((da + db)) -lt "$PKTS" ]; then
+		echo "LOST:$da:$db"
+		return
+	fi
+
+	if [ "$da" -gt "$db" ]; then
+		echo "A"
+	elif [ "$db" -gt "$da" ]; then
+		echo "B"
+	else
+		echo "TIE"
+	fi
+}
+
+set_alpha_plain()
+{
+	ip -netns "$ns_alpha" -6 route replace 2001:db8:2:1::/64 \
+		via 2001:db8:1::1 dev veth0
+}
+
+set_alpha_ioam()
+{
+	ip -netns "$ns_alpha" -6 route replace 2001:db8:2:1::/64 \
+		encap ioam6 mode inline trace prealloc \
+		type 0x800000 ns 0 size 12 \
+		via 2001:db8:1::1 dev veth0
+}
+
+set_beta_tnl()
+{
+	# Recreate the tunnel: ip6_tnl caches the outer dst per CPU,
+	# and neither the route change below nor the fib_multipath_hash_seed
+	# write resets it. A stale cache would resolve the outer sibling
+	# under a previous seed (or on another CPU), making the baseline
+	# flip between attempts of one seed.
+	ip -netns "$ns_beta" link del ip6tun0 &>/dev/null
+	ip -netns "$ns_beta" link add name ip6tun0 type ip6tnl \
+		mode ip6ip6 encaplimit none \
+		local 2001:db8:2:1::1 remote 2001:db8:2:1::2
+	ip -netns "$ns_beta" link set ip6tun0 up
+	ip -netns "$ns_beta" -6 route replace 2001:db8:3::2/128 dev ip6tun0
+}
+
+set_beta_ioam_encap()
+{
+	ip -netns "$ns_beta" -6 route replace 2001:db8:3::2/128 \
+		encap ioam6 mode encap tundst 2001:db8:2:1::2 \
+		trace prealloc type 0x800000 ns 0 size 12 dev veth1
+}
+
+# $1: description; $2: function installing the without-IOAM variant;
+# $3: function installing the with-IOAM variant; $4: destination.
+run_scenario()
+{
+	local desc=$1
+	local plain=$2
+	local ioam=$3
+	local dst=$4
+	local seed pl il
+
+	log_info "$desc"
+
+	for seed in $SEEDS; do
+		RET=0
+		ip netns exec "$ns_beta" \
+			sysctl -wq net.ipv4.fib_multipath_hash_seed="$seed"
+
+		if ! $plain; then
+			RET=$ksft_fail
+			log_test "$desc (plain route setup failed, seed $seed)"
+			continue
+		fi
+		pl=$(measure_link "$dst")
+		if ! $ioam; then
+			RET=$ksft_fail
+			log_test "$desc (ioam route setup failed, seed $seed)"
+			continue
+		fi
+		il=$(measure_link "$dst")
+
+		case "$pl$il" in
+		*LOST*)
+			RET=$ksft_fail
+			log_test "$desc (lost packets, seed $seed: without=$pl with=$il)"
+			continue
+			;;
+		*TIE*)
+			RET=$ksft_fail
+			log_test "$desc (no clear link, seed $seed)"
+			continue
+			;;
+		esac
+
+		if [ "$pl" = "$il" ]; then
+			log_test "$desc (seed $seed: same link $pl)"
+		else
+			RET=$ksft_fail
+			log_test "$desc (diverged on seed $seed: without IOAM via link $pl, with IOAM via link $il)"
+		fi
+	done
+}
+
+setup_topology()
+{
+	local dev
+
+	setup_ns ns_alpha ns_beta ns_gamma || return 1
+
+	ip link add veth0 netns "$ns_alpha" type veth \
+		peer name veth0 netns "$ns_beta" || return 1
+	ip link add veth1 netns "$ns_beta" type veth \
+		peer name veth0 netns "$ns_gamma" || return 1
+	ip link add veth2 netns "$ns_beta" type veth \
+		peer name veth1 netns "$ns_gamma" || return 1
+
+	ip -n "$ns_alpha" addr add 2001:db8:1::2/64 dev veth0 nodad
+	ip -n "$ns_beta" addr add 2001:db8:1::1/64 dev veth0 nodad
+	ip -n "$ns_beta" addr add 2001:db8:2:1::1/64 dev veth1 nodad
+	ip -n "$ns_beta" addr add 2001:db8:2:2::1/64 dev veth2 nodad
+	ip -n "$ns_gamma" addr add 2001:db8:2:1::2/64 dev veth0 nodad
+	ip -n "$ns_gamma" addr add 2001:db8:2:2::2/64 dev veth1 nodad
+
+	ip -n "$ns_alpha" link set veth0 up
+	ip -n "$ns_beta" link set veth0 up
+	ip -n "$ns_beta" link set veth1 up
+	ip -n "$ns_beta" link set veth2 up
+	ip -n "$ns_gamma" link set veth0 up
+	ip -n "$ns_gamma" link set veth1 up
+
+	ip netns exec "$ns_alpha" sysctl -wq net.ipv6.auto_flowlabels=0
+	ip netns exec "$ns_alpha" \
+		sysctl -wq net.ipv6.conf.veth0.accept_ra=0
+	ip netns exec "$ns_beta" sysctl -wq net.ipv6.conf.all.forwarding=1
+	ip netns exec "$ns_beta" \
+		sysctl -wq net.ipv6.fib_multipath_hash_policy=0
+	ip netns exec "$ns_gamma" sysctl -wq net.ipv6.conf.veth0.accept_ra=0
+	ip netns exec "$ns_gamma" sysctl -wq net.ipv6.conf.veth1.accept_ra=0
+
+	for dev in veth0 veth1 veth2
+	do
+		ip netns exec "$ns_beta" \
+			sysctl -wq net.ipv6.conf.$dev.accept_ra=0
+		ip netns exec "$ns_beta" \
+			sysctl -wq net.ipv6.conf.$dev.ioam6_enabled=1
+	done
+
+	# The ECMP route under test (scenario 1 hashes its selection at
+	# beta's input; scenario 2 at the encapsulating re-lookup).
+	ip -netns "$ns_beta" -6 route add 2001:db8:2:1::2/128 \
+		nexthop via 2001:db8:2:1::2 dev veth1 \
+		nexthop via 2001:db8:2:2::2 dev veth2 || return 1
+
+	ip -netns "$ns_alpha" -6 route add 2001:db8:2:1::/64 \
+		via 2001:db8:1::1 dev veth0
+	ip -netns "$ns_alpha" -6 route add 2001:db8:3::/64 \
+		via 2001:db8:1::1 dev veth0
+	ip -netns "$ns_gamma" -6 route add 2001:db8:1::/64 \
+		via 2001:db8:2:1::1 dev veth0
+
+	# drop unreachable message when ping 2001:db8:3::2
+	tc -n "$ns_alpha" qdisc add dev veth0 clsact
+	tc -n "$ns_alpha" filter add dev veth0 ingress pref 1 \
+                protocol ipv6 flower skip_hw ip_proto icmpv6 type 1 action drop
+
+}
+
+check_tunnel()
+{
+	if ! lsmod 2>/dev/null | grep -q "ip6_tunnel" && \
+		! ip a 2>/dev/null | grep -q "ip6tnl0"; then
+		modprobe ip6_tunnel &>/dev/null
+		lsmod 2>/dev/null | grep -q "ip6_tunnel" || \
+			ip a 2>/dev/null | grep -q "ip6tnl0" || return 1
+		ip6tnl_loaded=1
+	fi
+
+	ip -netns "$ns_beta" link add name ip6tun0 type ip6tnl \
+		mode ip6ip6 encaplimit none \
+		local 2001:db8:2:1::1 remote 2001:db8:2:1::2 \
+		2>/dev/null || return 1
+	set_beta_ioam_encap || return 1
+}
+
+################################################################################
+#                                                                              #
+#                                     MAIN                                     #
+#                                                                              #
+################################################################################
+
+require_command ip
+require_command jq
+require_command ping
+require_command tc
+
+if [ ! -e /proc/sys/net/ipv4/fib_multipath_hash_seed ]; then
+	log_test_skip "Kernel without CONFIG_IP_ROUTE_MULTIPATH."
+	exit "${EXIT_STATUS}"
+fi
+
+trap cleanup EXIT
+setup_topology || { log_test_skip "Setup failed."; exit "${EXIT_STATUS}"; }
+
+# Compat check: can this kernel insert an IOAM trace into a route?
+if ! ip -netns "$ns_alpha" -6 route replace 2001:db8:2:1::/64 \
+	encap ioam6 mode inline trace prealloc type 0x800000 ns 0 size 12 \
+	via 2001:db8:1::1 dev veth0 &>/dev/null
+then
+	log_test_skip "Cannot attach an IOAM trace to a route"
+	exit "${EXIT_STATUS}"
+fi
+
+log_info "IOAM + ECMP (RFC 9486 C2, hash policy 0)"
+
+# Warm up ECMP links for neighbor/RA activity.
+set_alpha_plain
+ip netns exec "$ns_alpha" ping -6 -q -c "$PKTS" -i 0.2 2001:db8:2:1::2 &>/dev/null
+
+# Scenario 1 counts the ICMPv6 echo requests sent by alpha.
+if ! set_measure_filters "ip_proto icmpv6 type 128 src_ip 2001:db8:1::2"; then
+	log_test_skip "Cannot install tc flower measurement filters"
+	exit "${EXIT_STATUS}"
+fi
+run_scenario \
+	"Transit input ECMP with/without IOAM" \
+	set_alpha_plain set_alpha_ioam 2001:db8:2:1::2
+
+if check_tunnel; then
+	# Scenario 2 counts the outer ip6ip6 packets: the echo request is
+	# not visible to flower (outer headers only), so match the pinned
+	# tunnel addresses instead. No need to check return value again as
+	# we have done it at scenario 1
+	set_measure_filters "src_ip 2001:db8:2:1::1 dst_ip 2001:db8:2:1::2"
+
+	run_scenario \
+		"Encapsulating node re-lookup ECMP with/without IOAM" \
+		set_beta_tnl set_beta_ioam_encap 2001:db8:3::2
+else
+	log_test_skip "Encapsulating node re-lookup ECMP with/without IOAM (no ip6_tunnel)"
+fi
+
+exit "${EXIT_STATUS}"

-- 
2.56.0

