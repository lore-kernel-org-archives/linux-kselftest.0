Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351137F75D
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946349; cv=none; b=I40SLUcdU2cDv4dPnsZIcdJ8Dwx61WBqj9sDiLYufQ/cdWFRAMdu2gRY09WEzWouaYEL9CtRef9oPSTu54uPDk8Gckjdvxcqc7+5Ir2IMz3SaPI4hPEguN+QOfWyU1PtKaq6mihoTU7q3jHjEJ5vC6WalXg27BEceb3KiVXwOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946349; c=relaxed/simple;
	bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhZT1VBJXPsm42OgRTEQQ3etgMYYet4TwAdvn/5O3uEwrmcUlE6IDRVtf1U1o/nS721inlfKXzr8J/NRaTnb/UbUZUJLRgfg1plGnN9viDjNKpo4bkUOxiw7nXN+h96/xG7g8aSQnB2JMZsYaVq1gI9n+Mk0jgQwog0qYW+VzQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIhol+67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcEv0DpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIhol+67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcEv0DpW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94tak2319631
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=; b=HIhol+671TfNhcF0
	iAMpbgTTIz2Twn5CiyPdiEhPMtJdMeQCHw84ftNR0BYCApO7vjkJ2yu1XZurFRB7
	CHWzGrlNlGBJF8XGLaZ6TBG3l+1+7OHnvqFCq0J6YopYHQ+Z3LRSEUUwMoNGLv3g
	VJOfSDQrlyhMzu1GJ9fuGNUdPwLg3MNLyFv+2jkgEEnKocTlWql7IcZaD62VqzRm
	f5wocODrhG1KlZWPdq7gM9cPh9SspAPTbJQnzv8vidHhBO+wWuvlLvx1U30Sp3Jn
	s8g4LqrjfXA9zAp1VyIfIn9lOp3+8FWHdzJTPZhlPY68F/XMEey+VqRlHfxZ6pHS
	BzyfWA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrrdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 12:12:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-61010bc9c12so2988009137.2
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946343; x=1777551143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=BcEv0DpWedJOO2puE8G8rABSDv+x8/jMuoikFNLbC+o1y4SYa8MrJhFzYJI5L4IQpE
         Cej3DQDuHVzQVkg5RwBEo+VyetxrO5Em3UDXCk/yEnKT3rxk0KWJbb+w+DV8pG1J9cnc
         hZAMaF3AswWxPmKm6Vjx6ock+fbO78NUB9Mlis+WzZ2+sULho4wK9qrgiANyAg+/QEV6
         huhBDZPdwdA8pbwVBVg5wgiHQyy9ELfbdmPnmLD/3UDo9PHOoOatjhyhYZbBsauc56TK
         QYtT9Gl/twyja8P1Y8NFKaHRAPfEVVplRaIkJD0LbcIf46TToSaObs2zkpZ+/ASwPsxK
         Jkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946343; x=1777551143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=DlsmZ25KsoTm0/j8vr1b1lZdksPp92ls8mlG3XpenazxMR3VpXBV877WhdBMV+wS5Q
         cmPG/aqC9tuZ7ZPTr3OQrw3nV6Q48VoGntfOMxM9ctPSzrTo8JrHeG18Mqa3+qJhTi1/
         4U5PAeJzdg+QAB8JLAmpa/xHqWhtE5agUWplAB36ZaQR3TqqdTeOTid8v2Opj843Z4ZX
         TZDJn6VsESQ3YOq6qKQWJGX1x1P93MYUiD2tH5nAebIloLw7SlxWX3gqJ5qiM0lYsF2d
         DSKfzE8P3eLVpHetuKleY4bReaAZeJaSWMHSRH5W6ojK2it7ivODpmFZj/Hy0WFvzrPe
         ddqg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZNgzJiqvSz8Ngxn0Oe/8f+wdgOkBZQha2f/5i4Re3LVchpwoiKKskN1k5Hq3NJF76b03kCJhinPk0Mowp3Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxww2BTmWfqQjOBtZ2ZDSZNuDhJNoXAEIZF8YpZI8d9kG9jFUgf
	W1ySOJXZn6GpGbnIHO3fK5vh/43jzqvRDb8LlkNewmnMBHHs/BRfVP4aEH7HpEPSuuG3IRA3Sf9
	xRoVRD5r6VCIhNGE6NLp/QzAqJhAEyH3PbXBXsp7RzsEEutob2uvFxptIi/V6WcigVq2VYA8=
X-Gm-Gg: AeBDieumsu1u7VnUP1knIqUJWB1OevZNy0ZpPXSOgHdiIhBs5BHzyH8vn98ZsNBXDL6
	6aYnuC5+eIen7asEYrbqdK7RgLqpFKdFWeTF95OnS+YmL8U4ZwQ2Vu7JzqoZkt3aja1uo2WCtJ3
	UFVm8Sr/vArfRF+nU5FPDVR8DaD3Fw3Qke9P29DNm1fUT4AY5XVI57NiNsTWrVVJmQFrBf1ZSNu
	2099+5IhZWcDkpbQ1tdcUzk0s5WgNO1E3o9tDEaz0K5OOzeLVq4+TKI7VaPcxkXOG3Xf0vYfnDv
	ev9tPmUH8FWm771ddqi6LxKOhczsMp3TZ9IcxplG0JBKEcl5AB+kBkYpFt7+bnCIff+mbL5PBYZ
	NlVet9/h2YI1oNF5SjLkJN2R+zB3gk9Rcq0DYjT2GbMhWRIeKDsJJsap7Y1X77w==
