Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966653DC4C2
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338687; cv=none; b=Ht0H4Y6y7erEtIZepa7EwBWjdLqjh4uQHI863F0rwOfuHg/wB4sPw2EZ2f2+GclVl4o2NKeZZvizBY7wVNYEkaAK/WPrNzoKLyDwN8DLUiqdRAx0OvdaO/Y8YMjUgyDzIcnYm35zUHBGWNwgh/14kgjxrLUsFRwjkBFsO79BjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338687; c=relaxed/simple;
	bh=zN4YwsmDvSboy8SYR2KDjDfnHBrzsib8W3G8GkLnsrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsQSXXAj+QOQoXYCGOwzeGLhrM1BKYaQtINtjCR9EIUVTQMmBBHAI8H0WPQfKj85Isver1DabnPCtVO0wU4oKOV18+jAnYmy5IBXlA4GiwZLv3tNYsXi+qv+vp8eUHlS4kvg7YA1cwR+MbG2VjAWCMTsISxP/p6hkz+S13G3I7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGroEPWA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDqmU3tc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGroEPWA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDqmU3tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
	b=IGroEPWAfJG/SL/Lpvm10cL1RqDysjcLCelj3scf1+vINCZWKGdoBessDVRV/61Ih9CKLj
	769mhtzH2jWHIY5N1i1usSzea1aSEAMx2zFkwZJD2PTlTHcvWOEGzSsDFXG4nI2g/QL9YE
	/7oxyR6zTsm5M63VltOu1wnPR1xgkmQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-sdzJEqvlNC2dlSkCzhAfOQ-1; Fri, 21 Aug 2026 14:57:53 -0400
X-MC-Unique: sdzJEqvlNC2dlSkCzhAfOQ-1
X-Mimecast-MFC-AGG-ID: sdzJEqvlNC2dlSkCzhAfOQ_1787338672
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so239544185a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338672; x=1787943472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
        b=UDqmU3tcJpZtpwfjZKqEFCQi/5+ZVaE3mtudf8tbck29CC21rTcHwt7q/VL45p7JDn
         FmWvd+E3k7OunbMvSP8nrogF9at02YHUeV9QddnvAIIuREGa82UuOWBVt6Zi2Mi5OPTj
         uTVMcqEPBWAWfgwTqPpobqelkOMrnxTko2y+j3GMxtYD5HnZtwjdpYZCLW+Ws0QqRdBo
         ICYKDpycMQ+fBm7Vvixva83uDSc8vTJi8VgfrMEXCC5KhnK4CJrqLqdWqGY79Oe3d7bC
         q/EzRKKmqiMmGvJ5dx4ROuUVC/u3gdC9GxgECuCLZkXtIQfnrnKBsK4CcvJErs92MNZv
         0IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338672; x=1787943472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
        b=etwBbq45VzpvWNo2mjTvkNKd/tKZ7y5Y8MzLRHBTMqcauVIuVe7OIqidp6hbC2jhPC
         QT1cPgM4fBSKhfv9V/D/r3VZJkFdoNtxfXxpDcYj8dXlG2aWzybfvsZSahEXkuvr8MO+
         8i57L1rD5iW/S5w6IrrUZJkGUwFbmvUI3Gjk4mdtroNBzookL+DPOaDyZcZ2IhvwzGlv
         y9xAAMkozIRCeGEBQGyy4YTG/W5Iy9CeHEkH+LYnBBlDfoRkiXuhQM5LoJpvvy0bas9e
         jWkLpq5vh8ivXselt2js5LCL/bWVQDaG9USfUOIHUL4f4LwQgqZq5BbRRStFkxlLXghe
         3uEw==
