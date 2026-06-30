Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E3327C18
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854344; cv=none; b=Xgan+eFwTU3CGwNlQuOCXVvCczaFgYTMP8ETHcWibtb+C01IvEmLCQ4fF+snpT4kFUquuz7xy41B0EyVPoMyee6f4pdkwxEpNZF1MheGaTWtrQZYGtpsNfMkWVQ1azk77We3A1yWOwQFkCeJ6L7Ra0CSL+nkuLLB7zcbmul9PI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854344; c=relaxed/simple;
	bh=M2XlJjFZxF3IK8lHYlvHWP38+NcKhixhRvsiCPbvlKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9RJzGCVNzF9QPYGiICUf4nWOhm3OhxOcmtXCpmyFURFPYs+sk6JSWMkE+2+5l5IylQsQJePobEbK1BsCvdiD4UGGtnNUhQBtCs8Za30iQyVKhwyggWsYabK0Yrae9zOxa6Bmkd76rFzMsyMWT7B0gYRgocrdfmVxZj97b3XT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=a92Y+s5I; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="a92Y+s5I"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e51d3d83cso206444285a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854341; x=1783459141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IP2YOjgAZGfrsS4LZXJr3sh6H3JBdzwvDSe5f7yamI=;
        b=a92Y+s5IYtBpH/KvpbcCHlVDpzeijfFC7hONZNv0+Lg2WKRG1KJx/jKNZtp+YdNZON
         iRJTshBkerGyhmXobv4r22VrcRFnQnHNmOw+QwS6wQWoATacohNd6QR9WymnSzLxvwYh
         wwYSWKuh8a2p4Uz+RYqRlCk3I7vFc0875FwJRRfO2RFIVa1VGY0O89ILgIPY45i0tewL
         lVAPOiQ5hq5Gv7qKjqcSvb+3riniF3KJ8nIuHnY44ud0wBollt0TgA3klTrHpM1zGcpV
         fNO5LtITh7sTZ0wmM6XWgJdyUxBTsHVGbhQNE3zdNz3TE7teuiHqJq2iEG2JE5zPRzmD
         IW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854341; x=1783459141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IP2YOjgAZGfrsS4LZXJr3sh6H3JBdzwvDSe5f7yamI=;
        b=Uhydd9wIxFkRTZLjfffMEgfeb2s00rnixmDplxYys1DxjnK61rrXRBqtmOCS7ZbnI+
         jvyvzBH+HJfxSuKpkN7g2xixHlGQvkHm5xz1vK/4N/eZF/sAwEq16XUeVrwVv+SjoFUo
         iabrLLJFb9aMmVNuJw118FowpSx3QTTtpZy07TnNBf8KWU2tOGjv/2c3imoUuNuypuBR
         y6PSmsQywbIbfLO1g4UISiG2ASG6RFqr0aswNsU/gejHFe46lhY2kzJxnpdgvZT3KUdT
         2Gm5hmLadttYfn2k30Uvh4s8/p7cyNeQhIHUlVqk1HWMpeoZc2ivwdWGDaXuZKXCPUrn
         Z9Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/564xkm2VHGMtdle1etBJyi0/zVQYT7NS2OD5GGLo0pQDi/ha40dXQLmOugrQMnqkdZOx/sIgWc9z1Xvu629g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDpRMDt26XT8oJ5C0Oin9c+eYRnokl2dnFFLZgte3ozWMkZyx/
	WWES5DlWOc5UkjWYXel96jVAwc4cCaki4ciKBMswGVnuRLwYXmUOU1swHSIUXN5S5/o=
X-Gm-Gg: AfdE7clyUb9zzbxsVxSVOVP7JOmQ4Azql8cz3UqD07T+RBxn4kamiIU6jXBRffCOtMJ
	RFQPclZgYvIfBfXAf5HI2PtMd46Cm32VfYgBIRgnvZbddEUrHLvJe13IXYpehM5UEI23iOaGPPK
	fO3NoxOA5ED+K+xAC+wsDswTNMnIeRA2bGbRQohgAIWpVGJ1emOB2oY04M8Dhh9+68/RhP66mCk
	97GcIgjkU5L6vl3mgcZ5dyTNZw7YS2yw6o+t3QoWdZM2SdgxHkDOE0Iu1UWB3exIlYCUDfoU0H7
	ZYHv5GVgDfPPXgtuCFMgbRKQ/NPyqDFU/vGZQYh71HYtd2r0zCoy2rt05ldVoIURLTpHmwf12mD
	m3H/hW7IFAdvU/L10gv5LnhsIQkTuvVC9g6gOk81Va7g0At12fMwbOFnuVy8oxKxTW9M/IbgRa8
	96yN3Ckx1p12Zv5Jttk62eM/qR5ayjMNnN1GVVv5gC0qytARciD8olVG5FWF1+SEY4hZBKQmY69
	tG15oObtR2y
X-Received: by 2002:a05:620a:17a5:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e6d92926dmr414099985a.66.1782854340864;
        Tue, 30 Jun 2026 14:19:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:19:00 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Date: Tue, 30 Jun 2026 17:18:39 -0400
