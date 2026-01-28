Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC901531C1;
	Wed, 28 Jan 2026 23:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769643644; cv=none; b=ux2M3C74FZ71xf2SX6kple50hrhzH1vOF7y6WngKONDYH3390NuLtZZXAvx6EnJC1JsiicB/Fxlz17T23wC9KZh0eVfKZEjjMoqluIFuSmDVEuaBnJJBdR1vb4T2s71ZosfPK7zjpdfF0lEzTmqfFbbkbFteD4wyOhmbx05VLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769643644; c=relaxed/simple;
	bh=BVCcFC/P3eYHZqp3dB7Pn3Yh9dSiO5hqJmi1gbbnkdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/Uihmo6RaC6vtOPoNOkEUuQ+Ud1oufKFuPARuqjDzePZRqgZg9Sq11UtrqcxklR8iU0l8yrRPtDDU7hoEDsqfZPnvchBbkdLqZ2TYYrV023JNdOj96lq3ykKeEXgXtHgu0U8Qw0QQD8y++Ui+rcCUVlDfQaPkC7wrMPqJJkvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QAxp3sRR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QAxp3sRR"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B93B581;
	Thu, 29 Jan 2026 00:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769643604;
	bh=BVCcFC/P3eYHZqp3dB7Pn3Yh9dSiO5hqJmi1gbbnkdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAxp3sRRADR2mI5xyl0/sCqt4idZASopXlwbjaQ25+wyirr8XEA8mz6lUvAwwOQx8
	 aPaQtDEZl18sI+Fp5v5urx65mRemxu+IXj1vKfU4PzfCQyuCxFPAA5/kW+MhJLWPrH
	 lOYCGM8WsUuF3tb9229rBAmEQLQV4oMf8y1QkjWs=
Date: Thu, 29 Jan 2026 01:40:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260128234040.GC3275574@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
 <20260126000730.GI1134360@nvidia.com>
 <DFYNFXYTXBIW.314K249BPTA1Z@kernel.org>
 <20260126170720.GN1134360@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126170720.GN1134360@nvidia.com>

On Mon, Jan 26, 2026 at 01:07:20PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 05:08:20PM +0100, Danilo Krummrich wrote:
> > On Mon Jan 26, 2026 at 1:07 AM CET, Jason Gunthorpe wrote:
> > > That's the whole issue with DRM right there - allowing driver code to
> > > run after the driver has unregistered from the subsystem is
> > > *dangerous* and creates all these bugs.
> > 
> > Unfortunately, it is necessary (at least to a certain extend) in DRM. I think
> > there is space for improvements, but I don't think we can get rid of this
> > entirely, especially on the KMS side AFAIK.
> 
> From what I saw alot of the issue with DRM was how it works the fops,
> instead of the core subsytem managing the fops and calling the driver,
> the driver managed its own fops and called back to the core.
> 
> Sure, the issues may be very hard to fix in existing code, but I find
> it hard to swallow the idea that a subsystem couldn't own all the
> fops/etc and guard every driver callback with a lock to generate the
> right kind of fence..

I also don't see a real technical reason. Retrofitting the right
solution in all existing drivers wouldn't be for the faint-hearted
though, so I understand the appeal for subsystems of a quick and easy
suboptimal implementation.

> > > IMHO since rust has the Device<Bound> stuff the revocable should have used
> > > rwsem, because the expectation should be that the majority uses access, not
> > > try_access.
> > 
> > Yes, the majority of uses is access(), not try_access(); not sure if rwsem is
> > the better solution though.
> 
> rwsem is much faster on destroy and somewhat slower on read. Which
> sounds to match the use case here. Ie you wouldn't need to do special
> effort to bundle the synchronize_srcu()

-- 
Regards,

Laurent Pinchart
