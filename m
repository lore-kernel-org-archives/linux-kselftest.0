Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813269;
	b=Wp3RQQGSOd/FYwu6rkcr8YSmQDZ4dGGnRKNstTavAcv0hdyQRxtax4j+jIrcm0pBjXG0
	 WftfytloLyufYZ8LAaO/FU3C/OhqYNYPcT1waOblzbtgReU8lgBVqwgOAJdMb9Hi+xTC6
	 2mohvP7zeilxX6Ys2uMa7nH2J3m0aj3u1pJSHK9nhk8gpkCg30hZiQu1wx386XyQeVzPJ
	 rSTRul0SnGcyb19eQLrhQDM1fF8gqPUgXhyesM/iPdUUD2u2XSIBAZv12JstsoqqarKYs
	 tISynVbmOrk5/ASYEdQYw9399sSzqccybv9hU2x6y46cvtOFdlKXrChWy2aWFDMQwJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NxDYjHN9xu1rKZeQRn1aw7vmWeqj0c4dyaODRBVM0ig=;
	b=hZW3KaqALhjSZu1jvkyiid8tJyLUYvph3qn4X1G0lsUbDM17ozMVEg4oeufVsNvQjvBo
	 TfZpImzSJzJg1LT0KlcTp1dl8YV1QSFGjg4PIoMvSga6O8tUci/jFrFGzGqkXvT/49xmt
	 pXbF3pXN/ncYf8u7pIyKekjRmZtQPfZ3dfkbY68NYg1aFRwwIeFHFL99t4OAtOScv1JoM
	 /KErQmdIR6t2AzSVcJHlxf21/9aDTOw/3iJoxMz/N9wnXnWkQI/f4haWxdal4h9gTdSDH
	 7QJwi6eMLPZgKD2LVZj998tHVnijlt9SH/LmaHWTTf44nSlfNVdLtwRP0M0DioVhdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="flY3h/9g";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C924606A330
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 07:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C924606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=flY3h/9g
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3791619605cso6042027eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794813268; x=1795418068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxDYjHN9xu1rKZeQRn1aw7vmWeqj0c4dyaODRBVM0ig=;
        b=flY3h/9gbz3jeBAPlZN9xHp510ADVkhw6kZnMPbmfpCnewDRkATQ0avt4sv1c4a3rL
         ezjwpKxMu5ur1EgT9/I3t4vkbzpCm9rtjvlOb3KlGsw/Fla/JXImJOZ8BvllHQ3uq9Qj
         LhIi2MLuX2KS00+6GAgT/gPvbOBWtdfJpdt26Cbn9zRQ2olzbgCUklktC/DkkaanAeLI
         QIX9xfe9uYFpFDc9RJcuJAoQcKNWC2iAnoRwnZT2++nUneWgWfXDyR06tps3KT6/Kflj
         DTEG/ZIyQjktn5bR9WuayMR0lRPN9GSXiW5MDoec+EOnnyHWfKqa33xruqytsPfC+Pxn
         ftcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813268; x=1795418068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxDYjHN9xu1rKZeQRn1aw7vmWeqj0c4dyaODRBVM0ig=;
        b=IKn54evYM4WQ8f9eD+BdW4LBsIVIXPy4kqbXtnAX28qC0O2XLT5GRNgjL7sefglufi
         fE5O+N0nY4yAHmUfuGSsA7/O1bGWXkL7ahk8BblmS29WwstYOzZoOzG/HTyVUViyGhnT
         x3DWCT5wdRde0I0s0pRRQ91mbrZdPfa7OVcZWeDkSdLnsGkuvywvQhxqY+hiTyjimfdX
         FB6IKsJ4xYoVbV2rkae10GBYYGwPCiVFgLkaoy0YCBH/GLCG+ZKTnaucB2RyqWfPqoOI
         xkKvfNrWYS9LwpcCgfvj+wOgY+GwFMUhAmANDyYdqWRdrb0snAfIru0rstY5Yumlbyzg
         ubCg==
X-Forwarded-Encrypted: i=1; AL+hErHMubT174gtUVqSgw+ojFNW/aifsfG/gGkrCkjV1CFtS/wpMx7STjeKDe9WDZc/Ky1fBHhI+SH5jmMLHoZWxmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1BsXRd9S6yfK4NydWSGAIvVnTEweVl+iLID9K/LWgfpvXNZ8D
	6X6lLh5uHX15HMI1+75DI/E0UTdATgmDLBJXQ1EcaPV9BzUTxjVrfobLAgH22XhOWbQ=
