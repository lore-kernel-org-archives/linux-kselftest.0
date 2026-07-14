Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A649551E
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042120; cv=none; b=Wob3Czhbx0I3Nj1qmWUQfkuLG6/h3hVCGgJXaJie5TBPROXdcmOl7p2vxuxs/aD4b+P0oKj5NivNFsoBMPZpL7PD6nc9HumwFd5uUyD9s443D8MlgJGExhKpWHt8YyLJLdBb2g5YSUPwpYluwC5tBook8zaVp1toBQGHkb1ekgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042120; c=relaxed/simple;
	bh=aKGWYiSzEZ4niXjLldUisRuvryDVWAvVanTamVNf5F8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dd+8P2NmMc5kAqHk0zEe6HCpazPp6M8qb3sGhxTt3b4R6ELo+xK5r37uDLmirp8UFI3jFxQQvVfSbhVW+gXCjnadiTAf8qvGhQp/W9Kg6Q8tvC6rrFqx8DtdKTcFHGHtpW5bDRsODbKqCDlFtPGFQWAaNSsPNJx+PHvlBXYMSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kLJM4HRA; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kLJM4HRA"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-84865f326efso4917080b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042117; x=1784646917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JxusoxEn+ehjTRVvbJo8Z2+RthtKj17Kn8IH4fWGXA=;
        b=kLJM4HRAEfedtLhhHWD0BQCFBly2bVG1r1HtPoJB5UqPJUkZjxtXQPt+DPgPBexBsR
         Fl9ungd9E63hblkBowIewt1qFRYxcH1Z9qo2wFKjhNy76Gf/Ya8fXTI4nGP0OO6QNkUr
         Kz1qLIRQNAmf2JzAnGIjJUG5DvKkMLnzB9xAmsnih5nI17dGh0cXnxvVKlAUvmCpQ5IO
         mlle5DpQyauOLmoybs8JaAH8Zf2nKONStAPaOZF1EEEZjakColhv2wY+toChaRV0axVB
         7fQ10m4ESEWqPtKY65ZjsTGCHZtsOPBXprL2+W27CSD+jKm4ex2bEVgHgobGIm7SXRjC
         DMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042117; x=1784646917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JxusoxEn+ehjTRVvbJo8Z2+RthtKj17Kn8IH4fWGXA=;
        b=UueAxkuLOzBAWvaLTZjyHwK/tLKXoyrbu36I/p715c5p9nz6CJqPlRwarEd2HZuh/Y
         JTr2F9O5Rcxzua/S2A+1BfZ7EELVaOdBq19LuEHbXNTvDfyR80qJup/ESf0i+PZPmDdm
         Ter6MlieDGy7HO91NEKR3LjZsgN6hFbIriqgnHCys35NJs8lvBfaeoBECx7krRqfJoSn
         73djud9dJGrYD5Fjt4pqS/vYpZ5/fJJ1XkTnG8d7wfY5o4MtRJVamw7drdUppSF/pgHy
         niVjMSklajIX7FL5oXw6ugOWtX+nysjZsEdQ1W9c6jOJOQ/d2UrbAPQXUuZKD9UvAIhe
         JhKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoROYCLd0nZgwuoc2mngGHv79DvUA2DGXrzpmkopDD3sgUA6sGcoAaWaWvAR9W/D+RYmo0/pguP7K4+5C6etRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5msHRra9/0iqMroKSXPIpeC+WACc+ZT2cfuW1xaT/2DNJpF2
	kCJgFyduNEZiSwud0eMvzjUDtjgba8j/jWeZGwuYj9Fn06IizLq0zrJX8V4aXT7CA+0bkJ5NhTt
	fJtDHsP0HJA==
