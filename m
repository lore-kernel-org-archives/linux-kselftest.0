Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BF3DA5A7
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313091; cv=none; b=OmcGsinR3pVsullMb0f7ZyLMZ4/JR8bWPbNyxWAKWT+1jzQqfOTB0z64FHxuYkvK2OYnsaU7pe4jdUsO8z9DHPJCmbxPDm1X46fhcXyGafr0H8+uWbqrk5IcJLi8SDBqwBLxR7N5Wu3wZuaW2ilZEzgotllmLW91zDyV/aYcRH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313091; c=relaxed/simple;
	bh=3ZopxSgkjTaHaZyxnFhx+t/MonuY/eSmen2libYGU58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZEJvb6/7aogDtdrJmNjiLgko7aPoGG0jGQDkP0sZwReHcrPwOiB7cgZuIFrSOMayrsr4y5p7PrXj655SPpcdPsxg1bmRRcPn1F+kAMb8I4fZgH+navGdIeXC9xJRWCGNIJ7flGIC6MdgzWwmqgFOa864IxGL1G+tRmvxjUElGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MB5Vl0fx; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MB5Vl0fx"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-519f758bd33so8855541cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313088; x=1782917888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnCbxW9XzGA16mXvyVagPlrUc6bIGxDm63u9PSaRfE8=;
        b=MB5Vl0fxkLZdM+fdP8nWObnFscA6Jr5rDNh6TozHF7SWj1vaDsjoFUNVumsHJUdfjk
         SoG4uhqdjElXInRymmXgn9GtmLtptCCVMJByHpHpHg9IlzzDzljVh2Cw+c1g/ROytPFh
         EPd7IOSBhS9UNBQ+oXIfPOYlSgsi0b7eIT93eO8QBpEriYcTNWK+MsGOAPRuu+e1WW+Z
         eWbrIgwxpPPf8LC22hBTif0wotGiZr7HGTgqrjaFglyqwaphd3U5edZT5ms1KmfjQ7MT
         y08ivBF911QcdVv7IPt+cINqxq1acma6CweT3udPI5FxHmjH0raUSUr8aYIs8yXvYFIb
         5wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313088; x=1782917888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fnCbxW9XzGA16mXvyVagPlrUc6bIGxDm63u9PSaRfE8=;
        b=AMF4EWx5pDl/LoTECcSo7OVZaG7+zYSvhCS5p0YUre/XwfZ1G8SqGXJwv2CEX7+6XZ
         a5fPXxofzlwwZFZyP/iqTwkTb2dvTJGAclEsbSA5xKmcp+HmSxjMI3IHaq9Za6bTYyeb
         TpYdfVSLwI9aOXLBRPyLjOeBHQ1OzYQq6vbO/VyxUyrTABt8u9/6HHPZxh3drIW3FnmC
         NkrVphBtQF/HE0owD6LAQ+SChFUH8RiiAH78hcD8mCljBETAUPXf4NsLzosqtqXrnG02
         fRMEEZF7rl8K49U00+fZ+Q3rdr5Iv6rYZuzCaeLC+Yok0jS469X+BbMgwRYykV9Ob21d
         x6qg==
X-Forwarded-Encrypted: i=1; AFNElJ+UWOQzNyffVzyZiRlYxk92wgn7c/AWT8xDbNz2e4pUOEIyHnjD0rdgL1g5/frvxSjYAYhJWyuDycPvw2B3Qs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDOLP1nprkG1py3Zb8VYPAp8KQ6uLVR8wvep22WFPbvqBxd+h
	ZIjoDZOvS5xuUQhdEJ6vqdV2p0UDQcNIs3CWuohCACRGOlzfVg0xUDg2lrNneGDzfTQ=
X-Gm-Gg: AfdE7cnBiBM+8gLo0S06Sp5mmF/Z7cNv4vAccXutpUdm1wgMYwdNQ1+h/i6NIOYpcpU
	5mUsyQcYFR7tvMfPIDyq07E/ZzBmr2T+II5QwCINBT/leOIQCg137oKUPdmBjR/sdJ1nmDhn3XM
	OosnUwjsQ5I179Hk97CHg84sCEkc8UWzKnw5XEtH4URf7gh01bXArM+S14EvFpG7B2z3r3Deepu
	q7tRjoI4DCC/iJyvVSb4GkDR3krKXwzwe6PwgKcxhEFl7hKgHyZ+nNTl71IvRH/tmzr1hxXNxEm
	woYS4A+q0o7ji4FjC+2fzhATD766/N4gnZ4loFQmrz13URBHftlOBOeplvPoktcOw7AMVO37//8
	gtH4sqZyISTcuoz2GuF0tg034Mi9hMEvXy3M+T9zuTaOE3Lluz0aFgJYnI6FkzhsQI0MxJq01QQ
	oukxib3Af7RXiZJAYJ+kusbDshuHrhVmH4m+BErqq97cl1iLDJpfZutxGQDwOWXIU/hip7zN7kK
	A==
X-Received: by 2002:a05:622a:248:b0:517:760d:48ea with SMTP id d75a77b69052e-51a61b2a185mr56005681cf.18.1782313087785;
        Wed, 24 Jun 2026 07:58:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:58:07 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
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
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 6/9] dax: plumb hotplug online_type through dax
Date: Wed, 24 Jun 2026 10:57:41 -0400
Message-ID: <20260624145744.3532049-7-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
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
index 5909171a4428..f3c9dae5de6b 100644
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
+	enum mmop online_type;
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
index 81e4af49e39c..ccd77965fe3e 100644
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
+	enum mmop online_type;
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
2.54.0

