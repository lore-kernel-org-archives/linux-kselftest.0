Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633840;
	b=bAneb735fKlWTw+XZSNf5GbDpkBEq5TmaqWq+DLNl+pg/ME84MEZMCR+Io/4whG5EMC0
	 nRaO5DBb/vT5x6OwTUsw9HopolDc4omvblXYvLAw0B5bD9tifvpxDRB6B7bFNmYEL3jvc
	 /xHWAdaY7aXG5fjis9lbudO14Bla7s8GOgzC8Xg/TTpHMZPgPCoKkJtu3dFDo8EBAs0j6
	 RUZl8N5WN2I7u4h5cvTdXuvAJHMVPJW5rL8OgXSFzM1PUy0NKkqjie20XJ78cbvQ/9nbe
	 NK0l5jodtZOzIniHK8kv3CVRfCvTFYINH6CnX5TYkJ4NIpHso4QQ38TC7VfnGvYahwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
	b=UGVsBQGcCoYeo/NG7R7Ypm0F1hUOCFr1NcABWBhzj1HdAiSHOtmol4j4IK/pscj7q3Z3
	 3qt7lPWKURQFczNwqf1Qav3A1ScwHx3cbDA4c9nb2vrOq7lgxTtIqzrX6Jc0aXKx3tIl/
	 lhsqIE/Se1Q3Cp7niacrh2X6N8ESDTL9WqCkTgbUftRBaSRjrHiaFvDatF4Nk1fHrhsHH
	 huD67p7GG19PGeYsUy4Vp75kSTUtQerFEkEyILDgBf8jjGxaIE8NG+vK7n8vlRvW3ZCMK
	 fbL/yvgeOW5fQPtzBmVbD5nCvUF+peT+OARnjauxD6478nhm+QRIjOprxSgbyS8PpTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pqP7Tvet;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881160EA5E0
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2881160EA5E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pqP7Tvet
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2664698a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633840; x=1794238640; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=pqP7Tvet8OgHy4y8rb6i5QryqY0omXHUsWqYSnFE6K/w1lN0HZwG9hzmbaqbNH5ynF
         5vJ0NoZd1AJ2+lUsqPO2GPYMhTBeP3X5qvb7Tcp1SC5firmzfA+hwhCTX/cx7UstvBfF
         TGUOu/qnajXUaTmOw2DDj94jGJqAIBNyaLvZ6WmI3TQYE45PynMfrn4lVHIByYbpWnVd
         nonx9yi9tQUsQn8ZJHOaOk7hNV4J6MD9Zu/Mrht7zSvkFPH991l6UNyBa0vhJljRtfFR
         h8McEimqnWvBMQQIimznp/pUljWtRRhXJvZgUpG9NzFcZnxyIbwk0IodC7hbCcm3Qhj0
         ieDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633840; x=1794238640;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=ZKTtXeMTl6CxpGat7JFh+magDxdrNiQZRCjveXHoHcrkSGODrTbAmHsDp3eD/Hufjd
         DLV4WGiGW6Ry6yvwhFCatfwAK+QC4K6399RSXGJ1rB/6mJShWCKiGQURAxONPQLmWmj1
         Jrwc941gw5mT4QZLysC6tyzzdBKk2+0fVXTrNzXAQufmSmT+e72xpIkll4QNluauApao
         RylORzjn8f9z7waCA6kZszIqmDdxFv/Zvs8BHvOc6Xexgn4p26lFDgpGJFjgPifwH4Q1
         X6Hf6gidGiES5+JfAzevGo8Kn5EMh4pIDu512Y1KlkyAW5f6a5nyuiApgQxpoz5WqQkY
         Z68g==
X-Forwarded-Encrypted: i=1; AKwUvBxwgrt8VWGM1dnH+fpcJhiKxf9TOmbBa55MRuJ7YzPAcpsJ/3dJNA2VrxENlTrKfUD6BX6UgIo5HGRHBweCZJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HcjKhs2gz7p9RVMtGISvKzah4hCyRyfA3bC4eAlp1Dr9eicXx
	5+6I7atFSbvL9+Spw0AC9yWCfx2DnTUzuls17WyaFl/j96CzkF2gTALQXuEj9qoF73p/psjWcFm
	M4O/UDCdf0Q==
X-Received: from pjat8.prod.google.com ([2002:a17:90a:d08:b0:3ac:3195:12b4])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5870:b0:3ad:6090:a189
 with SMTP id 98e67ed59e1d1-3ae8983e2f3mr7697277a91.45.1793633839167; Mon, 02
 Nov 2026 07:37:19 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:47 -0800
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
Message-ID: <20261102153656.1431701-19-vipinsh@google.com>
Subject: [PATCH v6 18/27] vfio: selftests: Initialize vfio_pci_device using a
 VFIO cdev FD
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

Use the given VFIO cdev FD to initialize vfio_pci_device in VFIO
selftests. Add the assertion to make sure that passed cdev FD is not
used with legacy VFIO APIs. If VFIO cdev FD is provided then do not open
the device instead use the FD for any interaction with the device.

This API will allow writing selftests where VFIO device FD is preserved
using liveupdate and retrieved later using liveupdate ioctl after kexec.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  3 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index e19bd94b8dd2..9a62bfb6b440 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -40,6 +40,9 @@ struct vfio_pci_device {
 
 struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_free(struct vfio_pci_device *device);
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd);
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);
 
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..af789c859586 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -457,9 +457,13 @@ void vfio_pci_cdev_open(struct vfio_pci_device *device, const char *bdf)
 }
 
 static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
-				   const char *bdf, const char *vf_token)
+				   const char *bdf, int device_fd,
+				   const char *vf_token)
 {
-	vfio_pci_cdev_open(device, bdf);
+	if (device_fd >= 0)
+		device->fd = device_fd;
+	else
+		vfio_pci_cdev_open(device, bdf);
 	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
 	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
 }
@@ -482,16 +486,20 @@ void vfio_pci_device_free(struct vfio_pci_device *device)
 	free(device);
 }
 
-struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd)
 {
 	struct vfio_pci_device *device;
 
 	device = vfio_pci_device_alloc(bdf, iommu);
 
-	if (iommu->mode->container_path)
+	if (iommu->mode->container_path) {
+		VFIO_ASSERT_EQ(device_fd, -1);
 		vfio_pci_container_setup(device, bdf, NULL);
-	else
-		vfio_pci_iommufd_setup(device, bdf, NULL);
+	} else {
+		vfio_pci_iommufd_setup(device, bdf, device_fd, NULL);
+	}
 
 	vfio_pci_device_setup(device);
 	vfio_pci_driver_probe(device);
@@ -499,6 +507,11 @@ struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iomm
 	return device;
 }
 
+struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+{
+	return __vfio_pci_device_init(bdf, iommu, /*device_fd=*/-1);
+}
+
 void vfio_pci_device_cleanup(struct vfio_pci_device *device)
 {
 	int i;
-- 
2.56.0.317.g454f8302e1-goog