X-Forwarded-Encrypted: i=1; AHgh+RqbjqqAlIGpAJnAYaiHSeRxMNTqljbGfjr1sHiqHqgyXrkcu0DLs+g4i8C64BVeIw1ixeQ1JMYZYFgBvta5EMI=@vger.kernel.org
X-Gm-Message-State: AFuF++kH2amv1RAglbLSTv7o0CwaaE/HCfhA+NQccE/IUlqiJG40ucwG
	zLFfnBIUKHttiXCljtOLu0ulKDRz9wP42PMX2ghVgYoK0CjKvNwrngp7lO1cA+fFCXH2iK40VPm
	+X2iQqzlA2PoNxLAkWiSSocj5Ly4Hdwmd0fFyQqUn6vcvw6XK2S+gpV9kQmHrVhWA0S8DSA==
X-Gm-Gg: AR+sD12wFsz5oAkgKzFijiuJRkywLt8WUfwirUKnBsiDp+thN1b7MGVumUiCkRQHP0p
	BxEy7hebjMTasYSs7BNwzIYZ4NdyD0HuBkoqmpG/yKOtuHrQjtUg4WrhpcA+xr1iztxgCtU0Gll
	eSBmoraBNin1DVh16R9tfNyrK17/ZjGL51lmdvxodE9F7Qi+PSwikEEH47Nx2+K7pn9zuGRMLsd
	WfXUZV4/x+dyOkFGw7nWcJSs5pr+iCKyxDdLa4deMZGPe/Eq+0ktK6jHDzTe6u2d6zIcJeVBZWv
	/psUTcPPiqppupGEtrgAilSfAhT9cBCwuIoV9voPFKZ7Q6O05o/1a5/T8w279DbT1uKBv8+YkR2
	QuCk3JUXcbmLpfIQtghZ/S8SFnBb6Npxr8qJguKE1mlVy
X-Received: by 2002:ae9:f115:0:b0:937:26c3:747f with SMTP id af79cd13be357-937468baea7mr97627385a.15.1787338672389;
        Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
X-Received: by 2002:ae9:f115:0:b0:937:26c3:747f with SMTP id af79cd13be357-937468baea7mr97623985a.15.1787338671990;
        Fri, 21 Aug 2026 11:57:51 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937205998ddsm651971585a.44.2026.08.21.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:50 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:53 -0400
Subject: [PATCH 01/11] mm/cma: drop const for struct page on release API
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-1-d21b165b8440@redhat.com>
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

The const is not honored. Both cma_release and cma_release_frozen do a
struct page -> pfn -> struct page round-trip to convert the const struct
page pointer to struct page and modify it:
cma_release calls put_page_testzero() directly, which modifies the page;
cma_release_frozen calls free_contig_frozen_range(pfn),
__free_contig_frozen_range, then __free_contig_range_common which
modifies the page as well.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/cma.h | 4 ++--
 mm/cma.c            | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 8555d38a97b1..16e2136421b7 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -49,12 +49,12 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, unsigned long count, unsigned int align,
 			      bool no_warn);
-extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
+extern bool cma_release(struct cma *cma, struct page *pages, unsigned long count);
 
 struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
 		unsigned int align, bool no_warn);
 struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order);
-bool cma_release_frozen(struct cma *cma, const struct page *pages,
+bool cma_release_frozen(struct cma *cma, struct page *pages,
 		unsigned long count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
diff --git a/mm/cma.c b/mm/cma.c
index a13ce4999b39..e1820fb451e4 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -992,7 +992,7 @@ static struct cma_memrange *find_cma_memrange(struct cma *cma,
 }
 
 static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
-		const struct page *pages, unsigned long count)
+		struct page *pages, unsigned long count)
 {
 	unsigned long pfn = page_to_pfn(pages);
 
@@ -1014,7 +1014,7 @@ static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
  * It returns false when provided pages do not belong to contiguous area and
  * true otherwise.
  */
-bool cma_release(struct cma *cma, const struct page *pages,
+bool cma_release(struct cma *cma, struct page *pages,
 		 unsigned long count)
 {
 	struct cma_memrange *cmr;
@@ -1037,7 +1037,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 }
 EXPORT_SYMBOL_GPL(cma_release);
 
-bool cma_release_frozen(struct cma *cma, const struct page *pages,
+bool cma_release_frozen(struct cma *cma, struct page *pages,
 		unsigned long count)
 {
 	struct cma_memrange *cmr;

-- 
2.53.0

