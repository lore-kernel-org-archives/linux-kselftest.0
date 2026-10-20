Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478311;
	b=vlwg9iJrh7zJOXWroiSg4N50/f4ZayHdtoyDWCWv3HFicXVOHOepi9eueDYZBRJjftLv
	 46tRXWBn64ko6dWptXYRBQz3oQ6jOTbFDjECm6oEIW0/S15trE7wAuRXIy0NiZF2B4OUt
	 eGvj1s4z1slzVA33JrZPVXM3DNPubAswy57YOCzaqe67bUGF2ndY9UjmSPzTdtGf9rh/F
	 S7/QZFhPsr7dDFZvrgcRoGspZEZZQI7cZqawSPwWiE+CB1YtxpBZ3KILKVUsLYmUCXfHd
	 Q7hk22pl7nCFD/tb55M0BXEe4KP0EPU18KRlevpsqja5pe7Koc/IJXzt8z9zbiEtX1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
	b=OOBBHH4gnywMWN0Ta+LtzfZBKY2G3iSvc8ZxAp7RJ24E1J144bASqxVzujI8DUDjM0O3
	 ya1QRbUavYN5HIaLc+1JoCkKiwlsS4Bk+QHAUFIvLUi3tbf6pTQmLgzgbMhLZ2+t2wzp/
	 HHpKBHF5shYAbWuWIkiNCCMYZyhwYPcT7u4o/awxbXunnjHslNOP5hkXydjAC6yIsZ92i
	 yG1blbRDhK7EBlg4po6UDLXrrMy3H1Y8LwKKgbwmpYkS2otXIwc6xqWKAaesXQRgPzI0n
	 0BoaiDXrx9HkZAcMXfybfHqmFylX6P4xVrYjKQCbOQgcLoe/cAs5kmuLriEqlAqBpNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA260A2616
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCA260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d885929so2135471f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478309; x=1793083109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=JT4YDfD0Aw5+5dvdOGL1aJEX9vUX55vIr0W7wrSg0hkHHU+y7g+VR1R5WGzVJVmerg
         84Os19N7kJt4mYuIyB1OsurnEfrJwgh0cRpXti8bgCAfWE6CRrQRTSTwd63oTfx56HYf
         kIue6b47gLPi4YGFC2XTmQKoP2YG7eiDJUf11dPqm6XtEuyC51+Xg4Wz9FNZs1ceil5g
         t3aXkRTU8hWZQ0A0pWwEmD8pbM+JgNbIFJkQBdPCzW+Ni3yZ6b9/IwVIKBnmSaX0nptD
         v4/wqpQvM6kskNnN/qS/Xz23Nv89QoBOXfR74JxF9LKxgIC+xo4chsPOm2Xab+kt6ftA
         5y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478309; x=1793083109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=Rm8MVQM1dVyPIl6zqb1mZeIVXmelhbJrS+wBVxnfY9lswZmV0Sap56tc0yStmWPxES
         QC21/wxGLjnw3JHXeekzGScURhxZqKV1x+K4KTS0zNk24tTfMm2Nk93pMN+M5yM5CosS
         WdXVaB7N6v/QSrpEj7+leT2n7aB16ta7EiVCoatnXBpXkol2GxmpKFnbuiuPx3MHrGMA
         iYTIOVR6L91urLSYosBxpIgjalFiuhWwntcdzmfxQ30CJAEKsL+ATs5LaJgk9nyH006b
         bIsbjJkJVZa0BANySLpppB+KbH7gxTioJSt0sZ0avr32lF/B7MQGdjfRo/RHnh5AdDMG
         Z7Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxarvVE349WmeV7Mj/J6RtmIcRB+8DFolLRBGKzn4+UAfk36KufE5ppHwb9XYV+XXwxj59IDmN3Nj7yWc8CuxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAlKQthrlSrxp6QLYXUOHfWQA3qQOxeCCfUPdQwks1poCrC0bt
	Tffqgo3xWOpdjmYW+Ag35LSz6HBKMh4aCdZ4zPMtpGGmvpd55I/7sdio
X-Gm-Gg: AYBFou3CgRdh+uE+k9sEMD6xQPZvra3/8Kxd2HskYGFuGklHtPjYps9H/+DpnojceMI
	xPrLHZ8GU+lJszrbxEcxKwrSGqamaK6V4wYcp6t5e3By5xw+YetPlaL8NeSoh5HoHuzmrj/5Vui
	9FfOZQQsWXK8bpQvIfGs7YvgyQRTj1vg4LTc06cV2nMLNSdj9OJcpvHJzyVWOdfTAmUtKRv1qmm
	BklIPgbMri7sbT3AQWkNZ/aC2F2EuPqULnbdM0kXgozWBeihxU0PJY8srdl5Q3WTYK9IVg0Smwi
	0si4q563O7ATIDwq0cwoOcQHRplTYB1hyOz3tPbIYcJAb6/i2BYKPr7v4BvE/JZD1rkod8Mv8m4
	FOdAx6M8W4aXUgRZW3KnDQd9J9E6VqkCv3MVFztXUxhWGKXZOp5Uum07ssjsqZeacIppdGflqH1
	V0SZq3EpIp1N5gKkO2f1oYeovaEMKVve6LP5Kv9zwRGm32MYHsoOtumcUy0qcB5Gixcsc4N95w2
	PxFUu/s/oLac/b4jLz/8UZg8Ynau68oKhraPtRmgikjf02aQPJMb5lFd5r9mYjXI7goQhMP+ykB
	va2Sv6rlCysnZzyhSQMWwUWyRguyMiHoHvqJ2Wh7xAz+NYeK/Dx7/Qhex1FIPf337MxVoHNKFyJ
	tOw==
X-Received: by 2002:a05:6000:400f:b0:48e:d88:55e5 with SMTP id ffacd0b85a97d-48e0d885ae8mr18682745f8f.6.1792478308630;
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
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
Subject: [RFC PATCH 3/6] iommufd: Clear the PAL list before dropping resv
Date: Tue, 20 Oct 2026 08:37:42 +0200
Message-Id: <65a7be483aa5e374e0afd4d72cbafab0fd07a4a3.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() frees the PAL physical list while holding resv but
leaves exp_phys pointing to it. Between the reservation unlock and
dma_buf_detach(), an invalidation can see that pointer and unmap the same
list again.

Clear exp_phys before dropping resv so a later invalidation sees that
there is no live PAL mapping.

Link: https://lore.kernel.org/r/20261016194022.62065-1-kmehltretter@gmail.com/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9e9bc6a1c..76d8803d6 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1674,9 +1674,11 @@ void iopt_release_pages(struct kref *kref)
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
 		dma_resv_lock(dmabuf->resv, NULL);
-		if (pages->dmabuf.exp_phys)
+		if (pages->dmabuf.exp_phys) {
 			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
 					       pages->dmabuf.exp_phys);
+			pages->dmabuf.exp_phys = NULL;
+		}
 		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_unpin(pages->dmabuf.attach);
-- 
2.39.5 (Apple Git-154)

