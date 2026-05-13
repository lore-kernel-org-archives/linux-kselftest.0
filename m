Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC8147F2DE
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684732; cv=none; b=s9iwDDwmI24WRXu2MjFwr8KyqY4NV/tpdWdfoeKzjKP4qHQZIQiKI/7Zzf15l5GJn1rQOnWgU/YraoKZm7Vm1PV08uAHj0RYT4iK3NG+1TAd3sP11ClKNmF26MEQiwX+bzkMOid0+5kIkao9TrMhulUIUD9Wqu+zfgHCf2425Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684732; c=relaxed/simple;
	bh=wOSsRJhHsrWDaQxuukzG68TWgsF2FASykc4TUq0RZFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7bu1YDjYpngC1q9ckOSWllCA7OhNqoEfQXDPM7AnzN731GFDFJNF1HtVAHiO8tDCEq0QtQXXrCjNhUu/pldD/wcRdXmKQwHyKEkCRgELyJfVl1AjuYVa+BrIyOf7HpgIaPZJSGokwkjw5upEDU7pbVUH45XreeJYHAOXkQfD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpVZlKkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7FHV1Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpVZlKkP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7FHV1Yz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF3pEJ3474757
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYR8RcKCxI64ZndZ9Gltf2uR0RvOxYUzn4kE4pE8DJM=; b=JpVZlKkPnU+S+dFH
	bOoJdd/QMOrOb47PDDMq9YSOrqy//E9p2nF3flXO1pb02Q0NKJ6L3VCOEm02P4+0
	Z/NqwEKg0Tlz3wxHM4HYCQKWhUKGHDuXAd7IoSRJ2bawwCSiHQ3aFGEZsKNBRPA0
	oue6S41fMgJk7mqnEp9sZXz45vOlWOGHmv4R6Pit9gtPi75p6wTZOxSNZJSTuENS
	qre1imhcYG/SQs2g11XZmjuIGsyTuWQUaaoSEVVTaH23gxOUMaUfEpHiv5n9ZDuk
	jBBvfCYaIHO9WlGTuBepESfoJLiPL0GicoW4KYXGvKZ8nOW29/z+NHIWPcTujreF
	35ipXA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419f90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:05:30 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69677d248a4so10442003eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684729; x=1779289529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYR8RcKCxI64ZndZ9Gltf2uR0RvOxYUzn4kE4pE8DJM=;
        b=P7FHV1YzAJbFdvQ+NNSdME8yvODWtiQ82zqzTXYorpI8PwiqjYscyOcZKJiDRFUtNC
         cnRT7upUsgeAYp/on1is4+PiLOJ2Kvb6IHKRATQJSvJpAvAlhJKuZNJApKLWDF6GWur1
         u39i4H0W2u2vJEstbVLK4ew+k39RVL/2oTMR9nWdzTNuHYwNix1XnCQNqLNTwRL1TfXx
         CuR7+NYNt7sHwcmPLAFyFSqtMvVqvp1gAWrbmUJQoV3IwQXhbI/THiWmittC3hALQ+Rb
         ZCK0xnYGXOsfGMBItsubqcAdWitAvjGuOH5QvVxvfak/qiXvvw6RyPxY0ti98Niojo68
         OZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684729; x=1779289529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYR8RcKCxI64ZndZ9Gltf2uR0RvOxYUzn4kE4pE8DJM=;
        b=ZUmCKct4LbU10wX0A4rW+iZyrjUYK3v9cxBJCUS0YFJT1WRGrko/vBNH1dOhPLpv4M
         EsoPzr6fIqERyWmwRh6lKVKw8EbnzuEtdFtZYlOK9NbVYqOtC2JopjHI4jYiz2u4xm/W
         qb28DbTTYfsigyUZeEpqM5Ety+WCU3ZGjigfd0CTeHiDTzyg/JOXpR0Whx0XMxRr42SB
         2Ejv9TcnUNVFJka6zOAGCrCOOF1UB8XJISc0sDt6c+USYj1BBLMCYE1pNtmrUPijotOg
         hsFUc0vIGR7IRh46hOMHVF4oq7PJKUElw2ixMMhQWmvfEmQhsQYBMQfN5g2J/nGagAFE
         +0zg==
X-Forwarded-Encrypted: i=1; AFNElJ8PVbXGRVHcIVvPUnMUthQoVJkzF6ewzFwJS0J45Z4+DqxJO4b6aKbLU40UilvOC/9HZZY4zIPl3Obk1BPlD6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz67IVCYSDxS8Rx5zfcJe+wbPtFE4w3TTPFqfqVvIFrHzx+JdLX
	Y9DSwTdtpVEH4V5NETaZXHq0p/fWWLPkX+qPefuXKCtxqsZTtMkUpNXYRooVUVCpbh/MhAnTJBc
	zSSr/PM9Qxegr4Hro3vq5+Tvjw6ja4xRuKW2kIU5Y+4xVj5I8J6GSbrFIgTR1AIDESRwE9EA=
