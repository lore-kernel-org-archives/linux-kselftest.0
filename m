Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E174A1386
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042122; cv=none; b=t+xgFhLmmsp4/7jTSUXHGhEWSek094Uqj17l9WvJxbHPwys7I7ZMYXekldwTf48t3qIXKSotumkdEmrtoABRwJjr8xmB8qIeq+DCH8eW8Vm+0ZJivetWjUu9KbkdDwGW+Cb2mWkqVfe/UaD1D4hcVGJMX0itZ9TA/QxBgbQdQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042122; c=relaxed/simple;
	bh=KxwauFSG6vbKAkq6gpdomeQJiBPpzZsdR8oSo2q1AAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JMMcVoK+Dcma99JkUkvSl4HtX92EVD7CN1BXktUyeRAhItbOq89Up4dCy4hPHFi2uoIyZY/C4s/2Tz8c+VJHfuW0eIwNpw6Wjto5ByMESvwlflr3ZaXEUorKZa+a7ChnxTmmS64bnubSLfq1NlIHJ2SlJ9GAcEBE7T2RRItYtgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2CWa0jP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2CWa0jP"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso2428945a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042119; x=1784646919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk6o2vphXfQkoL1z/+pIbWzomzkKJfAmoavVaL/E+Fg=;
        b=J2CWa0jPNcS/n5ijCnmp/29Y0SnnucVQHu1YQrfxNFWU/6AYE6afIWtoBJGunolgZn
         qZqyR1QXtXWDO+epUBNnsfmyO3Sle4EYwCvgCshErFthwxaY9YmUp8SxoCH4kADHnIXy
         iv3uc+3KRtgT1+p8UxUyl1Gvb+WG+DIxkLFoc1dTruqvO2VdxN0MRzVD24Ubm6A0lVr5
         5o+0iWaJayMbi0nI6sRgCQvzDJZ9GgLeDOfhsHP0WAnphxLjQpJxHGRJSSnQ8ggD8UWI
         US9Qwe9hqCpD5XPB+HdSOykJ0TkW81btzYkApyXLKoUDK0Lu0Ri6zvOUMYj6KxvZZUw4
         fhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042119; x=1784646919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk6o2vphXfQkoL1z/+pIbWzomzkKJfAmoavVaL/E+Fg=;
        b=sPJuaW3j1ozkELgZfanpgPqkfKmv3kwAVc2NGLxba2l752dJIHHOumIErYYgpyWaIx
         qrCFVAXsNgbez5W53mZMVZVbT92EVJAJXdZJkq/SPJ5rqWf0LRPssihD0PBLfYQOPgQX
         VCy1Ps+H7oisUCsCy0ituY+eCtn/rkMnBeQKff8OjdX9LmgSTYRZZqXN8Vjj9SD9g4DI
         Sz1tC9Gz/FYAwKtZIOOzmosCRJ9szjpGklPKrsmRE2lvXpIDdxKqk+uJfxrd1K7Wg5XS
         K/Y6GThHabJlZTswL437qrz5WPPmjEGfIFB2Z/4Z1/dk+5desYCtdsMYEqeu5KWRhkcd
         yp3A==
X-Forwarded-Encrypted: i=1; AHgh+Rodn5oN5KNLub8GcpyqjgDPo8t6+SSlyeU8BxEybgFoUCCuzgbCOVjoEnK28f3QCm9TDUHJ5jUlmsW3MpGbz4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFbm6jo4L9bAEW+NHlVRqYzyZWnozSyXaaDkiIx+jndf7N0mD1
	IsW3huNJcb0IqomiUKrhNQRI/2q0noxGIWyEevHQQZFLS5NgUAybE69rHSM0Z6kqDZw1HOFe+/V
	WKuNLkJrQGw==
X-Received: from pjyu5.prod.google.com ([2002:a17:90a:e005:b0:383:f7b7:fb7])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc9:b0:381:528a:808a
 with SMTP id 98e67ed59e1d1-38dc7735977mr13456012a91.27.1784042118892; Tue, 14
 Jul 2026 08:15:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:54 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-10-vipinsh@google.com>
Subject: [PATCH v5 09/20] vfio: Add API to open cdev device for Live Update restore
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

During Live Update restore, VFIO PCI driver needs to recreate the device
file context that was preserved before kexec and return it to the user.

Provide an API for VFIO Live Update to get VFIO device file. Use an
anonymous inode when creating the file, since the retrieved device file
is not opened through any particular cdev inode, and the cdev inode does
not matter in practice.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c | 39 ++++++++++++++++++++++++++++++++++++--
 include/linux/vfio.h       |  9 +++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 2231423fe56d..970932f22ecb 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2023 Intel Corporation.
  */
+#include <linux/anon_inodes.h>
 #include <linux/vfio.h>
 #include <linux/iommufd.h>
 
@@ -16,9 +17,10 @@ void vfio_init_device_cdev(struct vfio_device *device)
 	device->cdev.owner = THIS_MODULE;
 }
 
-static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
+static int vfio_device_cdev_open(struct vfio_device *device, struct file **filep)
 {
 	struct vfio_device_file *df;
+	struct file *file = *filep;
 	int ret;
 
 	/* Paired with the put in vfio_device_fops_release() */
@@ -31,6 +33,24 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 		goto err_put_registration;
 	}
 
+	/*
+	 * Simulate opening the character device using an anonymous inode. The
+	 * returned file has the same properties as a cdev file (e.g. operations
+	 * are blocked until BIND_IOMMUFD is called).
+	 */
+	if (!file) {
+		file = anon_inode_getfile_fmode("[vfio-device-liveupdate]",
+						&vfio_device_fops, NULL,
+						O_RDWR, FMODE_PREAD | FMODE_PWRITE);
+
+		if (IS_ERR(file)) {
+			ret = PTR_ERR(file);
+			goto err_free_device_file;
+		}
+
+		*filep = file;
+	}
+
 	file->private_data = df;
 
 	/*
@@ -42,11 +62,26 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 
 	return 0;
 
+err_free_device_file:
+	kfree(df);
 err_put_registration:
 	vfio_device_put_registration(device);
 	return ret;
 }
 
+struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device)
+{
+	struct file *file = NULL;
+	int ret;
+
+	ret = vfio_device_cdev_open(device, &file);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return file;
+}
+EXPORT_SYMBOL_GPL(vfio_device_liveupdate_cdev_open);
+
 /*
  * device access via the fd opened by this function is blocked until
  * .open_device() is called successfully during BIND_IOMMUFD.
@@ -56,7 +91,7 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *file)
 	struct vfio_device *device = container_of(inode->i_cdev,
 						  struct vfio_device, cdev);
 
-	return vfio_device_cdev_open(device, file);
+	return vfio_device_cdev_open(device, &file);
 }
 
 static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 42c3a9ae3a85..b896c64b11da 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -430,6 +430,15 @@ int vfio_virqfd_enable(void *opaque, int (*handler)(void *, void *),
 void vfio_virqfd_disable(struct virqfd **pvirqfd);
 void vfio_virqfd_flush_thread(struct virqfd **pvirqfd);
 
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device);
+#else
+static inline struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif /* IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV) */
+
 struct vfio_device *vfio_find_device(const void *data, device_match_t match);
 
 #endif /* VFIO_H */
-- 
2.55.0.795.g602f6c329a-goog

