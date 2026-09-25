Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2C4D2EFB
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352721; cv=none; b=trPU4h4xrBmJdRVU1m0vnxmObV4tACGhQwYwlECV+lCSTQgOnKz0hanpQIl3xfeXHpn+ORTFO3e76bgGzkHqdlVXyik8rf0D/1OiYoMxs8v4Zm3ZU9fFqdUOi8slW3oGK2w2fgJOjZOxJbRBaovGaBUXlItozm+fPqoenjzyreY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352721; c=relaxed/simple;
	bh=wz4bT1GonheGCmKoZsL/+QlgDflUo0GVx6Z0t97lEHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NaXB7n/Lxo29eSVZJBXx09v5P7khReFK14PKx0C65p3iNc6ASujgPLOmfvlwP3z4qd5WCLeVag34Nwos5Epu9lBthT7tGvL0TFpTQ6ep7Uy3lRPgG0U6V+Y5pK73m4uuVHGktxewr3qlyT5rIQ19gn884fs9OTaLD3sq5pRlwqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNduvPy8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNduvPy8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so8781975e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352718; x=1790957518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sP0+/Epjm1Zv/XcAoYjyuNOC0ozQ/xub9MNxjeAUspA=;
        b=aNduvPy8qLjqis0X46QxscsX18R5ZcI44Iie82gth2ogkt4YYGOy+/+9k0gr56BspX
         EfJ04AvQpX3j0HvB7lQ4g0baz9887jPzVDwWKGduItMmbEwuoRWaExF341LV5OCEIXcv
         7uhfOdwVzpmzJq5djuXcAVEm0AKOSQIaTDjjOQhQRFpF61DjNr2i/2Tb+2bAyongWg89
         pibcWXqG9dNXPJoRTpxjMiVroeo6QSUD6z8fXSHPe84DdWDv7GLuaMK3oGBgKEhcYvLz
         RmpkmzrqCo/1RWGOkQwqxq7gsBye7+oZETEbtF5OauUuEaXT0JqcjcfxNg6LkAbCE8Va
         Qr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352718; x=1790957518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sP0+/Epjm1Zv/XcAoYjyuNOC0ozQ/xub9MNxjeAUspA=;
        b=1yEWU7Dt8CR+R2tLMUBnKTET5of60M+YnJ1IjvFrBFFm5LHrk51rbbRmnDS4s4Jso9
         UKL5CCxkgbRo7KFcJ6z5IsGDCbtmBqAoZcOjCnF3rP7CZAwUYavrPAaa/v0ll8D1H2CV
         bT8UUNEkHWej8xOQkNjeg4Z3cryOH8OQQ9+s+4+ZwPU8xWd7EJ4aVUF1RsW/fn4akFtb
         A88EbRWyui5SXAbRRkecffva2aLwGuGsn0z4kDNUDdibnSrIXA7niZvQP7StH7jnz02y
         xSS4GdKXZMhEdwKeE0VbN0uJVoVsXdI1E2Y14di0KJ25Dsdh3ErgJ7IYsOspbcYRlrGw
         3LwA==
X-Forwarded-Encrypted: i=1; AKwUvBwiDMU7Eqh3IadP3HmxOwJwefZKcy5BgUvkZhHiyhOo4JxiZ0j6b8nFjznGBzhuaUMf50Isq0/dIRkwnwgJ+Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++nZGTdk1tdNwpVd2Zxs+BYlNhNdCVNAa5k/1hAfNwn6fbNhXWqo
	o05Dj5YGtmTcUYTC1h/I9SDulLqTU1V203qbi7QT7Rm5RFjqpW+I1gUb
X-Gm-Gg: AYBFou3qRgF2hI8CPXug23zlWcv7krlGXMFPXRzxiETA/RnARLZ8KxxfAe3oPXRNu6v
	y4arsSDLFUlJnrXkY7ZJDM/S/pbDyraV4Iclauc/7v0wTjNIZ4OsPx4Mu1du91k+H3Hum3P6s/y
	JWLJgqy1D7IjeKOvQgRhbpKFdw0Fh6eUvTLGacK9O4WHj0KbvnpMZVBoH85tuVwC9O10WNvrA5J
	lz7HmDoVrSVDv0hNWRm6yZNjqIoowhxDMiMIUKHz3dJMj5ze3//hM3TK8hTTxU6HzE+e3vcxE2O
	U0fVq1frtwowvNDQsCUIu7Mqve3MvMfSOCxnboFFQLSNGKsyQmzhc2LItNZRF8SKnPh//IojQM4
	+3obfX8ZMh6ObFiPoAmjTHOiUOxZ1cS1OvXztSKR540TPOhy1NvM6QFDTnskFx2WhjMaIF2NmxV
	5m+pmZIGl2cbgRdlNknURCDVsIR1JVX5Nitw3fRXCwUaEzplCeUzIR4McCB4FKj9NnIyUrmYwZ+
	a02xtNfw8jELk5MSIWDJadPTwMLlXFngqqWQYTIjSC2
X-Received: by 2002:a05:600c:3b9c:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fe66dfdf8mr136621715e9.23.1790352717800;
        Fri, 25 Sep 2026 09:11:57 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:57 -0700 (PDT)
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
Subject: [PATCH 0/4] iommufd: Keep IOMMU_HWPT_GET_DIRTY_BITMAP within the user bitmap
Date: Fri, 25 Sep 2026 18:11:36 +0200
Message-ID: <20260925161142.189813-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IOMMU_HWPT_GET_DIRTY_BITMAP can set bits past the end of the bitmap the
caller passed in. Two cases, both fixed here.

iova_bitmap_set() does not clip the range it records to the bitmap. When
a query ends inside a dirty huge IOPTE, the generic page table code
records the whole entry and the bits past the end of the user bitmap are
set, up to the end of the last pinned page. The helper is shared with
VFIO DMA logging, so the clip covers both users. Patch 1 fixes it and
patch 2 tests it.

iommufd_check_iova_range() subtracts one from the length before checking
it, so iova = 0 with length = 0 is accepted and reaches
iova_bitmap_alloc() with length - 1 == SIZE_MAX, a range the clip in
patch 1 cannot bound. Patch 3 rejects a zero length and patch 4 tests
it.

Tested on x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y and
hugepages=128. Without the fixes the new tests fail: the overrun test
finds 56 bytes set past an 8-byte bitmap, and the zero-length query
returns success. With the series the iommufd_dirty_tracking fixture
passes, the overrun test skipping on the variants without huge IOPTEs.

Andrea Parri (4):
  iommufd/iova_bitmap: Clip recorded ranges to the bitmap
  iommufd/selftest: Test dirty bitmap recording past the query
  iommufd: Reject a zero-length dirty bitmap request
  iommufd/selftest: Test a zero-length dirty bitmap request

 drivers/iommu/iommufd/io_pagetable.c    |  3 ++
 drivers/iommu/iommufd/iova_bitmap.c     | 27 ++++++++++
 tools/testing/selftests/iommu/iommufd.c | 68 +++++++++++++++++++++++++
 3 files changed, 98 insertions(+)


base-commit: 54dadb030c7e2350957855d3995de05ae02c2e66
-- 
2.53.0

