Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3197352C52
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730365; cv=none; b=HkM40Pu5+ctqqth8jfQaJQbaii9JBoFQMijcq60Q4K2Gwox8vAeVmgRjlEQmOPZRDgeaVoimZW+H1CiqLa0NxhIOaRiR/CLI/eySbZgvCzbxyTR8eFjZNV2UgNMPS48r0+gCZf6e2uf8y1DKYWYtdpBGU/VcGok7EMhG42i9PtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730365; c=relaxed/simple;
	bh=PZOth+FU4EV2cEyD9tgkza6Q2JFwnjFwqPPt7n6Gd6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPY8I0NMTdHQ6+4I0wiAtJUW7DZum1T3KqE7acEmZpmxHFHcoyihaQgLiKvSZBwIsO8pY2wSmhoLMJbcZYHwZRIx2/+k4V5vT99aiV8LHVKmSjakjk9e2Pv1FYFo4DIbKD+2ojzGrDBmyLyHYSjQNlPznOKe7RmHQiC6V2dAFZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkNo8tKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPqxoLSH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkNo8tKx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPqxoLSH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATVkI2647204
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+T/WGPXiaGdiYJ9imaZ4f0HimmnVzCyNd3eAmnjjhI=; b=UkNo8tKxZRoyh0FY
	EDsCjVu83oShMyEnC28NnsWzydlzsSysi4rO1xgAJ5dQENLwvPVApd7GsYnt8qaM
	0rzdXGGt46CW4oY+ylBXlbTvkmy5R91QbNF3Vxy1ZxGvCpqA6VIX8xpvXssqitId
	HslJ/KkhSkPidmo8g2/5Own3e+zXLgKN6cxblM+BTo/cm2FaQIEW6iDBkPg+Xlq3
	MonTDDfmXHdTNQ8h4FAAezaJZjpgXhQVwmdk29zfYh9ilsnU4JSjXVIA3pTsRKxq
	587AiQX1m6FrMatNETsATKZO3fKT1pu6sfeak3j26iJ5iT8Uzah//E7vCkYG+FZK
	sziRxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8p40s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b8fc5cc89so441925485a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730361; x=1783335161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+T/WGPXiaGdiYJ9imaZ4f0HimmnVzCyNd3eAmnjjhI=;
        b=QPqxoLSHJc+hHnZtPu+a4DLOGWxAbfBVnHsNyGQuOKW8vhynzymk7RtECSPdelbElf
         kEZKV+A0dxKDtH3Ize4bG8iDB1b9PfxRAbeSXELalWXFi3Rr9n/M6FbDQkGZMlP9MUv+
         ta3y3dEVvBeOiVyxFyL87Og1SD50KgHPU/BppXN06yV08Un5ACv0vBxXsmEv6GCrTHIR
         GVJ08e3y6JstV6eP+tF6O+JV1g6TNt5tsFC7Kr2lkrqKz9tLFCqSkcrhWseeVFKsHq5R
         6ov9nSelZw9Ty/g6x/e8Ei2SYs9l0sXX5lPjwwZ72rSyEvqxs7qoiENoB87cDjqnVA7+
         ltKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730361; x=1783335161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+T/WGPXiaGdiYJ9imaZ4f0HimmnVzCyNd3eAmnjjhI=;
        b=V0zbIUsg4Bf6kIMtD4VudjEzcbRJ+jj3eamZgOv+P27G8+vsWLiP1nLcRKkUnxTQjh
         qmYsgPkE5O3DorYISGrXwQsb5khIGw+F88V3qcbFouCOuj3It7BRSiKyCUHUPe8Z5E9Z
         cgImTidoCE58Osf6LT4XNRMzHY1aYPIxfQj/g7oWhPyF/zEvwUqD5+fHUbLyUTwUzKXr
         SGAw6wVk2Pbp3PX4uKXy2N37FtakxhNbs1i4D5mVHnfxIpXqY0UQ1JjC5ekRpMc6eokd
         Cga1dt99qM2iEQBeQqqC/IQsFdqdxJqUuYK7lgw/icCWHQORJ8L55HLPFmXxLu00SRPn
         YqVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0vq7bQ1+rDUqhXKVuMv7a0rERUApachfGAaPthNWAd05KldtSgFLC18onlKBe1ZDvzJ7tRUT1r0hWaqAsrjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXY3vidKYEbMdtsTrF4hVEFCkpKquSHO+HLmy2PPT+Dd7WBXYy
	JemKI7E9fszgebCwaQJUHqIXPc5DFl01rt9SkGU6JRC7tPXAi/KjSxCu7b3yfu48/8Yjztu3Tqf
	qPpPfhoXSDInDUCIzfRAelNh5KGMdiYyirPRpdxHVnBZqcdgRwb4rh8UUntmPMYG/WXcmW9U=
