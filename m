Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D048403B0D
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576102; cv=none; b=YD74j9YLWtuHyWWwYHWM187wbLhN8iBCQQIAfl3Hv8LMqZXNrN1jJsh0AKIcL54gdEmJP+G/EGMlqpngsSRLowPBttjFA5yZuZZUDSW7eG2cg9jG+Lu1BVvYrsEUcoZz7O2BuMYcxlzZILpgDuGMZlFZ1oV3ZP4tHZF9XXGtZ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576102; c=relaxed/simple;
	bh=5WsZz3rVrHU17snClfl3M7UsKRdvN7wn8MZmoue9j4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p087mQfJ+ee6g8COoeCjjLBLURqWyV0g6TW/sowa0pyVjrH0gNZZ/+HYARsRSkLGsR1yQnAkCPm8Ot7Qz6d9WHqC1LslhJk289e3KbiiMlUUtSlR5FgsSVHaWR4oq+9/Eb6F3lFTnJ2D8s67eCT5ScHKfLde3htOHLwZM1y8/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AeO2JDVY; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AeO2JDVY"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e6391b114so567517885a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576097; x=1785180897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdEOlYqIeVdUG1DfkuvgY4asc0OjHWyQnI3tw1EXx60=;
        b=AeO2JDVYr4O4Zalcb0OS5SE9Jc10O2vFAgaj9xZdut8hoHmRchSeoKM0BvhpKROxAj
         TpuEQQHgBvlffX0b8VIu1nV8QGREocf9JjP9UxFZ9eQXVahhg1tRrUD9A4iLJnjqnU/D
         XIPoxcFJZpI2KVfzaHdaKMiYwn6HUcDzRSXafy0wt6fsDi7jgUlsm4Z+YkBdBlbXgULG
         RMbHG9yXaXWjXzjsV6CaTm5w4lwraNEUyE/0uyFHlQ3BQoNARJguOH8jZENaA3p2vTJw
         Yz9e0Q/xakbbN00AJ15b+UP3MeSow5DU3WquVLj2BDWd+eB4x1EcbXJLqt210bh7OWze
         Ik5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576097; x=1785180897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdEOlYqIeVdUG1DfkuvgY4asc0OjHWyQnI3tw1EXx60=;
        b=OetzYKIqey1VBVJrFZoKjlLDxyTqSwvmFMaupi5OrTBbwoBcluRKBYeB9yjeAcSVcN
         V/S34wY7K7ZRJxpi3TLSoHtiFYqrb0sFGyiKaGJE7AMYbYFfPPOI90c4ssHFodPurMIl
         PsBdyltJ3wnJvTJfTN33Gm9GEA0ylrSni9SX8+VJIBfpHK1P13cnaBx+eYGj/80GxQUj
         m2gYQleGkDJimTdjGXDfVzHeyfnaeAkY0+BaYJwJwhsfUJlZEB0oFPQGlNVIloj+MWJ3
         LE4vj1qVflKDG15slyrOdf2qJ8rilXYPB4J6wz9NwopOjRN8OtjlIlDpNG99u+Ch+3Up
         aMJw==
X-Forwarded-Encrypted: i=1; AHgh+RrGYeNbxZz/bZHVWn694RQys13r9ZGF3w6gm3ZimeA+64512hnAOAnTr6Hn0DySgzAlvR1mQ6KkwS3NtAydOiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM5hPZFYlkRwZyUXuRwXuhGJaIGw3+ea3QNUB0KTZnSGbZKUbd
	b7HoZJ5LtEO5nyo3BzGFqwNhOOAXM9ugNUljVXoWzp3EWwmcBKKicI9cZJmWf2ZH8Bw=
X-Gm-Gg: AfdE7ck/E4dV4Q3HNed9qfLzBvl2d1ermFBXqmu2VKDaEv7wfUwaVz3sBJrpZTUSe7x
	oVzpMQqR65oYORnmBxX5sE9nO3Jmc7Y75/zZbVgLtphkFZHaHT2qu+ZS/pYUYGiw9LX3aoYy/LU
	TVo3nKBDSV4EzxecBJoLLGsWSOb/GGCl8O0bflq3Kh5J/6Ui4nicxF4o7c+FUASeH/IF97VIvQI
	GzEEkQLu44guacbJ3lOLAXYigE/3PPfMQGT2hkFw7Oxn/5IYykG1x24g8j3MV2P4Oe5P3UtteUZ
	73zFoXbJlH/dTZkJC9SviCgJ6zUYpmKwx784Uta3NW3mDvug92HpucjLwmhCjnpLdgg9OMnGj9i
	SMNz5I8hjCz1vkamLo7q69BHNDuJgz/JlTcotXVExWBG45shucCLGsCYVXwbpeavQjWGgfgCNCP
	oP/aiMFUGMNUWZgpGtorcPuJLWdiIbUpQVVU6egJEnFHNRpHFC8f7g6i3+A9SMdaQ=
X-Received: by 2002:a05:620a:a2c5:20b0:92f:196:209c with SMTP id af79cd13be357-930b41f9aa3mr1179416785a.71.1784576096734;
        Mon, 20 Jul 2026 12:34:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:34:56 -0700 (PDT)
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
Subject: [PATCH v5 07/36] mm/memory_hotplug: disallow migration-driven private node hotunplug
Date: Mon, 20 Jul 2026 15:34:01 -0400
Message-ID: <20260720193431.3841992-8-gourry@gourry.net>
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

By default, device-backed private node memory may not be safe to
migrate without coordination.

Do not attempt to hotunplug private node memory, instead fail the
hotunplug attempt, and require the owner to drain the folios
safely before allowing hotunplug to proceed.

Unlike transient / longterm pins causing failures, this is not a
transient condition - so we can break out of the hotunplug attempt
entirely instead of spinning forever on a failed migration attempt.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 226ab9cb078ad..2b9c0830821e6 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -34,6 +34,7 @@
 #include <linux/memblock.h>
 #include <linux/compaction.h>
 #include <linux/rmap.h>
+#include <linux/node_private.h>
 #include <linux/module.h>
 #include <linux/node.h>
 
@@ -1843,11 +1844,12 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
+static int do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct folio *folio;
 	unsigned long pfn;
 	LIST_HEAD(source);
+	int err = 0;
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
@@ -1884,6 +1886,15 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 			goto put_folio;
 		}
 
+		/* Private node folios cannot migrate, fail outright */
+		if (folio_is_private_node(folio)) {
+			pr_info_ratelimited("memory offline refused: node %d pfn %lx\n",
+					    folio_nid(folio), pfn);
+			folio_put(folio);
+			err = -EBUSY;
+			break;
+		}
+
 		if (!isolate_folio_to_list(folio, &source)) {
 			if (__ratelimit(&migrate_rs)) {
 				pr_warn("failed to isolate pfn %lx\n",
@@ -1931,6 +1942,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 			putback_movable_pages(&source);
 		}
 	}
+	return err;
 }
 
 static int __init cmdline_parse_movable_node(char *p)
@@ -2067,10 +2079,11 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			ret = scan_movable_pages(pfn, end_pfn, &pfn);
 			if (!ret) {
 				/*
-				 * TODO: fatal migration failures should bail
-				 * out
+				 * A fatal migration failure (e.g. a folio on a
+				 * non-migratable private node) bails out; transient
+				 * failures leave ret zero and are retried below.
 				 */
-				do_migrate_range(pfn, end_pfn);
+				ret = do_migrate_range(pfn, end_pfn);
 			}
 		} while (!ret);
 
-- 
2.53.0-Meta

