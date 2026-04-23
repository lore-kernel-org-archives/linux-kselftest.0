Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3463EBF2F
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946350; cv=none; b=gH0ILyusbio55ihJremGkjg7xgx0W3Va0J9alspPa6KGeBro+6XRIKJAEOqyF+NEbmCgLD5NjUD86uiOCT1JSx7TaVb4lcUmKPvK9rwXZvrO5lP6nDdOCMm8DJnVw7Lt3ZFabXVnknz2qmgHytrvvJaf27smY0WOsJh9SZR74Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946350; c=relaxed/simple;
	bh=SlQMI8IRV7H1W+0eRMmQQFi9awkSEWmQRb6390DKD64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4PXXWofVDUvKJE4xwsMcDzdh520JRPZRmT3TK1xzAnNu9PsSrKbyrcs5Ow406cZKI8afyXXTDep/teSGBkMrhudalLJj4JcFCu2BRjLcx4HH42BeQ2zqrCm7nFB5Pj3B0qIysipO7NOtoSHCKzKFHd/nqsHZVUXPzOPl7tdmEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu/juZfg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKPKLjKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu/juZfg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKPKLjKS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNI01565817
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=; b=Gu/juZfg9DW6wQ53
	LoOzGqs7uExgdk74DDKx0DAm8MIH/AvFpR4pJGYFQVSftrjkb3zcrNpQQMEY1ewy
	6m/s0Q//ZkPD/yrsV2anqkQziSqAkqxnyc2BSAzsKB4IhkhM1r95Grx60Ue81jab
	xkimBeZww6MO/w1I5LWRpJPwiZwgdrRz00qH5ByedVFzlqejrmnN1mlVsOvmJ8Tg
	4IQrvG1Bq+3yD0aUoYwQs+5kqastSVu2JpANt9quv27YZUV3TQ7fteIeW+k4qZwn
	eQdT4UYxo/1o8+hVuFuk2EXhz/mGSJfCOtp2ZvuZP0WEClhNmetrfswRVpQquHpJ
	gWLS3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuxwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e423a05c8so58100391cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946345; x=1777551145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=;
        b=eKPKLjKS0G225sMkO8X6eNW/Y4hIvKQLkE+kke6YqNuwXuJxpSm7In/i8iwfDbt3IF
         TLLkW7WcJcrN3pp3s4rde+p5fxbdCSZR/W4dhNrpbvdQLONlyJFdFnR7A98nunWCTfDT
         6RofiYT9BC1aqZMv3/XQyGfqi/wmIC90WBIIId2VsH2gOBAwrVnxFz28INgDBvmnbrNj
         96WobMTgaVs/FvGJbfnzL3tUu0VlcuaS0LcledWouHOoi35wlmqCbDmqU/Ls+IxVqcHw
         GE+eQwQj16/WmrDSd245/551bDVMKsvWWUkOayilYX/uANSzlQgbY9Qn0FHQKO+FYUW1
         dHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946345; x=1777551145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=;
        b=rHrnbJ2PARqxhHUoMmlxPOItcrTtR+XZhYiLBCSCUtlrLAwmRgH4quu/V9K18WfQlR
         s8RNywS/1986PCCDiDiUIZ3I9ps8h0/CqZC40K4YXvLk4THHkGL8mliLeYKZnMQr8ebC
         9JMa7LQUqVj1OE/KOoUIKUuw4KMPO6o50mxnKqDYxrXs/iUsfdJ/O0CXuuEeTZx0jovz
         vIdfbmkt+XlVYOLLz3HUYQ51w573+qyVHy5NbYdLFeaob93RcXQ7yKgNFrJxj5MIVZYV
         cHwN7BkPhkXgT5jyf75W5PJnw30TQPg1nar41HPNxEJWOT8642zCOeVk3aRAeZAc/ByK
         2Ing==
X-Forwarded-Encrypted: i=1; AFNElJ/RLFh8LxehkKtOYHhLsxr27SiViXlnVO977+IHcpXO6EWiyrBtUmy8grJ0L+mnU7JF8axaXYZuQ9reHOUewe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXz/vnZUWQp9W89qLefqegmEzs2sn0nurfE0fOv4sIcWFtNAV
	7xS2S01Ppr76ISGjnAv0mRt4EEcFJCs4F8ifzYCHLJrFbi84ZOEJ6e7YWJvHgeWznTq0Nc26xOo
	egoiE39fhqz2tBwJcpBFW1ixHlnCt5Y7eIk4CNqFZeR4/jnZTW64IwprPubkXuzMp/4eyxmo=
