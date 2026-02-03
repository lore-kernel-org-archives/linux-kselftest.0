Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EB33DEFC;
	Tue,  3 Feb 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121621; cv=none; b=pqz8Li226wOey9bV6WFUqbFpYTrGUk2Bvllt6efPHgZisX57G/pi1ok7QIVNhAcGnhFcpcdXJIoO7ZwrbcVs2S6CiAF2+qg8vYqf+AJsdLjPAMuta3QeY06bTVzrra5eJdcARG19MT3wA6DsmkfDKVnSjgaa6BFXMQR5FZSwHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121621; c=relaxed/simple;
	bh=7kT/v0PRPixoBe492AFQnUGkmgJKzC9gfdVLFh6CSL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eApy9aEGpD91z/nTOmQcYaWvtXoT5DD3kQvydPoELpXaN02/F2yP5Vc3s48Q2uvFDRrw4VZxaV2Zzj9sq6YxQ4oLN40ZXBQ3zkcCczPAl9jiQkNZ3NFi8TamDcq3mchTTCNEwI3n7K9PW6pbib0aV9/xowlLtRzkpxqkBf5dSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pL7MtRzN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pL7MtRzN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56E0C116D0;
	Tue,  3 Feb 2026 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770121621;
	bh=7kT/v0PRPixoBe492AFQnUGkmgJKzC9gfdVLFh6CSL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pL7MtRzNz4HTrHJRWyyQf9KNd2Lq0pqlGuLlDA+AtLgwrEpcTV/ezlLLvs5owoMcd
	 cT6dxEq9kSMU7IXezc6i/1JeR8QHZd+RFZOBxWC/fmQapV3FhbGE1iZfXinuQxxOj4
	 BgcNpvOf8wZDYFC6bpPkXurEHpOBS187B6wlh13g=
Date: Tue, 3 Feb 2026 13:26:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
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
Message-ID: <2026020315-twins-probe-d988@gregkh>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYHm9pr0e7myeqS3@hovoldconsulting.com>

On Tue, Feb 03, 2026 at 01:15:50PM +0100, Johan Hovold wrote:
> Hi Greg,
> 
> On Mon, Jan 26, 2026 at 02:50:05PM +0100, Johan Hovold wrote:
> > On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:
> 
> > > True, but we do need something.  I took these patches without a real
> > > user as a base for us to start working off of.  The rust implementation
> > > has shown that the design-pattern is a good solution for the problem,
> > > and so I feel we should work with it and try to get this working
> > > properly.  We've been sitting and talking about it for years now, and
> > > here is the first real code submission that is getting us closer to fix
> > > the problem properly.  It might not be perfict, but let's evolve it from
> > > here for what is found not to work correctly.
> > 
> > It's a design pattern that's perhaps needed for rust, but not
> > necessarily elsewhere. But either way there is no need to rush this. If
> > it turns out to be usable, it can be merged along with a future user.
> > 
> > Dropping the revocable_provider and revocable abstraction split should
> > even make it more palatable.
> > 
> > And with a new interface and a non-trivial user we can see what the
> > end-result looks like and decide where to go from there. 
> > 
> > > So I don't want to take these reverts, let's try this out, by putting
> > > this into the driver core now, we have the base to experiment with in a
> > > "safe" way in lots of different driver subsytems at the same time.  If
> > > it doesn't work out, worst case we revert it in a release or two because
> > > it didn't get used.
> > 
> > Please reconsider. Perhaps I didn't stress the point enough that the
> > current API needs to be reworked completely since there's no longer any
> > need for the two revocable abstractions.
> 
> I noticed that you picked up the proposed incremental fixes to the
> issues I reported without anyone even having reviewed them. The fixes
> being incremental makes it a lot harder to review, but based on a quick
> look it seems there needs to be further changes.
> 
> And again, what is the rush? Anyone wanting to experiment with this
> functionality only needs to apply a single patch. And exposing the API
> before it is stable is just going to be a mess as subsystems may start
> using it from day one.
> 
> So please, just drop it for 6.20. You can still merge this for the next
> cycle when the basic functionality has been fixed.

The fixes seemed correct on my review, what was wrong with them?  And
having the code fixed for known issues is a good thing here, it gives
the gpio people a base to test their work on.

As no one is currently using this, I will disable this from the build,
but keeping the code in the tree right now is a good thing as I do feel
this is the right way forward, and others can work off of it easier this
way.

thanks,

greg k-h
