Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833990;
	b=sNu/5oLmbBCNixL87MMEdR8Y9ZskjbKWXJNGces31SpXBfV/3DRuIPBoZVCQK/jYULTf
	 lET4vhR3QaiwghxBiUjoexayeY0Q47Mrw95fb1Hh5i6btxqjcRySjKKKUH96NnzHdnJ2V
	 4PcEJmfvkLMEOjJXJAdvy8hT9I5xWsjn8jBlB6U6nWgIzic2dlGHm6+zqEYzbcfEriEMn
	 KCrH+guqas2CWrZDRZynsfKxsb0VcavzcszLwqreJkLRicOl/Al10udShLqphL/0VLjIt
	 xWavpe3AEyYTrXfSNx+yrwnz0t1DvsM90W/toQc0KoavvCyFiAhsXHjevNG9Kr/PUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833990;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=wubUMW0jJyYmyI7ZV0p6Qrd5w4mPGgJX3sk31gd3sHY=;
	b=Q0oNYgSYgh9u80iFGSQG3uIRMH8IP5CjQCBIFio0RXrmHTIJzZilTVG1eikSkZDqqXQt
	 u0k25uOTGFpFyGCxLrWuSd0T1wsSh71k6IzQqMRak7OuxT42MHlfvEZ+pcy4qKNp9mheE
	 +8rkErOr+s5/flVY4q6El0Le5TcoYUtUKPud7EuvbJnYfDMBWjdZAxufynOTok4wo6RVp
	 2LLbAeJel2K384Zg0bwSnslFSZZUVUgkilCVnkLezoZkixLVLBjqhzki6VPRnOAupActu
	 O78fOkYCBj8/YmSrFxFcvi5VxR9UOHtQV003AxTp7LdCA+d4r96ALp7ItBonxy2V7+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=dBCnsxrs;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1B60A5BC2;
	Sat, 24 Oct 2026 09:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A1B60A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=dBCnsxrs
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jBZJT3Lfqz9tWQ;
	Sat, 24 Oct 2026 11:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1792833977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wubUMW0jJyYmyI7ZV0p6Qrd5w4mPGgJX3sk31gd3sHY=;
	b=dBCnsxrs1VfbRoRY+ev5LWBsWH1vhFXV6rcUAQPWjR8mAdbBmVhxJbYvPUbrTOIi9bpYUD
	iFMNL04w6XX8jlJiYjw4VWzG9agybJNqlDmYX02yw8PLYH3m0fOHVnSovpWxpyMAeYhTr8
	F7XGQKd1/znj0edNa6VpIRkrg8hWxvlaEO02W7/aXe2yPahG4acYmdzWfVmZ608eHTBsBV
	BdgNIWawwikKp3EtoHIrTrBFEe9BVqHiStXE3sC63zFy5mc1KF/co6VgduiqTqJcI2nNSd
	DCSLgcp0VyRNpFu/rfzxAQTQqxOVNB9dy/bWRsq0sZbh2oAuHj9wd7oEtYqx+A==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>,
	Antonio Quartulli <antonio@mandelbit.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next v2 17/18] selftests: net: add ipxlat coverage
Date: Sat, 24 Oct 2026 11:25:27 +0200
Message-ID: <20261024092532.172005-18-ralf@mandelbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024092532.172005-1-ralf@mandelbit.com>
References: <20261024092532.172005-1-ralf@mandelbit.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jBZJT3Lfqz9tWQ

Exercise forwarded and local translation, native fallback, target-family
conntrack and NAT, checksumless UDP, route-PMTU fragmentation, conntrack
reassembly followed by refragmentation, PMTU feedback and ICMP errors.

Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
Changes since RFC v1 https://lore.kernel.org/netdev/20260319151230.655687-15-ralf@mandelbit.com/
- Replace the v1 netdevice/YNL suite with an iproute2/LWT namespace
  topology.
- Add coverage for local and forwarded LWT translation, native fallback,
  translated-family conntrack and masquerade, route-PMTU fragmentation,
  reassembly/refragmentation, and PMTU feedback.
- Verify zero-checksum UDPv4 at a real translated-family receiver
  instead of treating a packet capture as proof of successful delivery.
  (Sashiko)
