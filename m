Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A431F980
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368045; cv=none; b=FXwD21hVj6QGBlJCJBhSYdemyYmD8nkHhYV9yncg1iysBRIpL8ema82ONEskhWsUvAcyKLoy8IORnphZG15fJDsp78l+iupWiXsULF5154ei8wQ/jP0nQ3Abn/rGJGTucoymJCPiP7ck5WrwdicViLkYslL0+GNW/X5vqeoZEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368045; c=relaxed/simple;
	bh=3gvGnqdkyrPYFJWQtIodxLXGzHVuRLvYfsCfWBiWCaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9oRJ+rGqxGxwHKlRUpYXBTWnw9O9ri1ROD1i8Fwvgfo0hDepjoeRkCd6K7NTMyxuRJfsggJ5RKDUSb+RpEvoKgelrCstSbrYc6ernhMbIUFSaWetC2GRwaiLkD0e2LVg4fNu1RsJT+LVvBAGcaxueVg1BfDC0bTa64kkqAZjhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJkTHlCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EY95eNvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJkTHlCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EY95eNvt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6g4ED241204
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKCqFUuqOsU3jZLfZjBiONDMRhc7FGLOcrEvMLzfoUw=; b=WJkTHlCyUsdwl3qg
	9p7BgC5b2e8QVyd+ImBn/O+zZ83QtVrxoWub5CkXkyYuWwLfGSnYu8v/B8x1foLb
	9gtJUzCCDY5PO5WdinDO5y3ZUknZmRkJdjx+o8rLmoA0WFmTchrR2CBcw69j1ty0
	/BmG5yf4vRrRJ5q393BUvdCBVbK4/HANdGxcv19eD6oK8DmkpcL15Rk0MUODvHca
	oGzgI97gkdcSyGYrzM7YzvArMwR8E7WyzNzan0pulbxFXQ6/pWHIye8yET5rdJ6X
	lvNSlr7r/80SNcCIU/tHno0lJXceug8XLptOOuXdzVmATHlNWZFvxQJg6jPF+5It
	sRgeiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946v0kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 09:20:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso297016341cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368042; x=1777972842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKCqFUuqOsU3jZLfZjBiONDMRhc7FGLOcrEvMLzfoUw=;
        b=EY95eNvtzvSFRSreFm8hj8q3AfoMGcdq4KqAtHiVD4SRK+LJqSJLuPcccMdXRqQQ6X
         XrJi+TK1R6cmEEoXg6bcU06bOuws7Cfg3aMmRxsObeLp6hMVq2hKmfLLiscLd0uwn3V4
         bxfRSj80CjyO639REpx/3HLBu99fcEM/wZJbe8IyY5G5k3q58srN8nP846A7yrXbiJm3
         kCBnt/cjm0rI7A7tTiAbovak8agjgrxGhlKhoelpFgft4A6O8hP9QGYHGE1mFq3aTRxH
         DlIamR+reC6xr079Du5FMCo2GOVQZnml1cU654qKRve0wPXzFRbZq695Bnte0KrwrecQ
         cbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368042; x=1777972842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DKCqFUuqOsU3jZLfZjBiONDMRhc7FGLOcrEvMLzfoUw=;
        b=be1keruk+gWvNx9PU93YdqCEYivNLqQ7+3ltk3N9iaij0PUoG/TFLHQWLbo6PEORUI
         AqqCKunQlTF+5HSLobtjC1w9QR4K6u3h6zD+qDtMjv2nqQPbWv6+sqS4DWHdxvrm3yuN
         3BMJIAzE2FzwtLJj0TgH4FMITRgKB5b8SuNnXki+xs9tbPzMgAvyt6Ib9Rph+PyG0rO8
         i0zPDWIZXRPD3qIaQ7o3wJgPW8fAKqmBLJ8kyd6/vCDx4IJf3Y574UTa1+dm+/BtC6FV
         ltVg4HzZJW4gcRNXJYDk+vjh8Zjsl01tGyDLOLB8/VjFyL/Bqg0DfzeicoSlNG+/v4D9
         9/Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9xcoO/uw6FjY726Eu3mdvUeNiLkr2p/z5rHAgXf6wgPbhtAFXuRWywMHGsb/tEBn8uKh+PFXNDziT+qW3QJtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqytxU9SET2fSaox2WKLevNCveSFtWDkHXJbjjRsYy9zpr/ZG
	AwQF6Qvcid5gr936tHLzfq/ulfQtZpA2au5AvNhLKLHZGg5Mg5jjED+c6Zoj8tP5QVBjIpvaK3C
	ZrHIFA0yrvf/YJF+z8y/uWrlM6h8+/6hb4/lkLQWmoguNXFeNAJnaOAZ1DA9SaNrQHqdAj9w=