X-Received: from pfbcr14.prod.google.com ([2002:a05:6a00:f0e:b0:84a:2de2:315f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94f5:b0:82f:2b0:2809
 with SMTP id d2e1a72fcca58-84889637281mr13764500b3a.1.1784042116875; Tue, 14
 Jul 2026 08:15:16 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:52 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-8-vipinsh@google.com>
Subject: [PATCH v5 07/20] vfio: Introduce vfio_find_device() helper
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Introduce vfio_find_device() to discover a registered vfio_device from
vfio_device_class matching user-provided criteria.

To ensure safe lifecycle handling, vfio_find_device() acquires a
registration reference (device->refcount) via
vfio_device_try_get_registration() rather than relying solely on
device.kref taken in class_find_device(). Holding only kref allows
vendor modules to unload while external callers hold device pointers,
leading to a kernel panic on release. Callers must release the device
via vfio_device_put_registration().

Additionally, move refcount_set() prior to vfio_device_add() in
__vfio_register_dev() so device->refcount is initialized before the
device is published to class lookups, avoiding registration data races.

On vfio_device_add() failure, the error path drops the initial
registration reference and waits for completion to drain any reference
taken by a concurrent lookup before returning the error to the driver.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/vfio_main.c | 64 +++++++++++++++++++++++++++++++++++++---
 include/linux/vfio.h     |  2 ++
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2437af031169..e91fd83dc58d 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -13,6 +13,7 @@
 #include <linux/cdev.h>
 #include <linux/compat.h>
 #include <linux/device.h>
+#include <linux/device/class.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
@@ -359,17 +360,20 @@ static int __vfio_register_dev(struct vfio_device *device,
 		goto err_out;
 	}
 
-	ret = vfio_device_add(device);
-	if (ret)
-		goto err_out;
-
 	/* Refcounting can't start until the driver calls register */
 	refcount_set(&device->refcount, 1);
 
+	ret = vfio_device_add(device);
+	if (ret)
+		goto err_add;
+
 	vfio_device_group_register(device);
 	vfio_device_debugfs_init(device);
 
 	return 0;
+err_add:
+	vfio_device_put_registration(device);
+	wait_for_completion(&device->comp);
 err_out:
 	vfio_device_remove_group(device);
 	return ret;
@@ -1797,6 +1801,58 @@ int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
 }
 EXPORT_SYMBOL(vfio_dma_rw);
 
+struct vfio_device_match_data {
+	const void *data;
+	device_match_t match;
+};
+
+static int vfio_device_match_fn(struct device *dev, const void *data)
+{
+	struct vfio_device *vdev = container_of(dev, struct vfio_device, device);
+	const struct vfio_device_match_data *mdata = data;
+
+	if (mdata->match(dev, mdata->data)) {
+		if (vfio_device_try_get_registration(vdev))
+			return 1;
+	}
+	return 0;
+}
+
+/**
+ * vfio_find_device - Find a registered VFIO device matching search criteria
+ * @data: Context data passed to the @match function
+ * @match: Device match callback function
+ *
+ * Finds a registered VFIO device in the vfio_device_class matching the search
+ * criteria specified by @match.
+ *
+ * On success, this function acquires a registration reference on the matched
+ * device via vfio_device_try_get_registration(). This pins the device and
+ * prevents its vendor driver module from unloading or unbinding while the
+ * reference is held.
+ *
+ * Return: Pointer to the matching vfio_device on success, or NULL if no
+ * matching device is found. The caller MUST release the acquired registration
+ * reference using vfio_device_put_registration() when finished with the device.
+ */
+struct vfio_device *vfio_find_device(const void *data, device_match_t match)
+{
+	struct vfio_device_match_data mdata = { .data = data, .match = match };
+	struct device *device;
+
+	device = class_find_device(&vfio_device_class, NULL, &mdata, vfio_device_match_fn);
+	if (!device)
+		return NULL;
+
+	/*
+	 * Drop standard kref reference. Caller holds reference from
+	 * vfio_device_try_get_registration().
+	 */
+	put_device(device);
+	return container_of(device, struct vfio_device, device);
+}
+EXPORT_SYMBOL_GPL(vfio_find_device);
+
 /*
  * Module/class support
  */
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index cf0d941d0410..42c3a9ae3a85 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -430,4 +430,6 @@ int vfio_virqfd_enable(void *opaque, int (*handler)(void *, void *),
 void vfio_virqfd_disable(struct virqfd **pvirqfd);
 void vfio_virqfd_flush_thread(struct virqfd **pvirqfd);
 
+struct vfio_device *vfio_find_device(const void *data, device_match_t match);
+
 #endif /* VFIO_H */
-- 
2.55.0.795.g602f6c329a-goog

