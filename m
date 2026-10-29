Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306012;
	b=CaaYvEOq+yzDPjnmC64Bs6rZOiQF9Zky0V0S0RwoEYkyHFCszW7DoammhIXG3WbCe1QE
	 p/pUEZVhcdhog0qDyFdDkyG4e21PuxE3xdXXdcuwX9aGOsgGy2vfgAnxfEvnYeCp7VeAe
	 H2P3Oh6hm5oLodYt2gVsPFtxtNpw0/u26y+agFx9JoptmejOTjeKXmcc1fuCKp34/gnCV
	 CqbpuT6ti22z5SsWWFXn+ymu7160V+kITih2AiXvoJWBebgvvoMCq/mQXiWxGZiyxlUM2
	 KH+hPkrtsRRk5RmybLhd6sVUCo3DT2ohCp8oxM3jXjsM+8UFL/CFXu8sGXTXDlaihWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aPubatOHkkdD5AHBvFSNw0aw4UoRgW6eq+k6wMoCK9w=;
	b=2x34hLa38EinM1kdYepAQRwqpn3G/v/+OFDrvduSVSDkKlaxEDZO4Imd4KsrY29uENhD
	 SleTX4LIIkKUBM9kA2q75IpiBqf4W+4tf9cYHtmbYm+M796QLbX9qaJ2KSCKrYIh60bLG
	 UoKd5VEly/uVVaXsqomHU6HnvuO8UAnYeSeBn68KRh3I3J4U0BRzvx3bWhSy/hxkX8mib
	 qM74sxfVm4tuPyj5iBWjQY/wFdB5k0hmmiBs1dNSAaCmulXEhltWW0H9TZYmBJbLzKsfN
	 NhHeRUVkmx7CW/fUKMNPh+W7GQ3hIXExgekQ6uXTzjyGVGfYDJHdwPDhSzWIy29Q5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lEe7+BN8;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C7606A33A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810C7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lEe7+BN8
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so814955ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306011; x=1793910811; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPubatOHkkdD5AHBvFSNw0aw4UoRgW6eq+k6wMoCK9w=;
        b=lEe7+BN8ekA8v3V8WGjQBcyrW9vlA3AgEYL7fnpGvm88JJOo4O2VgS6u9fj/iQ5DBL
         UGpGU2xgxQXjTQtgRAT17Gd11w2i/Pe58/kSP8eJaiG2f1dTHTpJdCJbzolvf+7zyPUn
         FMkDcySWQ+xWFl+sscREsEVBRlmITn4eTR0wuii0nxLaYrYmtx+m/sxkVwHnTF59bpy5
         eFWP4RGTMSs9LRA4VPnd4+ghwCCuTzsOmS7lyYDJXSBVQLxkXLri2XzdgI5OAcaCZ9jj
         z86xcENzgNh+P7phoGKqUA5NyOVbl9/C/RZ+W4ZMSn7b1T13TFk3VkW3DyNhTOKH0RKO
         qkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306011; x=1793910811;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPubatOHkkdD5AHBvFSNw0aw4UoRgW6eq+k6wMoCK9w=;
        b=vfOK15w4MBK5HxsL7AgThIiBb8NK3TxzYzb9yA/+Lzby2XT+VJnebfd0yEv/V/rYDQ
         hhZfFCpFAilZ9t12xvNJYhLvsBzC+edFwvJpwt1iUhmkcFNT3iwOeieD4IKU4NT1oiFR
         Mg/n7eSOgt7ZHem+VISu4n/2SZ4jNzVfv5WZzUhZeHJkrNHGH1gCmaMH9RW2Cq4R+IMe
         v1VtSvQHIhyxzJO47CDSvwWdPyy7R2wFgrF8nHK/Stk4mCGBDkwnD3vD0icVr/MBmuZI
         CP21xh2YuGcLM+wuc0N76voY8xVsaI1dt8ihmq/RfWzygbp3LyDfXGQcM/UsstTzcv84
         EYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHbibUJ3VwUn8Y9Tj0AQ7MK0BOC78ER3Q0kKOn7kslnpVCPh2W5PTWLsO+nUY4ELXTThoHxt+Mqrk69wyWoKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLchS6FibNI+Y7KAb59HmXM4aWkZT7imzeU+8jDaAin7BoTyit4
	2uK1gUnEkt9geUaD6wrUY7yof+zGdSiNSnCZ8HY51b5C5JYrJrFDjInvRGfXo+RJFxSAlA4Kj2M
	ttxLQTYX+GYa1gQ==
X-Received: from plbjk1.prod.google.com ([2002:a17:903:3301:b0:2e8:b6a:4fac])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr5065755ad.48.1793306010581;
 Thu, 29 Oct 2026 13:33:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:33:24 +0000
