Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8A3AD52E
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265324; cv=none; b=ZKA9QDXy4WOjmH3EMEcNJn8MVTWfcFeo7HPtx5N9HMuHovc5zOspRt9G74eJBU6rksDaY9Hc0tIqd6rdGDg7cHfFbDBx2v5Fj7Kxoq29HUeOyBAFckY137pB/jQB9cNC+vTFiqZ4H+uW4cts39Exe45qkuw90AemwRJG6KrVj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265324; c=relaxed/simple;
	bh=7YnHenPV9LU9HH0oXXRrIPZLMPovAnvfYPI2d8UeBlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBnSWM4hvW8uANptgjDVJYTyDuIzWPQJwggG6a1dtC6BHx0UzVoOnvrmO8dsTXEwQ17tcqy2myrvln1JXfkB04S9vT/h5QtcQuV5rAZ3eEB6KXObQqu+h+Kh8kJJ5VMIxDGCcINjAnUfiq5S6IEalUTPQTB1FaRL0CkY4jFaZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4DJMNey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNgDI0N/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4DJMNey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNgDI0N/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76OX21636927
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=; b=Z4DJMNeygAkXxtNq
	iO2pLmNFXClM3oS0SEAqNzp+9N7c8iJQkajRB+kxrgRneEorfqYLokvL2jETkqvU
	dmlpACn1nrzDNKFoiOukl7DmEMaA9ec4A52AU0A7vZQz9YSzgfqpZCIuHOHTiCER
	AkqNO7a4kOpKmxHCz2UYARqkVGn+vD4WjPib+muRd4ywCQEGhcd//KATJar8dxF1
	Zm/a8It9J4EhgJZLuTTors55DQH9kut3aIv3FoG/U0EttPhLyZ5m98qsqbkcObfx
	M9UnoWsJr0pxQB4EsRbSWKXnFPAEVrY+wREW2sXxhfOXhsDQSGm0mFSkPYxYTvNj
	s+AOIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sbn9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 08:22:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so58163681cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 01:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779265321; x=1779870121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=;
        b=eNgDI0N/oowLEEHlBfP2mTLLRSE83WxzOPQxblk2NfTaTqlVHKNsvSJGq99P2U2niu
         cHCmzYwj2AokGF8SxE+3ByK9zKcmmnm0BsEFHMOHY6E9NYNK1naYYmSAIGCgh3wfXxXq
         VAnQjSSrcCsN5u2T8Evp06zzgIyocaqgOJ3WfnDCVT+1hS774cNCVkCR0f7ezCkmT6nD
         6fyEfe45plOkkq2tEaeY9wPxVLwFjqbO9ZSTZXfVoilhRpMKY813l3rdJDlTEBuBms3q
         8qHO6Qw5/b2pl5L8Vk4aEkLr4dFdesPxqTfFf11871q3yXC+Pt9fCt/WtW2CdUSYCCxd
         8Yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265321; x=1779870121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpOoi3K+3WVMMUDmiIwOSuu1JgGomDZPzYqit1n/jaQ=;
        b=ooJByvo2OoO9tw1Rw68iqwY4cs8YmLCeR8oYvyGDM5o3G3giGCw1muQPz9bFTjPwnO
         xeazb6owAIXnndgo/UwFfgzbYauij8CltxEGxFm+OlrKFdeeJpV1Xf6+7oA9lQFWKa73
         jbgnViJ3baEDPkkcWFvZSR7BgPsg7kjcVsj5eNzKUXC+NrFyxBZoqLmvIx2VSSwpQi+u
         FhY2PkqSFYY/fUIa31aVLtwRzh3zb4julOIcXKd2q5T+zRNHFjvysN0FMjdNRoT15FIx
         4PXy2vhQa2jNCDKk6++ejygxI2hEXKxxcD86aqv3K4mAMZqhoVm3l1u1Wf/09bxMvJVR
         Y//w==
