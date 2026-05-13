Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252147AF5F
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684729; cv=none; b=hzwfqbUB5BCVEobrridzi6A1ael0RhJOyLkQzBirbZ8ZGemaASPm5Doisv03l0ZFLfUX1I8xXmSiNEH37jqpZ4Lb7RT+SUEEDzyOJ11muRKIk3kU9cCnUWw+ZrSKFRDLsP7ydnisLswGXw4iwr48isP0KfpYA26YhaJKbthvoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684729; c=relaxed/simple;
	bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXSl94k5HpcXHKug5SGacaMFYV5AY609LK0x2qacHlXipLm/vpY0KIxDmW2RtStTXOb3wmBRC77r/OPvekXVqPOq7Rx7SKEOrgdOOwzhDvIUWg5dqXkic/THJWVtGPSrAbQSD7hlY6iOmU3Ch97QL4F+tJ4kB+dvyZwBmL2fGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjREzhdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0TOtDXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjREzhdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0TOtDXx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8woqt4159625
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=; b=jjREzhdYcb6VMRDW
	G+ocrXt1WcQle1bA+brk7Wxm8ClbOhn7+U3wGMUH+OVNAWgEK0s9k7/u23yLWp/T
	RVym+iK3PAoAVY78FwDOnqD7wWCFFGjHeUPdjAV31HymQdLGvgV91zbeR3NQfuvR
	gvTe7EdwlaQ64Wsg+NTGYeCRfVD2x9TbMXeP6z3neJDaPulHTS03/P6Z/VUKCMxy
	R6Ax7yoRrxQMEZAHP3L4dMRoZG+NtCir+YYAxH/VyC1TqNePT8M01ohXuN7ZUzu+
	hxjjVC4doAGWcN//vEKlSY0Hi8A9QpX+j6bK3ON3+5/WdTFC/J/+iIzKg91Se2vR
	9eaM9g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91sekw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:26 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-439a7f1b8abso3975000fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684726; x=1779289526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=i0TOtDXxUTDVq8GPpbd1Ge4eqaYgt/Uy7XU5klfuoxOoz0BNWfkmJ6BIrT7/ULHVBm
         oQFzYpOTDY4QwE6jHL5w7UvvuURc9DDoMnGc7WgQvU6qM6QbftdObGbQHCl2BmzuEmTQ
         fW1iJZrEqf/VLil5yqs9/8LU3vu9TRdJaH+IHJ5P64TLSbyWpa+icimeRU1QFYwVw6rY
         pEF5hswsIXDzCgtXpR04ARE8wEDwQ5bx/GC7t3CZPuyuB78Qdkxjx5sN4RsD7Stgm0Z9
         xQVFlDZtt1bsrNne7taR/va8vTvXNrbLbOPb8A4lDWvZdkDOTb/pW8KVxREPmnP8jZ7C
         7Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684726; x=1779289526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=lPqhmsRf+M4WpcJ4dz3Qqtj5jrxavrZW2mavtUmulwiYqtQnUx/Ksq1FKkMevt5dpv
         jorOFSi29y1o9ZiXQ8HG/rd8U/4JyRbJzCNUadSH0++MNG8oX6k/vOmJVdGTSLJ6J+o+
         Lgh4i4E7tFCtW+eR32SfvLSipTsVHkqk/2PBx3q3SnGIS24NOkn3o7ehzfxU4Ss40PH6
         b6nglKKRJIjP8A09TBLUOO7zuiVO9uazUqVSS9g9en1Lsa09Xxjrk9KxdSaKNv+hHkbz
         ycth9HAC3Ua5wn+ODwZciBudnSY6Bfh9gGApGcFNbc8on/mx34Yqi4a/lUZroNxldW6D
         1jQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PJYtHKAo5YAK8lqdaET1CDVMq3T4aJLfCcYD/8Myg69cXdGfZaUU28+EdTpbYzv3agcjBqm2UHT5BFYP6TUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/HC752hzwvFpkl59+5qIv7b3UoEeXUKhNzQ6t4qNEyVcZfd8
	N822FKx0LoetBpkJMQiBHHj3FWJSmlCa3Fx2FwH/CbF56IUOpT+GgWb2R+cKTb9xTAtOWgOI68+
	PCxJ7BXdFHhU1h2oh+nYjB25LtPpNoj4YK/aogHaYNINF4dbIrko60HWnkUBL31oW5/873+s=
