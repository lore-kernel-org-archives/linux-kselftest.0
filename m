Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772845;
	b=M6VgwzLFh1mjwlLtIQn34CB5kgP1XZBGIMAeaUdrvtoU3IRVRTCXZ6638w2r2evrQHZv
	 F/GInjKIvgdMLgToeoyR7b+jFFyOKGgjFlLC3PLJYmapgPzVmursyukvVd34joK7TQD8l
	 n4l3l9GCxp75Zt7DiPm2Z2MUrdv69w8uaqXva3uY2EjkdCELN7AXeWKb7AOfDKXGRYoid
	 o1A4drSn3LWF7L/4lT+sRBeLmRkPJNzDUm+1HdSzsKKeqGicsw7OLOHVCZ6OV7kvGhwJ1
	 1pltT7nE1EhTlwU44DL8Ic2MLwEP8qaAL5F7Mx0ip3sQRkEXszJ5G9zK+xK4fL47PgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dE8pqKUoXHjBOPp5NehPdPhsfHWaPkS5Oe0JqiQSqJQ=;
	b=Px4DEUABqKENXp49pc6bdDJhhb9gKTJOdpiRVTS4KWdL8oM+Wdjv5bHy6OgUrwd3JZb7
	 JWpkaDd20wOQOvHhyXg9bpkRqOnfphptH+3+zOhLPCbx3MZJ3Fnpq4JsfAqEyOJS9yDVW
	 90dVbCz3QFGi50qovrwMiTW1r8vrv54eNJ+h5RXIVYLxqKmajEDGm3PMBlcnfLuTlV6gB
	 HVByw0JlCD2HcW8Flowi9/p7c4Umhs7WGUJWvAVoHUblqhi/C7NfZhqWu5Fh3rIKy4V8+
	 6HuLesOWPgEQKscePAysEgNlt+9V8O8eFWsWWqpJAGugfU8wnI+MNu9xiLVbnlJSKmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="hK2T/Frs";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6A260A3813
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6A260A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=hK2T/Frs
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so12949113c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772844; x=1796377644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dE8pqKUoXHjBOPp5NehPdPhsfHWaPkS5Oe0JqiQSqJQ=;
        b=hK2T/FrsRN3yZJmCrQd3u47hhldpjlu9jbK04iM+OR6LL2nS271xo7gwFIkpsge3Su
         VUOaXRZ0wnNHbWjuCl07Klj5mvYjmW/fVM0FnHPY7q6VBX9sPcvTKXjyGv4KoTouT4O+
         HDQ+Cm+HPVP861u++vZHBDL8AVtEmQJ9N0ii/xGatBokCGkwO/cau9Gc7oDfXdDN+0QU
         8fmijYRdqVwEPEPhhr2UESSHDUyyNYwp6B0RReI+Ar4uxir8Uo8TSnwI6dsx52PtP/bd
         jp9bkkh83UvxPMp37jNdwGGWDb2U7HE2IOEtGJFOGwN1nnfIl974LTwSILMx3Ps+4LC+
         u0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772844; x=1796377644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dE8pqKUoXHjBOPp5NehPdPhsfHWaPkS5Oe0JqiQSqJQ=;
        b=R32Vg0bbJ2f2k/tqqV25M+1/rDxP9NmHfNwIsu4HZSqRxA1lStuZ8KPFwssV/EMe3m
         uvdYCdIfcgKJlCPBhMaNJtuAy7iwAELfBJT26kUbc2fVPrbqmmHOfd21OkrNR+iNzyhA
         stthzcoexMA5kn9qDJzr9eHglBLWIeCQvlAUMx+2NKAiD1J4EF8Fmw7XMre2b3eanlLY
         9vDPb/aAOdadpX3Eih6ZLZDW1rgTgMDG1nhT+ccxDxfUri0DGc+PJZNNgsUJp6161CZL
         vZC9rurN1sMsfJ+pRa6W1mFnsAZMv1zCNrgKe83EJH7DFP04bv5G3ft9BhvrhyszzzHi
         2TIw==
