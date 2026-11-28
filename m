Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795826511;
	b=QzwfhnozHsBcquHa06DmD2n92h9Yyyg4jnLi9qKFIaEyGQX1bhJk0hN2GnCn+0EsknR9
	 TwwolsfrweEAZzvPvbbiU5SJ4YOerzbeUcnFZ6/RGXiiGAyj9G2UWQqwGdLuukWGCWsVO
	 QnpTvtdEtODW38jhkyOazaG6/VJqk+yWjFj+2cwIEv0P0PiZtiQ+zApk1DrQ/ocEQDEG8
	 K9+TaewgbYZRKrYZvY95cHIiJEXJoAkuZjHokXE7FlDrsfqxGhRfREW8kVoeGA1icAQG6
	 yATpfLHrcboz+lWAbtDEajuG7+If9txKHGAypqCOZx5DoXqjzfq3RVfPgvs5a5u+0ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826511;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sxK9aNeAgpmnRNl1nqPKEZb/ERh5H2YTIzE4eyPp30o=;
	b=pwPOsTg24gXdy07qc6ER1wjz28yHv/lY82A7JFPsy5JH0+3gtkFJxXn5uTNjNc0vkRL6
	 j0jxml75/RyjneWXPbWI+jqxdTV2OE5JYExNW33vFSR4Ee9EWiwSpCWDW3Wpk8NQmDqwK
	 WTlDoxx/DOlrIFw8Rz2ubHoy+Yp5ZaTojPfAaBvneyaNH5CZJyIJQ1+4am/E2HnBoHhtH
	 6AUPa2BFjTP93m8v44KCHVxGPEsYh9PBy/IvrPm9f43lZ2ZTh6dkjCFHl5gqgrQo3PJAR
	 Yxd9dl98P6q5vEbjMfTl8oaAd/He0G2PruIo2JIk69khQ6QvIMxlsIw6RGNTBbO1u9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHQ+i9QJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC7606A31E;
	Sat, 28 Nov 2026 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHQ+i9QJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795826510;
	b=SLLIFit7bMQ6hlsrFY9lMBeULFrRwxHShm1GmZ44aCrgA3YAf3N8+empJYv/6hP4evHa
	 je5YDS/F8q2dzVZ+JhyZX6enT5Uz1IWMEgV9V1Ea8S+Y0U5dbFC4sn4PsHAUU1uQrLCAU
	 0lvzwbat6GrVdQXwJkOLPA4g7eiRWgiq2Z8vjgjZgi/PsOwuiW2uTikadIkIVSq7ODWht
	 eSVitdjLNrsD79qIsd7BXQj0248KBiln5GyiQd5CjbKXtj43rWCll/YoBYPznAuqW4bXL
	 ZvSg7z5gsQAv1jqnrig/zb0lnm6TxXZV1FoSRWixJWZXYdPZMdGFM0M/tiE3UF69ImQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795826510;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sxK9aNeAgpmnRNl1nqPKEZb/ERh5H2YTIzE4eyPp30o=;
	b=RqdvrZmb60PIKm+FFmxx9PaAwpzcyDMNL/6fXJltwiewslkpQE1kk29r1SEaggLPk2dK
	 YNodziu7KGhXhmUWxk+P6MME5I/inEU+H5QT+vVgu3NfLYCkRwmRAMbw+iRA3voaV0BTp
	 ZORDbYbRNHRfu8LQnMkoeW2jeH9zsSu57yCtgoxz30qBhRX2n6BKa9FpoBYaLAWv429n4
	 MIP1i5ZKBBLYIq+bsKCTpKB99V4dxLUebOoG8pVThFgEiTEywCzBzeL9375PGTi1Q1NwW
	 TkEc67mwPRl4HXXKCx6iIjtDCx4NqfiRmTd/EMl3lswR+Tx8g0X5c2+Ea396UnShANQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E75301F008A0;
	Sat, 28 Nov 2026 00:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795826510;
	bh=sxK9aNeAgpmnRNl1nqPKEZb/ERh5H2YTIzE4eyPp30o=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QHQ+i9QJVN5GhJ0TVCPzxUcYHWrltxckQFtUUBWKUmKChu2Rhwykfr7Ic1cd9HTrl
	 ZJDV9RdLr4PaSPr69S3Ps37V767WQMiL4Qx/jB4xnYB6h0GsY0HX36sQqHdlVHBOAx
	 geVqas1zgjhKLI/aJTK4eb+9lZcQCv4ZPozp7HCZ1HIAX5Va2OMPCsZbD/5pCqp58g
	 rsIAABrNEK/19ScWlvXUHn61BwflbRm/ZlOY+lbaVVqC5TmVhUV0B2wG56CSGrHhjA
	 3UhAR6OOHUkIK/qwSbAHBaraH+0vtPTt9t67Q80WD9pmEafXDJ3f/PPitMRF2h9Ssl
	 HJN/LceaQ1Ksw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48A3A4DEC9;
	Sat, 28 Nov 2026 00:41:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH net-next v2 0/5] lisp: add a LISP (RFC 9300) tunnel device
