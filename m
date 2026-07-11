Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078423BCEE
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739994; cv=none; b=pmUqAwmP5/i11XRoHnsM5Mb5zYGZUOtY+I58it/CDYirgsb14S5MCkfQwZ0sU6u42utz8WlxoFQewsEOW0XUnjvyoPNcEVlRuOSTThqFgUWZQLp81eD6BEBfqAh6GjuPrTpADbG+2fsqW/EVXy1tbgDMPTClWFpf0DUPIUesnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739994; c=relaxed/simple;
	bh=71lARMM3Jl3NDTlQGAGPMbgSLaP7ywZLy2GYTYoKFog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ET2V/dHmexihTuAUBCBGgZY44qdqTZdKmaKHzG5+VJPtwXTmfWTcu5m904kICzx6MMK9hOAgwYKR7X5O/ukU1xSd7yr7ZEw/P/izDI6CCOb7P4McDmfLZDq2KDp46jrn60WrIaeQdqfLQyVQ/ZtRy1bcsuKkI9F853Jhj5xcBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hktlFisp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hktlFisp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so14429475ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739992; x=1784344792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYTaMzfdKXyQ96IWRR1Bd78qVpBo65z/nucHslKEHMk=;
        b=hktlFispw0ReXJzK3IozV1fiAPHm0k4cHxos2ESjizWBwpRk1ilHYB2tUM36yXdal2
         kyQy3mO/55/PA3qVY7Dy7f+3SsgSoXzZh89BMiKIqHYVppaZsJCXXaPGmK9A2UtkWgWI
         Bvt642gB4jDf5qKAOHQwKDNU3jLqpoLsWxDH8/tjglYys0krxL+70yU98SIvqib43iX0
         mJpDvfusI/Yq2RE7Qa+OlYXtjwsXXCy6Y9K2oegdE5y43FJUzt3MKyLyRr3DQ1e1m3B8
         bzVrqIfyLc4p1Vff13B1EbA0nlkyyZ76GGNEarjltbHIZqFHwkTiGYZECad3gxHoIgdB
         BrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739992; x=1784344792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYTaMzfdKXyQ96IWRR1Bd78qVpBo65z/nucHslKEHMk=;
        b=XAEYSbOc2uwl2eP5/3SNS43slIcR/Gq0y95E93EgGHpoHNk47C/E5C5smLuJ3FMPkw
         Vr9XoEO791RC6x9pnd5XNNHqrAvwsOYt3SaM6plizAnknzmRyPb+R8PKj9seT86CiSx0
         gzIURoIoqtyRu96x80bKpyn5xzEny8vdyRC0/jfp5ljOWVH90m2XKMnYislfO84ZXI6/
         jcyqj6rFLsEqKpuGdMNLi44xLmUVmH2vrRMH1FoydVeYoYGnSmBu4nXDYtMz5HAHwhlr
         iDKHrqYD8w3ifgkzbZdOfQyXpMXyiKXK4G1es0Z3ryFNKmx6W+o12qnYFMS7Fz1LLYlT
         lLlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSW+3sUbpuaWjikp45MqYqUIi40XGUf7+kZyQqgvt46jTfp3cd3eFZjKXROMzQHC8djpWZ3Og4ZN0ABBDCaGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzettQpY/zvDnWxAGLkKyxmO8VQ0u0IHn7vvUVvkRoPcUMTIbO
	8GuQkc4mFKdpgS6tgq5yXHQzO2kJwQ12xhAilH2/OqlRgZ2onAO38jTf
X-Gm-Gg: AfdE7cmximYcmBptA9oTat7fX6raM86LQQzJPZppvltByD3yRmoEIpXJjT3RgodA59t
	M/jE5vRrUg3eZgmlp4iqSsk5jD66cBBNLUYmfNGXuvIK6M99y/7Mj0fv/xGp8RjF/2AOSLFokhu
	UVaFUC0ss3fG97jsQDm/yJ9XpxcA/ICQyQ9BGz/wyNsPlp/GfgdZaVLTSaA/pMbYnz46BQlDqQO
	VDiVt2NDsiPgZuL1AJc6tE/dNuZ9sapLHJTZbjG6qxnn7Z/qroIE7gsQbQEv635M92PhyRcDH+w
	xGR3Q4XMi4IfBofqENVrcc6FgMJqV5TRwUQKVJV/kOn76vy6GFX9+ERcZG+Svgixje42ihcFWl5
	rWD+Vnbguqu6BZXj9JrycjdB2KjMFh3IP9dVvEd6lOKgOjQUmHt1FS9AT30gwN2pL998T7gtm0o
	+bwDjCZdbwIKD2Kooax6MMuFmTmagYMmh7XB9xcI69L24Vmozt2DDju0k=
X-Received: by 2002:a17:902:d2ca:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2ce9f2948camr16114365ad.46.1783739992132;
        Fri, 10 Jul 2026 20:19:52 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm67571165ad.77.2026.07.10.20.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:19:51 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:19:42 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-ID: <alG2TldWdL8Ez8Dq@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371883276.900500.12789147320642521200.stgit@skinsburskii>
 <20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151228.ca22e127b93ec5c6d591fb5f@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:28PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:27:12 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > --- a/drivers/accel/amdxdna/aie2_ctx.c
> > +++ b/drivers/accel/amdxdna/aie2_ctx.c
> > @@ -1061,22 +1061,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
> >  		return -EFAULT;
> >  	}
> >  
> > -	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
> > -	mmap_read_lock(mm);
> > -	ret = hmm_range_fault(&mapp->range);
> > -	mmap_read_unlock(mm);
> > +	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
> > +			max_t(long, timeout - jiffies, 1));
> 
> max(timeout - jiffies, 1UL)?

"ma" for sure, thank you.
I have the same quesitong here: will "max(timeout - jiffies, 1UL)"
handle negative "timeout - jiffies" values correctly?

Thanks,
Stanislav
