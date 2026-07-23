Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B947B437;
	Thu, 23 Jul 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809318; cv=none; b=CtxJvySZfxhScEcQm05Ej33wEVeWc6cJi4qHVNrsWmrynqLkJ7zpykpHkfFODPlE0kB1E3npxepvCCbWWDgNyQ+fzWR7anwXly2DzqEbh1+mInh2RNy5RgYiXf6vyTikK+YuTvLAcW8LyFMwuWVHCcHlY+nx8lU6QkwKYmjbNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809318; c=relaxed/simple;
	bh=WHI5cLVO5lQ8Q1PYlbWgfNiAy/jGa/p+sf1WRlvJEOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PLd7gHmNuGGuuDUaWFFOSKsJUKFxdgK/PwsNEgRaX4b44PKgGIN4yZQb5oRS2t72ejjvos2D44IuQBeEIwQ8JPpZA6Rs94EkbTFMIbz74YYp/e8QW4BpaKufQ1CBG3jIVjcPpCxvpi/n2Zs7rn/Dg22ZIYzT5aS0VpQ5aYwuXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsQk-00000003WkO-1NBS;
	Thu, 23 Jul 2026 14:21:38 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsQJ-00000000Pzk-3tEo;
	Thu, 23 Jul 2026 14:21:11 +0200
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/10] RFC 6724 rule 5.5 support
Date: Thu, 23 Jul 2026 14:19:26 +0200
Message-ID: <20260723122106.99772-1-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,


changes relative to previous version:

- ipv6_saddr_rule5p5() now makes a local copy of the flowi6; I was trying
  to avoid that but it's just an invitation for breakage.
- added check + WARN_ONCE on subtree routes w/ nexthop objects.  The kernel
  doesn't allow adding such routes, this is just a safety guard.
  (this probably fixes the false positive complaint by Sashiko, it's a
  reasonable safety guard to have independent of that.)
- new commit that does adds a comment about this on the kernel reject of
  subtree + nexthop object routes, also reword the error texts to make sense
- added missing _rcu on iterating nexthops
- added missing +x on selftest
- fixed a comment & 2 checkpatch nits
- rephrased 2 parts of the documentation a little bit, actually include it in
  the doc build (from ipv6.rst)
- added a selftest that uses (non-nexthop-object) ECMP routes

remainder is the original cover letter:


this patchset implements RFC6724 rule 5.5.  For the unaquainted:

   Rule 5.5: Prefer addresses in a prefix advertised by the next-hop.
   If SA or SA's prefix is assigned by the selected next-hop that will
   be used to send to D and SB or SB's prefix is assigned by a different
   next-hop, then prefer SA.  Similarly, if SB or SB's prefix is
   assigned by the next-hop that will be used to send to D and SA or
   SA's prefix is assigned by a different next-hop, then prefer SB.

The way this is done is through IPv6 subtree routes.  If a router
advertises some prefix in its RA/PIOs, source specific subtree routes
should be created for the default route (and RIOs) installed as a result
of processing that RA.

This may initially sound like a weird way to do it, but for one RFC8028
requires the subtree routes anyway, and also I did try the more obvious
approaches (explicitly tracking it, putting it on the address, putting
it on the neighbor entry) and all of them break in some scenarios.

I've put together a selftest, there's also a rather hacky test suite
created for an IETF hackathon: https://github.com/eqvinox/rule5p5-tests
(it's not specific to this patchset.)  I've also been dogfooding these
patches on my personal devices for more than a year.

Rule 5.5 itself has extensive history at the IETF, including changing
from optional to mandatory in the recent 6724 update.  It is immensely
useful (really: required) to make multihoming, renumbering and failover
work.

@Jakub you had previously asked me to resubmit the "prep" patches since
it was at a poor time (cf. Fri, Jul 25, 2025 at 05:39:58PM -0700).
(I had tried submitting the preparation bits on its own.)

@Paolo you had looked at the lookup fix:
On Tue, Nov 11, 2025 at 11:13:30AM +0100, Paolo Abeni wrote:
> The patch LGTM, and I agree this should go via net-next, given that it's
> really a corner case and I could miss nasty side-effects.
>
> It looks like you have some testing scenario handy: it would be great to
> include it as a paired self-test; could you please add it?

Cheers,


equi (David)



diffstat:
 Documentation/networking/ipv6-addrsel.rst                |  73 +++++++++++++++++++
 Documentation/networking/ipv6.rst                        |   2 +
 MAINTAINERS                                              |   1 +
 include/net/addrconf.h                                   |   4 +
 include/net/ip6_route.h                                  |  26 -------
 net/ipv4/nexthop.c                                       |   5 +-
 net/ipv6/Kconfig                                         |  18 ++++-
 net/ipv6/addrconf.c                                      | 156 ++++++++++++++++++++++++++++++++++++---
 net/ipv6/ip6_fib.c                                       |   5 +-
 net/ipv6/ip6_output.c                                    |  26 +++++--
 net/ipv6/route.c                                         |  26 +++++--
 tools/testing/selftests/net/Makefile                     |   1 +
 tools/testing/selftests/net/config                       |   1 +
 tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py | 285 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 14 files changed, 574 insertions(+), 55 deletions(-)
