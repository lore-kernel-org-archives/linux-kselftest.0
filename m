Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5E472F9B;
	Thu, 23 Jul 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809423; cv=none; b=L9lOAaWYyAgBeWc5+2sI2TyGJhEAJ3dO4JcForMEz/vFTRmfBjxbuxcFrTZ/8OG9WFmjheONGrgzd8bWA1qUiSTzbs7pZvEFHHAAFQeYpovzvq9I0BaWsqcdycMc/fn+JwLwVFn6elIiSWCmFArUpqr0pLeiVD/j+lIYTpRclos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809423; c=relaxed/simple;
	bh=5AjBXosZc4WzKSv5q+/wYYnUg/vqbQ3J3hXGKivAC9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5BOcWPYKBilUZrAHmpGASNg5q0CE9Cynmr4QBzWqqG5GjKBGLj3DSYVLaPUCGcnQtDPQALJpaTlFbKBJgrNXx8JqkNZej+n3gqsK+SvxVE6la8q+XK6cw+lzufZCySXh6/waZKTnxy9VZ2g6CbyMIDZJEoVeO32ocAlXf1ZJBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsSe-00000003Wpj-46Ap;
	Thu, 23 Jul 2026 14:23:36 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRe-00000000Q2Y-0J4P;
	Thu, 23 Jul 2026 14:22:34 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH net-next v2 10/10] net: document RFC6724 rule 5.5 implementation
Date: Thu, 23 Jul 2026 14:19:36 +0200
Message-ID: <20260723122106.99772-11-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFC6724 rule 5.5 is anything but obvious, especially if trying to do it
well.  (RFC8028 and its errata kinda proves the point.)

This documents what exactly the Linux kernel does for RFC6724 rule 5.5,
especially what the routing table needs to look like for it to work.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 Documentation/networking/ipv6-addrsel.rst | 73 +++++++++++++++++++++++
 Documentation/networking/ipv6.rst         |  2 +
 MAINTAINERS                               |  1 +
 3 files changed, 76 insertions(+)
 create mode 100644 Documentation/networking/ipv6-addrsel.rst

diff --git a/Documentation/networking/ipv6-addrsel.rst b/Documentation/networking/ipv6-addrsel.rst
new file mode 100644
index 000000000000..bfb385796556
--- /dev/null
+++ b/Documentation/networking/ipv6-addrsel.rst
@@ -0,0 +1,73 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+RFC6724 (IPv6 source address selection) rule 5.5 support
+========================================================
+
+RFC6724 rule 5.5 is a very short paragraph in a complex RFC that has turned
+out quite tricky, but also immensely useful in multihoming scenarios.  For
+reference, it says:
+
+::
+
+   Rule 5.5: Prefer addresses in a prefix advertised by the next-hop.
+   If SA or SA's prefix is assigned by the selected next-hop that will
+   be used to send to D and SB or SB's prefix is assigned by a different
+   next-hop, then prefer SA.  Similarly, if SB or SB's prefix is
+   assigned by the next-hop that will be used to send to D and SA or
+   SA's prefix is assigned by a different next-hop, then prefer SB.
+
+The way this works on Linux is as follows:
+
+- prior to any source address selection happening, when receiving a RA, more
+  than the installation of a default route (or ::/128 route) needs to happen:
+  for each PIO, a source-specific (subtree) route is *additionally* installed.
+  The effect of this is that *after* a source address has been selected, one
+  of the routers that advertised it will remain in use (this is *not* RFC 6724
+  related, but rather RFC 8028.)  At the same time, these extra routes serve
+  to remember which router advertised what.  Note the kernel RA handling code
+  does not currently install the needed subtree routes (cf. below).
+
+- per usual, a route lookup for the IPv6 destination address in consideration
+  is done first.  This is passed around in kernel as a dst_entry.
+
+- the source address selection code iterates through the various rules in
+  RFC 6724.
+
+- if/when rule 5.5 is reached, first of all, there is a check if *any* source
+  specific routes exist in the routing table.  If there are none, the entire
+  code for 5.5 is skipped because it cannot have any effect, but is not free
+  to execute (can involve multiple routing lookups.)  **In applications that
+  use a lot of unbound (e.g. UDP) sockets, installing subtree routes should
+  therefore be avoided to not incur this cost on each source address selection
+  pass.**  Alternatively, applications should bind their sockets to a specific
+  source address such that the selection code is never hit.
+
+- if subtree routes do exist, the source address selection code now repeats
+  the routing lookup done before source address selection is entered, except
+  with the source address under consideration filled in.  This lookup will hit
+  the subtree routes that were installed (see first item), giving a fresh
+  dst_entry.  If the new dst_entry matches the original dst_entry, that means
+  the original router has in fact sent RAs with PIOs for this source address,
+  so it is preferred.  Otherwise it is not.
+
+
+There are a few caveats to consider:
+
+- the kernel currently does not create the subtree routes mentioned in the
+  first item.  This is a separate work item.  At the time of writing of this
+  document, some partial/experimental code was done but deferred.  But this can
+  equally well be performed in userspace processing of RAs, e.g. NetworkManager
+  or plain static configuration.  If RA handling is taken over by a userspace
+  component, it needs to happen there in any case.
+
+- since addresses can also be acquired from DHCPv6, even RA/PIO combinations
+  that didn't result in the creation of any addresses (e.g. A=0) should have
+  subtree routes added.  Those routes *may* be relevant for DHCPv6-generated
+  addresses.
+
+- the "announce check" lookup does not backtrack.  Only the destination prefix
+  that provided the "unspecific" (::/128) match is checked for source prefixes
+  to see what routers advertised what.  This means that for e.g. RIOs, subtree
+  routes also have to be created.  (Backtracking for this case would further
+  increase the cost of source address selection, for a pretty rare situation
+  that has an easy fix/workaround.)
diff --git a/Documentation/networking/ipv6.rst b/Documentation/networking/ipv6.rst
index ba09c2f2dcc7..6a50386ae36e 100644
--- a/Documentation/networking/ipv6.rst
+++ b/Documentation/networking/ipv6.rst
@@ -76,3 +76,5 @@ disable_ipv6
 
 		No IPv6 addresses will be added to interfaces.
 
+
+.. include:: ipv6-addrsel.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 3fb962e917c2..f9e15b3bf939 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18929,6 +18929,7 @@ F:	Documentation/netlink/specs/rt-addr.yaml
 F:	Documentation/netlink/specs/rt-neigh.yaml
 F:	Documentation/netlink/specs/rt-route.yaml
 F:	Documentation/netlink/specs/rt-rule.yaml
+F:	Documentation/networking/ipv6-addrsel.rst
 F:	include/linux/inetdevice.h
 F:	include/linux/mroute*
 F:	include/net/addrconf.h
-- 
2.53.0

