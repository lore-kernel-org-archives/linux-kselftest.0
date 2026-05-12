Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCAD4E3761
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587213; cv=none; b=ci2UCFG34RCGZA4T1Dz/qR2zOzKcw1MfCbJGZ5K95e50gpq49fSJ/CgOhkjOCpbwmYyOaTu7fV/ElwhPIEKVb5q10mD41V0hgVT35l6vt/PWHd2P4TpD8HjUnaVTU832MQkw5G2+oTrkpC0KSISjAgkUawHP378/IwRe9iV8B3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587213; c=relaxed/simple;
	bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsVnI7xOXjfQLFWxCQ2/GkKw8vOEE+XQlpXovRlUL0628isVgAc4Kq+capwGu/V8HkIomaMmmN/GNsFlu7bPgke29z0pXWyrcW8hbpUxZhS4womM1DMM+l50YiB9VIq7ZlHwCmjGiBqYDebjVs34Bte76hIz+B2v27uvazBUY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoFeT72p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWe3711k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoFeT72p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWe3711k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkXn6739981
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=; b=ZoFeT72pfsOlM5d5
	Q9P0d+U+J3+gLXzSIMulT3dlbBAysYft4DQmv2crK9iPt4dQ4LmSZpSintTn6g6a
	szObmua3J8j8AYmTtw2yCzfxYEWTF8IVZjtHo3a1sZM5+IZNYkh6M85Jx7pD6M4Z
	E0jrVvglU/QnPv0BFjeZjWqRnDz8F6Tc3lmLDrbRvGQLD7kCkXZ8H1urol++/oj9
	W0BJ5mD/BsEwldkLMaqUDOyEP3PZIN+gDatCGQlcW6XqyJVDjsdjN7BrMHknxJkO
	zm0FGmPtBrSqOCGFbbGVeNeVLmDYdypc8n4TEo8RjMXbVoVdtfyhCoaQUNHFVff9
	w97IeA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrcdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8baa173eacbso7885676d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587207; x=1779192007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=DWe3711kDV1koBxJ2pC0WrDBo4Q1Ai9vhd4M/4q1CC6mruFnMi7ht17173lj2tAqk6
         wSW4zerz5nCiOqYxtmVtwIq4clhNkDLkGOKBERfyLqdYQauup8UB/Y8tpYbvLn2SIpqP
         sQMeuJKWh3WGsRVWOp6bzTgmAC4y78PoSCgj695BVDat/fXOl5OC/4ulmymAr7rL42kT
         xT+DY1lcmoJnbOb0YiyalM6HPOGgZAY9Mpm6Hs6Z69mxqHBbQ5mrjQfDot09m2HAF6BL
         zdqYHQs+cHI9jCiPmpSNmt6uq5IIMQBNaNpMSameUiOqZi58t3rmdZL2z351uXVDbW4V
         MLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587207; x=1779192007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=XRRYwNS8Jf7azadVhLvkx6cHtjFZbI3BPPMiGtNtTx9UQl/WNEj3BdL4/HKHZwK00v
         LgrqWblM8242mGlSffmW8FBHEa+IP2R8YZJtDPta/qVj+CxR5ztmnkOudoYs7HFDT+Ud
         0ffc1HiATnKHoyXCaQK7Ex4T4PMTyyu05StUvEG1iLWdeTTOVoNFYx1ML7G75PIdvbSh
         1XGO+7KQW9selz9Sx6y1s4bX+yT7HK4Ij1BfzOAIouWPfBMXLZrz/NgSc8qOBo/Vx3Bp
         wyY4ECjuDnBfx/Tw5jSD/wXqmafoPFE/Nz8et3VYWNuLOS9VjkzJ9CFQ7TBqb5x0A9bb
         pUBA==
X-Forwarded-Encrypted: i=1; AFNElJ8JEf15gaOJ9omOZ5iS5Jaf0yLl3m2rf4q6bEiXquXHKxcZyRt2zoh+lnMNb978zB76rJP2fQlKcx+539bbyxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZDtxfdmoygl4YLibFwa9pEHavdoyytodINs1DgdrgHN3ZCA+
	RL44ajt7/sFBnjvqaKq/rppIsY70OzQEf2lNJFfTTpo849jGxTZISU6R1VpWFurDW1BvjP4ipUs
	AVU9zs0if3ZWuI/2xe+D09Df7QTKFFMrbrXN9iyGmuWtVQSG3N0Gu7sAIwu/sy24R1aDYseApV3
	5PbNw=
