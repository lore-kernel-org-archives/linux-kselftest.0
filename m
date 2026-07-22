Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ABA34A3D9
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679736; cv=none; b=ApfKfhP4ObRpz9ue1i4MSjz0gFKP6QZmgyV9i1fQXCC8wtVTmrQjQEFhHJzLybxrH4dU/Nqdkhb9mSMi4ckh9qJFXQgU147V+DnT/VyckowxVmBjhnh3f+RIyMyRdSNAvN4JDt8K4HzAMYmY7kl1/kQHSuIT1VNyzKl/AM/WdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679736; c=relaxed/simple;
	bh=xFMBO/tvDXeZ9ENOnwGVcMekf9MEIwoIn8N1zllBcuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQZV5MdTpkeJnIFnz2yyNb7NwVA147AtgV4nik8eBDrRFlpYxyGJIhe0p+OAwXcFuhX/5xQC8sJFoKruVFdph1H+VJN1SRXLxDjNRklSW46v3w0Zt4qUnBCohCsHkvkeZmyN/AlSMLyZA7Ht5uZorUuTolnXbXXIBAjambhCy08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHhbEshY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHhbEshY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so12113439b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 17:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784679732; x=1785284532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RV+pWPuLrWtGLHPRoHO6UZjcCN7SkNDZVxGG/ZxlKo=;
        b=CHhbEshYoiYrgYa+X9Wlk7+xzrqSiHbJXvRJKFyPDjE6SEtbR5/B1iz004mrHV5RGm
         H21UNWc9X/iWKWOIBQg67YnbNrjv4C7kS2Wil7Is1n74yXgICGnCD0O5A+MrHGuI5MHH
         rPazIeJV/wCBYJrnIoZo7+lmCMikBDtUi/uB9Rlea+ROd31TbB32VgB3laMAO4bu9joH
         QkR/KCljXtI6+Yl0mrxhfVZhIeKYOXeiK5xLAaOQIjd0jZi5a9L/Ghii/l8J3Cqp40vX
         N7v/m73wBbJYm4sFzlBuQNcYe+MWHEs6rwj1g0bCSh/EvL9DaOTVjmlGZS+nMewgDfIa
         92ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784679732; x=1785284532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RV+pWPuLrWtGLHPRoHO6UZjcCN7SkNDZVxGG/ZxlKo=;
        b=gP/PNNNVtRt02Avn8mEYs2uWteJsUzcS2IFC94Pw3guKZbJueycLwToAOTUQ5q7r4x
         vvIlDE49l+SzZjeUpBjGgxmCK499d5YekISiUbmsckgDA8w3tNBfiWe6nvRHT9/bfwHL
         vfDZP2Yt2ujnXrilFa1w33XoGiBoccNirlBbVM9goXYXwtKlYPgpFL90rECAFE2ew9Vb
         +NeChKWWxWgksKlHBBbSg1S889IdGqXMPJTCfzJzzJ3m5pZ9hkSzSLxAohUdc3jUNtNq
         z6gRQ3usDl23XPqTjW8TrBvBoRLnE5PKisEu/UTSLK28G++PjwEIPFBGCPHOc9kwOYVv
         Mzbg==
X-Forwarded-Encrypted: i=1; AHgh+RrMxWqYUo1d62pUTsBVraSUc0fYCvC1yaNXFHNp6wTuqFA6Glxjjyn31XLiikv8deqizXUwbMgrXDsd0YKmU6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWGKLGYWnKyxI/3CW7/x75rFKpL2Ylvwh22hQJCPZNLodQlJg
	zOksiu1OVH6M0gtxvPXXFWpec2NU/3r0oEgL0ShRWIHHkfsThQptE9Tg
X-Gm-Gg: AR+sD11X0OmxJsE3GH0bDmzovwN3juSikBtLOgfYM0Rm3w+Iwl3WAU/hLLFpTVACar+
	Jb7MxMKGWoLJMNTpgRBfvTpkPfQrDCvqRzyH3/qS85dtM7Z9FMXIK2i7LL5fU4JjIqdNpkft93Z
	4GDUsSwJk4ePmLRRTkBRUm4D9don/RC7F2zzHz9zzs5Ur5KBITLVX4Cblwrgw56aFIRdmv4xyBh
	2FIbb4gb6xSq2A5LRi+hY+SqKZQ6+z9L7zWqTE3rSIC6zKi+n3lVJwTBnh/fW+1ZPi5EjIIRL1F
	3ZBx68jWzetlB7RQIMp1Hifklfy39v0TUEE8ZkCwwbLvZEg53GYxGSJ8HrRL/JHw3LUzUiJfWlo
	jJeiWXUsVYj+8zFvRLuFRTtBKz84QWaX583O1dafWSwNm67o0FvC/6YaSUkWUgIG+lDe9BMhjjL
	t+QGzcRA/nQ9LbH+QQOYC2ug==
X-Received: by 2002:a05:6a00:a1b:b0:848:19f4:3b52 with SMTP id d2e1a72fcca58-84c294d431cmr20914841b3a.38.1784679731792;
        Tue, 21 Jul 2026 17:22:11 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:2::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175b26bbsm406610b3a.46.2026.07.21.17.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:22:11 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:22:08 -0700
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
Message-ID: <amANME8AVF7GN/ye@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721110903.34840531@kernel.org>

On Tue, Jul 21, 2026 at 11:09:03AM -0700, Jakub Kicinski wrote:
> On Wed, 08 Jul 2026 15:55:06 -0700 Bobby Eshleman wrote:
> > +@ksft_disruptive
> > +def check_rx_large_niov(cfg) -> None:
> > +    """Run the devmem RX test with rx-buf-size = 16 KiB."""
> > +    run_rx_large_niov(cfg)
> 
> Any idea why the devmem tests sprinkle disruptive everywhere?
> Disruptive means we take the link down, I don't think this test 
> does that.
> 

Not sure... I don't think the link is ever taken down. If the worry is
ssh, I think one non-devmem queue is always spared anyway, so ssh should
stay up too, but I haven't tried this out.

I always forget to remove these decorators.

Best,
Bobby
