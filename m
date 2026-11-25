Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634093;
	b=KuxTOS8/dsiiRvsEOG9kmAyx1Fjq+pVw2uL6wmDBU/uPDlbPdp1nplKoeWqi/3ODv2Tc
	 jVGTZs+r5mMKqMwZM9SzVCTZdW/RmFDajfLLDJUj1NgfLRTcAU6ByVFGUNclOw8Ef+YNZ
	 NaiPT7GrBtYQFN08ukX7r4sWk5XCyUKX+ILUau/LGF4jKjO90Zg/6wCB5D2h+htIroSPk
	 lkNMvER7Vr3rpwC9RWvS+h1einxIn0TPFxvveULRmN3LI/eihyIu1Yrx10hUnAbvmBWYu
	 UymrE5KXG3FvKLjjjETHfsKDAnaaIYO5Z/hhp350e6lkhgrUh6Ni8pqH5n0aQR6jecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
	b=Hnnkxushy0H3+0sVQl61ga2OYij6yr3hfRXHS7FQ1ZbcgtJqlfx5OqqgSAClIcbyRa7r
	 dJ44VVdGpsdscoLi+Nxvjgf65Q/6mHFNPejKmaH2fnNB5paqa6dOarnEl625Lo+Lbj2az
	 e0IWDwx5uQyFjkQAuTKHJc7nSL+fkcUjyj83/VdypbYrq2tT79tQrgjdNaLfJbOjJhCv4
	 B3UpaemKrr9T2UaD3hso0PXk+kCFn2VrMzsmj38+oabXH1fUVzA1Bfp+hg9zleuyen5h0
	 tRzxB7E8knubVtWXhtdoSkzDZjCBAWZMhozaX+raILzoInQ2m9B7MxnsGIhxp5oo3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=BdsluJAJ;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2E606A334
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB2E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=BdsluJAJ
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f07a960666so41051645ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634092; x=1796238892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
        b=BdsluJAJHD/evAcJTF4hQ7wYcuZgNGW1w2kvC4Z5dG9Hi8V+fwwGeFY5EhB34+YFvu
         Tn4pNRuQ8XQ77OuT7xZ5wQqmigOO+oXPUIihrlFL/XHZf7D8UwTAirJCmvU9G24TX8Xw
         fGiiwkYpOe/5FlkyRi3R981fewGh5UCdg7MTyackpGjXuEuGC69yzx871njurMoFSwLv
         JUO9NTu0hSjwdgfYSBHTXx6gSHQMTs8uPyx6BmuJ2I7+QFL8oxofzLs6iJv5xLQDP0qC
         iqojYPQz9RihV4LX8kVOf4yQ8Ics0KUtKOa1jTtX2YEx/JjIzH+EP5enRID3OEpTs7y9
         v7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634092; x=1796238892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
        b=lHHZLvqrg3fp9eI8X5nr3i2QvNh/IfTIiww6cqZ80M8gxtA0eca3LbMeeH9s5HzXAx
         Au3jdZlzJZG8l6yHOJd/+k/gjYcp9ml+Yo0VEzFOYownUXWI6MSI1OKjlMsO6f+3Dhhh
         vu4gp6hgQINZaG9A90RpJsDijT5gyh3Ib9Jloj6CaHVatBdQvZNCSK7flwwwCL28Ci5u
         KB+FmwSWnSWOdyOFQDOTIXhbJPb4V7xySkDkXxcnYM4CCboYblvA9XAtx74BVxwMX3oQ
         rTSDVvNDswTYUBHr1g/BZy7yfAdloACG2o4fwoAC5nhihbOfNha9w9ASle8qh5uB3wQD
         bJlQ==
X-Forwarded-Encrypted: i=1; AL+hErGpsYSRri2hdTBelbliFaJKErVKrEFJGvwCouwwXMMgTQzQLqybU805FneTAj+8xHKKWe8BdgqoREtUtLqP35g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vjdx4EhgByqrN1trWvz/4qQSQ3LeKTRHUTUpHTzVUEj9oeV2F
	3GtJdQW8lWGb5LBG9ykJZraAlFBrq/O4owXrD8QipDp5p7jJQ5VkFvfgdsb+51so9P0=
