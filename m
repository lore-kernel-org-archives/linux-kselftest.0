Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C03D9027
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541411; cv=none; b=TmkmUhboPQoJxXRaY1iMxfFzoa0xLsH9qFrBxLt+rvus0k7TDbyjG2KSxhyagfKy+ot1C8GXso9i4Dp1WIQz4A0d78R19It2jSwZqXpUlgwWBZfuNmJtBynwWAq22Cu0JRAra5GvV2exU7a26kbweSEX7J0eVwLAzoW7jbiOMw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541411; c=relaxed/simple;
	bh=RPHm/I6WqLfqccNlVusRSjc2hzPQak1wVwmSFNX0Rvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul3GkCW98thjxb/RlirxfHRvFCzYbx6n/5CNvoVENzBTxEu8s4X4lv/yyBTryZXL3yFCRMw4OqlA+e1hTDygc1gDYpVuu9znAOR4QsXEyl6FW5j2QhJoSgRt6Ki7E8gZejugcFYYAAXJwy6ldD1hFukS2szuUWSstw0Ekj9hvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekB40t31; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekB40t31"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so58011295ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784541403; x=1785146203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4P1uAuS96oO2CYd5dZWKgEcG7rXEBr6r3ZYGLFiIQg=;
        b=ekB40t31ZE1m2m9qI3MPoUonqHnrHblDkf9uNWCBYmBlHRuDC8BRGxzSeXYLzZqi6C
         xA6c1qvRv23MUuW01JITfnsdfJy45rgq52rxAAu+dctL2GVMYvKEolhgKebAw3O84vOx
         h8W9CsMC14ZGJDOgr5HLbkOHWXvltd206L89hM1yjQXmocfD3m24nS9sD2ar4XBXilz3
         dxeMlI8IAH/eosdzJxQU7qRDsdmX8rDmaCsbUfBr9xO7MYiQFfx772ZCzpb0SK4tM63a
         fHDf4+ZTEXU64hLRWRrFziJXQcScTLxrnUzpOxsfUlUn+ll3bnUT6NrajSKMyUmngFb9
         BUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541403; x=1785146203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4P1uAuS96oO2CYd5dZWKgEcG7rXEBr6r3ZYGLFiIQg=;
        b=Q/htdrsxaYBWFl/QpKAk8LM8vtSx1fCN+aVq+juCyeuSzXylQHmJjeA78EGie1zSJh
         +P/tIBNd0LZvoSyiPOc6zsJTlGd9Th+APnRkCDCaoehvnIyeLMqjnwOXeZFoSysvSsvo
         WCUhgv3xcxvgbuPGd/7rKe0PQnIwWkhhOfGBHv0Do6PvMPfFbqqpNC2JaG9TEiAfSq9a
         UcaiQJADGFpfSfy8Mvk5gEk+ygFLG6y22rPQVY5a+55U6VxFqE4WipT1igz5kYwxzuXD
         cjFli5UZVkW25vf3ILfAa5Jdim06OKH80OZe1TiRaPMBAB024jpxFsmoIL/egzKLdWu9
         jkyA==
X-Forwarded-Encrypted: i=1; AHgh+RpJr8A103plv1pBbDxvV2o/lWWHIFliZ0vZaFG7IB6J7BzloBBNLBSSCpprMcn1YoDkzjidV9vOJFWfJF4Nl1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZvB1dDX3dqeLp6ljW+Bz/KPvmieFNs24CtQY1Zl2ZqQYlc/K
	PYKPjZavc00pLcuXS7Hd4o0hNBtV3x2Tz+MR7yhN5yy//LdkYM5n8oyD
