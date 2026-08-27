Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C88235C01
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840940; cv=none; b=Z88Cfvx/yElHXhFRCeH3CsKqpu92Q2Cpws2ONEShnLl+vND+h3xRhrzOMDp1ZRMD4WswJCy09OCtQNJfMYQHdbR/69qPPYf8EAHHLU7LZv1uQ875LhFTZyGzTqnI5eKHBFpCZYdUrrrAV+zcAr1mu7VmuHenV3MXEi5x2GfFxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840940; c=relaxed/simple;
	bh=nKAx+rvAzxQ2/kf2GcBVYLAy8Xi8kdNaL+EwFmlkcWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgxPLR6WSLFq3n3g5XwDPoYffFiJ36N2Fd6mTYXnsLD6ELcXtRj49n/yPU+eEapsSK/LF2FUvStGjfybwgMMShhfw7/wnHG5GNlo+rv4h2/iSAGTT2X2pHIO9HE46MVn/u6Fcp3CUKXT/Zd6ULe0Klkbg1p/3HjLQVcsvxoDcXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gTYm8g/9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gTYm8g/9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so5829815e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787840937; x=1788445737; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PI7Nz8d3HH69nhtcQsyOVYUPwrNGYdNUTrVZkR05tbE=;
        b=gTYm8g/9KbfqyhipbgSGeThEFgXOcXxabdTWb5EEzOyxnxM2hflSJOx4ResaUX8kz1
         4cr6raNb4sWtBDJ0XXGta9HHjOI80JJEc2evQQDeYTTzhHhduH8/Qjxth86M7KifOLeq
         xhKk6iHQBqb4ld2cH4KAMc9zDDwQL9sqXD2/zLlucOqp03reBjW5F19Y5bE94lO9soJe
         PlhaXia87Mm34L9DGhRSftRPmAivW36q371pLAhAJJ72ApY85FzVUSXup6rCGXJvB6Gw
         qvCRk852/11G5ToUy0fDscvA527YEdvHPQuozbr85VBlr0RoIa7qhPPuTxa4tKBAJveW
         AI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787840937; x=1788445737;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PI7Nz8d3HH69nhtcQsyOVYUPwrNGYdNUTrVZkR05tbE=;
        b=CfPWksuq+tcRBh9SpeNiS+2fFMDPVeCMkicCDE5iAsLbQQN7N9aDQ29k9QvS+5RZVL
         T4gGM+MUV6+1tELnMnLRUWPh8vSc30nIuFq9KC2eYap1bzoR+trXOdMkaBIcsUSP/n8m
         gx1RHPqQF2qC0J3Cugs1Y7Dw3XV2wSHxSkzbRsIhh/RZlTB3z5AmkGyufb/ycwo143hJ
         Qjb1DtnGV1tlKuTDobMK2fIOGNXSh55Kpc2dR/bBPlclfBtRZ9mf2gP5wKFySpa4FFoo
         CRF7Z79ATVv27bky+phh6UspWGpcPOLBIWhtQpfFaY8havV6IkFdhz5yDr8i0XaY4dGV
         kbtg==
X-Forwarded-Encrypted: i=1; AHgh+RrM763+oTMovOuzsH2q5gAJ4W1uQ+bZWyjoXUKCKj/d27PH7e2jEXFT6zoHphDwvym9oc88suRPNm0Hyr6Vln4=@vger.kernel.org
X-Gm-Message-State: AFuF++k8mol8NmtRug4lJBEqUy7XxHmDyYF3oX59J15XI6xB55XdnByA
	rjqqQQF4FZyNp6LxavuEETZMNJgIKDXzHbVS9xPDPtgjGgBXmH8s0AGdDe1zlQ/wBQgU1XLPvX6
	Jhx6DojQ=
X-Gm-Gg: AR+sD13zr0eraKSj5EyYVn/StYzjkl96CBYBEMR+B9Wk16mz86wrc29S92ScvrhH+GY
	KRv0LMoTEwg6ccV94t0neD2IrJsuJYVGIjSUWPjpK7xmt43rO5Cv3Bbix3Rk5+iSV87rjCOarFW
	QN9Mp7LEIQayiPLIw3mattyKPHr51o+YoDLOm2u5DLfiR5gcK+m8pfNpx4lofvo1aXOMMR2fmwU
	yr8aKnHb2F1HAb90FpEQrfGCbiievdzwy7lpctWkIHhrx0De161HaooDA+P5ZsVfwpWLjv15Zms
	Qo7cOpE/KX0I2bCpGrc6cCfZslLiN0rM/yGzb0oW7FO3/zpDxCRjyBxHMBFjpWTQVYzqfz5V83O
	Px2spwMrRgfQ3jQOF7pAIbgmABrzALtxgNbi3IxPOg1l4jX0aX5dDQCA+nkjICwUMNIgTCh2N5m
	p01fiEZtpHcB/IQV2/o0QUOIbuwbmuCnuaVHUA09kChwJwMEfwgJo=
X-Received: by 2002:a05:600c:698c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-499dc6f5dcdmr215984745e9.5.1787840936850;
        Thu, 27 Aug 2026 07:28:56 -0700 (PDT)
Received: from blackbook2 ([84.19.86.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b494228bfsm54431465e9.2.2026.08.27.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:28:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:28:02 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
Message-ID: <apBJbOhQakQH4WyP@blackbook2>
References: <20260827034807.2822234-1-wfelipe@google.com>
 <20260827034807.2822234-3-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827034807.2822234-3-wfelipe@google.com>

On Thu, Aug 27, 2026 at 03:47:42AM +0000, Wilson Felipe Pereira <wfelipe@google.com> wrote:
> In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
> checked against stored_pages * page_size / 4 to verify that the pages
> pushed to zswap belong to the test memory cgroup.
> 
> Due to slight stat update timing differences, delta can evaluate to a small
> negative number (e.g. -5MB out of 1GB). Because delta is declared as a
> signed int and stored_pages is an unsigned size_t, C's usual arithmetic
> conversions implicitly promote a negative delta to a large unsigned 64-bit
> integer, causing `delta < stored_pages * page_size / 4` to falsely evaluate
> to 0 and fail the test.
> 
> Fix this by declaring zswapped and delta as signed longs and comparing
> against a signed threshold, ensuring negative deltas correctly evaluate
> to true.
> 
> Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem bypass test")
> Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
> ---
>  tools/testing/selftests/cgroup/test_zswap.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Thanks!

Acked-by: Michal Koutný <mkoutny@suse.com>