- Keep forwarding, sysctls, routes, and translator state inside
  disposable network namespaces so a failed test cannot leave host
  networking changed. (Sashiko)
- Remove the dedicated UDP generator and produce the required packet
  shapes with existing selftest tools, avoiding the v1 helper's
  undeclared padding bytes. Remove the old fragmented-ICMP capture
  filter whose fixed offset could miss ICMP after an IPv6 Fragment
  Header. (Sashiko)

 tools/testing/selftests/Makefile             |   1 +
 tools/testing/selftests/net/ipxlat/Makefile  |   5 +
 tools/testing/selftests/net/ipxlat/config    |  13 +
 tools/testing/selftests/net/ipxlat/ipxlat.sh | 554 +++++++++++++++++++
 4 files changed, 573 insertions(+)
 create mode 100644 tools/testing/selftests/net/ipxlat/Makefile
 create mode 100644 tools/testing/selftests/net/ipxlat/config
 create mode 100755 tools/testing/selftests/net/ipxlat/ipxlat.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 1198e570898d..339a74d509b8 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -90,6 +90,7 @@ TARGETS += net/af_unix
 TARGETS += net/can
 TARGETS += net/forwarding
 TARGETS += net/hsr
+TARGETS += net/ipxlat
 TARGETS += net/mptcp
 TARGETS += net/netfilter
 TARGETS += net/openvswitch
