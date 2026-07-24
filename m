Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A36E38BF67
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929130; cv=none; b=ExfTUYIWuzuI/BlUGBBp9zc2zTJ8hnJUO8IpFZ+uCgmFpk1NbwkCgmasihcpTu7dUkLIao3pUeALm0Ir9oLm6vyrYvomLYNZKdBMbkSy/E7k/Q9EaMZ6e5PvmmYnFcI3++bzHHkj9V5Ox5rut3oJEsooDlXvUd8Z32PV1L3K0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929130; c=relaxed/simple;
	bh=reffKocQBTkitR5sH3HXeyiSkGKFe33s9Gp2+pOr7MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH23Bl703sNlCvpbrrLTbHqV2eBafVC3c/YqSvIbGVv4TL9B+F4SOsHmtB6QHQpCL9LBujDhdg1hjfz2mqoH0THvdCMwD5UgYWjzasF64s29BHBUi+u+HSR9lRJ9RdtkIiuDR1pzRa9TrZXURRr+5ZX4aCru9QWZWdYvxU8N8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHhlBdyb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHhlBdyb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38511175ad3so572822a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929129; x=1785533929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qq6JMFh0gDJiS/8lUoBGQxGZpE4+LKphNkGVGqdhJ2o=;
        b=cHhlBdyb8u9uML7p9GdcbuNl0Hd5d7hkhlI0/K6m+CrpbVxEBw4bxEyeJY348ih0s8
         SpxjXMTc+UMnFffISf3fxkx5stI3R0DN3rrDyWrqwjRQ/H5+d+6gfs0wXlezI+xSIaIY
         klGQLjcQcjxAd9DOPHpsxvKlvfUxdNw1tR2ATVyYtD3WCXqz+oSgbRyFZ4/P8Rmx11+B
         OjxdKDgnGffVEoVrcGkwmGLRI9fng17P74GtgA4vM6Ik1xBIfwHRc//7UITxsxRQ3ns4
         /GmSK4897kBMTuCf5/YMaHP94XwfZV22GApERO9ekjoEx4ZYt38zzcofbXAZdczCdzdC
         GZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929129; x=1785533929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qq6JMFh0gDJiS/8lUoBGQxGZpE4+LKphNkGVGqdhJ2o=;
        b=mhnijWJAKJarGPK7tXSaAYcp2HqIRq9NccP906GyFmihBG8ob3tZ5+psqDa5IjzhkJ
         22uveTtFl5oWEO1T6eE+088ns78c6eo+02KoCuX2JyQ5twQOhJaehosdPTVhdTvcNoda
         ngAcAuB+gWAgJu9he3h/WrduvVGA6eArV3tkYkzDV0xH0Wu52v/sTTK192Ih3s0N1sK/
         RQloIvVhIzd0JBhVpE/4f3b5EDZak5GkQzxy0qLwqTYxL+Lw6zqVyeeZBFM9BIYzMEDB
         FH/STRCAJo3x6ibDTxNESgkC+FVRVCxXhP6mQHMDLUMu+0OMONTtypkGcqA4UZyBa47z
         i9Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rqss9zvZayrFub8tPaPowpcYcs2leXoe2bpzlyGGU/Oy9rkc/lJzDCBYLBe7T5SkW83EdPrJXBaKfurqoiR3nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6tK4G9e2Fv8jsfsjQdIki7BrRvrgFsdincxkHyXiAb6+/8xP
	H5dMfsyZNmOpc9mo6Hskws39WllxFN1na6aMw7wzlEjc0PC1lylXYvAE
X-Gm-Gg: AR+sD13/U8XP+S2qNcPwywuthtrAwXy5c7/2xcs4ZB54tnjPi6oz+yA1aM/ghp9gFO5
	KmPWMmmvuqR3l6M9HX6RNuItk/DZLRph2p67dGGCrDj/IChshcn6Hj2qF6aUD9BUv1FUXIphqHX
	BWq/PSlLUpRdUfSWayr09mKK1Dk650j8Sq57ItskysOPgwfM1qcdMnbr7s8RxRWbDV6ddbn2FKT
	UsrSh3Fy/UT6/QQ/AXvQoYJeIzaCBn9gpBEGE4k7bNlIpJxR3M0NKO/yGQjRYLjEA4BwI8cUoBQ
	2OE9HmEblkMpxzUTHpA7Tq5Xc6xLQ3U9ZspYgakbM3sT2iy6tChzDCbzD78rqNaTM2XVRXvNr1C
	iZRb6F/qYQl0wE3YrKbuk1+C7ISKNXHAgo6Jlk1USUWnG14ayU2xNQpwN2BetcOmZkeitGEsczG
	5nOK59XZc8B6ugIXiwul5PfA==
X-Received: by 2002:a17:90b:3bce:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38f297812c8mr143723a91.41.1784929128727;
        Fri, 24 Jul 2026 14:38:48 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:2::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175831sm2086519a91.11.2026.07.24.14.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:38:47 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:38:45 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
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
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amPbZbpQ0jwBshsa@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
 <amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
 <20260724143001.5afa8631@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724143001.5afa8631@kernel.org>

On Fri, Jul 24, 2026 at 02:30:01PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 14:04:24 -0700 Bobby Eshleman wrote:
> > On Tue, Jul 21, 2026 at 11:09:03AM -0700, Jakub Kicinski wrote:
> > > On Wed, 08 Jul 2026 15:55:06 -0700 Bobby Eshleman wrote:  
> > > > +@ksft_disruptive
> > > > +def check_rx_large_niov(cfg) -> None:
> > > > +    """Run the devmem RX test with rx-buf-size = 16 KiB."""
> > > > +    run_rx_large_niov(cfg)  
> > > 
> > > Any idea why the devmem tests sprinkle disruptive everywhere?
> > > Disruptive means we take the link down, I don't think this test 
> > > does that.  
> > 
> > Talked to Stan and he mentioned the original idea was not necessarily
> > just for link down, but any test that could be considered disruptive to
> > other tests, with the idea to eventually introduce some scheduling
> > (postpone disruptive until the end).
> 
> Perhaps have such conversations on the list? IDK what Stan has in mind.

For sure.

@Stan, can you elaborate on the intent of @ksft_disruptive?

> 
> > If we can get common agreement on its meaning, maybe I could submit
> > something into the documentation and update where its misused?
> > 
> > I'll drop it from this patch since it doesn't bring down the link (and
> > seemingly no worries about check_rx_hds() tests not having it).
