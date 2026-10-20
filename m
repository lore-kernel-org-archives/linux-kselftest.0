Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478300;
	b=Toiy/sswedyCd9rFZuWvLQGru1dnefuvXdbj0FLY1hdEzKzmYktP4Sx60o8Dgn2GVX6N
	 G4levC1dewMcrKC+haZ1+kgkJ1oIJm9sMC/asGBWXZXthPV5veDFF8ZErKGR1tK+B1Ave
	 +zDi6ATRHTwmvHaE/E2pB4Sxw+Iy2a2/52e2lkgzPAx5aZT+/7dvTwvnNxu0vfDAEU9p+
	 t2iJKESP4FieV3kC1jNJeU2Mx8/KNNQjUAqgbycwkg2oQo+KB8m54GrtFrJDQq9EV/Ycw
	 zrLe8quAECi5qywV9fSQzsv+RPG5+TeoG6mzpwiIMk7BqiMEfU0DFiboBjDlbijBtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
	b=Z25hXrE2IvhoOPFihiho26xt7Y1Rr6IoT8GNytqBYmYDFk+tYOkysbgW6y7j0JqWl0dH
	 M8YcpjPWPQrP8U19iej8eQop35IKbvMNuvhsAboKTGb9m1kw3vZNyrJr10ScfO4Qou6b/
	 YHuBmLv6x02hptoCUfsJn6rct2beetIhdBSmJY6YATU4h476YGBuGE/E9xR5BbekNTJY7
	 kr2KBkl+hcoPXMwjj7IK3vTR6MJRrtirPkQ/UHottTEkIe9FWE1QnL5LdXnxO+7Hqm6Fg
	 /HFQ5xlznNVqtyRXkCSv3Q8lcGDUy0bp/dIwej0nfQmOPyz0GypoQTA8vGnKyqwr4SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A4606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e011d370dso2313534f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478299; x=1793083099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=QaGhlh+qQ+oivF5NfN36r2CTE+g/j1KuWE6VhvG8SpnMY7oKim0rNol7iJgN+tE4q+
         MVlQpnipcyxlqpwmar/PD2chWtmknUqsiFTkO95BEUKl+W+bmK7z+5Ejvn3Knxol0zJW
         +H7W8MM0hXObP7E+nRMiN/x3VU2/SMm9MnXUrpLB75C0uA/gHT7Gt/AUhm+yDZ7Ras+0
         ZK9TXDLd2/cWIECm6xd0LZX4E6isxEz2x6c7pyJ8X+r11X822uKwIxtxpdTR7SkeL8X8
         DEbKf83bpzYLaXDwQuA0Mo9CX1RlYqnWWXfj9IhXu3zsR3klycLE/+CSjcazcoPtDdFB
         Z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478299; x=1793083099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=NMr9PjBpSzVwsgtn2SFAapNlohbbT3Lj6eTENJXGF6LoxGnyYgKVE+/SW9Key7DN66
         nHR6g9/ewsZUHjEQ5jAMtrZPu+2goOJZi5zz+I5Pxuy1IwOrWHsC868cjOyu0fabVGuQ
         XCPe7MAjXPhLzkgCkUgjHDuX4mBOLm/DluQQJ/10UujNZs+Kmw7KcTKzrfhWjecKz659
         HrCa7n3fNK85yndMir+YzfeQ29WZEoTrKHcEY/v0r/ZzoVa6sEMnOjtQV5UdAlescrkQ
         Q/96qQC3N2veCyIwfZCZ65OY9WJM9SpYywasuI8Ycx6Q/QBz/KA7Nbs5uRbovJEk+fhx
         qEkg==
X-Forwarded-Encrypted: i=1; AKwUvBz6gk48ygXPJ0Lc5WyVp4obZn9wqPlfkc/opHvdAf57o+kS1V0tiozg5Ce6dHmQaNuLbdHGzxb6nEwWHDRzvCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbvX9fJGKLlpeWqwCtY5xm9XvA7/IKorfiTBrVVw6+qma7YQTb
	fIQD7CpMtNl7/yrAtKd2pTmuw86QubJQfTnXdzVw4KM1cNgR0LUJ1Sox
X-Gm-Gg: AYBFou3mhSsyp/tvq0Nl3Yz5KCK/112zWTNi37pgCwdOHS2ph7Xqw5fkqtsaYuyVgBq
	c8X+MwbXt6iNUQRUiBxY3pY4DBUe9yMaAzbEJ5GMJBGjBkUKbEu5DbKxq1ihExlgfuRF/lHe7NG
	FreNgat6ykkFA6LtKUrWrqHypKXALJQ4Mqa9dcDTggb+mFgm8DwR4oHpjPBhc8d2mn/wUcYGW5V
	jBMPMak3qn+dvH5rg2tTc5uoUliz5n0xfvkvyEdKLCSxHSyw8WDS25n0/YvT7utCBkZ7FAcnW5z
	UqffThsOKD7ISQqn2KppIG7dNBI9laST04jcYse+SPk7Gzf7MtzwNHWxM88Zw7ASVmtvh+1A99W
	z2Iv5KdDloH7AIWdnRJ3S8W3Xr8XtiEfzwEWzxy+pvcQkHIm8d02S2L2uMw7cPJQJx3rOMMUf0+
	l5YY1kPTfNPCD0BKc2bMarLD6DXS6fGInffVPGSHdZyYtZAQ8fMI/t6MqCxzThv2YRTQKoSLWyn
	K+BO/KvWP6MO7DRFpzjLbRAjjYwG8rL2CTOXg+pPgFiOckP0ORetE4s/rY2tMsKE+GYdsRFa8wH
	L3afLRw5ESsw4399nI5mR6rY356RNa6yHrp9lFu06v3fZ0DmxPGb9L24UFMfHZV+XAkkMkbmKOF
	LGYtIilRNyzeq
X-Received: by 2002:a05:6000:4694:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-48e07fb6991mr13514200f8f.52.1792478298615;
        Mon, 19 Oct 2026 23:38:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:17 -0700 (PDT)
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
Subject: [RFC PATCH 1/6] iommufd: Preserve DMA-buf pin errors
Date: Tue, 20 Oct 2026 08:37:40 +0200
Message-Id: <9a3912ce01cfd1205daeb13b57de47aa8f27f076.1792477872.git.kmehltretter@gmail.com>
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

If dma_buf_pin() fails, iopt_map_dmabuf() replaces its error with
PTR_ERR(pages->dmabuf.exp_phys). The newly allocated pages object still
has a NULL exp_phys, so the function detaches and returns zero. Its
caller then accepts a DMA-buf pages object with no attachment.

Keep the error returned by dma_buf_pin() when unwinding the attachment.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 98c2a8027..0b32c65af 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1510,10 +1510,8 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	}
 
 	rc = dma_buf_pin(attach);
-	if (rc) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	if (rc)
 		goto err_detach;
-	}
 
 	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
 	if (IS_ERR(pages->dmabuf.exp_phys)) {
-- 
2.39.5 (Apple Git-154)

