Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633847;
	b=BIN7tELeZzyo5m8WnsHxYmSxftiUw3sKXi3B6si7jnQNmb40xwLZC+nBg2sgHxUpvlN3
	 atiVW7iQ01cWz56FVTeK+9kLCHxVSIVdVEsew4a6l72/8pLOLDkYsNLKACHb1VmEUrPol
	 bJiDIVlxzojA6JIWNJY3WgT4FaxVJThxMFJ2R0PB7DU0KpbtzzO0Pf2wpiAYZii0ujWdq
	 xXeDTuuz/lICPa78GpvHk851dB6bkCwAnG4DUHOJDpD6VpM/JanGbONw339CO2aTKsb4x
	 LkAuuHWE2zmI/kh2YoI2p7w9ysKwmDQ9hZlXJIBg2YPTsf+ldhEXdi6WW+AAVe2j6Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=P5Sj6s4WCpHUP3cSZIKUa0LCg/XSbNt4xz/AARSS1Lk=;
	b=PY7qAjsNU26RJo+gl6aJjYx5YAcIzqD7njwSbUnTWmfif/iTJUD7XZpZIEiGBbibVN/0
	 8e09rD8hWdgGjudrdtZT1XHbqZzTI+iy08PdBWxmuSvQPM2cqxoGI6Xadj2XgZA92FOQo
	 tl4ha+BeLEmLPMp+w5HexA6jI8ir0dL+IXHISRnO5KFKbgCYIu065VTQzTLvkDYzvq/HH
	 hTSDqD1IsX+JIDu3qWC7uVPOMa82oruh0ExBFM2QtN1vBkmawQ6yOiDsdlPLSxS9fDlLz
	 49HimFvdiEYPwIjEWpFGnnLn4+h5tCYYgf/HmFS1d0+lF59bf8Na8RylNwt3V7DtXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3TJBwA3;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9960A6C36
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F9960A6C36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i3TJBwA3
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3473286a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633846; x=1794238646; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5Sj6s4WCpHUP3cSZIKUa0LCg/XSbNt4xz/AARSS1Lk=;
        b=i3TJBwA3K6IxqO6/unMjfy1bgQPYGEzbRnEMK7TsnfQVGXtmDN4FYN3JAcUE+swkE0
         /Xz/YkUcKm45miwLQtvwUdswFvcWmvdOVNf7DYsNGPYulBagCkFPitFspcuejeeO+RIS
         oiZsHv93mZBioFJEPetcUMQwW1w3ZKhXN/QO8637BKjkyNPUZ11m2uSgdhVbNYTbohS1
         UF9ksPq62N2vRB1VEUuKSXr8ppjPz17WW53TV69+YtKgyXdKBcpS+xHZee8zMUFM2GU5
         12gjX96oRF0tpUiNJZYOwxR0MoK8C9zrSQJvlm2gyzj1XASX/Vogo8yk60AHQlCVjCQX
         Ag+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633846; x=1794238646;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5Sj6s4WCpHUP3cSZIKUa0LCg/XSbNt4xz/AARSS1Lk=;
        b=NmlXlhiOdC1BLw7187usz0RjeN8di2+n6nmJUc+ipVnrH3W+bdARAQRRGCz2RzUidp
         09UGqgZ+ITTX6qiRaQDlx48yr1Tr+hdk8ZGLbAwDaSqEHSXqNLDDeE1hEDvVBeo8KBm/
         bnAX+oM87EN2L7DGby4/Lu/7wQhydbXLvYHIyhgXpY1V/Qmo7od2rCzTWbpCo5uh+M+4
         KewGuwoYuUq47ZGP9kXda1WLJ6VXZS9M6iVm+BAnQwD81Hy97f8R+cMYbYmWuLIDbEEn
         UYXDxGMTszmCEOuVuUXbUhVJgjeQ2RtW3ERkwS4VJ3/WuFTbJiOC/2aKZ6xZSesux3rY
         HiCg==
