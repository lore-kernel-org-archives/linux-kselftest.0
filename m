Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B015C3A1A5C;
	Tue,  3 Feb 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127038; cv=none; b=n2GUfS/p7JTOjmFVJWBamzE7/qAfw7MPkSsUAYHZTKTj41dA+k/12+n2y/9B0xI1xw6GLcXIhNfCPAtxPQCluaOx1zC3GGtEfIPy09vIY9ECTOAFTvUGu/jx/T2xhT8QqcV5/8m/3nZ08FwO6K+mn+en+X1UNKupAwSrGfRH26c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127038; c=relaxed/simple;
	bh=5Q7kADy7HueRO0EcnCLvY1VqfhcOdJ0rEvJkWpxpiJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZaaQmJhJ2fAsqOI1D9Ctzt4ZtFj4VddV2A4fWj/LaX644AVayw/ZG2+xbHIkFtx5eeEDJILsMDia8XrD/cs1aalM59kaHd3RPHf2I78i0AggcgCYnK41CD39VIcflwV1H1qr7k+xtIJ106+XcmJgUf4z6iBr7On1jjTmVW1HYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rfmQWCAT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rfmQWCAT"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1085D1C6;
	Tue,  3 Feb 2026 14:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770126992;
	bh=5Q7kADy7HueRO0EcnCLvY1VqfhcOdJ0rEvJkWpxpiJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfmQWCATts07Sq1Jcu6OzHPbMFYBnUzm0LXMl+oez27+1aYGXNd8tP/C+zW9MD+x6
	 LphTRD9cknlGai2MWdxhlq/ymD/1qjKBp2iyypuo3gK0QFK0xODIytB2oCjAXCCo88
	 0/jLZCrr/tKFHZoPru024uBwlQKFxwPJ4z9evXDQ=
Date: Tue, 3 Feb 2026 15:57:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260203135711.GA12013@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026020315-twins-probe-d988@gregkh>

On Tue, Feb 03, 2026 at 01:26:58PM +0100, Greg KH wrote:
> On Tue, Feb 03, 2026 at 01:15:50PM +0100, Johan Hovold wrote:
> > On Mon, Jan 26, 2026 at 02:50:05PM +0100, Johan Hovold wrote:
> > > On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:
> > 
> > > > True, but we do need something.  I took these patches without a real
> > > > user as a base for us to start working off of.  The rust implementation
> > > > has shown that the design-pattern is a good solution for the problem,
> > > > and so I feel we should work with it and try to get this working
> > > > properly.  We've been sitting and talking about it for years now, and
> > > > here is the first real code submission that is getting us closer to fix
> > > > the problem properly.  It might not be perfict, but let's evolve it from
> > > > here for what is found not to work correctly.
> > > 
> > > It's a design pattern that's perhaps needed for rust, but not
> > > necessarily elsewhere. But either way there is no need to rush this. If
> > > it turns out to be usable, it can be merged along with a future user.
> > > 
> > > Dropping the revocable_provider and revocable abstraction split should
> > > even make it more palatable.
> > > 
> > > And with a new interface and a non-trivial user we can see what the
> > > end-result looks like and decide where to go from there. 
> > > 
> > > > So I don't want to take these reverts, let's try this out, by putting
> > > > this into the driver core now, we have the base to experiment with in a
> > > > "safe" way in lots of different driver subsytems at the same time.  If
> > > > it doesn't work out, worst case we revert it in a release or two because
> > > > it didn't get used.
> > > 
> > > Please reconsider. Perhaps I didn't stress the point enough that the
> > > current API needs to be reworked completely since there's no longer any
> > > need for the two revocable abstractions.
> > 
> > I noticed that you picked up the proposed incremental fixes to the
> > issues I reported without anyone even having reviewed them. The fixes
> > being incremental makes it a lot harder to review, but based on a quick
> > look it seems there needs to be further changes.
> > 
> > And again, what is the rush? Anyone wanting to experiment with this
> > functionality only needs to apply a single patch. And exposing the API
> > before it is stable is just going to be a mess as subsystems may start
> > using it from day one.
> > 
> > So please, just drop it for 6.20. You can still merge this for the next
> > cycle when the basic functionality has been fixed.
> 
> The fixes seemed correct on my review, what was wrong with them?  And
> having the code fixed for known issues is a good thing here, it gives
> the gpio people a base to test their work on.
> 
> As no one is currently using this, I will disable this from the build,
> but keeping the code in the tree right now is a good thing as I do feel
> this is the right way forward, and others can work off of it easier this
> way.

The reason why I (and others) would like to see this series reverted is
because be believe it is *not* the right way forward. There's no
consensus on that topic. While having code in mainline can improve
collaboration and accelerate development, we don't traditionally do that
when a large portion of the parties involved believe the approach is
wrong, and no user should be added until a consensus on the API is
found.

In the worst case, if no consensus can be found, someone has to make a
decision, but doing so while discussions are ongoing, so close after LPC
where different approaches were discussed and proposed, is very
worrying. Do we want to prioritize your feeling that this is the right
way forward over trying to find an argument, while discussions are
progressing ?

-- 
Regards,

Laurent Pinchart
