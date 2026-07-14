Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A980409635;
	Tue, 14 Jul 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022097; cv=none; b=G/PT9bN87Dm+jcBER7/uuybMuhzzzWfqF0HvmK4PSj537cQq6rwreEHQmLt/YoGHd+kBvxGueo9aEX3GoDA9s3faDnhwTOkLlbM8k2ArdWzuvdiAIfvNR+IXGhh4KrA8bLyoj4L2YxONy0l3dSpPvWcDrc9dzHJVvAEY9TZq+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022097; c=relaxed/simple;
	bh=abX2ieiikA0TbFT1zTqvQszUwOCUtRg1p/sBZP+bufo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HSQiEyqVsgSUVLt3Mas8Sf2FH6+K3LFhXlve1Dv1fxzR+sMkyROlKTYzREgKaoMH/ZOths0ll2LaHAjPDGOScvSdXkI4tDxcBbw6Y/4zYrOpvwANCvm8zVCrU/+Sug9/GCiHtlZad4kUJ+rIn0ZGxFVkMRFcZfMJX3HF2tPkha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from nat-wifi0.uniroma3.it ([193.204.167.180] helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZdb-000000022Sj-0MVl;
	Tue, 14 Jul 2026 11:41:15 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZdE-00000000ZUF-3ffY;
	Tue, 14 Jul 2026 11:40:52 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	Patrick Rohr <prohr@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/9] RFC 6724 rule 5.5 support
Date: Tue, 14 Jul 2026 11:40:03 +0200
Message-ID: <20260714094030.136317-1-equinox@diac24.net>
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


P.S.: I also happen to be around at netdevconf in Rome, in case anyone
happens to see this and have questions.  Of course being at a conference
generally means not looking at random patch mails, so this is mostly
just in case you see the Subject lines or this cover letter.  Apologies,
it wasn't possible for me to submit this ahead of the conference.


diffstat:
 Documentation/networking/ipv6-addrsel.rst                |  75 ++++++++++++++++++++++++++++++++
 MAINTAINERS                                              |   1 +
 include/net/addrconf.h                                   |   4 ++
 include/net/ip6_route.h                                  |  26 ------------
 net/ipv6/Kconfig                                         |  18 ++++++--
 net/ipv6/addrconf.c                                      | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 net/ipv6/ip6_fib.c                                       |   5 ++-
 net/ipv6/ip6_output.c                                    |  26 +++++++++---
 net/ipv6/route.c                                         |  16 +++++--
 tools/testing/selftests/net/Makefile                     |   1 +
 tools/testing/selftests/net/config                       |   1 +
 tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py | 231 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 12 files changed, 497 insertions(+), 51 deletions(-)

