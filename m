Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973759;
	b=4Z5Bko74c99vwWcr8i1UHTBlunvMBr6YdfMRyld220d8lGx6JtwLSTEu7XA/1ufmyy1p
	 TnA0r+4jzB0gzL8xDP+IfoULOPrt644eqa65bKhkRAvjJlQLEsIU7erCI1avlhzJ1bXuc
	 SRoNH5jS08hqBR11HN4A3CkGMVoK7mOjHSnkcYfihWOmd+VgGeMRyl6EjEHEM6IHJSLkp
	 K/8ikpBe4w8Sf46C4mJ4InflONiZqnf0xQqzgx7lvhBaxaGevF2g54As9DmKjS+t+S4B7
	 yRfDNSE0bkhs9iS21EaBkkWTpyMfW7zHqqjQchJsAKD4pkH7LpJ3u/sPwaq4ZGn3TKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
	b=Mna7iK8S3XJ6bmPcqy3GzEqNW4shT874YzUQmySyF1SB9IEQ40IZJYmHqq+qbXr0HSuw
	 ZgH83jkt7UXT2CVMq8XD3Xs40k55xOVRmDTRkiJrUmBZZIMHjKYvIprGmgrjQJpYysIlf
	 1RQBEgA3t9BIMUgHrYdFHGKdpI9iMf0vfaD2CTy7QRsxJumEcilLxbxgFT4pM13K1kSA/
	 M2v0119W8PKlO+rccgprkguNsj1eLcALAyex9DyNxrNoPdhx/+oJqZsc3XdAgFtli7P3K
	 AWvEjO4HGX2Vmy6TJg8Y3oh/JX7a2KleTEche3K0uGMmupAO4mQjudCaiBSDSxoUzbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBQIyl8A;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4C606EEBE
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF4C606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBQIyl8A
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b3299aed39so4136487b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 06:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973758; x=1794578558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
        b=bBQIyl8Ao1yDGdhQgCePrYk9aDAvursFCsFmA+R/DIb6ng3gytJlFVrxAMmDLQpJOY
         sQzV7bOMTAO0k8WZn9LRGklPByPLghXu7c0bbCNhhnWVHimytqN4UXeH2ZjwzK6YOXaI
         a6RKKK9OZ8Xca0sS9m8eeXT4JC8FEXEzww0/zJRFZKenAH/G39jHiL39ZlzOQqLsIiZn
         Lm2/ao8nFVN3dy+96CW0gcFV+PT7iQniWtRMmKbkwFkbxgR1GaWwV0/8JC44GKr/fF+J
         2xQl0KKNdXjGFMHpI2qzLENiACI2oOpJEGVeiNoCS11C5bffakIk6C4PN23/U9eoVpnP
         gzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973758; x=1794578558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+M+r/A/rmCJPclkzBuO9rIhmUCkVtBIaA38ECscytI=;
        b=ToDH7H4Go8Fg8NdtMXjHtYrMChEMqYdJn8uASIny7MWYqLi/VXFHNyH2Fh6NCcN7DP
         MLQMhCPtpnazaQ7ROBADGEC5xKwkh7SHPGXjvJz8gbjFljv7AUlzlqDOJcchHRUi0Cfy
         R2h06/2Aj2gCdQmIwga36DRGtjEgUluPxQPCDx8os3naU28ViFI/3KBcwa0SOxUUXkXr
         IYX9IoLJOXgLwMAk0k6Ylo5qLd/2BPMdYWevUaQvvLqqlL04IyMN2L+vpapJe/xov7ZC
         KtuKD04LLAgZCcJRUH4Y0vcMUbbC3nJeXlYhDS123hGSJml/hCu84/2LML6e4SHoYk+q
         8X1g==
X-Forwarded-Encrypted: i=1; AL+hErEJg6SCIGydz/QSnQYrnXhUUlNB8gHZ1hqQsrexh+UMBm75ky7aGIJLGNUyxba7yYYfSMqgUVR0WP413S7xepk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nj1RCzEQT3MbjruNrDvjP4za8kqwQUZTtPTglqA3hXdDl5a8a
	8zrYOMp/1XbQg/e7x3QVvrmHaQSu6bzjVLG812uoyylZvJoMIfGrY4Pt
