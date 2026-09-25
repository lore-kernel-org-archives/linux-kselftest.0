Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3D4C9E18
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352729; cv=none; b=i0HeckbIcv3UqbJg7c5YC47r5L8InDhdWc5oIcR0C3LWD3ol4mpB3fNsl0Qg/nEHqZpqmJR0XORyqx9vjyRxvra08zKj0vjSyY7vKztr7KIS+cVe7TFgn81o2E2vVva7HoVMLDWwB2hrDuZAm6tRTTup6XfT9oWfLnSfyyTK74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352729; c=relaxed/simple;
	bh=WGq2HRYeziGGP8jxJ0+hdrLjQktzzJ7M9H08pWduDg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYM3wxfZRTVS3V7jYiD8l4Q/CstcjgiAWCIJKHJWxcuobxiH/ZAPy9H4cZ4Edr0lDFRNGa1bO/hXCq8IUX8lInM8jUNMmumY08nhv99+j8geSWpHZeYpjoaQOXhZY5Sp9cosPf9IFGHcWbyY2IfQtLTij3je+RX2f/X0QaL7rEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP9dmbOh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP9dmbOh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5310155e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352724; x=1790957524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zAdqXxvKpdaLjEa5r1LYZ4puNr9pTrnan0b9GFEiEg=;
        b=eP9dmbOhsBBiYIRpY0Hm1ya9DMSQ1gWuGeLizSoi4xfXcFNdzSavnMoJgxo5VRxeos
         kSLMgX5RNKwV8oCdxFyhlKy7pgWGdLFXkFKcPhFEYhJ1znLVpVg00pGySxogQiRPLWGA
         V6MSt1OVI2haq/PCFcVjVa1aJ1bM9YhYqNEC+TZzDftx9/HbjkOTdRWQ0/IxbTzE2ViF
         eESxiz7yzwEq/smAaOAnex4IDbSXeKXh1AiQ2dORx0ZCtJIViBDI4zxH4J3tqlUaQaTk
         94eiP5REKQRSHmenCitT1RF5pCOxR8JM+h8XU0OaikOFjXg83yB/8LTtk0HS8GJ/hGRj
         5/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352724; x=1790957524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zAdqXxvKpdaLjEa5r1LYZ4puNr9pTrnan0b9GFEiEg=;
        b=brXs9qtcOGWKGP3GVExphAmu+fj1dz0U/1elOZxSAOjlkV/8W3cX8GAB9XaoOzvSYt
         ET7fAcb5lF4IxwgPEhSVl2b3Cyaq1U/GfxL/zt+ocM+pwsxzFAavNWeYHR3lwijfmmbm
         RF57bcU8WYrzrQpeN+U9tYNzrw6R05hVc/LYFq7BAbsy3xDxfhMJeCf7ld/DZ+9joqI3
         /kA2VGod9IrHtrRI4+UdHgu1g4gcA4GIWjD54ouiCJNmFhDpnwtz3EM9WunSUWsnF/UD
         uiEcKHAPQWzWcb87b6T9rPtE9Kn6cSVcM8L/bZ+phRZ9nl4enZAHvyCrO1lCPIL4sPR1
         k6MA==
X-Forwarded-Encrypted: i=1; AKwUvByBvzl61bZVGVIAdKbVapoEWf8cuEqBDAvrFfuSllTwpS989DnnjBW0ubq2KJwIu1RJ9bAU18a8I3gd9YHNuSo=@vger.kernel.org
X-Gm-Message-State: AFuF++kOMXSkgZ+7/jqZadQJYDvz9YI3sC3hh9OmgLoNH59d95C3sP8k
	ATJWI6Ne2UVK+2DVWCVLKyGSZXxDm+CpkbFXFRE31GuA9b/Boa1CG67G
X-Gm-Gg: AYBFou2/TzYQAcOf1wODpgWwC1ZJ2UK8x7rhiqMtDMFaqlZ02y9MC/laSVWBFC3N6zh
	M92geqbZBClrtOJriCunBZoeP+Q/ADH4ur5ANXZfMrNKyt4L2tUsKZ8EyqGjI14fXl3q66F5Zna
	a4dZTy4z8EpIVrQMprR5YuzZikvoohjfpwTSeSeilwJLvbOE4lJ/fDbDP+onLi882U05zwPjcnj
	pErvghr0wRTWtmqHfG2eR2Df9WiLXAiQpULsh4UcMSpouf8q9lN5j6cJTOtPC3CjQFLTfcvDPC6
	UPaRfUZ8IkyyoWcGB1ulKxBhe741tb3te0L8i+Qn5VAnkBHFilmK+IQmzj1N3gVa1FWGwxeMMYp
	njm0qA3yy8BEy8kK/vdlcj2lMjUyOKfTHL/q6fXK/y3BpdYjhpfCd/U+a5hRA3u2F9XZ5ExPZkC
	pgvTsNvbWRkihkF9+WZX0x2DLZXdsRwdI3G9s8pBnDmEq/uno5SqFSXC1tCZGSVIS1+rYzcWEe0
	7F6/NYQcNGbz5Nc7JZ4v1Ip508Hv2GHY1Va6O72/tVi
