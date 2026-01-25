Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697631B136;
	Sun, 25 Jan 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347477; cv=none; b=PU3q6rr/3zQot32m/KlzeC9OXNiaoWyOJiWTUtmPwQ3GGWU5/xx+rTkXaOXJoCQ4iukfzZRJUUz8SiUUsCSUJ8Y3snJsnzibMyYwvrN/kz5E+NywutWoqHGuARSbGJeDH0FLbnW7E4c3UXwJNp+q5QTef3LyU/ZcfHQNFD/6TW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347477; c=relaxed/simple;
	bh=GWmsRHMxP7pom5yZB/8L2+GDeJ6YYxxz4OEIRIlACnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUGYs7xvP5wRjXTIAmLpK2X391uO8+UKeAwpjupvu8F4Cuq+U/oAzpywUSRQhjuGaALRTwyiSlnuL/TwoRuHlhnA4IWYBeOpoRNBlSlMZLCXGXXYpg4+zD/LeaOIQoW1u3Tq15IUekTasPFELK1WmrJ3TDmSJ5qJ5goQl4mK9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QZ1rnoM8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QZ1rnoM8"
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B75205B3;
	Sun, 25 Jan 2026 14:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769347440;
	bh=GWmsRHMxP7pom5yZB/8L2+GDeJ6YYxxz4OEIRIlACnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZ1rnoM8yf0PnCdCljP028uSAMAaj+td9VL/iDmIbgDkkyztCtqQwjAWfqowvV4D9
	 67LUxs3FhaDmLZjLiD0gkIzvrFi8Sfo6FjvPRrNcbYWdOPvdiazYokKtx0tdTF62zc
	 LVbmr9NKLEkxvoHdRBvHwWyGzrU0+f0CK7EbiTIU=
Date: Sun, 25 Jan 2026 15:24:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
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
Message-ID: <20260125132433.GQ215800@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026012554-chatty-policy-42a1@gregkh>

On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg KH wrote:
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

Revocable is not needed in V4L2.

> Note, other OSes also have this same problem, look at all the work the
> BSDs are going through at the moment just to get closer to the place
> where we are in Linux today with removable devices and they have hit our
> same problems.
> 
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
> 
> So I don't want to take these reverts, let's try this out, by putting
> this into the driver core now, we have the base to experiment with in a
> "safe" way in lots of different driver subsytems at the same time.  If
> it doesn't work out, worst case we revert it in a release or two because
> it didn't get used.

-- 
Regards,

Laurent Pinchart
