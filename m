Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40A3C5838
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694370; cv=none; b=efdqKzl7pP/DYyWzb9TUO4HDS4XPI7aqdHb229vDAq3H9YRG8UAt9WhICHhoOpf/4ixgaJ9nuv/eh1WOb4O6K+B/byu6QTtYC/s9s9YiSIeayGMCkDpHZqOxQXNueG8IXyKIC9b+n1lAlE9Vbr7IZyiCF5y+7uruGAoXxLOgars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694370; c=relaxed/simple;
	bh=1zTws9fmQmhgRciJvlP2AWzY+uWAfxRF9YfrcryFsNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MA9y4eqJL5ZhYseoYPwSQnCtLIKeyz0kxwxq69yij6BBlqI/IcFxLcMgoHSr8P++eWqL7NQbSwGGDv1ZfnxwwBpQ6fwyreAsCw5VbK5ID+nEwe9nbuhLAZkU8fbhAxBOS2x5UBWVyhQlDLkVO2gY7BFed6Vp1KM0nO0aaqNdvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gqFaGE0K; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gqFaGE0K"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5174a1d78f8so21284991cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780694368; x=1781299168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2vGSHo9hdkHiErFpk6jdcKlA83TnjxiiQnZVrYQBSY=;
        b=gqFaGE0K9vKJMVXyKCgcKJk8t+bfz18rdbV9SZqyxylippjH89EXDmZoioIHwAOTf/
         jL9GS0UPHGtDknh1gzcNX76TNl5JIVQuyPoSBfHR/YGkc+yWZTVH6u39DKjAnekHdYo+
         IOpLWg4KwHwo1m/qWoArd81Su5scesilDhxxPwZTWyEK3Uk34Wvs97A/Ud2YIdUqgZwB
         UB3J19z0c8v3L659nIzUMgW9vZXSEUDO9+el+Cqvkth2vgmVvVTZBmcGB53b0bPlVD7E
         njUnQMfnCIADmD3TEpnfcx/K+mqrNf5LxU97cCTPNRN7jM5ckywzpo+vvWoL9amzStry
         MqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780694368; x=1781299168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2vGSHo9hdkHiErFpk6jdcKlA83TnjxiiQnZVrYQBSY=;
        b=W7O+zethdNcvBhACypxDuAyRSjUxmZ3czvPe6OXvp6uQfX41uKqzYeQGldYnF686X3
         gRTm8HZgb74R7ar2pfJJEXHyOmmSe086FH0eDow4WO52bfpLdafPPlfhIPjqTwjeK0ND
         7NFmGOiNqHq4iGJQ6GxwMODz4MlqHl1fLV4qv9kAWx5BJ0f128S8MeQoGpqVlbscFXGd
         AGyNhZjUSUx9R2Qm0PjaJdsjwdmBoZWLTeVGKsYR8yZQdEpD8rx06s7Qz8ax7Yr8e/se
         OZiD3q3jstFTQvsV2Tx8sFlkz/d2oz2KiPe6SNuZMGM+V0EIwBojvWy9AxSTHmoq2el9
         iSXA==
X-Forwarded-Encrypted: i=1; AFNElJ8sqT/bOXQIodyL0Q+FNds5WBkd/qfedG2e26fLIBYk9+DcmwXLl1ibZBVqXhfZg7r2oTTvHeXP30iupJrtFl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTyTD8jYPGdsH+oFoly1YTXU+FU9C1OdF/z+3DPUflady8MnKn
	bJ4ho+MeGXUVXiASjxaqeSe0RoQozAhIp8gfANekB8/aLkpImZjwVidRVn5lhC+NB4Q=
X-Gm-Gg: Acq92OHTdkCGpHWFf6OEvpeJ8KdTRWuz/1oTgbG5P756oNeTKeRmYn8lrVK59If5eus
	5ESmkW1ziTaF4c1P1GAf7R2fl12CKuU6TL8xKvD/VsqNtqNAermEaSlt5rj0BUWFnyLDrobo68u
	5HXQWzc4OlQ6nD+Pcm+r7qdB20mzj2oy08c5Hn8SpkL0Juv4hweQAlcsiNJ3pCnAoa774Xox2J5
	+lxzIwky9NoKZYwMCE0wgdMwENAb7FMVBHV3WYyL81TEv5gAZ2aO+lTO0mK4VnH1M7kpbtiSrXF
	QW7nbcOj5df1eLqal2ASwl8NFP/EOwDE8d0juEXLd0o/0EWwZP8M0k2wthFTPa1D1S0MEP1dVJY
	NwiVi0Hpvv9nlVrtWLaaOQ6WJcxN1SzibLwdDis69mmPZ6NFQaWg0Uruo/fPSF7gwlrbz08U8S+
	IFqbiM3vq6rC+I6MxLAWUhdMyltuU2ka+UkHvmO6u+MtYUlb09WPK4CXCAWt/BtYKfSeXqwAE8C
	LacgZ1KNJ2i7SDi3HzTxnuiGafoeRHhJA==
