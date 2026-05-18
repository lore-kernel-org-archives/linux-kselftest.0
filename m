Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B548B368
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113810; cv=none; b=c7f2MM5dOlYaKaJEI1D//wDZbuiUHyKkyVdQnFTe0uBSo0HHoMRiclYaAmHkEx+xjZb7FHiYpqyTtBmxC04qF9zBgpmjfBVnTM5qc2crX34sVNbeTozeYCDlSwQBT1Ue4kVHEq6hjHbHkF4Q5wkdZo3aaNRgG2SdCpqZkYHvT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113810; c=relaxed/simple;
	bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD++D5l3JVmzmlugTtd3bWepioaPnMYGJTUiM4kXbTmpON2IcazCylLmiMcljU92lLMqHgob1TsIXJZoNy8vIVGtuv513FytqOgnDCcyz5xhNzlHQf4VOLu1q6AowfJ4i5IQUizB/hGXJvt0zlvOysGPtta7KNTez04omk84/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da+yG5NC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUPL3/zK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da+yG5NC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUPL3/zK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHQmU2482373
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=; b=Da+yG5NCap8TB4JT
	2bnORosKIegi+I0AUEo3iYC8rj19cnVvV3OQ9XM/jbmRt+KbicsWnojSfn+YGA1L
	N9DgnjeuZN008Zz7+4FAN6XapEGZ9sBlFAKsyxmZJA6VmehaeEBETLtZUILJPBkE
	uffATMLa+pbUBBo8tqLTLrNN0KuacdUgglEu/I415gQEvCHq5fA2tpJY8VXOM/aH
	y1UMAcXdNbKKARMitx3nR3N6MJRZgJdYJXhJlspbUSRVoPMSA8TuySfRitUGTH41
	3lwyjCQIioR/q0aYwyLybdMg4T8vS9MmIIV8blD539Z9hJtUunqpVdfkfl7LqL93
	+csZVg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvgnnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:16:47 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-479ffe1015aso3989554b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779113807; x=1779718607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=PUPL3/zKdcnfCJs4tkMOSGd4hweMz5xhAJyS9hj0uXOYAs2rGuYzagPGUiYdhOvptV
         OJcG20EjitIara5f420WtDHWQizbPNXY3AXQ6jOnzK6FdnFTtApRxKy//dFSzVRC175v
         xJmg0p5KfH+a6XK+JnLmLTXMT3U2Fs5g32amwhyV6PIGUx9zLUa+UuQ980y62nPNT8aO
         dYrY6RbqOXvJ5hg4IurLmRoL/nVGN/7S29xG0g87q3YfeEB7twu1djYhYxgp0dZKqKMa
         Qb/r+Q0rXdtJiSLk04IHgwPg5TiGWh2f+VuMDo+u24JOLvZ4UCU5MQMlycRadC0TtGER
         Ws/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113807; x=1779718607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=lONY6f3ycCG4AwCuDZhYjc7jcaYD+oehYp46IvETc1zRM8e5b01E32tzUEy6hWtnnF
         PmNDXAszZjvB+XgKcpI+nm1zJo4GjsrvhZecjkRX7F4nX6HN+gdLlxMJ6oy+0JKIW8+8
         7aQf9aNS+9V7C3k5a28y0dBZOLuWXw41ElLUS+zoRWuSyvnQVYsevJQUaYIgSxo7uos3
         F6Exa1MQp2vMEP4p0j9iMZ+pOY3Eo723LkUX8gNuzJHY94dgTsSKfCJq8R8qZuO6Lnmj
         797CPKxEcuZ+3UOxDTWEf6RKFMezDAvY6vz61G0+fVHz86nIEaryXc0bHD7JuY8MhI/m
         3I7A==
X-Gm-Message-State: AOJu0YwcMCCjabl3bQgQVw37s8Ij6jjMGRHs6kmC4P6YQf2T2di1M7DT
	BeNFZouVA/0TNKP4Wwl3kmtg225UCSHuodxV3BxronKou243xG7sH84nag2tpgbIVhsXpbyXvfK
	xigwdPGjQex1zJx1aB78TDsiAe5UJJ9HiayM26OspazbsCzopHQERt+K9i7h2xjXwI1Qef3hbKq
	BFxSo=