X-Gm-Gg: AYBFou0Jp+6aSPCUkYWkZmop6hYB/iDCk8p0bQmRewwBVSEbcexKsI3Etzh/m+3Jt3R
	uRAekchbpUV8YrFvXkKYKGPamYk+juRsZ3QZzj4vjITnjl+YcaCeKVQ3ngqvevx1P6vBlNSUEZa
	ETaimWA7biNX2vph2+aF9x+7t4CucPVEFsJDFU7b8gXOCSWJVPQg+2nGiXkQk470EKLtLpvlvTa
	6TaXxosVzN+Xv5xFZfIIEV/pPIKs+bcrVifxwKDzoeMLFYi+fAlcsb0+25weZzC7jbr8N+P96oe
	rUddWCtVpXd0q4RNzR4RvclSn0n8iAz/bddAV2qSSNnw3L1j+vH2IZzeEiYl2ihKtoRJuw74uVE
	Uw6dVPAJpMl6rKfkZPwxJknWtCf7ndONa+L1gCf5566kF+6Y9u5riJZ+I8d5b3llTGFeWw/X4+N
	kBjQOHsxv2D4cV0Z4jxCb7ZL374Mp8wjd1Hf6W/oIemz8S6mjsLF/N0BpNHPJJP7nPG8dHs/Wqi
	O7ti6Iw0cmuJbE1cBFJVdig1vbPdG1LlvgXmXuL+WTmKxGnr/FTMf7JKPkbTRaO3Oz+u8zzcbGG
	WL8e4Qxqk1v/Pr1mSSNQXPOLZkjFBKfAOVmqYIcS3fJWsrPdTCFwZCpMIUiu07MxuKAjPLlJUQR
	YdGsnSA==
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr8592620eec.6.1794813268238;
        Sun, 15 Nov 2026 23:14:28 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm47858505eec.8.2026.11.15.23.14.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:14:27 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: fustini@kernel.org,
	jgg@ziepe.ca,
	james.morse@arm.com,
	ben.horgan@arm.com,
	xiaqinxin@huawei.com,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	kevin.tian@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	randy.dunlap@infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH v2 3/4] iommu/riscv: Expose global QoS IDs in sysfs
Date: Mon, 16 Nov 2026 15:13:42 +0800
Message-ID: <20261116071338.35991-9-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the per-IOMMU global RCID and MCID as separate attributes in the
IOMMU class device's qosid group. These IDs label IOMMU-originated
directory and queue accesses, and device requests in DDTP BARE mode.

Initialize the global IDs to zero before enabling translation. Preserve
the other field and reserved bits on each write, serialize updates, and
reject values that the WARL fields do not retain. Keep this interface
independent of resctrl device assignment and available without resctrl.

Document the attributes and add a maintainer entry for the new ABI and
device-assignment files.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../ABI/testing/sysfs-class-iommu-riscv-iommu |  27 ++++
 MAINTAINERS                                   |   7 +
 drivers/iommu/riscv/iommu.c                   | 135 +++++++++++++++++-
 3 files changed, 164 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu

diff --git a/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
new file mode 100644
index 000000000000..4658cbcd625b
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
@@ -0,0 +1,27 @@
+What:		/sys/class/iommu/<iommu>/qosid/rcid
+What:		/sys/class/iommu/<iommu>/qosid/mcid
+Date:		October 2026
+Contact:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+Description:
+		The global default QoS IDs for a RISC-V IOMMU. These files
+		are present only when the IOMMU reports the QOSID capability.
+		Reading rcid or mcid returns the corresponding iommu_qosid
+		register field as a decimal number followed by a newline.
+
+		Writing a decimal number updates only the corresponding
+		field, preserving the other ID and reserved/WPRI bits. The
+		two writes are independent, not an atomic pair update.
+		Malformed input fails with EINVAL. Values outside
+		the 12-bit field range fail with ERANGE. If WARL readback
+		does not retain a value, the old register value is restored
+		and the write fails with ERANGE. Initialization sets both
+		IDs to zero.
+
+		These IDs tag IOMMU-originated DDT, CQ, FQ, PQ and MSI
+		accesses. In DDTP BARE mode they also tag device-originated
+		requests. In translated modes, device-specific requests
+		instead use the device context's QoS IDs.
+
+		This interface does not allocate resctrl IDs or configure
+		downstream resource controllers. The administrator must
+		choose IDs appropriate for the platform's QoS policy.
diff --git a/MAINTAINERS b/MAINTAINERS
index df051086b5dd..e14fddd07882 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24072,6 +24072,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V IOMMU QoS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+L:	iommu@lists.linux.dev
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index dd2ebb25312d..b1b069bb2ad8 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/resctrl_device.h>
+#include <linux/string.h>
 #include <linux/generic_pt/iommu.h>
 
 #include "../iommu-pages.h"
@@ -1777,9 +1778,124 @@ static void riscv_iommu_probe_qosid_limits(struct riscv_iommu_device *iommu)
 	dev_warn(iommu->dev, "QoS ID limits unavailable; device QoS disabled\n");
 }
 
