Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853C4EA397
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352732; cv=none; b=ro4y92rUBh/T/ftjHSByGf3LL3UoGhEiACX1wjxajxr+XghwsWP4JSr4c2O5mFSizb1D+4MJNvKEiyoQpvrq+aaFDAW7t3LNT2yyrp/EMOPjztpvDiFN6ou1btO7faOxhTbNFCYylj6O/x9X8BMRrgtBvvzzkFGHgXcsAXd6dXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352732; c=relaxed/simple;
	bh=3zBndnPbmFeoFqTjACZnEMiREdKYWlO2VdcYcm001/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F10L5s7tkbHt1GZ0BMemuhGhJCgSZM/khMl+aKH3cNKt8HJ1nkuw04Aq/lzmbx7J82oByVX+EuDLCoHyvm9MyLTNPWVruffsfmmbgdaf+4XMg0sWzStBr2oh6uJr8r69St1egHms0WEae3/C82nMywGTeBJWHzdr3+vI8ey1gSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgbIt4f7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgbIt4f7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso7870485e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352728; x=1790957528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJjIAQ7/2x2XhBZs9VmF+j8AOgJ6YIg+9lR4a75uO7A=;
        b=bgbIt4f7m6bv8Gg47Q8smGyae6B5rlhc0iaYDmiuur8mVPi1GTVVUtkb7m11C7M01T
         1Ziuqb3dwTn7k7BAkxOa9O1YZwQS3tMaZL0+XKhadvUBzdgGfj2I+UjhldXot2C3RamX
         6ybQ7pSVGdt+/lhSeDNwvD/RryIA80modmJwYSsm5EeODmUKRpnPFkNwx2SPuLYjjZq1
         4BeNFoVZDhxVm6iFTdk9VblcxNXRh6UykZg3T58i8Y4eglDnylp32TLljietBfpHN/zA
         VfxjH1cmCnbIAxQYFti3IbAb9C1ftntH4YNC7o1JZ/GwXF/mEaLFBBvbyW/fF0Ti9C69
         oQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352728; x=1790957528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJjIAQ7/2x2XhBZs9VmF+j8AOgJ6YIg+9lR4a75uO7A=;
        b=xd0VhrrP4CcvowvGI7l0fbKOpIKhZJovGgkr0sfwHUgO8vAFJ2GWS4Lylr4MH5pEZo
         TUPL+X+xn1lN62J/LGP666XQrHh9ezwWloRXGmukjnlhRc91Jmbv/eqs/1yvWbnZPfYi
         AYCJXJTuF2DQlj7tXHra/AudliZP4oYbxRzXOF4MqgmX/XfJEZmO3pJ+OU9q+ELuUTkk
         yOSorXMLEGrEo+UJrmMu82aVnmEMR5doC6M82KMf6sNj2L/4q5MyD/cIJNOyyyvu5AqV
         XtvryLLE4VKO3MRjuOjDjLn10n+XoOMDox3/Xhhw0DPSKWq8MgL1rrz6e2pANql3vcGM
         baJw==
X-Forwarded-Encrypted: i=1; AKwUvBzv/sbWhmMkfRJF8s2PXlq9zlAjy5E4SvtVfEneIu2Loij0C00Egoa5Wpk0AW+A1sccFgCJPj+rVBJ7dxLcRtc=@vger.kernel.org
X-Gm-Message-State: AFuF++meP5/oUKqE47TrHyGPUuRtPME5nCPso/f5gFuaaM9hH6Vj91ge
	i1P/9YpHmLtLRVkXlNSL4s8ipc6TTR1bpJ7ESKpD4Wbk28UFbEPz1GrA
X-Gm-Gg: AYBFou0O0HGoCQExA6HSkX5eeRtx9jr07f+Z15cy0if17kJcWoNhe4Yqqx25bWzKnTA
	NFzj+6p2Uz9uIoieiN4cWm+GIPaYVX5+3Z2k6UMN03mfGjsAXfGAFHVgI4OX6PwoVXnaTiJ9mGH
	6wWzr/+oyaqIbF1chMAqy4xlVvmkZkOa2eXxu1APP+eP5ZvxhRaJMGwt4ardvrzK03JI0LUOS4r
	1EWcK736ULWrBC4Q5cJV8B/TH5U0bH7HSHrL4RMqWRfnIx4NWFyNosarJd8G27qzu50Apre5dgU
	HRvkFn7SZTPAe6Qxqg4oPhe3cu+EAxKk4UIRk5V1tMAke+radoKs5Dx7kiN9ewG9Om1GXmelRqB
	9lP95no4hAW+gXcJyXXBnCPywlx1u6ooG7+vFrSZlORN9Q3uGkA3IrpA8lk3smc81tqKvCtSv+t
	kxgyfb6mhMl8B5j/4x6survgjC373aCvPMZNcTcRNbv2lO88VNpsNEElieAr64NM+5I2cUG38sP
	/7DaPnh/7ZbPSsm3uqA4O3RLB2vjhATGs47iuJO+eAi
X-Received: by 2002:a05:600d:d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-49fe7726ee3mr94636635e9.32.1790352727934;
        Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0658747sm81238665e9.1.2026.09.25.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:12:07 -0700 (PDT)
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
Subject: [PATCH 4/4] iommufd/selftest: Test a zero-length dirty bitmap request
Date: Fri, 25 Sep 2026 18:11:40 +0200
Message-ID: <20260925161142.189813-5-parri.andrea@gmail.com>
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

Add a GET_DIRTY_BITMAP case that passes iova = 0 with a zero length and
expects -EINVAL. iova = 0 is the value that lets the zero length wrap
into an accepted range; without the previous patch the request is
accepted and returns success.

The case runs on every variant of the dirty-tracking fixture. Tested on
x86-64 under virtme-ng with CONFIG_IOMMUFD_TEST=y.

Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 tools/testing/selftests/iommu/iommufd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index 47d861b3bdd7b..2b3c9e9c69ca7 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2472,6 +2472,25 @@ TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_overrun)
 	test_ioctl_destroy(hwpt_id);
 }
 
+TEST_F(iommufd_dirty_tracking, get_dirty_bitmap_zero_length)
+{
+	uint32_t ioas_id = self->ioas_id;
+	uint32_t hwpt_id;
+
+	test_cmd_hwpt_alloc_iommupt(self->idev_id, ioas_id,
+				    IOMMU_HWPT_ALLOC_DIRTY_TRACKING,
+				    MOCK_IOMMUPT_DEFAULT, &hwpt_id);
+	test_cmd_set_dirty_tracking(hwpt_id, true);
+
+	/* Only iova 0 wraps the zero length into an accepted range. */
+	EXPECT_ERRNO(EINVAL,
+		     _test_cmd_get_dirty_bitmap(self->fd, hwpt_id, 0, 0,
+						self->page_size, self->bitmap,
+						0));
+
+	test_ioctl_destroy(hwpt_id);
+}
+
 /* VFIO compatibility IOCTLs */
 
 TEST_F(iommufd, simple_ioctls)
-- 
2.53.0

