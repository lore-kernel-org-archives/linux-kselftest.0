Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D52C40913B
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736975; cv=none; b=LGF1knFibZ0atv4rZaSo3UKGZW8RyUewlmIn1UZvqlVIIGRMQV6QqTysYqgrhSHglZeQjSFsPjpeEYbbUdBFQsjzwuZYpj/FHT5p7MOxI1nhwQ7MjuYEEXx9vGtxEfn3kfc984kIb/7PtfQneGsljevikQWJWkpStuNq0LnVA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736975; c=relaxed/simple;
	bh=GJxYaevdkuwc2WMWIkCt/pc6OVxaEO1J+q7xuzP6NHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMSHaHMwxsHqfPgGL3po6wgH++Et4txVlHAsQMEtiu4V2VENuc3CeZgXR/JdmZKWyz3FEVMf9+Gy6OP3eINltVf6HkfJArI8AGujNUHf/hafZpqLgda7Grrbu0RQWoOYIz5PoARYGfFrxbeZrUAMoaOiYIcC5q2axcLDKsP0mnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y89AtyGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqRQDmII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y89AtyGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqRQDmII"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASxVR2641503
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0bxdEsuO97otjVeelamY3bjFlltCdEm5Mfb
	irwZ8RWw=; b=Y89AtyGgltTsoPEYG/x3plcubyVgjXLLcycoARbRMehVq3iWAMO
	Oh0h99mDv/4k5T/jpTGG+0HHLQw19JBDUxNzTalEVDqaHT5VlQDn62ap8vtgTxkJ
	6RgKAiX9MTb2UWTakvoOKX/770UyccwaRd9995B58QBUMhI+C20KGn8PyYvsdy9h
	h1u2/zIBqOFqeR7Jfw2T7a2MODNLjaABKMT8OcO3NFVeJ87x8VEPu37CcB3hHiRs
	YXah0ramkm3jNNrEhr7LMSLP9K/p0qQTJTyRhu+gJ0WRq6qvrwwKskkwIwzSR38+
	L3d2DjkLKuNb03CPIbVDGvWFHuEmlp/GdQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperu5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 12:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b8fc5cc89so481021685a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782736973; x=1783341773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bxdEsuO97otjVeelamY3bjFlltCdEm5MfbirwZ8RWw=;
        b=FqRQDmIIDbbVFwIou4e2oiUaODSgz+RLULKaVDBC3UDlr6PdGEm+BLsHN6yqaPf/Ml
         +MO0E27ZsasUAZYBFZur1Qzf1VaKkeiT5FcXEZ7B3fK7jQ9Jnflegy+xlOL31RkPJ6vj
         QeOfUVGjTpGtNxtSTEC0hRJB6yDKL1OBskZrURKbYy0z1F13uMDu84ryWHy30XPzNMsH
         GCvBpAGMlya+1f6toI0hCWFqsVmXKzvDX2C2XV1zzwjR9tA6RFJ0HftDxEkPi/ssafNR
         F3TuwI05K0ot5xkgDAUDTjPqAL99xZPALm/X7EVE8LvwJOwyCWS4SDBdhf7apN4gXSSH
         enOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736973; x=1783341773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bxdEsuO97otjVeelamY3bjFlltCdEm5MfbirwZ8RWw=;
        b=psPS3GPABBYP6lelMdKiVnXpD9evvmztWtYy1WydAxLkHSEQXQvFL1w+eHGncjtx3/
         Q0eeBoCXwFJ+GRVwO7m941DViutNU8R/lNiE6HVyPT6+oo1jxZ7sBnp+xxudwey1uoIz
         lsHhUNcoKWxYxn72Pw0RiFzQi91OG4WpxD0OcMWQbPI2ua1GR7lmqZd4OM0lnwB2SuHB
         92qV0hQ6I4kviSB1s47cLl094EXpc0Lpl94Z28ZCOap+ahzfQ1LZGPXKk5AQ3k51/Xou
         xtGnUVscw1TADb4gIURL5SaA7m+Lxsj7FkYgfu/lj/bHEsZ4k5G/llDEISufVtXQw4an
         8AuA==
X-Gm-Message-State: AOJu0YwZ8HAkFTc42JQByKiR8NHo9mE/qPKitzA5+d73sedl3lY7cPfe
	3MyZ84vC/hR6/saPbOMiiGtaIa6xj4gtJeAeP05rkWa0u7YHwC/SdXm/39sOB1uJf4GqmOIGpgr
	50s9a4XL4M9Q4YVgkUmsHTySQLQWw21SFO36bVTCFA+hd5fHK8Tx26nZ4a4O0gQbegYFqZ/0=