+static int riscv_iommu_update_qosid(struct riscv_iommu_device *iommu,
+				    u32 mask, u32 value)
+{
+	u32 old_qosid, qosid;
+	int ret = 0;
+
+	mutex_lock(&iommu->qosid_lock);
+	old_qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	qosid = (old_qosid & ~mask) | value;
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IOMMU_QOSID, qosid);
+
+	/* Reject values that the WARL fields do not retain. */
+	qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	if ((qosid & mask) != value) {
+		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IOMMU_QOSID,
+				   old_qosid);
+		riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+		ret = -ERANGE;
+	}
+	mutex_unlock(&iommu->qosid_lock);
+	return ret;
+}
+
+static ssize_t riscv_iommu_qosid_show(struct device *dev, char *buf, bool rcid)
+{
+	struct iommu_device *idev = dev_to_iommu_device(dev);
+	struct riscv_iommu_device *iommu;
+	u32 qosid;
+
+	if (!idev)
+		return -ENODEV;
+	iommu = container_of(idev, struct riscv_iommu_device, iommu);
+	mutex_lock(&iommu->qosid_lock);
+	qosid = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_IOMMU_QOSID);
+	mutex_unlock(&iommu->qosid_lock);
+	return sysfs_emit(buf, "%u\n", rcid ?
+			 (u32)FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_RCID, qosid) :
+			 (u32)FIELD_GET(RISCV_IOMMU_IOMMU_QOSID_MCID, qosid));
+}
+
+static ssize_t riscv_iommu_qosid_store(struct device *dev, const char *buf,
+				       size_t count, bool rcid)
+{
+	struct iommu_device *idev = dev_to_iommu_device(dev);
+	struct riscv_iommu_device *iommu;
+	u32 mask, value;
+	int ret;
+
+	if (!idev)
+		return -ENODEV;
+	if (memchr(buf, '\0', count))
+		return -EINVAL;
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+	if (rcid) {
+		if (value > FIELD_MAX(RISCV_IOMMU_IOMMU_QOSID_RCID))
+			return -ERANGE;
+		mask = RISCV_IOMMU_IOMMU_QOSID_RCID;
+		value = FIELD_PREP(RISCV_IOMMU_IOMMU_QOSID_RCID, value);
+	} else {
+		if (value > FIELD_MAX(RISCV_IOMMU_IOMMU_QOSID_MCID))
+			return -ERANGE;
+		mask = RISCV_IOMMU_IOMMU_QOSID_MCID;
+		value = FIELD_PREP(RISCV_IOMMU_IOMMU_QOSID_MCID, value);
+	}
+
+	iommu = container_of(idev, struct riscv_iommu_device, iommu);
+	ret = riscv_iommu_update_qosid(iommu, mask, value);
+	return ret ? ret : count;
+}
+
+static ssize_t rcid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return riscv_iommu_qosid_show(dev, buf, true);
+}
+
+static ssize_t rcid_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return riscv_iommu_qosid_store(dev, buf, count, true);
+}
+static DEVICE_ATTR_RW(rcid);
+
+static ssize_t mcid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return riscv_iommu_qosid_show(dev, buf, false);
+}
+
+static ssize_t mcid_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	return riscv_iommu_qosid_store(dev, buf, count, false);
+}
+static DEVICE_ATTR_RW(mcid);
+
+static struct attribute *riscv_iommu_attrs[] = {
+	&dev_attr_rcid.attr,
+	&dev_attr_mcid.attr,
+	NULL,
+};
+
+static const struct attribute_group riscv_iommu_group = {
+	.name = "qosid",
+	.attrs = riscv_iommu_attrs,
+};
+
+static const struct attribute_group *riscv_iommu_groups[] = {
+	&riscv_iommu_group,
+	NULL,
+};
+
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 {
 	u64 ddtp;
+	int ret;
 
 	/*
 	 * Make sure the IOMMU is switched off or in pass-through mode during
@@ -1810,9 +1926,15 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 			return -EINVAL;
 	}
 
-	if (IS_ENABLED(CONFIG_RISCV_CBQRI_RESCTRL_FS) &&
-	    (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID))
-		riscv_iommu_probe_qosid_limits(iommu);
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID) {
+		if (IS_ENABLED(CONFIG_RISCV_CBQRI_RESCTRL_FS))
+			riscv_iommu_probe_qosid_limits(iommu);
+		ret = riscv_iommu_update_qosid(iommu,
+					       RISCV_IOMMU_IOMMU_QOSID_RCID |
+					       RISCV_IOMMU_IOMMU_QOSID_MCID, 0);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Distribute interrupt vectors, always use first vector for CIV.
@@ -1847,6 +1969,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
 {
+	const struct attribute_group **sysfs_groups = NULL;
 	int rc;
 
 	RISCV_IOMMU_QUEUE_INIT(&iommu->cmdq, CQ);
@@ -1887,8 +2010,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;
 
-	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
-				    dev_name(iommu->dev));
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID)
+		sysfs_groups = riscv_iommu_groups;
+	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, sysfs_groups,
+				    "riscv-iommu@%s", dev_name(iommu->dev));
 	if (rc) {
 		dev_err_probe(iommu->dev, rc, "cannot register sysfs interface\n");
 		goto err_iodir_off;
-- 
2.50.1 (Apple Git-155)

