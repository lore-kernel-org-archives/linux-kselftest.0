Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6FA442FAA
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785364032; cv=none; b=rnqUwAnexixZh0qaoizBJ5ltZsP7aHl5Tgf1QOrm4I8VbroYrhcD/pFO6lbukgReOimaHjthUtV+HlGpXsnih5Rm0IPS7voHFu/4shM/RnC3Kbl4UpuxT0fepDoHbLen/RTjQe8p+fVy2t7Q1Cpjm2wm5KgjQ6+WAD+nvABli7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785364032; c=relaxed/simple;
	bh=Rx3bLcqXnovy1TECTiy5I/rgPsTG+EJ3RxPeZYO1Wec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NByNw1NplXVX9CKSnOmqWXdxEDnM0gZ5KjQmUYf7uARHJRJxItP+B9Y69fAlGsO0PSh68GbynNuTor1ITGsYrB52Wguc+DG8l74jTmHfn4mav/FDmJUPlAo6Jm0hWAe+S0ZX10wKl60053UIdYPtHay97G3AWSQj/hoArE1eoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PmbHV5Yn; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PmbHV5Yn"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38827cee19eso1800908a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785364030; x=1785968830; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opN4WYe1olUwSIIaHbjWYmXQtC9ecX3k0IYVgISsk2A=;
        b=PmbHV5Yn32eEhyFY0dO1pDMyKu2do646kC4yftAfFGsbwzDI7wH+j9EO2AoVhOUciP
         ry0WpZbj2++Rgpzl2Mw0tUVGTknN3xNUTOIoWPz+vxOF9yihb2wlzasoVcAP8s0uDCnT
         eckYDzRZbcJ24KRVucrhzb665P5prt2mH36NNu88m9udadtdJNETCYC2sKySpMCx1sIo
         iCg2qoQIWKDZxDAh8Bb1CmA2aU5umKKnAi7MFhUlDxZZ8nZxSzqa6rkqQK8obqM3mKdW
         mpLNOQTRblPSUY/UkQbgJI45I6HczdzHEEf5OaKyueWpFrC7mhgTIrFcDy9RvPkxsGmN
         yczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785364030; x=1785968830;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opN4WYe1olUwSIIaHbjWYmXQtC9ecX3k0IYVgISsk2A=;
        b=MoHG1PKQjBfOpgkg1lSTDtnXqbKIx7aEUUhzT0EYtN6XBK0hHjrRX/X3hNpRS8BxmS
         jHOHKZ/IExGExKpuk0gn8aR4LuG6zwssc05iDLByf9mgR19ucBKeNyiuDAT0YBYZoGPI
         WUINPSyT42w8cl8VOM/9ImhHmiZqU/gkh1A+zmiYFrp3oljVzMiTi+B4+tYtnKXVpDhy
         j7GQ42R2bjbrzDTTAj59ZW1FRG0FxJpFSLgqxeoXL+qtrp/J1SWKMwuQhTen2G+dbZIc
         mD9OOExfHwjjDMi8cNXWiZghMWUYuWbgOqm6cosMN5Ye1NMxx2jBYUDD+sDePSO4bQVG
         R6fw==
X-Forwarded-Encrypted: i=1; AHgh+RrJyTrzLQlX5AUWV8C8Z86psWOFlEd7nrs7dJLyM5imtJM2la+x4FIiNxxA5MljRizz9aSCCjLQxgPGtjapIUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1m98jcqgg6veXEm3vnobAcVDeoYaIKaW2zlog9eohK/Qnme6b
	WG15egU8nnk1TGUjQdxo1RVqchBGQrKZGmMRoKL8hSZQoYX42O1pH6k2Gx9x76aqdjeWArG8mXz
	lnoQtKKEP
X-Received: from pjbcz6.prod.google.com ([2002:a17:90a:d446:b0:381:386f:cb7e])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:288f:b0:389:8f6c:4d58
 with SMTP id 98e67ed59e1d1-38f9c05e7f4mr77365a91.34.1785364030147; Wed, 29
 Jul 2026 15:27:10 -0700 (PDT)
Date: Wed, 29 Jul 2026 22:27:00 +0000
In-Reply-To: <20260729-igb_v3_b4-v8-0-3ed236272b4e@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260729-igb_v3_b4-v8-0-3ed236272b4e@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785364025; l=2483;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=Rx3bLcqXnovy1TECTiy5I/rgPsTG+EJ3RxPeZYO1Wec=; b=amnjdKK/rW6c7yoi6UFn4XUwDabI2VACYpXYQdJ6VqJ+aQ3jBoTFBzHESR6fdNgq5v2O7NnP6
 cxEi1Rtt410DVhly6bnuIU6tNfamdsJS5PzLWW4ZxGolLyl5cZmyNeC
X-Mailer: b4 0.14.3
Message-ID: <20260729-igb_v3_b4-v8-5-3ed236272b4e@google.com>
Subject: [PATCH v8 5/6] vfio: selftests: Retry on EAGAIN during device reset
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
2.55.0.508.g3f0d502094-goog

