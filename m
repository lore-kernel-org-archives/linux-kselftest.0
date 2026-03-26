Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692DF391E6C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506568; cv=none; b=hsZURa2/k0EKe0uAUtgGawspsY3+ptljbOhxa0o4WgZv0U9mMztcRs/JGKDgqJ7ka51MQ03379lOU0N/N/XALN+bAJCbMO9dBnKsQNWM/BeRmrxCkO0JD/Jxx9BgAppTos1OgELEXJPsrOWqFHwP10yVNWGENUdTCvMJGnKSu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506568; c=relaxed/simple;
	bh=9gq7qPR9CEwk3V/IQZo5chdd9qqo+oyy8XeNzx6g1jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIoBiVWdhI2e147OmgTO52Kr6lVv4iGQdiQNtrCVKo4132G++OpD67iMcRa0sgP78QDZArVh24jOXaCLCTyY1RaQyLvntklxC4oXLk196CahbhevKZMD+WlAeWQRvu33wlyQM9lsZhpodXE2h+JT+fE4mAnuphyJxeTaqXG3wFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwT4yuvK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyJwtGLs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwT4yuvK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyJwtGLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774506566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MyI2EYNpZ7Awc0Gl+yjDD05joruwHdulIWYSU2VCVwc=;
	b=bwT4yuvKYeKwe95yJS62G/io9T7AhgqTKbtwSzR94pvuEm/YjKR/223A7DzFR+4QNNBEg3
	1vkc8e0VjTV2zO4WkUVSq7J/UA6vviNckpc8SROZp8HFwIpzSfLZPkHa67jecVGNTtutqk
	uL1SIFzdsOYzHa8zNIAS6t6BqC7pN+U=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-e1wEexWtMzWFQazE7xdlIQ-1; Thu, 26 Mar 2026 02:29:24 -0400
X-MC-Unique: e1wEexWtMzWFQazE7xdlIQ-1
X-Mimecast-MFC-AGG-ID: e1wEexWtMzWFQazE7xdlIQ_1774506564
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso2118506b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774506563; x=1775111363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyI2EYNpZ7Awc0Gl+yjDD05joruwHdulIWYSU2VCVwc=;
        b=XyJwtGLsz3JyDBTuCnkpbgvufwrt4vsOfZtao39i9yC2LwlgGWm85Y4EX5Q5vd4qB/
         LrsMUMFkvkzdaym+CDgTjJUC0iibv84oHpYl6IfnB9Za1CnoakT/fEgiaSK4fGzWOxDF
         mfW4FD7TOpvm1TK28RMDDEANXPZDGhaf9ydAfq28mL+Oc6NIohVU7Bf4sG1Lv2NeSX7f
         hvmtQDyumQy834WiTq2yQKZ7S/mYPS+JOzhyL5R+FgGqZfgerHhxebDJejnR/5MAvub0
         Ex1hqXS5p4OlSoiOVli+QsgBlkNTYH5SEzU4GJdDktXJVdAm1L3ZXlor4xHrxyEsuKyW
         1QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774506563; x=1775111363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyI2EYNpZ7Awc0Gl+yjDD05joruwHdulIWYSU2VCVwc=;
        b=ENTouCzf/0HA2u1nhjAC4kdCziI/XSmJEEac/KVFWyxy23DNbZa1rJsjU3GV5cDLC2
         KU0b7LWYBNLLMncdaGjQ9IxUu8l5FILv4Tmz130ST34lXYlvczXkJLxejol+ZNHIY/+d
         cUDV4xKwaUduWbFGrva6spmyezD+Nm6+wL8jR4TJM/QBtsOyQTjzRhv7y6PCYhvlb6ij
         eSrsiKZqQuMS6Nc7kNioCAJzjOONHMxCfvENm9r8a18XMtCzlP7e6HMhHEuYr/fhvUGz
         bVcmoiGru68DxseVSl6rinr2TxpSx4mrGnqTQf+F9dg3ulqTs7r8ZVx5i3bW4V/SrruR
         4XuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5nGJnScEL2II0gM3O6VfF6WyDNZ1DAj2ENkhHb1MsMIzvOMWdu6TG55/JPoPauFBVodTDb9Jp92AgAea4cNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmmXoYbXGE8LyULmz5i5xd/G0ZzfXuFFzRMKTWuGuhL1iSMIt
	Vc5C6SLETfQ5LAKBZMT+aFUusXIPTGnpltulyuKsMeOWUU2yGh8Yvsza9HmA4WQVxO0+eE3Eybh
	c7uYNWEQZIMc8OwaUadvYsiwFSy9GaW3PyTEDtIR1JT0woge3Kwr12QsAA0xR1rHMmAwK2g==