X-Gm-Message-State: AOJu0YyBTtyK4fr9RoFy5nCX9FtyyqFluF3JvBcyIfcexp7b1GzsbzYG
	s9ifZ0JWXOEEYeofytM+WXk9H8yhZPgRCUNEddZrl2VZz1de1ZECm2OTnAV4hsu2rCpIih1azV/
	7ajaWSwEztqSPyJhHWDtbdG1qijulhEAiJSx42Ee13t826wxOVNT3Xeevb6KwaGelj0ho5Eo=
X-Gm-Gg: Acq92OFIP2tV5SMg6RqI1ZP2jxgrTNuL6pRCiXsofA983xalL7CF7oAAlzZBDTHUApP
	8QCPqkF8tadLbyA1AeFceIdVxm+4X6mymCGoSRV9WsizcV5zh8zssqpQa/2v+9WjVwexT/zJLo5
	nSsKFaqLsTJw4NLs4A8bPNteEJChtD4XmN8ivt1mKY+rSnrN23wi9br98Pv181LFdBfky3lQAHp
	SWhjSZr9sHY9jxaAftaKWNBO8KXV7hsPCKDDHMd7WFAm74gaBZXq7gP3SMjGnzEVRUY7ZzBGBZC
	4ewzQKV82t7psQIVUU0qHt2S0lTi2pt4U48sr9HTkzHmcyaKCGNhFA4vPryF6KP6k7Owbt8oTcu
	mCccXQ2Ja+JBx/VD4tfsNPrQ9lciAJicHMa/Q96DuCaPJH/peonY=
X-Received: by 2002:ac8:7d94:0:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-5165a06cc9emr309616721cf.24.1779265321060;
        Wed, 20 May 2026 01:22:01 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-5165a06cc9emr309616481cf.24.1779265320531;
        Wed, 20 May 2026 01:22:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm51518570f8f.5.2026.05.20.01.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:21:44 +0200
Subject: [PATCH v2 3/3] gpio: add kunit test cases for the GPIO subsystem
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-gpiolib-kunit-v2-3-cc9db39881da@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12281;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7YnHenPV9LU9HH0oXXRrIPZLMPovAnvfYPI2d8UeBlQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDW8gI/iaMdqQ/KV4g0LGQ8ZlJrF0UnNUamtnE
 ZERCPYkRZuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag1vIAAKCRAFnS7L/zaE
 w9b8EACsL/Ck1loTwXkLmCXe62SuVGk3AFngor/BrY4VZo+Eq2s1Yst72Yb6nd5bNtwT17gfIs2
 1Cwi+O3zOTP7E7bSogcxQi8dsNTfjLvuu4gvqGda0yi051b5Ej7TYMVtQU/bMnvFPNBG8vEIzv2
 oA5HoiOggnmXgd7EUKf4FVHIfh7xuLSXVna7zHLLyk7MW57JbuL9yVDycyNIuylP+qDFyeG8Ag/
 ObFB3DT9LO9curOsxZWFPvxneQYCjTpE9OB8LHy4sjK9YQv7NjjlEjk0DpIkeaBtLO/zGyRwEH4
 It0P6WBWPIOjh7+jx0FB603wbKHk67ima7YLKd+/dz87AWPiXCcs3kVCmh3i2usbyVws9iHdWZT
 fYPIi6ZWXTzeQwMpe8sI65h0YUSKFZShrcKct18V/qNs+qJ56jMcyXaZ/8qy/Vs8DWc1EhEEHYU
 mJ5/rBtCrCPROnM+eOcF0ro8gmq8YZh2LV0iKgwbgnOVipKg/GG8WHqjY3hAbQ2ssQpZ059eKzR
 XwaAA7X2F1w7rBAh4oHkQLuTptcTH1zHq1X7/JzrSZQqnPDHCeRCXrv/zgTAJQeJsWE0UO0tDc8
 AjhFuhwU+VaQwAUktetLD5RKR+A9pMxaMdqoNWWWYe6CATAbbbZspd52mAKljKwZzVzXprW2KqG
 qVZpxKKHFCmGhiA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3OSBTYWx0ZWRfX7IJnirwXrI++
 Bdx/B5Ss28gMllDDJ+qfbWDWpMB6bkWPtUUfvqmLaYrT1U5+vfXpP+/mJB5ekX4AL3y8v2ZGC+E
 T09ibxe2mvH5vBlPbdraDdcu/8iqMJA3qaRo4V6tkx/kYMZdFYxhCIHCylxiiXXMDDNXX89agC/
 jphCPkv6nZLCOhC3/NphELu3gA7VdC/M7K9f141MWPI24oIbq5bQspVpet6cSyeZii34ZKhoswK
 rTUXvxUYtuAnSv+vT3MeRQwybYxWE0DWrpFVqrAfwB9ajYdiJ+0uUI3fGK+qgglUxiUGdSpP7Y3
 QE+jmBH6tC5l1dHs8Z4yIn98twh8ZireZWQcvB0G3YFA/OVXGndR+B/gaR4EVr5GuFY5EORk1gH
 MC3MkameTVRjnCd83mVn1IjM/7Tkm9O/lbnBH3CnUybMh9VtlM5j+O7oW1uYr6a6/1iHUZpSuRw
 UuAbyWcBFIlZ0pCl32Q==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d6f29 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kd_SSO-Pc4bEN0uSuqsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EEuXludmAA2xTpiGCY-cX3kRyLHdZv1y
