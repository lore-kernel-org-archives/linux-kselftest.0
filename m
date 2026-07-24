Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E424457B3
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927472; cv=none; b=gnrzOwzlvMr1oqHW2OApJnmUY1s9ix1EZyAEFhqVOgs5dGuaF2PDFu8vMmyvemwDvqZp67XsvgjSp3jvoT/NkBleY9oqXrK0aCAt7Jx40OASnD7qh2h+9VaxiGzBmqYRkANSgQl9kNhY89RXXnps+9yomg3akWEycnf0i2Zs7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927472; c=relaxed/simple;
	bh=RirywIIvCMGl+AmhsxILpmh/0g1v2KM8NX5F8TG1gsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2r/VtAwtaD5hp0GLxpPHZlr23G5Bqg2S0rLEiT6AudXu3uEZ6XdtfDOy9s1JCWpebh6eR4NbS8Zp2mRL1F5nwYQcyqPrfE8sJgd/rSnbfVU10E4wJ5lYc0JLTbyryCscs4TPpiyvsMD4yc8F5UC9ba6NUU0CR9OHgBKm3JmnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esC3Tvda; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esC3Tvda"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso12497385ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784927470; x=1785532270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWQIrK7yeLWM4ZB3OW1av571sFujM5GYrF90hFF5FZs=;
        b=esC3TvdaGQ5JtUReZ++og6DtbrdHuKcXJhZmz4iBdZhnEAQ9k608wM5RKPHsc7/opv
         5Fw4SMz3FQQVDLYW1cjKS07dT1TnnJmU6o1cfPkVPAcMQRiqAy36+jZYcT4rpeSiOgTR
         2mi27NPqvefFxR54y3zfs+qVzU0ZH6mC8ZLhYg/hV9tiwuzQOV5oZV1WvpRATqz2syJn
         g98ZCUBPy7bxidFYTmyjtCZhqhN4w2tEoaeA0Y3OSPUfUCWWDMubcptsxytC1r0x6zeY
         3PDM7svt3VRn9rz5NlKO39QmLGcMzf/5XDbkDrX9c3wms+p/eaa0ntDtP0ZuFTQ1/I0d
         mkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927470; x=1785532270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWQIrK7yeLWM4ZB3OW1av571sFujM5GYrF90hFF5FZs=;
        b=ngq+8kOUGGzCm8Wlh8QARSSxEs1+JNooOo55UMUQsGm8OAsYgiOAGpTYyia+Fdg6ow
         Khb0xGo+BlwNfBk4BYD0BJWdG8ZrkgAVA0PRFPPpMAF7BceC3OgWdPYW93/xqVLPloAx
         9nPbZZTkkCLElqCdZ0Px/58RlN5GVpAaF/Gt6jEKF3SOC+qjj4H4IDcPFJL7SZA03czI
         2oRoyjqf53nU3jENlcJC+cQ0V8TrfGpCxrw63FBN2C59I/NnTdGal1cT8CNgycCsRPAr
         eb2ubi21xh1K424BSQj/N6UzJ6HrpqmWiCPPMjknzDnvaKriH7MtO9KzakwmGYm4pgck
         7ZbA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe+ijXGJDj7sy8ACX6wZDe3PzeNWUJA/0P5Z2U2+V2jT15JZ8BYZcp5AgLwhCjXpFW/lo3wC2iYV4SgX4P8wY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bmtuQADhX992CheQQO+ROCm/7oobSvqnbo2xNScsu/uWIea6
	hADjzZ02aqO8QGrtpTJf+S2z2bL77aSP/qA7sS42ADNBCXz7B1WBZdKB
X-Gm-Gg: AR+sD1215wg9CRZ/v6Mnnn8IGTD4cA7JWOtyEfjLxnQ3bmJm1iTcRw1CuU/ojIZANjq
	kVWd6DXSRijdf52RfyZzDjXbYlgaorEIzFhcR1eW+N5L26UbJa0UmE5nnqKyk/oALEcY9Rkyt+v
	tu8771YuRaxhtsJvwS/nWv7gTvsuFw2f9J3li674dlyzLud/pubmHM+I2Icz27M4YDM2sQ3tO9S
	67wjPIZIqvP7z/kyaOlIszYjw9ibMpqApv8DCqQ2TMmIoS12gmTFw2p3TiI1TRPbiftE9Bwd5NE
	wCJ2sznTXRJYoHSrnRtX/fSs5DAYCQZTxiLQ9XCipVEMqfI3yMTdlKYmYg4ZGoAkmPfF4T02KGl
	KCsOnns94NEGvh/VOvkshgbRWCqfILDyjDFvskiKqwxtmKVG4pDZYyeaVvFB09HvQn6M+V6TkP0
	dNEvqQp9HJwZHUu0YWwFGBnw==
X-Received: by 2002:a17:903:1c2:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2cfd7953a96mr18549685ad.10.1784927470019;
        Fri, 24 Jul 2026 14:11:10 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f48f8sm242665ad.70.2026.07.24.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:11:09 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:11:07 -0700
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
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <amPU683HyCt3TJNG@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
 <20260721110713.325d36ba@kernel.org>
 <amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
 <20260724072419.62778bbe@kernel.org>
 <amOVWgJ3BAJ8I/4+@devvm29614.prn0.facebook.com>
 <20260724125817.4495a7d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724125817.4495a7d4@kernel.org>

On Fri, Jul 24, 2026 at 12:58:17PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 09:39:54 -0700 Bobby Eshleman wrote:
> > > BTW did you add both min and max checks? Cause the only risk with using
> > > a dummy value would be that the policy will be rendered inline, and
> > > inline policy is u16 so 64k wouldn't fit. But your sample above has a
> > > max of u32_max which forces the out-of-line policy, which is what we
> > > want.  
> > 
> > Yep, u32_max:
> > 
> > +	 name: rx-page-size
> > ...
> > +        checks:
> > +          min: page-size
> > +          max: u32-max
> > 
> > Sorry, probably should have just sent the whole patch instead of
> > replying hunk-by-hunk.
> 
> Ack, LG, just double checking.
> 
> > BTW, how expressive do we want these policies? For example, would
> > absorbing the power_of_2 check into a policy be valid in the future? or
> > is that too bespoke?
> 
> Power-of-2 could be useful (it's implicitly one bit set, which is also
> potentially useful for validating one-hot flags). The trickiness is
> combining power-of-2 and the min check :S We have one validation per
> field. I was wondering if we would be better off defining the field
> as a shift instead, then we only have to check min. But I thought
> that it'd be a little unusual for uAPI and possibly maybe one day
> we will want the non-power of 2? So I figured checking min using
> the existing facilities and open coding power of two check is good
> enough for now.

SGTM.
