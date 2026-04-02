Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC863E51C4
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134509; cv=none; b=UbnaS77l4Vy/eDl49bFxKS+pt5ScWuAk55Nlab+eSsDDW4Wo4zFJAjP5YS+nHFEgsh3pUtdBPCphT2rQwp51rWIbFV+OT7SdobmxpGBGVllNSFSBU+KQR9zw4qfAyxnaA86XF5LdfMaI9EEleyZmKLdQ53E1Re9E2l79dh49YBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134509; c=relaxed/simple;
	bh=0EExnHRsi8qpzqXO+XeoCnMx5K/0WcTSOtlzYNAHJIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVuKqn6gtdMuTBbLMXN5QXuoWel8sy+PCNroA6zJlJbGpg5cj2vuPd02daDlI4+VV2yY95ISifLf6vtCz+kdE6Fp6b5Ff/aHgb1s+ctsIoRq+Bvfb1NY/yzWuVKeX8LnI64rSpe5ykrX1TK75uQK8eSETFUJ5yve/751ts+6yU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=JViMMnuh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="JViMMnuh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so8085615e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1775134496; x=1775739296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5UfMDLJ2KJzfp9G85RI0M9qPEewqJ6RkFSMS1YKOdQ=;
        b=JViMMnuh+7EhVhiXoeNY4nENXzBPNJQRqvInu6vkgqlrUF+uGCvVKCYURq61uY10YT
         4m6NYGI+3Whb3iybZcHjptmSyxN8xtOJUJtkzR/to51wEi/2fH3vg/Zxwk8Q6/3I8GWM
         CskgKnQp21r+KttV3e2dP32SozsKLwhsSUhENyCXQqqg+jbHtNTrIDK9v3Waw4uu012J
         nW0HZV9TwPeWaGhz1/Ov9kJ3jOUXhzLI8gq6HfXGHkdlRo4TqFzfEpsWuKXL8UF+MAKQ
         WQpb9xOS6owzO4sY2aw64j2Krah9khCIGi1+BIBlOVvLYdpv4Of31dnLaXfsqpirGYVq
         ghiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134496; x=1775739296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5UfMDLJ2KJzfp9G85RI0M9qPEewqJ6RkFSMS1YKOdQ=;
        b=e4vpMkPKR6KpdJJEARzsuZcyvxRkYFlihmWLH/diL7ErmByrtJHocqUeLnTVotf6eG
         eh5rN+l5HxXZdBqEkPo5JWbdR2PpizaegTyFxmNzdTW5yDZhJK62L5G/I9odCmE3FIBI
         9Mt5+xgJZz7cpUJjd0gRhgr5BrwwEAffWAYMMdGsd3QQjvkyVScFh+9CUahVuXIZQkFp
         Lc1It1MxJzoL+K39dbzcOwq7t19KA8TXLFuvqpI8teV0Kg9YnNXcwEZeX4ehZAhvN76m
         QRxbME/WLDIFti3ZynqPFUpB3m0inP2otlfwvSFaf6Pw1SB0GdbFgewyUAbjRfBjZ5pG
         /A6w==
X-Forwarded-Encrypted: i=1; AJvYcCWr+u8vSrXMZMIyxhgV+xfpD3Y1Bsp+8N0zIpxDtfrfAJ0gLxE3dT94wPjjecP5sP0oNy5aDhW0KYVgotNHV7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+J2tJ1WVqFw/pPDMruTBieLrD4OjFQ25iPZ/WzlBcHqW3wk1
	j6JVHGAJAK9ga7agDp16N296Wtx+U6sRCwM7O08hXWjSjlGPsFOGWZ0itJTqFuDtenc=
X-Gm-Gg: ATEYQzw5BzzeeUvmQGWXn8BKoEkk5jCCVVlCUEdQJZnv51vO4Nw+jb6T3Q7cmLobeZU
	JiCMvf1SS91xYJhNzwxm3mIBUpzSi++kccSExRA/u9aW6DOs8AD2NpIUaNGeOzlM67XU58qnoI5
	QfodDV8vogRjr9M6wkVIAK4Eq52jD1gv78pc6Enag7XAnqRCO3HIDfWI91yEwN2Q+bu0eSgFoo3
	yeAsgX+zxEtxHqdv/mCWPGu65P8xJ65qLi0Kd53RMSZ/dwG/pC3ewSqMuv22oS+qEyLx5t7xBDc
	VBQOvFefHhdWof2GEoNiRaibqCeINCWdAU/kzmtHIS3KpZ63we5DtjmYdy1YDLXLeYqU8gYk9lF
	D2SJw0rLvbqzFfsg8MItI3oJH2FIru04EQuuQS6xstGKtDUy5ibtqIfx9hPW0ZxdRA7Esoux5e+
	w7fztuPd1hs1YqE6bf+uR1uDNkbkq+zXlP4A5YN4LYKg==
X-Received: by 2002:a05:600c:8b66:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-488835b7bd9mr133099685e9.29.1775134495637;
        Thu, 02 Apr 2026 05:54:55 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887adc5690sm114520655e9.2.2026.04.02.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:55 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:54:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 6/7] net: team: Decouple rx and tx enablement
 in the team driver
Message-ID: <j4tjzpbsfu57r5bbqcpo4lfnzzonnmgye23kiyu4la5d7cxuq7@63nrgj4f3xto>
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
 <20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com>

Thu, Apr 02, 2026 at 08:24:19AM +0200, marcharvey@google.com wrote:
>There are use cases where an aggregated port should send traffic, but
>not receive traffic, and vice versa. For example, in the IEEE
>802.3ad-2000 specification, there is an optional "Independent Control"
>version of the mux machine. Currently there is no way create
>implementations like this for the team driver.
>
>Separate the existing "enabled" per-port option into tx and rx
>specific enablement options, but do so without breaking the existing
>"enabled" option. The existing "enabled" option is now defined as
>(rx_enabled AND tx_enabled), so if one is independently disabled, then
>the old "enabled" option will also not be enabled. However, setting
>the old "enabled" option affects both the rx_enabled and tx_enabled
>options. This is the first case where setting an option can affect
>another option.
>
>Note that teamd and any other software that exclusively uses "coupled"
>enablement will continue to work without any changes.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>
>---
>Changes in v3:
>- None
>
>Changes in v2:
>- None
>---
> drivers/net/team/team_core.c             | 238 ++++++++++++++++++++++++++-----
> drivers/net/team/team_mode_loadbalance.c |   4 +-
> drivers/net/team/team_mode_random.c      |   4 +-
> drivers/net/team/team_mode_roundrobin.c  |   2 +-
> include/linux/if_team.h                  |  60 +++++---
> 5 files changed, 245 insertions(+), 63 deletions(-)

I see multiple patches squashed here. Could you please split for
easier review?

Renames separate, preparations separate, adding rx_en separate, adding
tx_en separata etc?

Thanks!
