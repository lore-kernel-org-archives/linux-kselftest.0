Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CC44DA53B
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587205; cv=none; b=eYgR//rLp5h2qavEZicz4OFTTu1kc6OM5SYPWaSxHjiIBVv57tRCG0XoVISMKEKWXbGJ67+6sWlkJhQgHAaLnwHRDPTxDnQc0wSxW5MPcFTUZ8mjM3QVivfRUpIsXJ26hh3uBFTvF7LamtL/lfGIfYtOJ6RKNSZR3SoR/ZV6RN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587205; c=relaxed/simple;
	bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpVwwqx0XKQ/HgzDhzwLNbMDjsd0NrsIobvAEF9KK0HhRAj/qAJrVB/Y9yUd0dqk2HRcIn3xmEKMGXTuBZzGDxhukme/Ej7U6EWSXNWjKAE3jc/bA5+0R1L71iBOwxwY70+w6U08Z3hGmBFE/KWGDloYh4PHAEcQaj02dUG2gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbpRXmmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1LdN4RD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbpRXmmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1LdN4RD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB4NUB2187255
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=; b=VbpRXmmuQqQ5qVCU
	RJJSwsi8YyzrKvLmTJW5z9ilS0EaWKFCIgIDSbAQLADWHSO+n2rJ6v1/vITsZijG
	j6inF/wJuYG5k+3ao3kOSb2gt55P7+GY4deEe4kzowQPVxgQ6ueZUdLHt9UOgZDY
	VZkt3kxDGbMA2GB5+TxAP64q0e6NghG8MrAXyLJW1HD8Ja9nzHWkqgu7KrBeYw40
	csCLSP+RZBJzaY9fyKeD8lAA8Vz78bHZtO/alvlEQgbIKF033vv4BZpe+O9ZuUxL
	aH37thCgBuoofqcZ5FT3uHpLfC12fgfDLynZRezXir5myO23d5wwqoESLlE4Dgqi
	PyUaXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0u3h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 12:00:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso77153871cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587202; x=1779192002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=P1LdN4RDdGltGtMLITxfx9dUmXtv6/ctvyYMXNG2UBZM/1/DIbmq2O0WksKIM24bC5
         PCu9oW2Hq3afe3HybzB4KQe6CPZZsLpUJZHg7PbOLnwCu/nocVpm2mBNTM/mry7pRJZ9
         GNIW2La17Lvl6Wn4G8NmSvz5CrrW+4CZKT8U62UOaCdNp1ew7JehmQU3q00WWQt6M5By
         VeCcsdHKpUFyE9OUa4PIg6xI+2SkcMq0DGj82c0oRItFtzdaZ4OJmt2nGmPry5qtH60o
         sMB7uSjcUjKb0jNqRUfavqZo4Ker1KVIkGx+4nVlpKEt8xXSO6g0Yp4Ku7xfQoJSiSKX
         TtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587202; x=1779192002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=dUjnt3yecIc8time5mcKjIPkM1NKXl5+W8Vg0tAs2xJ6jB4KA2tb5Bzc6xBmnURgyu
         Roos9jkQwwgLAMEJHdZ5002rWrgiWroyAefUrAfdrymJTZcR5kjD9/UwDWhV2MOpgPoo
         cySqHRhB9KHGYGj10tqSL41YEiwv9xYyx8I4dqmqEgxEManmT8U899O7Bi7IYnNozwvR
         laikRrXxIKzIETsG8AU1BiCWf7vs+O/1entgREjOckQkvxNNeiPZV6RRPTpy0rJZj/76
         UqjuQ2Hit60QJztvV62pY+DLdxRcOZTceYAVJXg9SJeS+7pG9ZwzjaHyLvrzDlyG5FWH
         MC0w==
X-Forwarded-Encrypted: i=1; AFNElJ/XsGdOqoR+Z3/oUGFa56c35DQRHbCyofBc7gkzAvL/sX0viveL7pbrjVL+sTPUlEY7CsuAevyDhAA0VWYBu5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VFzn+pwcpwQ78YFKZlvnTw6F5ndCemh5hj9ZoaGEZZVSEBht
	FaTWFcVFvAJKfyiQLcqEVRNCMaRbQbR/LzIyEBDdFcEf9tdktWyxfUp3PIT6x8ECo87sqQENNn2
	mEfxJgdeZwuVIU70aPH9pbw6mQ8035C6tj9K0FgkfekFpSHmmOCmyM5CR9+H0aEP8aoqgf0o=
