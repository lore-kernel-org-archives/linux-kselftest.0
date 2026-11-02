Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633849;
	b=Z/tYHylbe7INb7A96GzHDxGZzTeVtKedbxz2vlqRKoTj4IYYK+IAufKtjfzV3g6SLPY0
	 ru7/1kEFf11uyYsL0/0Tih7I1+IRu6RZPoHRruyI4V4evNiX5lKGXajs3fbGkPa2w1atf
	 FTJuju+tAA9PQ56lYJZLM/r+GPnjm0FUcqJQDXFkQRyIXD7Gf45aOLKH16DY6vc+2aBqA
	 L9G+XJl7zG2Hm5v/J+SuKJwlv+KEg2iu9Vo1tJgDA+M1vRZ0UXpiHOiwCsFhj4L76ATif
	 OKzDe59J9cIm4F78VwEjYrNMmnuNo1RxUCUA3n5d6mH7hme1aWKUceFEFetjINHIRMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
	b=SVu2xdRFCOq3JcaguHrvZcI+d29CVtFAMsdsRNUBzW8cPCiJDz4VJBuVkeRrBOx6uxcg
	 wt5uc4XHNeYxxakA2WcxqouictYfRUxXVGtlFJ2wyJvdW9H0ctRA0LVi+sBB95m1C26HX
	 83epUxFVRZ/EL9wWJUxRe49Zh14LQgdD0Rf2CyOOI+etxY+MaRkRfiwJ5Pu+ZHWdSkxHw
	 iLuP3jHlpCRNiMRArSmQAEae4LWXce91lewDNC2IpsGZZorxcjkquveu5q/Rd/HZe23SC
	 ASS9TJkivVjobX4712QJLv2G41+4RPGRozWrh1ryLdIocURtGX7MiYC/jrxli8wb40w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cstrl3iW;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964CD60EDEE3
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964CD60EDEE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cstrl3iW
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so52854215ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633848; x=1794238648; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
        b=Cstrl3iWWFZdS21NZSsMRYbcjKaJCNQ9Bw+g9pMxmKPNXMuq2Ol1mIw2imet6uJE0e
         VdeX7qfx+uTEVhfeOQHX8HR8Q9e9wiZ+hvHm43bbSCyuZwsOkY06pUn7CAedbUpJ9IwP
         qwtiD8BpmDJZTt6Vs04H+nmxUOpSCLpwnwAyjHzBc6u0laSyzlqeFQF2XUrqvkA8rCiM
         SnLNl+iWs5wsI/WMMsCwImXIOxl+vjI0byUWvi7QjCagfxD0CgFsEgEPObRnbOSCF0fE
         GLGUM6AVJRDgYQXMpNf0LxWmoja+uSt15UQq7Km6SdHpUryn7gWzLv9iPpcXMdoqNnKC
         ngtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633848; x=1794238648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvnsa/W44mPMiR0xmzXgygBXbMEl9kAu534qF23MUJo=;
        b=pgHnFk6m0m/nG8HvCKUvloRfUCClLTLvaWd3frpQQKUFKeMQdzzdS1uIPEY0vmd4mh
         C/xPN97pGF1ZU8eIPXKilfQINgubqySFkZyQFmYgrsSr7J5xnQEWb4Pdk5Rc3Grg49Or
         syF8Bao4ROfqQ2ctz2uw5TesmQPL0uyyzTmCnRObRWX93TarXypxZp1qmiZzZGkduspt
         NUnlIAwKnAhb9Xdx9pF3uWM15uoQcCVt6saNN23NTCZbRyezA1LEI6b5qMP4xno06pUe
         S3qZCT6rknUdc4OQ+08fOK7Byq4PhH35KT+hPPbBq3QA09T5bhJyOvF4EJsnS7F3ZCdg
         X7Wg==
X-Forwarded-Encrypted: i=1; AKwUvBw88vk2+tMs3AvZx+sNWpavVkjLCxKkm3CB/iqGdoAISyS6XnWEQaeDK3UMvEYaDHanQbbqcsu/8v/DFVAIUOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NB1lQcud2lzZsFDaO4cZOQz/ffUkTvUv053iJukf3UdRuL3uy
	fgxeDgFff61GxVlzqqN3H1WofN0w4ddxxNrc2dWYW7Qtyp4+1SdOZ2/XwHrMoZQRhplVjgD9wT2
	DJW+hmJ57kA==
X-Received: from plbkl7.prod.google.com ([2002:a17:903:747:b0:2e9:dea5:138])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db01:b0:2d9:599e:df95
 with SMTP id d9443c01a7336-2eb3640503dmr101937705ad.3.1793633847651; Mon, 02
 Nov 2026 07:37:27 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:55 -0800
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
Message-ID: <20261102153656.1431701-27-vipinsh@google.com>
Subject: [PATCH v6 26/27] vfio: selftests: Verify that opening VFIO device
 fails during Live Update
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

Verify that opening a VFIO device through its cdev file and via
VFIO_GROUP_GET_DEVICE_FD both fail with -EBUSY if the device was
preserved across a Live Update. When a device file is preserved across a
Live Update, the file must be retrieved from /dev/liveupdate, not from
VFIO directly.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../vfio/vfio_pci_liveupdate_kexec_test.c     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
index 4919175c1173..9610fe593cf6 100644
--- a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <fcntl.h>
+#include <limits.h>
+#include <sys/ioctl.h>
+#include <linux/vfio.h>
 #include <libliveupdate.h>
 #include <libvfio.h>
 
@@ -56,6 +59,39 @@ static void before_kexec(int luo_fd)
 	daemonize_and_wait();
 }
 
+static void check_open_vfio_device_fails(void)
+{
+	const char *cdev_path = __vfio_pci_get_cdev_path(device_bdf, true);
+	char group_path[PATH_MAX];
+	int group_fd;
+	int group;
+	int ret;
+
+	VFIO_ASSERT_NOT_NULL(cdev_path);
+
+	ret = open(cdev_path, O_RDWR);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+	free((void *)cdev_path);
+
+	if (__sysfs_iommu_group_get(device_bdf, &group))
+		return;
+
+	snprintf_assert(group_path, sizeof(group_path), "/dev/vfio/noiommu-%d",
+			group);
+	group_fd = open(group_path, O_RDWR);
+	if (group_fd < 0) {
+		VFIO_ASSERT_EQ(errno, ENOENT);
+		return;
+	}
+
+	ret = ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, device_bdf);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+
+	VFIO_ASSERT_EQ(close(group_fd), 0);
+}
+
 static void after_kexec(int luo_fd, int state_session_fd)
 {
 	struct vfio_pci_device *device;
@@ -64,6 +100,8 @@ static void after_kexec(int luo_fd, int state_session_fd)
 	int device_fd;
 	int stage;
 
+	check_open_vfio_device_fails();
+
 	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
 	VFIO_ASSERT_EQ(stage, 2);
 
-- 
2.56.0.317.g454f8302e1-goog

