Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BD4377578
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281695; cv=none; b=U6ll0oAhOSVsRZ6Gsd0OzgwRdu3Hwp4VpxeC2LJziqvye6FkT74hDoR//BUlDpD5Cemuq9RBeslNLQ+bblZQ43Zbasvm1sKqM6b5fnPhtDk3W+ZBtWiDVEBYaXkzCUJnrPVbcW5BI2+Iqitg43PXMOgqCw30Q0T6WsTLM+P8Fbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281695; c=relaxed/simple;
	bh=Y/qboSZQk/pC41EA2RsQPuVOhUQ7kJKEY1lMdCJdYLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tc8p7vUb/CUpSAi0IRWCYLcXHcGl3ZYNDEcKZzCk4rwfnuu7MxbRbBWXGltyK06499L9K2Ej6y7OJxuaqFBUvyJWoFV0zMvg3sOvv+2rF5lU5rM54lqwYJhQGX3jeqn37lDdGVBhP56q3t4XO4MzwVW0hmhpHtlfyAcvd/52VO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvJJu5l3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvJJu5l3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso9509155ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281694; x=1781886494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=XvJJu5l36VUmtUl8/Sh9XObXstN9wPAIvf+TsUy4Jh/y2HxzLim/7rrcjcEJHevpNI
         PuL878gdsxjU9dvil7dICD0sm+TS01kywHVEq9Toe+0Ucx1PU7tG3VPBJvtSWcQXcBim
         frdKteLC8y5s7wPEHScBJu7Xqq3BHIV4qtwkEkfUJiE36eo+4gXfgxFeyGp6YZ7EuUbt
         MaOwHSCS2ute6F8w/VLpXq3aM0AgXjT9BDjlN+JLbiU8KUdVQ+0dDSBjStb436p1gqlb
         m1gqEA//Bpp7bRAehDPwcXZ4pS600gmAvprXvUr+Kqjr/YyIJDJgd+HamkdfOKqjGczZ
         i83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281694; x=1781886494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAxTBIOEmfhpqt503+PoPJMs1ii7LUEnvcbZDbUBB0A=;
        b=oB5imyqUdQ8dMawcU00tizl9FRt0hiTIaVeeHCVN4PkV5LtUJ7AFSvgswUCuSjibjD
         ZvhtrWJ28gqQcBL7MNeF4lJhyz29CNgsiQF8Hj7JYDD2q73p431a3shNB7Q7LeKUt0yE
         rDkVlLrJd0nXvEWV40SyKDpjmUAL30QB96LQLIHKM+nrOf08LNb+z+dYVax6MX9mwbk7
         GE/Qt7UiIDI8LSrJ81ZxQpesY9wUsEoNF6dPWfnvlC79UGBTnA35tdrtU+75VrESV8mq
         Jwrq2y3VG3a8agzgg0bGdlaNw8J/jZmc32bcEZZL6ZaTS3mE7NCyTy5LbkN4uNtlC3RP
         rkfw==
X-Forwarded-Encrypted: i=1; AFNElJ+XRF+wdBtoFID0h0i0xAB5DjL4oH+vTFXG3iPN15yGpzcl/cpSE5iSbKBAlwvDlPktHtiYGK7TaTq/Xa4kWG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQptPHHb4zV/CtGwRsNGytrjaGlwXG+Au06K5UL94NyvpkmG7V
	zjZrZC4AZ3v3JDQG+6ryOF+xHH8uFNn+YvLe/ORiXh75c8LF4RsZ8RSV
X-Gm-Gg: Acq92OF3kZTRV9KSNfdph/md6fN6MVoEwneBE+bVvTGCvSQtmsUxLYaBfOgX21rnZTT
	+VNYZdSIALdA95RyMahy0HX5sUmWjZfoOSyqAeVmL+uzxc7R1172oMRAhPoBp/lP4hRw23LWT0C
	ZnyRZo4f2pru2mxYJoLNsxFnTJuowiPku5mtokrr96Iw4jppjHaKDp1bgS2ay8WRQxGHTwjJSCq
	QcPyeEKO2o2+Bs9PDLqR29/IxD4lGS2XzyxAplVt90B//gIoDkzzSCIQFWZ3z2G1J8g/J775BmE
	nq+W2/GecvWH3ueKL0dYKG4weXkCHU0oiyKB2NAcASdtemL5g5xU8P9ehobAHz9MaViqZIEFJpc
	yFF/WHpzH2HcFFyPS8hY2PDNG4PAWUv2I/o2gvUXOGVElk8w+FdToGqmrzRuyg15fZEMX8sIMIC
	ed8TzBOFVNJXSqMb0TWoh0GtmNjKTUOw==
X-Received: by 2002:a17:903:1acb:b0:2c2:7e17:39f6 with SMTP id d9443c01a7336-2c6642c3dd5mr3387595ad.36.1781281693627;
        Fri, 12 Jun 2026 09:28:13 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm26830975ad.12.2026.06.12.09.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:28:13 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 12 Jun 2026 09:25:58 -0700
Subject: [PATCH net-next v3 2/4] udmabuf: emit one sg entry per pinned
 folio
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-tcpdm-large-niovs-v3-2-a3b693e76fcb@meta.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
In-Reply-To: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
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

