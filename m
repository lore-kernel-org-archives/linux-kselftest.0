Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987834214A;
	Fri, 24 Jul 2026 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905872; cv=none; b=WLkOQb2cfhpXW3d64DFGaokj+zFdx/4cB0NdBEuHx2+ebH7HD6QQPTTo6BC4o+i6mk0sVNxvLLPp/VK4wN8rRoeLalkx/bHXghVDWpDb51aUcsz4khzKFMByWTBPJJ+h8q+3xVRTcu5Bn8H5fUTk/7OaW4RlROr/JEmN81UpRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905872; c=relaxed/simple;
	bh=FBocYxqrD3L3ICBl+vfnjqELTuyEivO13ec/XZUqkDA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdxzhgLisgn9xekl3NNf2SdHX9tg3M1MdQWv83Cha1pXLhmjv2qeIh8JKp03IK+i+b5BD3IGJTd5KYWJs3BgDFtIDtZO3cvHm+83SHckXXW9OE3Kr2WGGfz8y2G1QvdDX110ETw7dP5wxpAKemcEmzcVjQpbs5iRGWxYxMyQISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from equinox by eidolon.nox.tf with local (Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wnHYA-000000001F2-12IU;
	Fri, 24 Jul 2026 17:10:58 +0200
Date: Fri, 24 Jul 2026 17:10:58 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/10] RFC 6724 rule 5.5 support
Message-ID: <amOAgsxNyqLyAu0G@eidolon.nox.tf>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>

Well, the Sashiko comment about removing ip6_route_get_saddr() feels a little bit gaslighting when the next commit is literally removing ip6_route_get_saddr() - but I'm looking at the other ones.  Also forgot to remove the MAINTAINERS line for the documentation file, which I said I'd do.

Will send a v3 in a bit.


-equi

On Thu, Jul 23, 2026 at 02:19:26PM +0200, David 'equinox' Lamparter wrote:
> Hi all,
> 
> 
> changes relative to previous version:
> 
> - ipv6_saddr_rule5p5() now makes a local copy of the flowi6; I was trying
>   to avoid that but it's just an invitation for breakage.
> - added check + WARN_ONCE on subtree routes w/ nexthop objects.  The kernel
>   doesn't allow adding such routes, this is just a safety guard.
>   (this probably fixes the false positive complaint by Sashiko, it's a
>   reasonable safety guard to have independent of that.)
> - new commit that does adds a comment about this on the kernel reject of
>   subtree + nexthop object routes, also reword the error texts to make sense
> - added missing _rcu on iterating nexthops
> - added missing +x on selftest
> - fixed a comment & 2 checkpatch nits
> - rephrased 2 parts of the documentation a little bit, actually include it in
>   the doc build (from ipv6.rst)
> - added a selftest that uses (non-nexthop-object) ECMP routes
> 
> remainder is the original cover letter:
> 
> 
> this patchset implements RFC6724 rule 5.5.  For the unaquainted:
> 
>    Rule 5.5: Prefer addresses in a prefix advertised by the next-hop.
>    If SA or SA's prefix is assigned by the selected next-hop that will
>    be used to send to D and SB or SB's prefix is assigned by a different
>    next-hop, then prefer SA.  Similarly, if SB or SB's prefix is
>    assigned by the next-hop that will be used to send to D and SA or
>    SA's prefix is assigned by a different next-hop, then prefer SB.
> 
> The way this is done is through IPv6 subtree routes.  If a router
> advertises some prefix in its RA/PIOs, source specific subtree routes
> should be created for the default route (and RIOs) installed as a result
> of processing that RA.
> 
> This may initially sound like a weird way to do it, but for one RFC8028
> requires the subtree routes anyway, and also I did try the more obvious
> approaches (explicitly tracking it, putting it on the address, putting
> it on the neighbor entry) and all of them break in some scenarios.
> 
> I've put together a selftest, there's also a rather hacky test suite
> created for an IETF hackathon: https://github.com/eqvinox/rule5p5-tests
> (it's not specific to this patchset.)  I've also been dogfooding these
> patches on my personal devices for more than a year.
> 
> Rule 5.5 itself has extensive history at the IETF, including changing
> from optional to mandatory in the recent 6724 update.  It is immensely
> useful (really: required) to make multihoming, renumbering and failover
> work.
> 
> @Jakub you had previously asked me to resubmit the "prep" patches since
> it was at a poor time (cf. Fri, Jul 25, 2025 at 05:39:58PM -0700).
> (I had tried submitting the preparation bits on its own.)
> 
> @Paolo you had looked at the lookup fix:
> On Tue, Nov 11, 2025 at 11:13:30AM +0100, Paolo Abeni wrote:
> > The patch LGTM, and I agree this should go via net-next, given that it's
> > really a corner case and I could miss nasty side-effects.
> >
> > It looks like you have some testing scenario handy: it would be great to
> > include it as a paired self-test; could you please add it?
> 
> Cheers,
> 
> 
> equi (David)
> 
> 
> 
> diffstat:
>  Documentation/networking/ipv6-addrsel.rst                |  73 +++++++++++++++++++
>  Documentation/networking/ipv6.rst                        |   2 +
>  MAINTAINERS                                              |   1 +
>  include/net/addrconf.h                                   |   4 +
>  include/net/ip6_route.h                                  |  26 -------
>  net/ipv4/nexthop.c                                       |   5 +-
>  net/ipv6/Kconfig                                         |  18 ++++-
>  net/ipv6/addrconf.c                                      | 156 ++++++++++++++++++++++++++++++++++++---
>  net/ipv6/ip6_fib.c                                       |   5 +-
>  net/ipv6/ip6_output.c                                    |  26 +++++--
>  net/ipv6/route.c                                         |  26 +++++--
>  tools/testing/selftests/net/Makefile                     |   1 +
>  tools/testing/selftests/net/config                       |   1 +
>  tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py | 285 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  14 files changed, 574 insertions(+), 55 deletions(-)
> 
