Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2619388E42
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270047; cv=none; b=SFI5sSEGZMvoUzQqvV8bP6ddvw1w5RbhhFYGIevXYpQZHEJpxe87bvkw8wd02FxruEIgjlXB7nbs//9xgGvLIRfnBBVMJZ+8YBO/pLzqdHfEJc/I29Q5reEyuHqSWR9nAlKZX35CNVMeIAWcELWQmsrIpSGSvtRbDt2kXBWTlCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270047; c=relaxed/simple;
	bh=MM2fN5GdnEJYHW9MITbLdhoSmIAOoGWsDFQGNHwaPQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLOddv7wvSJO4ymg20ifCzRg7uHWXoky+n6wmOSSaLY35lbLbR3aXB6yGEnUdnEsT6Axp7EAqO1fDLeA6ToOgpkNwXBBCToOFhGRXhlBLvEKC+1YRaKVS4cDjQtXT5BmPX0MuU8NsfZMNndCR3uolfnvJxy8Wi99iDo7skn3HnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnYGIcN7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ECtEj5Zr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnYGIcN7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ECtEj5Zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774270045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0u4DoGQ4lmcA23oqYqC/015Lk/NUWNVl1j8NoB4BI6w=;
	b=bnYGIcN7gtT92p2SQKDP4JjCTxItSkv8rsPEdyM9/rh0xqVQLRqYE5E/Msn2WHU7z6cpIz
	uVSa9IWVx9k+4wHIoiFUGx3MD8n3SC4HWLF8MlapSEuj0PjxuWHp6PuHy3dMZ4rqBlFeFa
	UZuR2meNwEbtqeEuQSLxjx422bZqB7E=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-xWyOYOhCO9OLqdzMeyVfew-1; Mon, 23 Mar 2026 08:47:24 -0400
X-MC-Unique: xWyOYOhCO9OLqdzMeyVfew-1
X-Mimecast-MFC-AGG-ID: xWyOYOhCO9OLqdzMeyVfew_1774270043
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e425c261so4928692a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774270043; x=1774874843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u4DoGQ4lmcA23oqYqC/015Lk/NUWNVl1j8NoB4BI6w=;
        b=ECtEj5ZrLYPHGLb6FNYy9GQIJRSsJu5atQ1K12zR7GX7bOnCb+g4jMlBiXd7zydgRN
         nNzoY3ryQ8bhyU1CB6eEeFGSPCUiHSyMo795XhY0xWZ/E0Svf3PiE79piQRxC3ofmD4y
         N3fS3N2yWs3lzonczkFCt+xkJWbF7TVtBTsglAwYjIy6MSl49SfFXosXCgV7I3Cd8fUE
         ah+DJCn1V8rw8tuhbzV0pPW4ArWpOf6+CcdVk/EyLajoc3ZTKzwnqKp83PcMe4VapQDM
         1xUEUvvID7LGdm5BGflR7LODM1VWJzuUPZmXahDypSrNKuyKYb7GauMw1XEm8Y1l4SLc
         5LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270043; x=1774874843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u4DoGQ4lmcA23oqYqC/015Lk/NUWNVl1j8NoB4BI6w=;
        b=bASJV6VOR1qX8drUWPww3OZ51VE14x4FfJ09dAZhMpphLn4fX7QI4lydKXA2Sl51GT
         L4S1+zDMRh729fdyQWXQqKcWu0olkVbrebEMwRmbpIIeW61cXPGQTkZBUJzkvOg6lreq
         1FvlMLQ2CwwNBo0X4hUhBUSPihtHI2u8FU/ECGSc7waySF2XaRtkzkDyWXT2F4pBBlO4
         ndtGMi5dvBvMeGsnNuds2ocZV6LLQbY/fxuC/Es+jSf/8Mw488yxkVlen+Bo1y2zzloN
         aJJqduxSDuBBDO/khIC7nz/f3dgYN4pJEUuwIjuLTOSt0NkGorwRdvBEETkLfiYubJnA
         RvOA==
X-Forwarded-Encrypted: i=1; AJvYcCULt0XL8oCGXPfb+V5GFLNtowWxuvkaYcec1ZYb3SEZYSlsKUaCcLN3XGf63i4TG2uHI8m7ZfAEh0XpqrtwwU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWnkz73tLdgjxA4IeGYIGGmk1kekT7bTO43dtbzjl6UuW96lPe
	zlJZYHVF00ZL8E34hP9ca5HncU/2aVvOuo2SOCThPs6/kauB2nw2Of2j0WhI+RoYHDjO1MayTd8
	qX1Fo3JOBW3kBZERPcLUSa48kCzDTT/MtZe4xgryV4VobXCT/Xt5dW7DK8OI5iMSKbMbgag==
