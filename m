Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633845;
	b=iDozGXT320o2CSnnRw8Qke+Mz0MM4S8AkOHMgA6d5BMs/aTspa2iYHGDFBGXv42xu85F
	 NnNTN634kskTCVBr0+udhv71np8Kab1YtKIScYvqfYeztYhAYcnJpBHu9L4+sans4fsoc
	 YLj28wzjhGEAJUvbuuvge0GP6elkD0F0/m8naIlwdb99g0wlL9BJPjbOr4NNcsxEgHE93
	 JcPQWBN3UMecmRJFCuWqlKzXRT8aJMCUVk6n1S6J0Go9nYQjRZRzbkPCvvEKfCMdAxuQn
	 t6B2PbU7VQuwMCx3c+Munf9/F3TkSxrfwrxI/Z3KFDFaf0PnG8hc5p58+dKC6+r3Z5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Co3UjJyFEnZJpTpwZDKwqCjGC43bvHMJxy07QdLEStk=;
	b=Y9Ns62gmFP8KNcjM2dChewUIyiLdcV7EqUKOX+8fjkMK02jklJBDhlAk7AtuzjuG3ToM
	 HShFjQqVgheVXXM+8dMSEorkZKM7rld8byyMxpX6Qg4AgMhjAzsgWhfcS/mf0o1SHm58R
	 0nw0qnVsU25bcq/aBKKOAAMhVf1txbd7jIdcL5zg9BequR2gFwUHuglFRoVRgx7fud9Zf
	 wSBawri7VnNgDHq58e9VwujG7IXd1Yi2c0BI1VSaROLJK6X9zerWf/jV9pieXZlZcWHWT
	 q2GQEraAIBDbIxhFwNpS65rzwRXTSPY3MwdZ/yrZ//ul6mNTcQcfgiEfAKF4EL+I8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eFCqR4y8;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88F60ED0C6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A88F60ED0C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eFCqR4y8
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so3011689a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633845; x=1794238645; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Co3UjJyFEnZJpTpwZDKwqCjGC43bvHMJxy07QdLEStk=;
        b=eFCqR4y8D+jjzKu3zduK4bxfT2i7ETFhrPyeF4xmXoRdQVSGpuHPZ0ehsCqXJSdWi5
         RCT7CiLsUxyIPH5GnsonBEfSoYzJ0Ke2GSN7iTdWsLS3QNdz6gMPmB/jaa7XoXgnXG4i
         exbIUiUGI2f/Pe4ZR3R+cP4AZ6DCjGEWSyYHDSCD9OrBjwH37SPhiSdfAVhusLG6jM+q
         xbrm4v0DUmdWbTsBPt58ugTAICsAufaFwljEwohQIu6nAOQO2WRdyBWva+i1TSrGSfXP
         iaUIKjt16t91DkIQR+yAPwO57Fuxey28t55nFhnavoqzhprFSqazFjHbYECL3uTjrw2G
         W5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633845; x=1794238645;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co3UjJyFEnZJpTpwZDKwqCjGC43bvHMJxy07QdLEStk=;
        b=oCAjEcHHqYnoh1nxd62aXPGgFaTcwls1P+fC5OmrUzpOZWbvP+a5pVpifhMHvJI8qn
         EM6GhW6Qpn7VE1E8OSR0pYx+qyZWLyaUJAxYuQTKEzpjZDH0KsiZovCIqZ6t2mUzcgFC
         V0Dmb9sALiyVpd3Lc5D2aJHn1FjK52Ja2mF6qALxCydJujzLUsD91cuH++nWvU4+s3Rt
         rAs0E/Q0EpCyhc+SABwQ2QjLworXYcLVFmuke1aqCSlz6CA9nVj81rnyG7LS5vuwLp0Y
         hEW3ntSi0HyhPfy/Q7Wa8e4XDUMF77tddgV5KuldhTX8nwXVEdKB8TzAJcvqC9enhKHp
         +YrA==
X-Forwarded-Encrypted: i=1; AKwUvBzpY3IYdIWTZjHLG+vO3dbH6i3brbQ+MupndUcLvrCMP/M5eKTW3KdQ8vPvujjNu1QGIFSyxSZvzXHCIqA7duY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ybywNtbNr7GTC/go2QmSDY/7Gej4GbAnso95CfbhcxvKs6vld
	h32pWO+AhVVTu5dqz/gfKu5yuOaVbtn/8zNHIrqttbe+bud1iwrAsWeahtahgor90FMcBzfhURf
	Biz5Y0FB8Tg==
X-Received: from pjbir4.prod.google.com ([2002:a17:90b:4684:b0:3a8:74c5:5a5c])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3887:b0:3ac:97e3:73a3
 with SMTP id 98e67ed59e1d1-3ae89574e10mr7137697a91.6.1793633844535; Mon, 02
 Nov 2026 07:37:24 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:52 -0800
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
Message-ID: <20261102153656.1431701-24-vipinsh@google.com>
Subject: [PATCH v6 23/27] vfio: selftests: Add an attach() driver op
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

