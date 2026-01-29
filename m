Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94FB30BF69;
	Thu, 29 Jan 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698152; cv=none; b=OpUWeyFQL3Cz8yna7YqW5pZyVGHXFCnvx4VRzayAIfep57AxBx6jJ+J1uA6sp/XJpe80/5Jzeb4v60q0aWP5gC1X0RB+QyO9v+SeY4d3JZ6RdM8EplrjywA4zq83fxW/9EGG2jTfbW8ztpWFe9StZrRwdMs1sKkmBJga7JLFSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698152; c=relaxed/simple;
	bh=3OFesdCOAZRjxNPgVnBhECbH0qSXvEqeFysYg1eOLiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av3CZYdJvKgXyXFAFez8bZNiGS4aYwmPddza4pX6Xf5XGPMUei/PWGehpqqDc2Symgj+5NCH/Im56zmfenskohvXx+tEyrJJX8Wl6cw/Jf2B2os73EAvAGd5Cj9Yuw+/EgzhFLK6oeOSO3Yd1+6HmAaKXraDQuVnXv0JN4XUiuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YAs//N8A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YAs//N8A"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 80E0F1661;
	Thu, 29 Jan 2026 15:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769698110;
	bh=3OFesdCOAZRjxNPgVnBhECbH0qSXvEqeFysYg1eOLiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAs//N8AKeJ4wDAhJ1oe6ndvYf5O/WvYpaQ99gpKEsSFvX3ZfIAPPUfydLpVfjgV0
	 omnYHajzyLCHbjpGUA8t+hxGBPyfznEzz7kP3NIycZuETDC6EtOagwsbpNzI4g1omp
	 q2L1YYOsheQdMs8zN41MGDJmsK+xagcSDNJuaI/0=
Date: Thu, 29 Jan 2026 16:49:06 +0200
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
Message-ID: <20260129144906.GE3327197@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com>
 <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus>
 <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>

On Thu, Jan 29, 2026 at 08:50:30AM -0500, Bartosz Golaszewski wrote:
> On Thu, 29 Jan 2026 11:56:34 +0100, Laurent Pinchart said:
> > On Thu, Jan 29, 2026 at 10:11:46AM +0100, Bartosz Golaszewski wrote:
> >>
> >> For I2C both the problem is different (subsystem waiting forever for
> >> consumers to release all references) and the culprit: memory used to
> >> hold the reference-counted struct device is released the supplier
> >> unbind unconditionally. Unfortunately there's no way around it other
> >> than to first move it into a separate chunk managed by i2c core.
> >
> > Isn't there ? Can't the driver-specific data structure be
> > reference-counted instead of unconditionally freed at unbind time ?
> 
> Oh, for sure, if we did from the start. But we did not and there are now
> hundreds of i2c drivers that do:
> 
> struct my_i2c_drv_data {
> 	struct i2c_adapter adap;
> 	int my_other_drv_data;
> };
> 
> and in probe:
> 
> struct my_i2c_drv_data *data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> 
> (or just kzalloc() with kfree() in remove, it doesn't matter)
> 
> and the ownership of that data belongs to the driver. There's no way we could
> address it now so the next best thing is to work towards moving the ownership
> of struct i2c_adapter to the i2c core and make it reference counted using the
> internal kobject of the associated struct device.

What I'm reading here is essentially that we rolled out devm_kzalloc()
too quickly without understanding the consequences, and it has spread so
much that it can't be fixed properly now, so we need to find a
workaround. And now we're trying to work around the problem by rolling
out a revocable API that has barely seen any testing, and is known to
have design issues. Does any one else see the irony ? :-)

-- 
Regards,

Laurent Pinchart
