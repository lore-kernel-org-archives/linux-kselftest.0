Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C413ACA7C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535184; cv=none; b=fu8mR4/uTm+7JqoWOAF2MHCDUDpo18hWttpguljJGJxXB3v3adgilgJj6dPZygyv9bOqDCh4IKFnxUhCYSut3iev7OBQulBe1t2LdCIQQ1DidhnUnzF7JSme/tWi/IJnxo39QP/Q6/oCct4SITtzZB2CnGQtrSWHbEFE8zwweSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535184; c=relaxed/simple;
	bh=xqT6kzop9Tu9IRegDxu2r1ixLhIQNCTwTag8YUl9Jig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbHDKNfNYWT76b1IjTlD6/n5qDlWjJC+aVkW39r/X6Q72UFJiUxvfr+OSCfkZZISXmYIIFpKzfjwN3ICoC+nD/l5uNjEZd92lZIFtpRao0GtLxjCkETP1sdqty2KkX2sozsgvghtfHsxag3mHM42HvV0wEu4OiYZB/hAWsgbGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq2pLFfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icj9VEKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq2pLFfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icj9VEKG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6ek0c3884966
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=; b=hq2pLFfiY3h9ocWE
	kbJpQythjLQBTaCZjB6NFymebS3tclg5Oj5K43VnF1Dy5MjJ/J5Aylf6IqfVGFgx
	6TjPv6IEMZNCJN4yX/J6SLFL8sMOr5nYz3ijiJMfad7F5qARhAYGZjvA0DCm8ndR
	LasCvFcHSs2ykGM4Ng46MnqLfJqMXN3BpyLP8/765JF+TiZh1eKH2OwaNPCICRWj
	4lJekBZdGEj4BGTZySRi2t9RVRm2kxU4skkK12TnjGZ2fc7Fp8s9okC5QfYtDiZ9
	fiSI1qBVrq88jnszpntyfpyt4HZ5WUqH/4iaA9Fw0a6ffMWY1tHh5H0EyHii5VTa
	ewMG+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmahksc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d654ade33aso367328585a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535181; x=1778139981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=;
        b=icj9VEKG2DfTSIfbMFyYVNu9quX73Hy8Wek9QdpGbJZ66p/JJMDz66gzG7ol+/M2wf
         ZNvHGd0NwNrAItve3jSlO4z8/mYRFJu8RYjtaJMkjN8ZNSNVmzzcEAyk0sfCkzWn2fSv
         tTLcXtdulZt/mn1zRsu5MbuvUPfh9BkwjktcADHZKH2PGF6dQiA8g2hjRtO4LtD9e7Ft
         hbwaxydYeVV1ro/HrJPJxfwbC91kUAwNIWYHzCbRIkt3jwV8Q/98AR/rVIntnGhtCHJZ
         MXPJCqvon4grv4DgObKnXXMLHbv8Hh9tH+Y/O8l9RLjil0HvWzFDgMdTueBp5NHrC6ml
         PLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535181; x=1778139981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=;
        b=Biwo7ET52/UcqaQTteEou/TbLtIsqj3h7i4UzDVBikg4EW9g7wsF6hiv4u5CXnjKyk
         rBEsvJUzwdiUgEQu3n2l4EMpgOvWwbSzLAkHGfXgqaFpAzrCrd4Bqn70VukkWOtgAwxd
         DMwJthD7WngnY0PbsXNlvO0b55WJBrSnhYRQr6jP6ZfQlYaZFCmWj7qH6VXC1mL73toK
         gnMZj0AqMxl7NWLv4w1MHoCMPBj+Jgz9HhtltzcPUBBw351Ucus0b2rlzD4lv3R1kKAT
         +oVeVHy5ELLzGOrYgaZHWze7OvBk/S98rHEATxxbClw73my/1JU1lGK6XwRhrL+FAoKA
         P1wA==
X-Forwarded-Encrypted: i=1; AFNElJ8/6WUzCtEWY0Ti5bjhXDwZDiSxEWVCIlwYSYLGkug0RTR5UbL723Ow015mCaFGiP/4oDd1+09nir+tqOhI2tY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygmwrawBFC3W64uwDzRZXmKrHrbxzypjFt2ymXdtcjmBapU9hL
	64XRjZNv+zU5wmgYLm1OmdQytN8aIs5IBaBjixNSPWegKiOk8/Zi3KTS6uGE5a6w2SoNiNz38Lo
	rQoNgOHH9dFJSpiVT+h8bG+Vy8kDytaVhP+ZVoHbIJmrSEPMb4II6KcaZ+Puvs+jw49Eo/OXq16
	DiD8s=
