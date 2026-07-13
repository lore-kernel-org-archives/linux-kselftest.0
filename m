Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1636404D
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941323; cv=none; b=JyZEex5J0Py6uwSdSJKrGRnzlgbCHSzRLE0O/hhxbcUVD73fi+nyQWs5xv4z7nIRGp0AuD94vMEo/z3s+aCpRk861iKgIwChdvHiM4G+P6kaTTY6b3OG7Lkl9trp6UcPUpiDbvyISsvB2kJxCA5yKZFF3mR945b3nGhK/Qleogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941323; c=relaxed/simple;
	bh=M4tIaAN+u/4O+r4/eLYo0ugmmbDRHjP7x2qa8S0+pY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChRDJYBnYpM90xP06N9QELrLajWNkJj9YPteTxs9YaSFW8EPi6R+fRNWx1CF1gojmEPwFs3wKO/QZ09NEHa3tuXW6I4sASAlWFsQ5l55raNrfNNxpPv00x2PhDMxkMl7uorqz6CRjlbwrSY1EcZZMjeyW7YnPp6IM/Na0o0dfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS8hoZ2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaRkp5i9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS8hoZ2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WaRkp5i9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YlaK794254
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BoEIQgMiFtY635hJNKnlXqv5v2AUYjs+FHaGmN/hMqg=; b=XS8hoZ2lJU8A5xrs
	uHB5QvMlp9ZMRBYX58NLkcJnco73oOaxKQTXKhAuuLWuAMkbcvzBbqAQ/409AhNz
	cc8DZJHlM+HGMAUGjikGUTkFKHBGPvXcVmeKeG4bIz2Ytuq4VReTsL0sYEPAA3c4
	rEwU5VYxFGv05xJ8LhTEmBwiqrnJoGclfFDtpept7SEXiBXwaoJ6FMWaLsKMBdon
	1FgolsYCmNh0gd0s/1drCGbJWLWN7Ek7lMFCurJbQvsb3zGDC1U+wB1krMJbszeR
	g+YZ/vyLZatA5wQAWWpNjQz+VVNT6zlts90raMc+ZbfktY7F2ULEfBnQkDKnWIMc
	3dp2CA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn0s1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:15:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso42209381cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941318; x=1784546118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoEIQgMiFtY635hJNKnlXqv5v2AUYjs+FHaGmN/hMqg=;
        b=WaRkp5i9BvtLbUKIioQ85tMbPdU8lg7jWLQJorfexve3wbxJg/HJXKq11LXfAJ1zRK
         bOidOEoB6VKJJqnLKmMpeoWQxd/2+8o94ZWZNyhJfsXeyW25PZsB0wAL5dKIMWDbcO/Q
         7N2XWSEqFlLz1myG9VpIrXGh0jsHPEDwA/aP7nTtZvuncQrwekcNxWTjt1EETTdtirk2
         d5zChOfNW3qXSquErHquIfRYKiIxj2uPnS2SEvuFYv11ToSRt8KmqKMUeviDgn9unRwN
         cl6FfHdoAtC0fNOvJLzD5IUE5EUekv0PEaMS52WAvFNGMgiR4ACiTCkpRBHRmy4dLIf3
         DGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941318; x=1784546118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoEIQgMiFtY635hJNKnlXqv5v2AUYjs+FHaGmN/hMqg=;
        b=WaI9f4T0IwIDRP5MWaYFWpvSNzdWn2KVCbAycJHWJIuWyjhp2VHuOHwNeZuzAa2Nan
         87dy9aowdun92HP6Zc4q6rMKoftLPN53CoJtVlqgVDjUvyPnTEsLROzToyqMxhG2dbYF
         vT/uTYJaO+kGznyy3t2ChxlQV3GBG7NJ3ygKvDDIaL4lFRlXM7SxUN9PvRC2Ocdq9cCb
         2QYDBiLZW0RwRUY3XNZQB8KsXDXo5yhc+fTBTDhkDrFKOC54GBpnEuMwf275zsgjDpMW
         +Tb2zygqyOfrgLk47vPTpHMqUlSQ+bfTXPQTy14+rRb+CCEJE8t3TXij/X7+JzhmNVDF
         mhYw==
X-Forwarded-Encrypted: i=1; AHgh+RpHTLUu7wIRnfGLt7FjrXzB9SuXhiubKNgbPzE/gP+nQ6b8iHbw7nPATYjXnAqISo3BV53uyKGs7+zY669fK+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mdymNQ8TiUrQqZMAcJJ3rb/dBeHYh1rll6VvMJP5ahD+fYYp
	DmgfsZwaoYvsTK8tZ19bdvtmJUHdNpGK9u9tta12yi66C3uuv7YD78+1YEA4I2oBpBDkkJQs6JW
	OwwewngVJzbNAIO+fdJgsVqKMybrEVJGYpv0oo+Vw0mY9w+/P0rTD8LjLCGHbLPfkoq5Gg0Q=
X-Gm-Gg: AfdE7ckeXzphBIxLAu6DsaYtgfom17Q7tfxzqjSi8v/ZgtBLUeqZQ1UCHWBILhc9wH5
	R7fx+uM0vn9WF+nuaols3I+pzczUK0VXIhzeD2REzOU3/dujKuTXPcdfK7CONH+oC1g4N9QESKp
	yHoRHkrW82AaqTm9XD6RFny220evuv+rubU2qBI/QLTnnG0DPVYAkTLLD2Izbq5IK43ZbmHoK2D
	xd6f1eOieXR73bJO0upykh5YoXygkndVjPhWK2zdrFr6dH2ZlN8K1KPoaB6SjE6EOBe2ZF/7EEN
	W2gpTF7x7Nuu7kO30bdMgcSyXEjAJcqocsWoQdAeSMRYJBj58PWAojZ6SqZVoDkc6szTOmgZnxY
	x84KRSkS3F8GuqkOQxG0mk+SlQsIV8jl/MqulWgKj
