Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA835477E41
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454305; cv=none; b=RfCy9JzcRbFO9IX87xiADCx9uTpZtiIgTRMna45fWAft6mWbLjwD07d70dNe5T9i1ZfLjy4qlRXWTqtoB/R+bTOSTOTRcP6WRwyiFRiP99rBqm34iyvSplFwr610fWt16ugAqzLkTvg4eM2HuJDFW3pDFN5OZAGia5dduEIKYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454305; c=relaxed/simple;
	bh=Rx3bLcqXnovy1TECTiy5I/rgPsTG+EJ3RxPeZYO1Wec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FH8jSVslR68ZCqHLl7RndE1dSbh6pYGEDRSurMUNKdsrkvK26lqtCI1z2m/FRADJUSkUGwD5X0P+6iVRopz8s+nfv6DEtB97SLMp10RJ67kb8ldekesnKBfrfB6DEH+VSpNeQJZbuuv2HJKEujm4PaKumFl8Bdk1lpqsgKL4vXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjIlSVNG; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjIlSVNG"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84885a4fcabso434134b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785454300; x=1786059100; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opN4WYe1olUwSIIaHbjWYmXQtC9ecX3k0IYVgISsk2A=;
        b=JjIlSVNGt7tqTm3ojzQSD5A8HnqTwav1xxdsJYKXWbwbELbNu7OfKJ1vgLmPcluIFY
         YBP2gVnfvGrJ6qGkhuvBTqwFb4gB4ht9/erVyzKmXcYwLzKSO02HGtkbxNvMbWOcLCh5
         Aj2qkVuJLLveDOI4/9mTpX9WqayfWrwz+BEUio6UNPflZuxKsk/ZXLd9F3MgzftnB2Dd
         qEkvarl259O9xkpMNlTb/oioShbFg4ALif2GZNZtObIQgmuD3ZG2x3fTeIcYLQfTVVMu
         4IZ1PbGFd2wQllHifqinyqFhZa1DWCyYQsMBf4H2GdK8UKI6botwByZDLpjozFy1U8Rg
         SjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454300; x=1786059100;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opN4WYe1olUwSIIaHbjWYmXQtC9ecX3k0IYVgISsk2A=;
        b=cZk4+TdzcmbAUHSGhiZGLopBjKVFD3JlKv9tTPw/AeYt85EXitjGLQSxNwvxrU8f4d
         5WnSWUJsYLtTwJLFBgbJdZFCH6Z0hHE2wcM+bk5/i5l6/MhTr3ydE3jDuFrgzJoWnup7
         VvPBslUssmUIEKU/hKBYy8KtyuFXjeK89w98WhFs2Ja573l4rIfNnaw7pUAKZIQ1COqp
         XJbdTKk79u8Kd3fVpVhCcD72ygOCpVmaetp4pXXfEdvwbIac31vAO8HyYnMLhCCQMRyz
         T91THJqcoaOU45QkVLRyHSpgyOBfASHQJ5Q2DwhMHSIF3weTfY43QaSxhakuMFvz/JtQ
         vOYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrH4YHYXLaxK7FexGKSR09OXjMFs5fhXHBF8+CL6z2Oxbd0XDkmieyBPXid41d+2Qm/JASbXmIsnCOg0JzkH4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPT6GAgwLY8eUiXBNr7LdLwt1MQOaITniFa3iDo4n34StKHsEQ
	Lcf9+IWtyYJjgE8XUoNThzs+CQWFty/SCMvsoxMVTUdaQtxUhcHfSeG7JvEpgHpiAe+DMAnWcrK
	l1bwOxny6
X-Received: from pfvx18.prod.google.com ([2002:a05:6a00:2712:b0:847:9540:3064])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4b:b0:848:2f74:1d5b
 with SMTP id d2e1a72fcca58-84ebc436978mr3731053b3a.65.1785454299493; Thu, 30
 Jul 2026 16:31:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:31:32 +0000
In-Reply-To: <20260730-igb_v3_b4-v9-0-9e4d8682437e@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260730-igb_v3_b4-v9-0-9e4d8682437e@google.com>
X-Developer-Key: i=jrhilke@google.com; a=ed25519; pk=cK+Urrh214DoCHywJiTwhMP+zcs1ofpGrewToO/i/3A=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785454295; l=2483;
 i=jrhilke@google.com; s=20260710; h=from:subject:message-id;
 bh=Rx3bLcqXnovy1TECTiy5I/rgPsTG+EJ3RxPeZYO1Wec=; b=UGkUD5NoRlcXNwH757l5GAicCStMH1PgV3e+0sAccJgUz7Rjbeb9+1JMza5CcTZOqiWEjHyFw
 trhxL4mId7TD1qQRk9eLN4FQJdqQUfHMJASoazGohH4B7v9XsgjNhS+
X-Mailer: b4 0.14.3
Message-ID: <20260730-igb_v3_b4-v9-4-9e4d8682437e@google.com>
Subject: [PATCH v9 4/5] vfio: selftests: Retry on EAGAIN during device reset
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

