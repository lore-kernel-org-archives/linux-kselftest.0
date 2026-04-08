Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B23C65FF
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667081; cv=none; b=ug3d6UHo3IyyklVnztSSy+zmmsjUo14SOEfSE+stXMHRUQxVD8t2t+50ThW2ssC7YSC3UTVsOdmuXYSRwNq6OUZnXZbINTDgcT9mfCC5TbLLvB5EgdJXq1dATrDXGjKecHuYglxyfN+7xbpYcEgajRqWhy/CB4hs+tT6lpMeWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667081; c=relaxed/simple;
	bh=fpPwOPPuQd3UQjcuy6+UdPx/jd7jjJ8Uh4myuUyhZsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGaEgSPTFyvQ/KKH3dOcEcVPgOAy/8trRkzFCcD5krtaMgaYEe3afshFhGaBCm/885WS7MoNPwoDHxVP1rt9a0DIJvdBhVVQFZw3rWGEWIpm98VqKG3sV2RUGhcwbS8wgMa4W2dZT451fvESWDgWh4Xl70n7FMTuTiljThE37Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUUz1Utr; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUUz1Utr"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a46ebe2beso1204027b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775667079; x=1776271879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrHGwLfLgUQGW2hlMR2HktDjRBw+hKJj17XzuK6WT3o=;
        b=QUUz1Utr29TtWGZTbiXVnKv1KVpEtxAX48zOS3ufEsgDD/pnNNyUJJ821I4TLsQwcT
         lRyv0ej+Cptx+GPiY1vi92DYU1jVabvadCKgZ/PyLIToiybjH/jTvvW8BPbh437IDMHt
         QwiH11oo+XJEb4NITDS092fzR9Up6G+/TKPv9JZGTXUsyW42pdl/pzlpgp1x4z2Kjasv
         WshFts/9Cdstj/SCk30xXTIVaKAlcsFRq8oRgjiu8jemb0AiQTyJo/fUIIj+Sg2liGk7
         WGosmpjEt39lzNdWIGKQhxM5uYvikERNU7PDl5mWbAmSOlzfL9RLnCLUxezymIUavuyR
         q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775667079; x=1776271879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrHGwLfLgUQGW2hlMR2HktDjRBw+hKJj17XzuK6WT3o=;
        b=HcagVrtruYCm+aUE5iP22WVK6EjEimDO1734qwToskEq3oLpLryijaZ+wyCfSBR1ck
         oZkXL7PnOngXthIHEAIemCncrB0a0seQgYALaIyhrcSjDvQqDHIIo5RR3UODFQyeZjIS
         tsh3flVGq4rdR1ES1x94teepfivGEAWsszv888w8dquJBqE3geWjfIOyFa2ml5z85S5n
         3RSBq0TFgeGoz6J1zjWPhq2pD61DiZx+hKdTusRe86I+TeHRsF6kZqEVu1nkQg/De5DO
         8nYsgwJ077APIAOcFQa23ttPUviEzmKVtyVJC7DdkX7oHBwl2RdsioVYSfL2JS2xU+N+
         i2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW98GqriUivFuA/yCF0Q+WOMD6ZXAxjtIuLuz0AXqiCUgTFssHjmdxnvSX9zgYcRtd1LdDJh3i/f7x1bSgHByE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VPDTrccXjMQZUCyL+l93JULsvFplmSBatcEvgU6MtvUD0fJz
	QxAMCyo8He4mmBVK+MjqFUIkxbEIhdg3S4cwKAZBPbFhs8YFRe9WxgH4
X-Gm-Gg: AeBDiesO+CoDs4Nmg47k/bDZ2YqnAFnlIwig4SaDrQzlmXdUnetLMtneu2mUYmT5N09
	X2LHKHRMUee48rM4eU0WHKHhXHYSPFqCfJloJIpv8xFSHqxL8iEfPuTmGcSJ/X8+hl4v24ymQHl
	DvWDR/qhYTfibFeR74lYNsIAKxIf3tjxTni7+u8Op6P2azSlLAT6MjdOweXE1zg0DDxPGDWYl8d
	kTfzpesfmoYHV7Ro6K6hV3R3B8mN9stBRXxtQlTnESFCzYxyuShYRkKcSL4GhapoEHUyHSm/VEu
	ktl66CrS8Siyi0/QiLpxy6lggK6kx3T0DRh6ndYGJqWWkApZTpfVA2u3+lzG+r2XVm2s+j8/PTB
	LK/UA6HACXcik9L+ot2+YJK0xAOcInc4lkIIjtTQPEt9++7CYHNPM5NNXTE+fvqmwgjy+idOXTT
	Epgk4Iz1ov2+AM/vHg/d8bfCrZntyy/n0k7FVZy8wVGHJRqBdZcScGb3A=
X-Received: by 2002:a05:690c:9:b0:79b:ccb6:a837 with SMTP id 00721157ae682-7a4d31e5f49mr215312817b3.5.1775667078580;
        Wed, 08 Apr 2026 09:51:18 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:161a:64d7:b05f:7124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42ff31sm86023777b3.6.2026.04.08.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:51:18 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Bijan Tabatabai <bijan311@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v3 00/10] mm/damon: introduce DAMOS failed region quota charge ratio
