Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E253A3E9D
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005980; cv=none; b=kJLi1rPYUtpLaj4rRkYH6xUaA4a568LJ5xj/w9CwoNUI4ADFPEjWn1/YLlNZ7FjoBZtBp1efpsRtllV8npoaYuHFSjgvlOA4pgvjCvjJxtt7dLYyc505+te7mCHV+k0dPJJgIaorkXxrJCXj+FbHzqQcwd/H8oXcRbHs9R0XiA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005980; c=relaxed/simple;
	bh=sVlyVgj1KXRZy8BJPRwp5H/YcmC353Rz62nfZh184lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKrsCJ/EeIimN8abaia1iVqESo1NZiK5sN9SQKJXK9ZPrH3TdzsxKcdQSYGdX4hnOOGQqtv6FQBlAzYsZevh+hYzJ2XgWhLIT8zyr6De50oAfwYJDn3LofS9AqN/Wt+CSrj8ZuvgCR2y7PZr5IWwNYp9I2+m7v1NTNp1Q2YLCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/VPIP/u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5r4rnYm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/VPIP/u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5r4rnYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774005977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sw/BFdoRDz/kwV1Lq1g5a7lIWwY3pXrRBNNHoMNS1Eg=;
	b=X/VPIP/u9egaypO4Utn3+J9obhHKXZPvb7h1IVLeSPUM0MY226ovRkot2RjjlAUwFF1JYV
	LyS38Nu94qUkVpnv5ZD3cTK8UGk+X5Y7C+y/0Kt8A+qIlK9GPoDIfFauIqdp18gSNshCWY
	xKXyTX2J7N/Xd51u4oS2rWjA+8zapdA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-25YgRniJPk6e4zp0YlgflQ-1; Fri, 20 Mar 2026 07:26:14 -0400
X-MC-Unique: 25YgRniJPk6e4zp0YlgflQ-1
X-Mimecast-MFC-AGG-ID: 25YgRniJPk6e4zp0YlgflQ_1774005974
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so507869a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 04:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774005973; x=1774610773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw/BFdoRDz/kwV1Lq1g5a7lIWwY3pXrRBNNHoMNS1Eg=;
        b=G5r4rnYmbXWoZe1/t8PoeipN9dAkg6G/64ngerxrLCYuIPg6ccs6Y4IQGVHfbrmEOK
         1/biGDsPAeVf7z9jPKezFIAQkVNi0n+N53AlhVsAjHoa+e8XXyRyH5fhunPz800ogx5L
         hHK3hpSdWhAUvA2t3/ms8y+opUKVs/xSErXIBRiBBcy0O+b/bM5XrBTeMfTb/gtDoKuR
         9X63IiIIQ2+dddX9yl1PDIODYgCOtH4BIlAsF1+BHVcyaFsPhny+EG1d8/ACj3lOgIJr
         sRbBvdC+D2MjGaejpyd65EcdKt4ROQ0DommQiAKXVofILqksHgyDI16tkbBjCfXv1G07
         XmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005973; x=1774610773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw/BFdoRDz/kwV1Lq1g5a7lIWwY3pXrRBNNHoMNS1Eg=;
        b=NsbpKBKEbfWIlJ1KevMSw4/1Aqwh73qteM3XrVwJx+qa3WAZ/uWvTULot/TQKBMQDe
         ygU6tczEqQqmlxQ8pYT8eCS6epuFGJvj88mt1WXusd1jkF/2KXYPcsLYTVOC6RKR2iWp
         m7A0IhnhyfpNuJqOt2m/7sK70JIRTh14mHrxIfGqdPUkdUf5Y7CuG4D8/SA+qLeSfqX8
         blovE3sEHSArmT7cKmNifsOehiRWTRO4+QSHOovx+0R53YjJ3cKZ0/GEdlZQTJZXahBz
         2DcSiBRFGM7SnXRu+l85cZadyyh9UTtXIM6DEcfwPiF6vBTq9ARQ013Xi54rr/Lhm4ia
         1UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUyI/4dvDSzestefXH7xBesbfiuBwv2vyRRJOeBmOCyczFi8F8KmLIYf9EHUHJNS8h7Za14Qun1VgXCMSFThA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YCRL8b3Rbbj34/Vm3XDUmNItTVjJm2xyB1u3xKHJJvIsIJjm
	7O2h6YfPp2hmT5Xffc6Ow6CWIMb+NVlU6UU+i4U57eKIYVi/6UiKdrYm+boFPrxwnkMi/eUjNxp
	v4HHAE7MooCNbynBY17cEMaAnil1MMB8IKDm2Pre5ZniJXhzWoXOCFispeAXDKStrHvEUhg==
X-Gm-Gg: ATEYQzw1N2zCRVxjofc2TvL2mc9LRO4YQrS8GTe1g+jb41PRbd5BFO8HEIWpL+hmu+D
	9TFQVd9OQTE9RP4wMtdZjRfknDIyLPxSfI0JrqDzIrvkUNQHn35tYu94GtCeX3M3szCmBdbEEmS
	vU4Jn3V6HOEBKej4cngbcOz7j8mNHN4f+0J0GKcWecIj5hDAKOgPJ+gSd2znNmgr2wbv4P+MNqL
	3k7clmOCa1IRcW8LZZoqRR+vfOptaa51nVYMPk4/piN2k5VKtdDODBBLtRyTtCY9d0vFVdKSgV2
	xf670EJPQ3ZSbhSp6i6EKsNNNWjAN2dGpnEtLyEOL8xTzFlf22RSqWYLU622N0elbA6G+De2sea
	xDTCtjlkCf2HySFFtQg==
X-Received: by 2002:a17:90b:4a50:b0:359:fc88:fa99 with SMTP id 98e67ed59e1d1-35bd2d39c11mr2043994a91.26.1774005973518;
        Fri, 20 Mar 2026 04:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:359:fc88:fa99 with SMTP id 98e67ed59e1d1-35bd2d39c11mr2043977a91.26.1774005973145;
        Fri, 20 Mar 2026 04:26:13 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd40e4bf2sm1655907a91.11.2026.03.20.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:26:12 -0700 (PDT)
Date: Fri, 20 Mar 2026 19:26:09 +0800
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
Subject: Re: [PATCH 2/7] memcg: Scale down MEMCG_CHARGE_BATCH with increase
 in PAGE_SIZE
Message-ID: <ab0u0XCi9xBefrhJ@redhat.com>
References: <20260319173752.1472864-1-longman@redhat.com>
 <20260319173752.1472864-3-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319173752.1472864-3-longman@redhat.com>

Waiman Long wrote:

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

This is a good complement to the first patch. With this change,
I got a chart to compare the three methods (linear, log2, sqrt)
in the count threshold:

4k page size (BATCH=64):
  
  CPUs    linear    log2     sqrt
  --------------------------------
  1       256KB     256KB    256KB
  8       2MB       1MB      512KB
  128     32MB      2MB      2.75MB
  1024    256MB     2.75MB   8MB
	
64k page size (BATCH=16):

  CPUs    linear    log2     sqrt
  -------------------------------
  1       1MB       1MB      1MB
  8       8MB       4MB      2MB
  128     128MB     8MB      11MB
  1024    1GB       11MB     32MB


Both are huge improvements.

log2 flushes more aggressively on large systems, which gives more accurate
stats but at the cost of more frequent synchronous flushes.

sqrt is more conservative, still a massive reduction from linear but gives
more breathing room on large systems, which may be better for performance.

I would leave this choice to you, Waiman, and the data is for reference.

-- 
Regards,
Li Wang

