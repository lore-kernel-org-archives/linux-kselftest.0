Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D03355F46
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368050; cv=none; b=DxpEr2NEGHpFG4sHP+wAegfeekCfR1ijOqpXuZ0oTQl3jJJ3LclN+B3D2sB6JXVMdj40rqdmw3P5I4/t3Mmyeas0aXvckMZBVLQCAGpVLpyMyITyytvC3WOeIXzqixsaxuqxUY+Ab6j8D6aOyRJBs4uOKOBPdlbK7HocsbLkf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368050; c=relaxed/simple;
	bh=T8cDYp2DNAqsSajdUoTPkvXrB2+9GR9lrfSx0ziTXnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlsRnBpOpYZ0mS+gS3Z8OHwSTL0poQ1k1ET51A1/P49cImKGnsqeEn07815CBp/V7uPllBeJx/qbZLcu77TBkD0wRkWYX4i7xC7aDger7KkNlEv3RZwFx6Mj6PC3GhffCBat7peZCFOU1tHYUN4/SU0Xru//MnKynEyN88eydL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGlAvFBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rbbdw3zj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGlAvFBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rbbdw3zj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S67iZa1625050
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=; b=iGlAvFBwKsx2g8SM
	bLBvtLP2mtu2ixoHUpUxDHk8Mnme4jXi1SJqbh+yJ9O6tCF4oyDmpPKHylIb2l1d
	oeL7gRtBGQtVcmXYnPG+iOEy6uccnbPjZYk15dm10Wn5GvUM7UnfMeqaGQIxW8t0
	944vwqGoc+BB8pIb+aEXAMnmP6QSi2g3ldh3ZdcCBWChIMC7EbfpIAhmL53j38zc
	OCDKbxMO2xsTfJrV9W03xBV1371xVP4I2fDYt5NFXB1y9lYAyUhJoemVenckwe69
	L0NKSysLPz9VItP8n6ZsQpBRDIY4zGRJ7GwCDk5Xe8l9fPV+GUebdG9d1Wq/afsl
	Y7nljw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa79v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50eb8bad331so77578471cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368046; x=1777972846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=;
        b=Rbbdw3zjjmYQN2oP+MGdh+/mmDEl+OQRrnQ5DWPVwK0XKUuwPq+VXcF2b1+zMuNvHF
         AXTY/yx9FIgs4DzuwIw8E40/p4Pjco0Et30HNCH0iwtReanF7kviTvshzn3qEVmPjKPj
         iv8CaquFk5lrtsL3RcaYOcDi5o9VeZj7fOhVvfjbDkWyyrm9QQsH9KID5g81GbKyzc8k
         DTjrjaQLhcYhQb3n5EDfk/O/MiQE8WbqgxKCnDa5P0RlI5WQJaeDkE8m3I7Wl0IGmbOQ
         o5CebQ+QDiiVX9MKbkzhG97szXyBcoErIQHeTWs+dghXXkhwtLx33ivR23nrg6gVUtkE
         Bomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368046; x=1777972846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=;
        b=Ljkgm0ENutbXMVIGFL68KUnLQS5VIB7SD1sUlf3ysEWwVIKff/oXKlBK3ov88dYM9Z
         rdL9lJX71ksUNNTra/PW8vF31C7rMEpKq0HoLJOQyPmzIl8e0M0hnFiti2PTY1PP4MrU
         oC3L4EJcw+9Yl40do+iIN9vwyjR3oFFj7qCfZltK7eFaY/ZMJla69t8RP17of60g8TC7
         g+OGTKYsT9qeM2eEd0/VJmIAp/FWvFSzU4nwbf8OXID+08DG6r4JGaYpmWQDHDhrhOq2
         Wl8rArd3siILrdDAilDAqRNj1jRDK3uoIv7j5vdGwfulBFgq0le9lanSKUK9ZEQkwHME
         2Ydg==
