Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6423B8BD7;
	Mon, 31 Aug 2026 22:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214101; cv=none; b=IeBsmi5dxgZws4cu8jshfW74xJeHKA8tCLpL0aEU3mSOiN8+NXrB99UH1uDv8i4WgKD+EV36NUOT5L9mcLFtH/0cXMSOt3tjAzL8IcmhvjGfkQ96DtgdSsX/Qipa5Cqvgg7jmXd9tBvS7P/3hMMLOHvW4gLS+cOuHOU6mi39Xog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214101; c=relaxed/simple;
	bh=+oYOJckWkX5SCeN5w7JiWlw5djvkJse5eG/NzUHAKVc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GT3nbsCGVIzUME9/1oYPxY/0yKQc3X5LJuV2Y0gj8ObkSWTL+cniM4IHknWyKZ3ItTesU8aW70yRlUN4bkHheYC12R4g8v+D/s+MmufDfl64+l+9qDAemJC7y3F9NjDMBMES7AQKVFIgVKUYfKLzp85XeoiMsc2OOEy4R8LcZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKQlSAbG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKQlSAbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE8D1F00A3D;
	Mon, 31 Aug 2026 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788214099;
	bh=VvpSBhgZ9OJtnVm2KQzxl0hJHaepOuc3OcxhQ8/SrA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mKQlSAbG8GQWyPJkJkXZ+h8xZRua2JtHkL++05tvNt7M4utn4jkhwAjv5+QiROCE5
	 x/p4IIS8YCjyx7gp5w1L3DDnp9DgBmsk7ivkJIyuTWQUY2nVI5jvgA7dp25CtMv8Da
	 SBpbG2fBH2hwy6DEJ2DkvOLflwlpTG39ws1W99nPa0fWqQT1f5LGhJHH6wa+JiT9LI
	 qBpXM431L9wa1sntyD8U3FB2QXFTetH8jv4+j3GpzdSHWDvQswtM8ACrJ9W7T/t6so
	 6LNdpQH8stngw0h45M4fqnd8JPvEuDUNEH4qfvGFBc/ysyB5m1mMqOWgFeKN8Lq7W1
	 cP2gRyeo3/48g==
Date: Mon, 31 Aug 2026 15:08:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 1/2] netdevsim: add link speed support
Message-ID: <20260831150818.660de896@kernel.org>
In-Reply-To: <20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
	<20260831-nsim_speed-v1-1-7a651ee65738@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 11:28:10 +0800 Hangbin Liu wrote:
> Add ethtool get/set_link_ksettings callbacks to netdevsim so the simulated
> link speed and duplex can be queried and configured from userspace.
> 
> Move NSIM_LINK_SPEED_MAX and NSIM_LINK_SPEED_UNIT from dev.c to netdevsim.h
> so they are available to both the devlink rate path and the new ethtool
> code. The set callback rejects speeds exceeding NSIM_LINK_SPEED_MAX.
> 
> The default link speed is set to SPEED_5000 with DUPLEX_FULL, matching the
> existing NSIM_LINK_SPEED_MAX definition.

This breaks TDC which uses netdevsim for taprio testing.
You posted 2 series for net-next and both broke tests.
Please try harder to test stuff locally.
Matt added support for Docker to NIPA so you should be able
to repro all ksfts locally. If something doesn't work please 
report back.
