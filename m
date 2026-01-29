Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8583112B4;
	Thu, 29 Jan 2026 01:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648992; cv=none; b=GUr/0pdGA7WvicwPASDJfLwx+m9dvm+fGVJf5+jiGpzVCfJm3hrdK+h3Z9l2oBkSQWUamTTDmafcnwKRVNGYEaAEk8GdhqGu4xweged+os0eH1ixko8bkSgh6/hJCEJG5kHAae7R33+B5zUfhKzWkmH3AfaS1NCtC3eXXc4BiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648992; c=relaxed/simple;
	bh=1NZ7Q0fzMrKycm9djpADcZBie3m0VuDp/W9FsV9ep7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw4AY5oiIYWgdEBhPZdMSVmBjE3z4nmQIfBjJA5KS2q1bqw7/6kVO92/KoJBeOzotf7r6d9ZadNJj0cDqaCb7YbkfAS0PD6tUHACMV2QueQg5AWxweGQjh2X+1HhHa7Ie+6pXe6jZWf8I8wpPz5KcyoW7kW2qygkRAkAVmHKqV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eWhhkOsi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eWhhkOsi"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D5FBB6A6;
	Thu, 29 Jan 2026 02:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769648953;
	bh=1NZ7Q0fzMrKycm9djpADcZBie3m0VuDp/W9FsV9ep7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWhhkOsieAgsOXXz+SRW7PyuigZ1jlygJpdFiLbCtAO8TlsyUXSqSvF8stT8BuG33
	 1HmZNnU9auHGv8LCx96zwryvopwg0YeTKGbqxB+zXzwFyoXAzHcnkZk0W/XtVzWeVQ
	 nEYxbJ1iV5zhRtQ2d5h3L/Z0+FGEd8bUdh2PICMQ=
Date: Thu, 29 Jan 2026 03:09:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129010948.GD3275574@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <20260125132250.GP215800@killaraus>
 <DFXQ915MAG5K.2KYVQOTF056N5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DFXQ915MAG5K.2KYVQOTF056N5@kernel.org>

On Sun, Jan 25, 2026 at 03:07:41PM +0100, Danilo Krummrich wrote:
> On Sun Jan 25, 2026 at 2:22 PM CET, Laurent Pinchart wrote:
> > It's the wrong solution for most cases, if not all. It will spread in drivers
> > and then become another big piece of technical debt we'll wish we had never
> > merged.
> 
> It is a matter of how the revocable pattern is adopted. I.e. I don't think
> drivers should create instances of revocable (device) resources by themselves.
> Instead, I think it should be up to the corresponding subsystems to adopt the
> pattern in the way necessary and make it accessible to drivers instead.
> 
> > We know what the right solution to the cdev race is
> 
> So, what is it? Assuming that this is what you are referring to, how do you
> prevent accesses to (potentially freed) device resources after the bus device
> has been unbound from the driver for subsystems that may still call back into
> the driver after device unbind?

I've answered this question in another e-mail in this thread, see
https://lore.kernel.org/all/20260129010822.GA3310904@killaraus/

-- 
Regards,

Laurent Pinchart
