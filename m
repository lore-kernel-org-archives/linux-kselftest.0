Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488329;
	b=K9qo47hUZicbwE+3ZwbLvsjuKk7cIpmvq+cR5dVvXrgF3UYgzkscTqMTl3Z28n6bzVYH
	 VonlSQI8Xo6wPAYqO3wZPEmNbPNgVZeuOMu1RIcCV3BbawFixIYHXmSwuYzLlLDHuWISt
	 ubY76qTPjDA3qcJLYXzDwYLXjbVbQqH2EpjKHvrMaDMbBimU5bnt45Aec26PP2Nb+DwlF
	 dFMHuKTp1IvZLY+EiDZ7r3ApkU7XRhnYwGj2ck260BIWDcz8GoC4JqXK1HJFJg3MCcRrT
	 oCL3Dk8ZA1X0nQmJ7EwPLK8BKUhXuO8C/erVLpxvLjMLTeqtZKK/AzZXylkLgds8mzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488329;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=vuMUxPysB/1urRDiZMBo6ZFDyIl3iyp8gh63KhQA1W8=;
	b=4t0P8dqpVfsJwzURixhlih2geM3ig7WUuJW8Kl+lrBzfAyC1FM1nlufcM93g3VZO/7oX
	 bWn3YYGhdP2ysDSIFlfcx/EwSlYPXqyErR9LSzYnmrU3nn9PVJ4Hlbakyy/nTADEC+JN6
	 trTMh48lOrpkJyIj0TxdRg0gjP+vnDTPBRKjTrCbIUDZTWE37tAXnN719oqSbJxTOS1u/
	 /CYdrl601YjFmaplRSdP8HOHHMwHQCyAN+BRcNB4no5y/vvf1b20JiNvAh89CexKDEnls
	 1WMwJly2OxpHNDKUlpgu+CTjzWZadXZti5qHNWzSkJw2HiOmts9M5Egl6zbEsRGP8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ldjmdt9G;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (unknown [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FCE606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 02:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4FCE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ldjmdt9G
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=avW9nH3puyO3JSpJgGfK8ZUUD/Us802ZWqb3w8fnLEU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795488326; v=1; x=1796093126;
 b=Ldjmdt9G7Pu1ZfKRL33KgKlGxWvBCapE4tZSfH4YMJnXqhrG7P1Ug3U44qADK0pJKahh01x8
 xABCGBhVvn01Hh2qc8ePmeaIrZgwSlZ/Xp+xYLmT9B18wncSL9W1kcTD3ByOR3mXR2JwBO1vTE0
 806wg3ZOOR3iZZEdodeeqXcs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0b85e04eba94820c;
	Tue, 24 Nov 2026 02:45:25 +0000
X-Mizu-Trace-ID: 0b85e04eba94820c
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 23 Nov 2026 21:45:00 -0500
Subject: [PATCH v2 1/3] dma-buf: align large mappings to PMD boundaries
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Philip Yang <Philip.Yang@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>, 
 Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.13.0

A dma-buf exporter whose buffer is backed by physically contiguous memory
can map it with PMDs from a ->huge_fault() handler, which only works where
the user address and the buffer offset are aligned alike to PMD_SIZE.

dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
whatever page aligned address the default allocator returns. A 4 GiB
udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
its PMD-sized ranges can be mapped with a PMD.

Use thp_get_unmapped_area(), as filesystems that support huge mappings
do. It aligns a mapping that covers at least one whole PMD to the buffer
offset and leaves smaller mappings where they would be placed anyway.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5c6957f8839a8..015a03c8d04db 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -608,6 +608,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
+	.get_unmapped_area = thp_get_unmapped_area,
 	.llseek		= dma_buf_llseek,
 	.poll		= dma_buf_poll,
 	.unlocked_ioctl	= dma_buf_ioctl,

-- 
2.43.0

