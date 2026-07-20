Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC4480DD8
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 19:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576126; cv=none; b=MAzvpyVQEA2yEhAk6fNgiHw+EewUSdW6Yj9I496Ef0EcVrRMlEFoIBP3lxxJ5S7yUm5Gnxwy/OPWPiSYzvt+mp0z9F1T+aV+EvdpLOm2U+FKFDCSCoqY7khd9VRyuBnHdtXOTvuDuR8IQIFbAXi5tMN1IWspFlKkDBsCMbo8T3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576126; c=relaxed/simple;
	bh=rTGbsGvKQACnJtisxUC5ZLec44efZiXOSNd4OQNTaLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMVPR1AqagbPyFjrKVA9rKqIMfbeIYVNJp/QRLOje8TxasmE3T24kQ0r8VwU/gbOdn3vGe0E6Ah7cPBIJvItqAl+ja5v24Bx1KwUNovLp5bKucxfypJw1wvmRAFPT3w+MLzh9raCh4t92dO12BS4b9yBv4nA2RXLGG/NIbXzJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KNaHn0u5; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KNaHn0u5"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso101992906d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576120; x=1785180920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=KNaHn0u5ops1R/lZeXIDAUO/x4K11AG1ePxAFRbUhd7TfbL1t9LgN4aTaaNKEmTtjs
         nzppEVg1Q9PX8Y/szIAZHRhmAsCyhFpgETvciNAsYAr7YVRUqsFYcRkrJ1cA0BJYzfV0
         5h3TZYJehbb6t4kBKpCI8ZB2jJZyseGHBoqYgwIuBjPkOZcyiIRzf/kcFdewtJpLa1/O
         2fFQ4cCSeO51sw1iCLcCFiOoCVvSqtOi4L7NkYOIn9TUVDV6s0gfypiwDr5EKWb01FiR
         oFb3+M5V2dmD9yoV/rPUoLqy4kniWwtmd/ATQkFdRXosc90P3z/b9WVijvCzfsZAgfXg
         89tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576120; x=1785180920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=jRbw0OYovejRdWSARRgLbWnucDB7qsFRuRKB60wyr4mOdozJCHDsTDCUrsFj68U3hb
         66YJYYZ4CzLMZb3Zf1Ii40izzGcAeMQhwYcLb/bur7/mSjJh5Hem4aAHYIz1lWePkc8G
         tZm1fP8NQQ/HS6HsFtK0upR36E8MFHtcmciDmbEWb8Q28O+cVxziKiEinM7ckCsGnz6t
         tMvb/PYFPOmD5RBuCzjY7HachJA03IB0EjeFNmXQq4vWwJP6+cJLOok0Ub2VBfUoW3ZE
         LvVsDSKhBXVyU2u3iVVcm7ksrrA/hAAdnatMVZ/6Q6BeKgFhTWPnofzNsJEhgxQiV028
         AYjw==
X-Forwarded-Encrypted: i=1; AHgh+RoYvfUlC//Amb+2Cep1Z/6ZLWH4obT5FnNDLa9Qb2w2dcXD3OXISkA1y6jQVwOFCTIqStLBdCrhwYiw885qKzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7JUG0U3aZ68Qju/DKl1ImzykezySzdK+hiRqR4PqNDavkBtm
	gfQcDHitVwc00jrWMA18epjp+Yi/4QMxL/P6hKOtpdu4Hzx44IoavKPFYA0ds1seos0=
X-Gm-Gg: AfdE7ckINBo8j7mwkmECi7ITa3BG3ya5F363mSlkSrK+m4HO7jNSxyZqKsp4YuhbqQK
	G4VCA58QxzLM6yfd0dd1md55sGhPxmqvKx0nQIyFNf2h+jHsivgk1Zwu/7QLQ0huElF9TnsUqIh
	1SOeNkoOe+MHDBqmCY8FKL0Ir/VrBKcjdvFU3P3OnzFwdQDf6vJ42NnIGsAcaCi8ZqbhcOrL1wa
	fFojkUUgpFMpq4Au9KSRkr7XGvjsdBVcNc9WgRySb/kSbS1s/tQ7gxFO9xN8riMQIkjYHNNgUah
	YD/O9hSut61uJD0gVGRNvA3hlfMW/EB7mPJ+QCBt9MaabeD1sJHMm8wS7kqwDQXVCZ3ZsjJBjVf
	I0Oz1ySp6tirii0M7paYU3hbYKxx/NMGhtgMxIb0xhi2TWz7jHxPJC5iXPsvHDXvKrOSaPliPXU
	FDjufLGoWuXAHitVnXG2d2X8kMas63exhEwrPc2yxwsWXqMEclwNS/Uj5CLnop0xw=
X-Received: by 2002:a05:620a:290a:b0:92e:7745:9a3a with SMTP id af79cd13be357-930b3e4e1f3mr1582641285a.18.1784576120209;
        Mon, 20 Jul 2026 12:35:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:19 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 16/36] mm/khugepaged: skip private node folios when trying to collapse.
Date: Mon, 20 Jul 2026 15:34:10 -0400
Message-ID: <20260720193431.3841992-17-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A collapse operation causes new THP allocation to occur, and may
migrate memory from one node to another.

Handle this the same as zone_device for now (disallow collapse).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 89ce6bcbc376b..fb4378cc17b10 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -700,7 +700,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1687,7 +1687,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -1944,7 +1944,7 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 		}
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
+		if (WARN_ON_ONCE(page && page_is_private_managed(page)))
 			page = NULL;
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
-- 
2.53.0-Meta