X-Gm-Gg: AeBDiesnrZ/5HHWvbiDy7SJW9gzO8f2RlmFQVW/HpLDkT0vY5I5kijLQkSCSyVDEns5
	kzCZwFBmyL3jh4vzBF1hK/oYXboyWL8WVL4B3A1J+k2kGt4nYTcW4g1QH7ZlkqTi/y0ukirXhiQ
	RbGGM7HdwgQ9bd+MSnggXVJbB0dbUgZRlSHt3qIDQiSRCg3rr5P+blQKvWR9FppEFkEhBCMPx53
	1+qX8UGuWr81eto8rhocCbR7nwULYbEvPNMiM4+PdzJ8L8g0BnHWqmo/YpomJ49BwLF7bVF6mTJ
	SODTGsdKRjjiKYHmqDFlAtbImII3fOkYCh/aONr/zVhsq+dM+bUoq+M6icEzEtgLYfosuz13ERv
	Yg74Jx+fMz+mnGWbsDzoLsG6qrV5IWXCR05jfJ1KtfxDFjMAlSkjd/YucS68x
X-Received: by 2002:a05:622a:9009:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5102d09ec31mr12893441cf.9.1777535181110;
        Thu, 30 Apr 2026 00:46:21 -0700 (PDT)
X-Received: by 2002:a05:622a:9009:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5102d09ec31mr12893291cf.9.1777535180700;
        Thu, 30 Apr 2026 00:46:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:46:04 +0200
Subject: [PATCH v4 1/3] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xqT6kzop9Tu9IRegDxu2r1ixLhIQNCTwTag8YUl9Jig=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGnzCMWh/lxrSWg36NMX+/CKGA8yIxzcbCw9gWBIJOnLLP2Wk
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJp8wjFAAoJEAWdLsv/NoTD1g8P/3zh
 ii7c5Pw1temLKFdC1ULb6TiSHLSQJ1Q33ZFxLJo8hK7Q1GoPRtKoaQLwLCKaYIPy35AZjWTsOOh
 HjjsxqIwUkYec0EzgZOu8QXEm+yA0cH2ttSRje3CPeF4DczxvYJmYpP0+zXAScWBaUUW2fQmmje
 cpVOQzw3C/vmqTZzYETS+8SWg8dddZixpUy4MJhSnH2dzg+W8vXuOxhzZGMUmW21CxuF+tFNMlb
 057+jnh+YlSv8cfn2QMxnlC7RPhumH6FzpikjjDukOwHwTfWqRbqvftP918ZYQC2B2wB6ty1HU/
 554t0d6rMztG0vQ0JYRkPd26dtJKxCkRE/Su6QPuxzzd6zEATWcNX9RJlYRtl4umLmOKDN+c4U+
 4yAmKfCkn5JiQ4uRCIFRYoyNpzvuUiT9l/Lu4Ssk5BgEWd5krR9DLmHTdNIWAzTt0i+IadBCO9C
 MAxPKY0TWWfcbkIxaDxaFQwhgKSLaoo5zXhBXVZ9M5DxNVVHotb2S97nFqlDLJvjdvFawYVgTql
 IDj/iOXa/lhTvKkE27oSlUCPZdITe1z7WfWnlspuSY6E/AJxilpcq/uNrkDx2iIL9PyJ8TfnLuw
 lpGE9uc4j/1C+YOydOrWvyxuB0BXLdLIOC88YkkMpbVYhDIbC+Uzq6cdyuSOxwyGPJi4kOmXjfo
 Hw7wu
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 4FuxK8tEhShnUDUjkq-PodDoJO5AVCwe
X-Proofpoint-GUID: 4FuxK8tEhShnUDUjkq-PodDoJO5AVCwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfX5/+PFF7ahRxD
 1TjvRBbZqkxbTF/tgW/gBAMpgZuA0srdhZLCxZ7cq4HQ6LRg/aRffxjvs7tGngLaqRiphqvd+0j
 bP+1q5eTlD+Nc6MTYdUHt9PG65eS5nGFioPcE01j1z2iU5Y4MWKonrS9S+0eVUFitPF9BxbYng8
 /j3XAb2F9h/My2gZH8ngfnBPs9nEdJX7uMvzya2gc1k/HBMPOPk/HdwCidQQ1MEMR8Rojm6ZPpL
 Vfw73p+pSF0noWygo7uuFqNFMKUmbZphNoiqF2EhAOQAItLH+2tZbwdQ3R05p4YMOdyJDn8sI7q
 Xknx4EiFap2WSLEXnt8z+9TFvvrLqkeU1W1ct9POIzAI3mQXBTpAqiBf3ojykQM509Eml4KihBF
 NbKrdjz3OHzuNN3UOsaBoB/WW/LbJBSyj4JQcUAiBWuadhdpBMIuuoQGIjimvnvxojQnZvLhfe6
 XOQBihVK4F3cuWmJumw==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f308ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PTX60mhBgyOAItwlv74A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300075

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node as
well as disallow using two software nodes for platform devices as
device_add_software_node() does not handle this case correctly (in fact
a comment inside it states that only one software node per device is
allowed but it will not bail out if two are used so we need to handle it
here).

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..22834be0a3aeabf538f57ec6815ab3cd6851c16b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -848,7 +849,13 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if ((pdevinfo->swnode && pdevinfo->properties) ||
+	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
+	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
@@ -866,6 +873,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode))
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;

-- 
2.47.3