X-Gm-Gg: Acq92OFwuy40Fi87rbBBrexJTD4z6pSb8gfB0Kuh0jRq5Iwj+306DlINKNt+eayAKvW
	ZHbdRfoSpnfXL54erMEJM/3emJfmxPJ1hfYd8/kCucRRlrTxs2neU4kqHAe6p0NjXKWUvXR2Wot
	PkM8LihM5wpXRyfpZjGpKqPC3rjGSIVD09leEctBZxQRMTu5t2wXIS7MN4ggAyfnRNOLz2u2sVu
	HBtY8IOnYkUDIkdr1OJ+Qz+cPlXwFzkVmqfA1Sj+oFEX4zSBWd3aUFyadHvcKNc/gD5CqoS2rkd
	ZXtcBRD5mL0J6Ahup76d5bWUyitJ5mhTkv9ZTE0eEQ1fxzfRFcxSI/Ci9szEbu2YKciLSqoespE
	B9SqMaizaS8BIVoZi0PNudQDQIvefkMt3rKIUNjWegOwHrd8CKw==
X-Received: by 2002:a05:6808:1482:b0:479:d467:1a26 with SMTP id 5614622812f47-482e5bb9669mr9786606b6e.43.1779113806652;
        Mon, 18 May 2026 07:16:46 -0700 (PDT)
X-Received: by 2002:a05:6808:1482:b0:479:d467:1a26 with SMTP id 5614622812f47-482e5bb9669mr9786550b6e.43.1779113806228;
        Mon, 18 May 2026 07:16:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaa2949asm119371225e9.1.2026.05.18.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:16:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:16:29 +0200
Subject: [PATCH 1/2] kunit: provide kunit_platform_device_register_full()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-gpiolib-kunit-v1-1-131ec646c4df@oss.qualcomm.com>
References: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
In-Reply-To: <20260518-gpiolib-kunit-v1-0-131ec646c4df@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCx9IXqDK7+Xm8oAjrxbh18dmFPVeLVFeNZ+6i
 QWHES+2ImGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagsfSAAKCRAFnS7L/zaE
 w+QcEACUh7huTT6cP21wKtuQX/BpfJTQVM+DQerd+zTEzwF3+SaqgRHd6WyIPFtF6iBsbxkORiu
 cPQpfRdVWHuiicmE8h1ZrDKf8+zZF1jyzuUWnCbawdAxtBicaSLfv3u2LR2Tfa9zgltKU4rBxby
 EcoROfoH3oV+5VQjU9miAx/u8XRRgjguWZ6fJV4Wo/q+W6Oxih896GB7rulrOnH5r3Fg69wPvdl
 jOZ6YjC7R6ae2KOBAPjHHaLvlTLJCRURsc7Uv6AfDIb7oVrAzz75qKVPibxGycp2jDV47GbJVKj
 oOOf8iEpzzuTEUMFxKeS1+C96MeyqiAWGZPku/QWlledPKSl5dLQMekJVBrL8BWMp4zJ7ZpXvAR
 vuUqn5mGGQ+o1EuMWmzd7Iq+YLWhkFkbOhEatGVLNNyJ8BrVr3pcVVk0YBaZL2KsZ9TUjh4Meoo
 zQdWwz/XvRfdjvJ94eWWnBkW7aD6IfEo0Z0Q0GyQ/MgPm0j5cmkZE94b8OhrBIXXsnqoCET3eJr
 i7zIt6NYIl4sqpBTboSp7TdBopT44oPYC1Cfv13CpfOP3dFBEnFzVxUeOes0KT0iBS0VF/kmy+t
 /lly47e75lH5qrujZrNP8M3Egl12HvHrCiZEhMyA9HH2XoiSD8hCzxxS+91aaf2h8WWu9M+1BN7
 asIHj8bAjtU+Z5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzOSBTYWx0ZWRfX391NMWi8getv
 tnmwv3fJ1RIh6SnP43S68x5mDMIUVGw/Rlovt0OjjihXyxC3+2Pzmb11tPOTAZQ9wLfp600KS3I
 CyeAMdOlml0Exve8OAmyG5n3FT0XZjEazprdad6DvG+wWgVClCMWeDeLQ8PtR7aYFLdmSSJlNH1
 jSd62AJPiPhHJipAWCZwTXSBM+spOCLClGW6kmRAhny1TVMBUtkHhJJ4hfPq01wqJ1xHwSonvKm
 b+a7pRcLAayooxF7bf4J60BpVMKmDQhmIarVCjF1QTVqp3Auk/5oWsrAP0amoPqk9/4Kflv+os5
 lEYCnnupM6rJkQT/IxT9qrkK6tCej7z6cy03OZHZAn5JJDjIYG+HPjjs6RcIM1gBlk5EkMKt9cp
 IVPY5FiMeAA7VcLHywLgDyMguE4UtrXY+veShjBfD4BG74W/4j6DwgqI8ELUZhG5T12YAcPIofj
 gkcYRHuhcxIVQTLCGhg==