X-Gm-Gg: AfdE7cmIDhLARDb5Ees+q+p9SfR0GrWaqnfnEStbAZleNgaTAjbK4GwuT676BQSEeBg
	5QRANkAjvUxqy+koNFW78Zgwt2fNB/2xG48mXUvQB6LZwhpCBAy5NxC0CcT9ExaBkUTgqRnpYd9
	ZXiK8RYxyLWSG9qNihp67GaQoUbPhHPH7Bdo5s5X9WeM5l4+I1L8sZoMCh/+N1nFJNBGplGZ8ew
	QeSTT2u8AUOKTEhRU3Xalep3JjLnjv69mPR1ZcuUC6z7XcMLSZ2TNBP3amoNvRiw6hIHJr3GaGb
	aObPOvd3ITEeN00Gbo+d35ySaNw+xX02+jNoml+ngg/P2tDN/nu+6RW2fPLYCsDN2X1XvrHWWtT
	J/G80EGp/tMCiYdqlyTxWaJAKTP9EoCE34/ioeAs=
X-Received: by 2002:a05:620a:6192:b0:92b:67e6:8abd with SMTP id af79cd13be357-92e5f4c4d8dmr81540785a.71.1782736972824;
        Mon, 29 Jun 2026 05:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:92b:67e6:8abd with SMTP id af79cd13be357-92e5f4c4d8dmr81534985a.71.1782736972311;
        Mon, 29 Jun 2026 05:42:52 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ff9f40sm288236885e9.6.2026.06.29.05.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rae Moar <raemoar63@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] kunit: configs: enable GPIO kunit test cases in all_tests.config
Date: Mon, 29 Jun 2026 14:42:45 +0200
Message-ID: <20260629124245.27674-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNCBTYWx0ZWRfXwzUbuQk9BMEe
 DIUnJlpnXKvtoyLMt5arOJQ7VMUkPFGM8qizIYlHJZbjawjecy2SkV+3PxD1O0qWWjT1xzwNiFy
 pqdJNnbHj6dvNlu3tJ1cVt1Q8a101PhRJA34gwsPzK3XP5S6Do3fDRfmZXYqPx6aOXhg702m9aF
 NCer0lslQbNG09K/Ln+24DBp+XUzLzZFCxcg3uoYCzLWzQ9XHPSy+plXttXP2gw5cydfPyI5//U
 XM6Z+nwYjxwKGlSYvCbHZ4K4itcrZQhH6OqrX+rSnxILQNIxV1YF3eYoHTswc7olx+VEEJtaTH6
 g3n+mBycf92rSnHUjlPC3fOOhjrHIMVfHrL5tiMkLbwefMRU6c+85koaYDkX7ue4TjfkhzLVFHx
 pvRQYQ9WsjgSSgph+2uU8cxXx5UMXXoZzZp+3QKV7FZcjM1522GvCivihgL3wsWvT+lhaBPJhGl
 J6rgCqRXTEp/TuPNQkg==
X-Proofpoint-ORIG-GUID: 52u63MikGJ9ClrCtip9PaKpV1-X2Jagm
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42684d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=-2JGltqoQDAwLqohOssA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNCBTYWx0ZWRfX5bRt8wIWqL8q
 o8oEH7ZhiN1LxXmn2WAphQQQ2oGIuak778wqklsAWMO3fSwD6XPkkocX8lpjTtE4mk0EeVYVsfP
 sJnVIxQnWSkepbFR+g2IyEYIzCwDqao=
X-Proofpoint-GUID: 52u63MikGJ9ClrCtip9PaKpV1-X2Jagm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290104

Enable CONFIG_GPIOLIB in all_tests.config to ensure the kunit test cases
for GPIO core can be built with this config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 tools/testing/kunit/configs/all_tests.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index bccc2c77196d5..6825c2e855a55 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -21,6 +21,7 @@ CONFIG_VFAT_FS=y
 CONFIG_PCI=y
 CONFIG_USB4=y
 CONFIG_I2C=y
+CONFIG_GPIOLIB=y
 
 CONFIG_NET=y
 CONFIG_MCTP=y
-- 
2.47.3