X-Gm-Gg: AZFdTZcsJxwzny29kQ4HEu6aS3Ip0HHQV/yDrzqZ2ADGbHV36NcoCVCqJUjv1Lbvv8K
	btjMVsh6sCVGpRjwmWPNEguJhksifHTWrnOFQADPJVXbiMEOf/uZBk1zgVbwVpJrkRL+sb6K3Uc
	EIlBRajz4xEcWOYiXi3yaCFtNTjIE2IEA5pA0vTINA/sNobdM8S3jSLaRfrAnovfimIw1LlXHln
	avct22rb3YOvRTjLEiDV/lHKR8lg9L6usIH4Ir1yhjqJryCbRa+JBNx6rtKmxc8nhBHG7pu11NI
	1m2/0LJWFNgsXCp/Ho27bI7i0ZmApFIGM1mS6zHa5Za98eZPKswfRzbrBVBN4dEBIrsvN1MtFDy
	S/nYvYg4zS5FdKbrp5gWUfco6pfv8k5L49XXma0zDoN0EJ9y35XbpAjzproyRcybgF0XfMsnVnQ
	vgRhwGIM/nBCblM0iQeKehf96SsqhpfW2UcE24uZDYTt5hhv2uPGEsG0pU3zpoiLpnV0L+PgBmS
	NFhuumG6RRChEkDKj/pWqVeIHuRMb/M4qHiBW6GmlBQtL/n+O0PfgsNADZ2gMlg0mGkdSPRgyc0
	13eE85DbUfeHDibk0DA5p2RoopDw4FE9wNJA86zrLJOuUUJhF+JzcglSKyAA+LKTHl0oYO+p0fz
	sDo8aHotXoWF11seZ2iEr3ocw5EMHrRqSV3bklGI2hPOa9pzCOdw=
X-Received: by 2002:a17:902:e5c5:b0:2f0:345a:25ab with SMTP id d9443c01a7336-2f03f18dbf9mr193440235ad.59.1795634092161;
        Wed, 25 Nov 2026 11:14:52 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:51 -0800 (PST)
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
Subject: [PATCH net-next v2 00/12] amt: add an IPv6 outer transport
Date: Wed, 25 Nov 2026 19:14:38 +0000
Message-ID: <20261125191450.2497936-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
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

The amt driver runs AMT (RFC 7450) only over IPv4: the relay and the
gateway bind one AF_INET UDP socket and every message is routed and
sent with the IPv4 helpers. RFC 7450 defines the protocol over either
IP version, with an IPv6 form of the Relay Advertisement, so a gateway
on an IPv6-only access network cannot reach an amt relay today.

This series adds an IPv6 outer transport to both modes. The outer family
is fixed when the link is created: an IPv6 local address
(IFLA_AMT_LOCAL_IP6) selects IPv6, and the inner multicast family stays
independent, so an IPv6 tunnel carries IGMP/IPv4 and MLD/IPv6 alike.

Use case, which Jakub asked about on v1: Blockcast runs amt relays and
gateways to deliver multicast video over networks that do not carry
multicast natively, and some of those access networks are IPv6-only.
The gateway side has to reach a relay from such a network, and the
relay has to answer it, so both ends need the IPv6 form.

Patches 1-5 convert the relay: the AF_INET6 socket, the IPv6 Relay
Advertisement, tunnel state keyed on a union amt_addr, and the
Membership Query, Membership Update and Multicast Data paths, which
share one amt_udp_xmit() instead of IPv6 twins of each sender.
Multicast Data over IPv6 is checked against the tunnel MTU and never
fragmented. Patch 6 sizes headroom and MTU for the 40-byte outer header.
Patches 7-8 convert the gateway; the learned IPv6 relay address is
published under a seqlock because, unlike the IPv4 one, it cannot be
stored in one access. Patch 9 adds the netlink attributes, last, so
that no intermediate commit can create a half-working IPv6 device.
Patch 10 adds the AMT headers and selftests to MAINTAINERS, and
patches 11-12 add selftests. amt_v6.sh uses the same tools as amt.sh
(smcroute, socat, nc) plus jq, and tcpdump for one check that it skips
without it.

The series is based on net-next 24630ff92eff, which merged net with the
six-patch "amt: relay tunnel lifetime, validation and request-path
hardening" series (net v7). It depends on that series: the tunnel
creation, MAC and per-source cap that patch 3 re-keys are the ones it
introduced.

The IPv6 Relay Advertisement is sent from the address the Discovery was
sent to, as RFC 7450 s5.1.2 requires, so a gateway can discover the
relay through an anycast or secondary address. A Discovery sent to a
multicast group, or from ::, is not answered, since neither can be
used as an address. The IPv4 Advertisement has always been sent from
local_ip, which breaks the same case for an IPv4 gateway. This series
leaves that alone: it changes the behaviour of existing IPv4 relays and
is not needed by the IPv6 code. The IPv4 control senders also look the
route up with a zero TOS while the packet carries AMT_TOS, which is the
mismatch that patch 2 avoids for IPv6; that is a possible separate fix
for net.

The IPv6 socket is bound to the underlying link. That makes the IPv6
route lookups strict about the output interface, as the IPv4 ones
already are, and keeps link-local peers on other links out of the
tunnel table. An IPv6 gateway accepts a zero UDP checksum on Multicast
Data only, as RFC 7450 s5.2.3.3 requires; a relay requires the
checksum on everything.

The IPv6 tunnel MTU follows the route's path MTU, as on every IPv6 UDP
tunnel in the tree. RFC 7450 s5.3.3.6.1 and s6.1 want a relay to offer
a switch that turns dynamic tunnel MTU adjustment off. The IPv6 stack
gives a tunnel no way to do that: it records every Packet Too Big in a
route exception before it looks up the socket, and "mtu lock" does not
apply to IPv6. So this series does not offer the switch. Patch 5
explains this in detail.