X-Forwarded-Encrypted: i=1; AKwUvBwfrZIlajohir+WvbrZZVEZozGusPcVL4wZka4obQG8u8szZNEpCHwEdGamxhDMTl/o9V60cG6qAYqnY7xEjzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQAuWj1pA6CMNS66xXuFi/z64mKLwsruSelkII33pDhj709wq+
	pXU4Wkw2aH6aiWKF5jtKEiBDdgDUSAhWlscaCf59QFs+RRSPJ7CGFdOpM6fUPSqVXBxMBOF9OK2
	uG0b0ELwwEg==
X-Received: from pgy32.prod.google.com ([2002:a63:1860:0:b0:cd6:1e1f:43b])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b58b:b0:3e1:9220:9d10
 with SMTP id adf61e73a8af0-3e928986bcemr8116448637.35.1793633845567; Mon, 02
 Nov 2026 07:37:25 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:53 -0800
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
Message-ID: <20261102153656.1431701-25-vipinsh@google.com>
Subject: [PATCH v6 24/27] vfio: selftests: Test preserving noiommu devices in vfio_pci_liveupdate_uapi_test
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

Add the iommufd_noiommu fixture variant to vfio_pci_liveupdate_uapi_test
and detect at startup whether the target device is bound to vfio-pci in
noiommu mode so that variants not matching the device cleanly skip, in
addition to skipping iommufd variants when probing
luo_session_preserve_fd() in FIXTURE_SETUP reports -ENOENT (e.g. on an
SR-IOV VF or when CONFIG_VFIO_PCI_LIVEUPDATE=n).

When the device is in noiommu mode, verify that preserving its bound
VFIO cdev FD succeeds, and add tests verifying that:
- preserving an unbound second cdev FD fails with -ENOENT without
  affecting the bound FD (preserve_unbound_fd_fails),
- preserving a cdev FD that was never bound fails with -ENOENT
  (preserve_never_bound_fails), and
- closing the Live Update session unpreserves the device so that it can
  be preserved again in a new session (preserve_after_unpreserve).

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/vfio_pci_liveupdate_uapi_test.c      | 103 +++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c
index da25ea4e2b1e..46e97caf1f54 100644
--- a/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <fcntl.h>
+#include <linux/pci_regs.h>
 #include <libliveupdate.h>
 #include <libvfio.h>
 #include <kselftest_harness.h>
 
 static const char *device_bdf;
