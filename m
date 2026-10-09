Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F194CE68B
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548682; cv=none; b=HuHOyl/G8STGpcRmbZhXuIztOiFFPjTpRwoGGo+ga0RJeNIiZZe3QHYzEuHyHIO2D/E/RfvfNThiZhBP3Z8Crh4yag1UjdchMwMfKck4nXXbXOXRk8T/71H7/peU69LO1dRNZK8zJElojp8Yx7W69pNI+3qI8cX6Fg3FQFnuVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548682; c=relaxed/simple;
	bh=YBAAkhmic9kzdjPVc9G3Tap1QGlzfHZFuiKjUV4JtXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvvscyBdplKUBubiU8sBhJvW84YMJkHiZwWNnJwDqm/A2/CidoQueuU1M7fiUort4OUKE+NxdEG9h3UblpPJQ9+RxI7Zdl99CJggYEWO9CeeftUywwjkxzSyzgU2zKG9QJgqbk48wY8r/5uEQnBGxLknU2X2m9LR1sVQV78b9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=H0tcokk1; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="H0tcokk1"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3a7adbf1b3fso1475842a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 05:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548671; x=1792153471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCo5Jad1nskI66aP44vBkW6E+YemWHdW7T3Dq1NxPUw=;
        b=H0tcokk1lfVTo9jytjfkE2T6p3HgSAzKEg/sPHWhfVEFSed34Yr6Wf+sWujlYbdbD+
         wlkMaiUoYGil+KSDd0o6XHmWbD7RXFy/tnKjYIbYKIWJpRMmTRz/vAlSKddRQrqWKH/N
         rVINlJaKA7Hr/IRJXtOfEby+OpkMppSzr0EbRs4NblifxhTMiepsB7pqWA5KEVcrnoAc
         a7nSAAePBdbSi5NzkTRYVpNDDcdAEmRhT78TTd6BO1QfGzedbzw4aHrpN5nASAh8B0Vj
         PlQ/XeO3O2wPJSOFsuKqohJHVK1p8pti/dNKZLyk3vYb8cbFJxcCcsJRcpEyyqJ/EnFh
         bwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548671; x=1792153471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCo5Jad1nskI66aP44vBkW6E+YemWHdW7T3Dq1NxPUw=;
        b=VcFAU8FoDbJf9IyF6cKvMlbgc6DN8AL1Na41XWKPDWuJL4J3vOm9DtwZlye0lG/S59
         K40+QZfUDcsaFaHoE0ReCYZM0Kt/b3cY6cAJPsoHXa9QpY+Zx3CAm707uKP6UpDiU/xg
         CucuU5T+WY21BZtVOFBs1e0pAltOqtzbkP7BY7haiXOO0QDlWg6g7eN6q1yp9zLO+VD8
         TjPUcTRcjPr5MDCU6BCnznT2JFx0tW79lVK3a2Co81bZYczFgqgxE9XBDL7Z1QfSZUfn
         4hdnWYpjioLvFty0TvHNHjcHxoYv5gDVgR5hzIje8NuBuup7fv5sD7cBTHUhHZSs2H0R
         1c0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwE2l4bvrqiBUX/JYVXRKQY4XEl+Ogbe3k5mdwtlHh3+bGYKC4vMKoe3lD84HKN6oZUy7GY3lH0nqmb8RfJTKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgG7OS2gQ85YEqp3XxThsstib3zq4h5QvdGAkxdaLfCWEFPz6W
	XPJvlPssHWkvpAPUCqtYCS0aEOPe4TyfPaNsiKOIx2qkklHDTwGNuiqgMCHyqcjFpyM=
X-Gm-Gg: AYBFou1gdfC1GvCqYntYng9oEHOXWa/34A43QB7/X2MvE5y1eLxk+zFzgRXUDi9ljRm
	JSxIdc4+JyojHIWNJiYtvTVI1mmcA6jp1zNfNwC5oTi9LRGZw100oyq47pKYhO296h05JxPnLvp
	l8a1cgYCs3jJ1tyiKwgTgHW304bGjmVZigdG2GJO6DFa0Op1qC7r9KWxG8zTm1b2EqFpfE/ko6w
	0sVm0WGQBaL74ObQHfjHkvtmTmzETRCshj/Xcs3R5fK9mQVB4bT3gluMtP1dTqWazzZpp/wGsA7
	OuC4y78HKBKAninD7f4dsJeo5fl/hbH+JtOeV0haj+Rf/72Vht1pwXpiW1NVZKdcEbsnwkmwNND
	2gKAUzdo9BP6c6sk3DmL5QcUdO4pfyayHs5PZ2hgVFfVInlXS3XVJ9WvfHAKabCZKHYBLkicdI6
	khT+J8eOGu+WwnGWV/nV9MYXX41pCIuVO3bP+c8rDUqjp6meJ168uRzf15S/2G02g6yA0KAAvwc
	VzHs7OFLhc6lXXSZO2AmrElpXu6xxFnvKp6uXyi