Message-ID: <20260630211842.2252800-8-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
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

Capturing the system default would otherwise break the ABI, because
the system default can change - but we would be statically assigning
the value at device creation time.

To resolve this we add DAX_ONLINE_DEFAULT, which defaults devices to
the current behavior, while providing a clean way to override it.

No behavioural change for existing callers (still the system default).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/bus.c         |  3 +++
 drivers/dax/bus.h         |  9 +++++++++
 drivers/dax/cxl.c         |  1 +
 drivers/dax/dax-private.h |  4 ++++
 drivers/dax/hmem/hmem.c   |  1 +
 drivers/dax/kmem.c        | 11 +++++++++--
 drivers/dax/pmem.c        |  1 +
 7 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 492573b47f66..4a03b323b003 100644
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
+			.online_type = DAX_ONLINE_DEFAULT,
 		};
 		struct dev_dax *dev_dax = __devm_create_dev_dax(&data);
 
@@ -1527,6 +1529,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;
+	dev_dax->online_type = data->online_type;
 
 	inode = dax_inode(dax_dev);
 	dev->devt = inode->i_rdev;
diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
index 5909171a4428..3bc76bc0a145 100644
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
@@ -16,6 +17,13 @@ struct dax_region;
 #define IORESOURCE_DAX_STATIC BIT(0)
 #define IORESOURCE_DAX_KMEM BIT(1)
 
+/*
+ * online_type sentinel: the device was created without an explicit online
+ * policy, so the system default is resolved when the kmem driver binds,
+ * (not at device-creation time, which would freeze a stale policy).
+ */
+#define DAX_ONLINE_DEFAULT	(-1)
+
 struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 		struct range *range, int target_node, unsigned int align,
 		unsigned long flags);
@@ -26,6 +34,7 @@ struct dev_dax_data {
 	resource_size_t size;
 	int id;
 	bool memmap_on_memory;
+	int online_type;	/* enum mmop, or DAX_ONLINE_DEFAULT sentinel */
 };
 
 struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data);
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 3ab39b77843d..1a7ec6212213 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -27,6 +27,7 @@ static int cxl_dax_region_probe(struct device *dev)
 		.id = -1,
 		.size = range_len(&cxlr_dax->hpa_range),
 		.memmap_on_memory = true,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 81e4af49e39c..902e922dc4e4 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/idr.h>
+#include <linux/memory_hotplug.h>
 
 /* private routines between core files */
 struct dax_device;
@@ -79,6 +80,8 @@ struct dev_dax_range {
  * @dev: device core
  * @pgmap: pgmap for memmap setup / lifetime (driver owned)
  * @memmap_on_memory: allow kmem to put the memmap in the memory
+ * @online_type: MMOP_* online type for memory hotplug, or DAX_ONLINE_DEFAULT
+ *		 to resolve the system default policy when kmem binds
  * @nr_range: size of @ranges
  * @ranges: range tuples of memory used
  */
@@ -95,6 +98,7 @@ struct dev_dax {
 	struct device dev;
 	struct dev_pagemap *pgmap;
 	bool memmap_on_memory;
+	int online_type;	/* enum mmop, or DAX_ONLINE_DEFAULT sentinel */
 	int nr_range;
 	struct dev_dax_range *ranges;
 };
diff --git a/drivers/dax/hmem/hmem.c b/drivers/dax/hmem/hmem.c
index af21f66bf872..2de3bc925172 100644
--- a/drivers/dax/hmem/hmem.c
+++ b/drivers/dax/hmem/hmem.c
@@ -37,6 +37,7 @@ static int dax_hmem_probe(struct platform_device *pdev)
 		.id = -1,
 		.size = region_idle ? 0 : range_len(&mri->range),
 		.memmap_on_memory = false,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 592171ec10f4..0a184c0878dd 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -72,6 +72,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	int i, rc, mapped = 0;
 	mhp_t mhp_flags;
 	int numa_node;
+	int online_type;
 	int adist = MEMTIER_DEFAULT_DAX_ADISTANCE;
 
 	/*
@@ -132,6 +133,11 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		goto err_reg_mgid;
 	data->mgid = rc;
 
+	/* Resolve system default at bind time in case it changed */
+	online_type = dev_dax->online_type;
+	if (online_type == DAX_ONLINE_DEFAULT)
+		online_type = mhp_get_default_online_type();
+
 	for (i = 0; i < dev_dax->nr_range; i++) {
 		struct resource *res;
 		struct range range;
@@ -172,8 +178,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * Ensure that future kexec'd kernels will not treat
 		 * this as RAM automatically.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, mhp_flags);
+		rc = __add_memory_driver_managed(data->mgid, range.start,
+				range_len(&range), kmem_name, mhp_flags,
+				online_type);
 
 		if (rc) {
 			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index bee93066a849..e7adace69195 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -63,6 +63,7 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 		.pgmap = &pgmap,
 		.size = range_len(&range),
 		.memmap_on_memory = false,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return devm_create_dev_dax(&data);
-- 
2.53.0-Meta

