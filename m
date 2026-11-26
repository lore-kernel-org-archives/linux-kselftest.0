Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795729053;
	b=VN/TgVbkjwNWMhwTAbuWzNC3H+0DujWc6pd45eHNlHga+TnJwaJmWPgAlPXgNgK1mcQ5
	 iyTjW5MKpXgiDUOl609xoE9A9YosUgsORt8NK2d59a3DSKid6szFWDX2xBvBbHFSxcF78
	 OehuY7G8BuFFWOi9oYwaFOifZxVy7oEKwpka0nuxQdQswaDlbTMtU0zfln5VCZroytI2L
	 +2wfQSob0jZZTceyNSyvqMeH4anCztuk40F3zIFlAQHBdWoB4ssLVql0b+nyRsoE9wvov
	 Dwhlpuxu7zeyau73LbqGcCmra50/rf2BR0FYqoYzjlr0Lk7zhHJboQmg1fV/idzRGlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729053;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W85kgmeyKNXZHyHmS/DH498Z19w4sXd2GFZf6/xXa1w=;
	b=evWYwSK15J33IN9lDanLuhTVUNwCE2mSXf1cp6MdbSWtA+uIlZVuhqXjK75Eee/Tw1z2
	 66Q82WClIn83mi9eHk2zg3ZTE4+0YhBZaAMUz3eXuXplCJ+IoImS5CX1FEObM9Yu5b8Ya
	 /ulwhtT0CWAty78ghOtlcPVNq3a6JS5EpRAfGE+ULyoLWHWtQ0z4BV2a4aVRS1yKG4XBn
	 L4rKXzVBZTgZtmUgvCxy4A86VRd1dvKNgOknyJ7QYYa2jhfTUAxXF6wUmX6+O+1Uz8R/g
	 02pYRB5ATSjNTWl/jq+6gijYtiTwgJpTGc2EDkDCUeAULreKvwlQrO58wGx51AIn7gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhOJuXeE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E54606A6AF;
	Thu, 26 Nov 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhOJuXeE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795729052;
	b=ylpyVJKlczdd5BgXluCZH1S7w7QlQvhP4BKsP6Pe4ZySmbZL+di9UNPuiSl6Z6N7bsiA
	 dddoIxvBFp8tpNopHOA1QBFhDBOTfU1Xu1BnM7yJ83HpgBqJbxjImsKptAeEfi5ITDluR
	 ZpU5R3BdUapsr/4XqaFxTkNFdmBcm18NGd39tpe/19N+5F21GjIzvC+ps10TbT4wdKn6i
	 OijH+cPzZ9FpIyZIHpnwofJqZAB4CSuEf3Sh9Sg5mfohFZMX9jcs/xLN62P/etPZR343R
	 Jbix3m8O9bjVVxLT0Fy7wi9ZYjJHnmBguWuXv9T80dhXQYq06UqwmK1TyCumCh3hkeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795729052;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W85kgmeyKNXZHyHmS/DH498Z19w4sXd2GFZf6/xXa1w=;
	b=FzZ3+rDjmj5pfHzRz5Fz6IOghabu07dAgXmrJHAv70YDXUmEbTaT1Bn07/kST1/6CpzV
	 p4ozA/6HMgcpnr2nTIQMK9ayv0mYyuDPWT93kytPXC21yFspFAautV6xHcLv+8uDwH9R9
	 byPZu+szMduO48n6KJrl+QIGRUC0ILdeSnqhJl5GVLoapvwMVfhmAFeKnVgknme7HJ4lC
	 tqIYM9khvXpEfQfcpelMkmX14iqTuVXC6vQz7PsV0FtBW4h20VqoBJfOx0otlQ35LZyZF
	 BDVZBHZVQpboZpNwo1P17g3j3LGWUB27QFbxVCChuWSzscBLgItdf6pfKaa+JiaJOMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C8131F00896;
	Thu, 26 Nov 2026 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729052;
	bh=W85kgmeyKNXZHyHmS/DH498Z19w4sXd2GFZf6/xXa1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MhOJuXeEJt7dRpMgQvVDzdX16p9gy5ao7yrfXLOilEXzsvAjeRTAKDGykASPNrhS/
	 2zah1WG34JAU/pU+xuAeF1jYZzkh53x0CZ8CaZHazTnWENWCMn2MpcBwFvSgijMoso
	 b38R8G4u96Za4bHFoMtm3dq87+BqPpGPQ2okTbzIvQ/c4K3snhFztkOKx9DqbjFwOj
	 EXWck+EtxJJdwgBJ00IXJdm0VKDsCfi45b360cXH92ltVGgFuxjFyvyC6QM1Vp8wTI
	 9Av2vRNG5riQaM/arf2GLUACEjYRnkmMdvHvWU2xgegS4cNosbppnqHkVS2fsRbAqG
	 ccEjzVjNtQJAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D9C1E4D837;
	Thu, 26 Nov 2026 21:37:16 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Thu, 26 Nov 2026 22:37:07 +0100
