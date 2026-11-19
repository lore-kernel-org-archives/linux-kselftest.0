Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046519;
	b=xriDXNXl2cbmcNQ3jUPZiwWxNHBw1/YdKcSvJOnhxf3i99ZZX8EN505FVGAtazrw/ET1
	 KQlCU/QMu1o3SZFJHIozvimkamGU70DHRR4rVKgQj1YnH1QN2O/kXCtiwbETV9XX5zDJC
	 YwlU6270QtzJmCdd+BmlZODYQB1SiLualuP0s1NATNzOAj+Ev1K1W3i6OgCkONECC8IEM
	 0KudeIM/8zT1sU54cu/H7PMGTzG/djSiH9iVFTwFhUhQlb4Gfcrk/in8MF919a/JFCkka
	 DBYozf3m53QEzeaNvuXrLlx37x+m1j7gYVSuyp4zzNkM/nw+U6nt+u4dcBSw6RD1Nww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=41FntGxP/JrSQUL3JU9Vl/TX8BufIuwpx4VCpW10ByM=;
	b=UBRV8qfUkAI49gkfKQ9tang0Zufxli1Iyp7KrMrAb7W+JwcjYrWY0JyOU0naJmzn+yFm
	 znW5f0nHhDRJ0DEDN0OV0N3l8kbBEcR71kqq/Zrjm11Y080qkyUqOm7u7Za51jHMN0va7
	 fHBwSCrULOinEGwp0rrFmPImSqlTEvexnozP7Cbha6iq5HAmx7foaqC4XgMorgGKfPBcj
	 ebXuComGA2BzeaNKy/UxPAB6DJ5Do4RNwL140jUaE9MH4E/pQ2/kgD9e34cq5pGyxcYuk
	 BolOBwfU8ftzHZBO49EPI8DBB2VPkP7GM5wR1TdAmITYlKoDGcnObc5BSlSgGBLoykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AehvaMbj;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E4606A332
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 00:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324E4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AehvaMbj
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85d630e451aso1774100a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795046517; x=1795651317; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41FntGxP/JrSQUL3JU9Vl/TX8BufIuwpx4VCpW10ByM=;
        b=AehvaMbj1k9TBvJJ1jyf5MdUL6JKJ5hLpUxINJVb0vwuDtavVmkYzsoNnbzoOIS333
         wvS/elj55DI0lBEdV1F0nu3X40NyuNZokt2o0V+JZvznUsP2e8gp+SFdVZEiCgANXZfC
         1iDhaQrKz0Q2qOMJ1ayB9jrIkxUjyYI6VOg9iXiVHHpTpM7FUFA15aPNpJv7r8xWqOMr
         MMM1b9nlh5EU+75pPoHxv0VbZEGQWxIkaMRSUiVo1L4dC/efrkblHg1lyPIhVUygXGLM
         9JSkcIjxT6BtaTfeoNd3zUuKIlCO6uI/UEee2kl5oN0GQzIhi6tWyqknPL4oyKgXiwgm
         mSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046517; x=1795651317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41FntGxP/JrSQUL3JU9Vl/TX8BufIuwpx4VCpW10ByM=;
        b=G7x6y1XlJM5PsoK0o9IpgKycGiIPtMLSCxWKIktCqze5RmDzitIJfHcrdrZBIH7sdo
         4ZLtVc8QZmd41VXJMXKgI8WdpLL22EdYOxxb+cCKvXAqDQiVDTY1UicO6wZYdGWHDtsV
         Ql16V4m4WxjXlbWTIulvypSBFNTgREYlEYNkNi/CH2V4IGusCDpGZEra7/sUTLuAN5MD
         9C1fBo0vsmbhPYEWvbH8EludEY5dThTN7hT9X3xu775SreMFiKCAwQxH7FZqRff9re6I
         TXNz2yKdCruCkqVvjn0wbWB1/zk5O8BelICPXmrwCC5EWFiSjHwU1a3S9UNpLp5FAAu4
         BYrQ==
X-Forwarded-Encrypted: i=1; AL+hErEwp1fG8X9ehNWY12X34ba0oM8uv4/SBtde+LpJR1F7aXmEYPP7pZsDgjuGRihXX5fhGowVIcsV0+KxnatUAW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++aAYM9zCkDRicVulkEZDT3LCeduSLY6UIo3h59xLZIJ0QRFCK
	lBqn0FYSHEIXkTMkpGizDQg5TdZlJNXSaO65Oz/EI5Dg5ko8DTW4bRz/u5n+CbXfWvPYFan6d4i
	X+CY7bF2THSQdtQ==
X-Received: from ilsl18.prod.google.com ([2002:a05:6e02:5d2:b0:53d:4922:80ea])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:87d1:b0:571:9bab:e8b7 with SMTP id 5614622812f47-5773ace5fb8mr5271853b6e.0.1795046516811;
 Wed, 18 Nov 2026 16:01:56 -0800 (PST)