X-Forwarded-Encrypted: i=1; AL+hErFNaPDTGRSQ1vGxo8XWpwPoYZrchNVWTzkHjWIw6sskQ9hjrpgl+lynGdtQ0ba0k9gQypf0n6Ncs77IElXRw0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l7Lw1OripY4CXGteCoed2p1fFH7Un23qrK8sHYq2YEz/DWueh
	H0w7HPQfhiSXyNh9PQkpenK6M/SfM1+1UixdR3b5YwOcqbf/jF1vWkN1wh0OYR3+61FkdE5SO+J
	6saIOEbU=
X-Gm-Gg: AZFdTZcDZ4M06v3j4R8XRPtDhQU3brzbrE/B5xeV7uoA1BkSY1fPKH1ksm8c+xheMpu
	WaBaMoY81iZcxACsoLiNDD8cwHQDCBezU+h9GKIImFuD0o1fnoHQxlj2koAdRRLoVN6g+0cBP8X
	XPhhm5ghD9WtY5aJuNTfZmnu2CH65MC4ftBbOJ+AZjrY9MxXCft9ba+g/Kv7crMCTuokX3Q96cN
	UUROx46Po1GjhYSUYQGpyIWwI0WvlygNa99j59fbuX1p1anzKuOpm+q/6OUmgUh5PPQtyQMIBpn
	9Cl32Wm4OYVZvvbk06OHYI06SBCm0oKMlCLEIxt8DbKO1k2uNCYu7EamJlkpiPWU96+Tkv1g1FH
	BQwGn8d8sss7Y0XtJVmi69FXtUEBL7GJnQDBbz4JNyZgeWoeg2a/CzktC0vbko+MIdRTxsvy3vY
	fnKuGw/TYVaZA1ulgtyRcTbjBPpv7n1Q5BxeQC27rcntDLh27aPLyboF4ZQ34+GBP5h+qlk66jt
	LqWBm4E30wnX4C5vGXC84o5XZaVA5bR65M8pOT/inMaSqZpCmtPiu+mFTbBbqy2jKAnk5jdPQFs
	wmQWTf70k3+oKD4Btg/8QArzL+zCUPxnxA3FHuvGWU6eFuEDVGmrQxtxGJ/NeLD6vWPdlCUuQKx
	S15+1hdGv13C/f59T9tKvPDYvQv4mks6LUDuEx3TeZGRtDW8F
X-Received: by 2002:a05:7022:2641:b0:1b5:1ee6:b6a1 with SMTP id a92af1059eb24-1b5568fe47fmr23033612c88.38.1795772843764;
        Fri, 27 Nov 2026 01:47:23 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:23 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 11/12] selftests: net: add amt_v6.sh for an IPv6 outer transport
Date: Fri, 27 Nov 2026 09:47:02 +0000
Message-ID: <20261127094703.3025517-12-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt.sh runs the gateway and the relay over IPv4; its 2001:db8:: addresses
are inner MLD carried in that IPv4 tunnel. Nothing covers the IPv6 outer
transport this series adds.

amt_v6.sh is amt.sh with the gateway<->relay link moved to IPv6, and a
second gateway on that link:

  amtg:  mode gateway local 2001:db8:a::1 discovery 2001:db8:a::3
  amtg2: mode gateway local 2001:db8:a::4 discovery 2001:db8:a::3
  amtr:  mode relay   local 2001:db8:a::2