X-Proofpoint-GUID: sUUeIeCxFNUrsolM7fV4YcQ19TxRbcZU
X-Proofpoint-ORIG-GUID: sUUeIeCxFNUrsolM7fV4YcQ19TxRbcZU
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b1f4f cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3Mdbh2SI1NvihuWZMnwA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180139

Provide a kunit-managed variant of platform_device_register_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/platform_device.h |  4 ++++
 lib/kunit/platform.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/kunit/platform_device.h b/include/kunit/platform_device.h
index f8236a8536f7ebcee6b0e00a7bd799a14b345c1b..8cad6e1c3e7efba862862b579089f2f317784a73 100644
--- a/include/kunit/platform_device.h
+++ b/include/kunit/platform_device.h
@@ -6,10 +6,14 @@ struct completion;
 struct kunit;
 struct platform_device;
 struct platform_driver;
+struct platform_device_info;
 
 struct platform_device *
 kunit_platform_device_alloc(struct kunit *test, const char *name, int id);
 int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev);
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo);
 
 int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
 						 struct platform_device *pdev,
diff --git a/lib/kunit/platform.c b/lib/kunit/platform.c
index 0b518de26065d65dac3bd49dd94a4b3e7ea0634b..583b50b538c79599ebbf33e261fe2e9ced35efa9 100644
--- a/lib/kunit/platform.c
+++ b/lib/kunit/platform.c
@@ -6,6 +6,7 @@
 #include <linux/completion.h>
 #include <linux/device/bus.h>
 #include <linux/device/driver.h>
+#include <linux/err.h>
 #include <linux/platform_device.h>
 
 #include <kunit/platform_device.h>
@@ -130,6 +131,36 @@ int kunit_platform_device_add(struct kunit *test, struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(kunit_platform_device_add);
 
+/**
+ * kunit_platform_device_register_full() - Register a KUnit test-managed platform
+ *                                         device described by platform device info
+ * @test: test context
+ * @pdevinfo: platform device information describing the new device
+ *
+ * Register a test-managed platform device. The device is unregistered when the
+ * test completes.
+ *
+ * Return: New platform device on success, IS_ERR() on error.
+ */
+struct platform_device *
+kunit_platform_device_register_full(struct kunit *test,
+				    const struct platform_device_info *pdevinfo)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_full(pdevinfo);
+	if (IS_ERR(pdev))
+		return pdev;
+
+	ret = kunit_add_action_or_reset(test, platform_device_unregister_wrapper, pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pdev;
+}
+EXPORT_SYMBOL_GPL(kunit_platform_device_register_full);
+
 struct kunit_platform_device_probe_nb {
 	struct completion *x;
 	struct device *dev;

-- 
2.47.3

