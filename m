Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478308;
	b=pJd2KJ/4x2auJjpM4jm26h+s136ETCeSMzjHdAzAJtKMfmzH05MpYsq8YkjyysSpkFIp
	 laND74wZSjov2bbCwVdlSpplG7wSR1t81A9XPS0QbInDReUNfZw9sccf5r6jmb4z0hPwn
	 N95wM8pvQePFod85xXSg7L643aE78nk0QTOOTOAoOMW+ycEP6nmTZPT8+pHE2NRB2PCgR
	 INdAM/hioYA3akbd0AYPHOyWUKQG3CDeDP06mLQWlSpnga28pOJzcn7HL4MignQKEbi4e
	 KSv/2Ye3CsQXVuEn+Rniaz1ibemI5oSx5q+rO42lSYKkK+S2ugLsUPFAQmF45qZSPvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
	b=jsiut3GGw793QG1kMYg5435pl/8hjMYrb4vnnc4Qz/lYwr0t6MrnpE4vZGqabUH2y/mr
	 ATFp42dhqLefE71zKIM+So7RcyO+ecO/eUpVCXpUntTyLuprHTbImaS1p1UUyE727z9lp
	 VQV09loyy7pc74DHwtpSuECOMq0/5HhsmOTSQyAB2GkvztzZP7ubLw9uzVZlMqC50c6Wb
	 LW85txRPYyfcguHGZRN0rsmGgFVISFh9QPjCiglZl50TvVTc58pbCv7cJdwVOYiKsQxuO
	 EMrnWqnKxpOqOwtLVAl94tKOXuH3b7fxKB0mayhTpHJQ/hUXSimTDq7wTudUqksgVEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E4606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b042c0759so1808475f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478306; x=1793083106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=Aln6DWWQ66nyAA9XH0EuCU+6CESveBtk2wAH+eysfQwQxncBnpy32ta5rQJP2FuDG9
         foMXr68z1yIVgvIA0V6vbJV0ZGqtgO/wNwSP+mOmHw2/CgFj2Qx9eiowrJRrhT/ttb+U
         uzN9WFHl2ux1CLe7GuIunPeHCivhj+M5O2rNz53CCeloPsLYiPERQNOrsDOAdc6qtpRP
         ywiMxJL65clx/1iZeHhJFYHAD62irJ/hVko+GSsPoQaMGQPximjG8fLKLYoh/L7LuGj9
         6WwnEo4A9NPLZ/qrE3RiteOxhMTxWtmYNG+nmjTA+c6zk60/7qSAvHHbKL4ZewVqPcCU
         3BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478306; x=1793083106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=wQjC1WDwFkO1ef0FYWcOF26d4jwBEIP5wOZ1WHol8fLt3ANuoQ/CeDeYvAuPDzUG7v
         XRsgl+U6MWmimzYIZbrOTwpmLok14a8X+nOA/APQu+Y/V77vl6tkvn6aWpkHF0NvW64a
         +NYapoq8gXhw14tWgkd+i+LZqebH5sk7dHUCFRGAXKg0+D4AU4fB1tGTYKyDlZ122gjB
         5PyvBnKXvEQXoBEsQyhiUzHZhDNZxwbO2sfjXo9ofOw7bEzalArqVt3NNS8i5n3KxAn0
         wQ5vBys8bies/I5hti65VuS3gLXDJVP8/k521jrvYlWe8u0nmcYOjZuArlmjGP6b88s8
         Xhjw==
X-Forwarded-Encrypted: i=1; AKwUvByB8yXm+iYp0Jcw+mxbZ0bVmt5xFOpDL3Hx4DJl0ECvGJG0IqumMzR/IkPazdrD9jLwZXHGFsZQw/O0ngJrl44=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz86q5q/qiFkNK165YoQlo53D5c9Tt9QM8z4P0x+lToeG48oGE
	NZttU7uhqQgDKjqSmwZxYt7GBcLzuEv73dt87gjPSXMXt3hcwZDHR//f
X-Gm-Gg: AYBFou2Qku54LSPen6JMrqt7mYtZkgk17PIQcaYo8Nbr4BCpLSpdcGBKr1NU5suN2J1
	QjvK58Zy8XmWiY8ZpA6ynNhDuFnpNNtDX4FEv7PpaXzGETRDNrn8doVwXR5tqhHpwXAxYJeUWlQ
	U7aDuATiSAXtGFBQjXfeZVjNSOHQG9AVuQ4uuU7xEDG2UwoOd6tQI23QAQyRjH2JRujIHERRU+E
	yuc+QsTd6yLK0etiSZeoSEdGbPIR+2eWB3P5daZzCQjpe247Cjc2GPiILWoDYBA8KvsYpX7w5vH
	Qj+JMyamPObb+RI5j4JBtcMSFvIOFa7nsz9psA0pVVSm3k44hWegJHBoCJNIe7KDbMo265D3KZ5
	YvBzVLa34jgJIx01ZroCbE2TNYF24j+lchMXdF930/hL4Z9dwA8DIfjcLhFapqa74ZCUvPFL8cf
	v8CH8F5Kw3gH2vGjW+zPLeZaPsbpuHw3RjI0IwgEYnfwAdAuvhdNgi51v/t9aNhr/+AUp5D7cDO
	KmAAYHbRVSOW1iHQibZxe5N1G+v7eEJ7w4ltoXN2BZk/dlXUhQ2m/VRAtsIPXSfEDayX/kWZLUi
	bqetWShffEMt61QmNK9FAfcBGc0q7GGpy2XQhuLRc0PULhLj4RXYwEvp1kpmKdPRQLzR5qzIWw5
	tCSxxUj6txec4
X-Received: by 2002:a05:6000:1e4f:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e07fb2b18mr14486670f8f.15.1792478305848;
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
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
Subject: [RFC PATCH 2/6] iommufd: Publish successful PAL mappings under resv
Date: Tue, 20 Oct 2026 08:37:41 +0200
Message-Id: <10fbbfdbf3a19fff48e504bcf5ec3a74f11bfd7c.1792477872.git.kmehltretter@gmail.com>
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

iopt_map_dmabuf() stores the PAL map result in exp_phys before checking
for errors and publishes the attachment after dropping resv. The
attachment is already linked to the DMA-buf. An invalidation after the
unlock can therefore pass a NULL attachment to dma_buf_pal_unmap_phys().
On map failure, the non-NULL error pointer also looks like a live mapping
to iopt_dmabuf_revoked().

Keep the map result local until it succeeds. Publish the attachment and
physical list together before dropping resv, leaving exp_phys NULL on
failure.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 0b32c65af..9e9bc6a1c 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1491,6 +1491,7 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 {
 	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
 	struct dma_buf_attachment *attach;
+	struct dma_buf_phys_list *phys;
 	int rc;
 
 	attach = dma_buf_mapping_attach(dmabuf, pal_match,
@@ -1513,16 +1514,16 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	if (rc)
 		goto err_detach;
 
-	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
-	if (IS_ERR(pages->dmabuf.exp_phys)) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	phys = dma_buf_pal_map_phys(attach);
+	if (IS_ERR(phys)) {
+		rc = PTR_ERR(phys);
 		goto err_unpin;
 	}
 
-	dma_resv_unlock(dmabuf->resv);
-
 	/* On success iopt_release_pages() will detach and put the dmabuf. */
 	pages->dmabuf.attach = attach;
+	pages->dmabuf.exp_phys = phys;
+	dma_resv_unlock(dmabuf->resv);
 	return 0;
 
 err_unpin:
-- 
2.39.5 (Apple Git-154)

