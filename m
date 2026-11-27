Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772827;
	b=4dpH+FGqymfktTGfYTZo6wWioC6in1ZRgrRhxEzPl/vyplZxkW1nsbt2oipoDb8amZXW
	 Qt1S89y9UMBmqdmHXX/9EXn6uNMjXTnrfISEcjW9gWZcg7im9CzNb0790cgNcL106WWfa
	 uLr15H/kDNANBrY6roZ9AMmx2/zLIFFfdHJks33s52grnOKFyDQZKbGnI4ZJYA+Nr6KFR
	 mrARqFxTEng5GR/2lUAcFyYpYF7FiE9TS0uiMMcaLf8psESJ/39RIhFAoF/cknfuW0kPL
	 Dps2CKuBqZDx/y18SsEJSncAGIFLV+ASNfmW3tRuZu9UUjnhXLSVQqtZSSFPOIPFL7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sg/AruJTzo2hHdmicUy0rtxIyKBRsQcw6jRd8b1AKBM=;
	b=zfZ8r7eMHQHoz0CcWj4v4erMbpLWsnjjp7dzKaQCCR3SXgDOEEtLJVJ5ArX/pHwfM5nv
	 1IVLCP1Es2HiluneSpcTSMBJweoXgmFzw6BefYz49SFDBLf4bh/njzmt4Xa09MKFPEZhx
	 2BLegL1m/bneoiy1eGiGVUk3pORaV8n3fcyzo2SvRNCV8ckbbYBKeiJAu0IaTJFsSwVci
	 wW3ZUcM6RHw/dxkyHdz205N27fj6OSzPRI1IJ5AH1aUJPyMILoY4+RM+spVIHnXzHis79
	 Ceo+ZtqhsfhZLS9zV0X7SiWwlMjATegEAbupFg3+UHif1atcuvysey7RS6rWDBxw20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=VDyK0mo2;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15113606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15113606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=VDyK0mo2
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso11244313c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772826; x=1796377626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg/AruJTzo2hHdmicUy0rtxIyKBRsQcw6jRd8b1AKBM=;
        b=VDyK0mo2NMKCmftOYqd5xcUqL0sxDvtmdm7FeZirvEJ6+fHNa3Ip342+vyBer/1LhZ
         PDhMBo9pVK9gL4ESnZTe6P2D+YXjCyqFH09TanWuFZX9P2MJ8VsvU/iqwNrjPcYtcdrn
         t7/U7wQD1hByigzo80xYyY1sItFU4gTb/d5nTv5GjZt5NdGgAGw6F8JbP6HEiA3cSR6J
         BT9XwTzlbH9gGwGdPKDrfxI9otg8fwYNPV7o/pk7PACpi84v3ZR5UdPigu4Cm50yQavi
         YvGn8KaiainVeqRUBtFwUiSIZvXYO3OUmv2u1u7wIiW2QkLB2vhe8/zhGbeoUbl3vb+o
         amdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772826; x=1796377626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg/AruJTzo2hHdmicUy0rtxIyKBRsQcw6jRd8b1AKBM=;
        b=Lq82lFXk17FA8bzLGp0Qk4KSpm0+1xGkvBAVgPzKAmU0J3y6VEIWKyYB0JkF8d397Z
         orYLj+A5z+omWQBkHS9fRei/Pm1GKrNfU8hGVu9p6EMfhNHtk2dIkSo7rkSt1Z4JmdHQ
         q2vgEKE2T4IGXDEXXBm3ttsLRXAVwGgIGUxg8a7zS/eV9FGWZZ94UokL+2dlyarO3aaB
         l4Y02BKvcjaWNEPiRrgnGGWXbeLf1hy02iLlqVF7L1P2iDRLbTDnbDvjQT0vFzOukTbI
         nAh+cpQc4naRk4BGdrLAZdikUYEj5X6h0K5ZPhKcoY6jtog3qQsyaFa7p6Pk91FqoKG8
         ysqg==
X-Forwarded-Encrypted: i=1; AL+hErGbk83FqvIiCgXHg3d0ELZvprhB7G3FPjq4oSM38WKK6VShIriM0kMyv77VUkSuNRB6rWqONiIkdwgAUS8Fdzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NGnBQSw3ruGOTdjFDZUSdLHll5KXpeYbvGLNZmCmS6rNQcYR9
	cpsbJAty9+NGkyKO0CnuizuCiNjRAkbrnfpD7UQxPJ0lPb85Vv3nydxwtAXrDDA5pbs=
X-Gm-Gg: AZFdTZfACq+s58ZmEaAk7/Lh39oosshxuRFUW8e0VjnjgRWVLvtaNUY+S7aSIau/Vaf
	+8CRTcMVPyyAbwb6hRete5jf8nDTxkwgHeH4J5ta+IhTQO/WsAUaDWa5VGInOpvFzklkJXoJ/ho
	TVx4QHXP3FP84fQAblWzVD3QKRQNfwKLUog2vi5qjVyj6P3o3gQ6YsR5pR8GRrzb4X+eGhOU1n4
	lUt6ZVDPMvaH9IKKxmmIuiNjXG2c4xoKaz5hdphL5LWYWJIF/9/ugAj/umFI5s/UIaBHl8bt2bj
	h5F3siMAr5o3ySMsCITa1lEB5k9rM0/gcOFghAEaVrg0y82Wk9bBKiDsm5ZYqbKE7juifwXQjX4
	XOjhTu6NHhSQHpoICh/Z61XgZEQUB0MyIZVUmiuaz4olLbn9vTDje5XOMTF4PnE6p2gt4sCA6Sn
	WBeiXTCX7RhQYt1fpQRIecnDe7XO28i1wFPCxl+XJoxidb2383lg0wH/r9w9ILR3M9kL7V/xtw5
	0Im+2x0KkLCanBnZFwQK0ecoX2c2SJSdm9KyeLdROdOSo+73m+DQce1MBG4ea5B8/kqG3yIZojB
	89fgkH0b22/7IDQDdx2XQ+GV1ez1vTa+d1iZhMVnZ/HUWa/ekcIErmBSTIEmPS05dVHwrYDn9RG
	kVyJwVbMfvEBemK4UZ5L+v6Et7e8=