X-Received: by 2002:a05:622a:11d1:b0:517:8f98:aaff with SMTP id d75a77b69052e-51cbf21391bmr76953291cf.49.1783941317559;
        Mon, 13 Jul 2026 04:15:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11d1:b0:517:8f98:aaff with SMTP id d75a77b69052e-51cbf21391bmr76952731cf.49.1783941316924;
        Mon, 13 Jul 2026 04:15:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:48 +0200
Subject: [PATCH v4 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-5-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12330;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M4tIaAN+u/4O+r4/eLYo0ugmmbDRHjP7x2qa8S0+pY0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMizwoYQj1TLjHYs9DxF1o2IwFlNrdpA+wnsc
 /Le20hbtriJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIswAKCRAFnS7L/zaE
 wwpYEACL+whKRyMrZNhi5YI0oLa64iEUkutzrCBFiUU6tQlS9CiXlIBmtBzNxTrtl6/rAUJz/aj
 EdvJk28jw4pztb04rIfwyfY1e35thyVnsYAD64eOTtqHrnBsYm7nQD399bRTYnQbp8tzG56MeRw
 PfdBUf9nq3ULJcPJLUEu8MU+p50vhxhgDC94Pf3YrMwyJimOYAqbO7qXBSzcllz1H3ZIJ/l1cxN
 yEpnmLlzuJzly8ZkBSiPfHmCao9xlGHm2AM8eCyx8mSsB6+F0D+xoCqdpTgaW4unxw1rZW6yzg1
 /BKxlnpgFQnyeguBRfvhByBq9Kb1Y9+FGwsnaTIcR+i3ZaZaQNwBsf3Xu7tT2ysWb74jBx8/9ZD
 tM5Yxq/SFh3+cnEKd+tsX2eDWQhYk7AXgM4FUHPcd/gZ+cOiWVLWGVBMlnXqniuRjVu2/7CQpbr
 IMarKeVoJA1vxZvIw0PjDcf1NtB/OpzZnMJSSLBrOSdS3Hkx/Surwd5TpQPotpzxe+/HN76jlir
 jkOLKNQZXxtBJUoeUEMlI47zqiFHLpO3C90HuGSi0ht2g0sUgfgo/XIkTaYb4rjz0rwfRVGHoDk
 SSkWjwtCP7L3O33X61PG3xTkMcXcB/wn7bpyVoZc8gcJ18bL3xNFhplVGFP7CZDBYUaN/7jrUBZ
 4+5VoCTIpAeSjJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vwY0fD0JvvEjqylsHxMxrtYe3SH7AMVm
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54c8c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=nzuXsxulAAAA:8 a=EUspDBNiAAAA:8 a=r134EpD-t8S8Nhkp70wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX+6uPZOcCI6K1
 ms2uAL2etHZzECdh+5BxL+WExA04uzyd18mF5Oe+vDy+Bhp2trsBV9lkNFVb7+cacV7+7fzNSBs
 KfYFSHWRva2vVEK5/rik5fhKL3Sr+fE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX0ELkb5TQEAHx
 1+4oJtJcYP7CpPlhqGOy+e2pOI1kf2+/UqI3+L70H0VfRv2d3RJMWnFiHV+SxfAhRebjMIA7JBi
 XocmwTZRPcdTCcQVSJSugtZdpIkvdDVL39xrum4jHTnqVTiOdY6KddkBt4BKEzOdEuwCp5D7iLl
 rgHwOoUaUEDDxaoZlICxWUaPfqkaGZLw65ZJhZfmkd87cdwOZzWd1vKqZ2a34A3pV10IAQLxM4l
 3ohbPtThnAvGjyeAbiWwNJcOa34w4yXo+2jUB3GgbxUE4v+7TJ/obCKWH7hhmH1WrTqXcM11saC
 wXhBdTq2hKFrhz4Om9piPfpBhbdifL3/iaYnMjQeCD20N5VjwYnAvqpSq90Is5DhDu1C2wupZWO
 3sm94joqXfJzfA+DU1q8bidhXoWHk+8FDgol/flX1UjrAtIKbkhPjm78HPxnLrftojh7gwcGlmK
 GPxJrx5Bga61DKWKMzQ==
X-Proofpoint-GUID: vwY0fD0JvvEjqylsHxMxrtYe3SH7AMVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117

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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: David Gow <david@davidgow.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 291 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 284 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..6c25561c1e9b104b4049965b70fb5c044051570b 100644
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
@@ -213,6 +219,265 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
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
+
+	/* Tear down the consumer before the provider to free the GPIO. */
+	kunit_platform_device_unregister(test, cons);
+}
+
+static int gpio_swnode_probe_order_test_init(struct kunit *test)
+{
+	/*
+	 * A prior test may have left a managed device link teardown queued on
+	 * the device_link_mq. Flush it so that software_node_register()
+	 * doesn't spuriously see the node as registered and fail with -EEXIST.
+	 */
+	device_link_wait_removal();
+
+	return 0;
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
+	.init = gpio_swnode_probe_order_test_init,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -310,15 +575,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
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
@@ -346,10 +620,13 @@ static struct kunit_case gpio_unbind_with_consumers_tests[] = {
 static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 	.name = "gpio-unbind-with-consumers",
 	.test_cases = gpio_unbind_with_consumers_tests,
+	/* We need this here too to clean any left over links. */
+	.init = gpio_swnode_probe_order_test_init,
 };
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3

