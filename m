Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531F1397;
	Sun, 25 Jan 2026 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769345238; cv=none; b=OLMPcheMSOgoEUFprQoEU84NR0y/RV1dEVC0Fb+/AKc5iLd4GYbcyHrbjdLyG6xSxhzexyCJMJh66DifJIz4ZFkis7WOFeBiyZ737OOwAwy3zRDFriBg90WSkxVtLMRP5Z7vTNZ/5uQI7/q7sKwDXAjpPfjhw5yjNxKJpMVrZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769345238; c=relaxed/simple;
	bh=3uG70ESRyxMfbSDXcNxQas2MwAsOYF8DO1fvC8Y+/UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI/aNR0+VVNmZjaO1AHU2b4rK2z9sES7lBFMv6ofmqet8FZ1HuDCs1opxpJFjZ81KgdiYk0OXCY1OS/0aZkGXGmAQizv2EOwmYIbxR3eWy3qFEiRc1aBmoO4unF4HcgrISGiN4Wjwoe1Q/62Rpvdq0EF3vbenJZ7yDs49TT4YPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MPVljPfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MPVljPfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB7EC4CEF1;
	Sun, 25 Jan 2026 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769345237;
	bh=3uG70ESRyxMfbSDXcNxQas2MwAsOYF8DO1fvC8Y+/UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPVljPfKum5CglT/wW4Md9gDsjH3AlzWuG7GvsqoI2MsaihiQIkuOUJivI8PYJYJh
	 eEKJXeur3u1A9DUFi4mjDObA67nu3ffqvMO8CVnu572HMTJYRZc7vnTIvpPv0ljSpS
	 C2feiDD4RcoaYFQKPVuFrqvTEdUku+hBIbTHDcno=
Date: Sun, 25 Jan 2026 13:47:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
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
Message-ID: <2026012554-chatty-policy-42a1@gregkh>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>

On Sat, Jan 24, 2026 at 08:08:28PM +0100, Danilo Krummrich wrote:
> On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > this does not look like the right interface for the chardev unplug issue.
> 
> I think it depends, we should do everything to prevent having the issue in the
> first place, e.g. ensure that we synchronize the unplug properly on device
> driver unbind.
> 
> Sometimes, however, this isn't possible; this is where a revocable mechanism can
> come in handy to prevent UAF of device resources -- DRM is a good example for
> this.

This is not "possible" for almost all real devices so we need something
like this for almost all classes of devices, DRM just shows the extremes
involved, v4l2 is also another good example.

Note, other OSes also have this same problem, look at all the work the
BSDs are going through at the moment just to get closer to the place
where we are in Linux today with removable devices and they have hit our
same problems.

> But to be fair, I also want to point out that there is a quite significant
> difference regarding the usefulness of the revocable concept in C compared to in
> Rust due to language capabilities.

True, but we do need something.  I took these patches without a real
user as a base for us to start working off of.  The rust implementation
has shown that the design-pattern is a good solution for the problem,
and so I feel we should work with it and try to get this working
properly.  We've been sitting and talking about it for years now, and
here is the first real code submission that is getting us closer to fix
the problem properly.  It might not be perfict, but let's evolve it from
here for what is found not to work correctly.

So I don't want to take these reverts, let's try this out, by putting
this into the driver core now, we have the base to experiment with in a
"safe" way in lots of different driver subsytems at the same time.  If
it doesn't work out, worst case we revert it in a release or two because
it didn't get used.

thanks,

greg k-h
