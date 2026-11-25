Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634110;
	b=1U3yXSpbGOhpXXZMfNqpbTEXZtyeL9UEq8/CRZtV7RAdkcgWtVBtNRgmjTHyG+fAy8xK
	 9VNxEMfi5Lr+QCDnqU6KdSmHwomDAYJNhe7bjXaT13g6giwVTt9eeBQAGpe39wN71Tssm
	 e87muakyly3Jd8aRhgybJtgL1rNnFSdgNeMyTeCih/rIgxR9AmCsnU5GImX9EV3N8Wby3
	 BzZYcaPOOeeogFbvqdcqsmyNy1dvat7xQLvgov9Zlyu9IMjggHq0oeb79jm1JvBoYAyce
	 HjOFJaYG7dGKUatDvQEKGhYhwUrDh5SnYv2IYZi20jAb7cV0B2gbMak0pnyC49b15pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2jBZ+gIVoZY8TvKMdM3HQ6V1UsUxzdD7N5qWncy5pGU=;
	b=xybePaDvKtfQeyZVeSFJixFRrZ+NRketW3JqlUxma2Ip9tQHZKW5UVr8RTrwHrGbprWI
	 pyNjpn0Tg572K1Y++LaiLLjIFvOvxZlcqQJBWnNNcvTkqG3L27u9WeujvXTcQZ/QEhtxr
	 brCeCwzrvAfairRjbie/eQt7k8slq/trb4vjoWJbk1aQlOJr4fPPHGG0zT8OOJH7tiWJq
	 V8GXKZGs7DniTuBHnNCkcq8mq60iHF0OAfvKzLpNtIM0gQn/dO+so+qDfURpesbCX6rou
	 0t/ctMA0/Khrs10M+9F7IbzUoJXSKTO9rsBukKdCxddYdZTjpdkF4YpKLpQr98abXiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=ELuOEdC2;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383060A2615
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B383060A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=ELuOEdC2
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03920c477so52795015ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634109; x=1796238909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jBZ+gIVoZY8TvKMdM3HQ6V1UsUxzdD7N5qWncy5pGU=;
        b=ELuOEdC2jOpoq+YR79VSuInO+egjYzwrRvXSudhDjcH99KuI7UUyJ+aYHHnKKwGtCS
         TM/4MCtoI9WLE+wbm+oZg3dyFVy30Nb0MRHX4fXgzGMFnsqmg6Fls5oIVwMie6LDXWOU
         fbJTxsMoy9FVzT/ESlmG91C0OUwcBLUj6Q0CPLnvIzJf0VoJrxcLaTufGhlCu5E63WTx
         Eu/w1J4nm8D+YKGFFxq5yQHc1Wr82R7R2W+wNOiG/+F4W679IhO3EnVvvde64MtdDZhO
         Ghi9lutR6C+NNeHaR4kuBN7W6YARMmAtXqzADxqhEjQKwzIhLRXA6GCwPghimqeSYmm+
         WM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634109; x=1796238909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2jBZ+gIVoZY8TvKMdM3HQ6V1UsUxzdD7N5qWncy5pGU=;
        b=JzWnBkho3kZjN3JQWVu2ubYrWkkbl96tSsHNbYo8DGjenJWsNeAh5jpZ+2fKLNEZ9/
         JhuRKOEW+hbhgKa1zsE4vksihoKozF8GBbVuUkS5fMziw9oPr0sJGwpzD7VpL2J5vh5W
         2MHlv7PIrh2UiUwDdZcxgfXNoUcXC20eqom0Welo9BQgCx7zAut29YXpvtB5gUJ2biVR
         QUGrzwirWsjhjJMVlnqfHi1+up7Pz10tG0aumRIOhzfoDSx22IssEJF6NsvYeTWMvi+J
         c+/Y+unZAZbGU5bEKLdPbTRr0swYNRqjLaUoPX3KcYF4UnZLdOLJpsIcBILv0t6xLRNR
         QEIg==
X-Forwarded-Encrypted: i=1; AL+hErHDvV+MuudXK9tQvgKwJtvQ30ttW+BpcokGG5Kq6vTqiUlQVKRyPvObLk+U6guF+cI+ZUDUecwD1CAT8iGdDno=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5MC+8PzIUEvReHEdpq0YCY3PEv6FT3TfTvk1ST7RaCESog8i1
	nL1iy0ggfMJvz20apHaserDGpBT2YP3rrtmTQV9bjIO9mjyZSBYYXaWAYUISBnr+QPs=
