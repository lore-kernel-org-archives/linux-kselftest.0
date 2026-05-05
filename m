Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA73101BF
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985174; cv=none; b=rjdN7Pmk+EIf+8WC4pa26KioP5C4yTTc81cqxl9K1Ei4dbfu5sfsq7Iad8a9oHDHN3WpLhFKR1pje57UC8JHSIARSJNgGeeYGbcTjKDknMZTv3sNa+XBmYJz4ohwptFm3Y53QDYky3RMhGFecZsZFGjc1nYYe30S/B04B0CrDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985174; c=relaxed/simple;
	bh=e2a4YrAbxCmDan0P1zH97mv8a+YQRuHekUCnbVbmAJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7gqVD+ABrJpM1+DeYlnaUrntk8gBLM6cAYLfGVAtxs5M/50ki/cRkFUhslMmCxcA/AGbq+/GgvVtl8/TKrZcTXu0grT60dAnAepygdR++cKg9OAMt4Y0+P00dROa9LehmpnDjd2AUKIivkIThaoyNhPCkIU5HU4UqZHDa89Tf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=hCeiZ+cn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="hCeiZ+cn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4889d0a9df0so5509505e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1777985171; x=1778589971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qHCNJFGV1aVlC/Ds0igH5fGzBTgD6Qt0yxMMEE86LuI=;
        b=hCeiZ+cnQaw1Qlg19H7Ds4dYF2GO12dgd7rYowZIfK1fxLiASjR8T0Xf7xpmYIWF5g
         CdK99s59nSaxDknn6cmwvJwO+V88cl4zx2MPaw3MoFA4ozLjmLrdpFrETjZPXtGUhlRk
         +nVnDB+zfA+GCCvA31FVTDL8aS6Ll/+xfsDsVyxzRLvFDqof8IxSVmS6v3BEIXwwQ551
         YtwC/iLsptqdeWDEBnt9U006seYtb0jr9jGdTEMF/gSLWkkYYQy5QLRNL9l0v4I07zE9
         XbmjJ8NHZIewElKWcuQbsQiUXxDx9OWFHwbtWarp9oBvWzmBsDhXB8HBAZv6cR/a/wGF
         k8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985171; x=1778589971;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHCNJFGV1aVlC/Ds0igH5fGzBTgD6Qt0yxMMEE86LuI=;
        b=NkuyxT7jLbSvFTHkj4EkDlV84LlLzrbQFLasSUx/hdTmJ7O+mp15JENP9WlJ3agbFc
         acnIQ1DNmCsnNIj6o4+ww850SLmckeuurNvxdwW42lZ0IydESS6cyG4V9zyI0BYWSFaO
         U66PeJuCG0lHvwPrvgUOoh1GVavrP0cq2ci8RhM2jvh1IUTMovUooJ1siU3Qg3dHwrBh
         PDwriVOXCmmdu9M2iQVbAkx/iuknwV8Se19x+bi3IhsgqHNrkYDKMeZi9H+1iBa/o7K/
         qWjFi7X8IQ+pVfvuKxw2IaEeVEDawh+5hs+6XL8g4kegxpLxVjZPV6Jix8SOafbDLf7a
         V6aA==
X-Gm-Message-State: AOJu0Yy51uNRoXmESiJo9kUJIvLKwHytRojCuseangjDfRsygM3VEGuT
	Ic9JFwYzs52xadrEbsatqDXtHgXsBeMyDgSo66vapz9e5XVsWntbExTYEuAbjIZ/6xU=
X-Gm-Gg: AeBDietE859FdDeRXGmQAqhRgg7UPOnGYToRriALTQ0Gv1ySFYScqxSOKNLJFNqdTPq
	gKpxygaUoRYzFJnUmNlRDIFbOoO5N/hVj0mCaGE3oVsavshX5VtneX+Hjj+GIsvRgmf+3IhDEfQ
	3qFf/ThKXj3vcmXilctEyYaPGGr0vJ4PffGPsFIbEkLEr3lzd2veehQlZ6qcMjZqOA2drPcEL+3
	Z62lxrbzUC6Ho8HZtvHXaNL9uv2uMg30GaHthm6B6oFVYiBKML5SLZTwsHcvB+lcfMWNiyvIQdZ
	MnfC+VvfQGh2lohXLFvt7ypVzbuFW4GdZQVv2LFP68kStUsyni7u6OgcdWKd5MF2A48G+b3UUw9
	wgwlhLDlXVNyFc8Nsxp35xVRZBfcNUfpQMZ0Z+C2ePX9Ypuii1wBSxacQ3p41W45eE3Xycwermn
	MOkmXmTZNovZj2J3iL23I2t+alH8squxc/dsN5feDEBReq9Ik5bPiFuUKRR+nUHs7CZM//scwjW
	9GQoCYk2udmBss+o6JQj9p0xw==
X-Received: by 2002:a05:600c:3109:b0:486:f634:f2e with SMTP id 5b1f17b1804b1-48a9865d347mr97555025e9.4.1777985170852;
        Tue, 05 May 2026 05:46:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm372520405e9.3.2026.05.05.05.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:46:10 -0700 (PDT)
Message-ID: <714a61c4-1b86-4c8c-9149-499efe5de68a@6wind.com>
Date: Tue, 5 May 2026 14:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH 2/3 net-next v3] ipv4: handle devconf post-set actions on
 netlink updates
To: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 idosch@nvidia.com, dsahern@kernel.org
References: <20260504123143.6284-1-fmancera@suse.de>
 <20260504123143.6284-2-fmancera@suse.de>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260504123143.6284-2-fmancera@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 04/05/2026 à 14:31, Fernando Fernandez Mancera a écrit :
> When IPv4 device configuration parameters are updated via netlink, the
> kernel currently only updates the value. This bypasses several
> post-modification actions that occur when these same parameters are
> updated via sysctl, such as flushing the routing cache or emitting
> RTM_NEWNETCONF notifications.
> 
> This patch addresses the inconsistency by calling the
> devinet_conf_post_set() helper inside inet_set_link_af(). If a flush is
> required, we defer it until the netlink attribute parsing loop
> completes.
> 
> This ensures consistent behavior and side-effects for devconf changes,
> regardless of whether they are initiated via sysctl or netlink.
> 
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
