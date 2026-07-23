Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574E4334B8;
	Thu, 23 Jul 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809439; cv=none; b=F6ZicSOeXVzhEljq3JOC4o4c4NRgMF5WYQoFSCoHSbCspE9scR37a6x9p6r2MzsYvNmld8UToJeCYwBdPNb1qXfWMIFC0K3L1A+haZ5mxuSIZv5/Nl0ad9D76ydcsAnnE5wUUAcPMjO6STr8XKScAG/Sllt8J+EJiEGelL1V0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809439; c=relaxed/simple;
	bh=uOxVZ8RQnUD/RzQJrLgyc0MIJUp6uGhe/avoeZKDYfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDayRFglO3MSgxhHlAufdjlFU6edFoy3DiPs+pZp44clYz1T9KRrZOFBNHdeoANZJN+0eRK8bDj2tVF617rd7R4qX8AZ8wqsCgS5JNTdWHJDFoZm+KMJtbCqa0/bl+s425VpXn4XPh4DziibC5m4cafQ2OM0uz0N93uoG73PCt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsSv-00000003Wpj-13Yu;
	Thu, 23 Jul 2026 14:23:53 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRS-00000000Q20-1MRx;
	Thu, 23 Jul 2026 14:22:22 +0200
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
Subject: [PATCH net-next v2 06/10] net/ipv6: flip IPV6_SUBTREES default to Y
Date: Thu, 23 Jul 2026 14:19:32 +0200
Message-ID: <20260723122106.99772-7-equinox@diac24.net>
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

It's needed for RFC6724 rule 5.5, which as it turns out is more
important than was initially discernible.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 net/ipv6/Kconfig | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/Kconfig b/net/ipv6/Kconfig
index c3806c6ac96f..39659e9b53a3 100644
--- a/net/ipv6/Kconfig
+++ b/net/ipv6/Kconfig
@@ -243,16 +243,26 @@ config IPV6_MULTIPLE_TABLES
 config IPV6_SUBTREES
 	bool "IPv6: source address based routing"
 	depends on IPV6_MULTIPLE_TABLES
+	default y
 	help
 	  Enable routing by source address or prefix.
 
 	  The destination address is still the primary routing key, so mixing
 	  normal and source prefix specific routes in the same routing table
-	  may sometimes lead to unintended routing behavior.  This can be
-	  avoided by defining different routing tables for the normal and
-	  source prefix specific routes.
+	  may sometimes lead to unintended routing behavior if the order of
+	  lookups is misunderstood.  To achieve full separation based on source
+	  address, different routing tables should be defined for each source
+	  prefix.
 
-	  If unsure, say N.
+	  Subtrees specifically address scenarios where local connectivity
+	  between source prefixes is shared and unrestricted, but some
+	  destinations (e.g. the default route) have more fine-grained rules.
+
+	  This feature is required to correctly support RFC6724 rule 5.5 in
+	  source address selection.  Rule 5.5 is a necessity for good
+	  multihoming, renumbering and source prefix liveliness checks.
+
+	  If unsure, say Y.
 
 config IPV6_MROUTE
 	bool "IPv6: multicast routing"
-- 
2.53.0