X-Gm-Gg: Acq92OFobEMWzZD6//l3Q4QFyBeR3FWjigSmAo80/QRKr5CNfO3GGs7Y8h9uiNRboer
	HW1Fa6p3cDZZsVRMWsktlkTnxl159kZ8MrfXmKnDVDci+s1ltGG4oJezl+faa6PZhLwr51If7PO
	3RUh4xDuR7gMNsaXKOMDnK6U2ZfgUGhaQtyN8AxiII2NZZCcJiIJPNQdPY7NMBfQ1S/50Q23Mb0
	6tNlgPDYlubmwckQFv+crR0admd9AzM+SraavCL+EAWp0dlydCz33w8ekjqQq/pT117btVfQfv2
	/SOYIheJMMovEwe0CTNYpUHUsxZaDwIiwZRo749XhWdl87cTISpjUAPnC1VjBtoYT5N81gdudRt
	9ToOFQJN/0eyjPbYGJDxIvXjpdA0HZQxV3me0dTJxzdzrCsX6cQ==
X-Received: by 2002:a4a:ec4a:0:b0:67e:3ae6:9031 with SMTP id 006d021491bc7-69b7abb78dfmr1668972eaf.59.1778684729472;
        Wed, 13 May 2026 08:05:29 -0700 (PDT)
X-Received: by 2002:a4a:ec4a:0:b0:67e:3ae6:9031 with SMTP id 006d021491bc7-69b7abb78dfmr1668908eaf.59.1778684728905;
        Wed, 13 May 2026 08:05:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:51 +0200
Subject: [PATCH v6 4/6] driver core: platform: unify release path
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-4-f9c58939df27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wOSsRJhHsrWDaQxuukzG68TWgsF2FASykc4TUq0RZFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMnejvUFHWQbuBgOnPq851u1BeQL054POyaE
 PiX1aFSZF+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJwAKCRAFnS7L/zaE
 w6SjEACH900P69OGo/t0IYyFtNg361mOg1F+/o4ing80rA1iSYnCBwJGeTzBybJ67UPhqiELDKO
 y+6v0W7ciSRV2GH7zFY1UnA0k1iOj7ZzX+wpcrsaqK9Svn2+LCq0TmzfxmFM+vmZBY2JFs8w1Gb
 Mbmz0rrF3p3WonLktt/h0sbAifNxzdRHdf6nN/Gj0sUdZX5F60oTWplpTb3aB+YnTHvAPivT2JW
 8ByJ+TMvwcTKOhSIbY16qR4eZyR+MPmz7jEbqsLJMnrzjaYaBtjY61gOO4cVTLfzVWPF9xdlOCi
 muheFSaISxM6ExIWfwU2G9vcm4Q/RniO/6H7lXWbLJ0RMXMzYLFX6k5oMb08VPXQKuHDUuKkdZ1
 S60kU69vsLj+gvMJ2o4EVXl8HySjRsUA2IM+DGdL1/aAsNwPWZ7D766NY0O6jFC4SjLE2jzI+01
 XSQnwA17xAKPppefhF8Lp3GujvhaC6VhL6QbyeXcPahJXQ0WJNMIaVhrgMQlXyYNs4EcKhZrpzm
 +MJmtFBqKRQTRNCQ1ipLO99TZR6iyymBynhNIhcOekuK7fpd0wRf9tPsVdx5i5nw5uxGBfWoY5x
 YP8MnUT6EU1+VsXeP+YBO1CvSntDHtyyUo2gtum+Ch/Q/SjZ5FlbDFLyVaiNx3BJig8nDhc0S9t
 JswpANlciNCBR6w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04933a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hkyMZWt8Xm0hL-3MNhcA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX1f1k/soZnot+
 4C67AAFAj2IUkLwIwvJsA/iyQvK+MTFmBMWTzn99kdlpJr59Tx33cI2RnykuAw7i+4pghQNMw5D
 YZ6cmrjxsoSJTC2e4MhkVab40vizV2u1AMvXvN1rR7Zgg0x68TgnYaJMldtMu6tDAEbqSdCk1jL
 xLLnJhxr+r6Vuzp3WOQihBrEl1IM32H18AMo+cSz4Xuzq/QqWoQCi7OImyEMtz8zHUKpcpLczUv
 LwYIseEcry0nCC6IwF1TnB15iU1tfdk38exszdWN01iepTO6qOVJVnqEluLfgqDqevhlEImpi7e
 a32m1YYaXowdWylN5VhGZw2piyfZfFbItvf3C63obgTMsN0Q2Y6R7Bbk0TrFcLKEEc+1SEkQcv3
 FCBPxo2B6nEs6G3HpLlc8emZUju1woEvEzWvaKntaq8Y3A4daPXh2rFinb5fb6RoN0sZ3bQrUsU
 S2eTILkWKJXiIoV1IZg==
X-Proofpoint-GUID: 7uRv2lXYsS0-FHhrivBiyuX5pGvHRd6I
X-Proofpoint-ORIG-GUID: 7uRv2lXYsS0-FHhrivBiyuX5pGvHRd6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

With no drivers that manually assign software nodes to platform devices
created with platform_device_alloc(), we can now unify the release path
and remove platform_device_release_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a19dd22deef2f3edf7cddcf824d02b4e09091852..22834be0a3aeabf538f57ec6815ab3cd6851c16b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -606,12 +607,6 @@ static void platform_device_release(struct device *dev)
 	kfree(pa);
 }
 
-static void platform_device_release_full(struct device *dev)
-{
-	device_remove_software_node(dev);
-	platform_device_release(dev);
-}
-
 /**
  * platform_device_alloc - create a platform device
  * @name: base name of the device we're adding
@@ -878,6 +873,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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
@@ -890,8 +895,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
 		if (ret)
 			goto err;
-
-		pdev->dev.release = platform_device_release_full;
 	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);

-- 
2.47.3

