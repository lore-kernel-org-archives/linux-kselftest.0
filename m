Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF6381708;
	Thu, 29 Jan 2026 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684200; cv=none; b=g2W/CI8+hGYLHzi4y4Mz0C5warewtbW6Dek2rXoe4ff+bUUzD2LtzZsX7seSjJ8L5KSDX7tzRd5+F4N9Zdbp69nOb2TQihfStQx0HuI7gVun7RsPWObMF0iuA0Fq6zQe2Q7Fjy+/KpQxIuEEc4mWov5KC8KZhrUc9njzIPGnKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684200; c=relaxed/simple;
	bh=D7I8EfWd7ND+QvFM1o9ANyCbcetpqlyES+/JHz6LKo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjkyRBXybN3BOdSD7WcraAwOAmoE6bjq5MAef3hxR5Ouj10YEfyDzR2qKXlJ12vk6HmvCY9NwLoQ4RUbQo2rdW6bOAIwIaMXSKzL031JALdBE8H2524CzmJRCZXEQRVuPcxKiYqnvhf1DXZJpCFPMLX4dGkMuPoX4xRlstgXZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mD56/ZSo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mD56/ZSo"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C41321AED;
	Thu, 29 Jan 2026 11:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769684158;
	bh=D7I8EfWd7ND+QvFM1o9ANyCbcetpqlyES+/JHz6LKo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mD56/ZSo3NVyNmCC7IxS6vn5SUGHcztlWtaV89okTlis+T4VLvNXPtWZmA5M1JCug
	 Cel9cG+jA9Nqiqb39rwheIaPha3wQOIRTYyJG9TnDR8i0VKTsoikSt9W6tk+CEcpL9
	 yeV5+18o/eMS0VO2OPA+3ZMR86GzKZR3Hncy2rgc=
Date: Thu, 29 Jan 2026 12:56:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129105634.GC3317328@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com>
 <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>

On Thu, Jan 29, 2026 at 10:11:46AM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 28, 2026 at 4:48 PM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Jan 26, 2026 at 2:50 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > It's certainly possible to handle the chardev unplug issue without
> > > > revocable as several subsystems already do. All you need is a refcount,
> > > > a lock and a flag.
> > > >
> > > > It may be possible to provide a generic solutions at the chardev level
> > > > or some kind of helper implementation (similar to revocable) for
> > > > subsystems to use directly.
> > >
> > > This echoes the heated exchange I recently had with Johan elsewhere so
> > > I would like to chime in and use the wider forum of driver core
> > > maintainers to settle an important question. It seems there are two
> > > camps in this discussion: one whose perception of the problem is
> > > limited to character devices being referenced from user-space at the
> > > time of the driver unbind (favoring fixing the issues at the vfs
> > > level) and another extending the problem to any driver unbinding where
> > > we cannot ensure a proper ordering of the teardown (for whatever
> > > reason: fw_devlink=off, helper auxiliary devices acting as
> > > intermediates, or even user-space unbinding a driver manually with
> > > bus-level sysfs attributes) leaving consumers of resources exposed by
> > > providers that are gone with dangling references (focusing the
> > > solutions on the subsystem level).
> >
> > What I've been trying to get across is that the chardev hot-unplug issue
> > is real and needs to be fixed where it still exists, while the manual
> > unbinding of drivers by root is a corner case which does not need to be
> > addressed at *any* cost.
> >
> > If addressing the latter by wrapping every resource access in code that
> > adds enough runtime overhead and makes drivers harder to write and
> > maintain it *may* not be worth it and we should instead explore
> > alternatives.
> 
> Alright, so we *do* agree at least on some parts. :)
> 
> I agree that any such change should not affect drivers. If you look at
> the GPIO changes I did or the proposed nvmem rework - it never touched
> drivers, only the subsystem level code. The latter especially is
> really tiny, in fact:
> 
>   drivers/nvmem/core.c      | 172 +++++++++++++++++++++++---------------
>   drivers/nvmem/internals.h |  17 +++-
> 
> is all you need to make it not crash in the situations I described
> under that series. Runtime overhead in read-sections with SRCU or
> read-write semaphores is negligible and typically we only have to
> write on driver unbind. So that "wrapping every resource access"
> sounds scary but really is not.
> 
> GPIO work was bigger but it addressed way more synchronization issues
> than just supplier unbinding.
> 
> For I2C both the problem is different (subsystem waiting forever for
> consumers to release all references) and the culprit: memory used to
> hold the reference-counted struct device is released the supplier
> unbind unconditionally. Unfortunately there's no way around it other
> than to first move it into a separate chunk managed by i2c core.

Isn't there ? Can't the driver-specific data structure be
reference-counted instead of unconditionally freed at unbind time ?

> But
> that's not the synchronization part that leaks into the drivers, just
> the need to move struct device out of struct i2c_adapter.
> 
> > This may involve tracking consumers like fw_devlink already does today
> > so that they are unbound before their dependencies are.
> 
> During Saravana's talk at LPC we did briefly speak about whether it
> would be possible to enforce devlinks for ALL devices linked in a
> consumer-supplier fashion. I did in fact look into it for a bit on my
> way back and it too would require at least subsystem-level changes
> across all subsystems because you need to add that entry point at the
> time of the resource being requested so it's not a no-cost operation.
> But it is an alternative, yes though it'll require a comparable amount
> of gap-plugging IMO.

I recall at least one driver (omap3isp) having a circular resource
issue. The ISP hardware block has the ability to produce a clock for the
camera sensor, and the camera sensor is a resource acquired by the ISP
driver. It's quite rare, but it happens. I would however not reject a
solution that would solve the 99.99% of the problem without addressing
this.

> > Because in the end, how sound is a model where we allow critical
> > resources to silently go away while a device is still in use (e.g. you
> > won't discover that your emergency shutdown gpio is gone until you
> > actually need it)?
> 
> Well, we do allow it at the moment. It doesn't seem like devlink will
> be able to cover 100% of use-cases anytime soon.

We have this issue because designing resource management is hard. The
decision we made not to pay that cost has now turned into a huge
technical debt. There's no easy way around it, it won't be easier to
solve it correctly today than it was years ago. I don't know when we
will be able to fix the issue, but I know it will happen only when we
decide to face the situation and stop with band-aids.

What I think is the biggest issue at the moment is the lack of
motivation/time/money to address this huge, but I'm hopeful because I
trust the technical expertise of the community.

-- 
Regards,

Laurent Pinchart