X-Forwarded-Encrypted: i=1; AFNElJ8lqs4BGMuMnI6K/6vkWotVjjixtNQVXU5C3ZUCOCFNr0BUGozrZI/f/4YbCifhhvkccIQUeg7uP9DXJBsN2Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZ7bDzn+q5hJp8l64JzKTyH9FuEpRzkqn/F/BclFcPmNwK3Hv
	W5OC+UKTwHmfmzSLEhnnSzUJehMS6fQOlWt+lx28K3NYq96t7P7kCI4/pUD15jhTkmRQfM8z4nk
	d96rEEmAnp8oJ8H2yTHme92k4dLTmY+DDUkCZhMdkzVXx+QMbXMphEj8wkolzx/towhMRyB4=
X-Gm-Gg: AeBDietLwC/anmHNktIDQT5VAU+8e0N6OC27yyPNFXRDhHTGeTu7bX4xiHyUbZaEww/
	pajsgZXPhvY3FQQt3WqxQLoNqaVPOncAg9/Boijppj1Bu6gukia8fFwGUeETD2Hu/H9+6+UXywt
	nmbNs1hbJ0lc6c71q+Vg7s7CRea6/uQOByGnNxfFM4BLwTIwptd2jXfNWIL3ep1M+rA8SeRPv1Z
	dlQgDKKZmcRvOQ8PX0nvO9USPwhaNsalG1xR+phE2ioXAfC5x67gQlGMeFcvra/jgVA4+aeR9jn
	KFudQWx/As3qEF9wKuBPLX8uWj53hzSOaCno8njajsthpzARutG/OC8UiNnOv804Ux3//9RdGXE
	KeXGWaV3cnr+Ma9vz1r2/kaX3AYtRw8DYKXGhdsoCRTcMSakCyRC/IJVkNwvc
X-Received: by 2002:ac8:58d5:0:b0:50f:c5d3:a18c with SMTP id d75a77b69052e-5100e12dd9fmr27572791cf.20.1777368046180;
        Tue, 28 Apr 2026 02:20:46 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:50f:c5d3:a18c with SMTP id d75a77b69052e-5100e12dd9fmr27572461cf.20.1777368045598;
        Tue, 28 Apr 2026 02:20:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:20:28 +0200
