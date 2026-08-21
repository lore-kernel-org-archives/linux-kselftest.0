Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84A28641E
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338689; cv=none; b=GAu7IuD/6VqdwcdSvblHQBaEnaSuFWZp8sUt10L8qxQDov6i2CPsLheRnJNH2l+CnubjCehzauTa6bM5zBebgAzsR8UOTrsMERrOkrb+6l9WEmLq2A7uRBnfuhxn0tXhyzgZF069GHmMoW7bx20fLvlE55RaEdFfPj9zb2BQ6/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338689; c=relaxed/simple;
	bh=zxisU4FNxtIBooALKv+M4gVONpDA/GuCc0no7zuCciA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ry4X+/qB4s5S7fJBTXB07mup0S6/isu9pw1mNXFGzGXMbgT4EM75EkhCB6N6WIre5NAAqKqxWUU4bQk/2AdN462iGyflsp8E3LkDezjRyARi3f8pAVT9ING2wtOrxA26biBr+JCUlp+bkMraBnmrKkcb+3X+kIgYvlVy8NxstSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Twhts8AZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWd4OfEe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Twhts8AZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWd4OfEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=222y2tNP5AAzgrcKEwSA0V5PiUFlYG+znMLqhuMeRAg=;
	b=Twhts8AZYDHkvyy2JvQcGIm1XXMo14Pp8lWmQVSl+GRI5yfszbP+/G+3JYyb5DU8ngPeV9
	KBeWKgN6Lw/9R4uDW4XRVbZHxFosQOF0GAjofD6qODOoiURkAxgEawXblGjqgqaj5fDDFL
	UMMpXj+nA40AKc+JfgNkH+YeAFjU8Tw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-A6zaNBTlMh2IZT64S-y6jw-1; Fri, 21 Aug 2026 14:58:01 -0400
X-MC-Unique: A6zaNBTlMh2IZT64S-y6jw-1
X-Mimecast-MFC-AGG-ID: A6zaNBTlMh2IZT64S-y6jw_1787338681
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so17261131cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338681; x=1787943481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=222y2tNP5AAzgrcKEwSA0V5PiUFlYG+znMLqhuMeRAg=;
        b=YWd4OfEeu6DEZ3X8HYB0axvQq3Xz0OnHTE4SBqrbDCWVB8PG3KwCOr9xOSvnLIo3vQ
         RecDosVmA3Vco23tt1uOpOgSxT2vwHKY5tP++MBli5ayVVbL8w4qOb4f23t9eknnUF83
         UgqeFp2+c8zfCX84O9EIYsBLi4YNm7FFPLtNTeUPS9SqJaT6OBUX+l32Wz1gWXUY+04k
         Y1WRgESBtM0AO0u9MWdzDraZjsBBF4MFqewCgz1jQr+ef1bvTMu/vHqZZPyIUZmqSVVn
         h4opxBIzOXEF2VRUlsJUm9dQULbiBdRuCQlnMFKvYOUUvOdr9Ja8ec2EOz6y/2w9r61q
         +njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338681; x=1787943481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=222y2tNP5AAzgrcKEwSA0V5PiUFlYG+znMLqhuMeRAg=;
        b=duONEfGDesQu2JjstfSv74LcKQ3YGnlbS5d/bkWCuMJGZJpEzCVG0P5SHTq8bYbqeH
         Hlq49UxX+sQiF52PmTHUJykRyXmbPa0e5X6wnpJqGWMbV70Rj5NjeCM2o3wFGc16X1UU
         Eu75O4lDAi4YbdyWXiVdOoN96Woj3WdkSd+asDhFf+85cdGm2dhZ5UjOjVPyrcWlQTjQ
         ZW06G1AAmMEPuEpsEumqIRhy23hM6ZP9FCliWJHp9WxofXIn7j54pP5LgHQjBPBj07Gm
         Y92bXR17/q+PRrnyk5PxEsjF94FgH7x8JPogn8Z+d3kQxQj2A13P3hITsicXw3MMBBEa
         Ayjw==
X-Forwarded-Encrypted: i=1; AHgh+RrmKCbIXqYITsXVHBuri8ZSOnaBvulqpn5knS8Lhvg/yMichw2VxdQeNjP0VvQdNHD33xZvAls/Rux/xVMHye4=@vger.kernel.org
X-Gm-Message-State: AFuF++lloJPjVz3QBHyOAXbxs96boU3nwEHwR4knNDH7VoQu8KWO3nZX
	+btl9buSov6BBC1xrhIHmQD3slTLnp5wU5XZ/NMSXxH2FR4DNW70N2+fNkhfQXSpW/zEAnNTlO6
	Vz1oORCqzgK2hLFAxg2AYTUsGqggTXiZ31OSSQ9MVcUVkBnxJZPTyGsDJvOLumEl7crfpHQ==
