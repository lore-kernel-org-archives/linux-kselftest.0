Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607110;
	b=Ecg0DqBn067c/uA0nX7FDBHFJvIcj/5r+/5rYzR6tUd2hSX5DbR/jYDkNE5bq0B01ZDa
	 zJo4mJ5cD7jJQ5MtKfF3QmIPO++PCSMQThJ8ZNyRsDgKYHvlgLq0AyR0FOIffhzqEhk6m
	 fRAoSjy7NSX5fNSc7olaEPrQzWdF3qyVreogfeMBRBt8jAf3SFmiFqcBsktIm5vPk3LYo
	 KtxIySJyYA3XvTqUbBp0ExAcjn9gmIExyF18Pe0fa2KAVTnVncv94Bb0THjbdBJVr7c2A
	 TbOEpGyPjOLBupr+hDkzuNkkYSNptihJZmc17oxSO9UtkufqPNyoRPHYqwieuYbW6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
	b=Uknzaq4BGOdVOcgSKQTriIZ4LlIgFGVCvhUzG9gehdoNZ17Oto2VWRltnsZ/J0gA918g
	 LautpfGFKndi72nGSqpym7ZvrfX2Rdnih0l4GAwwadK8ACvZViqdhV2rTFDfwMjR81fKK
	 edfMQrzq2czp3r95bA8Zq6i01ICAomfhu/0guFgtWG/iX/MYt/oRQkVnb88Lgt4kQKFXI
	 g/cWGrqNgzd7y6B4lxrM5CjPOxG3Kqze/hag+O/tAA+BJTNPwrjqj2MfUCekqSBizZZI7
	 8pEt6tODAkw+VqulOAiviLy9MYwp6thx3LmZkc9+lp3xZSVgA9i/mgytnnaiqNL86dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YStxYhS2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0B606A331
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F0B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YStxYhS2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so16860065e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607108; x=1794211908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
        b=YStxYhS2u0SmwT7c0BAO3eh23j05Vsv0xbEu/kN1OVblWYq9Lj6EC9f+W+RuyafvaW
         jDYRmFK2XFgD850Vh2O9J+HJ1uWuVgITD3z0D7S8Xb74iG8k+jScmYN5ap8X/oV4xYkP
         XK++OAjpueHON5AlXSh70ofRtiil9xZF8dligA3Z0P9KitQ0n76P61ugapBc7RCOoMew
         3j6+fLkm4kqdrmrKGWOZKw6+KAsTP+FQW+hzLea/S0/2GhUKWYxfkCWdDL0TzNzQqme6
         7epabvsLqV01UUxAJeQ3ZRCXuPUiXynx11JzazCmGNOOlTL0ZSxpQ8mC64M9YF/BjEyc
         pfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607108; x=1794211908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAyyYwHdR5Ch5uO/F1MiXirGDsn56GrI3GAO8iDRceA=;
        b=OTpTnSZJOMu1+f5Cg7qq51bgX2m8l91blw+WVzD536eKA+ut0T11C//8LypDUNm/9P
         V57TPc43fjdA8SiDzJrvXNfsIffRt/S3swrZLs0sRU6P1JSD4vj9skzN0ZRb4/VJUqzG
         qbHbR/yP63q0nlKa0QtzGbQe2ZGfZjM1ovoDSk5pxcefpgxxzV+DxWtlHUr2tdnRqj0U
         sKykBQ1eIdOaV5lxAlne39bp18QAyBSc+IAUcJdKV1Tt8+TWYu9/Te60Ju2A8CrcRDWq
         fD78FYYCGPEdIuDGngSTBrTFrFOuvbKTy3AYxdv0bsdDclX2rbh88aUHeLjk7hEZDNLq
         +yQw==
X-Forwarded-Encrypted: i=1; AKwUvBxliMqwX0IehnP2ci4FW7GNfe9t8U+f78diq2btkKxHirtMlG1srUEoK8fXHPhkwCyiioUxqjRA6HRX2BALFYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7C5lCplu/vT1zdLhgnk1VsvkBcnRvtHICuEGflILH00LYTNzn
	EhTLeohpWoFT7uucC5bpTfmN51PI9IE9/bwM0cSUTAKkWZxHpj1APjvw
X-Gm-Gg: AYBFou0seTsAg3/eOqQo04myDCEnA/r6KGE5KTXRrnKew7mOLZ/ettXTgZIhK2LCAii
	gw0GQ1kFRsdSkrYYnyghR+IOddwhpqAivGPPQET3Ilyw8vyc8Xgsvzv8Wv5VknDtu1QAt1GtN5d
	FtJ9V8YfwSKNx0xgRCYImFBT3Jl9Z8pahWitU8VhS2kjaghaKIDxZacvjDwqQOxRUCLRzg0ia0o
	RMLfAHATEI7QkRyG5oF9MaxHxLO6QVTqEgaMmSvWJ5D2xgHO3iNWICy4LsnbrqFjvZwFzQDNEv9
	poitnb8dEGrTNKA98f4y6Mcwlh+XyL+Q9oK1eKRyPVC4tmCnicV6tY3hinHQIF73tboXJX19OD8
	6G6uojPtmX3G7ZfNupSHFFvXJ5PLK0W5zHxu4DMTrcuwhXC7N/A22oNHT1e89vkz2I8x9N2udAp
	nQrQvJrT0dDipg/q8P7G+F5dVfJBuhuO13oe6QDkOPlrVu8yyx55PLP9At0PewYVyljcrknPdZt
	ChWCiuhLPGcEvOoiPSUoqw0Y7/WCDWkWAm6WhzdtOhCBPbSEtuliaJuwuEbEyCQYP7S6+ADF4oa
	DjaORz1qQxASFw==
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ac185bcc7dmr226206975e9.14.1793607108359;
        Mon, 02 Nov 2026 00:11:48 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm333331005e9.14.2026.11.02.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:11:47 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Mon,  2 Nov 2026 09:11:30 +0100
Message-ID: <20261102081140.201987-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102081140.201987-1-azpijr@gmail.com>
References: <20261102081140.201987-1-azpijr@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mfill_atomic_hugetlb() drops its locks to copy the source page with page
faults enabled and then looks the VMA up again. The retry doesn't check
that the VMA is still registered for WP, so if the range is re-registered
without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
PTE in a VMA without VM_UFFD_WP.

Recheck VM_UFFD_WP for UFFDIO_COPY_MODE_WP copies after looking the VMA
up again, and fail with -EINVAL if it is gone.

Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
Cc: stable@vger.kernel.org
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v2:
- drop the leftover sentence and the non-hugetlb reference from the
  commit message
- add Mike's Reviewed-by

v1: https://lore.kernel.org/20261029221129.89068-2-azpijr@gmail.com

 mm/userfaultfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index f33ccedfecd2..6321bb82c1ef 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
 			goto out_unlock_vma;
 
+		/* The range may have been re-registered without WP meanwhile. */
+		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
+			goto out_unlock_vma;
+
 		/*
 		 * If memory mappings are changing because of non-cooperative
 		 * operation (e.g. mremap) running in parallel, bail out and
-- 
2.56.0