X-Received: by 2002:a05:701b:465f:10b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b5568cfbcdmr24649684c88.16.1795772825918;
        Fri, 27 Nov 2026 01:47:05 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:05 -0800 (PST)
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
Subject: [PATCH net-next v3 00/12] amt: add an IPv6 outer transport
Date: Fri, 27 Nov 2026 09:46:51 +0000
Message-ID: <20261127094703.3025517-1-omar@blockcast.net>
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
patches 11-12 add selftests. amt_v6.sh needs the same tools as amt.sh
(smcroute, socat, nc, jq, tc), and tcpdump for one check that it skips
without it.

The series is based on net-next ccb81d5e317b, which carries the
six-patch "amt: relay tunnel lifetime, validation and request-path
hardening" series (net v7, merged in 24630ff92eff). It depends on that
series: the tunnel creation, MAC and per-source cap that patch 3 re-keys
are the ones it introduced.

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

The iproute2 support is a separate iproute2-next patch, now at v2:
https://lore.kernel.org/netdev/20261126004258.2133805-iproute2-omar@blockcast.net/
The selftests skip when iproute2 or the kernel lacks the attributes.

IFLA_AMT_LOCAL_IP6, IFLA_AMT_DISCOVERY_IP6 and IFLA_AMT_REMOTE_IP6 are
the next three values after IFLA_AMT_MAX_TUNNELS in this series. The
net-next amt limits series appends IFLA_AMT_MAX_GROUPS and
IFLA_AMT_MAX_SOURCES at the same position, so whichever of the two
lands second renumbers its attributes after the other's.

Changes in v3 (netdev's Sashiko review of v2):
 - The base is net-next ccb81d5e317b. Only MAINTAINERS and the net
   selftests Makefile changed under the series, so 10/12 to 12/12 are
   rebased and nothing else is.
 - 3/12 (Medium): the per-source tunnel cap counts the tunnels of one
   IPv6 /64, not of one address, as one host usually owns a whole /64
   and could otherwise open the cap's worth of tunnels from each of its
   addresses and keep the table full. A tunnel is still found by its
   full endpoint, so gateways in one /64 each keep their own tunnel and
   share the cap. The message no longer says that amt_request_handler()
   snapshots the source before a pull (Low).
 - 5/12 (Medium, Low): amt_dev_xmit() puts the transport header of a
   data packet back after ipv6_mc_check_mld(), which leaves it just past
   the fixed IPv6 header, so the per-segment length of an inner IPv6 GSO
   skb counts any extension headers. amt_tmtu() returns zero, not a
   wrapped value, for a route MTU below the outer headers.
 - 2/12 (Low): the message says that a drop after the hand-off to IPv6
   output is not counted in tx_errors, as the sender passes no netdev.
 - 4/12 (Low): the comment of amt_send_membership_query() says that the
   endpoint is passed by pointer.
 - 6/12 (Low): the message names the right drop site, the tunnel MTU
   check, and no longer claims that ip6_fragment() drops the packet.
 - 8/12 (Low): the exact-length check of an Advertisement applies to an
   IPv6 gateway only, so an IPv4 gateway behaves as it always did. The
   message says so.
 - 11/12 (Medium, Medium, Low): the probe skips on "binary attribute size
   out of range", which is what this kernel says to an iproute2 that
   packs an IPv6 literal into the IPv4 attribute, and on an iproute2 or
   kernel without amt, instead of failing; the egress check of amt.sh is
   ported, and a third gateway in the first gateways' /64 is checked to
   get no tunnel while one in another /64 does. The message no longer
   says "plus jq" and names the checks that are not carried over.
 - 12/12 (Medium, Medium, Low): the same probe fixes; a readback that
   is not an IPv6 address is a skip, as four truncated bytes cannot be
   told from an IPv4 address.
 - Not changed: the IPv4 Advertisement is still sent from local_ip, and
   the IPv6 tunnel MTU still follows the route's path MTU.

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
 drivers/net/amt.c                        | 906 ++++++++++++++++++-----
 include/net/amt.h                        |  60 +-
 include/uapi/linux/amt.h                 |  13 +
 tools/testing/selftests/net/Makefile     |   2 +
 tools/testing/selftests/net/amt_gw_v6.sh | 210 ++++++
 tools/testing/selftests/net/amt_v6.sh    | 441 +++++++++++
 7 files changed, 1430 insertions(+), 205 deletions(-)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh
 create mode 100755 tools/testing/selftests/net/amt_v6.sh


base-commit: ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