X-Gm-Gg: AR+sD11my8yFf34rudZsrjv/X2iT8t3bbiDOrUAK8onFCFlLnsymm/A2wWIjfWYOiEb
	m3BgABODzF6O4KZIPw/CsTbP9KuplXYgC6aoaca0rIU/lLrUxcOOnpODLSdVQk70ymMVsGEBxho
	YdIo+7+Moop+Ow+5UHBuOJ/LC/iVyqnCCfQ8qiU7RH9fOOXTldNTxdmzMks9Z6r1TeAqqPDDuDB
	h9WTJYLJf3PQAJl19UIqsv7R6EFkdhy+ulUEfZiN9vvn2tBQWxAexQvFIX/RVAytzfdARsO3PAu
	DC00+BUEoWK/jF8skHQ7t6fK92tSQl8H9rD4kl3CVZXcU1inS5hdMB80UBrYXmBbO2prxlYiU5T
	M9vUVq2G9cVoej77SSDCRF7y/Ws8VM/wTztxnjo4RQUWk
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id d75a77b69052e-52df5a09808mr94675961cf.27.1787338681251;
        Fri, 21 Aug 2026 11:58:01 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id d75a77b69052e-52df5a09808mr94675291cf.27.1787338680742;
        Fri, 21 Aug 2026 11:58:00 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b5ccesm69150516d6.46.2026.08.21.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:57 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:56 -0400
Subject: [PATCH 04/11] memcg: add cma charge/uncharge functions for area
 counters
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-4-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Introduce mem_cgroup_charge_cma() and mem_cgroup_uncharge_cma() to
account CMA allocations under memcg when memory_cma_accounting is
enabled in cgroupfs.

memcg counters to account for allocation in each CMA area are kcalloc'd
in mem_cgroup_alloc() and added to the page-counter hierarchy in
mem_cgroup_css_alloc(). cma_area_count is used to size the array. It is
calculated during setup_arch(), before mem_cgroup_alloc() is called
(for the first time in cgroup_init()).

On cma_alloc(), pages are charged both to the cgroup's memory controller
(with try_charge_memcg()) and to the per area page counter for the CMA
region used.

CMA ranges can be either pages with a 0-order folio (cma_alloc_frozen,
!__GFP_COMP) or pages under a large folio (cma_alloc_frozen_compound,
__GFP_COMP). In the first case, mark each page's folio with the cgroup's
obj_cgroup. In the second case, only mark the large folio from the first
page.

On cma_release(), get the first page's folio and uncharge both counters
accordingly if it is a large folio or not.

A small cma_area_index() helper is introduced to succinctly get the
counter of a given CMA region in the memcg CMA area counters array.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/memcontrol.h |  19 ++++++++
 mm/cma.h                   |   5 ++
 mm/memcontrol.c            | 116 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 8170bb8066a2..801fbde94137 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -320,6 +320,10 @@ struct mem_cgroup {
 	spinlock_t event_list_lock;
 #endif /* CONFIG_MEMCG_V1 */
 
+#ifdef CONFIG_CMA
+	struct page_counter *cma_counters;
+#endif /* CONFIG_CMA */
+
 	struct mem_cgroup_per_node *nodeinfo[];
 };
 
@@ -662,6 +666,11 @@ int mem_cgroup_charge_hugetlb(struct folio* folio, gfp_t gfp);
 int mem_cgroup_swapin_charge_folio(struct folio *folio, unsigned short id,
 				   struct mm_struct *mm, gfp_t gfp);
 
