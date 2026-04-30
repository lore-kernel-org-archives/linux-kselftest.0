Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B03E6391
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535190; cv=none; b=UWVo+vEi3IPd3c78lBcbT8TzFqHu/qqeQ5r9c4z3XndYV4UWfnJRATbxsjKNKjG7U+BAsmxQjLqg1W3czvdTVne3jUGc5DvRz4kLfZyM6DrPTGlNC7VEkS9BXwtLkmVoq+zyqLtumU48okq29J5trADwuewSf72+tOn7F2fhGUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535190; c=relaxed/simple;
	bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lY6Hg0/1vuIQQE+V1RFu0BKfCEBhiCjMWGkqzbb/7YyMJf7TrgwZF4ldzKX15REOJ20CGWc+uaJST0rHhurQkP2WjTye+Mcm6JNWwjssIlXwa99aS43zKpDrBQbMFYv+z7uUfUTQXRE/cHUOJLLeVG1T9fRYfIsWFoZCRQ0626s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX3fKRw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvUZSRXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX3fKRw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvUZSRXT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7ZmwQ088556
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=; b=RX3fKRw4Ih2dCFAJ
	TSFjE+ymud8px9czwLxeuLHa/bJqXdLPQE1RIeWvRiMniWhztTCb8KGGu0+0wWpc
	cvw0C+xat1VMnkvpQt04kDdsF4UZnBtur83Z2K1SBKot5xY4eWk41bxuD8m5JWjp
	S7DIWeOWFIQRuRcUJAWEBP92b0q3H3dAqmtlBjCnx5B9ZnSsTZbXuPpb+ENop0wP
	/m6KfzP2PiBOxi5XR0EqxeZvVCKgA9CZvTSqD7CUdzWcgj80miQolkN4Ihl448/S
	l535dv5m1lSWcYue/VC5ikKY+AYgDM/uqIfraQMG7vLvbg6Z38opr7pyh7UpMAmP
	4aVydQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u4019s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf0245b0so11052651cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535184; x=1778139984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=BvUZSRXTJ0B92d063g7EK8TG4va+PeMp/i6lIhnKY+cNaZ9Ee4CePcO+jnTnMwck0P
         qav0qRIE8CSmAkSVYSvu5aMLlakpqfwR3SaRoWGhUMI0atT11Yh0Tvjr/fDR8VsF2aVW
         w6am+BNcxzoMAKlpqFqzdhRA11m3iCft1i08ri/SQEb5ZkXeVgFqBprX91K1h+Xw0fi3
         HcWcfd8Z3JSJu9dWOJD9KgpRpp8MDxP2twqJFWtgAmt01e/W9y3Q5V6nH82Zb3jgGy9k
         1EjWSHKJPRly0DCWprsbMoNl8ROMWtGTsiomCknDR+TFFOsLHlgVOe2dFprPJpdPm6it
         o+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535184; x=1778139984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=Wemd6p9DVb3BF5d363fail02l+hVb4I8L56CPmJLe3bBDnmeKKStyUVPCeOFPP62z+
         xkZ6epbnTXz5w6ZeQMy2fZ2mdpYNzD3QuWlCY1X68W8qQsQT8DQ7Q+AY5Dwmsy7b3dnO
         fQb1llzpb95tjIprlg0llDHEjv5nZJFCor+gmdWRuKB+nbiBD+gYa+rLLUxtc8fl+Ilv
         DnuGnvM4h11i6opNy00rTYZaKzVOU4cNnUybdHdxnZgzIJpscGQmnhFoD7cFa4FF454V
         RsqGEmzRzXI50YyR3wai+LWBhV88k51E7LROLIODgIio4GgKGuQmC3hBWpa+9ljT0v+F
         pOlg==
X-Forwarded-Encrypted: i=1; AFNElJ8T2wwPH4tInxkbzkURYBVFbLIKszBonkRGV77+LqT80DXyWEzmMRjbbw9u0Td8zxmXK2Qev/vOejoweJ8rJ/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/UBmz4iKlXxmiXcrR+vCn7DzaPmUOp2Wl7uiI+Vcic/gYg4J
	Gau/6Zm542TqJOhC+0yF92mGT9m1hN+SZ6OzIiTO0EC/1AFZEgozBVoeIv5w9TtAyokeyJnM1gc
	LvGmEITG3mzgbz29Bq7JeIjkVh49LhretImIv/CM9ay5RuX9Cijp35/2KSFMv1WP6loFqP0Avlz
	vSaK8=