diff --git a/tools/testing/selftests/net/ipxlat/Makefile b/tools/testing/selftests/net/ipxlat/Makefile
new file mode 100644
index 000000000000..d54a89a84337
--- /dev/null
+++ b/tools/testing/selftests/net/ipxlat/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_PROGS := ipxlat.sh
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/net/ipxlat/config b/tools/testing/selftests/net/ipxlat/config
new file mode 100644
index 000000000000..ced834911830
--- /dev/null
+++ b/tools/testing/selftests/net/ipxlat/config
@@ -0,0 +1,13 @@
+CONFIG_INET=y
+CONFIG_IPV6=y
+CONFIG_LWTUNNEL=y
+CONFIG_NET_IPXLAT=m
+CONFIG_NET_IPXLAT_LWT=m
+CONFIG_NET_NS=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_NAT=m
+CONFIG_NF_TABLES=m
+CONFIG_NF_TABLES_IPV4=y
+CONFIG_NF_TABLES_IPV6=y
+CONFIG_NFT_NAT=m
+CONFIG_VETH=m
diff --git a/tools/testing/selftests/net/ipxlat/ipxlat.sh b/tools/testing/selftests/net/ipxlat/ipxlat.sh
new file mode 100755
index 000000000000..955a50ac8231
--- /dev/null
+++ b/tools/testing/selftests/net/ipxlat/ipxlat.sh
@@ -0,0 +1,554 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# IPXLAT lightweight-tunnel selftests
+#
+# Copyright (C) 2026- Mandelbit SRL
+# Copyright (C) 2026- Daniel Gröber <dxld@darkboxed.org>
+#
+# Author: Antonio Quartulli <antonio@mandelbit.com>
+#         Daniel Gröber <dxld@darkboxed.org>
+#         Ralf Lici <ralf@mandelbit.com>
+#
+#   ipxlat_ns4 (IPv4 host) --- ipxlat_nsx --- ipxlat_ns6 (IPv6 host)
+
+set -o pipefail
+
+TEST_DIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+readonly TEST_DIR
+source "$TEST_DIR/../lib.sh"
+
+# All addresses come from documentation ranges. The EAM replaces
+# 198.51.100.0/24 with 2001:db8:200::/120 and preserves only the final host
+# byte. V4_XLAT therefore becomes V6_EAM_XLAT, while V4_NEAR becomes
+# V6_EAM_NEAR. EAM takes precedence in both directions.
+#
+# Addresses outside the EAM use the RFC 6052 fallback. With a /96 prefix it
+# appends the complete 32-bit IPv4 address, so V4_REMOTE and V4_PMTU become
+# V6_REMOTE and V6_PMTU. V6_NATIVE is deliberately outside both mappings and
+# exists only to exercise native output when ipxlat declines a packet.
+#
+# nsx also needs an IPv6 gateway address. We deliberately choose V6_XLAT as
+# the RFC 6052 form of V4_XLAT so that, if the kernel uses it as the source of
+# an ICMPv6 error, translation produces the meaningful V4_XLAT source instead
+# of the 192.0.0.8 dummy fallback. V6_XLAT is not the normal 4-to-6 result for
+# V4_XLAT: EAM still produces V6_EAM_XLAT. Both IPv6 addresses map back to
+# V4_XLAT, each through its respective algorithm.
+
+readonly V4_NEAR_PREFIX=198.51.100.0/24
+readonly V4_XLAT=198.51.100.1
+readonly V4_NEAR=198.51.100.2
+readonly V4_REMOTE_PREFIX=192.0.2.0/24
+readonly V4_REMOTE=192.0.2.33
+readonly V4_PMTU=192.0.2.34
+
+readonly V6_RFC6052_PREFIX=2001:db8:100::/96
+readonly V6_XLAT=2001:db8:100::c633:6401
+readonly V6_REMOTE=2001:db8:100::c000:221
+readonly V6_PMTU=2001:db8:100::c000:222
+readonly V6_NATIVE=2001:db8:100:0:1::1
+readonly V6_EAM_PREFIX=2001:db8:200::/120
+readonly V6_EAM_XLAT=2001:db8:200::1
+readonly V6_EAM_NEAR=2001:db8:200::2
+
+readonly IPERF_PORT=5201
+readonly UDP_PORT=5202
+
+BG_PIDS=()
+TMP_FILES=()
+
+# setup_ns assigns these variables indirectly
+ipxlat_ns4=
+ipxlat_nsx=
+ipxlat_ns6=
+
+cleanup()
+{
+	local file pid
+
+	for pid in "${BG_PIDS[@]}"; do
+		kill "$pid" 2>/dev/null || true
+		wait "$pid" 2>/dev/null || true
+	done
+	for file in "${TMP_FILES[@]}"; do
+		rm -f "$file"
+	done
+	cleanup_all_ns
+}
+
+counter_nonzero()
+{
+	local packets
+	local ns=$1
+	local family=$2
+	local table=$3
+	local counter=$4
+
+	packets=$(ip netns exec "$ns" nft list counter \
+		  "$family" "$table" "$counter" |
+		  awk '/packets/ { print $2; exit }') || return 1
+	((packets > 0))
+}
+
+tcp_listener_ready()
+{
+	[[ -n $(ip netns exec "$ipxlat_ns4" ss -Hln \
+		 "sport = :$IPERF_PORT" 2>/dev/null) ]]
+}
+
+udp_listener_ready()
+{
+	[[ -n $(ip netns exec "$ipxlat_ns6" ss -Hlun \
+		 "sport = :$UDP_PORT" 2>/dev/null) ]]
+}
+
+file_has_size()
+{
+	local file=$1
+	local expected=$2
+
+	[[ -f $file ]] && [[ $(stat -c %s "$file") -eq $expected ]]
+}
+
+pmtu_is_1260()
+{
+	ip -n "$ipxlat_ns4" route get "$V4_PMTU" |
+		grep -Eq 'mtu[[:space:]]+1260'
+}
+
+setup_topology()
+{
+	# The IPv4-only host reaches the IPv6-only host through the translator.
+	# EAM gives IPv6 identities to the IPv4 endpoints, while RFC 6052 gives
+	# IPv4 identities to the IPv6 endpoints. The test-only V6_NATIVE
+	# address is omitted from the operational topology below.
+	#
+	# Topology:
+	# +------------------------------------------------------------------+
+	# |                            IPXLAT_NS4                            |
+	# |                                                                  |
+	# |                          +------------+                          |
+	# |                       v4 | V4_NEAR/24 |                          |
+	# +------------------------------------------------------------------+
+	#                                  |
+	#                                  |
+	# +------------------------------------------------------------------+
+	# |                       x4 | V4_XLAT/24 |                          |
+	# |                          +------------+                          |
+	# |                                                                  |
+	# |                            IPXLAT_NSX                            |
+	# |                                                                  |
+	# |                       +-----------------+                        |
+	# |                       | V6_XLAT/64      |                        |
+	# |                    x6 | V6_EAM_XLAT/128 |                        |
+	# +------------------------------------------------------------------+
+	#                                  |
+	#                                  |
+	# +------------------------------------------------------------------+
+	# |                    v6 | V6_REMOTE/64    |                        |
+	# |                       | V6_PMTU/128     |                        |
+	# |                       | V6_NATIVE/128   |                        |
+	# |                       +-----------------+                        |
+	# |                                                                  |
+	# |                            IPXLAT_NS6                            |
+	# +------------------------------------------------------------------+
+
+	ip link add v4 type veth peer name x4
+	ip link set v4 netns "$ipxlat_ns4"
+	ip link set x4 netns "$ipxlat_nsx"
+	ip link add v6 type veth peer name x6
+	ip link set v6 netns "$ipxlat_ns6"
+	ip link set x6 netns "$ipxlat_nsx"
+
+	ip -n "$ipxlat_ns4" addr add "$V4_NEAR/24" dev v4
+	ip -n "$ipxlat_nsx" addr add "$V4_XLAT/24" dev x4
+
+	# These are selftest controls, not ipxlat requirements: nodad avoids
+	# asynchronous address setup, while noprefixroute keeps the EAM address
+	# from creating a main-table route that would bypass the tested route.
+	ip -n "$ipxlat_nsx" -6 addr add "$V6_XLAT/64" dev x6 nodad
+	ip -n "$ipxlat_nsx" -6 addr add "$V6_EAM_XLAT/128" dev x6 nodad \
+		noprefixroute
+	ip -n "$ipxlat_ns6" -6 addr add "$V6_REMOTE/64" dev v6 nodad
+	ip -n "$ipxlat_ns6" -6 addr add "$V6_PMTU/128" dev v6 nodad
+	# avoid waiting for DAD on the isolated fallback-test address
+	ip -n "$ipxlat_ns6" -6 addr add "$V6_NATIVE/128" dev v6 nodad
+
+	ip -n "$ipxlat_ns4" link set v4 up
+	ip -n "$ipxlat_nsx" link set x4 up
+	ip -n "$ipxlat_nsx" link set x6 up
+	ip -n "$ipxlat_ns6" link set v6 up
+
+	ip netns exec "$ipxlat_nsx" sysctl -qw net.ipv4.ip_forward=1
+	ip netns exec "$ipxlat_nsx" sysctl -qw net.ipv6.conf.all.forwarding=1
+
+	ip -n "$ipxlat_ns4" route add default via "$V4_XLAT"
+	# explicitly use the ordinary endpoint for non-PMTU traffic since ns6
+	# has two addresses
+	ip -n "$ipxlat_ns6" -6 route add "$V6_EAM_PREFIX" via "$V6_XLAT" \
+		src "$V6_REMOTE"
+
+	# constrain only the PMTU endpoint while all other traffic uses the
+	# normal 1500-byte veth MTU
+	ip -n "$ipxlat_nsx" -6 route add "$V6_PMTU/128" dev x6 mtu 1280
+
+	ip -n "$ipxlat_nsx" route add "$V4_REMOTE_PREFIX" \
+		encap ipxlat rfc6052-prefix6 "$V6_RFC6052_PREFIX" \
+		eam "$V4_NEAR_PREFIX" "$V6_EAM_PREFIX" dev x6
+
+	ip -n "$ipxlat_nsx" -6 route add "$V6_EAM_PREFIX" \
+		encap ipxlat rfc6052-prefix6 "$V6_RFC6052_PREFIX" \
+		eam "$V4_NEAR_PREFIX" "$V6_EAM_PREFIX" dev x4
+	# address assignment creates a metric-zero kernel local route so remove
+	# it before adding the LWT
+	ip -n "$ipxlat_nsx" -6 route del local "$V6_EAM_XLAT/128" table local
+	ip -n "$ipxlat_nsx" -6 route add local "$V6_EAM_XLAT/128" table local \
+		encap ipxlat rfc6052-prefix6 "$V6_RFC6052_PREFIX" \
+		eam "$V4_NEAR_PREFIX" "$V6_EAM_PREFIX" dev x6
+}
+
+warm_up_neighbors()
+{
+	# keep first-packet ARP/NDP delays out of the translation assertions
+	ip netns exec "$ipxlat_nsx" ping -c 1 -W 2 "$V4_NEAR" \
+		>/dev/null 2>&1
+	ip netns exec "$ipxlat_nsx" ping -6 -c 1 -W 2 "$V6_REMOTE" \
+		>/dev/null 2>&1
+}
+
+setup_refragment_nft()
+{
+	# Enable conntrack only for IPv6 here. If IPv4 conntrack were already
+	# active, it would reassemble the source frags before ipxlat saw them.
+	ip netns exec "$ipxlat_nsx" nft -f - <<EOF
+add table ip6 ipxlat_refragment
+add counter ip6 ipxlat_refragment tracked_udp
+add chain ip6 ipxlat_refragment postrouting { type filter hook postrouting \
+priority filter; policy accept; }
+add rule ip6 ipxlat_refragment postrouting ip6 saddr $V6_EAM_NEAR \
+ip6 daddr $V6_PMTU udp dport $UDP_PORT ct state { new, established } \
+counter name tracked_udp
+EOF
+}
+
+setup_nft()
+{
+	# count the translated IPv4 errors returned to the IPv4 host
+	ip netns exec "$ipxlat_ns4" nft -f - <<EOF
+add table ip ipxlat_test
+add counter ip ipxlat_test frag_needed
+add counter ip ipxlat_test port_unreachable
+add chain ip ipxlat_test input { type filter hook input priority filter; policy accept; }
+add rule ip ipxlat_test input icmp type destination-unreachable icmp code frag-needed counter name frag_needed
+add rule ip ipxlat_test input icmp type destination-unreachable icmp code port-unreachable counter name port_unreachable
+EOF
+
+	# count the translated IPv6 error returned to the IPv6 host
+	ip netns exec "$ipxlat_ns6" nft -f - <<EOF
+add table ip6 ipxlat_test
+add counter ip6 ipxlat_test port_unreachable
+add chain ip6 ipxlat_test input { type filter hook input priority filter; policy accept; }
+add rule ip6 ipxlat_test input icmpv6 type destination-unreachable icmpv6 code port-unreachable counter name port_unreachable
+EOF
+
+	# count locally translated packets that reach IPv6 LOCAL_OUT
+	ip netns exec "$ipxlat_nsx" nft -f - <<EOF
+add table ip6 ipxlat_output
+add counter ip6 ipxlat_output translated_echo
+add chain ip6 ipxlat_output output { type filter hook output priority filter; policy accept; }
+add rule ip6 ipxlat_output output ip6 saddr $V6_EAM_XLAT ip6 daddr $V6_REMOTE icmpv6 type echo-request counter name translated_echo
+EOF
+}
+
+setup_nat64_nft()
+{
+	# MASQUERADE proves that translated IPv4 traffic reaches conntrack and
+	# POSTROUTING. Install it after the refragmentation test because enabling
+	# IPv4 conntrack earlier would reassemble its source fragments.
+	ip netns exec "$ipxlat_nsx" nft -f - <<EOF
+add table ip ipxlat_nat
+add counter ip ipxlat_nat translated_tcp
+add chain ip ipxlat_nat postrouting { type nat hook postrouting priority srcnat; policy accept; }
+add rule ip ipxlat_nat postrouting ip saddr $V4_REMOTE ip daddr $V4_NEAR tcp dport $IPERF_PORT counter name translated_tcp masquerade
+EOF
+}
+
+# translate a forwarded IPv4 echo request to IPv6 and its reply back to IPv4
+test_forwarded_echo()
+{
+	RET=0
+	ip netns exec "$ipxlat_ns4" ping -c 1 -W 2 "$V4_REMOTE" \
+		>/dev/null 2>&1
+	check_err $? "IPv4 echo did not cross the translator"
+	log_test "forwarded ICMP translation"
+}
+
+# require locally generated IPv4 traffic to pass through IPv6 LOCAL_OUT
+test_local_output()
+{
+	RET=0
+	ip netns exec "$ipxlat_nsx" ping -I "$V4_XLAT" -c 1 -W 2 \
+		"$V4_REMOTE" >/dev/null 2>&1
+	check_err $? "locally originated IPv4 echo failed"
+	slowwait 2 counter_nonzero "$ipxlat_nsx" ip6 ipxlat_output \
+		translated_echo
+	check_err $? "translated packet did not traverse IPv6 LOCAL_OUT"
+	log_test "locally originated CLAT traffic"
+}
+
+# return valid packets unsupported by SIIT to the original route
+test_native_fallback()
+{
+	RET=0
+
+	# Test native input fallback
+
+	# remove the cached ethernet address for V6_REMOTE from nsx so that the
+	# next packet must perform IPv6 neighbor discovery
+	ip -n "$ipxlat_nsx" -6 neigh flush to "$V6_REMOTE" dev x6 \
+		>/dev/null 2>&1
+
+	# The sequence here is:
+	# 1. nsx sends a neighbor solicitation;
+	# 2. ns6 replies with a neighbor advertisement;
+	# 3. because the solicitation used V6_EAM_XLAT as its source, the
+	#    advertisement is addressed to V6_EAM_XLAT (the local route for
+	#    V6_XLAT is an ordinary IPv6 route, it does not carry ipxlat);
+	# 4. the local route for V6_EAM_XLAT carries the ipxlat input LWT, so
+	#    the advertisement enters ipxlat_lwt_input;
+	# 5. both NA endpoints are translatable, but the ICMPv6 type is not so
+	#    the input cb restores the original metadata and calls orig_input;
+	# 6. normal IPv6 neighbor discovery then consumes the unchanged
+	#    advertisement and updates the neighbor table;
+	# 7. the ping itself is allowed to fail because its echo reply is
+	#    addressed to V6_EAM_XLAT and, unlike the NA, an echo reply is
+	#    translatable, so the input LWT translates it to IPv4 instead of
+	#    delivering it to the IPv6 ping socket.
+	ip netns exec "$ipxlat_nsx" ping -6 -I "$V6_EAM_XLAT" \
+		-c 1 -W 1 "$V6_REMOTE" >/dev/null 2>&1 || true
+
+	# if the neighbor entry exists in one of these usable states, the NA
+	# must have passed through native IPv6 input (not swallowed by ipxlat)
+	ip -n "$ipxlat_nsx" -6 neigh show "$V6_REMOTE" dev x6 |
+		grep -Eq '\b(REACHABLE|STALE|DELAY|PROBE)\b'
+	check_err $? "Neighbor Advertisement was intercepted by the local LWT"
+
+	# Test native output fallback
+
+	# V6_XLAT was already reachable through the connected /64, but this
+	# /128 route takes precedence and forces locally generated traffic for
+	# that address through ipxlat_lwt_output
+	ip -n "$ipxlat_ns6" -6 route add "$V6_XLAT/128" \
+		encap ipxlat rfc6052-prefix6 "$V6_RFC6052_PREFIX" \
+		eam "$V4_NEAR_PREFIX" "$V6_EAM_PREFIX" dev v6
+	check_err $? "could not install native-output fallback route"
+
+	# The source is outside both mappings, so native output must send the
+	# unchanged packet across the existing IPv6 link.
+	#
+	# The sequence is:
+	# 1. ipxlat_prepare validates the IPv6 packet returns -EOPNOTSUPP
+	#    because it cannot convert V6_NATIVE;
+	# 2. the output callback restores the skb metadata and calls the
+	#    route's saved orig_output callback;
+	# 3. native IPv6 sends the echo request over the existing veth link.
+	#
+	# nsx owns V6_XLAT, whose normal local route does not carry ipxlat, so
+	# it answers normally. The reply returns to the ordinary local route
+	# for V6_NATIVE, and the ping succeeds.
+	ip netns exec "$ipxlat_ns6" ping -6 -I "$V6_NATIVE" \
+		-c 1 -W 1 "$V6_XLAT" >/dev/null 2>&1
+	check_err $? "untranslatable packet did not cross native output"
+	ip -n "$ipxlat_ns6" -6 route del "$V6_XLAT/128" >/dev/null 2>&1 || true
+	log_test "native input and output fallback"
+}
+
+# run IPv6-initiated TCP through translation and target-family MASQUERADE
+test_stateful_nat64()
+{
+	local server_pid
+
+	RET=0
+	timeout 10 ip netns exec "$ipxlat_ns4" iperf3 -s -1 -p "$IPERF_PORT" \
+		>/dev/null 2>&1 &
+	server_pid=$!
+	BG_PIDS+=("$server_pid")
+	slowwait 2 tcp_listener_ready
+	check_err $? "iperf3 server did not start"
+
+	timeout 10 ip netns exec "$ipxlat_ns6" iperf3 -6 \
+		-c "$V6_EAM_NEAR" -B "$V6_REMOTE" -p "$IPERF_PORT" \
+		-n 256K >/dev/null 2>&1
+	check_err $? "TCP transfer through stateful NAT64 failed"
+	wait "$server_pid"
+	check_err $? "iperf3 server failed"
+
+	slowwait 2 counter_nonzero "$ipxlat_nsx" ip ipxlat_nat translated_tcp
+	check_err $? "translated IPv4 traffic did not reach MASQUERADE"
+	log_test "target-family conntrack and NAT"
+}
+
+# require a large checksumless IPv4 UDP datagram to survive IPv6 fragmentation
+test_zero_checksum_postfragment()
+{
+	local target="UDP4-DATAGRAM:$V4_PMTU:$UDP_PORT"
+	local payload_len=1400
+	local receiver_pid
+	local output
+
+	RET=0
+	output=$(mktemp)
+	TMP_FILES+=("$output")
+
+	timeout 4 ip netns exec "$ipxlat_ns6" socat -u \
+		"UDP6-RECVFROM:$UDP_PORT,reuseaddr" \
+		"CREATE:$output" >/dev/null 2>&1 &
+	receiver_pid=$!
+	BG_PIDS+=("$receiver_pid")
+	slowwait 2 udp_listener_ready
+	check_err $? "IPv6 UDP receiver did not start"
+
+	head -c "$payload_len" /dev/zero |
+		ip netns exec "$ipxlat_ns4" socat -u - \
+		"$target,so-no-check=1,ip-mtu-discover=0"
+	# SO_NO_CHECK creates a real CHECKSUM_NONE packet and PMTUDISC_DONT
+	# leaves DF clear, so the 1280-byte translated route must fragment the
+	# complete IPv6 datagram.
+	check_err $? "checksumless IPv4 UDP send failed"
+	slowwait 3 file_has_size "$output" "$payload_len"
+	check_err $? "translated IPv6 UDP datagram was not delivered intact"
+
+	kill "$receiver_pid" 2>/dev/null || true
+	wait "$receiver_pid" 2>/dev/null || true
+	log_test "UDP zero checksum and route-PMTU fragmentation"
+}
+
+# preserve local fragmentation ownership across target-family conntrack defrag
+test_conntrack_refragment()
+{
+	local target="UDP4-DATAGRAM:$V4_PMTU:$UDP_PORT"
+	local payload_len=1900
+	local receiver_pid
+	local output
+
+	RET=0
+	output=$(mktemp)
+	TMP_FILES+=("$output")
+
+	timeout 4 ip netns exec "$ipxlat_ns6" socat -u \
+		"UDP6-RECVFROM:$UDP_PORT,reuseaddr" \
+		"CREATE:$output" >/dev/null 2>&1 &
+	receiver_pid=$!
+	BG_PIDS+=("$receiver_pid")
+	slowwait 2 udp_listener_ready
+	check_err $? "IPv6 UDP receiver did not start"
+
+	# The IPv4 sender first splits the datagram at 1400 bytes. Translation
+	# produces IPv6 fragments larger than the 1280-byte target route. IPv6
+	# conntrack reassembles them in LOCAL_OUT, then IPv6 output must
+	# fragment the complete datagram again for that route.
+	ip -n "$ipxlat_ns4" link set v4 mtu 1400
+	head -c "$payload_len" /dev/zero |
+		ip netns exec "$ipxlat_ns4" socat -u - \
+		"$target,ip-mtu-discover=0"
+	check_err $? "fragmented IPv4 UDP send failed"
+	ip -n "$ipxlat_ns4" link set v4 mtu 1500
+
+	slowwait 3 file_has_size "$output" "$payload_len"
+	check_err $? "conntrack-defragmented IPv6 datagram was not delivered"
+	slowwait 2 counter_nonzero "$ipxlat_nsx" ip6 ipxlat_refragment \
+		tracked_udp
+	check_err $? "reassembled IPv6 datagram did not acquire conntrack state"
+
+	kill "$receiver_pid" 2>/dev/null || true
+	wait "$receiver_pid" 2>/dev/null || true
+	log_test "conntrack defrag and target-route refragmentation"
+}
+
+# translate IPv6 PTB feedback and install the resulting IPv4 PMTU exception
+test_pmtu_feedback()
+{
+	RET=0
+	ip netns exec "$ipxlat_ns4" ping -M "do" -s 1300 -c 1 -W 1 \
+		"$V4_PMTU" >/dev/null 2>&1 || true
+
+	slowwait 3 counter_nonzero "$ipxlat_ns4" ip ipxlat_test frag_needed
+	check_err $? "translated IPv4 Fragmentation Needed was not received"
+	slowwait 3 pmtu_is_1260
+	check_err $? "IPv4 PMTU was not updated to 1260"
+	log_test "translated-family PMTU feedback"
+}
+
+# translate an IPv6 Port Unreachable response back to the IPv4 sender
+test_icmp_error_46()
+{
+	RET=0
+	printf x | ip netns exec "$ipxlat_ns4" socat -u - \
+		"UDP4-DATAGRAM:$V4_REMOTE:$UDP_PORT" >/dev/null 2>&1
+	check_err $? "IPv4 UDP trigger failed"
+	slowwait 3 counter_nonzero "$ipxlat_ns4" ip ipxlat_test \
+		port_unreachable
+	check_err $? "translated IPv4 Port Unreachable was not received"
+	log_test "ICMP error translation 4 to 6"
+}
+
+# translate an IPv4 Port Unreachable response back to the IPv6 sender
+test_icmp_error_64()
+{
+	RET=0
+	printf x | ip netns exec "$ipxlat_ns6" socat -u - \
+		"UDP6-DATAGRAM:[$V6_EAM_NEAR]:$UDP_PORT" >/dev/null 2>&1
+	check_err $? "IPv6 UDP trigger failed"
+	slowwait 3 counter_nonzero "$ipxlat_ns6" ip6 ipxlat_test \
+		port_unreachable
+	check_err $? "translated IPv6 Port Unreachable was not received"
+	log_test "ICMP error translation 6 to 4"
+}
+
+if [[ $(id -u) -ne 0 ]]; then
+	echo "SKIP: this test needs root privileges"
+	exit "$ksft_skip"
+fi
+
+require_command ip
+require_command iperf3
+require_command nft
+require_command ping
+require_command socat
+require_command ss
+require_command timeout
+
+if ! grep -qw ipxlat < <(ip route help 2>&1); then
+	echo "SKIP: iproute2 does not support the ipxlat LWT encapsulation"
+	exit "$ksft_skip"
+fi
+
+trap cleanup EXIT
+
+set -e
+setup_ns ipxlat_ns4 ipxlat_nsx ipxlat_ns6
+setup_topology
+warm_up_neighbors
+setup_nft
+
+# test_conntrack_refragment requires setup_refragment_nft
+setup_refragment_nft
+set +e
+test_conntrack_refragment
+ip netns exec "$ipxlat_nsx" nft delete table ip6 ipxlat_refragment
+
+# the rest of the tests require setup_nat64_nft
+set -e
+setup_nat64_nft
+set +e
+
+test_forwarded_echo
+test_local_output
+test_native_fallback
+test_stateful_nat64
+test_zero_checksum_postfragment
+test_pmtu_feedback
+test_icmp_error_46
+test_icmp_error_64
+
+exit "$EXIT_STATUS"
-- 
2.55.0