Date: Sat, 28 Nov 2026 01:41:32 +0100
Message-Id: <20261128-for-upstream-lisp-v1-v2-0-68e8649c3ed2@free.fr>
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
X-B4-Tracking: v=1; b=H4sIADwjCmsC/32NwQqDMBBEf0X23C0mlag9+R/FQzSbutBG2aRiE
 f+9wQ8ozGWYmTc7RBKmCPdiB6GVI88hG30pYJxseBKyyx50qY1S2qCfBT9LTEL2jS+OC64Kh6q
 2o2kbl1uQp4uQ5+3EPiBQwkBbgj4nE8c0y/f8W9WZ/0dnlVjfGm2rYfSuHTovRFcv0B/H8QPCz
 TqwwAAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vincent Jardin <vjardin@free.fr>, Donald Hunter <donald.hunter@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>, 
 Danielle Ratson <danieller@nvidia.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795826502; l=4327;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=3QIbv24rPwGBZWn9xkNpTTUXhCedhThkPImwKnrDxv8=;
 b=+M8pAoNkv4l30kgyWMv8hMT7VICYTTzvk8BqRtpPTRxtXemyU8UlqJ+AJYXn7ADWiQ+N1X6vr
 MfzW61hEDXmCMRQXr1wwNaWmCOqLwLTWYWRB7pZas7DFDfkYM/PnLU5
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

LISP (Locator/ID Separation Protocol, RFC 9300) carries the packets sent
to an endpoint identifier (EID) over UDP, to a routing locator (RLOC) of
the site of that EID. An EID prefix and its RLOCs are a mapping, which
the LISP control plane (RFC 9301) provides.

This series adds the data plane of a LISP router (xTR): a tunnel device,
link kind "lisp", for IPv4 and IPv6 EIDs over IPv4 and IPv6 RLOCs.

A mapping is a route. The device takes the RLOC of a packet from its
tunnel metadata, which the lwtunnel encapsulation of the route
or of its nexthop provides. A remote site is a nexthop, shared by its
EID prefixes:

  ip link add link wan name lisp101 type lisp id 101 local 192.0.2.1
  ip link set lisp101 master site up
  ip -6 nexthop add id 1 encap ip dst 198.51.100.1 dev lisp101
  ip route add 10.2.0.0/24 vrf site nhid 1
  ip -6 route add 2001:db8:2::/48 vrf site nhid 1

Design:

- The kernel has no map-cache and it does not resolve anything: no
  upcall, no state that the packets of a host create. Its tables are the
  routes and the nexthops, which a control plane in user space writes,
  as it does for any other routing protocol. A packet without RLOC ends
  up dropped.

- A remote site is a nexthop object, not a device: it has been designed
  to scale.

- The common UDP tunnel code is used: its sockets, GRO cells, GSO, the
  dst cache of the encapsulation, and a zero UDP checksum unless the
  encapsulation asks for one.

Note: a LISP driver was posted to netdev back to 2014 and was not
merged. It had a device per remote RLOC and IPv4 RLOCs only, and a
map-cache that traffic fills was not accepted.
lwtunnels is an alternative.

This design shall allow routing daemons like FRRouting to support LISP.

Patches:
- patch 1 adds the driver, drivers/net/lisp.c, and its link attributes
- patch 2 describes them in the rt-link netlink spec
- patch 3 adds Documentation/networking/lisp.rst
- patch 4 adds a selftest, lisp.sh
- patch 5 adds a scale selftest, lisp_scale.sh

The series only adds: no existing code path is changed.

The lisp support of iproute2 is a separate series, for
iproute2-next. The tests are skipped without it:

  https://lore.kernel.org/all/20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr/

---
Changes in v2, based on CI's checks:
- 1/5: fix to 80 columns
- 4/5, 5/5: fix shellcheck report
- 4/5, 5/5: wrap the lines to 80 columns
- Cc recent contributors of rt-link.yaml

Changes in v2, based on Sashiko's review:
- 1/5: link an instance device again only after an RCU grace period
  since it left its chain (lisp_stop(), lisp_open())
- 1/5: fix build without CONFIG_IPV6
- 3/5: device with an instance ID that is down leaves its packets to
  the device that collects metadata
- 3/5: rp_filter is the larger of the value of "all" and of the device,
  ip6tables rpfilter or the nftables fib expression for IPv6
- 4/5: flush the path MTU of the host on each pass of mtu_test()
- 5/5: churn_test() improvements
- Link to v1: https://lore.kernel.org/r/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr

---
Vincent Jardin (5):
      lisp: add LISP (Locator/ID Separation Protocol)
      netlink: specs: rt-link: add the lisp link type
      docs: net: document the LISP devices
      selftests: net: add a test of the LISP devices
      selftests: net: add a scale test for LISP

 Documentation/netlink/specs/rt-link.yaml  |   35 +
 Documentation/networking/index.rst        |    1 +
 Documentation/networking/lisp.rst         |  159 ++++
 MAINTAINERS                               |    8 +
 drivers/net/Kconfig                       |   20 +
 drivers/net/Makefile                      |    1 +
 drivers/net/lisp.c                        | 1040 ++++++++++++++++++++++++++
 include/uapi/linux/if_link.h              |   12 +
 tools/testing/selftests/net/Makefile      |    2 +
 tools/testing/selftests/net/config        |    4 +
 tools/testing/selftests/net/lisp.sh       | 1139 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/lisp_scale.sh |  542 ++++++++++++++
 12 files changed, 2963 insertions(+)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261126-for-upstream-lisp-v1-b47ac698d026

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


