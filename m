Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA833264DA;
	Thu, 27 Aug 2026 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850556; cv=none; b=K7RO2UBZq0diwXxGNxhFTlbefHpCposCc4S7rz7oIsNZilg3jEV6j+xk712ZoPp/IlCpk2A9QBWnpzrcPDMefw/mhpkcCGlrZ7QnRqO/0FvI18w6PnOPiBeZjrcLmQz9dezBIyYTbYApaPaCa4FZBNan5E5J6DxtYkCpG3DE2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850556; c=relaxed/simple;
	bh=XsgjWEza/jlVxyJ3C6ruuoSk3ktRa5DTQ+KkAq38LYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOY8MhG+3KvYDryVBgZewOH6KxqaUpNnykyaW1gpxZGjIJJvVnXy1XaLcJ9B53UA8ZTGTDHpEQCdQgZIkvTbydzVMpazfqoKnVr4A80zX3W5KPaEsoKZYBP1KtlLz/VXTFVXa3Z9Uiw40dWWJLt0uroEzRW9Pg1t4dhEvkjETFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIqrCKX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIqrCKX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33F01F000E9;
	Thu, 27 Aug 2026 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787850555;
	bh=pxe2I/QgTe79nkIJa+GTgxKyMaq8Csj03/OYd3xEmvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VIqrCKX+wTnEtyc/9X0BbcUg6tAVAJ9EMfYxSM8vmU3EhE/Yt5rr5/fOgjMkfh58Y
	 ets88aLe5ekWPr0NVaExRb/K6efqyMVnP1WMEsDryNmV+aQlHDOzuY7PBBQKFRjjvp
	 N0HhCHm6ADoqx9YwUov91e6cZ27S8QV7NoSsKmObVbhPbiAtpiAKF4ieKi65jsYzHy
	 cam03ruaoNkQ67HEdw04GLiXfPvbXcd+9ydohe7v/ysuhRNsDRsuMhOA4TTZO3RDUw
	 Xu0X0fv/0c+57n3yGziCLiAbmpkxC9ds8YKp/X2jE2yrEvpvlEjyu2d6zqmOcCWciS
	 Xvl24iyzVJIeA==
Date: Thu, 27 Aug 2026 20:09:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
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
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <20260827170911.GG42790@unreal>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
 <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabric-leon-reply.1787844400.ksinyuk@kernel.org>

On Wed, Aug 26, 2026 at 06:38:58PM +0300, Konstantin Sinyuk wrote:
> On Wed, Aug 26, 2026 at 12:32:22PM +0300, Leon Romanovsky wrote:
> > Tell your AI that this is not how things work in the real world. The chances
> > of multiple hardware implementations fitting a software model designed
> > without considering the actual hardware are effectively zero. This is why
> > successful subsystems have emerged from consolidating support for multiple
> > existing hardware implementations.
> 
> Fair point. The simulator validates the implementation, not whether the
> abstraction fits real hardware.
> 
> The model was shaped by the public amdgpu xGMI implementation, and the
> cover letter asks AMD whether it covers their requirements. It still
> needs validation against production implementations, and the read-only
> milestone will not be proposed for merge without a production provider.
> I will fix the wording in the next revision.

The wording alone is not sufficient. Your proposal should be backed by
real devices representing different architectures from different
vendors.

The current proposal is based on a single implementation, which is
unlikely to be ported to this new framework in the foreseeable future.
The amdgpu xGMI implementation already exposes the required UAPI through
sysfs and would need very strong incentives to abandon its "legacy"
users in favor of this new netlink interface.

The last new subsystem I am aware of was introduced with implementations
from three different vendors to demonstrate its robustness. You should
probably aim for a similar level of coverage here.

Thanks

> 
> Thanks,
>  Konstantin.
