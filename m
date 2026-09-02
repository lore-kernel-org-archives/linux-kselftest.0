Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732843AA507;
	Wed,  2 Sep 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333052; cv=none; b=QlXwzZIOckIG+0rjIjV4dya6xlM0Br/vpw4tsRsfmDhP+duI9prob9l46ZphF/33AsP+5pId7PuZfVMpGrGI/XvQf/emE+G6pIMcKnmk1sXGHackwPMWue6502TpW/c0EN5428Pz3BWGAw9zN/ONU04Iam35KPSjoSlsZDWD/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333052; c=relaxed/simple;
	bh=/QkyG+EW56yb91W7GpHwkIW7ZpFcQkBMg7os0TFdp40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3QFmnP7MLIuPXX7TenEJTz31gw9UZAOesyvwc3p1p41zr4SPw9gHBRLuZfQESpFkXEFXMehtvzLEdIh0uVLbuaN4yH9ZrNHUo9+TfXdj0jp7/n34C6TumT2qKS29jvnHjX6+thUl/XpM55XFGwjqFBAkRaiuFKp4HoUiKIngdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgf4am5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgf4am5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F0B1F000E9;
	Wed,  2 Sep 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788333051;
	bh=mkNkOka81TvpWCQXQjDjyJBfSTFlkGAdLKmI+ByzmA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fgf4am5jJyE90OYVghPGqx5FnXVzC3IblXws4qY6hJm0WyQefrF4575MQL3G/l4MY
	 N/JKZ5NxbpGHS4wd16VXnd05KQVIMyQFlwul74Aj5sQaVryHgIG+xOz2TAYZ2EXGF3
	 i/IG9NXREMeP94enEFmcBKJ1S6aBlBhUnl7yQWrX6f74T12zNIIWNRg+O6K4+MDsPn
	 HzaA6XUF/1pviVzCLux4iZxYmsMY0090vUbYnTF2TA0NrtFJQ2VviYRpuIWwr1KhKE
	 up/Fb5Dd/FQ+4qvJbBQeLjkFmrtRVn0hgyMxtHEA8n4zboXeFMIXeily+BOf+XUXvf
	 5zBo04c2/Buug==
Date: Wed, 2 Sep 2026 10:10:46 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Konstantin Sinyuk <ksinyuk@kernel.org>, dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Francois Dugast <francois.dugast@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260902071046.GO24140@unreal>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
 <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
 <20260827170911.GG42790@unreal>
 <apGzqP6cEZ1miNmR@intel.com>
 <20260901110120.GJ24140@unreal>
 <apbuUsS_3RVbB5vh@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apbuUsS_3RVbB5vh@intel.com>

On Tue, Sep 01, 2026 at 11:25:06AM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 01, 2026 at 02:01:20PM +0300, Leon Romanovsky wrote:
> > On Fri, Aug 28, 2026 at 12:13:28PM -0400, Rodrigo Vivi wrote:
> > > On Thu, Aug 27, 2026 at 08:09:11PM +0300, Leon Romanovsky wrote:
> > > > On Wed, Aug 26, 2026 at 06:38:58PM +0300, Konstantin Sinyuk wrote:
> > > > > On Wed, Aug 26, 2026 at 12:32:22PM +0300, Leon Romanovsky wrote:
> > 
> > <...>
> > 
> > > > The wording alone is not sufficient. Your proposal should be backed by
> > > > real devices representing different architectures from different
> > > > vendors.
> > > 
> > > Future Intel (and other vendors) hardware will include UALink.
> > 
> > I guess that, like most of us, you are not authorized to discuss or
> > comment on Intel's non-public roadmap. Can you point to any public
> > commitment from Intel to implement UALink in its devices?
> 
> That's the only public support commitment you will find for now:
> 
> https://ualinkconsortium.org/blog/intel-supports-ualink-for-scale-up-networking-829/
> 
> as an active member of the consortium
> https://ualinkconsortium.org/members/

I saw that PR article, but I couldn't find anything on the Internet stating
that "future Intel (or other vendors') hardware will include UALink."

So, for now, this RFC can be considered an academic project.

Thanks