Received headers are handled as commit 3656a79f94c4 ("amt: re-read skb
header pointers after every pull") requires. amt_rcv(),
amt_request_handler() and amt_update_handler() copy the outer source
address by value before any pull, or after the last one. The discovery
and advertisement handlers take header pointers only after their last
pskb_may_pull(), and the send paths never pull the received skb.

The iproute2 support is a separate iproute2-next patch:
https://lore.kernel.org/netdev/20261125170100.3054010-iproute2-omar@blockcast.net/
The selftests skip when iproute2 or the kernel lacks the attributes.

IFLA_AMT_LOCAL_IP6, IFLA_AMT_DISCOVERY_IP6 and IFLA_AMT_REMOTE_IP6 are
the next three values after IFLA_AMT_MAX_TUNNELS in this series. The
net-next amt limits series appends IFLA_AMT_MAX_GROUPS and
IFLA_AMT_MAX_SOURCES at the same position, so whichever of the two
lands second renumbers its attributes after the other's.

Changes in v2 (netdev's Sashiko review of v1, and net v7):
 - The base is net-next 24630ff92eff. The three net prerequisites of v1
   are now in net, as v7 of the hardening series. v1's "amt: send the
   relay General Query directly" is not needed any more, and the GSO fix
   was done differently: the device still offers software GSO, so the
   tunnel MTU check in 5/12 is made per segment with
   skb_gso_validate_network_len() instead of assuming a single packet.
 - v1 3/13 and 5/13 are one patch now (3/12). v7 made the Request
   handler stateless and moved tunnel creation to the authenticated
   Membership Update, so the endpoint key is carried through
   amt_tunnel_lookup(), amt_tunnel_get_or_create(), amt_update_tunnel()
   and the new amt_relay_mac(), which both handlers use for the MAC.
   The ICMPv6 Destination Unreachable for a full tunnel table is gone,
   as v7 drops such a Request silently.
 - 2/12: route on AMT_TOS through the flow label (Medium on 4/13, Low on
   2/13); count route and allocation failures with DEV_STATS_INC();
   drop a Discovery from ::. A failure of ip6_local_out() is still not
   counted, as udp_tunnel6_xmit_skb() returns void and passing a device
   would add control messages to the tunnel's byte counters.
 - 4/12: the Membership Query and the relay's General Query take the
   gateway endpoint as a union amt_addr, for v7's stateless Request.
 - 5/12: at most one Packet Too Big per multicast packet (High on 6/13),
   not one per tunnel; the inner family comes from the parsed version,
   not skb->protocol (Low); a tunnel MTU below IPV6_MIN_MTU, which a
   source would ignore, only drops the payload.
 - 7/12 (8/13): the message says that none of the new sender code can run
   yet and that the amt_send_membership_update() conversion changes no
   IPv4 behaviour (Low).
 - 8/12 (9/13): an Advertisement is accepted only if its UDP length is
   that of the device's family (Low); the deferred Query check in
   amt_membership_query_handler() uses amt_from_relay(); the IPv4 half
   of the 0.0.0.0 fix is net v7 3/6 (Medium).
 - 9/12 (10/13): the policy of the existing IPv4 attributes is net v7
   4/6, so the hunk that refused a 16-byte value is dropped (Low).
 - 11/12 (12/13): disc_answer() reports a harness failure separately, so
   the ff02::1 check cannot pass because the capture never ran (Medium);
   the script skips without CONFIG_IPV6 before creating any link (Low).
   CONFIG_IP_MROUTE is already in the net selftests config.
 - Fixed by net v7 and inherited: the Update handler use-after-free
   (High, 5/13), the duplicate-tunnel race and the zero-key MAC (Medium,
   3/13).

Assisted-by: LLM

Omar Ramadan (12):
  amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
  amt: send the Relay Advertisement over IPv6
  amt: key relay tunnels on a union amt_addr endpoint
  amt: send the Membership Query over IPv6
  amt: forward multicast data over IPv6
  amt: size the encapsulation headroom by the outer IP version
  amt: send the AMT gateway control plane over IPv6
  amt: receive the AMT gateway control plane over IPv6
  amt: add netlink attributes for an IPv6 outer transport
  MAINTAINERS: amt: cover the amt headers and selftests
  selftests: net: add amt_v6.sh for an IPv6 outer transport
  selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes

 MAINTAINERS                              |   3 +
 drivers/net/amt.c                        | 861 ++++++++++++++++++-----
 include/net/amt.h                        |  60 +-
 include/uapi/linux/amt.h                 |  13 +
 tools/testing/selftests/net/Makefile     |   2 +
 tools/testing/selftests/net/amt_gw_v6.sh | 207 ++++++
 tools/testing/selftests/net/amt_v6.sh    | 355 ++++++++++
 7 files changed, 1301 insertions(+), 200 deletions(-)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh
 create mode 100755 tools/testing/selftests/net/amt_v6.sh


base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
-- 
2.47.3

