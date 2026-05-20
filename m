Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C93A5438
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265320; cv=none; b=YCnxyl4IPf/80onJriYyyYyUOEnls2NqpRW2ZK1yyvnLKo+PzUWGyO6qCjlazMcn2SWpv80Zo+zCYZgkrWkhgBb38qAapFA5UcDieSvRv8SUZOWNHv5NovsLUpQcDxpu/bsJi587bclFZLs1+cqpU7SaqIWU2lj4oEbhk5kLZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265320; c=relaxed/simple;
	bh=t3GMhU5BiDcAMpoxPcbsowAatqnK8Fer8zJ7S43It88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GX9lk5vZg0Q04CEW8PbqpZx4BzrsKeotEUdibuCOcgXWOMpXbvuLwxKFFL2+Ie386LQAUFle+Gf15f1aZda1ByVObzRRelnFOXO3n+mUFftQgf1KN1AiX28vFInx8jNbW1vbm0bhZzCq0Uhs7voLPlQ28vznCBgUPDq4jUb5654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IePBnmCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+kVI7AA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IePBnmCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+kVI7AA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7UAS42064896
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=; b=IePBnmCTQnQnbKBI
	TvWkGzFFTriJTjXPZ4nXUFIxoRo39BiOr3bfNWftUCFrT4D2fwDCEVYIDZ1HZro7
	I90Afi5dt8ZcUpFPuhZ47SjxdPqTM8nDIDN1wOulL2MYZhz3bkHh6yWv1vYUw40Z
	WCQNtExn/JFhgxz6yatMNmmVMhSk65MBQBbIBTU8LBuPAQjp44lk8Jr5y4vALz3b
	t5ao2aeZClJYgHG0XIUUX+E/fvMM7d4r8iWn2k5BOO1PwGMHWidyi4DvbfGpFGAT
	x7HVgRnVvYv8LlExp3vW9qO5Lt2SlWPSf5g3/lxKzgZ3MAbARb8l40W4/My1ts7W
	TpUb3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3q59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:21:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so134673531cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265317; x=1779870117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=G+kVI7AAtjSzMknED0ClEPEFx3tN8RV1svaY52uKt167+IFCqwoloqHfN41lNuhR3i
         62jz2IO9x81gwzeA8C420PztmH1l/FTktcpJqr1jcrpgsWvoIFbUmkjrTDyiYUci7rpD
         6dKeAf2Gr1ITVkgqDz5kY8PiqDnNF9jtR/NhjaBHqiCoZF/OywfDhbJ7PMX7eVMXD+WB
         omlCVqMP+8EEtyVd1ZE0kLhLuZ/T1UcqeHCTSqT7vbbN9GZ/EJFVr0EVf65AsWjARVes
         ygp93oPZAfhcjXbjkvK8go/zB6TkJfmqZdlPKMvZgfqiqEHgJ9/niCDRKyb2EZcXC+bF
         IlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265317; x=1779870117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeQ6mMjem3Bq4Th8eTbkEqzyisijnZHO8faMrAT7mEA=;
        b=qEgSl+9INf6Xkwd+KgIKn4+ZbfV9oUnp4T28oOaaAYF3GDPy/nr7qNy+KaP90A67Xs
         GsauhIUdWl/b/+0txcTmoE8guMofpj7egd++aUEnS8vsUstZiFMucMjdlMAaSqTI8P0o
         JjrfbDyua+LBSkWwUKFrSC6EZ+aOAy4hUjt/wpoFhJXxbLsY3qz21nrJr/qHN6rnMyC5
         He5/VzK6l4UA6wNlUPhJgmOy9APYe2JuxQfQOUqdXi+zkhblMcvhlIRL7I/vnOW+l8aA
         8hERdnv3xeYF+Bh6H/OXHfTMQ712oWcgNFKM67qVChUkJewH5tVSzSDkHl+nH7xwHF2U
         VipA==
X-Gm-Message-State: AOJu0Yyw52nUUAkTyag0VZbfIAbtwLs2zqrv/OBZ04vBtNIv6LNp7ppR
	a9wu9LvT86UohNZRbAHc6TtpGe84N0lxyeC0JWU1XR5ck9dVnblhF0BlcTainej6AYH0OvoyDzI
	W48TbaUsXlur6OBiqx87Y7Pb8Pwd6tpM0nUsE+OzvxB2MMI7g7Xh6BBMYDPwTr1KxURNGn48=
