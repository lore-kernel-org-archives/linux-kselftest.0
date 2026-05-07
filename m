Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69C3E928F;
	Thu,  7 May 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150865; cv=none; b=sS8LaKPiL158X7lWz4vDGOy0l+o4h/rsf24djFYq8JXXwEkM6zNIGNnQIoC6Kn4x9pb0u3xkmWMUoEb3720dbsYQDTra7Rpg8Sl+lZo5CC1Dq9H3VSa011x5ec99MwjUC9klsgm85moOvNfoaaWltHVU0BCzdptlJDPzUKLFcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150865; c=relaxed/simple;
	bh=SL/Uzqz/QGgF/VweKAgSNoRQLTvda/ncyjudgCEBgRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NixXWDazN+pRQYKvklCqh4QeOk3Jcs1Gso6gFVj5a8FJyVa6lR0Dw+V0Tr9T+xj/qMrxNorlv71nWNjjDLTc/RCTRCoioYPAlcXMi4VqNpPS6e5ygT5MGSINB70YWPaXPX/z6NSI5/vI3MX5SyqEZwJF7hQOm1VevCKbohOOgT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FfYWQsHm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FfYWQsHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE7BC2BCB8;
	Thu,  7 May 2026 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778150865;
	bh=SL/Uzqz/QGgF/VweKAgSNoRQLTvda/ncyjudgCEBgRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfYWQsHmOktZ2TmkIshnu17gSrdX0iSYCPdI04qYxIGtue/fQKrL6170OdOk8vs68
	 jilmS3xkTXbfr9kBXo7qXJfkfHLYnvQsORJtY9Tjpp/VGFu7XPmGPZ91SF+0dCCF1a
	 ulz/iJTOBgX1TiZuHms854YYHJ2iQKEIVh9KDxRI=
Date: Thu, 7 May 2026 12:47:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <2026050739-football-dreamy-351f@gregkh>
References: <20260507070547.2268452-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>

On Thu, May 07, 2026 at 03:05:45AM -0400, Sasha Levin wrote:
> When a (security) issue goes public, fleets stay exposed until a patched kernel
> is built, distributed, and rebooted into.
> 
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
> 
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
> 
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped on
> the next reboot.
> 
> A lot of recent kernel issues sit in code paths most installs only have enabled
> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock, ax25,
> and friends.
> 
> For most users, the cost of "this socket family stops working for the day" is
> much smaller than the cost of running a known vulnerable kernel until the fix
> land.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This is kind of funny, but understandable.  Odds are a distro would want
to pick this up so that they can enable this for when their kernel
updates do not get out to users quick enough.

One question:

> +struct ks_attr {
> +	struct list_head	list;
> +	struct kprobe		kp;
> +	atomic_long_t		retval;

Why is this an atomic value?  Shouldn't it be whatever the userspace
return type is?


> +	/* false once disengaged; per-fn file ops then return -EIDRM. */
> +	bool			engaged;
> +	unsigned long __percpu	*hits;
> +	struct dentry		*dir;
> +	/* engaged_list holds one ref; each open per-fn fd holds one. */
> +	refcount_t		refcnt;

Why is a refcnt needed?  Why not use a kref instead?

thanks,

greg k-h
