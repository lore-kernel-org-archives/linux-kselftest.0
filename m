Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A123BCF7;
	Fri, 30 Jan 2026 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764256; cv=none; b=tZqeNCqiGBLO3myB7zPQxWBCEQLSM1nfDa3T257+8tA9f/yCml0F4kvFtrZfuUrIXqE+/ZSlv5gI/FBXrO7V34b0Mcu1qYumrg5xkK2wXn9wb8WyFka75UjR4aZ2AqbWE6ipjIugcCotIcoOPUZw7myzYHuztuyCOnbAeKR2Qdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764256; c=relaxed/simple;
	bh=g8NInngSP4JQW49dK+CcmwLJmBM7XnFr0I4GZEvsfu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHnvPtEReg2LA7jmxt/Kc83mBlQB7YbbRuPeTM1lrrycULhJmcYsR2fSUHLB+ubYzbjjRywrQw3IJSYrVdfzZVCXls4JlzIagfUx/Boi+T4fESxjjPOHxj6pzRPVVwr873DgjRU4zCXf96DEqyzJGHPDoOH7msKdUvv4icUx3i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SDiYx7ub; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SDiYx7ub"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA4AD3A2;
	Fri, 30 Jan 2026 10:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769764212;
	bh=g8NInngSP4JQW49dK+CcmwLJmBM7XnFr0I4GZEvsfu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDiYx7ubFQZHN9BK5KjsxQlPR292p/G4VPlbfVXqVPYSpliIz6rcNAFPSrhQMzd02
	 UdMbr0ATTVdZqiVkLtpzT2E3krDdziXT6c2ilCa7QQd5d6qGVhVg3k20I/d5oLSEW8
	 Ika/2VPCnCR3kuVTsL+J1j52Wh9X18CPvaStKkgk=
Date: Fri, 30 Jan 2026 11:10:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260130091049.GH3374091@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <DG1FF2VY54AO.2Q3YHA4WNLV5C@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DG1FF2VY54AO.2Q3YHA4WNLV5C@kernel.org>

On Thu, Jan 29, 2026 at 11:29:03PM +0100, Danilo Krummrich wrote:
> (Cc: Maxime, Thomas, Maarten)
> 
> On Thu Jan 29, 2026 at 2:08 AM CET, Laurent Pinchart wrote:
> > That's what I've been advocating for. The best way to ensure that driver
> > code will not accessed data freed at .remove() time is to prevent the
> > code to run at all.
> 
> With this we are in full agreement, I think that'd be best too. But, I also
> think that sometimes this isn't possible. For instance, DRM has such a case with
> atomic mode setting.

I don't see why it would be impossible there.

-- 
Regards,

Laurent Pinchart
