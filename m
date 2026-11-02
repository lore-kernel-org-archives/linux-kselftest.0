Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633842;
	b=izOQrhKDCLI2XfZoLqK+h9wtlGZMigjeq6AyGwTbHAIWk8RpddPEgBXDeWomygUgYvf/
	 c2utTqUxRsFCTfLJMFUCv/q0I9FAK2X6QZ7CzBtlZazIiFEznDlsuDpycY8YAYVhS5AB2
	 w6CqCMQjyGYLksdZzQ6BDuC17/3vBnT9MXtiIQExiBS2a6A8TaYe9x5JKfW1uklok5nzV
	 BD+/2KwM5+h7DTKmpOGLO1XmfnL7duIxvY0Cf5JiSQ9RID+3DQc+uGfvTxszqKeX9fU+H
	 ij2BA1++1rDkZaXvbFbuvh4CFOoStzPyheHqx1xdbEyZwt3QjsmMa5KvDhonxO5cHfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
	b=ynnQHTkknDKuvQvADd6VKelp8EdoCLG2Rm5Y1tITFnBQIvUh68LVI+dP2WK+Ct8zc38X
	 hgnH0AykYCzkJ8KcPkoxFtlS9WYHTnahgRQ2BApKM4nVDMU/7YMZHYW3mCWzBXDN+Qk6p
	 3QSLPZ+IRyIA437oXlkMPk/Ogd1aci5aa+332G3J//lMmGIIOYR0GKPLWLkUOyFAjk0MW
	 PE0GMI8p+FpCty7efelspmYchMlzgirt7uufhwNE/qOzIzNZ0lYoQ8Aq/sVIKO3mNssEW
	 DwTzR2+6KC/1mU2bLMZa7RGcn8EEWuLcLKQEFET18mpNB2yT7oDNpZlmc+rfXh2pkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh1oMFk;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4021B60A6C1A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4021B60A6C1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh1oMFk
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso53693995ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633841; x=1794238641; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
        b=SYh1oMFkhceG3pV1vARm5UfRZJq/jUcCzAISHYUSPXhNGXhCb5BtUK7Rnu5bZ07z0A
         NINrqT14ux5wmPIAGNZ2ebwGFVxRBp/gBvFHWdSA0dO/eppTb9OxbXw5O9JBI7B2t8A5
         O10mjjrBBNOAeDLfjFxdN1ccMIW1uPoqqMN9/wxsUhbjJelZL3r6ubNoqS4MKHE7ngil
         JxmTdd9pDgUSx6b+CgNuX11RmF7nayjrBBIOArHf4D922eH1g47CkGhnr9W75v/6qZiV
         Ynx9s5Dr1qI+56RbDLqIwO0M4SN0RCTJqhDSg2uPZawsZx3Gaes369FwVLwuXtY4PoFn
         CHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633841; x=1794238641;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAmKs654GCi6VXGTIXtG/L5qz01wzAI854D1tv9w8Xg=;
        b=S/cxhECwH9f7aW88vAOdIMPPeZHhWsQocZ73tcHref6Wxc57VzKqBUmdkpqxarO2sJ
         wjxhBrbU3bAiRy2GbQlEfzX+wNGyrZZ99pjCqliY3kuXFw5mIyTcc0uI1yhnqTHf7LZF
         Y4ulc3Ki/HMeskxqPWha9ijArnmEyas2kTIPGE3fGEv/dSvtR5SRPpHSmY1VZGL8c9Bd
         7WZm8MHfz+IYLwwD3SErwsWmXbDS5pneBM13oE9CRwDVbEH31zS1d0AqKr+6FXqvexJr
         ZbEpGvgfNolJv26kiJIhisOCZO4SmbWNq2z8JtYId9zULV+cFus267RlpmJYZGC0JPf+
         GZig==
