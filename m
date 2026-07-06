Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B05A43B6F3
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342488; cv=none; b=n6DR+f6b4+qxnqiwV2G9gnvkiOMNJ4Vr1oFjoAUZmJcLg3zkDEMv3KSrBILswpLaLOuD3WQZ941c6PJlxg86D2RwgxW9D069EwFIdZp+veeQ4kZM+TnI7Jl0Fn8fZok63riTwqcUirvbCWUDt//SK7OGNKNRt88wPxKH1gyWAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342488; c=relaxed/simple;
	bh=YfHcyUNANbHeZfkVxh8Mcj2c+wv3uMr6hNGRG2BHmb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phkzgdNJ6oWfiHu3xwVBTRDdBNkcWvhuVcLqioL0hAUZ5LOdmebvNv/vAD9eS21J3yoMaTnnP2ChGtGrbCgNBSyISI6Af4tZ3nq77MIpNaCUdcRWIFDbYRYl4rJ1/aHZRRMS8Y/hTCkbYKmTO1b5wYrwU2+KWJq5nxUnlxtMMEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRg9fI4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=If28sLGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRg9fI4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="If28sLGD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDIT366713
	for <linux-kselftest@vger.kernel.org>; Mon, 6 Jul 2026 12:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=; b=IRg9fI4Xj3lGFCKa
	HQ1ZtkVFz8rKgSgTR/cbGaXxgkKN2Oku2AhTV7prMrgMNN15a6nUKfbluJAEyyq0
	vF4aAMAPN9kR9M7JvKcJAuhIWlL1C9GtoL6pN2EkoH4HubG51qXMr31LvuAPBzeY
	MSHR9f48p58Q0fIeU07H9j3/W4hu+q/kJTQ7li7zeNHKcGjV50l+6CxZPLjlT5Um
	zxN4QJWyihVLiLDjBATd/aG+zLIVKLkI4ZvZFKXgQYgAlfAmHuPb0nzPiTGVQDrY
	eDXuaMzC2xGySQDSsWglLcZrQyUk5T5ZFGBxSw77MRFN9Sos3Huy0aT0n9W+Yqxn
	OS688g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urxte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 12:54:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e63df032bso329723085a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342484; x=1783947284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=;
        b=If28sLGDkyPWkCzd618S4NXSyPgqv0kdCWr0b3PHD3Flj2bE8Ue7yuW1XJ8eKCpWQU
         pTfGUgASBX0kjGwQIYJ54FK0SDwn2nZ6DU8/nMsywd0nPl686Zxgw6b2i2q4DqeDxDnr
         JW++m4xedSEOdsHZ7O0cPN/uhu13WrJilxBSVZItOr29VQ2jPjfD3LXzsu78FxIg0hi3
         2svZQIOKgfhJyxWAUfrNrsUwR8E7o/Rsjmi3taYQ9ig6Q2Qt32shjaFilkE0PBXKQBn7
         XgKDLtMpwkX2ZMIJNR3VR4a+CYDOm07p7fuhZkwnd8tbAgwE5RMZ+hIO+fxsoDj6BsKM
         RFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342484; x=1783947284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=;
        b=JHc9vlx2/YNSQzK4l3sW67XENmAez/MSyaad/aZ+JXib+kIvIko3sSq2RJE7MFXnxw
         p673O+LxMukSA7Ok3JKUEkCNTPh+LpCR9OOLVvFmpvRtScTlLZihcPcSIYHMPxlASoyT
         ZU4NX+kdH8KhoaiiDLpM9qUhr38JFAUn1NZ2SgOYjnxIJYXut2aVbxMEly8s66LIz3Bp
         V865MU5vbokiydaz6tv6D6ak6CCe8F2VjYwXM15ch9rUUnMc/X+6chYp3J2KSqxA3cLW
         owtMcsXbJsTl+mkPO9J7LbPE1epTv8uN4Spu6LAPpSUY34oi4PWOtv9cb08Ysmj8Od20
         Jpig==
X-Forwarded-Encrypted: i=1; AHgh+RpOeUh7OfZ04l93QrPIKHMoeBg/Iu23mJ0bPG0aehQCD2hmaLWSb7Ajods5u/d52i8cfrlyyiN3uDoxLO+9Jhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV81XkpE1+s7XEQxi2MD/+nIWQtbZxm9SVbbXJHhV9GEHI7rWl
	NUj931NAC3iAD4JPjVZOO3rsPHaN2c0NnrtOzL685P330MyXK2eLuNHykhI8QBVMEnYGvNrEY4L
	nbI5atX/ebwVczN2oRBVrY0kNtxRdMjAwaAat4u5qcL92B5qHXO5Wt77fWnYHnZGM+Nnhx/U=
