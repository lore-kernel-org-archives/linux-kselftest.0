Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763573E9C1A
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143661; cv=none; b=dAsir+lpqhe5XWd8dzeihujuECCP3YNyo09tWV30ws+Gt0Tz0dfn36y5hezsFdhgvIm1L8pKrwZJLYxmVEPnow3r/AkOueETpsvn5v3SXL0Z4PHiTY/KRF4KDRkNpIBv5UnUynqK2VMncdSFoJtGGBkW3ATdQ7tzaX6Hy4bHtwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143661; c=relaxed/simple;
	bh=Ub71spstyLFlI/ed3S4Sftw243+6LpfdBp9EJLWPF9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH1YFjt1DZyPtpqUdtsfGmqv2qVavUStK3491Yv0NCY0/zBvpN3BFODRVM+2AT1idI0qUn1Q8MVp+uiGucoHdZODtfOJG5tJl5qKRzEucnMRoMSqk+hrAxMv8WIxwgxp6/ZmRFferwli284Ezr9NSr6Q48MPvRjKcRYdh4YAIGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=YRDbYB6n; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="YRDbYB6n"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1637894f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1785143657; x=1785748457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvoOIR4zXM8kcVSn7TlgTFMfrKFyI+wlUlCuS+RENlM=;
        b=YRDbYB6nd3GF9A6c92I+ZA1RGAxzjxH5PnE6PzY/cZwiWSqsSwuDAEk6wuxNOzsCQd
         e2mjT2PA1BRxWK3MvZsN91bPJ67LkjLuyIlf93mTzZ0HxZyOWUGoepTeACnoTVoyAwPL
         B2Tz/TKk5GkLwkXPs1bpo2KLfC8VWLpZdAwJk3s9qDwIAVqNOa3u8USDT5BQVjYsddos
         9y9MwPyCs/K/VXHq5kMHPIEtJfeCWuLvJooiT8CAbpmUAnBQmZbG7Ow1s7v8NkJFM4vl
         bmAX7FiqajsyPnVTlElNuGIPl8fh3DbwQ9uYOiAXpjs+/0g1pH8siKLCeSlLBsctQd63
         1EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143657; x=1785748457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvoOIR4zXM8kcVSn7TlgTFMfrKFyI+wlUlCuS+RENlM=;
        b=BdcBryi4zHWzVc58LKJ083TMmU9RjjhwOlqSZshM/ipDIh7+TkzfVRLzPY/4Oai5KE
         hlTpHMx+1w+rYCKxx6FOmWFtY1vZ6GkYvamLxGPbZirM9TAx2ujOiimvHoE3G8kFA7uM
         NaX3IHkODWAqmMZXXUU42QPyj/ivRdnlgutBzqpo29SKAGesYFBvXavChzKl3jEWKrBv
         PVblXdVXwAua4WlChaSIbragEH6sMmtAapFH7oce4rNxFguOctJjfPjNC5Xnd9UPcvXB
         pEiTSjWBMC16dn29MiNYoKscPz5lyIPK1/kFEdhHKDgHvPKKHR5JBxITbllFbZVcrGvp
         lF4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrjLj46u9KqTnAg6h2c53J5kLbLK26ytf4fRB99SOK5YX5ZBCAUUmqKAAta6h5U8GalwKV17QrPBERWXT701YE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fB+oyE2p2WRKmy48kM3B+dyCKPGLvXy0wElanqLcmYUSqYqI
	YvPOqk5svBocrjGqY9WhPrndekcfDnfUfe+FaWMNGiGUN8ToFdOm3ZXEIvjKVnlF0eo=
X-Gm-Gg: AR+sD10WwfAvEgdJUz/PWAygwlY4r8C++h7Q8jIJV2Z0wB5KykG89Qimr9+swX9aX1W
	MQNPvVSZpQ9hSqlry4kZEqbXIzvENOc5b8iGxUG+RUiQUOdVH0DEhj2kdOGMBIvy65RN8sYEmhL
	MLxj67uiTe1Iw6Z6i8NzbtQ25X9XIaDsGE4vSaQE9SELoYoD1wJZ/TQZ0kl4oWrcOIGMp9hoto0
	ClimJBWGD2T1CztOG/kib5t+cdvS8iu5GxSYZiA41tQJNr3SDdv9TGUZbloCqmWuiWNWHuXdQPA
	5d05odPlHbeToWwH7zo80Jw4RrFsX0U/69L6xF4riuV7lwWRgPF+k7r1iRcO5udBztIqrXKxzTQ
	WFEzqUmwfRLERsJ+e0mI4tW0sgyjbTC/vc3v4ToBf9JzcLQHTuPRFYbZrI74hVqPSOs5tmRyDsg
	==
X-Received: by 2002:a05:6000:200e:b0:47f:9441:51b5 with SMTP id ffacd0b85a97d-47f9fc8c064mr9641263f8f.5.1785143656513;
        Mon, 27 Jul 2026 02:14:16 -0700 (PDT)
Received: from localhost ([109.160.73.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f939c1465sm32843149f8f.26.2026.07.27.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:14:16 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:14:08 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amchUJlyq7ahQIco@penguin>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>

On Fri, Jul 24, 2026 at 02:21:17PM -0700, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add a new devmem test case for binding the dmabuf with rx-page-size=16K.
> The test sweeps RX payload sizes straddling the niov boundary to cover
> the sub-niov, exact-niov, and multi-niov RX paths.
> 
> Silence pylint invalid-name (`with open() as f`) and too-many-arguments
> (ncdevmem_rx grew to 6 args) at file scope.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  tools/testing/selftests/drivers/net/hw/devmem.py   | 11 +++-
>  .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
>  .../testing/selftests/drivers/net/hw/nk_devmem.py  | 10 +++-
>  3 files changed, 74 insertions(+), 6 deletions(-)
> 
 
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