X-Received: by 2002:a17:90b:5109:b0:3a8:80f4:98a7 with SMTP id 98e67ed59e1d1-3ab3a79df4dmr1651330a91.24.1791548669594;
        Fri, 09 Oct 2026 05:24:29 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:28 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 00/13] amt: add an IPv6 outer transport
Date: Fri,  9 Oct 2026 12:24:13 +0000
Message-ID: <20261009122426.551178-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amt driver runs AMT (RFC 7450) only over IPv4. The relay and the
gateway bind one AF_INET UDP socket, and every message is routed and
sent with the IPv4 helpers. RFC 7450 defines the protocol over both IP
versions, with an IPv6 form of the Relay Advertisement. A gateway on an
IPv6-only access network cannot reach an amt relay today.

This series adds an IPv6 outer transport to both modes. The outer
family is fixed when the link is created: an IPv6 local address
(IFLA_AMT_LOCAL_IP6) selects IPv6. The inner multicast family is
independent, so an IPv6 tunnel carries IGMP/IPv4 and MLD/IPv6 alike.

Patches 1-6 convert the relay: the AF_INET6 socket (1), the IPv6 Relay
Advertisement (2), tunnels keyed on a union amt_addr (3), and the
Membership Query, Membership Update and Multicast Data paths (4-6).
Patch 7 sizes the headroom and the MTU for the 40-byte IPv6 header.
Patches 8-9 convert the gateway. Patch 10 adds the netlink attributes
last, so that no earlier commit can create a half-working IPv6 device.
Patch 11 updates MAINTAINERS, and patches 12-13 add selftests.
amt_udp_xmit() (patch 4) sends the Membership Query, Multicast Data
and the gateway's Membership Update in either family, so there are no
IPv6 copies of these senders.

Design choices:

- The IPv6 Relay Advertisement is sent from the address the Discovery
  was sent to, as RFC 7450 s5.1.2 requires. A gateway can then
  discover the relay through an anycast or secondary address. A
  Discovery sent to a multicast address is dropped, because a
  multicast address cannot be a source. The IPv4 Advertisement is
  still sent from local_ip, which breaks the same case for IPv4. That
  would be a separate fix for net, and the IPv6 code does not need it.

- The IPv6 socket is bound to the underlying link. Without the
  binding, an IPv6 route lookup with a source address only prefers the
  output interface, so traffic could leave through another link.
  Packets from other links could also reach the socket, and two
  gateways on different links with the same link-local address would
  then share one tunnel.

- An IPv6 gateway accepts a zero UDP checksum on Multicast Data only
  (RFC 7450 s5.2.3.3, RFC 6936). A relay requires the checksum on
  every message.

- The gateway publishes the learned IPv6 relay address under a
  seqlock, because a struct in6_addr is not read in one access.

- An older iproute2 puts an IPv6 literal into IFLA_AMT_LOCAL_IP, and
  the kernel takes its first four bytes as an IPv4 address. Patch 10
  refuses a 16-byte IFLA_AMT_LOCAL_IP, and a 16-byte
  IFLA_AMT_DISCOVERY_IP on a gateway. An IPv4 relay never reads the
  discovery address and still accepts it.

