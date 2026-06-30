Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C8731DD96
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854339; cv=none; b=XGGO5fwmDUmmmB4FrE5RHXRSS8ZOuMlwv2qsz/eZmuWKjJe3EsrtuxWtQIzu6im4NP5CiZmenchDuTuF/5mkOIbNN6xxmNUcPMuVnngDdzNrdDTc6ldaxFip8mznXYt7zXd98Qsyi68jjrTfxlEb7lHlZcdg6XORe6paGd22X80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854339; c=relaxed/simple;
	bh=EGGGAMPdoaoIYEzc8d+Nft+EyBoE2MoOmk6lJpb1nqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G64XUiAfs2gu9Na/L1e3sM/uakNH3qiqVPIfhWRnRkrJOsyfirvGpwyn76EYZ8fUrT0xNTbDafzh9qa0g2ai4F2fSIrsw4cJ/uvNAZAP17BkWs9vzzzZOaZmeteCSjIicvzxZyIbVC52KrcLcXaGTL31N/eZ574M90LdkgkIVGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pPQMr3pZ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pPQMr3pZ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-923220bf1d5so460772285a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854335; x=1783459135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XGoZmURbYPyoE28BDme2QX7BFop+44e7z5jxOHqkV4=;
        b=pPQMr3pZaI3Qt+6G+22Rs7pCNhB/xLfOaSbMhratMMfzYtUAtuxlBTgnXTezWmjnH4
         xsPmVhznUdtfednOK5DXjUlSTEPpmPjcOUibRs1Xjc4R/EwdGn2KFnT9w2hBmQHyyinB
         cmkKjFNvYZ3f385IfrobqY6C05nV+PXJI/F68CXcdhrO5NOaLrx27cBn6JsEmzfLxI8/
         oRMGQIFRn8RyP7EqMRUXZVjG7W5vPtxH3ELqMbv8Rve46aJ12D5FE3Bl5GaTiktvkg7x
         ZLsFSDVeNU6yU1lS2upGg697Nh3LzsEkoWB+B0TnJ/NzddFokGViSyac4iFA0Cbe0H45
         sTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854335; x=1783459135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XGoZmURbYPyoE28BDme2QX7BFop+44e7z5jxOHqkV4=;
        b=J9MHmxk1tHBAgj99qdDa0ChLIcjxzGY7uOs65J7IOXIv2mXsGK0Z8L0j9XsuhBHfte
         QdZvGtPTxJduSj0MZ/18+n+V4At06oVqbwIlUiNL60ralO+/igsKSHM2qKuZmk9W08nG
         AZhZ1vwibJAMv6vpWbdV9Y+VDvzIeBFngI2RHOAfx6SDAOskYLAw648MzU2QTJITtQK1
         xps1+7urrJb+p2GdCMn8U/oZl210c5Gg/pcR4sTsIz7WFYnKQAZMQEeDlrcuqFVqgK7g
         7ZYak62wUqdibKzHycKNnGIfsGSzd0adI5ifsuWi3zIIg5O6Ea8hW3mQx6JfNAw/NbCC
         9mYg==
X-Forwarded-Encrypted: i=1; AFNElJ9noNnCaUa3BXfFmvAuMu4I2peH3c3o9Ehq1mF16EXJFWhIb8mJ5t+csL1zhClQT3f004TmcWCGxNqPYO+kpDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1ED562Y+bJzP/56SsE3W2miSClBmgBstCyA7HPBud+aD1gHi
	3GORXMkd9dBpnKi5WBDfmDCfZTiigOMmwhQWYTc1v5OskLU0cISQ6m+zifwsYpIFgZQhBzyvqFN
	6IXSi
X-Gm-Gg: AfdE7clkNW0hw/RDfrQvTXgMS6Ezqwnld2WouO2yOueekI4UKT3K4/7iwzkee2H0eC9
	Sz1VbVP4+ZSXoSYCOGBRQxSOdYrezdn72ulbuA/mdma/TNJikN4PW1asxSy7INHvBB+KUgixmE3
	WKR16fAwWfYRSrGi8VE4VS1VG+foXAJ+trqns8OlXDCRSqn1C66m9Bf7iIz/tS/5MZqPhNL1lWG
	u1u9bmIYBgRiYwgQqUprnhW+G1NUxbS7YM0EI2i1rv3JS+KMILQwG73hCONqFWiepppJURmbVUR
	ZbnlNLaT46JuhY+Llh2HLJyL1OirLANIqXHy+/t5EU0bt064/A6cITql3CJxibJ1cJ0h4IhZDF1
	pg/Rd1nSIl0Dg+ZDK0FM/vVyy0ao+Hr8y9CuqE02vakNU7lItL7KUnxFUwmjw88ebPGYyCeC+kW
	9bD6TnWJw//pTWo0BfCm8esEeQu67aMInG9OQW75g5MW8XKceb9ZAKC3U433mPiaLtV4aLOcUzV
	Q==
X-Received: by 2002:a05:620a:4721:b0:915:79c8:ec92 with SMTP id af79cd13be357-92e627931e6mr816969285a.37.1782854335567;
        Tue, 30 Jun 2026 14:18:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:55 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 04/10] mm/memory_hotplug: export mhp_get_default_online_type
Date: Tue, 30 Jun 2026 17:18:36 -0400
Message-ID: <20260630211842.2252800-5-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers which may pass hotplug policy down to DAX need MMOP_ symbols
and the mhp_get_default_online_type function for hotplug use cases.

Some drivers (cxl) co-mingle their hotplug and devdax use-cases into
the same driver code, and chose the dax_kmem path as the default driver
path - making it difficult to require hotplug as a predicate to building
the overall driver (it may break other non-hotplug use-cases).

Export mhp_get_default_online_type function to allow these drivers to
build when hotplug is disabled and still use the DAX use case.

In the built-out case we simply return MMOP_OFFLINE as it's
non-destructive.  The internal function can never return -1 either,
so we choose this to allow for defining the function with 'enum mmop'.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/memory_hotplug.h | 2 ++
 mm/memory_hotplug.c            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 5d4b628c4a1f..4d51fcb93a37 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -317,6 +317,8 @@ extern struct zone *zone_for_pfn_range(enum mmop online_type,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
+#else
+static inline enum mmop mhp_get_default_online_type(void) { return MMOP_OFFLINE; }
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6833208cc17c..494257054095 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -239,6 +239,7 @@ enum mmop mhp_get_default_online_type(void)
 
 	return mhp_default_online_type;
 }
+EXPORT_SYMBOL_GPL(mhp_get_default_online_type);
 
 void mhp_set_default_online_type(enum mmop online_type)
 {
-- 
2.53.0-Meta