X-Gm-Gg: AYBFou3mXZieHmSQW8h/LiiWvQXp14EkWvYlc2RA0T08ehuUucwvVEe23ae/WEYSrTG
	oxVM45ksa6tG9MOPJe0ZcMl4ha9cDmtGP332obJw0PHOvvmhtt1rbeet5AcyrvP4Os5VbDUU2G5
	4IcteaY9FDzPck6qO9v6oV3L0fkvH4hBR0Gfc4UMS4uZ4f0cbEIDRMDmloLLem5/li7LrOnWfHH
	AgQVwHB/8XnrLmUqehTT+vpdgqv8ksfbn/92JAISUMxmkWxcWtMrQFkiUWiW1AVVc2xYG71BXN6
	wUFImDNJGD35cLFtDkr4ijVSmNcIE+KqgiFVs/RtxFXD8oxPty7tNZyr0ClYE1MEU15XRoZAow9
	oVJtl9EphUgXWTedjKcS0a2HzfeLiavbTHmdqvIEqLE19ac2iiuj1pQaxMAhR5nDNNCq7ZoH4P6
	xjLNQ/YR5vJ7E+YN/ACFbmZ1H1R7G8dvFmsYBlAqGhZEw0BAe+clZMAI1k+o3WpxFNSmhz0NpXg
	hOE2siFOe3dvkxaPjB5tkxqPljS5apGtywkuE1ZgCiMrz4h0uV0K5hmiPPSJCx3cvjOJaQcsLxg
	2GlsW34Ma0TPgJBkIBHWoAqdGJGRJyQjW3MHCB2dI489Fg49wXIk3JpLxLY7bo7Ak0dJQHQmCrb
	SH9nUnBdvgZHQnTRUr3maHZW8pgVWngj26eJKDt+tbPrZtHcSZp3qZWz4XYBKl3R4mlZF5fMNVv
	8OWchDPSM=
X-Received: by 2002:a05:690c:6e86:b0:8b0:effc:5d92 with SMTP id 00721157ae682-8b341920f73mr9340237b3.29.1793973757610;
        Fri, 06 Nov 2026 06:02:37 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm19090677b3.5.2026.11.06.06.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:36 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Fri, 06 Nov 2026 09:02:32 -0500
Subject: [PATCH 1/2] lib/genalloc: don't dereference a NULL pool in
 gen_pool_dma_[z]alloc()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-kunit-genalloc-v1-1-ba1ea397dfd8@gmail.com>
References: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
In-Reply-To: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Fredrik Noring <noring@nocrew.org>
Cc: Christoph Hellwig <hch@lst.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

gen_pool_dma_alloc() returned NULL for a NULL pool since it was added.
Commit cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed
family of DMA allocators") moved that check into
gen_pool_dma_alloc_algo(), but gen_pool_dma_alloc() now reads
pool->algo and pool->data before calling it, so a NULL pool is
dereferenced instead. gen_pool_dma_zalloc(), added by the same commit,
has the same problem. The _algo() and _align() variants still return
NULL.

All in-tree callers check the pool before calling, so this is not
known to be reachable today, but the four entry points disagree and
the original behaviour is easy to restore. Check for a NULL pool before
dereferencing it.

Found by a KUnit test for lib/genalloc.c, which crashed in
gen_pool_dma_alloc(NULL, ...) on UML. An AI coding assistant (Claude
Opus 5.5) was used to write that test and this change; with it the
test passes.

Fixes: cf394fc5f715 ("lib/genalloc.c: Add algorithm, align and zeroed family of DMA allocators")
Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
 lib/genalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/genalloc.c b/lib/genalloc.c
index 841f29783833..40ca25cd87c8 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -340,6 +340,9 @@ EXPORT_SYMBOL(gen_pool_alloc_algo_owner);
  */
 void *gen_pool_dma_alloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 {
+	if (!pool)
+		return NULL;
+
 	return gen_pool_dma_alloc_algo(pool, size, dma, pool->algo, pool->data);
 }
 EXPORT_SYMBOL(gen_pool_dma_alloc);
@@ -418,6 +421,9 @@ EXPORT_SYMBOL(gen_pool_dma_alloc_align);
  */
 void *gen_pool_dma_zalloc(struct gen_pool *pool, size_t size, dma_addr_t *dma)
 {
+	if (!pool)
+		return NULL;
+
 	return gen_pool_dma_zalloc_algo(pool, size, dma, pool->algo, pool->data);
 }
 EXPORT_SYMBOL(gen_pool_dma_zalloc);

-- 
2.43.5

