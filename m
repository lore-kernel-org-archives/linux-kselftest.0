Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D746AF0A
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034458; cv=none; b=og9nTWWsXV534L+Nk/Wk732WpwTN16U3kJEi8fHDJobniDjPv/XBTHngkCmCmrtXX+rZQ55K1M8FvlsDXwvt/IV+ndgeQXAAjthgrlbVblMbD3FuVtMmjD7l1mIczmhOk/t7/rU1kkEvemRNhEig+abUzqSiuFQ1bm3ZAxm1EdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034458; c=relaxed/simple;
	bh=zWI3HgS6VNdfgTHEihXvnUhJkpLl5h08ZrZ1Oj9J3pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdzpBomYOTCMs0iAkLCQCJudfiS+JRqahIKLVCh++bVfjHuEleTxh/ZAqWIO4fPJLy6I8xizh9mzb+SdULGVpB2vN/KshsRAoA+ynfuZvelKlNu6IO4VuhQcM/AS6MnoSbO1AFwHi3JVX29teuXqF+bXahBDkUY5y7MVlJEMgR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CdQkj7xR; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CdQkj7xR"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so699593a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034455; x=1784639255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgO28qqQ1xeK9Yvst4+iTUEqQXClh8oO6Jm7DHD/RdA=;
        b=CdQkj7xR+h9LHTxhEbV6qfSS3zfzryn9x5BR/nNpAEZx5yMWJzohFhnZ/CUN3Bw7P9
         3Xlp0QADCcYAyANDygVONbE0PyV83y5r0jQppN1N+h0yHUNdud4dcK1hWEGal0qQSmKI
         IPnN6kNoWn978PIZvutNMwI+vO82gruj/jf2TwTbizC96PY+HPom7qKYDQEc97AZiNIs
         jcT+9dKzI5XHrqcnNhAW27+cU2HWOf4av+ClxhduDhSDPOF/yJmfV55c1G3jaYEgEbqF
         YoXvwWzE6VeIhloI8BtLX5IJstirWeSt74rPhtVls7A/Jv8pke37qZUPdDc2XhMvD/gB
         WzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034455; x=1784639255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgO28qqQ1xeK9Yvst4+iTUEqQXClh8oO6Jm7DHD/RdA=;
        b=FbZe249/ZVmghnif6eYD5WvionBnn7CvLMebYmaU+c2vdhMo0B9XL5Gd0BVBPnhPef
         Pdh+AoGeztodb1oKR1Y8wYwrS2eJug2BVbxOw8R0/YN9S4tXa3ecCnisUhDAbsyJqRwc
         imKqqHshSYb9w1PIP0RyZ9SxKqhwRVG3F4NE5L3NOfENcahFqYcG/Gr7StQO6BFDy9vV
         FshKdBMsmgYDOqKcPW4YTfyMEGf94E/986LP5HGPxTmUNK5OfELExMHu4NdjqyIu9B+l
         NZ0St8JoTyjYKs/Km5dOfHdzBqCwv/FRSf43/roQZOLLgYbbOGQUOsVeFUQuwwhehRs7
         b1xw==
X-Forwarded-Encrypted: i=1; AFNElJ/S50EHIo5xCDvl4Cs2MKfFzsH0zpWOmOqUNUr3itIwp24ubJIfy00wqPCHi9RhaIhNHiJFvRPlNcL7liA9iSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKvIg6KFJXumvXUFWRottSN66/Sc8oPE94NDIVkuXt0nmxdDYx
	zRSlAg4IZ4Mh90Ky6DzzdhJlmwzw1eG5cdZHhbSyYzjTYyap8UZo51nUiReIxU38rD8=
