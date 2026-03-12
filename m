Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FA32AAAB
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 02:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282921; cv=none; b=RWBhe1W/TIQsohsH0ekb+v2tbHBZBPKVGQ2DpzoVZ8VU7x/qiWpYLLsbOVFlGxG9qSScVLeJCCI+ITKXR/Y/2eBde9LV+Lsg1heFUQGXvi0cvy2pFoPLRHWdjmQO1maRjp003saA5pMKo95wfluftJIJLpy0/FrDNu8VWGm0ljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282921; c=relaxed/simple;
	bh=r86YxBWwjO+ktjDFFhuuKmR6FJNmyO6rdwnUxtDS58E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BznqoIIZai6IGkKbv0WLbQg6c0t/P5fPcLW2miUjQVvm6l/JG1k1C+OTFrsUwWDsXUna2mqYGORi2MrqYdO5PH7TSyCeMP6OiL2yTzPv9JHEz842WLSTLcsl4DGowI3VNPdlLbBp8PajLGQboqi1Y8atEyn0zY7ktUjeUWaiiNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HxNuYpNE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=j6Dk5noj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HxNuYpNE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="j6Dk5noj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773282918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OS/SC+gPtS89eoPebOmFMRSactrSzl1taYeA7a3Y8s=;
	b=HxNuYpNEHp9XdERBSkE3gLbKeb90yhU4d7qR3kgmu9EdYvVWBHlzc4NhKJS6Zq6Mak+onF
	zb4+raOY4AyxtP6RylUHmzjW7c1xnYA04ZAAPfC/mXnfYqjOxMbQwpU/2JHvvFCdxUAq+A
	2+30X/x8gvJ915CuJ6LOGa8O3FR56wg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-P7Kpxo4IO8GL-af_1Ed4UA-1; Wed, 11 Mar 2026 22:35:17 -0400
X-MC-Unique: P7Kpxo4IO8GL-af_1Ed4UA-1
X-Mimecast-MFC-AGG-ID: P7Kpxo4IO8GL-af_1Ed4UA_1773282916
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0ee0fed2so478741a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 19:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773282916; x=1773887716; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OS/SC+gPtS89eoPebOmFMRSactrSzl1taYeA7a3Y8s=;
        b=j6Dk5nojELr2LKvNG2bQHVmqE94dwHnthuNjWDS6aYGEAY54GFCZRkHY54mY7gFnIp
         DL5CkhhV+penLk42clgiQ5eWZIEVrmIChM9WIyvMShtZdhyIc5trsTaQn4+i4gFNnOcA
         DlYgRACnJy/V3mHE8YhEaHapn3XQoHwSIiAJvNrLyyXUBzzYYvrgeaH78aevcSxtRuqA
         PAlpEYYy0Ws91qE5txXBjou5aHOCDXT1HLiCkaJbWorPcNMbDLF7shEFg4beOOnTYnbP
         Q0DEbwILzjen8I7P3BhDPH0PlL8e5szZul4AKHVDFjLo6Ae3DhlnUmQ5HvbqWiVj7aJg
         GBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773282916; x=1773887716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OS/SC+gPtS89eoPebOmFMRSactrSzl1taYeA7a3Y8s=;
        b=jCGfAUw8Ywub/VZK1Rv6tYcXOZeoHBr/DKrd3NMHHtV7NuHZvhjMDmjbNKqV0tZF8T
         iz/qhs3ugikzINmRS41yjFfRISy9L0/xEhu7CmZlnyd8N48jpqdqvlkzkHgqPcq9cIHo
         fonarLro3hfz6nuB/co/mIE4b4EApjc7Fb2I5jlaO5FaekCtYJxMeaBNJziXSWDJGYR0
         LLy3wL/W+IPYd1ZK7M4Ok9FtWLuDliiWdsSfqgcX5cmJtGqiwLfAyWNlVDEjWM6i9jjs
         wmb+0VcDp0pSSYhf+rEV9o/TlGwEhg5Plp+J024Qqq3ZeXcBoiyVijhEWNKaS44f0MyN
         IOTg==
X-Gm-Message-State: AOJu0YxQZvK6D6QzdqUl4ZX0WLW0yBVtbECYIl3az0JpJ/nqkTT+yU5i
	djYuSwjGmILFhM/FnCaiu9Zo/DtK0QnPZpjy6FN0P4c3WP6o3HAlU4I2cyarZ4e45VDUaGat/j6
	Ts4R7BruyqeFGNhDk2ymBcHhifVDJOR/8qdAKh+MQfuVGhRblSTpUmS3keEAdDIMig66aOA==
X-Gm-Gg: ATEYQzyc1MYkMXsZ1sHLJXLz//O5f8RNiEUrrzjW6NfLOMiWJCmuUKkglNGdm/KyEwD
	2eyfY+tx2xvdWHuFdTmoOk3EEZTmnDqaWaG3C3u8Ud7Pzmr69PXbMKLqYfD2kt/c1ZKxQbrWNrG
	glpbKEHLauwGjiU7COVoIHZIte/TCXwzxG1qPpG24deMMabhMccKEr+vDEaj60o/rxC9Ni2BHBg
	oqvANTezef3qwE/8uaMvSfMdqeDVrEzNcMa/Brys3V/npOTVLqVuaNXWc5AZCoaCMLEEuTSokgr
	egLCQJtnOzBPkQ2oqkAsoHVdYcCFJMd2CYY3OqdHJyn9loq/8wfUeazyPvLQ4EKwusuM5RwxNB+
	c418cGmOhCk77+YDodA==
X-Received: by 2002:a17:90b:4a47:b0:359:ff8a:ee55 with SMTP id 98e67ed59e1d1-35a01287083mr4289354a91.14.1773282916221;
        Wed, 11 Mar 2026 19:35:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:359:ff8a:ee55 with SMTP id 98e67ed59e1d1-35a01287083mr4289326a91.14.1773282915815;
        Wed, 11 Mar 2026 19:35:15 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4b0sm7464888a91.10.2026.03.11.19.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:35:15 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:35:12 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 3/5] selftests/cgroup: use runtime page size for zswpin
 check
Message-ID: <abImYP8nhyzFE4VI@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <20260311110523.26624-3-liwang@redhat.com>
 <CAJD7tkavpHuBV0zy3mS00xpV09SEq6Tz_SaY60o+k_1=S3feFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkavpHuBV0zy3mS00xpV09SEq6Tz_SaY60o+k_1=S3feFA@mail.gmail.com>

On Wed, Mar 11, 2026 at 11:56:38AM -0700, Yosry Ahmed wrote:
> On Wed, Mar 11, 2026 at 4:05 AM Li Wang <liwang@redhat.com> wrote:
> >
> > test_zswapin compares memory.stat:zswpin (counted in pages) against a
> > byte threshold converted with PAGE_SIZE. In cgroup selftests, PAGE_SIZE
> > is hardcoded to 4096, which makes the conversion wrong on systems with
> > non-4K base pages (e.g. 64K).
> 
> This should be fixed in cgroup_util.h, but I see how that will be
> annoying as it's used to initialize a bunch of arrays. Looking a bit
> closer it seems like for most of these code paths it's really just a
> buffer size, not necessarily the system page size, so maybe we should
> just rename it?

Agree, maybe rename it to BUF_SIZE in anthoer seperate patch.

> For this patch, we actually need the system page size at runtime so
> this looks good:
> 
> Reviewed-by: Yosry Ahmed <yosry@kernel.org>

Thanks!

-- 
Regards,
Li Wang