- Received headers follow commit 3656a79f94c4 ("amt: re-read skb
  header pointers after every pull"). amt_rcv() and the Request and
  Update handlers copy the outer source address by value, before any
  pull or after the last one. The Discovery and Advertisement handlers
  take header pointers after their last pskb_may_pull().

- Multicast Data over IPv6 is never fragmented (RFC 7450
  s5.3.3.6.3.2). A payload above the tunnel MTU, the route's MTU less
  the outer headers, is dropped. The source of an IPv6 payload gets a
  Packet Too Big (s5.3.3.6.2.2). A GSO skb is judged by its segments.

Deviations from RFC 7450, all in patch 6:

- s5.3.3.6.1 and s6.1 ask for a switch that turns off dynamic path MTU
  adjustment, and s5.3.3.6.1 also asks for a configurable minimum path
  MTU. IPv6 gives a tunnel no way to do either: udpv6_err() lowers the
  route MTU before it looks up the socket, and "mtu lock" does not stop
  it. So the tunnel MTU follows the path MTU, as on every IPv6 UDP
  tunnel. A forged Packet Too Big cannot lower the route MTU below
  1280 bytes, which is the fixed minimum.

- s5.3.3.6.2.2 asks for the tunnel MTU in the Packet Too Big. The
  relay sends at least 1280, because a source ignores a smaller value.
  It also sends one Packet Too Big for each gateway with a smaller
  path MTU, where the RFC prefers a single one.

- s5.3.3.6.2.1 asks the relay to fragment an IPv4 payload with DF=0
  before encapsulation, and to send an ICMP Fragmentation Needed for
  one with DF=1. An IPv4 payload that does not fit an IPv6 tunnel is
  dropped instead, with no ICMP error, because icmp_send() does not
  answer multicast. The IPv4 tunnel does not fragment it either.

The series applies to net-next and depends on three amt changes:

afae89de73dd ("amt: send the relay's General Query directly from the
receive path"), applied to net on 2026-10-02:
https://patch.msgid.link/20260928202312.74574-2-omar@blockcast.net

eb0c18404c89 ("amt: pull the AMT header behind the transport header in
amt_parse_type()"), in net-next:
https://patch.msgid.link/20260928181557.85796-1-omar@blockcast.net

47bb8dfbe1d2 ("amt: mark relay data as a UDP tunnel packet before
sending it"), the first of two patches posted to net-next:
https://patch.msgid.link/20261004161200.27196-2-omar@blockcast.net


With the first, the General Query takes the IPv6 path unchanged
(patch 4). The ICMPv6 errors of the IPv6 socket need the second as
well (patch 1). Patch 6 moves the UDP tunnel marking of the third
after its tunnel MTU check.

iproute2 support for the new attributes will follow on iproute2-next;
the new selftests skip when the kernel or iproute2 lacks them.

Testing. Every patch builds drivers/net/amt.o with W=1 for x86_64,
with gcc and with clang 18, CONFIG_IPV6=y and =n, with no warnings.
At every patch, sparse (C=2) reports nothing in amt.c or amt.h, and
scripts/kernel-doc -Wall reports nothing. checkpatch --strict only
warns that patches 12 and 13 add files without touching MAINTAINERS.
Patch 11 already covers those files.
The runtime tests ran in x86_64 qemu/KVM guests with 4 vCPUs, on
net-next f49defea7668 with the General Query and GSO prerequisites and
this series:

  DEBUG_NET kernel:
    amt_v6.sh 13/13, amt_gw_v6.sh 18/18
  KASAN, lockdep, PROVE_RCU and DEBUG_ATOMIC_SLEEP kernel:
    amt_v6.sh 13/13, amt_gw_v6.sh 18/18, amt.sh 6/6

No KASAN, lockdep, RCU or WARNING report appeared. On a kernel without
the series, the two new scripts skip ("Local attribute is required").

amt_v6.sh covers discovery through a secondary relay address, IPv4 and
IPv6 multicast over an IPv6 tunnel, two gateways in one /64 behind the
same gateway port, the ICMPv6 error to a gateway beyond max_tunnels on
a global and on a link-local address, the tunnel MTU, the zero UDP
checksum rules (accepted on Multicast Data to a gateway, refused on an
Advertisement to a gateway and on a Discovery to a relay), no answer to
a Discovery sent to ff02::1, and the gateway forgetting its relay on
link down.
amt_gw_v6.sh covers the netlink rules.

A script outside the series also checked, on both kernels, that the
Port Unreachable for a gateway's Membership Update makes
amt_err_lookup() send a Request at once.

Not tested: the drop of a packet from :: (it needs a raw IPv6 sender)
and runtime on other architectures.

Omar Ramadan (13):
  amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
  amt: send the Relay Advertisement over IPv6
  amt: key relay tunnels on a union amt_addr endpoint
  amt: send the Membership Query over IPv6
  amt: match the Membership Update tunnel by outer family
  amt: forward multicast data over IPv6
  amt: size the encapsulation headroom by the outer IP version
  amt: send the AMT gateway control plane over IPv6
  amt: receive the AMT gateway control plane over IPv6
  amt: add netlink attributes for an IPv6 outer transport
  MAINTAINERS: amt: cover the amt headers and selftests
  selftests: net: add amt_v6.sh for an IPv6 outer transport
  selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes

 MAINTAINERS                              |   3 +
 drivers/net/amt.c                        | 802 ++++++++++++++++++-----
 include/net/amt.h                        |  41 +-
 include/uapi/linux/amt.h                 |  13 +
 tools/testing/selftests/net/Makefile     |   2 +
 tools/testing/selftests/net/amt_gw_v6.sh | 204 ++++++
 tools/testing/selftests/net/amt_v6.sh    | 535 +++++++++++++++
 tools/testing/selftests/net/config       |   1 +
 8 files changed, 1412 insertions(+), 189 deletions(-)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh
 create mode 100755 tools/testing/selftests/net/amt_v6.sh

-- 
2.43.0

