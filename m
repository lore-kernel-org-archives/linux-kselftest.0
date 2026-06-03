Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AB30F95C
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498604; cv=none; b=Np6flbyos65pCDVMyAXK9Msk+LYeXIWC/kX6Gwo+LuAlFG5u3v7HYV2Fcy0lzsY/U3ZVBxuqrrOvDJgGCalaKtz/xeXZ0viVKEtCFPcEOVveNtu1dpBNryeQH9OWeAKOFTop9IRkKIURX1RSlSbt3IUEFonoF/vgZzd6PwmIqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498604; c=relaxed/simple;
	bh=ImhruFXE9Lbro7dva4U8BROB5jOXgaN6s1GZsu01hbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNWwOllvnWiFa/AzgqcqoHpPIlO0wSsQ9UOsp0nxxOjt3FU1kUbj5GFzvdBi8djqCOiLt49jX9UscgUr8Jt20DeL7ZGw6zwWWMmN+wFYicmzjD/fFBHCnQ1lLKzMladtQsAHrRSl1NA7V8Nio0zGFM2NPtvpSg2YppEKIGcPB/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAuSxtdq; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAuSxtdq"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-842338c18e0so2602006b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780498603; x=1781103403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKJn4y6UdkNefa3K7Wo+4bo+F/TyK5NQRV75EX80JCY=;
        b=ZAuSxtdq1TIqXzqjMcFLYh/Wj2sGrWlKpfVPWxxBWA7Kc5kmv7huKVIJLidzDe62BT
         YvKclP7MFNUzAqrqBcWhMRHegm7tOiwkYmdswxybSB7j0bo6HYhAOiHZL8HSJTslGWfP
         9SsLk1KdbIGyriJd4Wch6ouo3WOBLcP3zIWftozkZC6eHVu86CklE6Pl1bEIKC8eb7sm
         WjSU5GLX4YvtkrS2UcXyiA4baqnN3uvCJ7nVliRHTHXVxrFATD2Ocj/CB6wOcs//NC0Q
         o3FgJn0ixs4mPcZJz41iq1HVxKRQogHIAe796UexM0xaYPTDV19z5MsFty5f3fakFMku
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498603; x=1781103403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKJn4y6UdkNefa3K7Wo+4bo+F/TyK5NQRV75EX80JCY=;
        b=tYkpAhkIYJDzt/Sh5Pac/fao+UObbeqUJwkBLflBJt/Kqiu+l7hgR7BwAVvULE3uhX
         kU9eJXMQmaYR8m2H3t2rcwAPFfwL59u75eZ0HTx6W/MhV+lfCgsZ8bZNfE4p/Nvi4VLq
         iuJGZIUZM6YnGDdhWBuB5uLnc8xQEKNCa3LZWa7KcagruiE3+gua4neGNKAeN7XwxdBF
         KB6vkasemtpE265lajbciGgh9L6zqVFw16WwpqTM337Auke87/sa7J17ZjKJePf3ZjWi
         0lQRKAcFZDfKoHUPHUnTeW2NtKm6KS/jnpiZuHaK+DW431hkdmhQwPh51pj5RaPoVHTE
         6QjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2vu9hYKho+K6gujmpiT70LbYqciJCQL30x/8RlpXPrzqCKHjaKnRBQfF170nR+qYn9DF2oVbqQxNXmjd2sp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFez2wD2tWu+27C88wJsGQILp9ER7J6zJN0dLVx9fdsrAYV6eb
	XOcDG5DuZCSLyQtWTWNlLRyfeVTv9O+eqN0Wt979UXub7v+/luLgDD2m
X-Gm-Gg: Acq92OEV8gKhwXhEWty+7f9NZGaHtBWcIqPQJ+aP+jTMDbwakkn9cO/TfNC2HUo6DNR
	x+WwF+uN5FxTgzaaVEiposlUyVyLAlGp30C0/t4bJ0+RX1nMDk70AP5GBLzYhxgNDZxEA0fYXPh
	GgsCXxhWhauGPLY4njAmjd6eZ2l7IAfRyFwNEpmYZknXm5PKpv4GmOMnj0CHECx+25mTPaWxyKU
	SKDk4YcZj8mX+9ZIEn2qftSGPSWe/+dLy/PM/CEfysdDRzm0F5XpTVLTGdDwMvX+M8UYaT+He+f
	Mv1T+G0hjZ8GQFJWtYi45CRo9tyig7LuCQXYAwvAhZQ2BXHbsR9a6x911cSmk+Tzl+d0sZrM+dB
	VspJ2PbTZMiGK2PevGxNzmyo0K4Os9TXSn5KcEHzJ4zlyFk/ANrEUeWcIee+gK8CwndleSij/2Y
	GoXrzYd/JzKgj/SxVxUH7sTDl6JJY=
X-Received: by 2002:a05:6a00:bb01:b0:842:5a8d:303a with SMTP id d2e1a72fcca58-84284ec9692mr3998628b3a.37.1780498602943;
        Wed, 03 Jun 2026 07:56:42 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm3390839b3a.54.2026.06.03.07.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:56:42 -0700 (PDT)
Date: Wed, 3 Jun 2026 07:56:38 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, daniel@iogearbox.net, 
	matttbe@kernel.org, petrm@nvidia.com, dw@davidwei.uk, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 0/2] net: devmem: allow bind-rx from non-init
 user namespaces
Message-ID: <aiBAna4cr1KHEQx0@devvm7509.cco0.facebook.com>
References: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602-nl-prov-v2-0-ad721142c641@meta.com>

On 06/02, Bobby Eshleman wrote:
> NETDEV_CMD_BIND_RX is GENL_ADMIN_PERM, which checks CAP_NET_ADMIN
> against init_user_ns. With netkit and netns support for devmem, it is
> now useful to let workloads holding CAP_NET_ADMIN only in their own
> user_ns issue bind-rx for a netns owned by that user_ns.
> 
> The first patch switches the flag to GENL_UNS_ADMIN_PERM so the check
> uses the target netns's owning user_ns. Init remains permitted.
> 
> The second patch just adds test cases. They are identical to
> nk_devmem.py tests, but using a non-init userns.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
> Changes in v2:
> - some pylint fixes
> - fixed import issue
> - Link to v1: https://lore.kernel.org/all/20260601-nl-prov-v1-0-9bc57d6ca3f3@meta.com/

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
