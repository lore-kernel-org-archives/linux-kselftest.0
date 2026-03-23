Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111438AC66
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310360; cv=none; b=Xt079Fvird4PTFGIQk/NAjwUzR5tzIeOpQMcEscMLFv3OFrH4GMEbEMtiZ2z52cXn4UHYudDMzIG3LBGpxdZ4iXxogpBHYZlfRLhM87ckJYaAZFP3GMgYp+zI6SaSF+BntKTKBuLApcWInfRkq0Rrnt5W7H6d4WQict0cjlKf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310360; c=relaxed/simple;
	bh=dNUCR5flvD4enDeDr1lXIjIuSGLMofR2iyil2GVOefA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ws3sdGmOysR6g5Q8/7oi7zvD/7ruI7kEwdt+lV91h3LWjpuIBk3yvP/Ibn23DwKIZBwBDQzjqGpX3kk2n+BGJZA6djr7xQUpnS5a/YCr+82mb4QzX284MRcplowSpan2I1Rky2O028zfz1sefyfnGkp289B81m1jTuV4zSeUM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=maKUtm8k; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="maKUtm8k"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b06395b7a7so58797255ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 16:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774310358; x=1774915158; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sR2QH2u4Z2w+nCWLa7H/5qSEeXCYEvILvD5RlzuPkZI=;
        b=maKUtm8kSCkVi+sgPD2pb803+yCt0hRk/DQU6+sN6WsQuJYMe+sWUL+H6fu96DFnPN
         CX4NorpQMP3GnyLMruYy/xH5RqI9dQnXF9pyfxlaMVHzEIvtQtJ85eEXCfAH9p9IQ/G0
         +KIUEFwPOMgg5NbZPEw2KSlXnTnOpz4+IhLbk5pRAwR4Qw3dsEdegtqTw8bcrYrVt2TX
         mU8SvDI7weiDlnPS6/xpLU7TJ19UvRHL+qXIU+loVW7rUuLNwfyGb5Bw+3BD8pdcNBiR
         wErn7MUmTrRKtsQEHzoGcBU3ns4QzvplGAGz2cqLG/bd4PEu3swcNkzovToy+/Lsimgp
         JevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310358; x=1774915158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sR2QH2u4Z2w+nCWLa7H/5qSEeXCYEvILvD5RlzuPkZI=;
        b=Re2WsVE+lf25vC80L7rbS0wCFGXDyciISyYC9Fh4KKsucbeotUzARwEC9LH+A7eyyV
         PEGs2usj1BB9G8DhdFqLffoy27DFuLD7iwJ5q/2oVnX3JfBkdki+fsIMrD9vyvdKUg4k
         uynLaCKPkVu3ECHsO4ZZbGG6FqwX4p/reFLsUrQ+8aQm7nETJ6ww3AwGKsmLhH2W7E6f
         S4cJJdLFr4Nfub34Wii/DaoD3qL/5Pxg71Hx5yxaBxvcqizEW8jJRjZWlzM/Q4Rxge18
         OA8/p+x4LAHb/7pDw0cLjqRydPUa4BYi28GylQdl0kVP2oxwagP5gMhsR9Mzi8X1Iw7+
         2uvA==
X-Forwarded-Encrypted: i=1; AJvYcCUYcizFdPbIo+MpTRB0bQDUNk0lR1Pmz5ZgrZrgd9/jo1yYnwVMWEsnOx/GYhbblPuoq7zhh2puOVoEANvhJnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkGqvJcvQjVqf9Fw/T37q3v0t7MqPli+tgaTu4bWzKqKxwukE
	KaDfkNNPS2ei5qOklxV5c28iXWslzoJx5iSxBHEOpqKyOEnOxv0fRsUz+yO40A2/5kiTQwD4hte
	3g3ikaUhiWKeQPg==
X-Received: from plge5.prod.google.com ([2002:a17:902:cf45:b0:2a3:1bf9:d25])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e84f:b0:2b0:7114:23cf with SMTP id d9443c01a7336-2b0827dbc37mr127246635ad.36.1774310358090;
 Mon, 23 Mar 2026 16:59:18 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:58:15 +0000
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323235817.1960573-24-dmatlack@google.com>
Subject: [PATCH v3 23/24] vfio: selftests: Verify that opening VFIO device
 fails during Live Update
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Li RongQing <lirongqing@baidu.com>, Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Verify that opening a VFIO device through its cdev file and via
VFIO_GROUP_GET_DEVICE_FD both fail with -EBUSY if the device was
preserved across a Live Update. When a device file is preserve across a
Live Update, the file must be retrieved from /dev/liveupdate, not from
VFIO directly.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../vfio/vfio_pci_liveupdate_kexec_test.c     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
index 15b3e3af91d1..65c48196e44e 100644
--- a/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c
@@ -36,6 +36,42 @@ static void before_kexec(int luo_fd)
 	daemonize_and_wait();
 }
 
+static void check_open_vfio_device_fails(void)
+{
+	const char *cdev_path = vfio_pci_get_cdev_path(device_bdf);
+	struct vfio_pci_device *device;
+	struct iommu *iommu;
+	int ret, i;
+
+	printf("Checking open(%s) fails\n", cdev_path);
+	ret = open(cdev_path, O_RDWR);
+	VFIO_ASSERT_EQ(ret, -1);
+	VFIO_ASSERT_EQ(errno, EBUSY);
+	free((void *)cdev_path);
+
+	for (i = 0; i < nr_iommu_modes; i++) {
+		if (!iommu_modes[i].container_path)
+			continue;
+
+		iommu = iommu_init(iommu_modes[i].name);
+
+		device = vfio_pci_device_alloc(device_bdf, iommu);
+		vfio_pci_group_setup(device);
+		vfio_pci_iommu_setup(device);
+
+		printf("Checking ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, \"%s\") fails (%s)\n",
+		       device_bdf, iommu_modes[i].name);
+
+		ret = ioctl(device->group_fd, VFIO_GROUP_GET_DEVICE_FD, device->bdf);
+		VFIO_ASSERT_EQ(ret, -1);
+		VFIO_ASSERT_EQ(errno, EBUSY);
+
+		close(device->group_fd);
+		free(device);
+		iommu_cleanup(iommu);
+	}
+}
+
 static void after_kexec(int luo_fd, int state_session_fd)
 {
 	struct vfio_pci_device *device;
@@ -44,6 +80,8 @@ static void after_kexec(int luo_fd, int state_session_fd)
 	int device_fd;
 	int stage;
 
+	check_open_vfio_device_fails();
+
 	restore_and_read_stage(state_session_fd, STATE_TOKEN, &stage);
 	VFIO_ASSERT_EQ(stage, 2);
 
-- 
2.53.0.983.g0bb29b3bc5-goog

