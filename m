Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911D3BD24D;
	Mon, 30 Mar 2026 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865494; cv=none; b=dp40z3j7jTlZjoG58LiXndDRsU0TIupl5n2n+MiSpnOl570e97gCsfD8+oh86qixabFW6fk9dPkkVcdDdlDngfbfeeyLKKkHbn4DHWdRHQyWeQTjM6rNP5Jl31D/6h8QYCseYx7MHEKCYtuJe2nHJFrvf+AcRSVq5J8DmTo3F0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865494; c=relaxed/simple;
	bh=2Qwo3uvG4BlcBg2j7lWvEfKP/WdTuzKegEOP6jT7zlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+g5c/MKz/m+yXVoc9a9VWaDvOZzRciPH+I4EJ32F90xhUqACk7Iw7yU2TDLr8oI4vWn65FVyOPemoVNd6rb7jgPLuJ+4bRw9ItwtZm7gd8kgyc+JuFet/cbyigLujXYwBm8KXgmUAPHrLeNLTND3BZd0D8yL0wllp1VBEkBBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7mfUpN/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7mfUpN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774865493; x=1806401493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Qwo3uvG4BlcBg2j7lWvEfKP/WdTuzKegEOP6jT7zlA=;
  b=m7mfUpN/o4Nu3aNdb6RK86SA4pcsKcbM7hjch4hsUDW4p9HGRF7+yxME
   oxZvWzUHsb41z5TXt3M2vHYxe0tLJxJBMxgAXJDuqnC+ggwO/1OFct4yy
   0F/Ro8ASgVCxelQblNAq4q8gVSToaXnam4TnghsJT4A/QBZY6qc13PX2N
   +KLwaN7RIx3/Hj9Mjfcukd3MkHmtP4GOXsv+cxMQZiWQjkmvD1MDvhOgV
   9TSOvzUbRx4fVOVh2aqjRlNO2pMoqNk3nmhRcSmovxxps82QuQ2dUJh2j
   jxEfAuXbyo6osGIH/Q2Z12/eQOU5u81DbkOuHnORAdCfd+uWATxI66viO
   Q==;
X-CSE-ConnectionGUID: C8+s+giSTLu5TXFFSZ5F5w==
X-CSE-MsgGUID: zfuEydHiQQ2kAME1/DFzRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75921189"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75921189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:11:32 -0700
X-CSE-ConnectionGUID: QUjg63azR2qn4fFKmRPPaw==
X-CSE-MsgGUID: DERAIapcTVGHpQMHZco16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225913477"
Received: from spr-duan.bj.intel.com ([172.16.114.123])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:11:29 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dwmw2@infradead.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	baolu.lu@linux.intel.com,
	yi.l.liu@intel.com,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 4/4] iommufd/selftest: Test dirty tracking on PASID
Date: Mon, 30 Mar 2026 06:11:07 -0400
Message-ID: <20260330101108.12594-5-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330101108.12594-1-zhenzhong.duan@intel.com>
References: <20260330101108.12594-1-zhenzhong.duan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test case for dirty tracking on a domain attached to PASID, also
confirm attachment to PASID fail if device doesn't support dirty tracking.

Suggested-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 tools/testing/selftests/iommu/iommufd.c | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index dadad277f4eb..d1fe5dbc2813 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -2275,6 +2275,33 @@ TEST_F(iommufd_dirty_tracking, set_dirty_tracking)
 	test_ioctl_destroy(hwpt_id);
 }
 
+TEST_F(iommufd_dirty_tracking, pasid_set_dirty_tracking)
+{
+	uint32_t stddev_id, ioas_id, hwpt_id, pasid = 100;
+	uint32_t dev_flags = MOCK_FLAGS_DEVICE_PASID;
+
+	/* Regular case */
+	test_cmd_hwpt_alloc(self->idev_id, self->ioas_id,
+			    IOMMU_HWPT_ALLOC_PASID | IOMMU_HWPT_ALLOC_DIRTY_TRACKING,
+			    &hwpt_id);
+	test_cmd_mock_domain_flags(hwpt_id, dev_flags, &stddev_id, NULL, NULL);
+	ASSERT_EQ(0, _test_cmd_pasid_attach(self->fd, stddev_id, pasid, hwpt_id));
+	test_cmd_set_dirty_tracking(hwpt_id, true);
+	test_cmd_set_dirty_tracking(hwpt_id, false);
+	ASSERT_EQ(0, _test_cmd_pasid_detach(self->fd, stddev_id, pasid));
+
+	test_ioctl_destroy(stddev_id);
+
+	/* IOMMU device does not support dirty tracking */
+	dev_flags |= MOCK_FLAGS_DEVICE_NO_DIRTY;
+	test_ioctl_ioas_alloc(&ioas_id);
+	test_cmd_mock_domain_flags(ioas_id, dev_flags, &stddev_id, NULL, NULL);
+	EXPECT_ERRNO(EINVAL, _test_cmd_pasid_attach(self->fd, stddev_id, pasid, hwpt_id));
+
+	test_ioctl_destroy(stddev_id);
+	test_ioctl_destroy(hwpt_id);
+}
+
 TEST_F(iommufd_dirty_tracking, device_dirty_capability)
 {
 	uint32_t caps = 0;
-- 
2.47.3