X-Forwarded-Encrypted: i=1; AKwUvBx0bNZ1NJzYrBUfZLok4bERTUi3hIoMihM2zP79G4VQNRseb56/+YtGg3tU+SHjKi8AESB2+/9cvvFNSvmfeBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84m8yrEmQzQX4vkeNqXurinmVLMICoeeSU/HWAeHbFZWo5dswM
	JigkyodrHHBUq3KFT99Nu3r0+sSbeQoTiHOv/+G3lAZKmh85NMU5fCQqJXI7hdBGMJGhEZ+Be50
	2csj1+gnA3w==
X-Received: from pjqc8.prod.google.com ([2002:a17:90a:a608:b0:3ae:5572:c4d3])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e88:b0:3ac:85be:cd52
 with SMTP id 98e67ed59e1d1-3ae89867829mr8253650a91.59.1793633841328; Mon, 02
 Nov 2026 07:37:21 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:49 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-21-vipinsh@google.com>
Subject: [PATCH v6 20/27] vfio: selftests: Add iommufd noiommu mode
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Add an opt-in iommufd_noiommu mode (MODE_IOMMUFD_NOIOMMU) for devices
bound to vfio-pci in noiommu mode. When a device is in noiommu mode, its
VFIO character device is named /dev/vfio/devices/noiommu-vfioX (opening
it requires CAP_SYS_RAWIO), and binding and attaching to an iommufd IOAS
use a software page table.

Add __vfio_pci_get_cdev_path(bdf, noiommu) to look up either the regular
or the noiommu cdev path and return NULL when none is present, and make
vfio_pci_cdev_open() select the cdev based on mode->noiommu.

Because a device in noiommu mode DMAs directly to physical addresses,
tests that program arbitrary or unmapped IOVAs would corrupt memory.
Keep MODE_IOMMUFD_NOIOMMU out of FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES()
so that only noiommu-aware tests opt into it.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          | 17 ++++++++++
 .../lib/include/libvfio/vfio_pci_device.h     |  7 +++++
 tools/testing/selftests/vfio/lib/iommu.c      |  9 +++++-
 .../selftests/vfio/lib/vfio_pci_device.c      | 31 +++++++++++++------
 4 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..e652b8caf5bb 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -13,6 +13,12 @@ struct iommu_mode {
 	const char *name;
 	const char *container_path;
 	unsigned long iommu_type;
+	/*
+	 * For devices bound to vfio-pci in noiommu mode, i.e. not behind an
+	 * IOMMU. Such devices DMA to the addresses programmed into them as
+	 * physical addresses.
+	 */
+	bool noiommu;
 };
 
 extern const char *default_iommu_mode;
@@ -67,6 +73,17 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges);
 #define MODE_IOMMUFD_COMPAT_TYPE1V2 "iommufd_compat_type1v2"
 #define MODE_IOMMUFD "iommufd"
 
+/*
+ * iommufd with a device bound to vfio-pci in noiommu mode
+ * (vfio.enable_unsafe_noiommu_mode=1 and CONFIG_IOMMUFD_NOIOMMU), whose cdev
+ * is /dev/vfio/devices/noiommu-vfioX. Opening it requires CAP_SYS_RAWIO.
+ *
+ * Not part of FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(): tests must opt in, since
+ * the device DMAs to IOVAs as physical addresses, and tests that DMA to
+ * arbitrary or unmapped IOVAs would corrupt memory.
+ */
+#define MODE_IOMMUFD_NOIOMMU "iommufd_noiommu"
+
 /*
  * Generator for VFIO selftests fixture variants that replicate across all
  * possible IOMMU modes. Tests must define FIXTURE_VARIANT_ADD_IOMMU_MODE()
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 9a62bfb6b440..bfadeb362723 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -154,6 +154,13 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
 }
 
+/*
+ * Return the path of the VFIO cdev of @bdf, or NULL if there is none. The cdev
+ * of a device bound to vfio-pci in noiommu mode is named noiommu-vfioX rather
+ * than vfioX, and @noiommu selects which of the two to look for. Free with
+ * free().
+ */
+const char *__vfio_pci_get_cdev_path(const char *bdf, bool noiommu);
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index b6f3c5c84e01..0df49646d016 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -22,7 +22,10 @@
 
 const char *default_iommu_mode = MODE_IOMMUFD;
 