X-Gm-Gg: AfdE7ckduTkEBeGRDtv7wSrRmFEw8oyVhzB0xR2GJ+UWVq4z2JfedC8dE7681jeidB4
	6tmXZBDXCwdHY3EwR7WEJVERRXGzNcSsX9TEP/jsAefGBrDjxJSiILI5h1ftJt6Aai/6KzLM7GL
	ObeW3Zbz7xZ3BfMPgS3kF8e8kbipgheD/aUcfKOKCNusLpgUDd1+wZuZV0lnyv/1/KXuAoRBow1
	SKmfYGv3IJF7cmy7XXSRn5aQ9FhMvfHlgb5rGvKuKHgtBg4Z7Hc5RD9FsSwcaoE3LuWgVBb6dWc
	zpaYtAerns4g9VAYP+BMSe75Em/mIfJSM1Za7/Uy0hllpwQa2MYvFPs2xTjL2kodW8ZZ8UiR557
	F+ZGLocT+YKZI1Ys3uMu6krl/A36eQ0OecFFXNi/7
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e8b543ba1mr1834668285a.30.1783342484103;
        Mon, 06 Jul 2026 05:54:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e8b543ba1mr1834664585a.30.1783342483591;
        Mon, 06 Jul 2026 05:54:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:12 +0200
Subject: [PATCH v2 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11429;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YfHcyUNANbHeZfkVxh8Mcj2c+wv3uMr6hNGRG2BHmb4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WHS5pFiMlrg2b4Nwf/qXSExFRgsmPEbV9fZ
 QCOi3m0l1+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhwAKCRAFnS7L/zaE
 w98bD/9H2eLICaZAJk20cD+3nwNg2w6Hrc/UWvoTvCi7YGrJQv7h98pdlTbl1SxpghIZT5zdG49
 dVgWm4ECY+0vz7u0KLhhJmAXAZ9YskJ1OFiv+2qidBP/EBqp2zqVRLb76KwTDe9e/7/iJDNDGRw
 Ja5AXy8zK8DSrmQS9ZcKuj//QZdtuGT5J35yDOgBjk5nb2r6GqyRSdQKYqYZpreJyD3nACiS1zO
 o7xz5+t02exqM6fsx7c5ToRkoIZ0F/cYctpdBQjTTvU+3wnEFPOE8md71TLoz3lZb2k9Shqs3w4
 IQIJ2gfWjRYq+7fAYeIfElR4Fv9RmbQ5g1QPowKFdUA6VSu9QqDasv72LJMYDy90/P+jFFH8tYv
 SAarb0yYczw8tEjJwmnqI7J50fc8iBf1h7OCoqAytkqWhauwBdzS4OIp87q7ynX8KaDTzwUU7HJ
 RJlpEmKCIaRf2T2rHgR7XB6Wr42syjaK1YAcGpZOzTxf92aOQumjVa4aPcrjQqwOY0p4mIAOBSu
 B+exAuLTXiS0ifBgg6qaNs3tsIj92d5U/sHA5c0Tx8Q4jJDxG/4/py0l39tzuBsTc0ZfNBT0fr+
 DypABuB+OKPvU2S42ceq3S2SBCsCfsMeKl65kyAnmjovyhQYVbOn//fgsZ40TeLDkk6UPkyRrf9
 Hy3stfKhrcEAeDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: YmknDGsd855gPU6hxnC8WQ3nxK7Tl_Ok
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX8NmSMbU5AiSI
 znR9NFr++4KbZvj3gB/q3xVuAo8N7unzgApu1Ky9IY786VRb1B4wPHsegWAkm5YTucNf8hdkymr
 pwFzSFy3JAFnN9pKVTeAXeA/kLASbDM=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba595 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=r134EpD-t8S8Nhkp70wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX9j2h885RmPok
 jXCMeZG9dX8sYrzoDmt6G9ZKhufUF4AE+Adrx77i55exoHAcShCSIPhWhLoH3I8vq/8JLr8+bo1
 7rJtfDzkQKnJz5ucQMPqKYiEzIrePKZLj5Fxn5fkytzGWx7G2fjGWHY0VDU7HnDLJiWfa/ZzB9K
 Q79r6zE+AzjWPeU3Ld08PDQHFUKPeLhXzbUWa97G2/m5HQdbw4SJ1TXg1/rzRV5y3c3TBB+6XYR
 OSBXfKnlHnczG+NQkWQza26qSXCL+lPbBTJEtwuI/Dq73/27qS3XVSvgLst9Gjn5NhZ4PReyxrh
 dssl7Kk/IKgf38Q76Wsz6DYgKxnHlycFt+L373pF84R9ApoWyV38Mi35Nbh5beUvo2r3BaYQUCY
 r6Bxlc/XKFB4ezCnaSo1yStIKJNU/ky8iuCjpplmgwAnMyWkUC1ro+25I+9VKqjPX36kdoBNCYU
 lQDj3RE4Bd+3APmnNcA==
X-Proofpoint-ORIG-GUID: YmknDGsd855gPU6hxnC8WQ3nxK7Tl_Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

The software node fw_devlink support already has its own kunit suite, but
that verifies the fwnode links in isolation. Add GPIO tests that prove
the ordering works in a real-life use-case: a GPIO consumer that
references its provider via a software node.

The first suite registers the provider's software node, adds the consumer
device first and checks that fw_devlink defers its probe until the
provider has been added and bound. The second covers the fallback:
with the provider's software node not yet registered no supplier link is
created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
and the consumer only binds once the provider shows up.

While at it: the existing gpio_unbind_with_consumers() test keeps the
consumer bound while the provider goes away and then operates the orphaned
descriptor. With software nodes now being covered by fw_devlink that would
instead force-unbind the consumer along with the provider, so opt it out
by setting FWNODE_FLAG_LINKS_ADDED.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 273 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..fe984a283318849df26ced1c1e572734f7e154ae 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -3,6 +3,8 @@
  * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
  */
 
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -11,12 +13,16 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
+#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
 
 static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -213,6 +219,249 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.test_cases = gpio_swnode_lookup_tests,
 };
 