Date: Wed,  8 Apr 2026 11:48:27 -0500
Message-ID: <20260408165001.8473-1-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407010536.83603-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon,  6 Apr 2026 18:05:22 -0700 SeongJae Park <sj@kernel.org> wrote:

Hi SJ,

> TL; DR: Let users set different DAMOS quota charge ratios for DAMOS
> action failed regions, for deterministic and consistent DAMOS action
> progress.
> 
> Common Reports: Unexpectedly Slow DAMOS
> =======================================
> 
> One common issue report that we get from DAMON users is that DAMOS
> action applying progress speed is sometimes much slower than expected.
> And one common root cause is that the DAMOS quota is exceeded by the
> action applying failed memory regions.
> 
> For example, a group of users tried to run DAMOS-based proactive memory
> reclamation (DAMON_RECLAIM) with 100 MiB per second DAMOS quota.  They
> ran it on a system having no active workload which means all memory of
> the system is cold.  The expectation was that the system will show 100
> MiB per second reclamation until (nearly) all memory is reclaimed. But
> what they found is that the speed is quite inconsistent and sometimes it
> becomes very slower than the expectation, sometimes even no reclamation
> at all for about tens of seconds.  The upper limit of the speed (100 MiB
> per second) was being kept as expected, though.
> 
> By monitoring the qt_exceeds (number of DAMOS quota exceed events) DAMOS
> stat, we found DAMOS quota is always exceeded when the speed is slow. By
> monitoring sz_tried and sz_applied (the total amount of DAMOS action
> tried memory and succeeded memory) DAMOS stats together, we found the
> reclamation attempts nearly always failed when the speed is slow.
> 
> DAMOS quota charges DAMOS action tried regions regardless of the
> successfulness of the try.  Hence in the example reported case, there
> was unreclaimable memory spread around the system memory.  Sometimes
> nearly 100 MiB of memory that DAMOS tried to reclaim in the given quota
> interval was reclaimable, and therefore showed nearly 100 MiB per second
> speed.  Sometimes nearly 99 MiB of memory that DAMOS was trying to
> reclaim in the given quota interval was unreclaimable, and therefore
> showing only about 1 MiB per second reclaim speed.
> 
> We explained it is an expected behavior of the feature rather than a
> bug, as DAMOS quota is there for only the upper-limit of the speed.  The
> users agreed and later reported a huge win from the adoption of
> DAMON_RECLAIM on their products.

Thanks for this series. This is a problem I have come across and am looking
forward to seeing this land.

> It is Not a Bug but a Feature; But...
> =====================================
> 
> So nothing is broken.  DAMOS quota is working as intended, as the upper
> limit of the speed.  It also provides its behavior observability via
> DAMOS stat.  In the real world production environment that runs long
> term active workloads and matters stability, the speed sometimes being
> slow is not a real problem.
> 
> But, the non-deterministic behavior is sometimes annoying, especially in
> lab environments.  Even in a realistic production environment, when
> there is a huge amount of DAMOS action unapplicable memory, the speed
> could be problematically slow.  Let's suppose a virtual machines
> provider that setup 99% of the host memory as hugetlb pages that cannot
> be reclaimed, to give it to virtual machines.  Also, when aim-oriented
> DAMOS auto-tuning is applied, this could also make the internal feedback
> loop confused.
> 
> The intention of the current behavior was that trying DAMOS action to
> regions would anyway impose some overhead, and therefore somehow be
> charged.  But in the real world, the overhead for failed action is much
> lighter than successful action.  Charging those at the same ratio may be
> unfair, or at least suboptimum in some environments.
> 
> DAMOS Action Failed Region Quota Charge Ratio
> =============================================
> 
> Let users set the charge ratio for the action-failed memory, for more
> optimal and deterministic use of DAMOS.  It allows users to specify the
> numerator and the denominator of the ratio for flexible setup.  For
> example, let's suppose the numerator and the denominator are set to 1
> and 4,096, respectively.  The ratio is 1 / 4,096.  A DAMOS scheme action
> is applied to 5 GiB memory.  For 1 GiB of the memory, the action is
> succeeded.  For the rest (4 GiB), the action is failed.  Then, only 1
> GiB and 1 MiB quota is charged.
> 
> The optimal charge ratio will depend on the use case and
> system/workload.  I'd recommend starting from setting the nominator as 1
> and the denominator as PAGE_SIZE and tune based on the results, because
> many DAMOS actions are applied at page level.

This makes sense, but the quota is also considered when setting the minimum
allowable score in damos_adjust_quota(), which, to my understanding, assumes
that all of the all of a region's data will by applied. If an action fails for
a significant amount of the memory, a lower score than what was calculated in
damos_adjust_quota() could be valid. If that's the case, the scheme would be
applied to fewer regions than strictly necessary.

As you mention above, this is not a correctness issue because the quota only
guarantees an upper limit on the amount of data the scheme is applied to.
Additionally, it may very well be true that what I listed above would not be
very noticeable in practice. I just thought this was worth pointing out as
something to think about.

Thanks,
Bijan

<snip>

Sent using hkml (https://github.com/sjp38/hackermail)
