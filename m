Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09262481658
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684738; cv=none; b=RWYPyR/jiGKdjylKX7OoQa4+TLjSpzIfTfMvJM5XfAc/posqOLti/CJ6AVzzx+gsVH2xPU+ZNfP/0wixFxG0yFITKmak8mjz9odvTdmd5lj5en2V9eu3XEO943+SmUvrpFSj1lOiihGYet2Wk/MPZiRbhLcthUiDPZpBn8OSHYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684738; c=relaxed/simple;
	bh=d24dFtlvfMuawvdaUyIJH818bPfYa2BlcPpS/IedBHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iie+ctlZ50woc9GAZJzPzLQHQqrmi/0sFAinVKhaDNMlv3nYiYpJ+oKwNdpE0mn/4NdQZ/5B9fPSvplEwA7bA18EWot49qoQPkHpNwGBCQylXnnD2mejIkp6MX+SmNM7/O2nYMlGOCplrQ+Zq3TEULgYxHZPO2TItOyTusSpurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdA75/vY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGu6LjiC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdA75/vY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGu6LjiC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAhqFS1393176
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=; b=XdA75/vYSLr0ny4t
	D/cAbWk4mVwIy/MtIQX84WsUeEc38OGKLPj47uaDIBsnR/h2Q5rFsUV3ohblqEHX
	foF7wK4gBXCfhheE9y4J+OhTVPoDamAxix0YpkvlqKJ9DtAbZIEr3HjGeAeX4IXW
	DM45+prkTXzN1zjm+luvhym2R/HWy+drkwuD9NDl+f+TtAseMHQ00X3TMXSdiX/+
	wYnOegSXB2C/57hOb/oK3R8NqvIqm57nyiB9zAU9IQJ2h7XnNOBMUvWF5/kySGoq
	9WrCK2p6Qi+F4P3ZzIoi/3DgOSd5ekKSkXFAvOz//yNQips24SJysH8R30RDYTzt
	nK0Lqw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26291f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:36 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-482769a1363so1685058b6e.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684735; x=1779289535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=;
        b=hGu6LjiC7x4zbWIpBRhMPjU9lSoejPNJ9HYh4fniLLuvHx+Z/2utnjfkpiEOH41SCF
         i/fnBWKdsa5IE0PCErOhqQgoZZjR2lhMVxPeAiLHc1Jch9jfdH7qw4w9Q40ulmIsyL3S
         OgnNKnXxt+vwRqth5jpLQAND75gEypNu0k41ssME2MCH+t0fvI89NNQmQAfHlYnPKAvA
         /jQsfiHZioEmZKPTePZ2HhwxBgjW/iJgdou1hzrpxDMkkbsHLIvlYwK1SBPNB/pNS3vm
         5z+ysAW1oUYmnw9G/LrM+x2c263M1u6NQBXlJ9Qy2S11acZzXtVZ9V1o/F00af0sawSb
         OcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684735; x=1779289535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=;
        b=tUDOAZtoNIPEM1tz66bShaBKNTfLxcw8tI7T+f+u6nMb3xV4Z6SFFCWWWrfXkK9PBJ
         Y6bSsR0ee47i5Iyb05CgVYKvMuNEIYYAnakfFizNRuA5ZpGpQFTW/kUA9NvDuhMwTtnL
         qa43gULDvMKIaSwv1NjLFjTIGPDl33mNIJR33RRopbKdIJ+rdcV5B0WQQnB6DD8FxoZm
         mnXmaixqOGErQvfN7jBhU8Hvd6XWBR2jhDyDi4c091Chs9TYf4HFXxRjZ0eaa9SxlpiK
         +vYftt1BbSXUCsjXqyhInnnoxf30Fo8KrbLEyB8LdFVNIwha6n5//aCdYpl8UYTxyt5c
         aSPA==
X-Forwarded-Encrypted: i=1; AFNElJ8bLtLgcRhvzzkUg1FBDq3ybRW7goFUEnjfZYZZl0yX92luaw6xhyWZBN5JhHwpwjA15JOi+SjYSdb4TVNs/oM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81W4M7uic2UdfLXUWj3YFe2kOyPGlbOEcSBpcFqPyN+FFm1jK
	/1x3j9Xmn/SPUC7zodopc80Xb51aI69nQDIaMdwCcPHo+9et0CzasgCkLfmhFNfjW4g3ALdfCON
	znEdIRmVpE61Og9SXjhqHsxbUsLVAUO7dGG0liBnA9g1QPdc3vHwCgofghrLUTDiiqulUQVE=