X-Gm-Gg: AfdE7cn4dz4wVBEMze37B8T83wGULLqSRh5U6Unom3xL1Pc0V5b9xQRnIk2I0povlgN
	aSFl8s+lR+ffLSoVwvgMvgQdNM759FimeA2n7g+wCyvYhl68b2loel/c8LGJBGwEX3MXbvJT/ot
	9wfHrkYFtzySyXuGVOoaQuW1KOnPhwEGIzlFb2cBiQHIVeyJTsCGEyeCMKGWxC+J+eMJtw4PJ7n
	XRM9zS1yxWQ1acJARXsoc8yfGLWcPvVgFzGYCCQnw0jcDe9KqLLxuMvDRnbOH80C/3i1MmXaSQf
	d7ccP3E+PmEhdUs7UYQw0es5EZnR6oGyE9gBvVC2Du6ggya/8IyaAU5i4Oy/5cS0OjvDqbh3DdR
	T6cjHe13k36FXC/N4DKRpUsOwGTCbdq01y8E1nDF5WZfYM1igNzfQ0WtzeWYWz+Y5KsMCXxQGMe
	3ZwlSFfuR8eTB7DDv+RNo2RD5vGME=
X-Received: by 2002:a17:903:440c:b0:2ca:1594:451e with SMTP id d9443c01a7336-2cf3496b583mr155402025ad.31.1784541403123;
        Mon, 20 Jul 2026 02:56:43 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344bd3aesm53940335ad.26.2026.07.20.02.56.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 02:56:42 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: david@kernel.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
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
	gutierrez.asier@huawei-partners.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: Re: [RFC PATCH v3 0/3] mm/damon: introduce DAMOS_SPLIT action
Date: Mon, 20 Jul 2026 17:56:33 +0800
Message-ID: <20260720095633.32281-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <59292ba2-e0cc-4e50-bb26-be9c15843a41@kernel.org>
References: <59292ba2-e0cc-4e50-bb26-be9c15843a41@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

On 7/20/2026 10:44 AM, David Hildenbrand (Arm) wrote:
> you give no real motivation and evaluation why this is required or
> why this gives the user any benefit.
> A SPLIT with an explicit order is not really want we want and it
> does not fit the existing primitives.

Thank you for the direct feedback.  Let me explain where this came
from -- the cover letter should have included this context.

This started from a real problem at Sangfor.  The scenario is:

  KVM-QEMU virtualization on Kunpeng 920, with KVM guest memory
  backed by tmpfs shared mappings (THP=always on the host).  An
  Oracle database runs inside the VM.  DAMON monitors the KVM
  process on the host to measure the hot-memory ratio.

  The KVM process allocates and uses a large amount of memory.
  Under the same workload, DAMON reports a significantly higher
  hot-memory ratio with THP enabled versus THP disabled.  Direct
  tmpfs write tests inside the VM -- touching at 4K and 2M
  strides -- show a clear gap between the two cases.

  DAMON parameters used:

    operations=vaddr
    monitoring_attrs/nr_regions/min=500
    monitoring_attrs/nr_regions/max=2000
    monitoring_attrs/intervals/sample_us=500000
    monitoring_attrs/intervals/aggr_us=20000000
    monitoring_attrs/intervals/update_us=60000000
    schemes/0/action=stat
    schemes/0/access_pattern/nr_accesses/min=1
    schemes/0/access_pattern/nr_accesses/max=max

The underlying issue is that under PMD-mapped THP, DAMON's monitoring
granularity is coarser than the actual working set -- a single
Accessed bit covers 512 base pages.  Before SJ's probe infrastructure
arrives, there is a gap: DAMON cannot distinguish hot sub-pages from
cold ones within a single THP.

Split is one possible mechanism to bridge that gap -- by dismantling
the PMD mapping, each base page gets its own PTE Accessed bit and
DAMON recovers fine-grain monitoring.  It is not intended to be a
permanent API, and certainly not "the opposite of collapse".

I did not write this scenario into the cover letter because our test
results do not yet show a clear quantitative benefit worth claiming,
and I did not want to oversell.  Without the context, I understand it
looks like I randomly proposed a new primitive -- that was not the
intention.

SJ acknowledged [1] that the monitoring problem under THP is real.
My RFC is a concrete proposal to start the discussion.  If split with
an explicit order is not the right primitive, I would appreciate your
thoughts on what the correct DAMOS abstraction for this should be.

[1] https://lore.kernel.org/20260620203915.82947-1-sj@kernel.org/

Thanks,
Lian Wang