X-Gm-Gg: AZFdTZeRwBJZx5Gj57KBRtyZihYyl21gQij4hLPNbjBSvmH9cwimmhTyMtC/tX1fylR
	LxRcMFjRoiOJkMx/PoJ0GP7OTGX6W80W/PZu5dgj0g0B8jZ9ynEh27Y65w683nPdDdGKXUxDcCC
	4yNtu9hK5ir+brvT6r0Y9l9oOHSo9yEg7s+sml84pZCVM8gQlFUpx4kCr2+TOwoSOTZPdjoYOYo
	Alz/cr566q2LrGND4geYtUo+hhDYfvVstCMWR1D3brY6tXDNyPobstv26EwOMfbYKuxCZkcY1RC
	6aVytT22VrdKJrWHOaGm81tNRmmPhvxJEumkE3cFOHt937PJJ9QU0/cNSDaFZUdV34P0z2gnv8q
	wHabzeGgTvbaE50q6FmXxKguJDyu4TBCzHuVXhJOU4Fb89DbTPDlganwvtBVIbpm7dq188L/ncg
	p28W7hU0SN9TTNwwE22/O74ViqR27TUbSyeILi5Oy4LuEvwKvh31UEx7pR+Gi4YLctFTjg2979C
	pl/27e8Yjt616kn8XvPFs7iDPbGxrFG12J4O09qZ6mLUNTHT/6JN6E6iCVVo6bRj3RcL3xMIonA
	QAmCUsvtX8y4f6dZvejb1n6rPOq4MdoEKLJZ8hzH6uqe6HBJHLGicK8TsRbrTiSkqT56XNYYZ4M
	qliwdo4IY4pTO5vuOPM/8nZGlPPvMQ0S+I/lf/YN9eQ+4v7KGqeE=
X-Received: by 2002:a17:903:2308:b0:2ef:d032:66fa with SMTP id d9443c01a7336-2f03f0fbc77mr197278685ad.10.1795634108910;
        Wed, 25 Nov 2026 11:15:08 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:08 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 11/12] selftests: net: add amt_v6.sh for an IPv6 outer transport
Date: Wed, 25 Nov 2026 19:14:49 +0000
Message-ID: <20261125191450.2497936-12-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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
amt.sh, and the scripts use the same tools, plus jq. The relay forwards
to a tunnel only after the gateway's Membership Update, and the gateway
sends that only after the relay's Membership Query, so the forwarding
checks cover the whole handshake. The test checks that:

 - the gateway learns 2001:db8:a::2 from an Advertisement it requested
   through the relay's second address, 2001:db8:a::3, so the
   Advertisement has to come from the address the Discovery was sent to;
 - IPv4 and IPv6 multicast both reach the listener through the tunnel;
 - IPv4 multicast also reaches a listener on the second gateway, which
   shares the first one's /64 and gateway port, so the relay has to
   deliver each gateway's Membership Query to that gateway and not to
   one whose address merely begins the same way;
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
ignores IFLA_AMT_LOCAL_IP6 ("Local attribute is required") or iproute2
cannot pass it, which includes an iproute2 that packs the IPv6 literal
into the 4-byte IFLA_AMT_LOCAL_IP: this kernel refuses that, and an
older one creates an IPv4 relay, which the probe reads back. Any other
failure after the probe, including in setup, is a FAIL. DAD is off in
the namespaces: the relay sends its MLD General Query from amtr's
link-local address, which must not be tentative at that point.

The script skips when /proc/net/if_inet6 is missing, that is without
CONFIG_IPV6, before it creates any link. disc_answer() returns a distinct
status when tcpdump fails to start or a send fails, and the ff02::1 check
accepts only "no reply", so a broken capture cannot pass it.

The iproute2 side is posted to iproute2-next separately.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile  |   1 +
 tools/testing/selftests/net/amt_v6.sh | 355 ++++++++++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index c80dabbcc..7f98f74f9 100644
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
index 000000000..9d3e4a206
--- /dev/null
+++ b/tools/testing/selftests/net/amt_v6.sh
@@ -0,0 +1,355 @@
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
+# it into the 4-byte IFLA_AMT_LOCAL_IP, which this kernel refuses and an
+# older one takes as an IPv4 address. A kernel without IPv6 AMT support
+# ignores IFLA_AMT_LOCAL_IP6 and asks for a local address. Skip in those
+# cases only.
+probe_v6_relay()
+{
+	local err got
+
+	if ! err=$(ip -n "$RELAY" link add amtprobe type amt mode relay \
+		   local "$RELAY6" dev br_gw 2>&1); then
+		case "$err" in
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"IPv6 address in an IPv4 attribute"*)
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
+		dev br_gw relay_port 2268 max_tunnels 4
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
+test_forward()
+{
+	local ns=$1 addr=$2 port=$3 grp=$4 src=$5 desc=$6
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
+		grep -q "$src" "$out" && break
+	done
+	wait "$pid"
+	grep -q "$src" "$out"
+	check_err $? "nothing from $src reached the listener"
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
+for cmd in jq socat nc smcrouted smcroutectl iptables ip6tables; do
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
+test_tmtu
+test_mcast_discovery
+test_down_up
+
+exit "$EXIT_STATUS"
-- 
2.47.3

