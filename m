Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125273CF21D
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541766; cv=none; b=DLMCoA73PasH5xnhZqm+LPgJpSouVB2LfLdHap79DEKkmlNZa9JbigBdeKE0evVGecuArFQOGU55KgaFev/82IFaCikurSw6PYMD4OB0EIenNL+FD0hH9adNfRon4ORV2IlgI1E5efp4SgonIIStOi5zTxsFqJkDuASWl9o9XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541766; c=relaxed/simple;
	bh=kaRgDOaw/fDcoVuH38m0gI79x7UGEmCsvKCjyfgt/Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlRCLUs4/2jhdVJbBszHyZ6dFZ+1o1q5sIoa075qEJmSzh2zy00ju/yjILcxI9oQtgLyZsrn5n8pg7gBQAKei4l7Juv0TNOxW9frGr9Q5d5Mf4yC9J1H9RUlHpRXIH2pAp96/l72nxr8/qyKbw26bB/a2/FL7eJFB3a7Yo5W5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9ldFr/3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9ldFr/3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cca0c5799eso74983325ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 03:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784541764; x=1785146564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnhYXYT9siWEBxQexSgO6rt/VLpCp+EbrkmrDNNkNo4=;
        b=k9ldFr/3bLUmvhXFxmau8bFAUh1Tv+eaAz0NZkm7f1JQHM1ni+/UFTl1TBp1iJyL+v
         Xs7cqvabkztJEoz5MpZcQK2FYIqUVvppOPpIEufIhy1CyjwicRxqeYaPtsgPvdSuaGZM
         ip5v2hGJ3R7jKTOK7lhJZcmAITChEaIRKejKyQVNybJaEXEJnYkCbM4rteXntawb42t8
         MeF7xsICOiqf/IjrJ81LO88Qmoa//EE4Cel5S9oy0FMkApt0jq5F61T6fjFKj7QkNpzV
         x9Ocnpe2fsNAtBOO/kSLhNY6ZB9WQ3JITarmJC29+UlYN2zM8r3zHcF6Z/60U+W19qaO
         3mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541764; x=1785146564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnhYXYT9siWEBxQexSgO6rt/VLpCp+EbrkmrDNNkNo4=;
        b=IW3QYKWGjCIzVG1O3Kz1sI5rHF3ytNxWEf2gOzNOdalj2vrbyWBfT4aDY2wS+07KLN
         ficmqepVgVACo0JGFww29ELsDRtebmJSaU6UmRDumwuJutlhrXcfkBFGlE0UCivwVyr9
         zmzbGUs2Y8kINigeTGC5xKrw6gWXkmLHjhDwHVwpxXAo4U/BZCpyfIZaDoFi2WKS2XXQ
         kBPufevToRgqktSnY7BnJ+2Ml5JYRdR+Eq5qKysQSkZh/0M8zyn+7KS4U/h7+A8X9Rui
         Yq8i/FHRSh2+xD4sXvJebA6l1fIcChgYksG+irPJj6TjVkETGDTW7iG8fKOwosmLVk49
         tZuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYAAzcBnDY7994eLZk/iMWu1Iqa0Kjbdrv4hRgQkr8QcEZ0WKr+f/eQn43AghNiDCveOTju+TE7PjwLqWOzRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbUJn+BU7nhdFO8Xf4HhQ3yovNvZwqwLLPcW+TDH9LghFjROA
	6wXmdwuXu9OTbjxRIT2F6PS4A1yD+QgvHF1E7NOSZngbpy3xKEgRnmv1
X-Gm-Gg: AfdE7cnuoIMjovmaftvdOU9vvKJcfHr2fHqyBoKphHBRcLOqGHHF+ULYzkFUT/Nohfc
	LCvnY9y7wJVPzxSTL5uE0IwX6w2c1pviPqxw3j29VS91l0mVQtib/kNGxfBlVok4cuQ8V9JTxno
	CuD/D4Y52IgXBTkkDdN3ILhMN1i4g2llq1VAZc0myEJ0UxA0246C/LSr0pYcc3UKtAgyI5DQWKh
	jMndgj7HEhrPkXNzQ2ttuXsKnGzlUhkYCqI8/im4iMTV3omKnWtDXdsD2lZBA/n/A4dLGqYH+Fr
	WdWQIKE/Kq7cDqgPx+Q9hvt2u1P24eCIekgZW+iX8RijchyPu1CpPzegBH10gwSzQbPuhDu4296
	YBM5P6SrDB9mtDBTHSHxFOg2c6n+pETsp+3f+xiCYYx0X1ShTrIrO+3sR7uKl6gYe2DiMKL6AJ0
	sR5LNK8yfMGpgoNTyQf4i4B7W4kIKAL+X6fyN6MQ==
X-Received: by 2002:a17:903:37c5:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2cf34836750mr147318935ad.4.1784541764141;
        Mon, 20 Jul 2026 03:02:44 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471f42csm53933185ad.61.2026.07.20.03.02.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 03:02:43 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Gutierrez Asier <gutierrez.asier@huawei-partners.com>
Cc: Lian Wang <lianux.mm@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: Re: [RFC PATCH v3 1/3] mm/damon: introduce DAMOS_SPLIT action
Date: Mon, 20 Jul 2026 18:02:32 +0800
Message-ID: <20260720100232.32500-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e01fa50e-b9a7-4c0b-ba70-6088b8d6ddfd@huawei-partners.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 20 Jul 2026 12:47:23 +0300 Gutierrez Asier <gutierrez.asier@huawei-partners.com> wrote:

> 
> 
> On 7/20/2026 6:03 AM, Lian Wang wrote:
> > Add a new DAMOS action, DAMOS_SPLIT, that splits large folios in the
> > target region down to a smaller order.  A new per-scheme field and sysfs
> > file, target_order, selects the split target: 0 for order-0 base pages,
> > or 2..HPAGE_PMD_ORDER-1 for a smaller mTHP order (order-1 is rejected at
> > store time since anonymous THPs cannot be split to order-1).
> > 
> > Unlike DAMOS_COLLAPSE which builds large folios, splitting only dismantles
> > them; it allocates nothing, copies nothing, and no THP admission policy
> > applies.  khugepaged deliberately refuses to collapse a folio to a
> > smaller order, leaving the shrink direction to callers like this one.
> > 
> > This patch adds the DAMOS_SPLIT action, the ``order`` field (placed in
> > the existing union alongside target_nid and migrate_dests), its sysfs
> > interface, and documentation.  The vaddr operations set handler is added
> > in the next patch.
> > 
> > Link: https://lore.kernel.org/20260605161422.213817-9-npache@redhat.com/
> >  ("mm/khugepaged: skip collapsing mTHP to smaller orders")

Hi Asier,

Thanks for the review.  All three points noted -- will address them
in the next revision along with feedback from David and others.

Thanks,
Lian Wang