X-Gm-Gg: AeBDievtssadamgyjeoxaJVLO+rpRhbk5nRctdF2AoKfb6FjlR2+abRkmkisY8hrLsh
	iUZNVzWRrC1krFW1RtpNmJ8y/F0KCCuohVOA7TozEpTcpmAN6MiU/ArB7WaADIfLLJSMc/o4ahT
	phH27HJVgGEJQcmTLylU9gZT9B3D+azWljFp1lT0GaVYajrNpC0/yrea2F3fxrfGaPRCSa9wr60
	+GtH9kadG0nPmEtQAFrhVtylZF9eAhg6yRG/dj6lnUcvxUTumD7W2vGZWOdF8bRWgxQJPHGO8hA
	8NrMzYz50bVcZ7f6ea1JW7kyi0xsi3wme6oGiN7YjEw5KlxmT1u4WbqqoT38oGykwBGfrGoZqGm
	WMRBju32rBlNq/Y9Dyi05clRmRG1gCi3Ufrpi4pMmURIgZKyQt7KVOti7i68d
X-Received: by 2002:a05:622a:5595:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5102ae7701bmr23324141cf.45.1777535184508;
        Thu, 30 Apr 2026 00:46:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5102ae7701bmr23323841cf.45.1777535184070;
        Thu, 30 Apr 2026 00:46:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:46:06 +0200
Subject: [PATCH v4 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-3-01574da0aed3@oss.qualcomm.com>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
In-Reply-To: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6434;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wjHY73bjK2GzsfwhlZAW3gnvrZSLWSGNacEJ
 F5T2xhiC86JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMIxwAKCRAFnS7L/zaE
 w6cyD/4pw9gjhCEZK+OXYGHyac3qFVKRZicRWxRNHKnSo8iba+1J1vCUQ0eBCIAhQlIe+atzvJ5
 ior8nrT6ruocPz+Vl394E/heboqSatWJvKwJMjV+DS2r9EmueH5Vp+V/LQbkajMsZTM7euNrmaX
 2bwpraSaEd09EMv0u9AVNhKZCZ9TBRScNxeYdMEpt8uvL2QPSpc8FLMb3vHvjoMmcdZ1A+qiC+/
 7PvuC2hqtZz8NVcug4TUFT+KBrvvM40b2l3vnPPDtQLvUht5C6gKRDl6cXpIQXPLHn/xja5dyLG
 K9JLk4xrF9LwgRv8LTKBPGN7vS1DeO4LRj3038ebTnCDBHTXpa2C9UQUppA48QLdUNWupBdrI0l
 HP1jsg4olP77BKnKJhp0pk1HIY3lg2Mx1+xsj4fxAJcBZHCdX/wY3katxwE5sIm9E4AkWDpA3Ed
 nvXlIuWvyuveouZQJKoi+R6XC6wRJGD7gYZ2GFyDdd0gwtZMOicAwnPM7Gh1QQpG59E1fLFitq/
 6RWrrIcjYQ6COJ+HgAV4YYWGMKhd1WgXDTBXAiTTRYA46YDMGurHD/eM7/6mHBJkWk3BcUZHjxe
 fIL/2LNxCV5FvKy+i58q7YmZf15tNxwglnl6JBZa+9dghuESCvKfbCxyUi0Cvbw9euanT11mfjK
 rCiArcrQ5omfNRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f308d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Cjzkl-VOwT-M8rwmhL8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6d4QjZ7GJ8zKfwY-yW4XnxljAWa35Bc-
X-Proofpoint-GUID: 6d4QjZ7GJ8zKfwY-yW4XnxljAWa35Bc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfXw/lC+D/G1amc
 lGD7P3sCnPj40csglzTf18nuY4mx43uFLhU3T6zzr8nBYepLU4/99PxXZGTTR8XhFgt5WYeSB4P
 VOv+eWwzcsccJGBF8AkwXK+rAQY1idE1RS6GhAyIUGqonCOyDuAaoFLqORhEuYFLLdiI2NgjaF/
 TPInCxbOjDvdQQW/KSe96GgV/cPNxsYiVNaW1EjhPqSHw/+T5U+ZXIyVkAm7ce6H3ESvMpbJUjd
 M3zoML2+Lat+ZDe0vFmXKKeBu+B7WW3VHgIx0uolYOJUuOhPFE6BXbsRlm6JITAjSPTi7BCZgTI
 YxsbXm1k9lYZ0Oa5X4tKtSjkQChqzWANWOBOiWgYiYpyRG2IviJT1PgN3qj42vUOoEAsIA7tME0
 yLvZA30i58uF7IMlGuVQyidWAscj4DZqT/Rs4zX6oAd0BoKl1k7di9B7HQLIAoWV1wMJKn8PPVr
 XUKjDYejmC3unK3ql9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300075

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 168 +++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..3e42c205fc935ab1dd2066e257d4ecf837c9ad79 100644
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
 
@@ -253,9 +256,174 @@ static struct kunit_suite platform_device_match_test_suite = {
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
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
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