X-Gm-Gg: AfdE7cmf2XtcV/2YUB/2itUn4hJ2HEkKirOH1MV0DgpzGo+fbMHU8nuD2tIgPt+tY4V
	aruNingfu7RIr8GbjFRhTiE6f1VfwLuLqOI51aiBEznDjlf1hRgugX3qDlLl3yRHzF/OV0ChJbT
	p57t3msSy1H3XuaiFlbhSODqHdc0cV8sCdvWjrN/uJLh7I/rTsl5ORz+2ivO8KmuZnrqANeW91W
	8789cAY819mWAcVjR06yM9KknRfu63C0nS8vpECnWGF3Fg1vFthjETWnlmk6HVkYdWXwarq5Pfa
	fXa9fNbas/zBlb3XqdoJa/wcliuBs/AXKRM1oLs3xZMxWY95KtMgSApzhPX6gnBIzNrPCKyJS7k
	Di5FaGm1BH4jDoJwNMQujuLbBC9F7/UcsflVybqms
X-Received: by 2002:a05:620a:44c9:b0:915:8bf1:bb10 with SMTP id af79cd13be357-92e5f10965dmr29631885a.10.1782730360893;
        Mon, 29 Jun 2026 03:52:40 -0700 (PDT)
X-Received: by 2002:a05:620a:44c9:b0:915:8bf1:bb10 with SMTP id af79cd13be357-92e5f10965dmr29628885a.10.1782730360329;
        Mon, 29 Jun 2026 03:52:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:08 +0200
Subject: [PATCH 3/5] software node: add kunit tests for fw_devlink support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-3-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZOth+FU4EV2cEyD9tgkza6Q2JFwnjFwqPPt7n6Gd6w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5uGejBdxDWVR/hIxfOliEmmtwO+MNOi4pHU
 iPPekGWiuqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObgAKCRAFnS7L/zaE
 w02/D/9aQtRwUqqOpQKnkAXlmg5TMmQ71a7Y4pA6ZHx25qRm+CfPD3NAMB5aoUOJuPTl08/excv
 HoO10GVtPjusVs2EM6KEru1xiBKVUl1ZsvAzMMIBcUOVCoNBeC/Y0QbdC6gL1o45ck6QYaHK9Ig
 SYf9DiI8CUD3DrZ6YEU8rBDPb9IK7HopYwPtl1bMZn+/X1A+2O8sZX1oSC6GYVSf6WFnr4e2YuB
 XwP4SdAOuF3DeLjy9ShXc0jHNc3usCr9VVb2dXPTz1p/8qEAZfn/92EM5a0fWQtf6n/5ugDGiE+
 EIPv4Z47XXs85NtbdoE1o22UZMiedWN0PNLnxSHwwAGxzlVwhMptw5JpyneYlXuMB40tEPtD8OV
 4Wd0tytbFymwBLtGXVc2tiD12gQ5as8h4cXYPrVQw/acanGdN6NrhWZBnlyzA/uFVU9ycTIxJfY
 nQ1gzpJy2DfxoeKZ+wbAxRCuGhZAfUWrMs9z8sHxNZ7h0dIP0egmkLXGmEHdXOhNT9s4cLhzCpZ
 s9H3xDVvvjTfo9Tv4qlpiKEZTpSvg6/lHnrEvchJ/2cAvr7nPQgQVuHqZZPrJ8ExIx4vQgiM8nO
 ZfGQQgzq3sv78Vz+XeVClsRJ1EeI6tFXM2If8DYb9/TnG1oT57K0s/fHInZDijP7kdrc7BwxxwH
 jZBivg47g4BgUxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX5EW0ozLw+91h
 012n6pPBjq5ocQ8UGVf5FZbzb7R6j34ClkLWzSeuAaJPtDEoU2HhLfVa8rO7dn8uUsKdiYDnrtm
 OGqS+fVeUkC1VG29rDqizuNt2thTm68=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a424e79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=B2VWpJW-EnqOboN21yMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J19XYXq9XX-XZALhyGfvadDl5gTIYLB6
