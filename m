Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9133A717;
	Mon, 26 Jan 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435411; cv=none; b=k5So2jAOWVBTfIoVFWVQAWNPk/DhSCdSlG+w8V9MSf2n7SosgAKIm3ZvwvOeWOc5lvmxphGho7wFzsLukNHph2IlCYuikdmolXO6GXYXtQ2l8Knul7utskYAvTcgFYh99kKamAjLOs0TiJgW9XAwzh+wdEemBU4sjbxuYE/v4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435411; c=relaxed/simple;
	bh=zBrbsQP9J+oLzGdQrppfak+W6VrVZPWPEARr1ajM104=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCSbaYRiptw7oLLEzdPM2kfgTnbWHY3DNVHQEGDmXCga4AYoHnHvGkUqDrk23oM6DofXNoVAtlJ7ANmneAYD2m7B2KeLJMPBUWeit3MxBoTFcNB5//luUpOeW0cIcK7bNRlvrpG1JUDUPYwSDEgN0duVyoTm72XLJjJnqtWvu6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh8ftwdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh8ftwdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4CBC116C6;
	Mon, 26 Jan 2026 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435410;
	bh=zBrbsQP9J+oLzGdQrppfak+W6VrVZPWPEARr1ajM104=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh8ftwdpYc+lFJt/dBAfy7+4cLDK2vb7YZ1Y2CpSFzb/gRGm795qWcrYiQaDJdDS4
	 nhaW0RSJuX4BlBxRckILLuLtNSKz2fcr/tyKs08cPWeLu8T3SKkjtNthMjhFLQAr7c
	 wChAUHtyUT+mrQbQ1rM9DinRmyR4sLCl5yrveQgOWk6lFJP470CIlTG0461eZ/R4FO
	 uRXaDLuImoOGViWAq8JiX0nKeT/seQT10ReUWAwbbkYBWF0gvfHNbeGLqNimPIa5w4
	 NpDTnbOrvuWfDGVkf11wff/Cz0RfP+rXO4pH5EDV1gt8af7oDfGXles/B8iu+HaL2D
	 5K5oTVMMr3NcA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vkMyi-000000005DZ-4AKa;
	Mon, 26 Jan 2026 14:50:05 +0100
Date: Mon, 26 Jan 2026 14:50:04 +0100
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
Message-ID: <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012554-chatty-policy-42a1@gregkh>

On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:
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

It's certainly possible to handle the chardev unplug issue without
revocable as several subsystems already do. All you need is a refcount,
a lock and a flag.

It may be possible to provide a generic solutions at the chardev level
or some kind of helper implementation (similar to revocable) for
subsystems to use directly.

But revocable appears to be too fine grained for this as when the
device goes away all operations must cease. There's no need to track
mmio regions individually as was suggested. This may be the mental model
for someone working with rust, but it isn't necessarily a good fit for
the rest of the kernel.

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

It's a design pattern that's perhaps needed for rust, but not
necessarily elsewhere. But either way there is no need to rush this. If
it turns out to be usable, it can be merged along with a future user.

Dropping the revocable_provider and revocable abstraction split should
even make it more palatable.

And with a new interface and a non-trivial user we can see what the
end-result looks like and decide where to go from there. 

> So I don't want to take these reverts, let's try this out, by putting
> this into the driver core now, we have the base to experiment with in a
> "safe" way in lots of different driver subsytems at the same time.  If
> it doesn't work out, worst case we revert it in a release or two because
> it didn't get used.

Please reconsider. Perhaps I didn't stress the point enough that the
current API needs to be reworked completely since there's no longer any
need for the two revocable abstractions.

Johan
