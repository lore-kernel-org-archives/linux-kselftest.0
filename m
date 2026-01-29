Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6633CE85;
	Thu, 29 Jan 2026 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683442; cv=none; b=pED2f6FEag6qmp+QhwXHfygJeJLdtyvMnGodw0Xr9rsHmxE26C8Tsh77l3qdWTRDTVp50xYfddco5CBNfIijJzuzbnKUrndnTFm9/UJidGlAtmZkVvGfMyZgCwvXup0mcFsE1P71qfnG7OpI10FNNetnnRpvwM8DA56uLSiNKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683442; c=relaxed/simple;
	bh=fGYnk2Wsl/iClv2PW9DITnc+e8ObvsPI8ETPAZdS5HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwBwv5zvsV+omj967svZoezIpgCgvHyJkmKhCCJPXfM9wqHNun/+W0YszsKzUj76vta9P+DtULj8CQEx8ie0ICAE0kAu45x3xtAnhbfsqGUIgzeXrI+uyJ2HtyfibedUOE0vobwvHgHQesTDY1+ekb4hJPPod92T2dZpMFeDa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ONwaO5EY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ONwaO5EY"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE48F6A6;
	Thu, 29 Jan 2026 11:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769683402;
	bh=fGYnk2Wsl/iClv2PW9DITnc+e8ObvsPI8ETPAZdS5HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONwaO5EYzj78++dowH9xINB9PbdXSdfAsZ4GUdxmqyHe7y8sieieW6Y0erVZ2ubHR
	 MW+p/gYX8r10Z3ST9e2/2/COkQc3s3C15BGPKQIIfj/3qrgkq8nPfWIHglnemjDfAD
	 cywdgYQEAr+K4l/9ynRL6EWV4i1qj53F/NoYKWGA=
Date: Thu, 29 Jan 2026 12:43:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dan.j.williams@intel.com, Jason Gunthorpe <jgg@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129104357.GB3317328@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
 <697ad713ea124_3095100ee@dwillia2-mobl4.notmuch>
 <DG0ZES9SRSKD.11UBH7B75WNSX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DG0ZES9SRSKD.11UBH7B75WNSX@kernel.org>

On Thu, Jan 29, 2026 at 10:56:22AM +0100, Danilo Krummrich wrote:
> On Thu Jan 29, 2026 at 4:42 AM CET, dan.j.williams wrote:
> > Jason Gunthorpe wrote:
> >> On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> >> > > The latter already have robust schemes to help the driver shutdown and
> >> > > end the concurrent operations. ie cancel_work_sync(),
> >> > > del_timer_sync(), free_irq(), and *notifier_unregister().
> >> > 
> >> > One a side note, devm_request_irq() is another of the devm_* helpers
> >> > that cause race conditions, as interrupt handlers can run right after
> >> > .remove() returns, which drivers will most likely not handle correctly.
> >> 
> >> Yes! You *cannot* intermix devm and non-devm approaches without
> >> creating very subtle bugs exactly like this. If your subsystem does
> >> not provide a "devm register" helper its drivers shouldn't use devm.
> >
> > I wonder if we should have a proactive debug mode that checks for
> > idiomatic devres usage and flags:
> >
> > - registering devres actions while the driver is detached
> 
> In Rust we already enforce this through the type system, i.e. we even fail to
> compile the code when this is violated. (I.e. for all scopes that guarantee that
> a device is bound (and will remain throughout) we give out a &Device<Bound>,
> which serves as a cookie.)
> 
> In C I don't really see how that would be possible without additional locking,
> as the only thing we could check is dev->driver, which obviously is racy.
> 
> > - registering devres actions for a device with a driver that has a
> >   .remove() method
> 
> This is perfectly valid, drivers might still be performing teardown operations
> on the device (if it did not get hot unplugged).
> 
> > - passing a devres allocation to a kobject API
> 
> Well, this is an ownership violation. Technically, devres owns this allocation
> and devres releases the allocation when the device is unbound. Which makes this
> allocation only ever valid to access from a scope that is guaranteed that the
> device is (and remains) bound.
> 
> > - invoking devres release actions from a kobject release API
> 
> This is similar to "registering devres actions while the driver is detached" and
> falls into the boarder problem class of "messing with devres objects outside of
> a Device<Bound> scope".
> 
> Again, I think in C we can't properly protect against this. While we could also
> give out a "Device<Bound>" token for scopes where we can guarantee that the
> device is actually bound to a driver in C, we can't control the lifetime of the
> token as we can in Rust, which makes it pointless.
> 
> So, the best thing we can probably do is document that "This must only be called
> from a scope that guarantees that the device remains bound throughout." for all
> the devres accessors.
> 
> There may be one thing that comes to my mind that we could do though. While we
> can't catch those at compile time, we might be able to catch those on runtime.

C will not allow catching as many things as compile time as rust, that's
for sure, but I don't think it's the main issue here. The core of the
problem, in my opinion, is that we have seen a proliferation of devres
and similar helpers that were quickly adopted by drivers as it made
their life easier, *but* without any documentation of the caveats and
correct usage patterns. We have APIs that don't tell how to use them
correctly, so we can hardly blame driver developers for not doing it
right. In many cases we haven't even thought about what the right (and
wrong) usage patterns are, and in some cases the APIs have been
developed with so little awareness of these issues that there's no
correct usage pattern. Fixing this is the first step, then we can see
how to use the features provided by the programming language to minimize
the risk of incorrect usage.

> For instance, we could "abuse" lockdep and register a fake lock for a
> Device<Bound> scope and put a lockdep assert into all the devres accessors.
> 
> However, fixing up all the violations that come up when introducing this sounds
> like a huge pain. :)

-- 
Regards,

Laurent Pinchart