X-Received: by 2002:a05:6102:441f:b0:611:82b:a594 with SMTP id ada2fe7eead31-616f4f742a9mr11774513137.4.1776946343451;
        Thu, 23 Apr 2026 05:12:23 -0700 (PDT)
X-Received: by 2002:a05:6102:441f:b0:611:82b:a594 with SMTP id ada2fe7eead31-616f4f742a9mr11774503137.4.1776946342965;
        Thu, 23 Apr 2026 05:12:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:12:03 +0200
Subject: [PATCH v2 2/3] kunit: provide kunit_software_node_register()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-2-0e5213cde2ed@oss.qualcomm.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gydWozYlB8JZk4hwE8vQPB00YTzpXKRmFelb
 PKtewnzoMSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMnQAKCRAFnS7L/zaE
 w2QqD/9B1Vct/6IRC/j4NApvRWjYQehb6gccubkNkNOEFJ1AQAqefM8FUqqaEQpQ5a3wX1FWBCx
 3LH6cfUbvQcdghjWsI+TzENB+/OaAkdj3xdjhlv7AJLiBu18fPGkWD53PzUWJPA4np3FUcxa1sF
 KwRbVqZghkqd9aais16O+YNUV8x9usQJKvSrMwa2JH7TgUJWPYy9XsG4p+8ywWD0Vucb3EwiAcx
 XOGwrlMl37WOTONGZZWZ5Ieqg9rPbaHBk7nL9q55Y7I3mzrMf1YaWUXmOCje1a5bLMC8qcFxv6Q
 UYtLwhWncKGIob3BwhaSb76V38nDsBRx7af3t7kf57MCwDeRpVW2Z66BYEc1NYYcd288CeYP0b3
 CTJbi4ggihzTAND5cwikObtbkb8A6VE7umgOSIMM/xfte45MXahKtBq5jRI5iaHnjmnIS2pAIQL
 baa3Kr/+4LV9+QWeA+Po3fvMFt2lWiToYlLE9u3S2COsdydrwiTzZTOZniBjTNni/Boh/ESpe36
 a4LHQneC8KIZWHUZaYD17CZPu2LSfgwvzn+r4RFC1+wQBSIRxpuARnGo+ctPDZ7wnlMtMlYYPzA
 yJEuZmA+rBwrNyXVZfYixmkn/eFuWfWMzprUqQ915/7BwjZGERiA9p/TJl97AaWeeig5kKfLWv4
 6AH5rEaJ7byy78Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vQToMyX9OzreFXPa3YFHeFU0rAcuP0pL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfX0NrMyB7Y5Q0Z
 DTqcLZRsD9rQNnllUvHEHCqb+PsVDoC2LLJgaAwtZxZurN2pXSJyesFaShgZtu7hSfUYrn8Mk62
 DqlSaJhHjOCK9YT+HUKjSPnDRf0oqTuMaz6gq6ExjCPJM17qBe0NWVRTy+V6TGA0QqyRnP7eSkV
 iZurZxzz0al2giT9f+FJcKFmkPYbXv+Ce7baXYXMvMvfZI1VJ7LZ+aeSJ87aNy9GSzRciOC7MmJ
 02s9UQH+JjO4MGHPE5E0RzeCJ26siMv+xG2ZVr1Jqx+Fp6gq4jPrOq03UvnnenGD+BQz8TjEezb
 /vY/1EaiQnecTdqOOMEGV7tRmfpMU3lu6eKZZ39PLzFKtv2eI+m4ArX5gdvqEQv24KNWycMoHr/
 4vfu7GpCb1xCWDZ0OGoIBlQMpAuRmkxRprJnGymKCXLMzWJm62g3RuSis0ioLkbuo08975O6ZAR
 wgjgEYaWOqVo0dAmZnQ==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea0ca8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0NWOcHYCwBz2ZqcsIPkA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: vQToMyX9OzreFXPa3YFHeFU0rAcuP0pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230121

Implement a helper for registering kunit test-managed software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h | 19 ++++++++++++++++++
 lib/kunit/Makefile     |  3 ++-
 lib/kunit/fwnode.c     | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..e1554ace64b8a5899aff9f4b4247e5157826a49b
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct software_node;
+
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 656f1fa35abcc635e67d5b4cb1bc586b48415ac5..7549a701791b5b7eaa8e0637b6818cdfd0b655a8 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -10,7 +10,8 @@ kunit-objs +=				test.o \
 					executor.o \
 					attributes.o \
 					device.o \
-					platform.o
+					platform.o \
+					fwnode.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..bc8bf06762dd71a741a3419c1ca04028d6ad3ec8
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+static void kunit_software_node_unregister(void *data)
+{
+	const struct software_node *swnode = data;
+
+	software_node_unregister(swnode);
+}
+
+/**
+ * kunit_software_node_register() - Register a KUnit-managed software node
+ * @test: test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Return: Firmware node handle of the registered software node or IS_ERR()
+ * on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, kunit_software_node_unregister,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);

-- 
2.47.3

