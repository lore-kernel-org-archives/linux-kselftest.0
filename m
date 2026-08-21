Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD273E009D
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338681; cv=none; b=je7Lni9ZGrcH2J+Q1pF4Twkb/cHK+mDF6GmUea6v8+VSBC2/4HMOMNjGbnnukG3tcVCw4D+/1R8r1NG4FZV0mxP3izekwE2kiz5So4Vq+d9s/t4B9VC85A+5sme45XYTnp9BX9jlnbJ+2zEA6hMA6gfVrzvjJLz4Ml5WZhtG3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338681; c=relaxed/simple;
	bh=p4E4Ct3IlFbTeWS21yt/A9ZhhZobTV3W1Jsfzz388+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sb2MygUxQqt4dU3Jl6CyJp/S+7s1RzzP7y3amW9zKRBYEVeb0lLZp0P7U0SuLlKZLe9fQZIJGaHOx9HBr74gzBa/Dd2fc2h/m7loMhkqXLoQC+vKaRyzuBIE5dISNM5Mkb1tXFYgJHI2xtNtGIxfeGBHw4MatHS4x91eaP2cC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OeoTMPEa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Trc6mrBD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OeoTMPEa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Trc6mrBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
	b=OeoTMPEaRaxz1wIpZAFP/kZRL4p2RUWzLz52yLNe2pYK5zLJJ77vdvBUoC5bsvFaZjTj7+
	o4J9bwfwbl6OMAlCB5/O3nfUB+MSYj19hFZiJHdwZ/QPKcDMJ85B1Mr0oNWJxcMvQyy8mN
	eF6MUeBvoCZ6aVBz2ZIsAHT1hudwHRs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-m9c3NLYjOr-Obw_LxLZjIg-1; Fri, 21 Aug 2026 14:57:56 -0400
X-MC-Unique: m9c3NLYjOr-Obw_LxLZjIg-1
X-Mimecast-MFC-AGG-ID: m9c3NLYjOr-Obw_LxLZjIg_1787338676
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so105789385a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338676; x=1787943476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
        b=Trc6mrBDX+zo4KJit944vd4EryF8ogDzd0zttSoaT5gO3/kZsiVh55oFO+OCMFOXdZ
         sbn61iyY+B1KSMphNhazGcTIp/5DaN3LGV0wey10B13v0tbWDJXG0pPmjmNKH4bGkQh4
         qaMivl+tt/YgzdNCjFtePnO/n5uZenMAU8jvBqXAeAY1UqvxDsWiNEwc71LyWt531AxH
         +LRSTiMR0PQIIEAG654GF52CIOnj64u/FilaR1QMMaBRNxQZDcIuwyTZqJBKMyL5t4rM
         w7schtzJ/CaA5StrI4I9zTMJL9LPfZ06J2XdPrwpEf5+PZE5FE3TAEJJ8X6NN/AQFUyS
         uOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338676; x=1787943476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
        b=lzuP5O2Qasq14yZHaaefr4G+PCVf+qp3XlVt6wLrq2k74rjk89Tqdac14kWkONIzRx
         9K9uNanaEBsiF47Vdz2ZeeYWAHP1YwQ144J9pZW9GC/QMLPP1p8RSNh+M6jN4LYJQdSo
         n8/7I+QHE/mObOEse9iBMFifo83PzyoJ15pmlI1iF/sgenlksxPA7wLGH/OWZrhrndkg
         wI7JCd0gUPZplfro5r8ADOo7V8mKrqW/QVsom6/WRCRrPzT5HDqiPD2x2o0BEgoCZM7o
         P9hAWFU/aPC4Rc++xrr9v5Ijxxng6iMmVwwERHL4Iev5LnbKlGJLFAF2FozOssVZKnHB
         HBOA==
X-Forwarded-Encrypted: i=1; AHgh+RoeK90BQofVDtj7X6cGo9/iam4naqv/YCdUocXudRdwkY8U6pzkM5BJI5AF5d7z7CgB09uS+Z9qv1QYx8MZC84=@vger.kernel.org
X-Gm-Message-State: AFuF++nsRSNCJjsIAvRvahqZl4GSoqlIW6IutvQK4x2z3ujco7YQGP6z
	wNabrQd3oJ2VDidWfSDXeQ8uyASUqLUaTBPkCbjy6R/dcYtTiG4cu1S7bkM8IyUIIFTx6I9bNPB
	NIgu/iEYwrWSw/q1JbkHPt9DwyRXvBz0k1cnre6ugRtgFQ/Npc4HJiloqYefC52zzbAFr3A==
X-Gm-Gg: AR+sD10tmvKWj4ohJXQ8ZjVx1yDAm9Pujbq9B8C+xDPlgFu2HOkTkJwISOJIDpN3IzV
	pQPpQN9Lbp9gzWwjt1kjS6wtdyq3AUPkX4uthT699aCcrYEODazDergpO9hKRFL+abpcNgasGDj
	dCV3UpZF3OKri74zv2z5x17B/HHyPtWZUxNejtQRaG0v8bZ6xFVkVXUAEpOipdAfolSYl7W55Ty
	0lPYXOVVOKNZqWp3MhOVs4OQ3IwbjOwioVwRcZMuyVoO50NPXBWJXqI2/vljFiR2a7sfcNOMT5i
	D7ASFB6jztHwvnk4p3pL4shsn2YHNxyPuBbTqj3GToB81By4hDmBlGTR4uKnaZaIn5su/NfU6Bw
	P+N39tDg5bEfKTu6o640fxktLvvv7K85UhNW+XMKpWABL
X-Received: by 2002:a05:620a:29d6:b0:914:bd3f:b6db with SMTP id af79cd13be357-937394278e8mr807012585a.10.1787338675681;
        Fri, 21 Aug 2026 11:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:914:bd3f:b6db with SMTP id af79cd13be357-937394278e8mr807005485a.10.1787338675183;
        Fri, 21 Aug 2026 11:57:55 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720586ea5sm655734185a.38.2026.08.21.11.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:54 -0400
Subject: [PATCH 02/11] mm/cma: include linux/cma.h in cma.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-2-d21b165b8440@redhat.com>
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

cma.h needs definitions from linux/cma.h (e.g, MAX_CMA_AREAS,
CMA_MAX_NAME), so including mm/cma.h requires including linux/cma.h.
Make the dependency explicit by including the header directly.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 mm/cma.c       | 1 -
 mm/cma.h       | 1 +
 mm/cma_debug.c | 1 -
 mm/cma_sysfs.c | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index e1820fb451e4..03f98f6d45a5 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -25,7 +25,6 @@
 #include <linux/string.h>
 #include <linux/string_choices.h>
 #include <linux/log2.h>
-#include <linux/cma.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
diff --git a/mm/cma.h b/mm/cma.h
index c70180c36559..0c9de38d6bff 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -4,6 +4,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/kobject.h>
+#include <linux/cma.h>
 
 struct cma_kobject {
 	struct kobject kobj;
diff --git a/mm/cma_debug.c b/mm/cma_debug.c
index 523ba4a0f9f7..70bfc6fbeeca 100644
--- a/mm/cma_debug.c
+++ b/mm/cma_debug.c
@@ -7,7 +7,6 @@
 
 
 #include <linux/debugfs.h>
-#include <linux/cma.h>
 #include <linux/list.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
index d5bf792c6245..e4ee35bc682b 100644
--- a/mm/cma_sysfs.c
+++ b/mm/cma_sysfs.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2021 Minchan Kim <minchan@kernel.org>
  */
 
-#include <linux/cma.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 

-- 
2.53.0

