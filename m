Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E2E46D2AF;
	Tue,  1 Sep 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260486; cv=none; b=MTdzxESKUS27GQv5yLExWb4FGnTCDtpD4tN0dNPjKFtvvBfdsoBUCd8l+cKmtea+mr3R7r4suaGmR4zzwrRAbjRS4cmO+dlB2QQS+KtfQZDbWrocMISC7ZUp9T0gIr6OUhotsxae8Yh7PM+iqdG51VfWqw4tOdz58wMNpDNfAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260486; c=relaxed/simple;
	bh=8jBuMd67Ol/N6kGxJ2O28/j+nc3UTyItyafL74h16Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WstJbIFN9tqqcY63wEZOPY4Cv/d61AV2CRQPxDBsJLCcUcMrBd92rMJbHaw5nnv27k88/LgYeOxmoZotUC8eBp6vDKGvg7nRh6tPPjhNjMe1iVJ0oumEt4rnzMvfk1Oa1O1yqKTBiZeWZ2ZeeyIwing7/JPqogIE8A5hz6nK1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObR1Hbvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObR1Hbvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9801F000E9;
	Tue,  1 Sep 2026 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788260484;
	bh=aHxVERBew5CgbQQj/MuD9uQI515uVkBhK5soxUtArlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ObR1Hbvx8mIlygu/0Q7wQ04cJeYLdBrCbKqhDMcBy15MfEa0QWJ2LL2T+loGt/Qiy
	 Erp5toxkW16/RHLQfLOnF8d7SBfPNX8x/b8ZGpzKQf9EUUi2POwKavf/485oXpqyge
	 bX4S1WxYPzWsSCuptkwjYSKznjido5rft1Kf8VHaYdz/gmnvGqc6XrM4YdIUepo6Q9
	 wxT59x27V95hx3ZnqXhUaXXYOEqRR6GcJYxOjlNoShRw2HBX+vsLW6Fz4PzS97Rc1r
	 uUiLKfhTB8B6Ri+fsU4TE6+Lrc/MrgBdtbGuHZ3H7cL0wvSkDW7/pbkRy18dBMYsqd
	 +mVzweO6p72Aw==
Date: Tue, 1 Sep 2026 14:01:20 +0300
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
Message-ID: <20260901110120.GJ24140@unreal>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
 <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
 <20260827170911.GG42790@unreal>
 <apGzqP6cEZ1miNmR@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apGzqP6cEZ1miNmR@intel.com>

On Fri, Aug 28, 2026 at 12:13:28PM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 27, 2026 at 08:09:11PM +0300, Leon Romanovsky wrote:
> > On Wed, Aug 26, 2026 at 06:38:58PM +0300, Konstantin Sinyuk wrote:
> > > On Wed, Aug 26, 2026 at 12:32:22PM +0300, Leon Romanovsky wrote:

<...>

> > The wording alone is not sufficient. Your proposal should be backed by
> > real devices representing different architectures from different
> > vendors.
> 
> Future Intel (and other vendors) hardware will include UALink.

I guess that, like most of us, you are not authorized to discuss or
comment on Intel's non-public roadmap. Can you point to any public
commitment from Intel to implement UALink in its devices?

I couldn't find one.

<...>

> > The current proposal is based on a single implementation, which is
> > unlikely to be ported to this new framework in the foreseeable future.
> > The amdgpu xGMI implementation already exposes the required UAPI through
> > sysfs and would need very strong incentives to abandon its "legacy"
> > users in favor of this new netlink interface.
> > 
> > The last new subsystem I am aware of was introduced with implementations
> > from three different vendors to demonstrate its robustness. You should
> > probably aim for a similar level of coverage here.
> 
> If we wait 3 different devices to show-up before we can start discussing
> a common API, then it might be way too late.
> 
> But of course, we can definitely move this netlink as is to inside
> drivers/gpu/drm/xe and call it xe_fabric and if someone else is interested
> in join effort we move that outside.

We are not talking about "waiting for", but about "being backed by".
The general kernel rule is that the second implementation is responsible
for consolidating the code. XE appears to be that second implementation.

Thanks


> 
> Thanks,
> Rodrigo.
> 
> > 
> > Thanks
> > 
> > > 
> > > Thanks,
> > >  Konstantin.