+int mem_cgroup_charge_cma(struct page *page, unsigned long count,
+			  struct cma *cma);
+void mem_cgroup_uncharge_cma(struct page *page, unsigned long count,
+			     struct cma *cma);
+
 void __mem_cgroup_uncharge(struct folio *folio);
 
 /**
@@ -1160,6 +1169,16 @@ static inline int mem_cgroup_swapin_charge_folio(struct folio *folio,
 	return 0;
 }
 
+static inline int mem_cgroup_charge_cma(struct page *page, unsigned long count,
+					struct cma *cma)
+{
+	return 0;
+}
+static inline void mem_cgroup_uncharge_cma(struct page *page,
+					   unsigned long count, struct cma *cma)
+{
+}
+
 static inline void mem_cgroup_uncharge(struct folio *folio)
 {
 }
diff --git a/mm/cma.h b/mm/cma.h
index 0c9de38d6bff..52b7d4be5170 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -81,6 +81,11 @@ static inline unsigned long cma_bitmap_maxno(struct cma *cma,
 	return cmr->count >> cma->order_per_bit;
 }
 
+static inline int cma_area_index(const struct cma *cma)
+{
+	return cma - cma_areas;
+}
+
 #ifdef CONFIG_CMA_SYSFS
 void cma_sysfs_account_success_pages(struct cma *cma, unsigned long nr_pages);
 void cma_sysfs_account_fail_pages(struct cma *cma, unsigned long nr_pages);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 6dc4888a90f3..8eca00d30fc5 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -68,6 +68,7 @@
 #include <net/ip.h>
 #include "slab.h"
 #include "memcontrol-v1.h"
+#include "cma.h"
 
 #include <linux/uaccess.h>
 
@@ -4062,6 +4063,9 @@ static void __mem_cgroup_free(struct mem_cgroup *memcg)
 {
 	int node;
 
+#ifdef CONFIG_CMA
+	kfree(memcg->cma_counters);
+#endif
 	for_each_node(node) {
 		struct mem_cgroup_per_node *pn = memcg->nodeinfo[node];
 		if (!pn)
@@ -4144,6 +4148,15 @@ static struct mem_cgroup *mem_cgroup_alloc(struct mem_cgroup *parent)
 	for (i = 0; i < MEMCG_CGWB_FRN_CNT; i++)
 		memcg->cgwb_frn[i].done =
 			__WB_COMPLETION_INIT(&memcg_cgwb_frn_waitq);
+#endif
+#ifdef CONFIG_CMA
+	if (cma_area_count) {
+		memcg->cma_counters = kcalloc(cma_area_count,
+					      sizeof(struct page_counter),
+					      GFP_KERNEL);
+		if (!memcg->cma_counters)
+			goto fail;
+	}
 #endif
 	lru_gen_init_memcg(memcg);
 	return memcg;
@@ -4159,6 +4172,7 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 	struct mem_cgroup *parent = mem_cgroup_from_css(parent_css);
 	struct mem_cgroup *memcg, *old_memcg;
 	bool memcg_on_dfl = cgroup_subsys_on_dfl(memory_cgrp_subsys);
+	unsigned int __maybe_unused i;
 
 	old_memcg = set_active_memcg(parent);
 	memcg = mem_cgroup_alloc(parent);
@@ -4171,6 +4185,12 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 #ifdef CONFIG_ZSWAP
 	memcg->zswap_max = PAGE_COUNTER_MAX;
 	WRITE_ONCE(memcg->zswap_writeback, true);
+#endif
+#ifdef CONFIG_CMA
+	for (i = 0; i < cma_area_count; ++i)
+		page_counter_init(&memcg->cma_counters[i],
+				  parent ? &parent->cma_counters[i] : NULL,
+				  false);
 #endif
 	page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
 	if (parent) {
@@ -5213,6 +5233,102 @@ int mem_cgroup_swapin_charge_folio(struct folio *folio, unsigned short id,
 	return ret;
 }
 
+#ifdef CONFIG_CMA
+static bool memcg_accounts_cma(void)
+{
+	return cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_CMA_ACCOUNTING;
+}
+
+int mem_cgroup_charge_cma(struct page *page, unsigned long count,
+			  struct cma *cma)
+{
+	struct page_counter *counter, *fail;
+	struct obj_cgroup *objcg;
+	struct mem_cgroup *memcg;
+	unsigned int i;
+	int rc = 0;
+
+	if (mem_cgroup_disabled() || !memcg_accounts_cma())
+		return 0;
+
+	memcg = get_mem_cgroup_from_current();
+	if (!memcg)
+		return 0;
+
+	if (mem_cgroup_is_root(memcg))
+		goto cgroup_put;
+
+	rc = try_charge_memcg(memcg, GFP_KERNEL, count);
+	if (rc)
+		goto cgroup_put;
+
+	counter = &memcg->cma_counters[cma_area_index(cma)];
+	if (!page_counter_try_charge(counter, count, &fail)) {
+		refill_stock(memcg, count);
+		rc = -ENOMEM;
+		goto cgroup_put;
+	}
+
+	objcg = get_obj_cgroup_from_memcg(memcg);
+	if (folio_test_large(page_folio(page))) {
+		commit_charge(page_folio(page), objcg);
+	} else {
+		obj_cgroup_get_many(objcg, count - 1);
+		for (i = 0; i < count; i++)
+			commit_charge(page_folio(page + i), objcg);
+	}
+
+cgroup_put:
+	mem_cgroup_put(memcg);
+	return rc;
+}
+
+void mem_cgroup_uncharge_cma(struct page *page, unsigned long count,
+			     struct cma *cma)
+{
+	struct page_counter *counter;
+	struct obj_cgroup *objcg;
+	struct mem_cgroup *memcg;
+	struct folio *folio;
+	unsigned int i;
+
+	if (mem_cgroup_disabled() || !memcg_accounts_cma())
+		return;
+
+	/*
+	 * Get the objcg from the first page.
+	 * page_objcg() expects MEMCG_DATA_KMEM, but for CMA we used
+	 * commit_charge() which sets folio->memcg_data = objcg
+	 * without flags, so we cannot use it.
+	 */
+	objcg = folio_objcg(page_folio(page));
+	if (!objcg)
+		return;
+
+	rcu_read_lock();
+	memcg = obj_cgroup_memcg(objcg);
+
+	counter = &memcg->cma_counters[cma_area_index(cma)];
+	page_counter_uncharge(counter, count);
+
+	memcg_uncharge(memcg, count);
+
+	rcu_read_unlock();
+
+	folio = page_folio(page);
+	if (folio_test_large(folio)) {
+		folio->memcg_data = 0;
+		obj_cgroup_put(objcg);
+	} else {
+		for (i = 0; i < count; ++i) {
+			folio = page_folio(page + i);
+			folio->memcg_data = 0;
+			obj_cgroup_put(objcg);
+		}
+	}
+}
+#endif /* CONFIG_CMA */
+
 struct uncharge_gather {
 	struct obj_cgroup *objcg;
 	unsigned long nr_memory;

-- 
2.53.0