X-Gm-Gg: Acq92OGdNIYFhWbzEb1hATI0c7TfAQYvEYYknSrb8Fv27y9m1JOzFul8Y7zr4Z7jHT7
	zRbwYNtXsDhX8TdFp56ICjwIaQrr6pQ3B15sUZt9lRBZJOK4/XAYkpAIidRyv8PT/8PYPoqaDsj
	IE0IYmRNn2EDa+Qj9CmWGnJNibr+zVqaej+lIy6gbI2gP4xiShVJaw+vSk2Qm0qzk8OMeiilOQ5
	TKNeAlMVHS5qBg766q1qlezk2Hn+hudre/8jr2H2NE27/L+aHTRT+ZyJ1B3XaBjL4pVuPsAKJqg
	BmvkauQAcJDyog1cJkN+dK3CoMXe9/ojykTDhvcPuWiS1VP/JeAN5/FFfVwzLQ+tpEpSQtETlbp
	0pO3Cl2KsfI6mzQjCx0XRGE+CJ7CcnpiglbZ8hpEfoiWJR+Svvw==
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446740eaf.38.1778684725999;
        Wed, 13 May 2026 08:05:25 -0700 (PDT)
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446719eaf.38.1778684725508;
        Wed, 13 May 2026 08:05:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:50 +0200
Subject: [PATCH v6 3/6] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-3-f9c58939df27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMmq9JW0v7kRFlCKa3cQX1e7fyvU+j31gEFo
 GPWtnshMziJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJgAKCRAFnS7L/zaE
 w0kcD/j2A0ewkNS2bCevVPmTc7c9OKJ+dLjh+eBcqW93BRugn0nF19BZeEPkdpJ4d8JfXxJOl2R
 0yRABxbWvBbxIAvu5Ciq0Q/lk32XMa6eIgh9i+LRRwbdDc7j4i3L8TQVUz1e/OtOJI3UuAEx8Hf
 5IW8XAZDv2Unf9peA+4En+gRC9RdwpQ1GRG49SGchp6jLdr64eWzMpf1kz8WQQbuTfZGPcq2ZRT
 9WmLXhdT8d7rwlOPBCkaQADhzAcNNOJDAdv+PPXi6P7nH0NObPzaYPBiSbKG/c1fo3OZT6hTDUI
 f2TMra/TKercmXMDbU96CPWQJunrpCUNvQsvD0y9yWpDo3F5S4yE2vjeYQBd3EdBOCcHtEHjX40
 TVsIMjUcQbKJAQdGI0Q8UP5BQoCYOGn1rUFBqRQROZ2D4UOyLzAiPQHqN6sKbAvHrT8xSxUOrRi
 IvDG2wJbh0FzEW4RtFzrEqwBiOotHHKQ03U8da25RuETsDGT/vEMmw1/Ua4JuNVPtC7DIsJvVWB
 zCtYAHUcHDnJ3CP7KR/wIJFcozrxpsLv8fX745KgB25rR8Zlg5i19BqJhRlEOLoIJg6pbkzXepT
 WLDnxY0wJWesAgedGNBSuY2MBYkfToT7EPADVSY9o30rdCXsBTr4c5QeYu4cGDyVAbq92CJVCDU
 9ZFoM9pKhvtc4
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: lngwkCjSDvkRlFeGNq4zDGoNzExIpu7j
X-Proofpoint-GUID: lngwkCjSDvkRlFeGNq4zDGoNzExIpu7j
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a049336 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX0VpVJeHvHDB5
 LQ3ShOauPv51NgXmbj0bcpCx7by3AgVBrR4wG0McXVdU+E2QeWMxv794bWk3kZ35oQ1QtJmjuzZ
 I+/AvqVLKSmRTjwUV4n/YTxTlHRc8hdC1RX6/v2ZJ3ZyLBUde32aCRNjQie7YAabsIjnVxYGPht
 iE0GWJ9sVul4eyxNtl4Hj5wENBJrs0Sk96rTUTyi3BcXGlAGurZsDyQIiA/4yXDbQgFN0V6AX6T
 IJ7Bg9ARkqLwqfClc+RKV7ZRrlIkulISnsupzQ5+sQ5X3f20jacBMy57ByMV831AnrhplZm0hyC
 q6ZGXiyBVI1KneeuUTXhiQYEHqBp2wvQqxYK0A9rQQw+k4AvLczucyy45adhjsHwodB8TvGTASy
 /P3u5B5qG/yRDoMgcvR4UmAmXB0EWgGB7sfs778+3Bl25FMHVU7xAStw5yTN9UcwYhDa29m52hL
 H4xVXR5qB8befHWg0ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130155

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_i2c.h |  1 -
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..5b0026bdb1c609bac12cfa1453c685846f3b731b 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int ret;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
@@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_create_managed_software_node(&pdev->dev,
+						  xe_i2c_adapter_properties,
+						  NULL);
+	if (ret)
+		goto err_pdev_put;
 
 	if (i2c->adapter_irq) {
 		struct resource res;
@@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
-	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
 	ret = platform_device_add(pdev);
@@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }
@@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 {
 	platform_device_unregister(i2c->pdev);
-	fwnode_remove_software_node(i2c->adapter_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
 };
 
 struct xe_i2c {
-	struct fwnode_handle *adapter_node;
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];

-- 
2.47.3

