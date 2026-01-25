Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A91D88B4;
	Sun, 25 Jan 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347376; cv=none; b=qafkdEnplRmYPJl+9sM8g1O14liRdYljfJsRUmgYBJ0SC71lQVbJwNWGkp3K2EFPu5vchkMn4kK6LU+oiJ7A3vkOdn13jnhMLCCZ7FroPQzHM9GPsVkKQy2lVKH1GPAQfEVuGlSm2eNR5bHLDnpdFtZgicxMxilRsaqO3UjC0WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347376; c=relaxed/simple;
	bh=bJ7TcokTwFtXRum/2gFYPzNs4cIvSgU1txUBKY1SboI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE/UjzOi7dtU/+oUelbet7HAmf+qsuM1qm3HqRE0NQXgo+NTKK2v7pAA4lcJ4fsQMQfQlUNia5bmAC1wAIfHBAdGAUSbVSkCJXiEuiN8hq/Bo3SYmJBohUa9bHRK9m86pBW7Jni+NYQ4eH6ziQN6YWmWupvTB0hrEOJNw7rYAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rScpu8RI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rScpu8RI"
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 63ACF5B3;
	Sun, 25 Jan 2026 14:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769347337;
	bh=bJ7TcokTwFtXRum/2gFYPzNs4cIvSgU1txUBKY1SboI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rScpu8RIAeZRj1uJIT+0GtJ5HZdLm1wiq+n+ldVzdUjT5yZIVP0egbOow0EoFyuk4
	 MDXU+gvC0xji7P4/wdsFoCbdFBt1TLg+1cGP4szYdnhQ7aaTuJql86Sq+P4T0R5PyC
	 Xqp3nXkoPo3zzULLdJFd19mhcAHo+x0GQbEITx4k=
Date: Sun, 25 Jan 2026 15:22:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
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
Message-ID: <20260125132250.GP215800@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026012554-chatty-policy-42a1@gregkh>

On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg KH wrote:
> On Sat, Jan 24, 2026 at 08:08:28PM +0100, Danilo Krummrich wrote:
> > On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > > this does not look like the right interface for the chardev unplug issue.
> > 
> > I think it depends, we should do everything to prevent having the issue in the
> > first place, e.g. ensure that we synchronize the unplug properly on device
> > driver unbind.
> > 
> > Sometimes, however, this isn't possible; this is where a revocable mechanism can
> > come in handy to prevent UAF of device resources -- DRM is a good example for
> > this.
> 
> This is not "possible" for almost all real devices so we need something
> like this for almost all classes of devices, DRM just shows the extremes
> involved, v4l2 is also another good example.
> 
> Note, other OSes also have this same problem, look at all the work the
> BSDs are going through at the moment just to get closer to the place
> where we are in Linux today with removable devices and they have hit our
> same problems.
> 
> > But to be fair, I also want to point out that there is a quite significant
> > difference regarding the usefulness of the revocable concept in C compared to in
> > Rust due to language capabilities.
> 
> True, but we do need something.  I took these patches without a real
> user as a base for us to start working off of.  The rust implementation
> has shown that the design-pattern is a good solution for the problem,
> and so I feel we should work with it and try to get this working
> properly.  We've been sitting and talking about it for years now, and
> here is the first real code submission that is getting us closer to fix
> the problem properly.  It might not be perfict, but let's evolve it from
> here for what is found not to work correctly.
> 
> So I don't want to take these reverts, let's try this out, by putting
> this into the driver core now, we have the base to experiment with in a
> "safe" way in lots of different driver subsytems at the same time.  If
> it doesn't work out, worst case we revert it in a release or two because
> it didn't get used.

It's the wrong solution for most cases, if not all. It will spread in
drivers and then become another big piece of technical debt we'll wish
we had never merged. We know what the right solution to the cdev race
is, moving forward with the revocable API is shooting ourselves in the
foot. Or both feet. Or much worse. I can't stop everybody from harming
themselves, but I object vigourously when that impacts me. I want this
to be reverted now.

-- 
Regards,

Laurent Pinchart