The namespaces, inner addresses and smcroute (S,G) routes are those of
amt.sh, and the script needs the same tools. It does not repeat the
send_mcast_torture4 and send_mcast_torture6 runs of amt.sh. The relay
forwards to a tunnel only after the gateway's Membership Update, and the
gateway sends that only after the relay's Membership Query, so the
forwarding checks cover the whole handshake. The test checks that:

 - the gateway learns 2001:db8:a::2 from an Advertisement it requested
   through the relay's second address, 2001:db8:a::3, so the
   Advertisement has to come from the address the Discovery was sent to;
 - IPv4 and IPv6 multicast both reach the listener through the tunnel;
 - IPv4 multicast also reaches a listener on the second gateway, which
   shares the first one's /64 and gateway port, so the relay has to
   deliver each gateway's Membership Query to that gateway and not to
   one whose address merely begins the same way;
 - the relay counts the tunnels of one source per /64. Created with
   max_tunnels 16 it allows two per source, which the first two
   gateways use up, so a third gateway in their /64, with an address
   of its own, gets no tunnel and no multicast, while a gateway in
   another /64 gets both;
 - the relay's General Queries leave through the stream device and
   never through amtr: its egress counters see no IGMP or MLD query;
 - with the relay's route MTU to the gateway lowered, an IPv6 payload
   above the tunnel MTU earns its source a Packet Too Big, and neither
   is the AMT datagram fragmented nor does it reach IPv6 output, where
   it would be refused and counted in Ip6FragFails;
 - a Relay Discovery sent to ff02::1 draws no reply at all, while the
   same Discovery sent to the discovery address, the positive control
   with the same capture filter, draws an Advertisement. This check
   needs tcpdump and is skipped without it;
 - taking amtg down clears the learned relay address, and bringing it
   up discovers the relay again.

A probe creates a throwaway IPv6 relay first. It skips when the kernel
ignores IFLA_AMT_LOCAL_IP6 ("Local attribute is required") or has no amt
link type ("Unknown device type"), or when iproute2 cannot pass the
address, as amt.sh checks that iproute2 knows amt at all. That includes
an iproute2 that packs the IPv6 literal into the 4-byte
IFLA_AMT_LOCAL_IP: this kernel refuses it with "binary attribute size
out of range", and an older one creates an IPv4 relay, which the probe
reads back. Any other failure after the probe, including in setup, is a
FAIL.

The script skips when /proc/net/if_inet6 is missing, that is without
CONFIG_IPV6, before it creates any link. disc_answer() returns a distinct
status when tcpdump fails to start or a send fails, and the ff02::1 check
accepts only "no reply", so a broken capture cannot pass it.

The iproute2 side is posted to iproute2-next separately.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile  |   1 +
 tools/testing/selftests/net/amt_v6.sh | 454 ++++++++++++++++++++++++++
 2 files changed, 455 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index fb0a64662..a31f19e9f 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_v6.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
 	bareudp.sh \
