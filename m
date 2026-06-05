Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1782E424F
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694363; cv=none; b=EcUlF1n7VC03Pt95k/Z/X0iN3JqazF++X7KWsxMd0OCdAsdMyNLx7ii+ViXvtf/TBzl2jBNiHuS2JDoxrVEL6Pu9VmRR5NGioPwVPZ9lpoD4TrMfHEeVDTsRBwbT5CfR9sBoavF9SWynE7sZaTUXRRL4Vuj9+ovDx9D3JOn464A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694363; c=relaxed/simple;
	bh=bzVWvGN8pdlnq4o4z+hOySj1+S3a7FDyojT5FT1eDQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AA8lkhYNB/RvF0GsdqyL2u6j3u9ql7EryRDZnlXLiR0vpjKr/93vEf+kQUoHv3AL8SoeBDn1Kt1wsoqNRvv++/aU8e6E5ukMC6q1x1OkeTPzyHGo9SQrxDE8TJyUtZkCh3LK8EiYbEiHvzLLUVsZve7VEY5zeaXhY+LyGirigXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DBqwXdKD; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DBqwXdKD"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ced8f44da0so24973576d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780694361; x=1781299161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI6t/rke/+VLpdgjZBrnvU5+vhrLOr9MvTf8Ltd88rk=;
        b=DBqwXdKDGR/NQdBlrfv3MPd9QMBTY2A+Y7akFU/4a3MLfzt2jYu42kU2Qnuicz7GLZ
         8yGSQ+WXFpGMhYrX2rl7rNa2BTWwZONGQnwK5CO700XOZrDMk91Y1lJBO2lgyFqEWtUb
         cveYtRWLmNgnhtM3NfPhwxTpJssojY0fPfbmnd7u2h5o6pED2VhGJENyDw0VCBuK6GRN
         4cd/0Pqzq8OteqjVI5pRhCxRoTi7fwbaG2x1qRANKjurfjRSGxnJa2sDi+AEp9VHg2+H
         /18px/uZKZ97nAl9TUWq3mEkCTuFPBqWmVaB1MRfUz5+tKRob0VPDMQo2Qcxd5h7k6eY
         zChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780694361; x=1781299161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI6t/rke/+VLpdgjZBrnvU5+vhrLOr9MvTf8Ltd88rk=;
        b=ZEx3K2vkX+FKSv+OWi2iqrvwCmpTB/6b0QI9XqxLk3jJ0zsYZEFHqaKHJVUkeDHm98
         Ex8QbsPTAWd3syMlgI5d5TBFO71vgLxGCI5Q6Uy29+5FwkvNgsaqX15011bpM7lsA0XB
         09KvqH8e667di/gnK3DIC8h6vCtKKhyer90Pxh8TMCRcURDjJJ6xLs10TJDo70yyvRph
         cN8Ccj1aICnFiKSkQMTT0gV2HoN/uhWPg9fnofbOeBFeDMgsc20GZxcbiLEzHpB/REuN
         mgPiB7V3EgKmTr1JGnDjr1+RWd0OmKSXeMd4o9ykoJNMgwCLXwrLhkqMwCmLrSvGTsmr
         KNCw==
X-Forwarded-Encrypted: i=1; AFNElJ/+3RDeC8r3KrpLjtljwfZSNzbUbrUWMDXh6B/Dg95WDc75SFSg3e/nzxn5sFKDku0DFEtC5NN6ZwM+4LH2EJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxe1xgXrM+ciXtAZkH12pq1o5fRLjgv3JEt1hbp7dKHLf5I48
	TWlFcT4KEUckiCdF8C7tnlvPhwhCtmOMOH0be9vaOCYUHGReQfgYa1U/tdKX1l62Rv0=
X-Gm-Gg: Acq92OFgISLBWEz63ovwi2RRMzGkysccSmE0YXQtbQTDj7Ey6dbkaUEyTlAIZ5Hy7QP
	Ixg/z55gdXU7FHEbNXpUTHeqDiCD8KUReEfaM1l2jhcTOrFW/oTkd9slADhF0NjEM8m5+BKh0Xf
	L0hGGSY6AZDVqssZqPaLcqiKxaBSlslezw2wTM1U7E9Z3phvYqd9AXMcp4wtaYDs8xYOabyZZbA
	O7rHOl6uxBVsjgQISQpHD4iDxAn3fXydnlgdK/iHiXAEDw7XuO62PhIoU4q2gVwXEQTtznJbHl7
	6T2hhxpnvq7kSMFmZdP09/HVcYeJbC3xE+CJpVgq8/iiegBRt0TdDqSBZDsA38JSp4ydopdlZhB
	Kor1h/F+9KoHOtvy0B+lvwySWxaPlRpA97AQEmrIWhoFeZv6HVBRHpAFnzhqIe4VAImOb+BJa8A
	YqGx80My08daZrV9KbRVzhZUz598oWe1Ktwi/zukit0B+t9uPxZreUEMpurNxXQNXXe+PuWAEwz
	v7cV52WhjGbyJ3emhZQtILbiVKr5u5S6g==
X-Received: by 2002:a05:6214:53c4:b0:8cc:e8f4:1630 with SMTP id 6a1803df08f44-8cee614991fmr103632176d6.30.1780694360689;
        Fri, 05 Jun 2026 14:19:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm90518196d6.49.2026.06.05.14.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:19:20 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-cxl@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	osalvador@suse.de,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v4 3/9] mm/memory_hotplug: export mhp_get_default_online_type
Date: Fri,  5 Jun 2026 22:19:05 +0100
Message-ID: <20260605211911.2160954-4-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211911.2160954-1-gourry@gourry.net>
References: <20260605211911.2160954-1-gourry@gourry.net>
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
---
 include/linux/memory_hotplug.h | 2 ++
 mm/memory_hotplug.c            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 7c9d66729c60..f059025f8f8b 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -316,6 +316,8 @@ extern struct zone *zone_for_pfn_range(enum mmop online_type,
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
2.54.0

