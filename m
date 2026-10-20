Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478319;
	b=od4tJaPhvZOwCKixoyBRtYHkFQMYR06z4ke4+xUv22wqB5qqv7Ps/UwlJSxSl7f8cGy/
	 tm2qIhI34xNFiJ9LVzAn3h4kSZpU+UIqW/OEHGpUnqtHqM7HHQnEen+/uAz1eLMf8yT25
	 uUASSZsUeOy28AW+Ulwb58kqViBo6qmFxaZS8f9rrdlnl3HFXMZdxUN4q03b2fT/OIr3A
	 c5w5f7xMGXw54TzY1HrFOoFGr4uF1gxzLk7kEqZYGjI7/pakfgPE+r726n7yNxt5e1uqA
	 HAldf5y9nVBMBdnJxQ2v5UC42XtpzdoKH/rBHVb9ZiqDLnqI2oW5tHnxPjZI+8GL/MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
	b=QnBJkrHZTbd8HOfHNE0AewmQH5dYKLTJLTCPNN1RQZ+RePJnXMFtsF+SkSepajTZHuQh
	 Bemv8KjjniQ2jEb51ub8XoNI0d+TuSt7+UNgtblt8kx3GAEhRT0XRdvin0je20KJfh0KU
	 7Xtk/rPvqdgmPYNDP9O/50yWE1wjPOJFcVv1zZLz4VA6rAKTqmtSwlnMEiG6p1y8k+ItH
	 9YQinRkp3tWt8tnJUKWGGg5/4oKNJdwouMU4YI8KUn+/XoFtY8WdC3A7Ungto4CAWwlri
	 CltvHZAFk2lOgZv8Xf6MDSg9Jcy59VdNzdDq50VPR+baAA5Q57VsHzSXtKNqazz4eeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3E60A3802
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E3E60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so2123117f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478317; x=1793083117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=pS8kdSPy43DQfSfmrUcM5VFUf9OlClZrNUXcN/e0h1+S0RUX2sJz9PZGM8U2PqYoxN
         9QJz98WzW2TzxAZWvsrUMvE9tepekQQ7ZAxQ1+qc/cOBlAYOoY2ZQ+4CoMikujb4+HRD
         eyaRErWZkTvXVCC4HPqasa2prlH18HUfnW+HkDsiOOsp27uSuvYXvNwseErMTWfctodc
         9ylpmG+wzgYJkeJGgJ84SKnQTIddTyG37odV9XIG4ay3yatBFwB6T+OKjTbKYyeK4fkF
         agtB6573z9ImSvuxQSEmwlalfrhwTVlSvgP6hd/4MEfj9aiKEkw1+DoHkyCph9ZQ37gb
         Gvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478317; x=1793083117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=wuAsPQTlLEmFKF7srA/EqfnFR8+2xzcgfN3/z7J2t06pC6HYKEf9zEJFH2vPE3g4W5
         ircL40P5T0dgMk6Eu0k4BVdojY0FLbevJCrMyFVgLHsuhHzbL9szzOb3J7ScvvGCjt8R
         ogB0hsmMNxse2WjZz5bucwukjZy+ELX8TKlXkVcQWGuyxF03Y5k0zmOjD3q56N6zhd+u
         bfaJ9PJiQIQZRrzN1rUyf0rKlS+61RUrGBA/ffQHkqAOyySFOboiJ+Rxdt+12Px8rj7N
         vClJQinDlu3kZTtpsljn+OeVqROI9USFFpVQqZhxXOOsUue61G6A25YP2dVrwN9Axkre
         VnXw==
X-Forwarded-Encrypted: i=1; AKwUvBz0W96njvXonSRolb9PCYf3Dx0xyt/3S05EOD8hVwPePx7CDad/YktRY1+4jS4WC4MGHyQxAN3MClJcEqTKPnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXpN3OGSdizXSeTU7oTsT/1oaMxfFg4Td/ThsysAHMYw0myCzh
	iUvMf6npGmVnfOfYTQTyl3z5+CnN6D/X3J9xV2RjfuYF0PzyC9Y9qrKZ
X-Gm-Gg: AYBFou2i0zRxsxfOkaAjPU2wj/VEXg/jLJWq/rZSn31l3aTC2B/b9SElSgm71jZfvsb
	rCrpZ+2eCjAqrtbUxAXO91YWbw4rJhRF0mbEA0kDWA7eGwh6fnswFSbVGBJ70laWDE8oiTDKRtg
	/ttDQBOCBHG7jjmc2HqCEY9NcPqPL7CkMKonAT2xeyghV/XhAXelEd1HvrioPUfO57VJI3PVyCm
	JzzhLdSdu72xxAet9Sa3ud3zwzXnZPbWCnI3uhcsgeonJf3gSyz7ay5jM+g0hjEINdOkaYOh/MO
	dUbueH6TpnRNUpflgSPBwFxN/XvqirWaeMrbTj6RExWiWXm/Tgo1zxi6VmonimZztfcY5rQNKDG
	EemU9WNjJP6a+ckLNMfVWc6N5LI5jMLavvNHohDFC0eQZfB+ahf5KC/LfRrKWrr5IizhFSt8HcT
	nse2i6EnN4xFvk0SUrPgKMSlJzTow7npPMGjQfOpyQibFPDIEwfrygdW97qu4aLc4XsHeCjro4u
	axovouPJWsz/OlrZu0kHZpAs52xa7I36f/ZWnahggK/cgZTJ1uU3oGx8f5poNAa8WR+Fs/cxykU
	pIlf3Ixqx18P7XSmobtBtf8iZMRvoUUu9KlG1bsDu8GfTDvLBHnN8QubXd2eZCYyf6GpHK4xFgM
	6gg==
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e0d27c1f4mr17275309f8f.2.1792478316869;
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
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
Subject: [RFC PATCH 5/6] iommufd: Unpin the DMA-buf while holding resv
Date: Tue, 20 Oct 2026 08:37:44 +0200
Message-Id: <3ca8c42d7a597658329e77a8af92aa294f0dc4e1.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() calls dma_buf_unpin() after releasing the DMA-buf
reservation lock. The unpin interface requires the reservation to be
held while it invokes the exporter callback.

Move the unpin into the reservation critical section used to release
the PAL physical list.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 59ee68a1a..85004a936 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1678,9 +1678,8 @@ void iopt_release_pages(struct kref *kref)
 					       pages->dmabuf.exp_phys);
 			pages->dmabuf.exp_phys = NULL;
 		}
-		dma_resv_unlock(dmabuf->resv);
-
 		dma_buf_unpin(pages->dmabuf.attach);
+		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
-- 
2.39.5 (Apple Git-154)