X-Proofpoint-ORIG-GUID: J19XYXq9XX-XZALhyGfvadDl5gTIYLB6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX9YYf00yaKLFS
 +CxW9JW045KzPxX4BM8LzWu40s2yQcekA3RZZoK84bL44LdOWyt71ZmZjBqnyOjmT7TG5ikxttY
 AMrH8HPGVVDd8AikTv9SLZFPk21OftEYF0kw7oE74CHmklw/mCuQEul45pMBnWpOXv/gjci3ONc
 MQ2ly2OXrwa54zR/0aknXasif0vXm2AN8y3VqwZFCCGkbRNkHLbRXjYDScupN/e/U+n+NZQOpve
 rfQmMugK89I2F8q43Gi5sQNmyj/4yzqybT6N7FlKs+76d5pATRnTXZMws/c5Igl9L6yFrL/tzwH
 DdtiBaJnudRWoN4OR3zPk2fEMzCmMS76U1OFyRB9Y3DuOz3agg072MReogmwmiLwJNdATb3AgtN
 Pp8lloffBF0k81EG7WmWsTxFhF9Lh4y/Bat5tRf5GmbbKheGMMLZFKLn+zVgZOp8vQM07ecGzsq
 DxZxiEhqNygqwr++yEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

Add a kunit test suite for fw_devlink support for software nodes.

Most cases call add_links() directly and inspect the resulting fwnode
supplier/consumer lists: a single reference, multiple references, a
reference to an unregistered node, a "remote-endpoint" reference and a
reference array. The last case is end-to-end - it registers real consumer
and supplier platform devices together with their drivers, adds the
consumer first and checks that fw_devlink defers its probe until the
supplier has been bound.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   3 +
 drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
 3 files changed, 344 insertions(+)

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 2756870615ccab67ec26d8671c1e4dba69342134..1ecf0791241a1b2eee7e1e787772217724abacb9 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -18,3 +18,8 @@ config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+
+config DRIVER_SWNODE_KUNIT_TEST
+	tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index e321dfc7e92266d2073d442f652cadb6e911dba5..1b78a705983c145e29bd166606f2c78682342735 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -6,3 +6,6 @@ obj-$(CONFIG_DM_KUNIT_TEST)	+= platform-device-test.o
 
 obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