Add a new attach() op to vfio_pci_driver_ops and a corresponding
vfio_pci_driver_attach() wrapper to adopt a device that was already
initialized (and optionally has memcpy operations in flight) in another
process prior to a Live Update, without resetting or reprogramming the
hardware.

Implement attach() for the igb and dsa selftest drivers: refresh process-
local BAR pointers, verify that the device hardware state and descriptor
rings are still intact as left before kexec, re-enable MSI-X, and set
driver capability limits.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/vfio/lib/drivers/dsa/dsa.c      | 35 +++++++++++++++--
 .../selftests/vfio/lib/drivers/igb/igb.c      | 39 +++++++++++++++++--
 .../lib/include/libvfio/vfio_pci_driver.h     | 17 ++++++++
 .../selftests/vfio/lib/vfio_pci_driver.c      | 22 ++++++++++-
 4 files changed, 105 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
index 19d9630b24c2..2764ed4c67f8 100644
--- a/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
+++ b/tools/testing/selftests/vfio/lib/drivers/dsa/dsa.c
@@ -215,6 +215,16 @@ static void dsa_register_cache_init(struct vfio_pci_device *device)
 	dsa->max_copies_per_batch = min(dsa->max_copies_per_batch, ARRAY_SIZE(dsa->copy));
 }
 
+static void dsa_set_limits(struct vfio_pci_device *device)
+{
+	struct dsa_state *dsa = to_dsa_state(device);
+
+	device->driver.max_memcpy_count =
+		dsa->max_batches * dsa->max_copies_per_batch;
+	device->driver.max_memcpy_size = 1UL << dsa->gen_cap.max_xfer_shift;
+	device->driver.msi = MSIX_VECTOR;
+}
+
 static void dsa_init(struct vfio_pci_device *device)
 {
 	struct dsa_state *dsa = to_dsa_state(device);
@@ -236,11 +246,27 @@ static void dsa_init(struct vfio_pci_device *device)
 	dsa_command(device, IDXD_CMD_ENABLE_WQ);
 
 	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
+	dsa_set_limits(device);
+}
 
-	device->driver.max_memcpy_count =
-		dsa->max_batches * dsa->max_copies_per_batch;
-	device->driver.max_memcpy_size = 1UL << dsa->gen_cap.max_xfer_shift;
-	device->driver.msi = MSIX_VECTOR;
+static void dsa_attach(struct vfio_pci_device *device)
+{
+	struct dsa_state *dsa = to_dsa_state(device);
+	union gensts_reg gensts;
+
+	VFIO_ASSERT_GE(device->driver.region.size, sizeof(*dsa));
+
+	/* The device must still be enabled as dsa_init() left it. */
+	gensts.bits = readl(device->bars[0].vaddr + IDXD_GENSTATS_OFFSET);
+	VFIO_ASSERT_EQ((u32)gensts.state, IDXD_DEVICE_STATE_ENABLED,
+		       "Device was disabled or reset\n");
+	dsa_check_sw_err(device);
+
+	/* BAR0 is mapped at a different address now, refresh the pointers into it. */
+	dsa_register_cache_init(device);
+
+	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
+	dsa_set_limits(device);
 }
 
 static void dsa_remove(struct vfio_pci_device *device)
@@ -420,6 +446,7 @@ const struct vfio_pci_driver_ops dsa_ops = {
 	.name = "dsa",
 	.probe = dsa_probe,
 	.init = dsa_init,
+	.attach = dsa_attach,
 	.remove = dsa_remove,
 	.memcpy_start = dsa_memcpy_start,
 	.memcpy_wait = dsa_memcpy_wait,
diff --git a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
index fd9e05d77ea4..3f9f631a5977 100644
--- a/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
+++ b/tools/testing/selftests/vfio/lib/drivers/igb/igb.c
@@ -224,6 +224,13 @@ static void igb_reset(struct igb *igb)
 	igb_write32(igb, E1000_IMC, 0xFFFFFFFF);
 }
 
