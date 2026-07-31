Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018D3064B5
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 22:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535267; cv=none; b=u1ocdW2aLq076cNEtYrhGBrJgeVfY7HQ64hQd5BSUXANQt7s8edeDTbHElIw+Sh+DZb6ooRLhlSJnk+/dKLg3/0J6lGEY4XLZZ82gCubYXuCz5XOXM0n/9wvzagA3UuSp/+MKCM030PM3dEa8xgvCKplwPHCVj2xbMFLUcPdEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535267; c=relaxed/simple;
	bh=RJZ1rlFHf6Wtd52ZhwYrZmFucK2tPKKMxzDlcmG6gLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cC32RKhao7i6zNrt+K1s/+9cmqe97uYy6TJx0WuIV/upMqujnxLt7hheqSKCl55tqrSmn3Ixjp71iFUtbRLwFag5MRJVqJBqXOuML5/Uj9UZwIctDuLZjSIe+MP+O9pB+84VogzP4qvWJv/PqOOKRRbyv3rM0Ge7Tohl9ASSd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inAXsZpg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inAXsZpg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cea3004256so17345605ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785535265; x=1786140065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvrQ6elHBjzw1ZZIATnQHAMJ2uvLdDDK2nT5pKMJu90=;
        b=inAXsZpg7rSfH1DiRJO38JoMFw/MwRLgTogOJ0Vq0cdhFyUSs4Ga00KeNNzCdUCT7C
         Q/SeZ6JPOg1LlbcxyvJvtA8lmL+lo0IaDRi8XC2dJk2tuSSlNp8fi8hyTInHKEbj9FKl
         FGLb/VJFfKsPp3MNzwL7JrgL2EhYIhcAGT9yGi02JcHhr3xS2dS7cp6P7T/tqLIxbDvK
         /95VQ48aSLJEU0YiMeI8OcIvzOup7pQNHluB/EwX/4foNwQ4PIzS59L/koa9SRLt7VUu
         GLPHsEnfwoshcrlSaV3PV8kdItALA29eEn9LIM5zUwiB5EkZFfjLKm6mliJ2N9Vgl1wu
         3CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535265; x=1786140065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvrQ6elHBjzw1ZZIATnQHAMJ2uvLdDDK2nT5pKMJu90=;
        b=iTWLlj2PgZMRW26KXiHBw49SIy9M1NfJxlgxTM7YHbqrMSGamTCaf1N3M8UKZIOI/Z
         vnsLfYy475XgtQKTCAgvWDbZD2A+nBp1vD1IBNBCct4+jv+yOYuaTpTtOhRRQhsGHzqP
         su6MGP8/cVC3QzDImhqmYSpblNUK75sRFjEZaHDIKJBdKgHl9oY/z4q8ZmszkWbdv2kb
         WMQ1UMmVxcv8FaPYjbKIC2AWfi85Mrmxst317MCojFuEKyD98fB/EY+XCbXBc8blXvqs
         qOQ3/x3FiAgtZleO+SdFc5g+Xhbr81jPqeZ1BW45ld4CrEY0GcrQy6mP0htL1Ikc7wYK
         NYxg==
X-Forwarded-Encrypted: i=1; AHgh+RpBkziWXe6HFH+xe/6xr9PAbkBWp92GifbIv2Qrb+CxXhYtGDhbDKlsAz06fUrHB6+Pdt9qF++lyzuwXDLff3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1tFxb0wMOQ1wVHaVgCaghZSvib5bhmIoKHYbVBe645P0vA693
	GsQ498IzPHPDun0u57bpNvcl5Ht9OkSG2tqrCOZbEeDq264U+RH/G6jf
X-Gm-Gg: AR+sD11SR/beXi1jc/tTQVdrqp80dG9UzXxOr9RQykJN5Rx0LZBZtkLaj2wXoICBMzw
	f/nEV63L1nR0VccB09ztizOHdAjFvzKsWsZkVGDTESN7CNfeAjoeEW5CPt1ltC9zZaTkXTrqwLx
	ZoGQgr6pwvUHXSvGDS3Gwf2fSwPefXLRab0+y0/bLyvSQYXPpFTlfLKwz8Z4B3ggM4HW2ewLKx5
	Kc2jt/0kvTsru+M2mZan3pOrtJrCK1b2FN7uqUrbnNXMmUQZpVuaYpep6Lcz4o96w+Rc1KNSN+H
	MUa/lj7nuhqCiCIfT+hPeb8IVt7pSAhFjk6am9JW6/jrrqnJ74elfKz9oqJvaWFhxprhJ0WvPsL
	T12VHiJ2vDcaWUqv4vwudd+xosXPJN9o368EUfzkjOMxqtrouIijXbkbmw9eXXNNixkU5+XWNYa
	hbf2InOQyGVyucbwI2WKdECqaSWxqScjHafCWD0wTQpmc5/ZqD471RnSAcpOdiaR348gnHF/GaT
	UJAzrJQ
X-Received: by 2002:a17:903:1110:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2d052428e6dmr13323565ad.24.1785535265148;
        Fri, 31 Jul 2026 15:01:05 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b121751sm10403345ad.65.2026.07.31.15.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:01:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:01:01 -0700
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
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <am0bHSeJqcgdm3vn@devvm29614.prn0.facebook.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
 <20260729191649.55ab7942@kernel.org>
 <amvEJVio9XtCn+YT@devvm29614.prn0.facebook.com>
 <20260730151433.6f71258e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730151433.6f71258e@kernel.org>

On Thu, Jul 30, 2026 at 03:14:33PM -0700, Jakub Kicinski wrote:
> On Thu, 30 Jul 2026 14:39:37 -0700 Bobby Eshleman wrote:
> > Poking around, it looks like 231.1.167.0 and above should support
> > everything, so fw should be okay AFAICT.
> > 
> > Looks like the config is missing CONFIG_NET_DEVMEM and CONFIG_UDMABUF?
> 
> Ah, damn, you're right. I grepped for DEVMEM and didn't look closely on
> a hit. Turns out there's a non-NET DEVMEM, too.
> 
> Could you send a patch to add the missing config options to 
> tools/testing/selftests/drivers/net/hw/config ?
> 
> Can be separate or part of this series, doesn't matter.

So NET_DEVMEM and UDMABUF both depend on DMA_SHARED_BUFFER, which is not
user-settable (selected by DMABUF_HEAPS and SYNC_FILE, for example).

Pretty sure UDMABUF is supposed to select it, not depend on.
Documentation/driver-api/dma-buf.rst says any "exporter" should select
it, so I'm going to send that patch over there.

Meanwhile, do we want drivers/net/hw/config to workaround by carrying
something like SYNC_FILE or DMABUF_HEAPS, or wait and see about the
udmabuf kconfig change?

Best,
Bobby