-/* Reminder: Keep in sync with FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(). */
+/*
+ * Reminder: Keep in sync with FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(), which
+ * deliberately leaves out the noiommu modes.
+ */
 static const struct iommu_mode iommu_modes[] = {
 	{
 		.name = MODE_VFIO_TYPE1_IOMMU,
@@ -47,6 +50,10 @@ static const struct iommu_mode iommu_modes[] = {
 	{
 		.name = MODE_IOMMUFD,
 	},
+	{
+		.name = MODE_IOMMUFD_NOIOMMU,
+		.noiommu = true,
+	},
 };
 
 static const struct iommu_mode *lookup_iommu_mode(const char *iommu_mode)
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index af789c859586..b0deef2b0e3f 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -380,35 +380,42 @@ static void vfio_pci_device_setup(struct vfio_pci_device *device)
 		device->msi_eventfds[i] = -1;
 }
 
-const char *vfio_pci_get_cdev_path(const char *bdf)
+const char *__vfio_pci_get_cdev_path(const char *bdf, bool noiommu)
 {
+	const char *prefix = noiommu ? "noiommu-vfio" : "vfio";
 	char dir_path[PATH_MAX];
 	struct dirent *entry;
-	char *cdev_path;
+	char *cdev_path = NULL;
 	DIR *dir;
 
-	cdev_path = calloc_assert(PATH_MAX, 1);
-
 	snprintf_assert(dir_path, sizeof(dir_path), "/sys/bus/pci/devices/%s/vfio-dev/", bdf);
 
 	dir = opendir(dir_path);
-	VFIO_ASSERT_NOT_NULL(dir, "Failed to open directory %s\n", dir_path);
+	if (!dir)
+		return NULL;
 
 	while ((entry = readdir(dir)) != NULL) {
-		/* Find the file that starts with "vfio" */
-		if (strncmp("vfio", entry->d_name, 4))
+		if (strncmp(prefix, entry->d_name, strlen(prefix)))
 			continue;
 
+		cdev_path = calloc_assert(PATH_MAX, 1);
 		snprintf_assert(cdev_path, PATH_MAX, "/dev/vfio/devices/%s", entry->d_name);
 		break;
 	}
 
-	VFIO_ASSERT_NE(cdev_path[0], 0, "Failed to find vfio cdev file.\n");
 	VFIO_ASSERT_EQ(closedir(dir), 0);
 
 	return cdev_path;
 }
 
+const char *vfio_pci_get_cdev_path(const char *bdf)
+{
+	const char *cdev_path = __vfio_pci_get_cdev_path(bdf, false);
+
+	VFIO_ASSERT_NOT_NULL(cdev_path, "Failed to find vfio cdev file for %s\n", bdf);
+	return cdev_path;
+}
+
 int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 {
 	struct vfio_device_bind_iommufd args = {
@@ -449,10 +456,14 @@ static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
 
 void vfio_pci_cdev_open(struct vfio_pci_device *device, const char *bdf)
 {
-	const char *cdev_path = vfio_pci_get_cdev_path(bdf);
+	bool noiommu = device->iommu->mode->noiommu;
+	const char *cdev_path = __vfio_pci_get_cdev_path(bdf, noiommu);
+
+	VFIO_ASSERT_NOT_NULL(cdev_path, "Failed to find %svfio cdev file for %s\n",
+			     noiommu ? "noiommu-" : "", bdf);
 
 	device->fd = open(cdev_path, O_RDWR);
-	VFIO_ASSERT_GE(device->fd, 0);
+	VFIO_ASSERT_GE(device->fd, 0, "open(%s) failed\n", cdev_path);
 	free((void *)cdev_path);
 }
 
-- 
2.56.0.317.g454f8302e1-goog