X-Gm-Gg: AfdE7clcmPTCFdKskeJw5DBKl5BoZsX4RMy54h3YAMZ1stbHRvxVIT6MNalwgD2P2j8
	bnnmDZ15Rpl5AHZuL04AwIiooyEF4omfLDNLGJrbxEZ9610GFkzhoEMMF6zBrcEPATnEE4ngApZ
	heDRfp65YbJYq8+Xh42WHUWWzenXxjQsEtNv7bXGCpVNeVqu3rMiTMOxEy9VYwshkBlH2Q0z1ae
	W45JZXJ6njNv9eVTIIkJIwtq+efFbW5A7167d6/ND4m/ELbNN+yh/d80mWKFC2NXMkLmw7AXTOZ
	D9QKWQkrfznnqUHnQ65txgU42Zb65YyYEIE5wDLResWmYljQFQW0pShrPb7BMTv7Dr94Azzb2CF
	MRQFI9MUJMmK9JztsiaBQY7XYKb8VOQxL0D2e5BZjhjYuZv/pkty56eBfn8pVaALLWsIFfZiqzu
	H/5/DkRG2uCiPnszn7S2azgYCMqPBU6zzZMeBIaIs/HGNH6RK5uZ4Y4wKUE5/soQ==
X-Received: by 2002:a05:6830:f88:b0:7e9:fe5f:4406 with SMTP id 46e09a7af769-7ec0997528bmr8084846a34.30.1784034455345;
        Tue, 14 Jul 2026 06:07:35 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:34 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 2/7] iommu: Add checked group device update helper
Date: Tue, 14 Jul 2026 21:06:52 +0800
Message-ID: <20260714130657.46963-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some group-wide operations must validate every member before changing
any device. Separate iommu_group_for_each_dev() calls cannot provide
that guarantee because group membership may change between traversals.

Add iommu_group_update_devices() to keep the group membership mutex held
across a validation pass and a non-failing update pass. This provides
all-or-none validation without exposing IOMMU group internals to
callers.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/iommu/iommu.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/iommu.h | 13 +++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index da269d10f6bf..9a6c4a7e7df6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1436,6 +1436,39 @@ int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 }
 EXPORT_SYMBOL_GPL(iommu_group_for_each_dev);
 
+/**
+ * iommu_group_update_devices - Check and update every device in a group
+ * @group: the group
+ * @data: caller data passed to both callbacks
+ * @check: validates whether one device can be updated
+ * @update: updates one device after every check has succeeded
+ *
+ * Keep group membership stable while first checking every device and then
+ * applying an update which cannot fail. No device is updated if a check fails.
+ */
+int iommu_group_update_devices(struct iommu_group *group, void *data,
+			       int (*check)(struct device *, void *),
+			       void (*update)(struct device *, void *))
+{
+	struct group_device *device;
+	int ret = 0;
+
+	mutex_lock(&group->mutex);
+	for_each_group_device(group, device) {
+		ret = check(device->dev, data);
+		if (ret)
+			goto unlock;
+	}
+
+	for_each_group_device(group, device)
+		update(device->dev, data);
+
+unlock:
+	mutex_unlock(&group->mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_group_update_devices);
+
 /**
  * iommu_group_get - Return the group for a device and increment reference
  * @dev: get the group that this device belongs to
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e771b4a92f5b..befba0683e06 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -988,6 +988,9 @@ extern int iommu_group_add_device(struct iommu_group *group,
 extern void iommu_group_remove_device(struct device *dev);
 extern int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 				    int (*fn)(struct device *, void *));
+int iommu_group_update_devices(struct iommu_group *group, void *data,
+			       int (*check)(struct device *, void *),
+			       void (*update)(struct device *, void *));
 extern struct iommu_group *iommu_group_get(struct device *dev);
 struct iommu_group *iommu_group_get_by_id(int id);
 void iommu_group_put_by_id(struct iommu_group *group);
@@ -1399,6 +1402,16 @@ static inline int iommu_group_for_each_dev(struct iommu_group *group,
 	return -ENODEV;
 }
 
+static inline int iommu_group_update_devices(struct iommu_group *group,
+					     void *data,
+					     int (*check)(struct device *,
+							  void *),
+					     void (*update)(struct device *,
+							    void *))
+{
+	return -ENODEV;
+}
+
 static inline struct iommu_group *iommu_group_get(struct device *dev)
 {
 	return NULL;
-- 
2.50.1 (Apple Git-155)