X-Gm-Gg: ATEYQzx2unE4pi/8O1Sfcw7T7aN119HnC2LDR3e4PH1revf+5NQYs0+H2GUhoquIqb7
	yH0DIcpLPt42wdFhU6bOblU3wPx8HTpZ2BuDCtmQDsrp2YbJuClPXhw5rCy4jrE3vy+DK1RL38U
	rtZKVG6ptJpmgWbfnKvJmuNThv1OwkJbBtsdgiOhOdFfPQmttg7BQQSDUuvmsSg5lomBkEdiqUC
	fBOi7xEDQP2I1Z9XoFKQ9WRSfGGQHnedpwueAgD1Zr1mnc13i3BF0RuGG0rC4JdQFD95WrLhAVd
	KCT1RYblLSw76yxyY7mQDE5jcPBNO8xiJEeDB0ci3VfW8SuWn2jn4UuutOMFg0665kofuI4y0Sl
	8LwzUA5uu726KKXd4Sw==
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr386649b3a.19.1774506563581;
        Wed, 25 Mar 2026 23:29:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr386611b3a.19.1774506562724;
        Wed, 25 Mar 2026 23:29:22 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d38d7f5sm1553107b3a.29.2026.03.25.23.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:29:22 -0700 (PDT)
Date: Thu, 26 Mar 2026 14:29:20 +0800
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org, yosry@kernel.org, nphamcs@gmail.com,
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com,
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev
Cc: longman@redhat.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acTSQFxTs4-t7P5t@redhat.com>
References: <20260326032658.96819-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326032658.96819-1-liwang@redhat.com>

On Thu, Mar 26, 2026 at 11:26:50AM +0800, Li Wang wrote:
> This patchset aims to fix various spurious failures and improve the overall
> robustness of the cgroup zswap selftests.
> 
> The primary motivation is to make the tests compatible with architectures
> that use non-4K page sizes (such as 64K on ppc64le and arm64). Currently,
> the tests rely heavily on hardcoded 4K page sizes and fixed memory limits.
> On 64K page size systems, these hardcoded values lead to sub-page granularity
> accesses, incorrect page count calculations, and insufficient memory pressure
> to trigger zswap writeback, ultimately causing the tests to fail.
> 
> Additionally, this series addresses OOM kills occurring in test_swapin_nozswap
> by dynamically scaling memory limits, and prevents spurious test failures
> when zswap is built into the kernel but globally disabled.
> 
> Changes in v5:
>   Patch 1/8: Defined PATH_ZSWAP and PATH_ZSWAP_ENABLED macros.
>   Patch 4/8: Merge Waiman's work into this patch (use page_size).
>   Patch 5/8: Change pagesize by the global page_size.
>   Patch 6/8: Swap data patterns: use getrandom() for wb_group and simple
>              memset for zw_group to fix the reversed allocation logic.
>   Patch 7/8: Setting zswap.max to zswap_usage/4 to increase writeback pressure.
>   Patch 8/8: New added. Just add loops for read zswpwb more times.
> 
> Test all passed on:
>   x86_64(4k), aarch64(4K, 64K), ppc64le(64K).

Hi Andrew, All,

I see that Sashiko still points out minor issues in this patchset,
That seems very tiny in selftest programming.

I can correct all that in a new version if you'd like a perfect patchset.

Sashiko comments:
  https://sashiko.dev/#/patchset/20260326032658.96819-1-liwang%40redhat.com

-- 
Regards,
Li Wang