Date: Thu, 19 Nov 2026 00:01:43 +0000
In-Reply-To: <20261119000151.442543-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119000151.442543-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119000151.442543-2-dmatlack@google.com>
Subject: [PATCH v2 1/8] vfio/pci: Hold memory_lock for all calls to vfio_pci_set_power_state()
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hold vdev->memory_lock for write when calling vfio_pci_set_power_state()
from vfio_pci_core_disable() and vfio_pci_core_register_device(), and
assert that the lock is held for all power state transitions, not just
transitions out of D0.

vfio_pci_core_disable() calls vfio_pci_set_power_state(vdev, PCI_D0)
without holding memory_lock, which allows it to race with
vfio_pci_core_sriov_configure() when userspace writes to sriov_numvfs
while the device is being closed. If the user left the device in D3hot
via a config space write, both threads can transition the device from
D3hot to D0 concurrently. Since a config space write does not change
the runtime PM status, the device stays RPM_ACTIVE, pm_runtime_resume()
in the close path is a no-op, and vfio_pci_set_power_state() performs
the D3hot->D0 transition.

For devices with vdev->needs_pm_restore set (NoSoftRst-), this can
result in:

 - vfio_pci_core_disable() restoring the PF's BARs after
   vfio_pci_core_sriov_configure() has enabled VFs, since the D3hot->D0
   transition sleeps before restoring device state. This reproduces
   reliably with vfio_pci_power_state_test and triggers the following
   warning:

     vfio-pci 0000:01:00.0: can't update enabled VF BAR0 [mem 0xe0200000000-0xe020001ffff 64bit pref]
     WARNING: drivers/pci/iov.c:1062 at pci_iov_update_resource+0x170/0x3b0
     Call Trace:
      pci_update_resource+0x1a3/0x5b0
      __pci_set_power_state+0x597/0xb90
      vfio_pci_core_disable+0x13b/0x1180
      vfio_pci_core_close_device+0x144/0x260
      vfio_df_close+0xf2/0x210
      vfio_df_unbind_iommufd+0x89/0x140
      vfio_device_fops_release+0x85/0xf0
      __fput+0x2d6/0x720
      fput_close_sync+0xe8/0x180
      __x64_sys_close+0x7f/0xc0
      do_syscall_64+0xbc/0x320
      entry_SYSCALL_64_after_hwframe+0x76/0x7e

 - Both threads observing pdev->current_state >= PCI_D3hot and calling
   pci_load_and_free_saved_state(pdev, &vdev->pm_save) concurrently,
   resulting in a double-free of vdev->pm_save.

vfio_pci_core_register_device() cannot race with other callers since
the device is not yet registered and device_lock is held across probe,
but take the lock there as well so that the lockdep assertion can be
made unconditional and catch any future unlocked callers.

Taking memory_lock in these paths does not introduce any new lock
dependencies. vfio_pci_core_disable() already acquires memory_lock
under dev_set->lock via vfio_pci_runtime_pm_exit(), and
vfio_pci_core_register_device(), like vfio_pci_core_sriov_configure(),
runs under device_lock, which is already taken before memory_lock.

Fixes: f4162eb1e2fc ("vfio/pci: Change the PF power state to D0 before enabling VFs")
Cc: stable@vger.kernel.org
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index fcbb2da860e2..4289ec9bc32f 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -325,12 +325,12 @@ int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev, pci_power_t stat
 	bool needs_restore = false, needs_save = false;
 	int ret;
 
+	/* Serialize power state changes and accesses to vdev->pm_save. */
+	lockdep_assert_held_write(&vdev->memory_lock);
+
 	/* Prevent changing power state for PFs with VFs enabled */
-	if (state > PCI_D0) {
-		lockdep_assert_held_write(&vdev->memory_lock);
-		if (vdev->sriov_active)
-			return -EBUSY;
-	}
+	if (state > PCI_D0 && vdev->sriov_active)
+		return -EBUSY;
 
 	if (vdev->needs_pm_restore) {
 		if (pdev->current_state < PCI_D3hot && state >= PCI_D3hot) {
@@ -699,7 +699,9 @@ void vfio_pci_core_disable(struct vfio_pci_core_device *vdev)
 	 * reset without restoring the original state (saved locally in
 	 * 'vdev->pm_save').
 	 */
+	down_write(&vdev->memory_lock);
 	vfio_pci_set_power_state(vdev, PCI_D0);
+	up_write(&vdev->memory_lock);
 
 	/* Stop the device from further DMA */
 	pci_clear_master(pdev);
@@ -2273,7 +2275,9 @@ int vfio_pci_core_register_device(struct vfio_pci_core_device *vdev)
 	 * be able to get to D3.  Therefore first do a D0 transition
 	 * before enabling runtime PM.
 	 */
+	down_write(&vdev->memory_lock);
 	vfio_pci_set_power_state(vdev, PCI_D0);
+	up_write(&vdev->memory_lock);
 
 	pm_runtime_allow(dev);
 	if (!vdev->disable_idle_d3)
-- 
2.56.1.708.g77570a6a1d-goog