+static void gpio_swnode_unregister_swnode(void *data)
+{
+	software_node_unregister(data);
+}
+
+struct gpio_probe_order_pdata {
+	unsigned int probe_count;
+	bool gpio_ok;
+};
+
+static const struct gpio_probe_order_pdata gpio_probe_order_pdata_template = {
+	.probe_count = 0,
+	.gpio_ok = false,
+};
+
+static int gpio_probe_order_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_order_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	pdata->gpio_ok = true;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_order_consumer_driver = {
+	.probe = gpio_probe_order_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that fw_devlink orders the probe of a GPIO consumer after its
+ * provider. The consumer references the provider through a software node and
+ * is registered first. fw_devlink must defer it before its driver's probe()
+ * is ever entered, so the consumer probes exactly once - only after the
+ * provider is added and bound.
+ */
+static void gpio_swnode_probe_order(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_order_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_order_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = software_node_register(&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, gpio_swnode_unregister_swnode,
+					(void *)&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_order_pdata_template,
+		.size_data = sizeof(gpio_probe_order_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+struct gpio_probe_defer_pdata {
+	unsigned int probe_count;
+	int gpio_err;
+};
+
+static const struct gpio_probe_defer_pdata gpio_probe_defer_pdata_template = {
+	.probe_count = 0,
+	.gpio_err = 0,
+};
+
+static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc)) {
+		pdata->gpio_err = PTR_ERR(desc);
+		return pdata->gpio_err;
+	}
+
+	pdata->gpio_err = 0;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_defer_consumer_driver = {
+	.probe = gpio_probe_defer_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that a GPIO consumer referencing a provider whose software node is
+ * not registered yet, defers its probe instead of failing.
+ *
+ * The provider software node is deliberately left unregistered when the
+ * consumer is added. fw_devlink cannot resolve the reference, so it creates no
+ * supplier link and does not order the consumer - the consumer's probe() runs
+ * and reaches devm_gpiod_get(). The swnode GPIO lookup returns -ENOTCONN for a
+ * reference to an unregistered node, which gpiolib maps to -EPROBE_DEFER. Once
+ * the provider software node and device appear, the deferred consumer probes
+ * again and binds.
+ */
+static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_defer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_defer_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_defer_pdata_template,
+		.size_data = sizeof(gpio_probe_defer_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, -EPROBE_DEFER);
+
+	fwnode = kunit_software_node_register(test, &gpio_test_provider_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
+}
+
+static struct kunit_case gpio_swnode_probe_order_tests[] = {
+	KUNIT_CASE(gpio_swnode_probe_order),
+	KUNIT_CASE(gpio_swnode_probe_defer_on_unregistered),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_probe_order_test_suite = {
+	.name = "gpio-swnode-probe-order",
+	.test_cases = gpio_swnode_probe_order_tests,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -310,15 +559,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 					    0, GPIO_ACTIVE_HIGH);
 	properties[1] = (struct property_entry){ };
 
-	pdevinfo = (struct platform_device_info){
-		.name = GPIO_UNBIND_TEST_CONSUMER,
-		.id = PLATFORM_DEVID_NONE,
-		.properties = properties,
-	};
-
-	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	/*
+	 * This test deliberately keeps the consumer bound while the provider
+	 * is unregistered. fw_devlink would force-unbind the consumer before
+	 * the provider so use the FWNODE_FLAG_LINKS_ADDED flag to opt out of
+	 * it as a workaround.
+	 */
+	cons = kunit_platform_device_alloc(test, GPIO_UNBIND_TEST_CONSUMER,
+					   PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
+	ret = device_create_managed_software_node(&cons->dev, properties, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_set_flag(dev_fwnode(&cons->dev), FWNODE_FLAG_LINKS_ADDED);
+
+	ret = kunit_platform_device_add(test, cons);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	wait_for_device_probe();
 	scoped_guard(device, &cons->dev)
 		bound = device_is_bound(&cons->dev);
@@ -350,6 +608,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3