+static void igb_set_limits(struct vfio_pci_device *device)
+{
+	device->driver.max_memcpy_size = IGB_MAX_CHUNK_SIZE;
+	device->driver.max_memcpy_count = RING_SIZE - 1;
+	device->driver.msi = MSIX_VECTOR;
+}
+
 /*
  * Program the device into a usable state.  Split out of igb_init() so it
  * can be reused after a device reset to re-program the registers that
@@ -372,9 +379,7 @@ static void igb_hw_init(struct vfio_pci_device *device)
 	igb->tx_tail = 0;
 	igb->rx_tail = 0;
 
-	device->driver.max_memcpy_size = IGB_MAX_CHUNK_SIZE;
-	device->driver.max_memcpy_count = RING_SIZE - 1;
-	device->driver.msi = MSIX_VECTOR;
+	igb_set_limits(device);
 }
 
 static void igb_init(struct vfio_pci_device *device)
@@ -400,6 +405,33 @@ static void igb_init(struct vfio_pci_device *device)
 	igb_hw_init(device);
 }
 
+static void igb_attach(struct vfio_pci_device *device)
+{
+	struct igb *igb = to_igb_state(device);
+	u64 iova_tx, iova_rx;
+
+	VFIO_ASSERT_GE(device->driver.region.size, sizeof(struct igb));
+
+	/* BAR0 is mapped at a different address in this process. */
+	igb->bar0 = device->bars[0].vaddr;
+
+	/*
+	 * The device must still use the rings and tails in the driver region,
+	 * i.e. it was not reset and the region is mapped at the same IOVAs.
+	 */
+	iova_tx = to_iova(device, igb->tx_ring);
+	iova_rx = to_iova(device, igb->rx_ring);
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_TDBAL(0)), (u32)iova_tx);
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_TDBAH(0)), (u32)(iova_tx >> 32));
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_RDBAL(0)), (u32)iova_rx);
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_RDBAH(0)), (u32)(iova_rx >> 32));
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_TDT(0)), igb->tx_tail);
+	VFIO_ASSERT_EQ(igb_read32(igb, E1000_RDT(0)), igb->rx_tail);
+
+	vfio_pci_msix_enable(device, MSIX_VECTOR, 1);
+	igb_set_limits(device);
+}
+
 static void igb_remove(struct vfio_pci_device *device)
 {
 	struct igb *igb = to_igb_state(device);
@@ -578,6 +610,7 @@ const struct vfio_pci_driver_ops igb_ops = {
 	.name = "igb",
 	.probe = igb_probe,
 	.init = igb_init,
+	.attach = igb_attach,
 	.remove = igb_remove,
 	.memcpy_start = igb_memcpy_start,
 	.memcpy_wait = igb_memcpy_wait,
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
index e5ada209b1d1..09603eacab4d 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_driver.h
@@ -28,6 +28,21 @@ struct vfio_pci_driver_ops {
 	 */
 	void (*remove)(struct vfio_pci_device *device);
 
+	/**
+	 * attach() - Adopt @device as init() and memcpy_start() left it, e.g.
+	 * in another process before a Live Update, without resetting or
+	 * reprogramming it. Memcpy operations started then keep going and can be
+	 * waited for with memcpy_wait(). Optional.
+	 *
+	 * Only sets up what is specific to the calling process (pointers into the
+	 * BARs kept in the driver state, MSI-X) and the driver limits.
+	 *
+	 * Must be called after device->driver.region, and any memory the device
+	 * was told to DMA to, have been mapped at the same IOVAs as when init()
+	 * and memcpy_start() were called.
+	 */
+	void (*attach)(struct vfio_pci_device *device);
+
 	/**
 	 * memcpy_start() - Kick off @count repeated memcpy operations from
 	 * [@src, @src + @size) to [@dst, @dst + @size).
@@ -85,6 +100,8 @@ struct vfio_pci_driver {
 
 void vfio_pci_driver_probe(struct vfio_pci_device *device);
 void vfio_pci_driver_init(struct vfio_pci_device *device);
+void vfio_pci_driver_attach(struct vfio_pci_device *device,
+			    bool memcpy_in_progress);
 void vfio_pci_driver_remove(struct vfio_pci_device *device);
 int vfio_pci_driver_memcpy(struct vfio_pci_device *device,
 			   iova_t src, iova_t dst, u64 size);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
index 5e65434d2318..b4be2070342f 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_driver.c
@@ -40,7 +40,8 @@ static void vfio_check_driver_op(struct vfio_pci_driver *driver, void *op,
 {
 	VFIO_ASSERT_NOT_NULL(driver->ops);
 	VFIO_ASSERT_NOT_NULL(op, "Driver has no %s()\n", op_name);
-	VFIO_ASSERT_EQ(driver->initialized, op != driver->ops->init);
+	VFIO_ASSERT_EQ(driver->initialized,
+		       op != driver->ops->init && op != driver->ops->attach);
 	VFIO_ASSERT_EQ(driver->memcpy_in_progress, op == driver->ops->memcpy_wait);
 }
 
@@ -61,6 +62,25 @@ void vfio_pci_driver_init(struct vfio_pci_device *device)
 	driver->initialized = true;
 }
 
+/*
+ * Take over @device as vfio_pci_driver_init() left it in another process, e.g.
+ * before a Live Update. Pass @memcpy_in_progress if memcpy operations were
+ * started there, to be able to wait for them with vfio_pci_driver_memcpy_wait().
+ */
+void vfio_pci_driver_attach(struct vfio_pci_device *device,
+			    bool memcpy_in_progress)
+{
+	struct vfio_pci_driver *driver = &device->driver;
+
+	VFIO_ASSERT_NOT_NULL(driver->region.vaddr);
+	VFIO_CHECK_DRIVER_OP(driver, attach);
+
+	driver->ops->attach(device);
+
+	driver->initialized = true;
+	driver->memcpy_in_progress = memcpy_in_progress;
+}
+
 void vfio_pci_driver_remove(struct vfio_pci_device *device)
 {
 	struct vfio_pci_driver *driver = &device->driver;
-- 
2.56.0.317.g454f8302e1-goog

