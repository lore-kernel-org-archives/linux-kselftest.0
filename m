Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A73EF654
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850596; cv=none; b=sUFxpwcbYSVyr4AsytnKOtspg4va1dSlr4RxBS+cEfBFMSOx8/jCb9KPSCzLPPLcB0k9mJPxVLdqVnncQoNw1KF9bDSLw8EsOLJCel8CuIA8HFlSFjL507IdUbDW3OmRSsJBXkqG7x6qCY8wErYuKmTmgCx9z9ZXwVYoqp6ggLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850596; c=relaxed/simple;
	bh=cVJluK3TyDFVcOJa07LmzKrKJzuXgnk0YMFEuT5VkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4JQRN8ODiWZ+nFo8E6dGllTU3sPRjHWqt6OoPaCos9i+YxKact4HxBmMsl+z9jqGM5XT13/s0vr2WdKPjqp2ivRlNLEAFrLnLDvJUVa8befKXys349kxPQ9ajRK2YgeGrRC6ja6VwlYUMQbCP+RjV6rsf22EV1a7DdsECsmg94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoSz+IWV; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoSz+IWV"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-128ef6c4a41so18316c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773850587; x=1774455387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dla1BTbyc4l54nWX3/vfHTdXPEelTK/vnnV7aOlfzTg=;
        b=AoSz+IWVLDGje93UL+/laOx3Mm0bxjDxLZJaDpknBN4X8GKG9GRLRfG7DxLwpZjh+5
         dJV1k8J7EkT4oSMBi2qaQTnxP8BhAtdYbcLnuf75ASSnQ8dmIc+Lyh8cElL5B02r13Po
         LOZ4JY7M6r+bLWm7dHU0ExjewkvCEXrXAWzJdHMiQvti0m7mOkrONr/hn/m1pmpQGSrk
         GTydgAkOkKDELZQ2TztMxAnRJnEvqdes/NdSkDwOHACBTXTCEM3QIYyy/JKWlQlwyucA
         ycNIKH81TaqjKFEiaSmD1KzL+/zx1SaBO2bYv7IwkRw5Vh1CvAKBaM9VhN/1+xtGkYs2
         FuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850587; x=1774455387;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dla1BTbyc4l54nWX3/vfHTdXPEelTK/vnnV7aOlfzTg=;
        b=COIp5B3XdAaHGIk7oLZFm1nLTC8l2g4XekjbwLqm+DvbGjpe+MEfl3/Ep1egUftEFo
         ZoWF0Hzc1T6zRt/3Xt1cwLa+BuRY+skKN//ONlT46eJUXc+0IruM7xMrQYJnE3aV57H5
         5mGp2Nnpu/JGETVkXu3uvSPL4OiNJXm1cnIo62xPakZ+fUVPUkaT93h7N2o8k1L9RhFP
         hB1ewKSom0R5XHRwec6KZkZl/iv6M1UzczrIjT8icV+LZkj4a2ovqmFUCmSJGesu9z0h
         WvnM1EVD9zi4EqsgzayhrSHzMrGDRqdOme4Q2Fe3KuYptvTx3q6xf66VWtgEu2H+9CYK
         bxvw==
X-Forwarded-Encrypted: i=1; AJvYcCWjs5G6LlXmrG87XipY3kdohtpxAMoCYununOm9J4F1XW04KYeIu/J8pNTTFS5Lee7iGG3BSrbnYIbgCoSqwpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwfGcOIaUHWidXfdN7KPUynex2Y0Qd8nU51Edb52JzJJcxXpf
	uB+0jyyI0a7wbvGSY/aepqdf9/UnPT1ivEwbKXsnd1Dtug+fV6yIFRs=
X-Gm-Gg: ATEYQzzXt5Po/6WxY4k7rbeXLwGXDn7QUHE9JNcVDht3xBHOvCBURsI0yUT0FU+yv4a
	0c2bMFI0wil9Zpp8HSUKuY7mje5rKJ2Ok/Uf7PqmTIaSImuVgyZw29fDv5+EyHyS5zSLtPhpdbd
	wm/eUSAvV3wZGZTHcmoEv8Mrfp16BKtWMA9gQfbVpmOWtUazyVDfKEl5STTsGwSmWCbDAiMZIrW
	4hcZSWlDIBOFGbJWcJqi1lrEKqwT/sL1/yrDxN9K5dBK/WFeaYy2XCbgL82o0dZiLW+RPq7USiB
	/1oCkbhrOy/Q4RjKXcZmgaEEuRr6hXYtAkxQJwH5+pssKU4Fzh7xJnIiOKzXqMDyxA8V01BiKgl
	SUvaIN3mtas0BuZJQXIKerqaq56C3Bb6mKTFrZdAieKou3QTiVXLB+rHOBPEs6EqGqBs7/2GqaM
	g6mWMFY1Y///SnJIc2Uum7gl6TJoEp2U7ANSpSjrcq8hLmv2FICUdpBWkPgguG/mC8cuhIsTcub
	5uoPo8LrZv5572Vew==
X-Received: by 2002:a05:7022:6a5:b0:128:d471:8c1 with SMTP id a92af1059eb24-1299ba3e555mr1770451c88.17.1773850586365;
        Wed, 18 Mar 2026 09:16:26 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b41289e7sm3582603c88.10.2026.03.18.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:16:25 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:16:24 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, andrew+netdev@lunn.ch,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com,
	alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net-next v2 02/13] wifi: cfg80211: use __rtnl_unlock in
 nl80211_pre_doit
Message-ID: <abrP2NavLA4f5iHE@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, andrew+netdev@lunn.ch,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com,
	alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org, leon@kernel.org
References: <20260318150305.123900-1-sdf@fomichev.me>
 <20260318150305.123900-3-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318150305.123900-3-sdf@fomichev.me>

On 03/18, Stanislav Fomichev wrote:
> nl80211_pre_doit acquires rtnl_lock and then wiphy_lock, releasing
> rtnl while keeping wiphy_lock held until post_doit. With the
> introduction of rx_mode_wq and its flush in netdev_run_todo, calling
> rtnl_unlock here creates a circular lock dependency:
> 
>   Chain exists of:
>     (wq_completion)rx_mode_wq --> rtnl_mutex --> &rdev->wiphy.mtx
> 
>    Possible unsafe locking scenario:
> 
>          CPU0                    CPU1
>          ----                    ----
>     lock(&rdev->wiphy.mtx);
>                                  lock(rtnl_mutex);
>                                  lock(&rdev->wiphy.mtx);
>     lock((wq_completion)rx_mode_wq);
> 
> Switch to __rtnl_unlock to skip netdev_run_todo in nl80211_pre_doit.
> This seems safe because we run before the op.
> 
> Link: http://lore.kernel.org/netdev/69b5ad67.a00a0220.3b25d1.001a.GAE@google.com
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/wireless/nl80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 2225f5d0b124..ce5f25d4c87e 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -18192,7 +18192,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
>  		__release(&rdev->wiphy.mtx);
>  	}
>  	if (!(internal_flags & NL80211_FLAG_NEED_RTNL))
> -		rtnl_unlock();
> +		__rtnl_unlock();
>  
>  	return 0;
>  out_unlock:
> -- 
> 2.53.0
> 

ERROR: modpost: "__rtnl_unlock" [net/wireless/cfg80211.ko] undefined!

Gonna re-run local nipa ingest locally to see if anything else pops up.

---
pw-bot: cr
