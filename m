Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795729047;
	b=BGE22nd9zpedekSOc10oKRxlWlSqEzLygnkHMAwQr4aIArLHQlu7fGHNrGpug5jKZLde
	 wgpsM0cg165LwTLJ8xM6zwmPWdJVXTNbH5yUWZZ8PrbFtO+GXZ6BKad46z057lw7MPxWb
	 lYYYj9YF+47zyllENNxznwDJiorhd3UVUdEL6VoyqXccYRZgkWN9cPoUShPoIuMP5fsoi
	 3hhSjlUYAclOTta93P+w2EPjZqFV97C4ii/cd24B7KAqAIX6LeVi1pDWkhUWjY2prgfvS
	 3ZIO4Jx44Sa4hZy6DJyY87l+Z7TDF85T5UEroWiCzFj+3lvhTdFxf1dhDYYPsFp0tZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729047;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Frrpmt9Frh7saY4HcM/wYUziuVBVS9OY6PdH+N78cEo=;
	b=LPvlLRwoQi5q/+AnNMcbiPzNGuyullYxSDOqBdk9qIz28wpQF1ogOlg75fMVq902qm6+
	 O4zsRYM69PsLy2H/hxlB9GSN8L1+C1jIiR+4vw7UR7CD+4BfplbplfyHC/O+c8VEwutct
	 uhoKYMgjU09W+4R90uVyzVw0TDiZ2HYk190BxwUuSG3uU/1d828/rnG9JX52aPiLothgi
	 P02JKp6x2JQc0lEfZ0IK6qadkaUvocwo9HGIn9m2xVbtdyU16B68BI3xFacOkFMhPvH9Q
	 emC2MzWPg+aO5eVxmHlyp1cuhneeAEPI1atVthEqW3auU14FFNu6BZADb3zzA44zVcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpny7Gt9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D428C606A337;
	Thu, 26 Nov 2026 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpny7Gt9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795729047;
	b=BOjT9TEhTyG8TqgE8nOAoVhgYIuWm5TnEFnacA6rcwJsMyLNJnm6ssqE5XHEZv/qHdmR
	 gMZKfNS8vZeS1x6xkyVmSS6u1RfzkxRD9hvwDJXQkKZWBO4JIFB7bN3G2mm34Hi691DGr
	 5QzHdqiyKReuzmR1vGRKmwFP5bR8PuQrDAl6UVY8SxSD0DnaPq9zYOQRhuIXX0uB+FLwq
	 0fsphlupRFmEZo9JFhMs03dVv84F2UlEn14nqy3JnHo0IkK0EDV5hR8t1T5TJsHGtH6aU
	 aoD786MkqNAOrDf3a61/uFA7Srt3Ygkb6KxZHDzZX4oHP3rXdkJSmhsGpMfMdi4Lz7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795729047;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Frrpmt9Frh7saY4HcM/wYUziuVBVS9OY6PdH+N78cEo=;
	b=0WBmt4SoQAwmu3KrEAODsqTzaY3Jp8nvnQoXOpofy/6fhxcHM1fs8FVaPVisVvQDTuFB
	 OiE7yKerjmwHpGQwwwNPyxI4L3ETiXF6q/FKM22E1UDMKYb80vA2AiuKviaX5oxufZzJA
	 kangKRgB8x1103mJcdicON5MnWe/QiKliAKmovFeMvaHUD3BjZAWKWR8U/ECEkynf7Blr
	 JMsmox0sEpVUJuLsydPJHqdALiNxtPwSxpjKIy/1a6ESaPH1e3Zwc6nc+zzAttib9kgHh
	 DRlgPQYyyuiie4NtbZUu7Jbz742RF554wvYIRD7yt4DILdwPXcnudPKHod56kLBcjTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 170271F00898;
	Thu, 26 Nov 2026 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729047;
	bh=Frrpmt9Frh7saY4HcM/wYUziuVBVS9OY6PdH+N78cEo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jpny7Gt9FYUDCoBOFW8/p5YTvdyj51QklqrLaSa/F/xbuuixkdAvHV+y2VKPm3fFI
	 UHlwoL0ql46Sx2cnWeN0Dy+Esqp59U0OdH1K1aVrxHoQivkz4+kEUzrnTAz0Mqv+LG
	 C4irtNIy30AzVF1sZhdbPoIgOFeJFfP3vo+J8hxK0wQpQ4GFqQCQXHhMdpjl2jIpWL
	 41PTLqfahmxT/36xC7Uia8rpSzmWb6xx4/6ydcvawkuUgp0ugdUO1ckstRaHshDiQZ
	 nOJvK4p5zChhxwMTvGEAa0nUOgGSUGexAQ5veqvOxp1ID/8cX3wRd6wfdAhrw/Dvw+
	 FqG2Nv7hY67uQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6781B4D82F;
	Thu, 26 Nov 2026 21:37:16 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH net-next 0/5] lisp: add a LISP (RFC 9300) tunnel device
Date: Thu, 26 Nov 2026 22:37:04 +0100
Message-Id: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
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
X-B4-Tracking: v=1; b=H4sIAICmCGsC/x2MQQqDMBAAvyJ77oIJJdp+pfSQmlUXbAy7UYTg3
 w0eB2amgJIwKbybAkI7K6+xgnk0MMw+ToQcKoNtrTPGOhxXwS1pFvJ/XFgT7gZ/z84P7tWHakF
 Nk9DIx739QKSMkY4M3/O8AEtU/yBwAAAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vincent Jardin <vjardin@free.fr>, Donald Hunter <donald.hunter@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795729035; l=3481;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=NKolxtikCstceD+jyXEOgupH0HhqnVVIHJ417FOpTs4=;
 b=+Ft9jpIlKLpfjs1v54YzBP7BQLvX8sO+Ewar2F9zV66xB76vMYl28WYK4KL1yXDNWQ5bPXqzl
 7EVwAdQAeXTD1lLY3DOyky8Sl+fgnXm/BkKO/MTa6ZMKyNacB1ViVaL
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

The lisp link type of iproute2 comes as a separate series, for
iproute2-next. Tests are skipped without it. Tell me if you want
iproute2 series too for a simultaneous review.

---
Vincent Jardin (5):
      lisp: add LISP (Locator/ID Separation Protocol)
      netlink: specs: rt-link: add the lisp link type
      docs: net: document the LISP devices
      selftests: net: add a test of the LISP devices
      selftests: net: add a scale test for LISP

 Documentation/netlink/specs/rt-link.yaml  |   35 +
 Documentation/networking/index.rst        |    1 +
 Documentation/networking/lisp.rst         |  142 ++++
 MAINTAINERS                               |    8 +
 drivers/net/Kconfig                       |   20 +
 drivers/net/Makefile                      |    1 +
 drivers/net/lisp.c                        | 1033 ++++++++++++++++++++++++++
 include/uapi/linux/if_link.h              |   12 +
 tools/testing/selftests/net/Makefile      |    2 +
 tools/testing/selftests/net/config        |    4 +
 tools/testing/selftests/net/lisp.sh       | 1120 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/lisp_scale.sh |  532 ++++++++++++++
 12 files changed, 2910 insertions(+)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261126-for-upstream-lisp-v1-b47ac698d026

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