X-Gm-Gg: Acq92OF424THUtlEq19zNoUlF71RzgxemVMUVxkX4tnSRFXHp4lehQcRkhMR5/f+xlL
	jHo+iUxHDnICY2MV2ouLXIXLA9KpLlA/6Q/ccyluVe/zrSGi3g5AXeY74XEPtx/UFg+jOvL4GdG
	FOSG59zRIoIlvEiW4JYiRt2ocbq8ykufpaNyZ4khgFhnYvG2xY+24/0pcfhmtti8ma2dAonZVoW
	BD7XREf0IvSJFPSTaXJLZ0CpkNPnv65mcmL9sYkh8Co340YT1GZmEpSy1/3gD7rMiv+8GKrbsAp
	HSm5qZviS75ZLoWJ3zJO5Zz//MUu22fdOvTelfNj+mKCj1doRk45C89JK17pR+JjqDnRHV5vDTu
	4wgT3XTTj3cbOIqwpp7PgFkdqejDTMQ3BHkOT9PeKlMBYJGXi1P0=
X-Received: by 2002:a05:622a:10f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-514d1c95f03mr36271541cf.23.1778587206481;
        Tue, 12 May 2026 05:00:06 -0700 (PDT)
X-Received: by 2002:a05:622a:10f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-514d1c95f03mr36270591cf.23.1778587205842;
        Tue, 12 May 2026 05:00:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:00:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:29 +0200
Subject: [PATCH v5 7/7] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-7-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6434;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxY0q82yz6BguYdxjl79tf0UYUV9ZvHnFuzil
 4JV6kOlroyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWNAAKCRAFnS7L/zaE
 w+psD/482da3lZmvP8AXgMk8UtergM9VadQZ3rPGL1A2cUcKHzFQ72I4AVVvjzyQV1PunFaaMBP
 74XOBP99q4RtQE98xpAzl2c3MH4MFs4DaayIt8iQ5mwk64qP1VNKy0fh9uoOjy2pQ4aTVVu0pD5
 YBDlVtLq1YbjRXkQhucfTq/HIvYIMMuQ+RwJg7ZmQJ+O13CVgytSC/UNuEn/w67ZS+dXJGWMD7h
 /eUhnsqKr2Unyj6z1SxkZ7eKDIPbUGfH8kKvCfSHZhxgy9WMekckduch0akl4h+62683TIF/084
 RxPYXOdbGfkXtGVK0A3n3fAuK2zebzuEumuEx+fRkJ8vy+neiTjkih9pbpy490SEzhLcFYhuFi5
 USD/vm4Xu+jk38fRaG5hmBsApNFXuOp7dCixEaeRFWB9/zp2JlKNm4XpeyclRGxlkwRCBckXZjz
 MglkJiWZyx71anTbKAjRqbWEOUPNHQz01VTW0TkCGMj1KtqnWe4RWFVzoyXg5IRXyXv5DkyKWrr
 rB6t0p6+iEZGSN17doemWdbwCQtqEI+zDL1anpySOeRMbGmPa2f908DK5mek7Hob2CO+Fk8ygoE
 lhcoWvgLHVUddfR723GeeozO9OAE3Nmkoqwe4zAw4bwI4TO0n+QzJkm5ad2SRusa1Vj+YyyWEjy
 he6MtaKzOkYICnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX9TCJrEeqaP7k
 6N2yxnTylKsUD+8awPNn4wfUY5HL6eW6RwS8/wDRTHD0KdVUnLo6SVKqVb1A3lxrCsOCelMCmS5
 /1+rot54ZGMySidjj4tV5KbMeMjtTOweBtdmQZJxMTO+3tLn/71LjlweXiMEJ8LPzNkzKPPFHur
 LFFE62qmyp4MwUXiMQ1kiRb7cbE0bg/92zo6drfGPtpNJVqoz1Uuat4HsbP4pQbqTyB6ZeV+q5Y
 HnUKPcktkMYxkbY/z4e+YGMqxGNwXz3WVjNOLEpaX0tG+ml7qYYnVDWkv/s+UGk7rD3uHRa0iDz
 DWz9RXJREOJ7FSfo5KYMZZ1+0LDjlxFmqJnymjlb0/Iclmm5akFK2z/Vdu8BypBzQQ8mcnqK4vJ
 eWH9S4cQwmhENWH9f5Lbysnwoeu/5f6Oaf6dm/v9ohgoNkCRnzzmz4zksKMLFLO75oLLmC4qk+t
 2+pWjlsxakrbV7JPlzQ==
X-Proofpoint-GUID: QMHa9LaGdHqVAJ32tDHGO6F71kch2X86
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a031647 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Cjzkl-VOwT-M8rwmhL8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: QMHa9LaGdHqVAJ32tDHGO6F71kch2X86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124

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