+static bool device_is_noiommu;
 
 FIXTURE(vfio_pci_liveupdate_uapi_test) {
 	int luo_fd;
@@ -45,10 +48,19 @@ FIXTURE_VARIANT_ADD(vfio_pci_liveupdate_uapi_test, _iommu_mode) {	\
 }
 
 FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES();
+FIXTURE_VARIANT_ADD_IOMMU_MODE(iommufd_noiommu);
 #undef FIXTURE_VARIANT_ADD_IOMMU_MODE
 
 FIXTURE_SETUP(vfio_pci_liveupdate_uapi_test)
 {
+	bool variant_is_noiommu;
+
+	variant_is_noiommu = !strcmp(variant->iommu_mode, MODE_IOMMUFD_NOIOMMU);
+	if (variant_is_noiommu != device_is_noiommu)
+		SKIP(return, "%s does not apply to a %s device",
+		     variant->iommu_mode,
+		     device_is_noiommu ? "noiommu" : "non-noiommu");
+
 	self->luo_fd = luo_open_device();
 	ASSERT_GT(self->luo_fd, 0);
 
@@ -77,6 +89,7 @@ FIXTURE_TEARDOWN(vfio_pci_liveupdate_uapi_test)
 
 TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
 {
+	int expected;
 	int ret;
 
 	ret = luo_session_preserve_fd(self->session_fd, self->device->fd, 0);
@@ -85,7 +98,84 @@ TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
 	 * Only VFIO cdev files of devices in noiommu mode can be preserved;
 	 * device files obtained through a VFIO group never can.
 	 */
-	ASSERT_EQ(ret, self->iommu->iommufd ? -EOPNOTSUPP : -ENOENT);
+	if (device_is_noiommu)
+		expected = 0;
+	else
+		expected = self->iommu->iommufd ? -EOPNOTSUPP : -ENOENT;
+
+	ASSERT_EQ(ret, expected);
+}
+
+TEST_F(vfio_pci_liveupdate_uapi_test, preserve_unbound_fd_fails)
+{
+	const char *cdev_path;
+	int unbound_fd;
+	int ret;
+
+	if (!self->iommu->iommufd)
+		SKIP(return, "Only iommufd modes use VFIO cdev files");
+
+	cdev_path = __vfio_pci_get_cdev_path(device_bdf, device_is_noiommu);
+	ASSERT_NE(cdev_path, NULL);
+
+	unbound_fd = open(cdev_path, O_RDWR);
+	ASSERT_GE(unbound_fd, 0);
+	free((void *)cdev_path);
+
+	/*
+	 * A second cdev FD that has not been bound via VFIO_DEVICE_BIND_IOMMUFD
+	 * must be rejected even while another FD for the same device is bound.
+	 */
+	ret = luo_session_preserve_fd(self->session_fd, unbound_fd, 0);
+	ASSERT_EQ(ret, -ENOENT);
+	ASSERT_EQ(close(unbound_fd), 0);
+
+	/* Verify the failed attempt had no side effects on the bound FD. */
+	ret = luo_session_preserve_fd(self->session_fd, self->device->fd, 0);
+	ASSERT_EQ(ret, device_is_noiommu ? 0 : -EOPNOTSUPP);
+}
+
+TEST_F(vfio_pci_liveupdate_uapi_test, preserve_never_bound_fails)
+{
+	const char *cdev_path;
+	int unbound_fd;
+	int ret;
+
+	if (!self->iommu->iommufd)
+		SKIP(return, "Only iommufd modes use VFIO cdev files");
+
+	vfio_pci_device_cleanup(self->device);
+	self->device = NULL;
+
+	cdev_path = __vfio_pci_get_cdev_path(device_bdf, device_is_noiommu);
+	ASSERT_NE(cdev_path, NULL);
+
+	unbound_fd = open(cdev_path, O_RDWR);
+	ASSERT_GE(unbound_fd, 0);
+	free((void *)cdev_path);
+
+	ret = luo_session_preserve_fd(self->session_fd, unbound_fd, 0);
+	ASSERT_EQ(ret, -ENOENT);
+	ASSERT_EQ(close(unbound_fd), 0);
+}
+
+TEST_F(vfio_pci_liveupdate_uapi_test, preserve_after_unpreserve)
+{
+	u16 vendor_id;
+
+	if (!device_is_noiommu)
+		SKIP(return, "Only noiommu devices can be preserved");
+
+	ASSERT_EQ(luo_session_preserve_fd(self->session_fd, self->device->fd, 0), 0);
+
+	ASSERT_EQ(close(self->session_fd), 0);
+	self->session_fd = luo_create_session(self->luo_fd, "session2");
+	ASSERT_GT(self->session_fd, 0);
+
+	ASSERT_EQ(luo_session_preserve_fd(self->session_fd, self->device->fd, 0), 0);
+
+	vendor_id = vfio_pci_config_readw(self->device, PCI_VENDOR_ID);
+	ASSERT_NE(vendor_id, 0xffff);
 }
 
 TEST_F(vfio_pci_liveupdate_uapi_test, preserve_group_fails)
@@ -112,6 +202,7 @@ TEST_F(vfio_pci_liveupdate_uapi_test, preserve_container_fails)
 
 int main(int argc, char *argv[])
 {
+	const char *cdev_path;
 	int fd;
 
 	fd = luo_open_device();
@@ -122,5 +213,15 @@ int main(int argc, char *argv[])
 	close(fd);
 
 	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+
+	cdev_path = __vfio_pci_get_cdev_path(device_bdf, true);
+	if (cdev_path) {
+		device_is_noiommu = true;
+	} else {
+		cdev_path = vfio_pci_get_cdev_path(device_bdf);
+		device_is_noiommu = false;
+	}
+	free((void *)cdev_path);
+
 	return test_harness_run(argc, argv);
 }
-- 
2.56.0.317.g454f8302e1-goog

