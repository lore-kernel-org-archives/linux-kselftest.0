Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75E3A1A4A;
	Tue,  3 Feb 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127200; cv=none; b=ZVqq1xciUyX6tSQAKW4Hg7E5HkPJ1bTaW3q9AIJIMHLHEEaJdklUYIB5yRevujZ5l28+20YB+ZUTPG3S8xOwg+gb/oV1ZqT1JVH/5C6e9MXMcmseoi9rvpAPHhaAggqRn4TpXeLL6zDGH9B+cfZq0TLqXXRKNNXCVTpBZeOBIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127200; c=relaxed/simple;
	bh=TG9/1LcMGYLr3rcyspmdA1milw4EX42a6oeq9dGrChU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFM0aOX8kTX9brY+VqU7hDdbbE0TT2vH9Q5L36DyIpvgclvSF3BdqxMdV5iCNL4kAMIHdBiiIluaVN6XfxHVNBEVVL0wjKlc0X/zc09cQ/Y9lL1fEdYL8uXh5olWfnDB/oYodlyfZxjU30a/08hVBhjDiB4wJhmcqAoOdL8JS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l8FmCIw4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l8FmCIw4"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B6EE1C6;
	Tue,  3 Feb 2026 14:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770127155;
	bh=TG9/1LcMGYLr3rcyspmdA1milw4EX42a6oeq9dGrChU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8FmCIw4vDfvDpyiqqirPeODMsRr68XLbwksjNPP/TcJOkrpWcP47jscYqAiRgZlo
	 rEDqTfSKXioEk0Vvv9KiVANuN47G/ZLi5v2UuK7DYpLSGLKxaH33KD3NV9qEEYcNmB
	 fYEBzFPI1iN+cv9KgBMj+mwqfder+oEjFcpVhd7U=
Date: Tue, 3 Feb 2026 15:59:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260203135955.GB12013@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <DG1FF2VY54AO.2Q3YHA4WNLV5C@kernel.org>
 <20260130091049.GH3374091@killaraus>
 <20260203-lyrical-taipan-of-enhancement-df5615@houat>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203-lyrical-taipan-of-enhancement-df5615@houat>

On Tue, Feb 03, 2026 at 10:10:57AM +0100, Maxime Ripard wrote:
> On Fri, Jan 30, 2026 at 11:10:49AM +0200, Laurent Pinchart wrote:
> > On Thu, Jan 29, 2026 at 11:29:03PM +0100, Danilo Krummrich wrote:
> > > (Cc: Maxime, Thomas, Maarten)
> > > 
> > > On Thu Jan 29, 2026 at 2:08 AM CET, Laurent Pinchart wrote:
> > > > That's what I've been advocating for. The best way to ensure that driver
> > > > code will not accessed data freed at .remove() time is to prevent the
> > > > code to run at all.
> > > 
> > > With this we are in full agreement, I think that'd be best too. But, I also
> > > think that sometimes this isn't possible. For instance, DRM has such a case with
> > > atomic mode setting.
> > 
> > I don't see why it would be impossible there.
> 
> I'm not quite sure what you have in mind there, but DRM always allowed
> the DRM driver to stick around longer than its device to accomodate the
> fact that userspace might still have an open fd to it.
> 
> If userspace has an open fd, it can still call ioctl so preventing to
> run any code is going to be difficult.

Preventing new ioctls (and other fops) from being called isn't
difficult, they can be blocked at the entry point, outside of the
driver. In-progress ioctls running in other threads can also be forced
to complete before .remove() frees all memory. I think this is the right
thing to do.

The only fop that we can't completely prevent from running is
.release(), as we can't wait until userspace closes all file handles and
unmaps all memory before .remove() completes. There are solutions for
that.

-- 
Regards,

Laurent Pinchart