X-Gm-Gg: AeBDieseJIjm6Z9+LEIU7uPyOit2+b0TD2a72kPhIQhnCbQUQr813IaEK0pelf9po/v
	ErZAYGStEbvnKPa7vJd/dcGi0xPTIy8ksiJ4n4py5B4By4QPI/RwGhgNyllkDJF+gBhqzjLh9rm
	pz58qkflKDsZVxc4v/rhytEm2RERVTOn7mw4sH7wuyIKcS8p4gQdE6iAgBZHGDQ2J4hw9wOQNRL
	mNMVaxWa4JHRcflCN/V6XyQBoa0xvScY88B0QS5rqzVYXYhjY+NA6+NwNvjn2J2KlKCdDFStS4u
	oBlmL74kqfbH6k5Ifo+dafd9bTR3mxht8x6VoEGlGls6ukBf6Eors8j1As/IK8mnI24ren33Dow
	LST+Qhfkl+O6iOOSxV/7JM4Z9zj0rhUYqkCESwzDDF7RviM4wlHZ1S9OPDRpw
X-Received: by 2002:a05:622a:4d4f:b0:50e:6055:274e with SMTP id d75a77b69052e-5100e122739mr30268331cf.17.1777368041751;
        Tue, 28 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4f:b0:50e:6055:274e with SMTP id d75a77b69052e-5100e122739mr30268001cf.17.1777368041278;
        Tue, 28 Apr 2026 02:20:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:20:26 +0200
Subject: [PATCH v3 1/3] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-1-533bdc71b22e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3gvGnqdkyrPYFJWQtIodxLXGzHVuRLvYfsCfWBiWCaw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8HvhCeTqXXEgrBO7r+8Q4cbjW8SRuhLwvzY1l
 cnz+gQIMdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB74QAKCRAFnS7L/zaE
 w6+qEACZIJ2GbUNkpEfzF81gPgIaSiM7x9PEGYs5pbekYcWyA+g4CRbSwxee5rgiKpjdbuzfGLZ
 dJEvufmAB6MFnMZEQoxawN0SbkF/zMFgv7Rg5CohwYeHJmURYAHnk9jCMC1ta2jzx5yCFh2+hK9
 tZU0rrcfVcVSro+Wn4vbMSau993zTJePuwiU0rFx+4GkVtkrYJibVYHrUDS3U9hfKWqRJkdCLn6
 pmpwWx6Ve3I0AR0Wz8Qb8fR+Tf81qdvvlDL7TlUYr1SxVidcabm1Q+huAXWRfQ3K4Z3S+U54n+B
 LtpqwUoMiMsvFwbGpjtwAJlHaucE3w6kHh4Pa+IZhjcW8IApASj4K6LwWwZf6ZmCOXARwsyYyBn
 EOSBxhUDpW8mwevX5i+hTMMFCMwzkAkk/Z9NofiWJcFllS5+VYcGfE+izFKzFubkQxRyzZnoR4I
 ua3akd0JUykmT1xAlY9L9ezqRNOv0A1uQ7vmeDMbJa8Kr74CyvwLS/hpIX5jAGNj5DvPJJ/vGnb
 bia98BXVcmTaO+85Xn7NMW/2jYoA6FRGP1hIAeUG2Tr/ljJguvWZrj1EVO/YIedPOYxPnbrXIuQ
 /hgV64zgcqD4FnZCSWOnBiuGdN60Hla+ILXGCMW+oIm1veWbkGdFL0SGhaf89tqm69BUABY6Z81
 w9FCpOkXK0fkzjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f07bea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PTX60mhBgyOAItwlv74A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Q3ccOCYl_8makGwSU7RVJLEX2scguj8C
X-Proofpoint-ORIG-GUID: Q3ccOCYl_8makGwSU7RVJLEX2scguj8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfXxoKx05GnYXKo
 U7Q4pfF57VzaO3wkVWMH5dQoPH4XQyHSC6QDrqNBlHlf+hYnyulr/e0c0itTp4wfH4qp1wM1La+
 65yzakv4VGm3XUk/u9eXZRNmNz01qjxChWmxjSH3avka+chgUG2JJTVIjCPXeLWIaI25XdUgrkT
 BN1J7ZO2Z7ZcCF1APjJ9s865ktpc7YSATZbkx393VL302AeqAsJ9/sd8LNn6jbP5Tv0C2LLIeqb
 hwV77XtHVn5h4DnTlI4bsl2Vn6GnGStV9deoDB19sCFkLGVFpQiQ3EqeJzmrSCl75hIHIFYYiLL
 1/9CD3UJtpIR8RHxXuNwX7y0XDR9vSVX+SHtXs4wvP5Gg8rB/zLoEbqfwaxzZZ8TfIKkQPTcrr6
 WRc+z5mNAlVUJ2rCee+Fn67jtzuXIyzgBanSPoRB+u3WRFwJtmyvm4mzeERh2zjuJaBR63tdQ9Q
 KR+uEs8m/iRoHnC/9Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..a6268a72a99e864cbfc333cd99c0d5706b901ff3 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -848,7 +849,11 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if (pdevinfo->swnode && (pdevinfo->properties || is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
@@ -866,6 +871,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;

-- 
2.47.3