X-Gm-Gg: AeBDies4QG27/V451nc6uCik3pGtaA1I/TpSzJD9HdpAfP6pj7GRDl84BsC0VuuwV/E
	+VhpzLXdY3hdxdiq89CSglQv3b8RzE9k5fWBp2NIcAH8kb6yEcjfin3no6vSVvKeSF0WrnGEYsv
	AlJqt7ouwsM4OghVt7+0ENFywH2GrlsS5HqBZXY3yYSbewaHjPhlzzhedmEIO0tTGRbq4WkmvGX
	cLqd/VC4DM951JktD7xMU6vDo9f4Z7hWdzOMXHiDny2cmjYmINRKXRqmhKv9L9i4DhrdfpP8TY7
	WV0klsgH4Hphr+liDTxPzBnC1uR+6ZiXEoRJwUqIlzReF8i8+Gv19UyjZIE06HGUSSdJdAlQJWX
	1OOw2yJh9xh0mNvRlnTPOfOSz2lV0RG9rkydd18n0UlYsF+mtvVBk37mHYfJTPQ==
X-Received: by 2002:ac8:5f4d:0:b0:50f:6e68:d71a with SMTP id d75a77b69052e-50f6e68e71dmr189568991cf.28.1776946345063;
        Thu, 23 Apr 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:50f:6e68:d71a with SMTP id d75a77b69052e-50f6e68e71dmr189568441cf.28.1776946344662;
        Thu, 23 Apr 2026 05:12:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:12:04 +0200
Subject: [PATCH v2 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-3-0e5213cde2ed@oss.qualcomm.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4529;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SlQMI8IRV7H1W+0eRMmQQFi9awkSEWmQRb6390DKD64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gyeqxuM5PCbhczHEbe4WKT5eqDgjzg6iDDXO
 4wUQzoCmrKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMngAKCRAFnS7L/zaE
 w/rlD/wL0If/GvdO1tv7cFZZI8IjImnBBeu5lMLRndVe/71H/5EmyKWMbOhP3vISG/F0wJqdewG
 9s1OateVJTbflrHbQ09U0ZfIF9AQMVJuXQF3/aGK0r2wGN1X2iFjNVoa9GND3t9h01lD7T4SkWS
 o9w30ommUJ0m0kC0Ub9RSBJv8AThLvzN8l5rXRmivTlg5yD4+rcFxZ2oQfQdxwybtfn5LmYOEw+
 SdtHFykWabbT7TkD5/0oC5wJtcrbS0Ba3ybWHd/gMkym6f8Csr6+UcXcKRxVRLdlX3iNTTyzaTC
 /4qmSssPiLOAB9qCf96GA2rvw88ZEbsYAyfHXA3Yy5C341oixHJ0FN6ZFtiPYTXg9gxqVTOyLtf
 EVezTRz5BEWYEThJodsG6XApGKy0xYB/9cMxSSyMIK33i1jhVuRcCxPYcuEjrf73qgA/gO81+9/
 1reSEhFVPzghc4d5zI11tmRYyUdlaTF+w5rt0HgLAdiLaSpIN0VOrmWFaBHrACYZReLJCCPUxHW
 s2GRRQ1nqamD24o+62NwQaruMLKPiBvJHeqjfifQFFitkoGTX/p71vj/QeQsVJeNaJ/gBMJnFGp
 YjyyVbmyZWk5sXld6rMek9TGkX+aCl3R4mI+KUIzPM+lLocPrnrAPs3hR+I1y3JMIVZ4F4MSMhs
 XCcGSjzvHKedJYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfXz680uq2kNUDb
 C4nMrN2s5WiDedE/VzkBdya3bdewwJyBgjskfFE+mf+2Z9cmw1VClB4WkWgoBsQic4BfG0CcdPa
 qW6lLl3vRuOAA7BT5KaZdedwcn759AisGtuDXIcWCto6heUsuMp8G+raQSFRhXnun64Javf08vg
 Nv6tAzZ0jPpEdQbKSiwysNXWQKLZ8e7a/7Q1k6q1qGDdPORQfD5N1Cg+uiyNSE8MPaoDMQV2Tam
 xK6AQvwgek7CdIBz9OLjtLFyDDTuXfzAVcDb46Vza88Ptn/JWQuITySi1RGsKqM3f//CV5Pftgt
 ez7SQX2EhCbpuM3H/bltjHiUrCArvB2z3qp0+taPwGK3RJ10fSodSRqz5mdIfxOpbs17jf0NTO6
 zV4u7cL89a7gJ6/1UvtiH7KBZrPRIfTQrSi2bjs6wOPMvnIhG+5dJXyl/nlCt67/zl86eX4ZWQ0
 wYt9KaTCtiaELsRiVMg==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea0ca9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nEOnLqI-ckDzOwT8s0oA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qnHyT5qjcVpi0ip7URr_UKYlnSO72Irf
X-Proofpoint-ORIG-GUID: qnHyT5qjcVpi0ip7URr_UKYlnSO72Irf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230121

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..4b23f0d7f88548c62c49801fcee0919915e6e153 100644
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
 
@@ -253,9 +256,112 @@ static struct kunit_suite platform_device_match_test_suite = {
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
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
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