diff --git a/tools/testing/selftests/net/amt_v6.sh b/tools/testing/selftests/net/amt_v6.sh
new file mode 100755
index 000000000..201e820cb
--- /dev/null
+++ b/tools/testing/selftests/net/amt_v6.sh
@@ -0,0 +1,454 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# amt.sh with an IPv6 outer transport. The gateways and the relay speak AMT
+# over IPv6, and IPv4 and IPv6 multicast are carried inside. The namespaces,
+# roles and inner addresses are those of amt.sh; the gateway<->relay link
+# differs, and a second gateway shares it:
+#
+#   LISTENER l_gw -- gw_l [br0: gw_l, amtg] GATEWAY gw_relay 2001:db8:a::1
+#                                                        | IPv6 outer
+#                                  [amtg2] GATEWAY2 gw2_relay 2001:db8:a::4
+#                                                        |
+#   SOURCE src_relay -- relay_src [amtr] RELAY br_gw 2001:db8:a::2
+#                                  [br_gw: relay_gw, relay_gw2] 2001:db8:a::3
+#
+# The relay's local address is 2001:db8:a::2. The gateways discover it
+# through 2001:db8:a::3, so the Relay Advertisement has to come from the
+# address the Discovery was sent to (RFC 7450 s5.1.2) and carry ::2.
+
+source lib.sh
+
+readonly GW6="2001:db8:a::1"
+readonly GW2_6="2001:db8:a::4"
+readonly RELAY6="2001:db8:a::2"
+readonly DISC6="2001:db8:a::3"
+# A third gateway in the first /64, and one in a /64 of its own.
+readonly GW4_6="2001:db8:a::5"
+readonly GW3_6="2001:db8:b::5"
+readonly DISC6B="2001:db8:b::3"
+SMCDIR=
+
+cleanup()
+{
+	cleanup_all_ns
+	[ -n "$SMCDIR" ] && rm -rf "$SMCDIR"
+}
+
+setup_fail()
+{
+	echo "FAIL: setup failed at line $1" >&2
+	exit "$ksft_fail"
+}
+
+amt_field()
+{
+	ip -n "$1" -d -j link show "$2" |
+		jq -r ".[0].linkinfo.info_data.$3 // empty"
+}
+
+# remote_is <addr> [<ns> <dev>]: the relay address a gateway learned.
+remote_is()
+{
+	[ "$(amt_field "${2:-$GATEWAY}" "${3:-amtg}" remote)" = "$1" ]
+}
+
+snmp6()
+{
+	ip netns exec "$1" awk -v k="$2" '$1 == k { print $2 }' /proc/net/snmp6
+}
+
+setup_links()
+{
+	local ns
+
+	# No DAD: the relay sources its MLD General Query from amtr's
+	# link-local address, which must not be tentative when it is sent.
+	for ns in "$LISTENER" "$GATEWAY" "$GATEWAY2" "$RELAY" "$SOURCE"; do
+		ip netns exec "$ns" sysctl -wq \
+			net.ipv6.conf.all.accept_dad=0 \
+			net.ipv6.conf.default.accept_dad=0
+	done
+
+	ip -n "$LISTENER" link add l_gw type veth peer name gw_l \
+		netns "$GATEWAY"
+	ip -n "$GATEWAY" link add gw_relay type veth peer name relay_gw \
+		netns "$RELAY"
+	ip -n "$GATEWAY2" link add gw2_relay type veth peer name relay_gw2 \
+		netns "$RELAY"
+	ip -n "$RELAY" link add relay_src type veth peer name src_relay \
+		netns "$SOURCE"
+
+	ip -n "$GATEWAY" addr add "$GW6/64" dev gw_relay
+	ip -n "$GATEWAY" link set gw_relay up
+	ip -n "$GATEWAY2" addr add "$GW2_6/64" dev gw2_relay
+	ip -n "$GATEWAY2" link set gw2_relay up
+	ip -n "$RELAY" link add br_gw type bridge
+	ip -n "$RELAY" link set relay_gw master br_gw up
+	ip -n "$RELAY" link set relay_gw2 master br_gw up
+	ip -n "$RELAY" addr add "$RELAY6/64" dev br_gw
+	ip -n "$RELAY" addr add "$DISC6/64" dev br_gw
+	ip -n "$RELAY" link set br_gw up
+}
+
+# An iproute2 without IPv6 AMT support either rejects the address or packs
+# it into the 4-byte IFLA_AMT_LOCAL_IP, which this kernel refuses ("binary
+# attribute size out of range") and an older one takes as an IPv4 address.
+# A kernel without IPv6 AMT support ignores IFLA_AMT_LOCAL_IP6 and asks for
+# a local address, and one without amt does not know the link type. Skip in
+# those cases only.
+probe_v6_relay()
+{
+	local err got
+
+	if ! ip link help 2>&1 | grep -q amt; then
+		echo "SKIP: missing amt support in iproute2"
+		exit "$ksft_skip"
+	fi
+
+	if ! err=$(ip -n "$RELAY" link add amtprobe type amt mode relay \
+		   local "$RELAY6" dev br_gw 2>&1); then
+		case "$err" in
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"binary attribute size out of range"*|*"Unknown device type"*|\
+		*"Operation not supported"*)
+			echo "SKIP: no IPv6 AMT support: $err"
+			exit "$ksft_skip"
+			;;
+		esac
+		echo "FAIL: cannot create an IPv6 relay: $err"
+		exit "$ksft_fail"
+	fi
+	got=$(amt_field "$RELAY" amtprobe local)
+	ip -n "$RELAY" link del amtprobe
+	if [[ "$got" != *:* ]]; then
+		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
+		exit "$ksft_skip"
+	fi
+}
+
+setup_topology()
+{
+	ip -n "$LISTENER" addr add 192.168.0.2/24 dev l_gw
+	ip -n "$LISTENER" addr add 2001:db8::2/64 dev l_gw
+	ip -n "$LISTENER" link set l_gw up
+	ip -n "$LISTENER" route add default via 192.168.0.1 dev l_gw
+	ip -n "$LISTENER" route add default via 2001:db8::1 dev l_gw
+	ip -n "$LISTENER" addr add 239.0.0.1/32 dev l_gw autojoin
+	ip -n "$LISTENER" addr add ff0e::5:6/128 dev l_gw autojoin
+
+	ip -n "$GATEWAY" addr add 192.168.0.1/24 dev gw_l
+	ip -n "$GATEWAY" addr add 2001:db8::1/64 dev gw_l
+	ip -n "$GATEWAY" link add br0 type bridge
+	ip -n "$GATEWAY" link set br0 up
+	ip -n "$GATEWAY" link set gw_l master br0 up
+	ip -n "$GATEWAY" link add amtg master br0 type amt mode gateway \
+		local "$GW6" discovery "$DISC6" dev gw_relay \
+		gateway_port 2268 relay_port 2268
+
+	# rp_filter off: amtg2's listener gets data from a source it has no
+	# route to.
+	ip netns exec "$GATEWAY2" sysctl -wq net.ipv4.conf.all.rp_filter=0 \
+		net.ipv4.conf.default.rp_filter=0
+	ip -n "$GATEWAY2" link add amtg2 type amt mode gateway \
+		local "$GW2_6" discovery "$DISC6" dev gw2_relay \
+		gateway_port 2268 relay_port 2268
+
+	ip -n "$RELAY" link add amtr type amt mode relay local "$RELAY6" \
+		dev br_gw relay_port 2268 max_tunnels 16
+	# max_tunnels 16 allows two tunnels per source (max_tunnels / 8), and a
+	# source is a /64: test_source_cap relies on it.
+	# Count the IGMP and MLD queries that leave the relay through its own
+	# amt device; test_query_egress expects none.
+	ip netns exec "$RELAY" tc qdisc add dev amtr clsact
+	ip netns exec "$RELAY" tc filter add dev amtr egress pref 1 \
+		protocol ip flower ip_proto 0x2 action pass
+	ip netns exec "$RELAY" tc filter add dev amtr egress pref 2 \
+		protocol ipv6 flower ip_proto icmpv6 type 130 action pass
+	ip -n "$RELAY" addr add 172.17.0.1/24 dev relay_src
+	ip -n "$RELAY" addr add 2001:db8:3::1/64 dev relay_src
+	ip -n "$RELAY" link set relay_src up
+	ip netns exec "$RELAY" sysctl -wq net.ipv4.ip_forward=1
+	ip netns exec "$RELAY" iptables -t mangle -I PREROUTING \
+		-d 239.0.0.1 -j TTL --ttl-set 2
+	# Only the group: rewriting the hop limit of Neighbour Discovery on
+	# the IPv6 outer link would break it.
+	ip netns exec "$RELAY" ip6tables -t mangle -I PREROUTING \
+		-d ff0e::5:6 -j HL --hl-set 2
+
+	ip -n "$SOURCE" addr add 172.17.0.2/24 dev src_relay
+	ip -n "$SOURCE" addr add 2001:db8:3::2/64 dev src_relay
+	ip -n "$SOURCE" link set src_relay up
+	ip -n "$SOURCE" route add default via 172.17.0.1 dev src_relay
+	ip -n "$SOURCE" route add default via 2001:db8:3::1 dev src_relay
+
+	ip -n "$RELAY" link set amtr up
+	ip -n "$GATEWAY" link set amtg up
+	ip -n "$GATEWAY2" link set amtg2 up
+
+	SMCDIR=$(mktemp -d)
+	ip netns exec "$RELAY" smcrouted -P "$SMCDIR/pid" -u "$SMCDIR/sock"
+	slowwait 5 test -S "$SMCDIR/sock"
+	ip netns exec "$RELAY" smcroutectl -u "$SMCDIR/sock" \
+		a relay_src 172.17.0.2 239.0.0.1 amtr
+	ip netns exec "$RELAY" smcroutectl -u "$SMCDIR/sock" \
+		a relay_src 2001:db8:3::2 ff0e::5:6 amtr
+}
+
+test_discovery()
+{
+	RET=0
+	slowwait 10 remote_is "$RELAY6"
+	check_err $? "remote is '$(amt_field "$GATEWAY" amtg remote)'"
+	log_test "IPv6 discovery through a secondary relay address"
+}
+
+# test_forward <ns> <socat address> <port> <group> <source> <description>
+#		[none]
+# Send to the group and expect the listener to get it, or, with "none", to
+# get nothing.
+test_forward()
+{
+	local ns=$1 addr=$2 port=$3 grp=$4 src=$5 desc=$6 want=${7:-data}
+	local out pid i
+
+	RET=0
+	out=$(mktemp)
+	ip netns exec "$ns" timeout 20 \
+		socat -u "$addr,readbytes=128" - > "$out" &
+	pid=$!
+	wait_local_port_listen "$ns" "$port" udp
+	for i in $(seq 15); do
+		ip netns exec "$SOURCE" bash -c \
+			"printf '%s %128s' $src | nc -w 1 -u $grp $port"
+		[ "$want" = data ] && grep -q "$src" "$out" && break
+	done
+	wait "$pid"
+	if [ "$want" = data ]; then
+		grep -q "$src" "$out"
+		check_err $? "nothing from $src reached the listener"
+	else
+		! grep -q "$src" "$out"
+		check_err $? "$src reached a listener that should get no tunnel"
+	fi
+	rm -f "$out"
+	log_test "$desc"
+}
+
+# The tunnel MTU is the path MTU to the gateway less the outer headers.
+# Lower the relay's route MTU to the gateway below the payload: the relay
+# must not fragment the AMT datagram, and it must send the payload's
+# source a Packet Too Big (RFC 7450 s5.3.3.6).
+test_tmtu()
+{
+	local ptb frag fragfail i
+
+	RET=0
+	ip -n "$RELAY" -6 route add "$GW6/128" dev br_gw mtu 1400
+	ptb=$(snmp6 "$SOURCE" Icmp6InPktTooBigs)
+	frag=$(snmp6 "$RELAY" Ip6FragCreates)
+	fragfail=$(snmp6 "$RELAY" Ip6FragFails)
+	for i in 1 2 3; do
+		ip netns exec "$SOURCE" bash -c \
+			"printf '%1352s' x | nc -w 1 -u ff0e::5:6 6000"
+	done
+	[ "$(snmp6 "$SOURCE" Icmp6InPktTooBigs)" -gt "$ptb" ]
+	check_err $? "the source got no Packet Too Big"
+	[ "$(snmp6 "$RELAY" Ip6FragCreates)" -eq "$frag" ]
+	check_err $? "the relay fragmented an AMT datagram"
+	# amt_udp_xmit() clears ignore_df, so an oversized datagram that got
+	# past the tunnel MTU check would be refused by IPv6 output and
+	# counted as a FragFail rather than a FragCreate.
+	[ "$(snmp6 "$RELAY" Ip6FragFails)" -eq "$fragfail" ]
+	check_err $? "an oversized AMT datagram reached IPv6 output"
+	ip -n "$RELAY" -6 route del "$GW6/128" dev br_gw mtu 1400
+	log_test "IPv6 payload above the tunnel MTU"
+}
+
+# A second gateway in the same /64, with the same gateway port as the first.
+# The relay has to send each gateway its own Membership Query: a query sent
+# to the wrong one fails its nonce check, and the intended gateway never
+# reports, so the relay never forwards to it.
+test_second_gateway()
+{
+	RET=0
+	slowwait 10 remote_is "$RELAY6" "$GATEWAY2" amtg2
+	check_err $? "amtg2 remote is '$(amt_field "$GATEWAY2" amtg2 remote)'"
+	log_test "second IPv6 gateway on the link discovers the relay"
+
+	test_forward "$GATEWAY2" \
+		UDP4-RECV:4000,ip-add-membership=239.0.0.1:amtg2 \
+		4000 239.0.0.1 172.17.0.2 \
+		"IPv4 multicast to a second gateway in the same /64"
+}
+
+# The relay allows two tunnels per source, and amtg and amtg2 hold both for
+# 2001:db8:a::/64: the relay counts the tunnels of one source per /64, not
+# per address. A third gateway in that /64, with an address of its own,
+# must get no Membership Query, so no tunnel and no multicast, while a
+# gateway in another /64 gets all three. Counting per address would let
+# the third one in, and let one host fill the table from its /64.
+test_source_cap()
+{
+	RET=0
+	# A gateway binds its socket to its link, so each extra gateway gets
+	# a link of its own, on the relay's bridge.
+	ip -n "$RELAY" addr add "$DISC6B/64" dev br_gw
+	ip -n "$GATEWAY2" link add gw3_relay type veth peer name relay_gw3 \
+		netns "$RELAY"
+	ip -n "$GATEWAY2" link add gw4_relay type veth peer name relay_gw4 \
+		netns "$RELAY"
+	ip -n "$RELAY" link set relay_gw3 master br_gw up
+	ip -n "$RELAY" link set relay_gw4 master br_gw up
+	ip -n "$GATEWAY2" addr add "$GW3_6/64" dev gw3_relay
+	ip -n "$GATEWAY2" addr add "$GW4_6/64" dev gw4_relay
+	ip -n "$GATEWAY2" link set gw3_relay up
+	# The relay answers with its own address, in the first /64: reach it on
+	# this link as well.
+	ip -n "$GATEWAY2" route add 2001:db8:a::/64 dev gw3_relay metric 2048
+	ip -n "$GATEWAY2" link set gw4_relay up
+	ip -n "$GATEWAY2" link add amtg3 type amt mode gateway \
+		local "$GW3_6" discovery "$DISC6B" dev gw3_relay \
+		gateway_port 2268 relay_port 2268
+	ip -n "$GATEWAY2" link add amtg4 type amt mode gateway \
+		local "$GW4_6" discovery "$DISC6" dev gw4_relay \
+		gateway_port 2268 relay_port 2268
+	ip -n "$GATEWAY2" link set amtg3 up
+	ip -n "$GATEWAY2" link set amtg4 up
+	slowwait 10 remote_is "$RELAY6" "$GATEWAY2" amtg3
+	check_err $? "amtg3 remote is '$(amt_field "$GATEWAY2" amtg3 remote)'"
+	slowwait 10 remote_is "$RELAY6" "$GATEWAY2" amtg4
+	check_err $? "amtg4 remote is '$(amt_field "$GATEWAY2" amtg4 remote)'"
+	log_test "gateways in the same /64 and in another discover the relay"
+
+	test_forward "$GATEWAY2" \
+		UDP4-RECV:4000,ip-add-membership=239.0.0.1:amtg3 \
+		4000 239.0.0.1 172.17.0.2 \
+		"IPv4 multicast to a gateway in another /64"
+	test_forward "$GATEWAY2" \
+		UDP4-RECV:4000,ip-add-membership=239.0.0.1:amtg4 \
+		4000 239.0.0.1 172.17.0.2 \
+		"a third gateway in a /64 at its cap gets no tunnel" none
+}
+
+# The relay sends its General Queries through the stream device, so none
+# leaves through amtr; the forwarding tests above show that the gateways
+# got theirs.
+test_query_egress()
+{
+	local jqf='[.[].options.actions[0].stats.packets // empty] | add // 0'
+	local n4 n6
+
+	RET=0
+	n4=$(ip netns exec "$RELAY" tc -s -j filter show dev amtr egress \
+		pref 1 | jq "$jqf")
+	n6=$(ip netns exec "$RELAY" tc -s -j filter show dev amtr egress \
+		pref 2 | jq "$jqf")
+	[ "$n4" -eq 0 ]
+	check_err $? "$n4 IGMP queries left through amtr"
+	[ "$n6" -eq 0 ]
+	check_err $? "$n6 MLD queries left through amtr"
+	log_test "relay queries bypass the amt device"
+}
+
+# disc_answer <dst> <filter>: send a Relay Discovery from the gateway's
+# namespace to [<dst>]:2268 and wait for gw_relay to see a packet matching
+# the tcpdump <filter>. Returns 0 if it did, 1 if none came within a few
+# seconds, and 2 if the harness failed: tcpdump did not start or stopped
+# with an error, or a send failed. Callers must not read 2 as "no reply".
+disc_answer()
+{
+	local dst=$1 filter=$2 pid i rc
+	local to="UDP6-SENDTO:[$dst]:2268,sourceport=40000"
+
+	ip netns exec "$GATEWAY" timeout 6 \
+		tcpdump -nni gw_relay -c 1 "$filter" > /dev/null 2>&1 &
+	pid=$!
+	sleep 1
+	# tcpdump stays up until it matches or times out, so it is gone here
+	# only if it failed to start.
+	kill -0 "$pid" 2> /dev/null || { wait "$pid"; return 2; }
+	# Type 1 (Relay Discovery), version 0, then a nonce.
+	for i in 1 2 3; do
+		printf '\x01\x00\x00\x00\x12\x34\x56\x78' |
+			ip netns exec "$GATEWAY" socat -u - \
+			"$to,so-bindtodevice=gw_relay" || rc=2
+		sleep 0.5
+	done
+	wait "$pid"
+	case $? in
+	0) return "${rc:-0}" ;;
+	124) return "${rc:-1}" ;;
+	*) return 2 ;;
+	esac
+}
+
+# The relay's socket is bound to ::, so it also receives a Discovery sent
+# to ff02::1. Answering it from that destination would put a multicast
+# source address on the wire (RFC 4291 s2.7), so the relay must not answer
+# it at all. The unicast Discovery is the positive control: it shows that
+# the probe and the capture work, and it uses the same capture filter.
+test_mcast_discovery()
+{
+	RET=0
+	if ! command -v tcpdump > /dev/null; then
+		log_test_skip "Discovery to ff02::1 is not answered" \
+			"tcpdump not installed"
+		return
+	fi
+	disc_answer "$DISC6" "udp and src port 2268 and dst port 40000"
+	check_err $? "no Advertisement for a unicast Discovery"
+	disc_answer ff02::1 "udp and src port 2268 and dst port 40000"
+	[ $? -eq 1 ]
+	check_err $? "the relay answered ff02::1, or the capture failed"
+	log_test "Discovery to ff02::1 is not answered"
+}
+
+test_down_up()
+{
+	RET=0
+	ip -n "$GATEWAY" link set amtg down
+	remote_is ""
+	check_err $? "relay still reported while down"
+	ip -n "$GATEWAY" link set amtg up
+	slowwait 10 remote_is "$RELAY6"
+	check_err $? "relay not rediscovered after up"
+	log_test "gateway forgets its IPv6 relay on link down"
+}
+
+for cmd in jq socat nc tc smcrouted smcroutectl iptables ip6tables; do
+	require_command "$cmd"
+done
+
+# Without CONFIG_IPV6 setup_links() would fail first and report FAIL.
+if [ ! -e /proc/net/if_inet6 ]; then
+	echo "SKIP: IPv6 support is disabled"
+	exit "$ksft_skip"
+fi
+
+trap cleanup EXIT
+setup_ns LISTENER GATEWAY GATEWAY2 RELAY SOURCE || exit "$ksft_skip"
+
+set -E
+trap 'setup_fail $LINENO' ERR
+setup_links
+trap - ERR
+probe_v6_relay
+trap 'setup_fail $LINENO' ERR
+setup_topology
+trap - ERR
+set +E
+
+test_discovery
+test_forward "$LISTENER" UDP4-LISTEN:4000 4000 239.0.0.1 172.17.0.2 \
+	"IPv4 multicast over an IPv6 tunnel"
+test_forward "$LISTENER" UDP6-LISTEN:6000 6000 ff0e::5:6 2001:db8:3::2 \
+	"IPv6 multicast over an IPv6 tunnel"
+test_second_gateway
+test_source_cap
+test_tmtu
+test_mcast_discovery
+test_down_up
+test_query_egress
+
+exit "$EXIT_STATUS"
