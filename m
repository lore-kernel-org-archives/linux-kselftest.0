Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5F21ABC9
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691514; cv=none; b=P9Rt4PnCMonsWlGeqfKYtzmle/91DKn4zww3WINqaIslhz+U2U6vCfLwIKKrHsVX88OOwZtMs3Mq7+y7ewOjwDirE1w+NLjjjctWRYstEycFBDy4vNate4R7et53cxEwFEe5CPOta3oU7XIDxJmNw/6YE4sh4FPGN4xK+91OADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691514; c=relaxed/simple;
	bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyAMZPF7bHbyoZJyEnAh5ojIbpXFm1A3W3yO/Rv9M4d4Ghan5ndKz/4aPBlQCRFgM4iHYSPqVq8HXVHA/chazNP5uixjNAJ7g01Cp0H5jf3RR3yZ3D/hMXgn7q5ubE9pW4jV1vr0Js3MY26iRyX2t+E/nxNYQ8TrCu9bOI84atk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RA2og+xL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fgso37WS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RA2og+xL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fgso37WS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6iub918896
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=; b=RA2og+xLRgSRyPVg
	zTPD3Q7Alsas/rV3Nj5mzIdr2zbuQgV3YurxrTFeDcd29OkdcEv3n2oj3sEouLUP
	havGSfU9kriXvbnf511wEtb47d+tcnPAuhnfZ1saLk+5vohjdQswuQ5sFban+XF4
	HnkWp6MImJkZovm+2M2nFY+CLoN7LQJc2Q/TGmEH6go0f4uWhLktCwJo07BLhq7n
	O8/L8p+wtF1TkSrY4U6gq/iSX336zuf++Z3uR0X6eX+exXadgXqF+ihUxBlucJyl
	SdFRBGZpQ5JM2COOKZp7hcLxEG65Qb7BF4KeVpagHNzUfo3JM+AdNoVC9lFbrZTr
	y/Qs1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n24cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 13:51:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517e054fe07so18382401cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691510; x=1784296310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=Fgso37WSMTWxXbFMxeV1dyS2jzmKxuijZdbj02QmzLTPO8Z2vbvVxouWm0raY3j32e
         1rBPMsjOuR9a+4WcqbcpRrUqiCia31hPXSmJfjnkUIwMnF9/aAsgnRWPMG6bDpUKaXjp
         Ti/HF+rPo3BE/CypdpOO99Ficzm+2VXolxOJl8mmpAKfMTNMvOClOrcWEu/+zuh5xCYf
         ZK31onvMtemKY5yJpWT2iCQh+ZC+tBPKPTlujSHvTSQIb++8PWvK1kxmofEUjsywsHZp
         udikp6Z0v4Fdn/hJYSWXluu7PYd3ulEOOi1Rk4DrRbZP3L1YZ2aEe2yjcqRd5p5FHwF3
         M9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691510; x=1784296310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=EkkVR2UZas8mChrNXbAiILsbSQFYPzSdi26OOQ+yjylJWrz4ZCyDCgG4YzEIbP4eMI
         AaBJgKC7AU5Sfw3LI5w6YXxFcBy5QvoTxcBcwdT6WbgGER+ppMXMa4IumGKhg20Qwd9V
         giAfeBV8zPBvqOmJF5QtWvTfXTBDdX//udtaDhwVYOStt9V1f+/4e+4Xd7gUyo3nD4eQ
         kkOMO/DAoHqmgaDs6/+v1sQ1y8dKhhYfcSdVp3jTiCzmGDkNualeOKEjBE+CYX+2qZjq
         1aIc3UFxM2Sz4Y5tz6JhdJUXsFIYrhQQPmtw0cNn7jCzSUwZN3iBv4oslJKwPobTWpy0
         lTZw==
X-Forwarded-Encrypted: i=1; AHgh+Rqsnl3mwbHCsUt3DXW//X+uaItpTK5GefrnEydqmRj45lFjHZk/jkL5nQgXHHTb5PGiCazMhum1ggoQ2hg1uDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZ6yPb4ZLMZM6a4iJYjrcoj6OlX6SY88v07tbRhXpVNUBzyGh
	Nl/eZHXJZn8qRKFndhp3RhriAcU1xv0BVvaOtmczf7pC1nHjXC3GFfDe7n290VRu9s0LJRh6gDx
	/lyH6xUNsgvHROiLPlxP0XlUERdg1HTZ81R1Yn6SUbtB+5z4l1b5Dr0BuvFIwEqtLBeqnCb4=
X-Gm-Gg: AfdE7cm6HREgMA0BYx2zIQ+tFchd9hIn6NiTaZTzfYJY8r1nBq2K4i8OAEbYf4pesyM
	GDKNTRZfCFqBYx+DuFD8VSlMhDyxFrUaOpH6CO8wfKOxPdl4QvccPEFOmwPBSBd9sRfE81esaDf
	mwmV6aaJ4heOCvHo0yQqtWp8SdraLrzRILVwEPqxsdoECZzYOBaXktIIUlc3AdK1dAAgkA63sWc
	viguszTQwdXFrVfYaWfn5fSmuj8nmOKhvS9htz9AcFHIUxceFWGTan8UN2WVHr3Wenyv+yT6Rli
	TqK5AvF9AMObjymkye+oOVXi/bSWAOMPyvWKw9IRVAHUOImkIMmKavVEaB8GohzpcWLXykiv1Oe
	R3OPrvKDdGJDwgWua0olf0akL4R69nmqYAZ+bbaRs
