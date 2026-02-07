Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAD21A92F;
	Sat,  7 Feb 2026 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770472859; cv=none; b=FwxtnmLKzMHk18XBi6HtjgK0HkNGF+cEPn/QlLXhVAGUv/6uP4mE+CAx5o6bomhuUxXuMksxMbv6uxdsgJWpbr+betlaKtGskQTL4/7yWBWkHJbVnGkJMgJfkoSWIDQVfdZE1TZk9c13bYwfn0qLyr8c71fmqthqRHsYVI+EF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770472859; c=relaxed/simple;
	bh=ipmA27PT7L4J7VlPzxsEb8IpZwj1SopV4GIlkZpo15M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdYeQJm4HeBf3V61W3l5lRmSENXl40L2SUuX6Cpx/QsfzDvTF/yohWaqbn66eZoKhBVjvwWH43XCObCzOHNahEbiIRijLSj+QwrpF5HhV09pAvKBpw4tUMrt2GxmjfHw9LZLbpxCUgNmHyrgmUqjj8HPboxpHIlLoW4RYoSHbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgLx2j9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgLx2j9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA0C116D0;
	Sat,  7 Feb 2026 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770472858;
	bh=ipmA27PT7L4J7VlPzxsEb8IpZwj1SopV4GIlkZpo15M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgLx2j9QiaTeIHfN5C/Ip4ZVAqDYFy4VSgcEwAdV551M6TIhtLIXYkeAhvP0vvHxb
	 F3ozXf/gKDp0o5ABqFSnr23Lme3Y2svkzZcGSUhycf2h3joMYOVEgTYcZh1Y76zTKF
	 cDmNIFUjYFK8dcLOJgKnmTngWlDGyuQulhOv4u4QRu/CFRfjdIxx3zLQNSefJ1qxLS
	 Ji7EtF6ZD9mZgcealEUaeO2d+UhFVcq/g8RcV9eG5e3hjm6otW2YtI+60mu2Uger36
	 q6tSbwhXscCU0GjWe8fa072MreC1qaJBhwlenn/9A4Gk3y9hDE+Agkos4CBaQO0+Wu
	 Z9C2hlbiL+ASA==
Date: Sat, 7 Feb 2026 22:00:53 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aYdFle_Un6du3FZS@tzungbi-laptop>
References: <20260204142849.22055-1-johan@kernel.org>
 <2026020624-buddhism-clavicle-7a90@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020624-buddhism-clavicle-7a90@gregkh>

On Fri, Feb 06, 2026 at 04:13:00PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 04, 2026 at 03:28:46PM +0100, Johan Hovold wrote:
> > I was surprised to learn that the revocable functionality was merged the other
> > week given the community feedback on list and at LPC, but not least since there
> > are no users of it, which we are supposed to require to be able to evaluate it
> > properly.
> > 
> > The chromeos ec driver issue which motivated this work turned out not to need
> > it as was found during review. And the example gpiolib conversion was posted
> > the very same morning that this was merged which hardly provides enough time
> > for evaluation (even if Bartosz quickly reported a performance regression).
> > 
> > Turns out there are correctness issues with both the gpiolib conversion and
> > the revocable design itself that can lead to use-after-free and hung tasks (see
> > [1] and [2]).
> > 
> > And as was pointed out repeatedly during review, and again at the day of the
> > merge, this does not look like the right interface for the chardev unplug
> > issue.
> > 
> > Despite the last-minute attempt at addressing the issues mentioned above
> > incrementally, the revocable design is still fundamentally flawed (see patch
> > 3/3).
> > 
> > We have processes like requiring a user before merging a new interface so that
> > issues like these can be identified and the soundness of an API be evaluated.
> > They also give a sense of when things are expected to happen, which allows our
> > scarce reviewers to manage their time (e.g. to not be forced to drop everything
> > else they are doing when things are merged prematurely).
> > 
> > There really is no reason to exempt any new interface from this regardless of
> > whether one likes the underlying concept or not.
> > 
> > Revert the revocable implementation until a redesign has been proposed and
> > evaluated properly.
> 
> After thinking about this a lot, and talking it over with Danilo a bit,
> I've applied this series that reverts these changes.
> 
> Kernel developers / maintainers are only "allowed" one major argument /
> fight a year, and I really don't want to burn my 2026 usage so early in
> the year :)
> 
> Tzung-Bi, can you take the feedback here, and what you have learned from
> the gpio patch series, and rework this into a "clean" patch series for
> us to review and comment on for future releases?  That should give us
> all a baseline on which to work off of, without having to worry about
> the different versions/fixes floating around at the moment.

Acknowledged.  I'll start reworking this into a unified series that
incorporates the feedback and lessons learned.
