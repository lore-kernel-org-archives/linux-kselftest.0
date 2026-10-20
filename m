Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478313;
	b=WtTXm6Cem1S0wgXAwPTsYFSPWJFF6Pcykd/5+E+zHIjqYMNr5GmCIE7+OhszpuZQUcx0
	 by/RzIqYfLoiIx/u0fNKXU0CWFDBNAKduaP1N0SJivIrXKj8omn5utA4ZFGxnyEpnbly+
	 ZvLRegrQPEaURnKOjHF8OKqX6ps9Fb4oVCibv5EcVFBROvJJ2oy4cXTIWLhqkBV8TrYkV
	 owQB9Aq7CJnsXq7pc81YMbwB/jMM4XrAKOHZp6KM0V6WRSjCeHtWVM1L8dKVdVS5VtIdu
	 kN/H3H9tdgJgnEJlp0mf8Nd2jyi0rx2vI0LBzo1pbANtYE7i5henrGQ4SOcjAhz+EPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
	b=kfmdJg25aY4CBZt0hwYdZix8nYahO35+s4UgqyI6hF88Py0XRDxVu/ldJHBiiSrFWZ/F
	 cKuT3lHGRASuXC4ytRcvtFyxwvIwcxOzvPcOFxx7mql68pxIDOKc19aP/OURXJr1/EUMv
	 n2r9FPHgbUenjMJC71cQYfTzKNPyg7F0sWMoeihaL3aIlSeZZNGEFrXgPv27m9GgfFSah
	 HkRnW+wN00cdjHd9uUBHKQKmi5xEJUW5VAwdpKV6nrGk/xOkeke6rYNPfTvKX0hDAUd14
	 3+/0M951BlEVvZ90E0IebkrdpCNwxTUBV3K16NPpOgCebbG5Wy9gTYJLsBjZe1dFE5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142660A262E
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8142660A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1518750f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478312; x=1793083112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=jyCX5E17hnjLXAhAwoXKBMXQVYu+tPW2CI+HH0G2ER6wB9MTmmSiAZpi/as4fOdclo
         kAXxM9PkY4H5JHdjsZ+4Bzx5HpHo2OnrZ1HwgLbj+bPwLnnqf70yEaupd4CLVASzf05+
         OWSWlR51HT6pmhY9gIzfGoDxulMeZ7F5ku19C7h7HDX7X1ERjFj6F5Vm0iNa7uXV1PFt
         NYQOfJoQQiaI/ISd6sVZIM0JKsBtHgJSriQUYmbyhsYlwRYCxSYdk4j45W35mPoYQWKe
         eoBwtsyp9MCCF4vac8+i04nXoIXyxJkMqmbtyDTak7n0J5c3tabeCTmLOTojUJhKN4tk
         yyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478312; x=1793083112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=XKDNwIVeF/Ir5A1UnoLjORDPiOOD/ZvC/0pwCN3aoNZcphBLZK0bWVs4QlXg1ZnLMH
         MlVKeVN9hd75TCKo07NKJvyyCXxmxmF7yza+s+RqeCarPD4NSKr67mYREbX+cV5CIIJM
         nykX/Oro/X+PYHuoRUlc8yuPhrm9Ssxr9UVeAus6EfAydVRPyZOq9CZ8uPC+B5KSK3mG
         fohrliQ4e7tC2ws9EUsz0/0jnoJrOIkcIECXccAX74aaY3grPlUcNrECk/H5WijNURp7
         2R1Zxn0EV8p8SXz96jxrqV1gbJhLZ21vr7m/G/6nUeVgMwYQq3xAOdTie1onSJsapnLH
         7EBw==
X-Forwarded-Encrypted: i=1; AKwUvBwTzbUTQzhd+obP/DwV+IwCy2uRI3kzQeYbmYwJcYMn0B4OXN6tHzGCQa/zavVYTZCki9ZX3VAdRbuPOOCcYwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG5AIV7rjRfkHUy4WQjvbq2OM+HGA/VpAaxMSdSkojKddwZP+W
	jul5FLdh5Oe8imfbUWDD8VXLypOIwS6jOmPT+IhYTRPSZUA7RFBHcOt8
X-Gm-Gg: AYBFou2RXF+HIH7BaQ5eW5Lw99HON0DpZl20vSe4DSoaHRcqSzU3Oswz/FCMxBhKDe4
	/0dFI9oOdUxTG2uFlURutcHZDXCfYB3tMgwkxRBbCgq6jKaSP+jQTtn9rEfy8KU18zZB3l8NEO4
	9bjKIHIRhcexPn8dwqEN5+aAhZnVC9zB/EmMdTXUr/J0cam8kMOJ5ZSIqDu1YQMVUhW8Ln89fbr
	9d88D9QyNEYyovSK7N0f/EOuxwPlxKzSBKw/hNumzqvkwwvrwIJM6eG//YWq+tEleKm6uIR6075
	AdT4Bjy2Nug0vjsBIGImOFDGVj6hfMcFBsaUHRpaB6+x+wTojg9Z4OHUeppRd9uhMstEOhDqAhq
	S4Sa5b+g8xGTyAZ1tBSJjR9YwK+WFsumG1CRZ6x08PAoE3T68tLJP0vhidexf124wmoOU/VQCwi
	Wy4Jd/I3pTkDKVSd9g8wQOwuIMForg6KZXkNvPXdp9ElwZNf/BfqIKRrhcRjiJ5CJDS/g0MA8C/
	m1i6hj1shGpyglRYQrSqPXwNG/+mg3cJgI3MMdjMWj8ML6CSCfyefozdxE3q/VVIr6aeOQNA1Kn
	OztMUmzAwyCq4RUHeBaexMTBtlRai0n7d17eEiZtcFKHRgbl3qb+IY8bTwXhcZe5HWMPJ9vlN0V
	d6A==
X-Received: by 2002:a05:6000:490f:b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-48e07bbe6a1mr21638509f8f.15.1792478311632;
        Mon, 19 Oct 2026 23:38:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 4/6] iommufd: Keep the pages mutex alive until DMA-buf detach
Date: Tue, 20 Oct 2026 08:37:43 +0200
Message-Id: <fdb5d9715d7f278ac24f05246f09703edb283525.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() destroys pages->mutex before removing the DMA-buf
attachment. The linked attachment still exposes pages through
importer_priv. An invalidation can enter iopt_revoke_notify() and lock
the destroyed mutex, including when exp_phys is already NULL.

Destroy pages->mutex after dma_buf_detach() has removed the attachment
and excluded further invalidation callbacks.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 76d8803d6..59ee68a1a 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1667,7 +1667,6 @@ void iopt_release_pages(struct kref *kref)
 	WARN_ON(pages->npinned);
 	WARN_ON(!xa_empty(&pages->pinned_pfns));
 	mmdrop(pages->source_mm);
-	mutex_destroy(&pages->mutex);
 	put_task_struct(pages->source_task);
 	free_uid(pages->source_user);
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
@@ -1689,6 +1688,7 @@ void iopt_release_pages(struct kref *kref)
 	} else if (pages->type == IOPT_ADDRESS_FILE) {
 		fput(pages->file);
 	}
+	mutex_destroy(&pages->mutex);
 	kfree(pages);
 }
 
-- 
2.39.5 (Apple Git-154)