In-Reply-To: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029203324.1637772-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203324.1637772-6-dmatlack@google.com>
Subject: [PATCH 5/5] vfio: selftests: Add test for device power state transitions
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add vfio_pci_power_state_test to exercise VFIO's handling of device
power state changes initiated by userspace through the PM capability in
config space.

The test covers:

 - Closing a device while it is in D3hot, which must return the device
   to D0.
 - Enabling SR-IOV while the PF is in D3hot, which must return the PF to
   D0 and prevent it from leaving D0 while VFs are enabled.
 - Racing a close of the device while it is in D3hot against enabling
   SR-IOV, both of which transition the device back to D0.

The SR-IOV tests are skipped if the device does not support SR-IOV or
already has VFs enabled.

Bugs in VFIO's power state handling, such as the race above, often only
manifest as kernel warnings (e.g. WARN() or KASAN reports). So fail the
test if /sys/kernel/warn_count changes between fixture setup and
teardown.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/vfio_pci_power_state_test.c          | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 tools/testing/selftests/vfio/vfio_pci_power_state_test.c

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..e2b152528560 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -12,6 +12,7 @@ TEST_GEN_PROGS += vfio_iommufd_setup_test
 TEST_GEN_PROGS += vfio_pci_device_test
 TEST_GEN_PROGS += vfio_pci_device_init_perf_test
 TEST_GEN_PROGS += vfio_pci_driver_test
+TEST_GEN_PROGS += vfio_pci_power_state_test
 TEST_GEN_PROGS += vfio_pci_sriov_uapi_test
 
 TEST_FILES += scripts/cleanup.sh
