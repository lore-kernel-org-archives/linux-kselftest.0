Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED73AF665
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562986; cv=none; b=Wpp7KLHEKOiM/9yn/Lxk5576LLokzmGPIiocbtiYlzuLkNrhlZncRVKR/dcxlOseyTdkrL2uCGl6g3JgpfbFZz/gqKadXTa66ytNWIxVRUO41esf0bSi1bFQEPTLyb9gjiqUE4HlgOzupMsioipmmSy34FJUqL1bH0ZqdeYfGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562986; c=relaxed/simple;
	bh=H7zbzzpkWdvolmb6crqk0GIg2mSNG386YPSGbx3Tfbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwi+CnFOUQikQL5z57hYcp6ymfFEDiZtmOcwQR2rHXh/lz5aTwrBQOLE/8qZJ1wVh9t2GhMsJCLDxPN/b8lS0tt4hNgQ8zmIrjfd/hVO2qUdCt+0t+strYvIO+kb3h8gTW0cjFM24Hy/iZVsdzZqWqhmRWy0OiT3kmerU1QWuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=VIY6zVo3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="VIY6zVo3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso30447285e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775562983; x=1776167783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7zbzzpkWdvolmb6crqk0GIg2mSNG386YPSGbx3Tfbo=;
        b=VIY6zVo302WMqpoPAFhKr1cF6CU0LXK++sYTtEcGBWzSkO7tDtXfqysRhVR4ESqmsC
         BSwucciQCkMHmoxKBKDQPNuNkFx9B/El/yjF0011y3Q8U3L57j9zuf+95W/TViVE3umm
         1E+du8rK+9tYgfOEVhRhbdP13TVGdDEvbhBGRfgAkz2XP5kKSsZiTI8EJUNzsvgHJOhH
         bf4JplK2Cga1cGQ/ma0MLhFjsL9ZPekFCOWYiZihHWRVD0OSf1+N5pkYn7UsePe/5bhH
         17UHyr+HPgLxjC3ZiWSWgq38S7pBih7zxFM8aHDcCSxIJkKqNlVoEazbhHuUmTE9ideH
         J6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562983; x=1776167783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7zbzzpkWdvolmb6crqk0GIg2mSNG386YPSGbx3Tfbo=;
        b=mW2E6Kt1mXVstiSE52Cf1lEtcyzn6jY0Yh9fvK6nD0s5cxy36QmOdx7qwOSHBLmjKv
         HHxUYpxX78Bmw+muccCPRgEH1aH2ik/0ygkHH1Kwq1nLjM858qSD0M1O+Tmd8yLn4ahK
         KyfeHzvrEsb0WIwXecl8vpNBiAUqaXEgvjpY/E/N6bNooCiHCxLpVOGBLaLJtn3cDKQh
         epB+JYj+G5JRebe3T7u9IcAH6ROaHmXbv3VuC+9ujvbZg3N9OM38KVD4PxUfW9etWcli
         AgBk+Ix+mUX+JBE9tsiIksjT4WL8XM9EPnGWMlK1s6t4nogLX+DTDMluldGKxSUoMiam
         YWRw==
X-Forwarded-Encrypted: i=1; AJvYcCWDqOUSYKjfJrrFoVJ04O8vVM9O0Tb2o0ib0/8vczpmk9vefdVTWhXbHbm07h/ThzSQyvh9QY52/0UKL36zUWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhgyozZz4llhoEhc7DnfS0hQtZuZPI18Rw7FkRwQBZpWQnmM3
	jK9V65ayVPC1ASpqeSeqHUMD7cG39+mNRCFOGTusUs7oqooagpY3edt4y/rUBKkhM1M=
X-Gm-Gg: AeBDiesGHrE/90NoAr2T6pSyQ1lMXFBKc+qhutOas/xGBwV8EKeqEWP163t/9aqxjQI
	5vkAowhAMisw0T1S79LDl5BTHk85RVZVB1L2CegLI6v6565pL7XQRudkGoa0/usY7EiBkBKE9o/
	OUn+qGGCbFd5BvXw3h6v81zIuObT+1EuMx431v9RN0hEHoyEHgSzyNO7POlPoTZf/eToYQf9DfU
	vq8/+Qt8XGSP5jdUEfFY5Q51jZ0sXT31QFRqP83np1yaTrkP2pMyaYgJwPZwJSaK97j/n7aVSOm
	IqCFDEucHPPz01UtzAjikCi5aZyTM2DhfbSw5uouvfJQJ0J3jkYYN73FAlD6S0E8mNpZyksS2yr
	5CNGNgYuRT5daHgs9sc592l2jcvYNf2bllQCv3GEtjrb/SvniIYXM2RDHRRwZ+0lL2+oH7Hah3h
	ZycxIZzKRyzryNSuZWD2i2USrr9sUVZUgAobzlQUVidA==
X-Received: by 2002:a05:600c:c0ca:b0:488:c14b:201b with SMTP id 5b1f17b1804b1-488c14b21ddmr13037975e9.10.1775562983600;
        Tue, 07 Apr 2026 04:56:23 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ab6bfc86sm68832965e9.11.2026.04.07.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:56:22 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:56:21 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 02/10] net: team: Remove unused team_mode_op,
 port_enabled
Message-ID: <47aliebnag3lkiwijdvmzev34tgmwro2v3zyyvo3iljh6w4wta@7v7z5lmev23v>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-2-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-2-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:38AM +0200, marcharvey@google.com wrote:
>This team_mode_op wasn't used by any of the team modes, so remove it.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