X-Received: by 2002:a05:622a:514:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-51795bbf29bmr79531471cf.49.1780694367941;
        Fri, 05 Jun 2026 14:19:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm90518196d6.49.2026.06.05.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:19:27 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-cxl@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	osalvador@suse.de,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v4 6/9] dax: plumb hotplug online_type through dax
Date: Fri,  5 Jun 2026 22:19:08 +0100
Message-ID: <20260605211911.2160954-7-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211911.2160954-1-gourry@gourry.net>
References: <20260605211911.2160954-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no way for drivers leveraging dax_kmem to plumb through a
preferred auto-online policy - the system default policy is forced.

Add 'enum mmop' field to DAX device creation path to allow drivers
to specify an auto-online policy when using the kmem driver.

Current callers initialize online_type to mhp_get_default_online_type()
to retain backward compatibility and to make explicit to the drivers
what is actually happening underneath.

No functional changes to existing callers.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/bus.c         | 3 +++
 drivers/dax/bus.h         | 2 ++
 drivers/dax/cxl.c         | 1 +
 drivers/dax/dax-private.h | 3 +++
 drivers/dax/hmem/hmem.c   | 1 +
 drivers/dax/kmem.c        | 5 +++--
 drivers/dax/pmem.c        | 1 +
 7 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 492573b47f66..6611fe399f59 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2017-2018 Intel Corporation. All rights reserved. */
 #include <linux/memremap.h>
+#include <linux/memory_hotplug.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
@@ -394,6 +395,7 @@ static ssize_t create_store(struct device *dev, struct device_attribute *attr,
 			.size = 0,
 			.id = -1,
 			.memmap_on_memory = false,
+			.online_type = mhp_get_default_online_type(),
 		};
 		struct dev_dax *dev_dax = __devm_create_dev_dax(&data);
 
@@ -1527,6 +1529,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;
+	dev_dax->online_type = data->online_type;
 
 	inode = dax_inode(dax_dev);
 	dev->devt = inode->i_rdev;
diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
index 5909171a4428..c53a9427f8e4 100644
--- a/drivers/dax/bus.h
+++ b/drivers/dax/bus.h
@@ -3,6 +3,7 @@
 #ifndef __DAX_BUS_H__
 #define __DAX_BUS_H__
 #include <linux/device.h>
+#include <linux/memory_hotplug.h>
 #include <linux/platform_device.h>
 #include <linux/range.h>
 #include <linux/workqueue.h>
@@ -26,6 +27,7 @@ struct dev_dax_data {
 	resource_size_t size;
 	int id;
 	bool memmap_on_memory;
+	enum mmop online_type;
 };
 
 struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data);
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 3ab39b77843d..0eaef700bb2a 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -27,6 +27,7 @@ static int cxl_dax_region_probe(struct device *dev)
 		.id = -1,
 		.size = range_len(&cxlr_dax->hpa_range),
 		.memmap_on_memory = true,
+		.online_type = mhp_get_default_online_type(),
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 81e4af49e39c..0787325bc8dd 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/idr.h>
+#include <linux/memory_hotplug.h>
 
 /* private routines between core files */
 struct dax_device;
@@ -79,6 +80,7 @@ struct dev_dax_range {
  * @dev: device core
  * @pgmap: pgmap for memmap setup / lifetime (driver owned)
  * @memmap_on_memory: allow kmem to put the memmap in the memory
+ * @online_type: MMOP_* online type for memory hotplug
  * @nr_range: size of @ranges
  * @ranges: range tuples of memory used
  */
@@ -95,6 +97,7 @@ struct dev_dax {
 	struct device dev;
 	struct dev_pagemap *pgmap;
 	bool memmap_on_memory;
+	enum mmop online_type;
 	int nr_range;
 	struct dev_dax_range *ranges;
 };
diff --git a/drivers/dax/hmem/hmem.c b/drivers/dax/hmem/hmem.c
index af21f66bf872..0ef6e9ae660d 100644
--- a/drivers/dax/hmem/hmem.c
+++ b/drivers/dax/hmem/hmem.c
@@ -37,6 +37,7 @@ static int dax_hmem_probe(struct platform_device *pdev)
 		.id = -1,
 		.size = region_idle ? 0 : range_len(&mri->range),
 		.memmap_on_memory = false,
+		.online_type = mhp_get_default_online_type(),
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 592171ec10f4..41ccb618a146 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -172,8 +172,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * Ensure that future kexec'd kernels will not treat
 		 * this as RAM automatically.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, mhp_flags);
+		rc = __add_memory_driver_managed(data->mgid, range.start,
+				range_len(&range), kmem_name, mhp_flags,
+				dev_dax->online_type);
 
 		if (rc) {
 			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index bee93066a849..a5f987814da5 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -63,6 +63,7 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 		.pgmap = &pgmap,
 		.size = range_len(&range),
 		.memmap_on_memory = false,
+		.online_type = mhp_get_default_online_type(),
 	};
 
 	return devm_create_dev_dax(&data);
-- 
2.54.0