X-Received: by 2002:a05:622a:a19:b0:51c:f4f:b3ab with SMTP id d75a77b69052e-51c8b3e1115mr124547861cf.20.1783691510131;
        Fri, 10 Jul 2026 06:51:50 -0700 (PDT)
X-Received: by 2002:a05:622a:a19:b0:51c:f4f:b3ab with SMTP id d75a77b69052e-51c8b3e1115mr124547291cf.20.1783691509536;
        Fri, 10 Jul 2026 06:51:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:20 +0200
Subject: [PATCH v3 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-1-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5500;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjqhaf3r3hunJnsOhObP370tJrRM3UlfcrzO
 P5o8t6gylCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD46gAKCRAFnS7L/zaE
 w7fOD/4zozcQZeKb5hC0d6O0OxIfxtJ1oXFphO9JfYcsJbDGFRE0oCxSme5Qa/FLFYYE9FcSG/l
 +2XQCAVy5v61CbQtuQVy7SWU7NGCq663qlkzr7/hdfeXYtHHzeHloeJDDOxyGzPvskuK88DbERA
 es/mOWcirQvQ1YDxXnW4pAHQUOntQQTAipMT/JwPciLxGv36sUD0LpbMiuUtqt+VYU+xM5v+ClC
 fmM0DfLfrR2E0t9QxcOZJfxhId5qBzx95NGPtRl55q+fz0G4k39lUIYCydniKX0uHenrkodJ4WL
 XpQqgve2pFj6b5ObEVRzrjDSOFh4pT84gBSpsF0aKNhi6GDbySKP2bsyyEIvG9tyn1kTwcEwj0J
 07VlT6lDMRHI5eq4/iZNrpFnu2u/noxJ01uBejo2gCOkKzxuimAnJffc0teOyc6BmisVbRHAB3E
 lXBYbbe7DQV2dqhkxTKTuxiTfpv5wx/woD87xwQ/diGdK3MdgIL+oy1jKMkann/RNJ8RGsKS7JU
 tVoFdlvmj5hMokwh2tmMR3qbD8SdtpA3p3COpSQohIIO72BtRJGOnTiH316WyABtzgm3tpRJz2n
 W9l2uKvhpN1KRBfnCCjMLqxPePw4ZXYcYHTwyq7uY8jysrfmVxgpM0CCmrHK3Kq+GgHJtJkIT/X
 rqWMXCoew6GHLeA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7zGvVIwjJ/4L
 s5uskm+oIIEOgxPu+qeSRQidVCsTHF0UTEJ1Am3y+dp3N/jmv1P5YzkU+AZ3M3Y/hLaTL0gn26+
 i6P/rgYwtUpqbef4jZ3e9vDv8lW4zfY=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50f8f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VSMHv2xdrKP6GTymTuoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dKIw0RJcsX5dJZn_FrjcVRH1TK9xR6vU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX6xEV3Y4S19Su
 rwzvTk2xqPwM6jHIrqHu5q4T5YDwkffmxV7RQMAHqs9MI7M29RJSCveru+vwBMO1w0C6r0wDBfe
 q66taCXC5k1zYbshUsD84e/E2gi6T1mOFslidB2QRN6EmPcyjJ98qCOr2kIUDBb2MqpaT/a4PGI
 OJcDJ9sh97N3ari321m2QO84pluaz42b0qsanmSog0QnyPZao4k0Wrtf75P+Ffos4iY9ZZuebVG
 Wf0ULn7wRk+QrO1/mhXn4ZsSabtE2NuTr6ABiZ8vcsK5OvHKgEbwIyEZqEap1flMVBYw9ZvCFJ8
 ZgesC+nnxnRWZJ20jikNj9Q/COFaNAwXOx41/5cmccPSXPzDRkgVzSVd8jugP7/nkDRy6D+Penk
 9ydaks0uYJFJkHkZDejYBkw0Ul0dQldd9hu03rgmc+VAfDbmRHG8mC1XE0TswNkwL4TlOm5s4i6
 BgwCOOTaMCDOs7dVP2w==
X-Proofpoint-GUID: dKIw0RJcsX5dJZn_FrjcVRH1TK9xR6vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  26 +++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..239bc71eb5072ccead0beb51fc0882bab69c6877
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers for firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct property_entry;
+struct software_node;
+
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent);
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -11,6 +11,7 @@ kunit-objs +=				test.o \
 					attributes.o \
 					device.o \
 					platform.o \
+					fwnode.o \
 					bug.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..332490f07fae78e0fbf2930f9c80da0cc7dce028
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
+			    fwnode_remove_software_node,
+			    struct fwnode_handle *);
+
+/**
+ * kunit_fwnode_create_software_node() - Create a kunit-managed software node
+ * @test: Test context
+ * @properties: Properties to use to create the new software node
+ * @parent: Parent of this software node
+ *
+ * Create a test-managed software node and return its firmware node handle.
+ * The software node is removed after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the newly created software node or IS_ERR() on
+ * failure.
+ */
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(properties, parent);
+	if (IS_ERR(fwnode))
+		return fwnode;
+
+	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
+					fwnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *);
+
+/**
+ * kunit_software_node_register() - Register a kunit-managed software node
+ * @test: Test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the registered software node or IS_ERR() on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node *const *);
+
+/**
+ * kunit_software_node_register_node_group() - Register a kunit-managed software node group
+ * @test: Test context
+ * @nodes: Software node group to register
+ *
+ * Register a test-managed software node group. The nodes are unregistered
+ * after the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes)
+{
+	int ret;
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
+					 (void *)nodes);
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);

-- 
2.47.3

