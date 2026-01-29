Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B0233149;
	Thu, 29 Jan 2026 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698333; cv=none; b=GCz67yigAQqBKQ2WdO8ZerxzBCxV1qHMTBPZn6fRWygOVR8AF0twyjuUPNK7TpvgKyqNgkDhxuxMSuvEZ6ZrZ/ObtZGUyiYphByI7nkVCbfKnNM1PXassch21neb2IxJex7WdTFuLjVANiE7nv2EIA3ZVm+PuMvnqGEPQaTO+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698333; c=relaxed/simple;
	bh=XLw9HsiRUEyMcmNVzph1Ja/+pVebiZFHCU7yDCVtZmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLmhAIuhxOwCr08S79PtL6WlKPjjf/euyZG9Zwu+I33SeO1WjBAdLRROnX8qYaiZ+EYTO2UeKyr6UX5P7O11MOG4QLU1AQh/dLSJdJo76lN9IxonkfwOHKBTr8tJPlJCyOdzvthsyvorQjTWW6OmsEJPP82CpBhZS9kr8vXdOVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mToF1p5g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mToF1p5g"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 620661661;
	Thu, 29 Jan 2026 15:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769698292;
	bh=XLw9HsiRUEyMcmNVzph1Ja/+pVebiZFHCU7yDCVtZmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mToF1p5g8WGHh+oCERhXZth9pgjWxVIDoJOSaTiakw6sfjOF84tx3++8GwDKvjLWd
	 /ZYPormlAZhkNoJhqKa1Nh5OU7Bitu7ar5SRKBE70ilLA8d39nSasT6cPmq55DDM8W
	 klIlOFU9OsJKQmbYLTggIySWkICnGLe87D8IGn5Y=
Date: Thu, 29 Jan 2026 16:52:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129145208.GF3327197@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
 <20260129103850.GA3317328@killaraus>
 <20260129133440.GD2223369@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129133440.GD2223369@nvidia.com>

On Thu, Jan 29, 2026 at 09:34:40AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 12:38:50PM +0200, Laurent Pinchart wrote:
> > On Wed, Jan 28, 2026 at 09:23:22PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> > > > > The latter already have robust schemes to help the driver shutdown and
> > > > > end the concurrent operations. ie cancel_work_sync(),
> > > > > del_timer_sync(), free_irq(), and *notifier_unregister().
> > > > 
> > > > One a side note, devm_request_irq() is another of the devm_* helpers
> > > > that cause race conditions, as interrupt handlers can run right after
> > > > .remove() returns, which drivers will most likely not handle correctly.
> > > 
> > > Yes! You *cannot* intermix devm and non-devm approaches without
> > > creating very subtle bugs exactly like this. If your subsystem does
> > > not provide a "devm register" helper its drivers shouldn't use devm.
> > 
> > I'd relax that rule a bit. There are resources that drivers must never,
> > ever access after .remove(), such as MMIO. Using devm_ioremap* should
> > therefore be safe in all cases.
> 
> Yeah, probably, but I've seen driver using devm before & after
> non-devm and it is just too hard to tell if things are going to
> even work right.
> 
> To be fair the IRQ issue is always more involved. The subsystem should
> provide a state after unregistration where the memory is still around
> and the IRQ path into the subsystem becomes a NOP. The driver then
> frees the IRQ, fences work and releases the driver memory.
> 
> It is hard to do this sequence with devm..
> 
> I think a lot of places manage without this because seeing interrupts
> after unregister is probably a rare race condition in their HW.
> 
> > > But sure, it is all easy once you figure out how to give the fops shim
> > > some place to store all this state since people would not agree to
> > > make this a universal cost to all fops.
> > 
> > I didn't see any push back against Dan's proposal to store that
> > information in struct cdev, did I miss something ? 
> 
> I also don't see an issue with that, especially if we can stack misc
> on top of cdev to share the same logic.
> 
> I think if you take that idea and the other proposal to shim the fops
> with ones that use the cdev data then we can see some
> cdev_unregister_sync() primitive.

I think we'll need to split that primitive in two (or add a second
primitive), as drivers need to wake up thread sleeping in fops between
flagging the cdev as being unregistered and completing the
unregistration with cdev_unregister_sync(). How to wake those threads up
is highly driver-specific (or at least subsystem-specific), so we need
two functions. Other than that, I think we're on the same page.

-- 
Regards,

Laurent Pinchart