X-Gm-Gg: Acq92OEaE8l0EM8M7sbx8L5Elk4RXL2O+vPAeFZ2f/nuuRVMOJGSooG6L13AQCC1vxv
	R0rsOjUO2XuZD5fEsTSirWEzkX2UeX1xlueN+wYU8AWm1nUSSpgZpHrNixwsfssaOinYGFS7NgB
	HxzvlmquftMJH6qlggqs5k5N+H94sr/PmrRHzVj15nUUt66Bl3C/tImXitkrO4LY7snQWU/LPnx
	ieg/KUp8kk4N5oHFEXmYNSEgLZlfG3XgjZ2R7InIQ1waYhRnOusnjshcFf2RbLyIIKWSLfmxwK2
	1vE+d7Ux6nEEdxROB9PyUUT+m7UPWTthHjE0S3QjN9OHyRyWXUmq08cUWjxjAC4IRYLZUAnb0RN
	EqjgDfmhMKqwBvjuyMZChvkFlGEhOxJ/xYNBFHgHfPFx/+3RSNRY=
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr296063691cf.15.1779265317510;
        Wed, 20 May 2026 01:21:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4a0f:b0:50d:a4e6:997f with SMTP id d75a77b69052e-5165a03ad56mr296063571cf.15.1779265317088;
        Wed, 20 May 2026 01:21:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm51518570f8f.5.2026.05.20.01.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:21:42 +0200
Subject: [PATCH v2 1/3] kunit: provide
 kunit_platform_device_register_full()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-gpiolib-kunit-v2-1-cc9db39881da@oss.qualcomm.com>
References: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
In-Reply-To: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDW8eVdafWapYJHQpqUJzKQb3aa0IRy7m3QQJ1
 yQ3AE/38+GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1vHgAKCRAFnS7L/zaE
 w6W+D/9Ro2P1V9Ti8K109EqS5ZGnvQMoxNVVyV1o3DqJOCAKECPGRo0RZko3AiQr+ayecYHEPrL
 EdrFsu0gSDS+d/JWfVyXucP2pTTe+ecwiRHB8DhRuW6YkoVPm4dJd1JjB5slwKbkFHYMo/Z6lxf
 MsNJnG/lNdiD/WuYgRA27unWFNnzYS/bJTDdRLhz7Z+Lox5X5VWuCeME3RqeRAEgTCvfn0JUVAn
 fBO2l2x5aQ1iCsoTC2/vNdB80DIRlF8ZaC24Ac+btZSR48aJuCejYDAAiaM3YgpKwq2LsfemWjf
 ARVN6nhucm802ZhANsP6cGi4gg0mGJ7ICxkKgQ6/GG8O1MS0FBSzRFPNhJyLdu3E1Ar10MEqlFB
 dtfQMjB16HU5lHa9woLoEVAmkn5RpXOeGn6Wz6beN8KX19j2NmcTO2ywil6Rkc6MMDZw7cd/VEC
 RyBHRH0A5/hSgxJn49QgTAfMjkPFV5hh3NUaBvXMnbGwah9X4igftmnjxLuq8vkTQpA2pWv5XcE
 c6mB3JEYfXP9BpKMkCXVQShVikrSd3KNrOo1aehvrEHxFuRSYCPu+DbUugjRnvNbsYl5WPLWNGZ
 cFX1ST8aBrxks4zXckEGajiwvY6x7aAjgDPKIIMhys99GqGw5dfuFGIDK11MJGvyCQauKJlMDHF
 YoLz0o/3ajYE/Ig==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: zgYQG8t1qjdGZbabR2ooVxq_t99C-wTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3OSBTYWx0ZWRfX/Vp9o+tZAlt4
 hXyHnIRnRiWl7npjhNDQZhMpPaWyqMXKIaGQDtJw64m9nJVrMR8KRw65xslU7moJAdxGnf0oP80
 9KNV5QTrgKPWEyoXl93u0Dsd4+l5xKBWR7eLPwG4A6NhnkFlSqYJ8QDauR6LTaHgTokVBY49VMV
 8a2CacY8/HiJr5Z0mO/JoDn4rAXR+5vIXKcAVhhhlTbcLwzB1J/Mm5RD8iWPCm2U2lU4P5E4RCw
 TLbSM4F5nUUviQ6ADd1E99SkxGvIsnM3aWwm5FpyZJ8S3Sv5K/vdDlvBSUuQiMFB2MV5nlbM81r
 +TJRuIiRMmEe+SFdjYruk4wliYmnSx6RyKp6DIdeM3RZllGqX1QSKM9oHnwamYoJIU0U4KTdkq+
 VWS8qBBLnm4f16uRDDztku14nI+ubYoO6jn6c8ZzsWUfTI1SOBVOu0rCbp40xm0eSyo1sc6LDaw
 4lqkKwAuU98RYFE3HFg==
X-Proofpoint-ORIG-GUID: zgYQG8t1qjdGZbabR2ooVxq_t99C-wTq
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d6f26 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3Mdbh2SI1NvihuWZMnwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200079

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