X-Gm-Gg: Acq92OF0HTqlbwWhrivHP95qSq1JGeEADKDBtnSOl8RrDXdCa0Ydfd4uCfzEA+/7ZZh
	d5W55ExqxfYdxm4xAO0C/nUtP7V0U7se5vYWyygGECH1HWLYrc5KcL2vDhDe1tecQZunJwPPR/Q
	JoxAfe81v5Wb7tYWNt0j3l9nICuZ2/NcrURwca17Cf+wY258ibYjpOreM4MxssoD3Nn377Q6ehy
	gMrLhJlq6WC4NHV1gpYM4iddYVLpH2WvgNmMxr38SdldiccGasEzwagVrw89obhvpB/0zC75AVw
	NW+KgF9/C+q+axrhn8VtmLWrW/75CU6gFqnB0F054Rv6kh4J3T+HghFsg2W36s8Wi/zTQeIccym
	k/l30kuPd9l7X+JWKtzD4TPD3NTx6ROviY0PWGPo67ozWKv+u6g==
X-Received: by 2002:a05:6820:81c8:b0:694:8fb2:2c35 with SMTP id 006d021491bc7-69b78d11428mr2055196eaf.2.1778684735317;
        Wed, 13 May 2026 08:05:35 -0700 (PDT)
X-Received: by 2002:a05:6820:81c8:b0:694:8fb2:2c35 with SMTP id 006d021491bc7-69b78d11428mr2055135eaf.2.1778684734742;
        Wed, 13 May 2026 08:05:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:53 +0200
Subject: [PATCH v6 6/6] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-6-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6353;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d24dFtlvfMuawvdaUyIJH818bPfYa2BlcPpS/IedBHc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMq1jvlIrjR+1YjAHxLTODuz/d6Jvy9zNVaq
 VH0oioMXqKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTKgAKCRAFnS7L/zaE
 w/kVD/9g7s3fsgMqRqQDYlvSLGPgfIEBS/V02e792MpgIbfqbt3OrJE3pCAhbXHDtUj1TSm/Hn+
 sCgRxmmGSjSKA1yyYG6q6ssgJF/wbHBeanRYyo8X1UUx3jKw3aGBNNMJok+6dOszuJH1+TQzCmm
 IkC1Su945CkDf9qGvq/zEeW3y43q559qBKDFTIFuRrPOpd1HjOKnwz40ejS+6tJmNVs6WcQXBw/
 fMaE5sesCr/Hk2xuw/PiPjNiNkIDM81dnmY7H+CYXY/REWh4wmMu5z8IlWNGMVRn53eXAKow650
 4lYR5frk0zW+b2bXKX0ZBI6I0y2lU03MHRzJiD7XnVxHexSXC8e39AvgKJ0KfSzxJaSS5pZLFLM
 uIVYWedC4YBdY7zNd3QAb7MSPyHy6jBdlIArcYW02SrFmHp/3u/gdeEcPOA01qZmvwp9xWBBug4
 AiAiXIPtjeHqbEUvgLso3T8JU/xD81qjWqtSRpHsT1Fv/wM4SOCN1jJ/LwDkctyhGA2jt8Cxr9U
 1y5oTIuBfxY1YueWcahkTJerriXbrZhefQ6u+j2+EAVLzHaVGaocjgULZRJhJs4FQ0lU/dULB5t
 KRRdXoFLhLSaCn1wuBGoboof4TVxdMErbJ62u4tH4JuGngxfXuYYVjKPVyrapCL0S5AsEK+czxG
 8JCBEswJPqdyd1Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a049340 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zydxXWD-JFuk5BhJ14wA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX/xil/mA3FHcL
 3ruYjk/efwQW3LpwqCv6L1dDzJj4BiUIb1MByh6rkGGsH54i3JzbwnZPxfY8l3+EMMOnrrLr6bl
 1L2kT0j43ETMpYNMh6g26sVMOSfLnAg7rtb9osArHtGvqVbfiWIvQc+Ts77FEfCu3PpbcKScCqd
 vNIRE1sKC0GZwtm+VEYPv071vnrT4/P94askokrnz/hg6L4pyKaATrfFcbltm1KFteBXP2Ieo1a
 /fM3rXhAK/0psQhUv5iufepAYxWlUk3Pu6Q/fz6KsU5edU4uIhCjD+LyW8+yY1gcb0pfCY7+CEw
 DU/uhDQjU5CvrpDwTMPaUofXhqJC9Bh0hg1ezFMcAWtGV3SqbuxEQ/fGlt3SFAI7GLg5Z1HAgCG
 1zC0li4A8XHvpnmSiOZljBj7sCDdM22bwAkeeml6tAMdenVReU/lsInjLBAI50nfWdJGnJHEgNJ
 xiFH8ti1TC2tMHyFC9w==
X-Proofpoint-ORIG-GUID: KNgCnHIokpl-xnBpxGiL0RVc4zegOz_V
X-Proofpoint-GUID: KNgCnHIokpl-xnBpxGiL0RVc4zegOz_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 166 +++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..69551f01eb82caba58fb79cbc230c3c74d0fb3e5 100644
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
 
@@ -253,9 +256,172 @@ static struct kunit_suite platform_device_match_test_suite = {
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
+ * with -EBUSY due to the software node already having been registered.
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