diff --git a/tools/testing/selftests/vfio/vfio_pci_power_state_test.c b/tools/testing/selftests/vfio/vfio_pci_power_state_test.c
new file mode 100644
index 000000000000..d5853eb89856
--- /dev/null
+++ b/tools/testing/selftests/vfio/vfio_pci_power_state_test.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <pthread.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include <linux/pci_regs.h>
+
+#include <libvfio.h>
+
+#include "kselftest_harness.h"
+
+/* PCI_PM_CTRL_STATE_MASK values */
+#define D0	0
+#define D3HOT	3
+
+static const char *device_bdf;
+
+static u16 power_state_get(struct vfio_pci_device *device, u8 pm_cap)
+{
+	return vfio_pci_config_readw(device, pm_cap + PCI_PM_CTRL) &
+	       PCI_PM_CTRL_STATE_MASK;
+}
+
+static void power_state_set(struct vfio_pci_device *device, u8 pm_cap, u16 state)
+{
+	u16 pmcsr = vfio_pci_config_readw(device, pm_cap + PCI_PM_CTRL);
+
+	pmcsr &= ~PCI_PM_CTRL_STATE_MASK;
+	pmcsr |= state;
+
+	vfio_pci_config_writew(device, pm_cap + PCI_PM_CTRL, pmcsr);
+}
+
+static bool sriov_supported(void)
+{
+	return sysfs_sriov_totalvfs_get(device_bdf) > 0 &&
+	       sysfs_sriov_numvfs_get(device_bdf) == 0;
+}
+
+FIXTURE(vfio_pci_power_state_test) {
+	struct iommu *iommu;
+	struct vfio_pci_device *device;
+	u8 pm_cap;
+	int warn_count;
+};
+
+FIXTURE_SETUP(vfio_pci_power_state_test)
+{
+	/*
+	 * Snapshot the kernel's warning count so that teardown can check that
+	 * the test did not trigger any kernel warnings (e.g. WARN() or KASAN
+	 * reports). Bugs in power state handling often only manifest as kernel
+	 * warnings, which are otherwise invisible to the test.
+	 */
+	self->warn_count = sysfs_kernel_warn_count_get();
+
+	self->iommu = iommu_init(default_iommu_mode);
+	self->device = vfio_pci_device_init(device_bdf, self->iommu);
+
+	self->pm_cap = vfio_pci_find_capability(self->device, PCI_CAP_ID_PM);
+	if (!self->pm_cap)
+		SKIP(return, "Device does not have a PM capability\n");
+
+	ASSERT_EQ(power_state_get(self->device, self->pm_cap), D0);
+}
+
+FIXTURE_TEARDOWN(vfio_pci_power_state_test)
+{
+	if (self->device)
+		vfio_pci_device_cleanup(self->device);
+
+	iommu_cleanup(self->iommu);
+
+	if (self->warn_count >= 0)
+		EXPECT_EQ(sysfs_kernel_warn_count_get(), self->warn_count);
+}
+
+/*
+ * Put the device into D3hot via config space and then close it. VFIO must
+ * return the device to D0 when it is closed.
+ */
+TEST_F(vfio_pci_power_state_test, close_in_d3hot)
+{
+	power_state_set(self->device, self->pm_cap, D3HOT);
+	ASSERT_EQ(power_state_get(self->device, self->pm_cap), D3HOT);
+
+	vfio_pci_device_cleanup(self->device);
+
+	self->device = vfio_pci_device_init(device_bdf, self->iommu);
+	ASSERT_EQ(power_state_get(self->device, self->pm_cap), D0);
+}
+
+/*
+ * Put the device into D3hot via config space and then enable SR-IOV. VFIO
+ * must return the PF to D0 before enabling VFs, and must not allow the PF to
+ * leave D0 while VFs are enabled.
+ */
+TEST_F(vfio_pci_power_state_test, sriov_enable_in_d3hot)
+{
+	if (!sriov_supported())
+		SKIP(return, "SR-IOV is not supported or already enabled\n");
+
+	power_state_set(self->device, self->pm_cap, D3HOT);
+	ASSERT_EQ(power_state_get(self->device, self->pm_cap), D3HOT);
+
+	sysfs_sriov_numvfs_set(device_bdf, 1);
+	EXPECT_EQ(power_state_get(self->device, self->pm_cap), D0);
+
+	power_state_set(self->device, self->pm_cap, D3HOT);
+	EXPECT_EQ(power_state_get(self->device, self->pm_cap), D0);
+
+	sysfs_sriov_numvfs_set(device_bdf, 0);
+
+	power_state_set(self->device, self->pm_cap, D3HOT);
+	EXPECT_EQ(power_state_get(self->device, self->pm_cap), D3HOT);
+
+	power_state_set(self->device, self->pm_cap, D0);
+	EXPECT_EQ(power_state_get(self->device, self->pm_cap), D0);
+}
+
+struct sriov_enable_args {
+	pthread_barrier_t barrier;
+	int delay_us;
+};
+
+static void *sriov_enable_thread(void *arg)
+{
+	struct sriov_enable_args *args = arg;
+
+	pthread_barrier_wait(&args->barrier);
+	usleep(args->delay_us);
+	sysfs_sriov_numvfs_set(device_bdf, 1);
+	return NULL;
+}
+
+/*
+ * Race closing the device while it is in D3hot against enabling SR-IOV. Both
+ * paths transition the device back to D0, which must be serialized by VFIO,
+ * e.g. to avoid restoring the PF's BARs after VFs have been enabled or
+ * double-freeing the saved PM state.
+ *
+ * The D3hot->D0 transition during close includes a delay (10ms by default)
+ * before the device's state is restored. Use a barrier to start closing the
+ * device and enabling SR-IOV at the same time, and then delay enabling SR-IOV
+ * by a few milliseconds so that it lands inside that window. Vary the delay
+ * across iterations to account for differences in timing across systems and
+ * kernel configs.
+ */
+TEST_F(vfio_pci_power_state_test, close_in_d3hot_races_sriov_enable)
+{
+	struct sriov_enable_args args;
+	pthread_t thread;
+	int i;
+
+	if (!sriov_supported())
+		SKIP(return, "SR-IOV is not supported or already enabled\n");
+
+	ASSERT_EQ(pthread_barrier_init(&args.barrier, NULL, 2), 0);
+
+	/*
+	 * Keep the number of iterations low since each one enables and
+	 * disables SR-IOV, which can take over a second.
+	 */
+	for (i = 0; i < 10; i++) {
+		args.delay_us = 2000 + i * 500;
+
+		power_state_set(self->device, self->pm_cap, D3HOT);
+		ASSERT_EQ(power_state_get(self->device, self->pm_cap), D3HOT);
+
+		ASSERT_EQ(pthread_create(&thread, NULL, sriov_enable_thread, &args), 0);
+		pthread_barrier_wait(&args.barrier);
+		vfio_pci_device_cleanup(self->device);
+		self->device = NULL;
+		ASSERT_EQ(pthread_join(thread, NULL), 0);
+
+		sysfs_sriov_numvfs_set(device_bdf, 0);
+
+		self->device = vfio_pci_device_init(device_bdf, self->iommu);
+		ASSERT_EQ(power_state_get(self->device, self->pm_cap), D0);
+	}
+
+	ASSERT_EQ(pthread_barrier_destroy(&args.barrier), 0);
+}
+
+int main(int argc, char *argv[])
+{
+	device_bdf = vfio_selftests_get_bdf(&argc, argv);
+	return test_harness_run(argc, argv);
+}
-- 
2.56.0.317.g454f8302e1-goog