Subject: [PATCH v3 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-3-533bdc71b22e@oss.qualcomm.com>
References: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
In-Reply-To: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6067;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T8cDYp2DNAqsSajdUoTPkvXrB2+9GR9lrfSx0ziTXnQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8HvkK3aARE5v16HitWeAITYrhw1b7vUsRJWGO
 oOiPEUW1quJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB75AAKCRAFnS7L/zaE
 wxlzD/93aEyaLYrv6CzlQiY8MU3aZm+VK+O2gnw9M1ctLlVaMh/NeWYDnJeGO1t50dAn8rOWCUh
 So7WyOHHs6Wx1UQ47NcG2eEk97qi9dPo6wV+YXShKCXnr8+/TLPdze5JCu7lASLE6dk0+by36Jl
 sP2iMDPXPpOt58ewSEGdLRMijh0PpFMy9Ji5Qnx10saLFTmz40Rrd6i0EmiCm+et3w++x6AOm7+
 PvBHm1/EN56gBrA57cSo30BW+ijrCEJCP6eFn0LDdp0zOEsINf/6e2I6T5z79Z8CBgQlMXUjQgt
 sua6Zf/qG1QmGzr+DsPnx+oq1QGwb3n3I0wGuPCzwc7pnd18X0nT9AedPfqU9avnnbHGD+WXl7A
 3sBjzyf5as9wNqJBzsZoBXn5EeWSVlYnPsKDDgAzPrAUSWaTpmyQgwzHPBXomm73B0wKa+h/TJq
 adYf1nSF1B6lVyFGKRFAJIX+BsZ+O8DFL2lRP6KFUu09A+GG5mxeSxBhURsk8KJae2xFUEPtY29
 kWMR8GC51nP4DZA3AM0JIqWa4L/50RULM6Jf4DxI3uvVRQ+xK9HRx/g82i/8NFNnhFTRcBXt5yb
 /3ugyQLekmATa2avQD5D0Rp7dcmJ9x17Bi7K3tyV2RbbUZ7TE2aRDuJSU6fVbh4LYA7M4495RpL
 jX6a0cshCbH3dOg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pl6PqAs6vURF7DJ3mXhJk7aJ1cj-etrH
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f07bef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vxuIP30iJWOd7SGqMXcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX3hc1jQit2DO4
 Cv1lSEKaQ2WhsPCczRyHERrKEEtrPCNA7wOGeqTAk/VotRP6l7hdCMBoZQDriH31v2BsztQX7br
 GxeGoOvi84Ddn5v8sEdCkJBPJtrkJuT0yfTPZwbguaAEYyC5i1+cp7a2/mFq4Ndfzt/Dh1ZGuXO
 ls0ZNc4QZAhu+DdQ1Fhj4jZhga22fK4dXVOINZffT4ZrlZa4eSk6SxjQ1Jz3Ur3PJjhYuzq0diA
 +VgvoG3JtFY96eWltQUyDlklhLIRo4zxNsRo0GCgBgiYiXOD4xdxu6XYXanom/LPWuuk4IJBkiz
 /t85lLVZIiDa7g8dfVqt6IcUGQx7okSzWaV7s5OKANkRWoqxgPTYwHDm/ruIcDrIohAapdyQ+Bx
 OVM9vNNhoSJGxY3L4Mea3N8tJ7RrY/PdMRYM9IlF94CikL73SHbzAsoAVBE06SYJFulAiwWSCn+
 qSgU1QYAXc4/sJIXswg==
X-Proofpoint-ORIG-GUID: pl6PqAs6vURF7DJ3mXhJk7aJ1cj-etrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 156 +++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..19b3b2ea150738877278f7e37be7ef69539147c0 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/resource.h>
 
 #include <linux/device.h>
 #include <linux/device/bus.h>
+#include <linux/fwnode.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEVICE_NAME "test"
 
@@ -253,9 +256,162 @@ static struct kunit_suite platform_device_match_test_suite = {
 	.test_cases = platform_device_match_tests,
 };
 
+static int platform_device_swnode_test_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver platform_swnode_test_driver = {
+	.probe = platform_device_swnode_test_probe,
+	.driver = {
+		.name = DEVICE_NAME,
+	},
+};
+
+static const struct software_node platform_device_test_swnode = { };
+
+/*
+ * Check that reusing a software node works correctly. If the call to
+ * platform_device_register_full() fails after adding the secondary firmware
+ * node, the software node must be unregistered in the device's release()
+ * callback or the subsequent call to platform_device_register_full() will fail
+ * with -EBUSY due to the software node aleady having been registered.
+ */
+static void platform_device_swnode_add_twice(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(&fwnode, NULL);
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = &fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+}
+
+/*
+ * Check that passing a software node as the primary firmware node of the
+ * platform device does not result in it being unregistered by the call to
+ * device_remove_software_node() in its release path.
+ */
+static void platform_device_swnode_as_primary(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, software_node_fwnode(&platform_device_test_swnode));
+}
+
+static const struct software_node platform_device_test_primary_swnode = { };
+
+/*
+ * Check that passing two software nodes to platform_device_register_full()
+ * fails.
+ */
+static void platform_device_two_swnodes(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_U32("foo", 42),
+		{ }
+	};
+
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &platform_device_test_swnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_two_swnodes),
+	{}
+};
+
+static struct kunit_suite platform_device_swnode_test_suite = {
+	.name = "platform-device-swnode",
+	.test_cases = platform_device_swnode_tests,
+};
+
 kunit_test_suites(
 	&platform_device_devm_test_suite,
 	&platform_device_match_test_suite,
+	&platform_device_swnode_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for platform devices");

-- 
2.47.3