X-Gm-Gg: ATEYQzzur/GGZPmarZU5nwShArfOAfi7HOInaV8giYJCdTuXY5lT72+vQ7N9tv+HOG8
	+8NGR8DM3oUyLtk00DZx4q0X9eFSHcFV/l3RAAe7qnIDrMQrMaAgvsKDiJ1LU5RPHQFblQ9pFuM
	z/8r88KYPJFEABl7ZyKJbyrOWSjOSmeCHFBtKu7Pzthp99twm2gDJqzMWCAyo5Uj/GELHdIvdr4
	bXBKDTztRs2U6YfheWTGViZBskZvEgvn3R0f6P/1NuQRG+pg5qQ8f8C6wWBB+ByZcAW07R2lMnM
	sAVXu4nBCurJonETLBmfqIvlH7RICzwOS7ZoOKU1PZPi1fl3GBIwv9OHaA0KUJNERjFZ1jWkpk5
	O24YkMI0c9rPek8ZWCg==
X-Received: by 2002:a17:90a:1c0f:b0:35b:e4d8:bb10 with SMTP id 98e67ed59e1d1-35be4d8bc7fmr3116819a91.14.1774270043239;
        Mon, 23 Mar 2026 05:47:23 -0700 (PDT)
X-Received: by 2002:a17:90a:1c0f:b0:35b:e4d8:bb10 with SMTP id 98e67ed59e1d1-35be4d8bc7fmr3116793a91.14.1774270042836;
        Mon, 23 Mar 2026 05:47:22 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b9aesm141494025ad.58.2026.03.23.05.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:47:22 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:47:20 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 2/7] memcg: Scale down MEMCG_CHARGE_BATCH with
 increase in PAGE_SIZE
Message-ID: <acE2WDuto9cdp5Lx@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-3-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-3-longman@redhat.com>

On Fri, Mar 20, 2026 at 04:42:36PM -0400, Waiman Long wrote:
> For a system with 4k page size, each percpu memcg_stock can hide up
> to 256 kbytes of memory with the current MEMCG_CHARGE_BATCH value of
> 64. For another system with 64k page size, that becomes 4 Mbytes. This
> hidden charges will affect the accurary of the memory.current value.
> 
> This MEMCG_CHARGE_BATCH value also controls how often should the
> memcg vmstat values need flushing. As a result, the values reported
> in memory.stat cgroup control files are less indicative of the actual
> memory consumption of a particular memory cgroup when the page size
> increases from 4k.
> 
> This problem can be illustrated by running the test_memcontrol
> selftest. Running a 4k page size kernel on a 128-core arm64 system,
> the test_memcg_current_peak test which allocates a 50M anonymous memory
> passed. With a 64k page size kernel on the same system, however, the
> same test failed because the "anon" attribute of memory.stat file might
> report a size of 0 depending on the number of CPUs the system has.
> 
> To solve this inaccurate memory stats problem, we need to scale down
> the amount of memory that can be hidden by reducing MEMCG_CHARGE_BATCH
> when the page size increases. The same user application will likely
> consume more memory on systems with larger page size and it is also
> less efficient if we scale down MEMCG_CHARGE_BATCH by too much.  So I
> believe a good compromise is to scale down MEMCG_CHARGE_BATCH by 2 for
> 16k page size and by 4 with 64k page size.
> 
> With that change, the test_memcg_current_peak test passed again with
> the modified 64k page size kernel.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/memcontrol.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 70b685a85bf4..748cfd75d998 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -328,8 +328,14 @@ struct mem_cgroup {
>   * size of first charge trial.
>   * TODO: maybe necessary to use big numbers in big irons or dynamic based of the
>   * workload.
> + *
> + * There are 3 common base page sizes - 4k, 16k & 64k. In order to limit the
> + * amount of memory that can be hidden in each percpu memcg_stock for a given
> + * memcg, we scale down MEMCG_CHARGE_BATCH by 2 for 16k and 4 for 64k.
>   */
> -#define MEMCG_CHARGE_BATCH 64U
> +#define MEMCG_CHARGE_BATCH_BASE  64U
> +#define MEMCG_CHARGE_BATCH_SHIFT ((PAGE_SHIFT <= 16) ? (PAGE_SHIFT - 12)/2 : 2)
> +#define MEMCG_CHARGE_BATCH	 (MEMCG_CHARGE_BATCH_BASE >> MEMCG_CHARGE_BATCH_SHIFT)
>  
>  extern struct mem_cgroup *root_mem_cgroup;

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