X-Gm-Gg: Acq92OFG/IiA88jeRFpWrfU9meiQ2PqFHsQV8iarhameoCNnFLiLdJ79V3MIw4BCTBd
	4047wSw8NXcD/CCr2WLTQTjVZ+EQBeW7h/iQAOgNinXLUJhAJxlRzvxbFDNL6cRqC748zMouAsD
	0pNlWC1fAT5EZg9IKYtA2pFiX4nUq8FF0anUZ8JgINFGa7VcIinRqBsZtiEMsw/OOKNaO2atWK5
	/aQrIOwxO6ldmVKR3Qczzg87HHJ1To/CrVVKginQjWK5IEBiGp38fsdtOBo6h2ou8UsvObspECv
	G7nMl0QkhfEe/h2WYCQJu026u1GGac3nNiorbaWR5WdQAkPhmbKZ0nJFA/5p7uBt1omR4DIGsvz
	gWaRx6ZuUwUTXKGPPZ9aGdoT6PCtKkts8Ha+aQQqS/ug9grfQzf0=
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34391531cf.42.1778587202597;
        Tue, 12 May 2026 05:00:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34390521cf.42.1778587201887;
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:27 +0200
Subject: [PATCH v5 5/7] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-5-0035eff63812@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYygPHpAD/qocFmp4XUtkTSI+UdhqkR026fU
 nuhG9wYasSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMgAKCRAFnS7L/zaE
 w9JBEACdF9JAKwGbUN/7/vpGxkIxY4Z53T9iP0IB4Wsvrn2Z/RTWkzFYcsyta9gdVUsC30cUi1v
 Wtrud32nDPLsZjP9B+9n11nnxuVcDYM3YcmlcaFF6aFM7y2FK50ImRHVVGO3aIoaL1T7+0BA9qo
 zrX5i4uC0Y5exI93thWGPaSPt+ZTdUCUe8P8tHSfu73dvNEMa3jXxdDWxcaTqoINjtjBmDKnW5f
 MiufJMZyQk4CmPe0++KaQh7vAzdOBK9Dt1nuLk+1ARuJrQ1DFIl8wMMdJ+jFZIGt5DFaNkbMolq
 nOL0QhwG+1Uo1miuZTsiA77/sT95jq8haB4S/qZJ9uny/plHmX4N08K+/CW2LuzW6/VzEjBBaE9
 bL+tGPkLYUSDomKREI7AgNv+tmTHrPi2bvB4AScnlIJZDmS11OjPsQgriNO+6CcywhEifPUpS6A
 UQeGI18BnvvDEdqAOikuMKNyUnvnsHL22hJgKdzFwWwyjhZMrpAiTetH0p7hFPP8+uiMk9wKG3L
 Fiu4tA7yrEBfOWZaoU+ye17CQUnAVlbg6B9iChvLiBt4/Ptzh9sq0mWBbUCemFu1OLcrGTqDqAT
 vksr8UqkkJ/UKQmEwOkEMBc7ljIIYZ1SjdwxI7q6Kd5vwXNM0csDJpM8Rq47ezo1uKWv4Rj13vb
 IlMPFISGX85OT1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfXwt9xv/XQ9KTJ
 p+ftXb9i/0lrXUomOQBDAugZJJVRTgYYhLbto1ARiRkqnanwblgsCuGAD6bGvVniNzpHyIX/0n1
 PrZdeAx6qVHXa7N0LTTpV1NIc6IYHlQQr71NZOyTxrhU0JemDSqOVKduleG5bV7upJgt5d/XjAE
 qQbGJuEKal7h3LTwAfm/piftr5IGYTImFVTwvIok6lV3/OIW/7p+TMWcLqE+motEllGXr842+RI
 BShwlLbUUaeLiZNnjR/GF7J/rpbavFVFmEzNezZB9Muf+6fbEtBCltjkMwDmgNTWeGk13nwFZDC
 Zlcd0+LCNb7cb2mjs4+Q8oVkUkwpJTGWkUJ8j/yKhw/C2X5NumOYb3I/xG+Tkwo3fZRBjzQuhhU
 V4vDtBHoddR3OX6TtLQp3+V4gNZm+Un5OMW7alO0OOy7rwk1eeu1apUocyIZfxyzbbFfGOm61sS
 22L0+hfSy98J+2s+3gQ==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a031643 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=j4F7sB7NKAO1HzpnjMcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JxA2TRParFyWjllRZBMu7-rxM4UDt5t-
X-Proofpoint-ORIG-GUID: JxA2TRParFyWjllRZBMu7-rxM4UDt5t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f617e02b171f6e59a3c40504a71f8915a41e8514..d2f40b348f193db842aa7c17c9c41be59a03d35f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -895,6 +896,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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

