Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FEF2E1F08;
	Wed,  4 Feb 2026 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215785; cv=none; b=DZTQf3EGmI4XmVD7/nZaArLB7+gWGBTX3qPFX4XJ+jwHj9AH6UvAzzSvJdKIKAnmZAWlw2MXtGFcxQpTtE/+ChoDspd+nSSEhZpJKhuQ9Xp1LkuJ6rIxte1g6ljpTTJ970+RRaetWToqvqAqAzr/OWFX++MrGGDxhIyhPPksYkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215785; c=relaxed/simple;
	bh=ERnvZTsukDQO/ZEhVkq25O9dgtCmPyv2PIAGFZTsbuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh2zs4Zu5QD8lM5bRsfSgxOaVkih4xKVVko3TE6esh1wm2X7Evs/2aVrwq1rbS9xnuOQNy4PPXRS9JldM50QF52MHjUv1rb+uXzOw4T9h8irmsCffPllUr8sFNtLOW3d8Wa11vEdtrbCq96VhNMiRR3iARQPTD+k7oT8TDzUoxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPyTwJzW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPyTwJzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF24C4CEF7;
	Wed,  4 Feb 2026 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215785;
	bh=ERnvZTsukDQO/ZEhVkq25O9dgtCmPyv2PIAGFZTsbuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPyTwJzWvb+qpbBhs8gHPLd4cRXpqV9SwIXH491hn77nXzEBNjWit661VhHQO0M2X
	 m5dRugDOVxfmMstEGFOhoXVSOZ1ilAZHPCURXf9EZUo7QFnrxsQEv0drO+s2D9UUhX
	 yCuGZZ3vFHGnfLj48cVIWPi44dPIWx4gTw8xakfMJKN6A7tBHasoUFMrNk3CiVo9Qq
	 ksqygrzE1lUgJcpaf1S8GTaoibHT6F9NR8uUfgjTqtjsxMpYHYVxtSbkXdPYgW6Htw
	 7rR0yVlYbWN0l4fEtYJfOylK6S/xZy/L5OoZ5mazgRYzP0IRAwm+S24Hz7u+CKsZ6Y
	 i5hkMWZSCFhEQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vndzO-000000005ta-2CtF;
	Wed, 04 Feb 2026 15:36:18 +0100
Date: Wed, 4 Feb 2026 15:36:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aYNZYqpV62wVtxDI@hovoldconsulting.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020315-twins-probe-d988@gregkh>

On Tue, Feb 03, 2026 at 01:26:58PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 03, 2026 at 01:15:50PM +0100, Johan Hovold wrote:
> > On Mon, Jan 26, 2026 at 02:50:05PM +0100, Johan Hovold wrote:
> > > On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:

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

Turns out the new revocable design is also fundamentally broken.

I've already spent too much time on this when I should be doing other
things, but here is an updated revert which explains things:

	https://lore.kernel.org/r/20260204142849.22055-1-johan@kernel.org	

> As no one is currently using this, I will disable this from the build,
> but keeping the code in the tree right now is a good thing as I do feel
> this is the right way forward, and others can work off of it easier this
> way.

API design should not be done incrementally in-tree. It just makes
things harder for reviewers, adds noise, and without any benefit for
anyone when the interface keeps changing every other week.

Please just merge the reverts and we can work out a way forward.

Johan
