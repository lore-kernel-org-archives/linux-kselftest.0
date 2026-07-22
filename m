Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AC3168EB
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 00:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679353; cv=none; b=nDvvykOHfX/YrLIeBaTxI8Whb+2nfbXypvU03bIrtHl947EMPfXnzun3vXfAiFCD9Qed+BE9jaRwhlX1mQXBHKUukbh+k5lmJnaNBQKVfMN7VZ7GYwWwbSYwQfy6t5FSlTjJL0anrlS3oosTJxIvo5ri/Q38qEZkXQ5pp3TP1Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679353; c=relaxed/simple;
	bh=lfTItr5Vg+lZepk1YTtimNxtQxX2xxsuhXX8/E8FyOA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UdcIIbw2pEIC7uPNlpY3AcCCKX7Z+7VI0eUKr+SeT4WTCOBIQqcVcY8Gz4MS3e5HekkKO+04WLlOr1YSFeu6V2Q0nOJAfIwnUUDrLiLIbmppWSj3dKqNQhlhCSIrP49rITeNr7OH7znMBIXh53FLP+LGcK4YOuwgWlFL6uwSBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmBqsgrU; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmBqsgrU"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso172860715ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 17:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784679347; x=1785284147; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZ+JYUl+bJF8E+CsVPDDHP5xTQJTCrW/WMk4UkvfNvM=;
        b=hmBqsgrUjnFUFOOyBjzxhfhOcRgrE6pvFKFhgW8D+E9YTV53QBstvn4DbBFWvU3vu3
         ItNu32xBTfX3eD1qShImmIfeeZ25yI5eZYW9Yyqu5jnolrNKUKRBbcXJ0CHRp6oQvBUM
         l+u8WYf9GFHaCCZ1rWrpzrDKaSLCkyYwly1XebBvFserPsUFCBlMb8MYYMNdTUFH0y6s
         nIXS6ma1hDMsmxP24B4g64KhQMzk4BEAYzOhipqYE6xArr4tYuoU1fI42lQ6uap3Y7lF
         n2FIthZjsLqfcCvIfMwDaJQgCy3s6iShBth83WwJBeWsFpiUdyM4vHyz7cHtypMwBFrq
         eGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784679347; x=1785284147;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZ+JYUl+bJF8E+CsVPDDHP5xTQJTCrW/WMk4UkvfNvM=;
        b=g7V4ZB3sQ2iVTm9y4Z3EPw5bOC9DEazBV8tzcJuoU25zS3wKFRPuo6zaUPDr2FKtjc
         0YTKLG1q4PuBdFqict4ti4G/XQeqhB+LGeGGoJji3BaaGRxEUnVtPDMRy4yQGFT3TM14
         a1kwF7fJmpSWe01j0Tx+6okP3oO9GBDo5FHUmrszRX/O4wJ0Mzee8GmJMOg5eytW3GL5
         +4Emq2pewJEBJYih5GAlCHf69xYVRjr+Y/09KaihN55OtWug8I1wg4OgwOxH0jzxrlb8
         QaANgtAIuV+gTmzIIEnGlnrX5MHcktI/VL2Pa3noOwc5ySzbGdjsxpYHWAd3bG+y7h1X
         fczQ==
X-Forwarded-Encrypted: i=1; AHgh+RqV6pyAtZIVfjoYj0vMFHc4TlLNQAlRdn+8Wf14pkIAQOEocjwsUDh5wKTHTd59wO5u6SwI9YXCmnhWB/CIqtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZsYWAcqKlXO5pdeSvvOrp6+VhS6I0zF+KI1rrb9SHO5xnku54
	IamAkbdN3NXYSbS9g/fRYCcxY9o4Tpmw4DpI3Qep2XLSHdEHVlIsWtB2XWCtbi8WQbwB86fr/j8
	19FD3/lO3
X-Received: from pgww13-n1.prod.google.com ([2002:a05:6a02:2c8d:10b0:c8a:c79:47e7])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c70b:b0:3c3:7427:5ed8
 with SMTP id adf61e73a8af0-3c3ad5fc1cdmr23350917637.8.1784679346553; Tue, 21
 Jul 2026 17:15:46 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:15:40 +0000
In-Reply-To: <20260722-igb_v3_b4-v6-0-0be1d29918d4@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-igb_v3_b4-v6-0-0be1d29918d4@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784679337; l=2385;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=lfTItr5Vg+lZepk1YTtimNxtQxX2xxsuhXX8/E8FyOA=; b=FwaSkyLKFRNCDrxuhKdnvvYY8lP/k/mmM0g9bHg2OIqLQqw3ScD4PobkBcMqhKdOSAoROja30
 F/ZYfWzQN6UA1YEKPiTvjn4KNqM8wBlII40LcWweQbDp5vIgwzQYMmB
X-Mailer: b4 0.14.3
Message-ID: <20260722-igb_v3_b4-v6-5-0be1d29918d4@google.com>
Subject: [PATCH v6 5/6] vfio: selftests: Retry on EAGAIN during device reset
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="utf-8"

Add retry logic to vfio_pci_device_reset() to handle the case where PCI
resets fail due to lock contention, in which case
pci_try_reset_function() returns -EAGAIN.

Suggested-by: Sashiko
Suggested-by: David Matlack <dmatlack@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
---
 .../vfio/lib/include/libvfio/vfio_pci_device.h          |  1 +
 tools/testing/selftests/vfio/lib/vfio_pci_device.c      | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 2e67afc0d580..27bdf561925f 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -41,6 +41,7 @@ struct vfio_pci_device {
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);
 
+int __vfio_pci_device_reset(struct vfio_pci_device *device);
 void vfio_pci_device_reset(struct vfio_pci_device *device);
 
 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 7b8394d0ac50..1b29cef96b04 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <dirent.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <libgen.h>
 #include <stdint.h>
@@ -221,9 +222,23 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 		       write ? "write to" : "read from", config);
 }
 
+int __vfio_pci_device_reset(struct vfio_pci_device *device)
+{
+	if (ioctl(device->fd, VFIO_DEVICE_RESET, NULL))
+		return -errno;
+
+	return 0;
+}
+
 void vfio_pci_device_reset(struct vfio_pci_device *device)
 {
-	ioctl_assert(device->fd, VFIO_DEVICE_RESET, NULL);
+	int r;
+
+	do {
+		r = __vfio_pci_device_reset(device);
+	} while (r == -EAGAIN);
+
+	VFIO_ASSERT_EQ(r, 0, "ioctl(device->fd, VFIO_DEVICE_RESET) failed\n");
 }
 
 static unsigned int vfio_pci_get_group_from_dev(const char *bdf)

-- 
2.55.0.229.g6434b31f56-goog