X-Received: by 2002:a05:600c:6206:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49ff06e6be0mr45983515e9.22.1790352723909;
        Fri, 25 Sep 2026 09:12:03 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:03 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] iommufd/selftest: Test dirty bitmap recording past the query
Date: Fri, 25 Sep 2026 18:11:38 +0200
Message-ID: <20260925161142.189813-3-parri.andrea@gmail.com>
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

Add a dirty-tracking test that dirties a huge IOPTE and queries only part
of it, with a guard placed after an exactly sized bitmap.

The test maps hugetlb-backed memory, allocates a MOCK_IOMMUPT_HUGE
dirty-tracking HWPT, and dirties the first 1M IOPTE.  It then queries a
128K window at the mock 2K page size, so the request covers 64 bits while
the tracker records 512.  A guard follows the one-u64 bitmap in the same
pinned page.

Without the clip in iova_bitmap_set(), the kernel sets 56 bytes past the
bitmap and the guard check fails:

  # iommufd.c:2470:get_dirty_bitmap_overrun:Expected 0xaaaaaaaaaaaaaaaaULL (12297829382473034410) == bitmap[bitmap_words + i] (18446744073709551615)
  #          FAIL  iommufd_dirty_tracking.domain_dirty64M_huge.get_dirty_bitmap_overrun

With the fix the guard stays intact.  The test runs only on the *_huge
variants and skips the rest.  Tested on x86-64 under virtme-ng with
CONFIG_IOMMUFD_TEST=y and hugepages=128 on the kernel command line; the
whole iommufd_dirty_tracking fixture reports PASSED: 63/63, the seven
skips being this test on the non-huge variants.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 tools/testing/selftests/iommu/iommufd.c | 49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 44193d171ba98..47d861b3bdd7b 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2423,6 +2423,55 @@ TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_no_clear)
 	test_ioctl_destroy(hwpt_id);
 }
 
+TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_overrun)
+{
+	uint32_t ioas_id = self->ioas_id;
+	uint32_t hwpt_id;
+	size_t nbits = 64;
+	size_t query_len = nbits * self->page_size;
+	__u64 *bitmap = self->bitmap;
+	size_t bitmap_words =
+		DIV_ROUND_UP(nbits, BITS_PER_BYTE * sizeof(*bitmap));
+	__u64 set = 1;
+	__u64 nr_dirty;
+	size_t i;
+
+	if (!variant->hugepages)
+		SKIP(return, "test requires a huge IOPTE");
+
+	/* The canary sits in the same pinned page, right after the bitmap. */
+	memset(bitmap, 0, (bitmap_words + 8) * sizeof(*bitmap));
+	for (i = 0; i < 8; i++)
+		bitmap[bitmap_words + i] = 0xaaaaaaaaaaaaaaaaULL;
+
+	test_ioctl_ioas_map_fixed_id(ioas_id, self->buffer,
+				     variant->buffer_size, MOCK_APERTURE_START);
+	test_cmd_hwpt_alloc_iommupt(self->idev_id, ioas_id,
+				    IOMMU_HWPT_ALLOC_DIRTY_TRACKING,
+				    MOCK_IOMMUPT_HUGE, &hwpt_id);
+	test_cmd_set_dirty_tracking(hwpt_id, true);
+
+	/* Dirty the whole first huge IOPTE */
+	test_cmd_mock_domain_set_dirty(self->fd, hwpt_id, MOCK_HUGE_PAGE_SIZE,
+				       MOCK_APERTURE_START, MOCK_HUGE_PAGE_SIZE,
+				       &set, &nr_dirty);
+	ASSERT_EQ(1, nr_dirty);
+
+	/* Query only part of it */
+	test_cmd_get_dirty_bitmap(self->fd, hwpt_id, query_len,
+				  MOCK_APERTURE_START, self->page_size, bitmap,
+				  0);
+
+	/* The queried window is dirty */
+	ASSERT_EQ(~0ULL, bitmap[0]);
+
+	/* Bits past the queried bitmap must not be set */
+	for (i = 0; i < 8; i++)
+		ASSERT_EQ(0xaaaaaaaaaaaaaaaaULL, bitmap[bitmap_words + i]);
+
+	test_ioctl_destroy(hwpt_id);
+}
+
 /* VFIO compatibility IOCTLs */
 
 TEST_F(iommufd, simple_ioctls)
-- 
2.53.0