X-Proofpoint-ORIG-GUID: EEuXludmAA2xTpiGCY-cX3kRyLHdZv1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200079

Add a module containing kunit test cases for GPIO core. The idea is to
use it to test functionalities that can't easily be tested from
user-space with kernel selftests or GPIO character device test suites
provided by the libgpiod package.

For now add test cases that verify software node based lookup and ensure
that a GPIO provider unbinding with active consumers does not cause a
crash.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/Kconfig         |   8 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpiolib-kunit.c | 358 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 00fcab5d09a4294ed778cea78af5867a0f6e481b..0306005fb7d65ae85905e967b9065fd74db753db 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -102,6 +102,14 @@ config GPIO_CDEV_V1
 	  This ABI version is deprecated.
 	  Please use the latest ABI for new developments.
 
+config GPIO_KUNIT
+	tristate "Build GPIO Kunit test cases"
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Say Y here to build the module containing Kunit test cases verifying
+	  the functionality of the GPIO subsystem.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2ea47d9d3dca948e1cdc46965e83b0e1b6de5f70..c66b6dd659b16b80b6bb6b15fac3e3f462dec596 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
 obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
+obj-$(CONFIG_GPIO_KUNIT)	+= gpiolib-kunit.o
 
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
new file mode 100644
index 0000000000000000000000000000000000000000..380b68f879e55433668353bb88067d561142a5bc
--- /dev/null
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include <kunit/platform_device.h>
+#include <kunit/test.h>
+
+#define GPIO_TEST_PROVIDER		"gpio-test-provider"
+#define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
+
+static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int gpio_test_provider_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	return 0;
+}
+
+static int gpio_test_provider_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_chip *gc;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->base = -1;
+	gc->ngpio = 4;
+	gc->label = "gpio-swnode-consumer-test-device";
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+
+	gc->get_direction = gpio_test_provider_get_direction;
+	gc->set = gpio_test_provider_set;
+
+	return devm_gpiochip_add_data(dev, gc, NULL);
+}
+
+static struct platform_driver gpio_test_provider_driver = {
+	.probe = gpio_test_provider_probe,
+	.driver = {
+		.name = GPIO_TEST_PROVIDER,
+	},
+};
+
+static const struct software_node gpio_test_provider_swnode = {
+	.name = "gpio-test-provider-primary",
+};
+
+struct gpio_swnode_consumer_pdata {
+	bool gpio_ok;
+};
+
+static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
+	.gpio_ok = false,
+};
+
+static int gpio_swnode_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_swnode_consumer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
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
+static struct platform_driver gpio_swnode_consumer_driver = {
+	.probe = gpio_swnode_consumer_probe,
+	.driver = {
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+	},
+};
+
+static void gpio_swnode_lookup_by_primary(struct kunit *test)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *pdev;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
+		.properties = properties,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static void gpio_swnode_lookup_by_secondary(struct kunit *test)
+{
+	struct gpio_swnode_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct fwnode_handle *primary;
+	struct platform_device *pdev;
+	bool bound = false;
+	int ret;
+
+	/*
+	 * Can't live on the stack as it will still get referenced in cleanup
+	 * path after this function returns.
+	 */
+	primary = kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(primary, NULL);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = primary,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
+		.properties = properties,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static struct kunit_case gpio_swnode_lookup_tests[] = {
+	KUNIT_CASE(gpio_swnode_lookup_by_primary),
+	KUNIT_CASE(gpio_swnode_lookup_by_secondary),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_lookup_test_suite = {
+	.name = "gpio-swnode-lookup",
+	.test_cases = gpio_swnode_lookup_tests,
+};
+
+static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
+
+struct gpio_unbind_consumer_drvdata {
+	struct device *dev;
+	struct gpio_desc *desc;
+	struct notifier_block nb;
+	int set_retval;
+};
+
+static int gpio_unbind_notify(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct gpio_unbind_consumer_drvdata *drvdata =
+		container_of(nb, struct gpio_unbind_consumer_drvdata, nb);
+	struct device *dev = data;
+
+	if (dev != drvdata->dev)
+		return NOTIFY_DONE;
+
+	drvdata->set_retval = gpiod_set_value_cansleep(drvdata->desc, 0);
+
+	return NOTIFY_OK;
+}
+
+static void gpio_unbind_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	blocking_notifier_chain_unregister(&gpio_unbind_notifier, nb);
+}
+
+static int gpio_unbind_consumer_probe(struct platform_device *pdev)
+{
+	struct gpio_unbind_consumer_drvdata *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+
+	data->desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->desc))
+		return PTR_ERR(data->desc);
+
+	data->nb.notifier_call = gpio_unbind_notify;
+	ret = blocking_notifier_chain_register(&gpio_unbind_notifier, &data->nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, gpio_unbind_unregister_notifier, &data->nb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static struct platform_driver gpio_unbind_consumer_driver = {
+	.probe = gpio_unbind_consumer_probe,
+	.driver = {
+		.name = GPIO_UNBIND_TEST_CONSUMER,
+	},
+};
+
+static void gpio_unbind_with_consumers(struct kunit *test)
+{
+	struct gpio_unbind_consumer_drvdata *cons_data;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_unbind_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
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
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+	properties[1] = (struct property_entry){ };
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_UNBIND_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
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
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	kunit_platform_device_unregister(test, prvd);
+
+	ret = blocking_notifier_call_chain(&gpio_unbind_notifier, 0, &cons->dev);
+	KUNIT_ASSERT_EQ(test, ret, NOTIFY_OK);
+
+	scoped_guard(device, &cons->dev) {
+		cons_data = platform_get_drvdata(cons);
+		ret = cons_data->set_retval;
+	}
+
+	KUNIT_ASSERT_EQ(test, ret, -ENODEV);
+}
+
+static struct kunit_case gpio_unbind_with_consumers_tests[] = {
+	KUNIT_CASE(gpio_unbind_with_consumers),
+	{ }
+};
+
+static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
+	.name = "gpio-unbind-with-consumers",
+	.test_cases = gpio_unbind_with_consumers_tests,
+};
+
+kunit_test_suites(
+	&gpio_swnode_lookup_test_suite,
+	&gpio_unbind_with_consumers_test_suite,
+);
+
+MODULE_DESCRIPTION("Test module for the GPIO subsystem");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

