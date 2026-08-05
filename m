Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D7536729A
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785889268; cv=none; b=fXu2LyhTZMnZIxHEvsUpvhCVHoka6elQS0vGDj7dMMF/ziA2Q6jGW2LRWRO+2SGvNnlw7GKvGMf/+vWFCEVGL/J9GrSV29cAbvk9/m5pTJzAwLQFzZ15tTAIe1BiN5O2DKIMhOIbefB0PzBi2YcVCH/gAnKWu+6nvFZ8m02v7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785889268; c=relaxed/simple;
	bh=PaA5xATJY2tarwGeOfuU6ZPqAxPaqiRO99xxmsojGYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lQbpHsHS8mvXaaWmBVGt660wZJwyFTtXqggjNz51MVQ5YAQXXp/3pmqA6DhQ1l7LbfAauc0HREcHhRGkKyFzMGqyJgWk1UPKu2bVE0p/pRlgz5Wx0DUP/djVZl6w5Zt5gSEQdNX5L8sFCnfft5NGsYsAAHHVK6WYT9Ic+uVoc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pycci0J8; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pycci0J8"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso250353a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 17:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785889266; x=1786494066; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WzAE8+0oSntfgPoTyIg9F5/lTZKO08wQsoVqeitm2o=;
        b=pycci0J82IpUluL3xoFz7TAi65xckY1wXQ3EUKzwWo6gEAWmBzuxZUIKemkg8wjpZu
         Rpt3RtMpwGZwZxIUo4HTnNFOJJdwb9akyeVAPxSQJPTKxIzPYd3UO1ygtrITv0L0BKt6
         sKgdglN0ZBYkjurDL16PQVdcRa48FO7Eq6yYLw+3B3rmaXiEwwMvJDZtiT2g1fXD8bxk
         K8QPBemUTAaRCtw9EkcDysUMLhM0H6mSiDPOCpQ7HsmBaUyYGuaDAi+FfjB9Z8r79Pjc
         HY9gIGmjGmZ/kv9ecxYq7GyXN5aH+9nttpPeZIqHmHOEBh7biINxkxDxT12mAA+wg8oG
         bS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785889266; x=1786494066;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WzAE8+0oSntfgPoTyIg9F5/lTZKO08wQsoVqeitm2o=;
        b=mJHTMz1TjWoEkKJGWl18TmBiYCPINpL0HtczGlDbrSk8fw2nIU8p1z2dGxbCLPvc25
         Y7lh9eBhsQufsC6zZA6P5k72qC9InXQlVHBZKQcYxxcARPEdPOnmiI6qeXB2AwnsY8z7
         DuCZL2QSj+cxTM1dPKF19/w7DZLArpbekXuiWFiNfovEJ0Jros1kJHM4O3Nwx+H5TqNj
         Ftccvm6txr/3KhbjVFzTgITttE9Dno4h85O1ezmVhlMWXM14forGvdg8fcO+uDiL5CS2
         F/aAUhtrFjD6I/mKQ4dcPUUUx2sZiyJH5aLnBl7bdD1T0N0WrG7x7qlRfo/yG6rmRvso
         92QA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5VS5Zmx3nT7tK31CdCcUHzfko7T3+Aa8YztAyGc1+gPlTovBRS3L5/1zl20Yv8CqnoJlN/4+tdngECJtBgQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW25QwkpcHXgKW7WT8kJGeWgCaR+n2gyFa2QTWt/Q/m3oRHmQP
	NYHoDzBotGrE4BFfSQZv0pJnIurRyQ13pFNDC4QK+kRujiEgAdq8E4NP1K3bvAWl5d+gpbcbwio
	PeLKDYQMa
X-Received: from pgig16.prod.google.com ([2002:a63:f410:0:b0:c92:11a5:bbce])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329c:b0:3c3:8315:80b7
 with SMTP id adf61e73a8af0-3cb85e9757amr2768382637.9.1785889265238; Tue, 04
 Aug 2026 17:21:05 -0700 (PDT)
Date: Wed, 05 Aug 2026 00:21:00 +0000
In-Reply-To: <20260805-igb_v3_b4-v10-0-9c86dc849c0d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260805-igb_v3_b4-v10-0-9c86dc849c0d@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785889261; l=2483;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=PaA5xATJY2tarwGeOfuU6ZPqAxPaqiRO99xxmsojGYU=; b=WQihD4RIUN91QasTX1wDfR2ED1EYJ6Vbpp52klVawbVUvTBINt/qIOwjZmtVwS32okKw9NzMD
 FCGOdcWDsjFDdDmS5r6eotUTc812uVG3XUSio8b3qDklhTcMvebhS9X
X-Mailer: b4 0.14.3
Message-ID: <20260805-igb_v3_b4-v10-3-9c86dc849c0d@google.com>
Subject: [PATCH v10 3/3] vfio: selftests: Retry on EAGAIN during device reset
From: Josh Hilke <jrhilke@google.com>
To: David Matlack <dmatlack@google.com>, Alex Williamson <alex@shazbot.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="utf-8"

Add retry logic to vfio_pci_device_reset() to handle the case where PCI
resets fail due to lock contention, in which case
pci_try_reset_function() returns -EAGAIN.

Suggested-by: David Matlack <dmatlack@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
---
 .../vfio/lib/include/libvfio/vfio_pci_device.h       |  1 +
 tools/testing/selftests/vfio/lib/vfio_pci_device.c   | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 89a039ab3075..e19bd94b8dd2 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -43,6 +43,7 @@ void vfio_pci_device_free(struct vfio_pci_device *device);
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);
 
+int __vfio_pci_device_reset(struct vfio_pci_device *device);
 void vfio_pci_device_reset(struct vfio_pci_device *device);
 
 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 65a4fffb480c..4063a0e2b3df 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <dirent.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <libgen.h>
 #include <stdint.h>
@@ -259,9 +260,26 @@ void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
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
+	int retries = 20;
+	int r;
+
+	do {
+		r = __vfio_pci_device_reset(device);
+		if (r == -EAGAIN)
+			usleep(10000);
+	} while (r == -EAGAIN && retries-- > 0);
+
+	VFIO_ASSERT_EQ(r, 0, "ioctl(device->fd, VFIO_DEVICE_RESET) failed\n");
 }
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf)

-- 
2.55.0.571.g244d577d93-goog