+
+obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
+CFLAGS_swnode-devlink-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/base/test/swnode-devlink-test.c b/drivers/base/test/swnode-devlink-test.c
new file mode 100644
index 0000000000000000000000000000000000000000..42816f8f7c1ee4572b6c87bc91b434c0e0086aa8
--- /dev/null
+++ b/drivers/base/test/swnode-devlink-test.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+#include <kunit/fwnode.h>
+#include <kunit/platform_device.h>
+#include <kunit/test.h>
+
+static int swnode_count_suppliers(struct fwnode_handle *fwnode)
+{
+	struct fwnode_link *link;
+	int ret = 0;
+
+	/*
+	 * The suppliers and consumers lists should typically only be accessed
+	 * with the fwnode_link_lock taken but it's private to the driver core.
+	 *
+	 * These are tests and at this point nobody should be modifying them so
+	 * let's just access the list.
+	 */
+	list_for_each_entry(link, &fwnode->suppliers, c_hook)
+		ret++;
+
+	return ret;
+}
+
+/* True if a supplier link con->sup exists, checked from both list ends. */
+static bool swnode_has_link(struct fwnode_handle *consumer,
+			    struct fwnode_handle *supplier)
+{
+	bool from_con = false, from_sup = false;
+	struct fwnode_link *link;
+
+	list_for_each_entry(link, &consumer->suppliers, c_hook) {
+		if (link->supplier == supplier && link->consumer == consumer)
+			from_con = true;
+	}
+
+	list_for_each_entry(link, &supplier->consumers, s_hook) {
+		if (link->supplier == supplier && link->consumer == consumer)
+			from_sup = true;
+	}
+
+	return from_con && from_sup;
+}
+
+/* A single reference creates exactly one supplier link, on both list ends. */
+static void swnode_devlink_test_single_ref(struct kunit *test)
+{
+	static const struct software_node supp_swnode = {
+		.name = "swnode-devlink-test-supplier"
+	};
+
+	struct fwnode_handle *cons_fwnode, *supp_fwnode;
+	int ret;
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
+		{ }
+	};
+
+	supp_fwnode = kunit_software_node_register(test, &supp_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
+
+	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
+
+	ret = fwnode_call_int_op(cons_fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 1);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(cons_fwnode, supp_fwnode));
+}
+
+/* Multiple distinct references create multiple supplier links. */
+static void swnode_devlink_test_multiple_refs(struct kunit *test)
+{
+	static const struct software_node supp1_swnode = {
+		.name = "swnode-devlink-test-supplier-1"
+	};
+	static const struct software_node supp2_swnode = {
+		.name = "swnode-devlink-test-supplier-2"
+	};
+	static const struct software_node *supp_nodes[] = {
+		&supp1_swnode, &supp2_swnode, NULL
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("foo", &supp1_swnode),
+		PROPERTY_ENTRY_REF("bar", &supp2_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_software_node_register_node_group(test, supp_nodes);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 2);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp1_swnode)));
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp2_swnode)));
+}
+
+/* A reference to an unregistered node creates no link (graceful skip). */
+static void swnode_devlink_test_unregistered_ref(struct kunit *test)
+{
+	static const struct software_node supp_swnode = {
+		.name = "swnode-devlink-test-supplier"
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 0);
+}
+
+/* Graph "remote-endpoint" references are excluded. */
+static void swnode_devlink_test_remote_endpoint_excluded(struct kunit *test)
+{
+	static const struct software_node ep_swnode = {
+		.name = "swnode-devlink-test-end-point"
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("remote-endpoint", &ep_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *cons_fwnode, *supp_fwnode;
+	int ret;
+
+	supp_fwnode = kunit_software_node_register(test, &ep_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
+
+	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
+
+	ret = fwnode_call_int_op(cons_fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 0);
+}
+
+/* A reference array creates one link per registered element. */
+static void swnode_devlink_test_ref_array(struct kunit *test)
+{
+	static const struct software_node supp1_swnode = {
+		.name = "swnode-devlink-test-supplier-1"
+	};
+	static const struct software_node supp2_swnode = {
+		.name = "swnode-devlink-test-supplier-2"
+	};
+	static const struct software_node *supp_nodes[] = {
+		&supp1_swnode, &supp2_swnode, NULL
+	};
+	static const struct software_node_ref_args refs[] = {
+		SOFTWARE_NODE_REFERENCE(&supp1_swnode),
+		SOFTWARE_NODE_REFERENCE(&supp2_swnode, 4, 2),
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF_ARRAY("suppliers", refs),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_software_node_register_node_group(test, supp_nodes);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 2);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp1_swnode)));
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp2_swnode)));
+}
+
+/*
+ * End-to-end test: fw_devlink must defer a consumer's probe until its
+ * supplier has probed.
+ *
+ * The reference created by software_node_add_links() is only useful if the
+ * driver core promotes it to a real device_link and uses it to order probing.
+ * This test drives actual probing through the platform bus and asserts the
+ * supplier binds before the consumer.
+ */
+
+#define SWNODE_DEVLINK_TEST_SUPPLIER	"swnode-link-supplier"
+#define SWNODE_DEVLINK_TEST_CONSUMER	"swnode-link-consumer"
+#define SWNODE_DEVLINK_TEST_TIMEOUT_MS	2000
+
+struct swnode_test_probe_order {
+	/* Names in the order their drivers' .probe ran. */
+	const char *probed[2];
+	unsigned int count;
+	wait_queue_head_t wq;
+};
+
+static int swnode_test_record_probe(struct platform_device *pdev)
+{
+	struct swnode_test_probe_order *order = platform_get_drvdata(pdev);
+
+	if (order && order->count < ARRAY_SIZE(order->probed)) {
+		order->probed[order->count++] = dev_name(&pdev->dev);
+		wake_up_interruptible(&order->wq);
+	}
+
+	return 0;
+}
+
+static struct platform_driver swnode_test_supplier_driver = {
+	.probe = swnode_test_record_probe,
+	.driver = {
+		.name = SWNODE_DEVLINK_TEST_SUPPLIER,
+	},
+};
+
+static struct platform_driver swnode_test_consumer_driver = {
+	.probe = swnode_test_record_probe,
+	.driver = {
+		.name = SWNODE_DEVLINK_TEST_CONSUMER,
+	},
+};
+
+static void swnode_devlink_test_probe_order(struct kunit *test)
+{
+	static const struct software_node supplier_swnode = {
+		.name = "swnode-devlink-test-supplier",
+	};
+
+	const struct property_entry consumer_props[] = {
+		PROPERTY_ENTRY_REF("supplier-ref", &supplier_swnode),
+		{ }
+	};
+
+	struct platform_device *supplier, *consumer;
+	struct swnode_test_probe_order *order;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	order = kunit_kzalloc(test, sizeof(*order), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
+	init_waitqueue_head(&order->wq);
+
+	fwnode = kunit_software_node_register(test, &supplier_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = kunit_platform_driver_register(test, &swnode_test_supplier_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = kunit_platform_driver_register(test, &swnode_test_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	supplier = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_SUPPLIER,
+					       PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+	consumer = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_CONSUMER,
+					       PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, consumer);
+
+	platform_set_drvdata(supplier, order);
+	platform_set_drvdata(consumer, order);
+
+	ret = device_add_software_node(&supplier->dev, &supplier_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = device_create_managed_software_node(&consumer->dev,
+						  consumer_props, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_device_add(test, consumer);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = kunit_platform_device_add(test, supplier);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = wait_event_interruptible_timeout(order->wq,
+					       order->count == 2,
+					       msecs_to_jiffies(SWNODE_DEVLINK_TEST_TIMEOUT_MS));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	KUNIT_EXPECT_STREQ(test, order->probed[0], SWNODE_DEVLINK_TEST_SUPPLIER);
+	KUNIT_EXPECT_STREQ(test, order->probed[1], SWNODE_DEVLINK_TEST_CONSUMER);
+
+	/* Tear down the consumer (and its device link) before the supplier. */
+	kunit_platform_device_unregister(test, consumer);
+
+	device_remove_software_node(&supplier->dev);
+}
+
+static struct kunit_case swnode_test_cases[] = {
+	KUNIT_CASE(swnode_devlink_test_single_ref),
+	KUNIT_CASE(swnode_devlink_test_multiple_refs),
+	KUNIT_CASE(swnode_devlink_test_unregistered_ref),
+	KUNIT_CASE(swnode_devlink_test_remote_endpoint_excluded),
+	KUNIT_CASE(swnode_devlink_test_ref_array),
+	KUNIT_CASE(swnode_devlink_test_probe_order),
+	{ }
+};
+
+static struct kunit_suite swnode_test_suite = {
+	.name = "software-node-links",
+	.test_cases = swnode_test_cases,
+};
+
+kunit_test_suite(swnode_test_suite);
+
+MODULE_DESCRIPTION("Test module for software node fw_devlink support");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

