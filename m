Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A7D47B437;
	Thu, 23 Jul 2026 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809330; cv=none; b=PzKZRddggHpXQPXXE48i9JSHurtB+/3OqF38/FwXNyRkEH/J98+/eJO8IyLHmAJXKptggVQazRlX6fbs5n3lT05HgFlKXaUAGi2IRveGOCutgASpRdkO+kOOYlu79qiRXve1B4s1Aw4SgCIWJSDrdBkIfJaqaW0ZtBne8YXUQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809330; c=relaxed/simple;
	bh=0aCETM3BlVRGNduO75AdqbYb3DYFUNrgggcAF/0c4Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVFlI6orr/usUTHRpRNv8EhOdAYGhEN9L2MMWKGmvrwYvmnbcyQRTFx7Ff8a21Z2hT2Or4XVF3cC4IJ/sXFhuW0H/Fkfz7Aqqj0r6xm+y+33cWokvLTzOXcH1e38+nNLWekJcAYTDfN19kwhs1ShRsorFeBWbUN3qHlRKd0C6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsR9-00000003WlM-0GlJ;
	Thu, 23 Jul 2026 14:22:03 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsQm-00000000Q0e-1SU1;
	Thu, 23 Jul 2026 14:21:40 +0200
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
Subject: [PATCH net-next v2 01/10] net/ipv6: fix lookup for ::/0 (non-)subtree route
Date: Thu, 23 Jul 2026 14:19:27 +0200
Message-ID: <20260723122106.99772-2-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assume a scenario with something like the following routes:
default via fe80::1 dev dummy0
2001:db8:1::/48 via fe80::10 dev dummy0
2001:db8:1::/48 from 2001:db8:1:2::/64 via fe80::12 dev dummy0

Now if a lookup happens for 2001:db8:1::2345, but with a source address
*not* covered by the third route, the expectation is to hit the second
one.  Unfortunately, this was broken since the code, on failing the
lookup in the subtree, didn't consider the node itself which the subtree
is attached to, i.e. route #2 above.

The fix is simple, check if the subtree is attached to a node that is
itself a valid route before backtracking to less specific destination
prefixes.

This case is somewhat rare for several reasons.  To begin with, subtree
routes are most commonly attached to the default destination.
Additionally, in the rare cases where a non-default destination prefix
is host to subtree routes, the fallback on not hitting any subtree route
is commonly a default route (or a subtree route on that).

(Note that this was working for the "::/0 from ::/0" case since the root
node is special-cased.  The issue was discovered during RFC 6724 rule
5.5 testing, trying to find edge cases.)

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
Cc: Lorenzo Colitti <lorenzo@google.com>
Cc: Maciej Żenczykowski <maze@google.com>
---
 net/ipv6/ip6_fib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index a130cdfaebfb..273f2bfc5286 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -1656,8 +1656,11 @@ static struct fib6_node *fib6_node_lookup_1(struct fib6_node *root,
 					struct fib6_node *sfn;
 					sfn = fib6_node_lookup_1(subtree,
 								 args + 1);
-					if (!sfn)
+					if (!sfn) {
+						if (fn->fn_flags & RTN_RTINFO)
+							return fn;
 						goto backtrack;
+					}
 					fn = sfn;
 				}
 #endif
-- 
2.53.0

