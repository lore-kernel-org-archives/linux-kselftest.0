Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA724266BF
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194641; cv=none; b=FVXUtCxyKWLnSuS/Mm+F/ZhIrPhBdCWffzietsT/6FuRUkj0Nytv8c2Dz9BqUVaHN4RHbFIGUOad611TDBHZ111F0FMKbMv0NDHd7dQqmAR5vyMhu7tX0wbPukZW52KGRjM4fQmqlcwqhLKEXKl3Pkc2xWy1hSOqxBS2s5qRnjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194641; c=relaxed/simple;
	bh=Y/qboSZQk/pC41EA2RsQPuVOhUQ7kJKEY1lMdCJdYLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhUIi5fAkasRipGy2/EMeg3V2nHY405/npV/xwwcQejZlEhOuu+stkOaF9/9SCZlzjW2dsYhCjwmF7eqks+QKMCONpT04/RRnKxgfr5rs6PGYOGpcDNQKsHE6AdkfgzU8dLuJdjBWyl8iOq0fIJ7qlmsMqGGnQ908hYgrzi7D+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwvyUAN7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwvyUAN7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf36a6905cso49965ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194639; x=1781799439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=lwvyUAN7SasG6aWtqB4lwRPoDjj3HfYo4wNbWyS7Fr8N68HYpy0zbUsx5AmT2B27wm
         3GNDM9eTyqv839k0WADb+oe3q1yvhaHmbOrAAibug2UsRCLoBWgJ7fmKwik7RbnAfCaZ
         usWpQVnaCog2NW9F8b2Np9P6b1Kfx5bayhhSZWCVWVWKcDeiftnegu5Q3q0JgjxZo8dE
         tEcvhS5tfqWpS0bR7tpJAlZk5QlEBF9HkeFbPFBSohYvlHV8WjNou+bVZVle7y6/lYh9
         Uyao6ezDpf88lSCGAHdnSYBIjn6mxodnVNbZIEOLZ/qXWcrwj2yFa2cxXU8QA0UskKT8
         cO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194639; x=1781799439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=JjLGb4yUbhbFWRRQCAHmpDHT7VZWKKMIBI9bZD6IJFeY711BjlguVTwd5E+U3wjr4/
         Xu2U2QTpMVolwrQ1RH/exhKzELrRCZSdgEzDuUe8It52i8qUKefXeMNYthg59zRk8WWP
         Q6QOH8Ox8gCwU25JqRkIBc818oCjAhZJ7unQcgwlL9BpePJT/yfyGGmg52NTSJgKY6by
         ky3bEthFBOA0Pv+MNftGGwkFLBWlnD/5sVU4uBjo13MN+yG1xn/34RDRxwfjLIunNFZ8
         D1oryMcSznKjSdsPYX2OV7PVYDwG3dHDMo869vHKgVZ8eCzpAI9RLX7LRQDsvLqtCrZ5
         +bOg==
X-Forwarded-Encrypted: i=1; AFNElJ8CubLitqlZ5pTjYBjHnQWWFtYmEtUOShN8xzmq6FkudnUQ93elHJsBg593U4OHHaatFSOvmsDR2XdycEdv61M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJqXQ+AuRa4SIm5ch/H9NawG9oCW5e6zG490Bb36nMZMTGBXw
	gHXBPp8Mg0uQHfU6MzQ3BvFjSxNNEMOAfya/jROshiN7HEbg7Lz6LoRe
X-Gm-Gg: Acq92OGr5AJbEPdqMSwk3Fml3E52ziFlwaDjxgouwftyV/Omhdv7dhK5aCgFhMzTcZa
	bhoXW7ca+cr164P7dDvE7fkCNR8jXWj2v9bVtjNiTHy4rWyFFO1b37k7pwuDM0nI6NZuOKsWNrv
	/XkKy+WJMYkyGObRj/fZCi4Ilm2IrVAOUQX0PEUtaV3PYTIdTSxDWWDYUKf7Rk+VKLvfyjavtzn
	k55cfkgpsIvsZ6j7srJEocGp64gEBzo7WarKsKt0k8xwEeLzUt0L9xw3INLeBeRZr8YanhiqmWE
	Bt1V2g6XQ2qbfAQNPs9hfDxcygU4f9wFdrTzhp409cGuhvu9Wyjn8hibty/hJDdtcEK8ACa4+7S
	M2YQKuOCuW7JlrHYw/WiGKq0wcB764DpWWb9J05nFlnjDGvvOMFbpXWyjdkf1IB0iJuHt27oepR
	ZkjrOpItfqc8kGgn+mew0=
X-Received: by 2002:a17:902:c404:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c2f0932d65mr42009805ad.16.1781194638490;
        Thu, 11 Jun 2026 09:17:18 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm288573265ad.52.2026.06.11.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:17:18 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 11 Jun 2026 08:28:43 -0700
Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
In-Reply-To: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
underlying folio was larger.

Instead, walk folios[] and emit one sg entry per folio. When folios
represent large pages (as is for MFD_HUGETLB), each sg entry is a large
page. Normal PAGE_SIZE sg tables are unchanged.

This is helpful for importers like net/core/devmem that expect dmabuf sg
entries to be size and length aligned. Prior to this patch udmabuf
handed over one PAGE_SIZE sg entry per page, so devmem only saw
PAGE_SIZE chunks regardless of the underlying folio size.

dma_map_sgtable() does not always merge contiguous pages for us, so we
do this internally before exporting.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/dma-buf/udmabuf.c | 52 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..9b751dd98b12 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -141,26 +141,68 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 	vm_unmap_ram(map->vaddr, ubuf->pagecount);
 }
 
+/* Return the number of contiguous pages backed by the folio at @i.
+ * A udmabuf may map only part of a folio, or reference the same folio
+ * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
+ */
+static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
+{
+	struct folio *f = ubuf->folios[i];
+	pgoff_t j;
+
+	for (j = 1; i + j < ubuf->pagecount; j++) {
+		if (ubuf->folios[i + j] != f)
+			break;
+		/* Same folio, but not a sequential offset within it. */
+		if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
+			break;
+	}
+	return j;
+}
+
+/* Count the contiguous folio runs in @ubuf, one sg entry per run.
+ *
+ * Coalescing folios into a single sg entry up front lets importers actually
+ * see large chunks. We can't rely on dma_map_sgtable() to do this for us as
+ * the dma_map_direct() path preserves the input scatterlist lengths verbatim.
+ */
+static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
+{
+	unsigned int nents = 0;
+	pgoff_t i;
+
+	for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
+		nents++;
+	return nents;
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
 	struct udmabuf *ubuf = buf->priv;
-	struct sg_table *sg;
 	struct scatterlist *sgl;
-	unsigned int i = 0;
+	struct sg_table *sg;
+	pgoff_t i, run;
+	unsigned int nents;
 	int ret;
 
+	nents = udmabuf_sg_nents(ubuf);
+
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
+	ret = sg_alloc_table(sg, nents, GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
+	sgl = sg->sgl;
+	for (i = 0; i < ubuf->pagecount; i += run) {
+		run = udmabuf_folio_nr_pages(ubuf, i);
+		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
 			     ubuf->offsets[i]);
+		sgl = sg_next(sgl);
+	}
 
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)

-- 
2.53.0-Meta

