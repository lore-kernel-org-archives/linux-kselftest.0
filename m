Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795826516;
	b=INmzPIt5UOPrDr2xiJGVbM8dBZJ1lBR6PaNbP/ODBWm+9W7pTj3C0IEck5gHAmOm1K+A
	 ydwrlt+lsmXD0UGXqMyCbmA3q4Cc+C39kjg0tIOqU9iva03/JiSG32vMYft274l3DX7Ju
	 QsaQzbqEcV6C585RPdpEEr7psOCXULzAwwLDSOfHKIKLc2W/7jLbC9ZvNX1/UaVAQHVD9
	 Hwq/SxxFNgb7kS53UJuKqskb2hdyH2LI6hmkKlR4ALKL7yppYGJq6iqhiCDTrnr0gG0s4
	 Tka1mWftmPNX1gh/ajDnqj1mHc0qkK+qK2efXZrDpA9CSvXwa++xyb4gTiyq0J2AH8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826516;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S9CnuD4WQSQFLyYjLuWuOQZ+RY+7TYuzX1XA+3+jbm4=;
	b=IwN+dKNe+1qHA+4ZL8ierWhr0lkhUqfdEvNQTNmGq3xpaoI4dfL6xMyQjAS14cuUb3X0
	 /k+jwi3PWVGwgnMIPmAKlUhw1lHpcL7dD7UdLcR+By1N+LEd0UP7FX8WMk3Ygk72vXGV2
	 UmiVAm6Jo2Q45jaaA6Rzqw5XY/cN8MM3Wo5gBe29e6xyM72Q13vlZ4G1mopzQpnZ7L+ib
	 NnPRs2a5bTGprFdfLjb2aIu8J5mGJgUXS5y9Fz+S13/nPCa6OVbl1VSGi8ZoD4+eTvl0l
	 JWQxE6TrEzKdR53CULlYKRC3Bv/eONDTOU/ieSFLM/qzfAml/8P8Sw51bGkAfDW1Wuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kc3WH1Dg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F1606A338;
	Sat, 28 Nov 2026 00:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kc3WH1Dg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795826516;
	b=fXSX0NxsDQ9Bi2BbL5j5ptc6y5IamXd4r33NWhIJ1XTmzb5OdTz2v8616ukeMVJVIGbl
	 N8uh2NEhFHdBQL7R6x9YKSJkVktJdso+E+c8SCo5YaEiURNSJ0nQg5I9piwQ4RQhQeYjQ
	 SkziQayMOSVUAVl+9IIq18OQ4np3saGi5cq61uvj7tNPD3GUe3O2a7fUFqZQKzy29N4NG
	 WRhFUxsFOKKsR/2KHu38Gx5sGE+4MEj/8tkUTCFSW3Qx+zLpMt4fh4bQEuqkLsOIcdlKI
	 wSO0MK3dGgbJRADjLGAgBpA/bT4B90QGQv9OiavRyR6FXEQu2JOdYTiBGrw/lDCaJYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795826516;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S9CnuD4WQSQFLyYjLuWuOQZ+RY+7TYuzX1XA+3+jbm4=;
	b=ZtjofUCVx4FXH1sxLwf3AqFkkNbxOmbeOORPDJCSt+9rNfKxZZ/XYuVdWEFgxsS0/WIs
	 fFEDWAWrHOcljF/xB+42q9TXdQy0KuoDhB5KOgkx7ltcRd1kvMjF3+3F5WlV2EDUK2bG0
	 gjpjgpugLaPAHx7FCZWIgvBXYTwbknVfF8gzMQ2cqBZQBALRqcGMTXuVIOKTkEHjxa6lV
	 gYFECNgbdJvYK3RIX5IhjI6SmQRWmx8Nb9NRu2hdxpAzC0qeyEpSB/lmyXo5NNYiEXfSE
	 fzyQb0/MdQaiUVdMH+uOLEaVhDL+fCAdpKjJw0y9YuYeuT3K7QtDuk6ZDSpW2LREh9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 301321F000C1;
	Sat, 28 Nov 2026 00:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795826516;
	bh=S9CnuD4WQSQFLyYjLuWuOQZ+RY+7TYuzX1XA+3+jbm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kc3WH1DgEd/gB0NxHdfyG+zmxjtT7orcODLuR14hsD70n+95Y/oZSsYa9pojTimnz
	 Ut1yvOlFpDeSgOWc0cA37n6asdmGBJSg4xONiw31StJQpFBpp8WG1UHQBWTMfLbpJq
	 lNkIj1OhmokUUv1NUF6yQUfYyFMkWh/b9siFMlPw46M3chxGjbkFHio33MaAUDIlbn
	 NfI4wjhF/sF459Httknzt0/mMpKIKBQupQcApidocVhwxIQbUllsS70JBZq0yr6UXH
	 bZBGPeQu4JRT3ZsAGugncP6/amG5kBRBkelm2vR9OGaZIWH562A2XjEORiu8BVwQD8
	 ZDK0AImSd9fzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B11AB4DED1;
	Sat, 28 Nov 2026 00:41:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sat, 28 Nov 2026 01:41:35 +0100
Subject: [PATCH net-next v2 3/5] docs: net: document the LISP devices
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
Message-Id: <20261128-for-upstream-lisp-v1-v2-3-68e8649c3ed2@free.fr>
References: <20261128-for-upstream-lisp-v1-v2-0-68e8649c3ed2@free.fr>
In-Reply-To: <20261128-for-upstream-lisp-v1-v2-0-68e8649c3ed2@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795826502; l=9280;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=8e5RbI6cVe0qnP19u1JfP5nfVOjyBFC4ratoywdAAc4=;
 b=Ldijmsnm2+sdHaV5pRkcLDlT1z+vm3ygA0TO4GDEH85Ncl/ykLOwNJd27+BlJ8ykIEXd6g7sa
 dTgwmmiHoqdAvHvlaV6F1X9pEvS4RzIVptC3YjKbXMocAaYa1s28A22
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
 Documentation/networking/lisp.rst  | 159 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                        |   1 +
 drivers/net/Kconfig                |   3 +-
 4 files changed, 163 insertions(+), 1 deletion(-)

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
index 0000000000000..aae350cf04f77
--- /dev/null
+++ b/Documentation/networking/lisp.rst
@@ -0,0 +1,159 @@
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
+  ip link set lisp0 up
+
+The instance ID then comes with the RLOC, as the ``id`` of the encapsulation
+of the nexthop. The packets that the device receives have it in their tunnel
+metadata, where a routing rule (``ip rule add tun_id``), a traffic control
+filter or a BPF program finds it.
+
+A device with an instance ID takes the packets of its instance only while it
+is up: while it is down, they go to the device that collects metadata, if
+there is one.
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
+instance. The packets that it drops are counted as ``IPReversePathFilter``.
+The kernel uses the larger of the value of the device and of ``all``: with
+``all`` at 2, as some distributions set it, the check is the loose one, which
+accepts a source that has any route::
+
+  sysctl -w net.ipv4.conf.all.rp_filter=0
+  sysctl -w net.ipv4.conf.lisp101.rp_filter=1
+
+IPv6 has no ``rp_filter``: the ``rpfilter`` match of ip6tables, or the ``fib``
+expression of nftables, makes the same check::
+
+  ip6tables -t raw -A PREROUTING -i lisp101 -m rpfilter --invert -j DROP
+
+These checks do not look at the RLOC that a packet comes from. With mappings
+that user space installs when packets need them, they drop what a site sends
+until the mapping of that site is there.
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
+
+A device with an instance ID gives its packets no tunnel metadata: nothing
+checks the RLOC that they come from.
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


