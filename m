Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9674E8DF6
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352730; cv=none; b=VKNz15kQHwI+mTh4y3liuap+dZ7hoaorys4JpH3km9y3Z2EeVNQWsqKIYdh/uUIXHd2s0SsWCEw6hhoCyvXul/yZWKV/EhYV+YcgytlndcDLE19Apo0+ap6RNZYCpSq6bMVHIaNrEpsylxZrJeLrhfobghgsW43tR8MaF3DbWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352730; c=relaxed/simple;
	bh=HUOnEjhv9fKfLJ0A1Oqzk39EMDsr2o/axxVNv8d3j7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U56q3w5V/ajuyhexM0677S0dFHu89ISaaB2iVH+BJEEtHhw9ZrQUHzRuy1Kbpfz49JHmxoj4VBORfGc31zU05n0UsqWYWm6bgGq8ShkYdMGjnDOIeX2t5xeoezhu0Muwt+2WGENRn3Tu+jTeVj73BRTSwNz0QMznKE+6/sFnQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UViyKs86; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UViyKs86"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so870231f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352726; x=1790957526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwRzATKx4Uz1l0MN7TD0eqrZoKpNRRbzLuIcmEq8eCI=;
        b=UViyKs86byAvX3X8cvTrCondGaaXUiI4M7tEgiAVTJxv60WiikuyjxRyhO2p9rc2i/
         6qprZ7GqPwTr3PuIJ6Wa4HyRQaMcHNWR5M4MHq3UiXE8rB0IXj6yUV7Kx09yNoVI0BRx
         tzOQE6fcWtlxgjdGqW17/5r6M4N3+izQslkCoiSdEZ1BjZUyj/LXfHfuIs3kxu77/lhY
         1jvu4v/34P7qoOyX/GkncXOKFBGi80NZ9R1zM8BUezgjvg86p+t6DIBKiHyEQUhs4qO4
         M1s/UGqzpCj+EZW+xajUKgkqTltCFdLSYqZjA76gmYNedicJ9z3RZZTIIaOiiE9mM7UP
         1TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352726; x=1790957526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwRzATKx4Uz1l0MN7TD0eqrZoKpNRRbzLuIcmEq8eCI=;
        b=wmpZIxML4Q7H+nYt3W9bSGkbdKers+IaoyLxgVI9IRhCOAfiVnAC7b7KV23IaoMY0G
         IuQL2fTtCXkeXz6ybbailfKWi3NsFiPBbKx+qOLMqE/UmWmPf/Uu/5ov7j/+RHziAO7Z
         E2bx1p8YrO9fYRx7y2XyI/RzobHCp1obaG8G7hMNJTNzMI9xV9CtMkBq9BgJ4sD6pIln
         cJ6DC+WstXO8Z7tHKS+KSdC7lT5oRkQmDoKdT5pEHcs9xq0PA3d534zcWIhHMeuvqS0P
         0s3G/DAlOMFhzmuI44PsfquVPYcDmf6bnkkqnExSU+VKhtsp0cVrCMbwj/spNGXUdvSw
         dFQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh+944s/DyYpVVi5vZrgYTXIr93j3KwsjtaPSJvABrPBxr+mH7rOse1B0JLJlQtbozwBAtGZfUUxhG0FPMht0=@vger.kernel.org
X-Gm-Message-State: AFuF++nKaxExg6Cf5LVZ7eFTVvWfqp1nertIgFGt+dIhdwSgvSDnvIjP
	bDoITko1UEhLxDWrICOQZHL2buO/rH+LOizXEvWNAtrsQGgdba47lNsm
X-Gm-Gg: AYBFou1k1OTUJG3bLJ9Th49G22tovi48PyAetZPogOthwu63hdzImEy3LkH0a2IRhk8
	QgHuZZ+ka/XZOU3lZyrzJzofF5jdgd7DBjryp0T3MkTcgPD/HG/UlC0Mc+6RnRz3E5RdA/Cv3bx
	ezPooMGi4dIo93sIQgSCyW/Su5l5kT8Sx2qCTtNNmdQUVKxP+omVWGddlrEGnTVlL9gTlHkufR2
	FuLRruTNY2beKxW8w/KGOaKwTI6WbeTQTEzD2NftmGMPE3DxpsDYVRZG8TvTZflGCw2Ml/8L5wk
	M/wzt9B0jshgMlqVofQ0J1p0+jHakC9rive1pbtTxbsMbC4w013ODBeIImiMLs+TH5RaZkXdHex
	pmKI1W+VCNB8MZ2QWgh+PPiak/6okXQ93mbjuIhKm5lO4qZFalrsAZQ/Tv8YX+ekj8E/NeezZQz
	czc3JuF45oKT8AfWnG/kp2LA2yGBX8J2z2MMClvwwSKpcqmd9V1Fxa6/Bxs5xNwtE4XT78nI6ze
	eyTk3BDG/HzE0ik4KQiekY6/aLw+4xCXUEUNTlxCDFK
X-Received: by 2002:a05:600c:4f12:b0:49f:e194:a062 with SMTP id 5b1f17b1804b1-49fe66fc6b7mr130556485e9.32.1790352725963;
        Fri, 25 Sep 2026 09:12:05 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:05 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Alex Williamson <alex@shazbot.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/4] iommufd: Reject a zero-length dirty bitmap request
Date: Fri, 25 Sep 2026 18:11:39 +0200
Message-ID: <20260925161142.189813-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161142.189813-1-parri.andrea@gmail.com>
References: <20260925161142.189813-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iommufd_check_iova_range() subtracts one from bitmap->length before it
checks the length, so a zero-length request wraps to SIZE_MAX.  With
iova = 0 the wrapped value passes the overflow and alignment checks, and
the request reaches iova_bitmap_alloc() with length 0.

iova_bitmap_alloc() then sizes the bitmap from a length - 1 of SIZE_MAX,
so mapped_total_index is effectively unbounded.  The scan uses
last_iova = ULONG_MAX, which spans the whole IOAS when an area is mapped
at IOVA 0.  Reject a zero length before the subtraction.

Fixes: b9a60d6f850e ("iommufd: Add IOMMU_HWPT_GET_DIRTY_BITMAP")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 drivers/iommu/iommufd/io_pagetable.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 4e447ce74cf6c..283ab372e8da8 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -605,6 +605,9 @@ int iommufd_check_iova_range(struct io_pagetable *iopt,
 	size_t iommu_pgsize = iopt->iova_alignment;
 	u64 last_iova;
 
+	if (!bitmap->length)
+		return -EINVAL;
+
 	if (check_add_overflow(bitmap->iova, bitmap->length - 1, &last_iova))
 		return -EOVERFLOW;
 
-- 
2.53.0

