Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8633FE36;
	Thu, 29 Jan 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683138; cv=none; b=ou/BFPYlvstQLhnqIPFLqNZC1QV1cGegWt0X+cNHDVBAJErtexnz3OBkXQSmdpj8RPpEukThqhIZxtwvtXtRvMXelHzY36CbfEhfxIyEaLExG6CwYIXTEQKCiIQu+Ea3KCnQJlVNyeH3YhLDruCsQQZIx1PyV+7fbXYu72hb62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683138; c=relaxed/simple;
	bh=nMixEuz/9FHnK51vm77F3Ms/6jsImOkK/TSTC2pE5dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVapxvEDS8/GBKOgJ0WKYp8BiKDd/BGxRmqj2XAZOGPbz+C7BDQayQEg1X/UAG4GIFAR3IulKRQPy/qqmJgIzCQJc1qdsvO9ldl2Ccd5irzNT+pvJn/9wCN7hLA3CJgles6LL24DrHaQV8S2uNGa82Cl3OFOSb2Ne0SHaX5AUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EfkENokv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EfkENokv"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8C1236A6;
	Thu, 29 Jan 2026 11:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769683095;
	bh=nMixEuz/9FHnK51vm77F3Ms/6jsImOkK/TSTC2pE5dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfkENokvRwajQA+iJsJZZjRnSWL97CYzXASLnoaPFxfG4UiGkKRVPyc53/UR2m4I9
	 HcXU8KrSN1Euduqb/Gl+8sBbkvk+rZzOdaP91QphucHxz2c1tBI+x07x2CEg7qkfkM
	 +QWugFRLVsnaqDdtyxPxOqUlSgV06bPOKTeXIdFg=
Date: Thu, 29 Jan 2026 12:38:50 +0200
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
Message-ID: <20260129103850.GA3317328@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129012322.GC2223369@nvidia.com>

On Wed, Jan 28, 2026 at 09:23:22PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> > > The latter already have robust schemes to help the driver shutdown and
> > > end the concurrent operations. ie cancel_work_sync(),
> > > del_timer_sync(), free_irq(), and *notifier_unregister().
> > 
> > One a side note, devm_request_irq() is another of the devm_* helpers
> > that cause race conditions, as interrupt handlers can run right after
> > .remove() returns, which drivers will most likely not handle correctly.
> 
> Yes! You *cannot* intermix devm and non-devm approaches without
> creating very subtle bugs exactly like this. If your subsystem does
> not provide a "devm register" helper its drivers shouldn't use devm.

I'd relax that rule a bit. There are resources that drivers must never,
ever access after .remove(), such as MMIO. Using devm_ioremap* should
therefore be safe in all cases.

> > 1. At the beginning of .remove(), flag that the device is being removed.
> > 
> > 2. At the entry point of all fops, check the flag and return with an
> >    error if set. This prevents *new* fops from being entered once
> >    .remove() has started.
> > 
> > 3. At the entry point of all fops, flag that a fop is in progress (with
> >    a counter).
> > 
> > 4. In .remove(), wake up all threads sleeping in fops.
> > 
> > 5. At the exit point of all fops, decrease the fop-in-progress counter.
> > 
> > 6. In .remove(), wait until the fop-in-progress counter reaches 0. At
> >    that point, it is guaranteed that all fops will have completed and
> >    that no new fop can run.
> > 
> > 7. Complete .remove(), freeing resources.
> 
> This is is basically just open coding a rwsem.. :)

Yes, and that's why I wrote that my explanation was conceptual :-) I
think it's important for developers (at least the ones developing
subsystem integration for this, if not all driver authors) to understand
the concepts behind it. Then we can optimize performance with the right
kernel primitives. If we start the API documentation by talking about
SRCU, people will be lost.

> SRCU should be faster than this, IIRC it has less cache line bouncing.
> 
> But sure, it is all easy once you figure out how to give the fops shim
> some place to store all this state since people would not agree to
> make this a universal cost to all fops.

I didn't see any push back against Dan's proposal to store that
information in struct cdev, did I miss something ? 

> > > Yes there are other cases, and certainly I've commonly seen cases of
> > > drivers reaching into other drivers, and subsystem non-file ops, but
> > > these cases usualy have other more fundamental issues with remove
> > > races :(
> > 
> > Drivers using resources provided by other drivers is a more complex
> > problem. I'm thinking about a driver acquiring a GPIO in .probe(), and
> > the GPIO provider disappearing at a random point of time. Or a clock, or
> > a regulator. These issues are more rare if we ignore unbinding drivers
> > forcefully through sysfs, but they can still occur, so we should try to
> > find a solution here too (and the sysfs unbind issue is also worth
> > fixing). There, unlike in the cdev case, some sort of revocable API
> > could make sense.
> 
> IMHO the sanest answer is to force the depending driver to unplug
> before allowing the dependend driver to remove. Isn't that what the
> dev link stuff does? IDK it has been forever now since I've done
> embedded stuff..

I think it's the simplest answer, yes. It's a bit like using a canon to
kill a fly though, but all other solutions would I think be much more
complex.

-- 
Regards,

Laurent Pinchart