Subject: [PATCH net-next 3/5] docs: net: document the LISP devices
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
Message-Id: <20261126-for-upstream-lisp-v1-v1-3-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795729035; l=8502;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=zcSRy+NH7TvupDcrViIJxW5y0i54HginrB+0uwkX2lc=;
 b=e4fvefGByD8diJKAT833gw8JGO18FQETZ2u+MgGgA5BBq17Cgz/hGRxDU6koCA+MPKrPhdo1I
 r6n7nVjTffEDQ14zSkl6xITwgcUNJVM0YbJbLq6YB6h5qyH3Gn9zEuw
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

Describe the LISP devices, how the routes and the nexthops
give the RLOCs and what checks the sources of the packets that a
device decapsulates.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/lisp.rst  | 142 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                        |   1 +
 drivers/net/Kconfig                |   3 +-
 4 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b055..f2bc062f80d80 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -69,6 +69,7 @@ Contents:
    kcm
    l2tp
    lapb-module
+   lisp
    mac80211-injection
    mctp
    mpls-sysctl
diff --git a/Documentation/networking/lisp.rst b/Documentation/networking/lisp.rst
new file mode 100644
index 0000000000000..70ad8bb29700b
--- /dev/null
+++ b/Documentation/networking/lisp.rst
@@ -0,0 +1,142 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. Copyright (c) 2026 Vincent Jardin <vjardin@free.fr>, Free Mobile
+
+=============================================
+Locator/ID Separation Protocol (LISP) devices
+=============================================
+
+LISP separates the addresses of the hosts, the endpoint identifiers (EIDs),
+from the addresses of the routers that the hosts are reachable through, the
+routing locators (RLOCs). A LISP router, an xTR, carries the packets that are
+sent to a remote EID over UDP to an RLOC of the site of that EID (:rfc:`9300`).
+
+A LISP device is the data plane of an xTR. It encapsulates IPv4 and IPv6
+packets in a LISP header, UDP port 4341, and an IPv4 or IPv6 header, and it
+decapsulates what it receives. The family of the RLOCs is independent from the
+family of the EIDs.
+
+The kernel has no LISP control plane and no map-cache: the association of an
+EID prefix with its RLOCs, a mapping, is a route. Its nexthop gives the RLOC as
+a lightweight tunnel encapsulation, ``encap ip`` for an IPv4 RLOC and ``encap
+ip6`` for an IPv6 one, and has the LISP device as output device. The routes are
+configured, or installed by a LISP control plane in user space (:rfc:`9301`)
+as any routing daemon does. A packet whose destination has no route with an
+RLOC is not resolved by the kernel.
+
+Devices
+=======
+
+There are two kinds of LISP devices.
+
+A device (1) with an instance ID sends and receives the packets of that instance::
+
+  ip link add site type vrf table 10
+  ip link set site up
+  ip link add lisp101 type lisp id 101
+  ip link set lisp101 master site up
+
+It is meant to be in the VRF of the EIDs of the instance: what it receives is
+routed in that VRF, and the routes of that VRF send to it. A site has one
+device per instance, whatever the number of remote sites.
+
+A device (2) that collects metadata serves all the instance IDs that have no device
+of their own::
+
+  ip link add lisp0 type lisp external
+
+The instance ID then comes with the RLOC, as the ``id`` of the encapsulation
+of the nexthop. The packets that the device receives have it in their tunnel
+metadata, where a routing rule (``ip rule add tun_id``), a traffic control
+filter or a BPF program finds it.
+
+Both kinds take the RLOC from the tunnel metadata of the packet. A packet
+without metadata, sent by a route that has no encapsulation, is dropped and
+counted as a transmit error.
+
+``id IID``
+  The instance ID, from 0 to 16777215. The header of the packets of the
+  instance 0 has no instance ID, and a packet without instance ID is received
+  by the instance 0.
+
+``external``
+  The device collects metadata.
+
+``local ADDR``
+  The source address of the packets that are sent to an RLOC of the same
+  family, a local RLOC. It can be given once per family. A source address in
+  the encapsulation of the nexthop is used instead. Without either, the route
+  to the RLOC gives the source address.
+
+``link DEVICE``
+  A generic option of ``ip link add``, before ``type lisp``. The packets are
+  sent to the RLOCs through ``DEVICE``: by the routes of a VRF when it is a
+  VRF device, by its own routes otherwise. The LISP device receives what
+  comes from the VRF that ``DEVICE`` is, or is in. Without link, or with a
+  link that is in no VRF, the RLOCs are in the main table. The LISP device is
+  removed with ``DEVICE``::
+
+    ip link add link wan name lisp101 type lisp id 101 local 192.0.2.1
+
+The devices that have the same VRF of RLOCs share their UDP sockets, one per
+address family. The sockets are in the network namespace of ``DEVICE``: the
+one that the LISP device is created from, unless ``link-netns`` names another
+one, which the LISP device is then removed with. An instance ID is used once
+per VRF of RLOCs, and one device collects its metadata. The sockets of a VRF
+and those of the main table cannot coexist: the RLOCs of a network namespace
+are either in VRFs or in the main table.
+
+Mappings
+========
+
+The RLOC of an EID prefix is a nexthop, shared by the prefixes of the same
+site, or a group of nexthops for the RLOCs that share the traffic::
+
+  ip -6 nexthop add id 1 encap ip dst 192.0.2.1 dev lisp101
+  ip -6 nexthop add id 2 encap ip6 dst 2001:db8::1 dev lisp101
+  ip nexthop add id 3 group 1,3/2,1
+
+  ip route add 10.1.0.0/16 vrf site nhid 1
+  ip -6 route add 2001:db8:1::/48 vrf site nhid 3
+
+An IPv6 nexthop is used by IPv4 and IPv6 routes. With the device that
+collects metadata, the nexthop gives the instance ID too::
+
+  ip -6 nexthop add id 4 encap ip id 102 dst 192.0.2.1 dev lisp0
+
+A route can carry the encapsulation itself, without nexthop object. This does
+not scale with the number of RLOCs: the routes that only differ by their
+encapsulation are compared with each other when one is added.
+
+A group counts the packets that it forwards to each of its nexthops
+(``ip -s nexthop``).
+
+A nexthop is removed with its routes when the device goes down.
+
+Checking the IP sources
+=======================
+
+The device decapsulates what comes for its instance ID, from any RLOC: it
+does not check the source of a packet. What the kernel has for any device
+applies to it.
+
+The reverse path filter of IPv4 checks the source EID. With ``rp_filter`` set
+to 1 for the LISP device, a packet is dropped unless the route to its source
+sends to that device, that is, unless its source has a mapping in that
+instance. The packets that it drops are counted as ``IPReversePathFilter``::
+
+  sysctl -w net.ipv4.conf.lisp101.rp_filter=1
+
+It does not look at the RLOC that a packet comes from. With mappings that user
+space installs when packets need them, it drops what a site sends until the
+mapping of that site is there.
+
+The packets that a device that collects metadata receives have the RLOC that
+they come from and their instance ID in their tunnel metadata, which a traffic
+control filter matches with the source EID. These filters accept an EID
+prefix from the RLOC of its site and drop what else the device receives,
+which the last one counts::
+
+  tc qdisc add dev lisp0 clsact
+  tc filter add dev lisp0 ingress protocol ip pref 10 flower \
+      enc_key_id 102 enc_src_ip 192.0.2.1 src_ip 10.1.0.0/16 action pass
+  tc filter add dev lisp0 ingress pref 100 matchall action drop
diff --git a/MAINTAINERS b/MAINTAINERS
index 6b62bc1f45bae..addedadf43446 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15510,6 +15510,7 @@ LISP DATA PLANE DRIVER
 M:	Vincent Jardin <vjardin@free.fr>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/networking/lisp.rst
 F:	drivers/net/lisp.c
 
 LIST KUNIT TEST
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index aa78fd48e77a9..6201f5046422b 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -280,7 +280,8 @@ config LISP
 	  (LISP, RFC 9300): a tunnel device that carries the IPv4 and IPv6
 	  packets of an instance ID over UDP, to the routing locator (RLOC)
 	  that the route or the nexthop of their destination gives as a
-	  lightweight tunnel encapsulation.
+	  lightweight tunnel encapsulation. See
+	  Documentation/networking/lisp.rst.
 
 	  The mappings of the destinations to the RLOCs come from user space,
 	  from a LISP control plane or from the configuration.

-- 
2.43.0


