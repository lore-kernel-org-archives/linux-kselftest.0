Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1856A437852
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342485; cv=none; b=rIOdRfUURRJ/zDusUFDz0sJWzblrpUvEC9+W0zRa+dVqL/r8NQyYbDid7+UAwKz0VAkiWl9t8rK6tamNd+G8pLZp4A6uAdXbHCk5MnfWyTS4VKkjzcQIGO07n2Uva6A0J4nv7Iwagn1/KTkAlNtRXSQlIzF5nXCeLnMVObLsr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342485; c=relaxed/simple;
	bh=phmFEdyOZod78by6YVJXqWGwH37Tp/3wv2Cd0/Fsk5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oo/sTyre5FDKY8MwnlSCi+tzAL4+6/fQ9ZQsA27MwRI5sxr73oeTqQS7cm+DnNDGEP+CRFwmnjpxol2x//6w7fc5FAh0vOrpAR/bXwrtu34X/znJUwtuhBLuQf9kUAKZt9p87h5rK2a3/j99jPdEiAxjkicbsK7/XQ8HkU9FIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6WCNhKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fz8C0vgu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6WCNhKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fz8C0vgu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFbk401621
	for <linux-kselftest@vger.kernel.org>; Mon, 6 Jul 2026 12:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sjGkdbiFEyhIcJbivNdLH/SqIiY+zqTcBIMsxvO/78=; b=K6WCNhKBtuN/tE17
	NhITYXTpCDOp3UexZ2O+dsOmWG0LE/WBYKjV+ouDmaZT0UbcsZvAHLkMuwAaybv0
	RXZbdnqmUZ/gyaalI+dlTZihE44YX10O2P2cGhy3SXFlkFFsFylaF04CKQvB+3GM
	tWj5UCIQBPvd7TE0K2+UD5WV9CLabQWrWJ5Wr9H7HemwO6zWYioS1GhKKh0yHcJy
	ct2lDb82l8SklgHmzMB83D0RxZwSTpUHyfQsU71YcsmN3Vx/4Fda1h22F07CjCTu
	SnRRk9osxOAD4QIlu83obB49UCrAPlWX2Y/lkBfyMZ/HCLAERrLANmqkB7Pr7Qul
	EFGCDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grna1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 12:54:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6a2f5995so501608885a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342481; x=1783947281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sjGkdbiFEyhIcJbivNdLH/SqIiY+zqTcBIMsxvO/78=;
        b=fz8C0vguknqA+5wTlVznnAxcv5wVea7LWU5vMFLp5yOfomhyxcblyonCoB4s/n6GM2
         ndfex8kK6n/hbSEuY7z95fH5Qo6lXMu3OZBj0ownqHseoS5pmuzE9hUynKSfhUtYSXo1
         qRDigo6DaRoWZ+34zSi3FlblY3h4EiJL6ZQ2yrltKo2Zsrw49WP6DiARHKG2+JTH0bvi
         vnUca6/6XFHTPFKL8d3PEBAnKowD7d0CmfGB8kMXlh82DWQLu32IeQMx9yeTurG3dymg
         NaViOHCqBG2vsEMI01YwRz42n1WDV1b6kp5g4kBGoJWADloHQ63OL1C5S13uDvcVyBF8
         8aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342481; x=1783947281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sjGkdbiFEyhIcJbivNdLH/SqIiY+zqTcBIMsxvO/78=;
        b=VszFnHgjDoJ5H49GzeW2wQ07ALghTfJeIOBfJk47KU0ocifevtOl+BbWj/2T/xC0WF
         Zu2ngKf9igivnNBNyHeUBRCtgJg8tVQwNKY/y3948x/EUKO4hdT7sIADjNUuyQIfUDUJ
         uboMXxsnr8WXbjGDGGeyGe0szOtUUwpBW7UNApAgJpmAUN33nzF1AVkBbEU9QViiWrjB
         ZUcfvTS6BC1dEgUIL1BCRrNA3MRmq8kVmGpOp+oRl3XWftW4/T4WBuppP30qZLTugqjw
         fOY32ZnpuCp/473WcJD++3IH/rm3bDdytRMz7TCO6bOI/QnSH7Vuj8opvNpQUFSqJmyk
         wMeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIYnXKhQL0u7TxdPVl4LLM/tv65vme99n+vWBlrARI8saBTJ1hkgjkALwk4nLt/Jokq/6fm5wOKcG3tq1IqTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZzxL0xRHkIUalnqraVBMfn0zAHYty+pf3GZizQeikabbYE/g
	rlN2aZ2UQABjgHCywuT4XwWgI+2aY87N/BweEOJoUmPgECslZGY8Qnldp/+OcTvSxbpH5Ogtc3m
	x7EInNMYLc/X3UhEuxLWNwVdea7lMj7ggO5W8IaUPcL2IT2q8f+GPnbGZ59A79A3rqCsdAMc=
X-Gm-Gg: AfdE7cnJLYgIPjkj1fY2aok2lY7IIhMWTw2FxemWR6WyxMaK+kmyJndLd1eUzMRq9Ti
	jiiEHvV+y6EraHDTCjQRpjA7EAfrPaTxEtQmnwPruYO1xg+X9FaiKnw6tQCd6twvKqHlK0rxcVc
	fuViPakeXKj4C1yFSJAL+E9zX7SuQmM2ekf53xSb47WwUhxeusE1q1hpy/1+CbtK8hyxeZb+RRj
	B/Y7oGEvp876bT7gDFZHO4bkKiq7LxLnHrYXwohii97QeWIs6jIP+UlNNNLMKp1SaVavcP/vwaf
	UIXzhrV9QdBaY8XSH+m2yNKshFs2vF3BKqSDpVXFpPOjnNulZ4EVpsqjTF47jDy0C5XBvDhxCjg
	iLIyThpeLev3VgkVFjKxRFPamAjKvVngF3nb4owFx
X-Received: by 2002:a05:620a:2794:b0:92e:7c72:7f71 with SMTP id af79cd13be357-92ebb4e47cemr59343285a.23.1783342480757;
        Mon, 06 Jul 2026 05:54:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2794:b0:92e:7c72:7f71 with SMTP id af79cd13be357-92ebb4e47cemr59339785a.23.1783342480231;
        Mon, 06 Jul 2026 05:54:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:10 +0200
Subject: [PATCH v2 3/5] software node: add kunit tests for fw_devlink
 support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-3-f39b09d50112@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13648;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=phmFEdyOZod78by6YVJXqWGwH37Tp/3wv2Cd0/Fsk5w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WEQdywWVPhkGz5a1Calci/ONhlAOfX1ARlM
 yvmytTznQyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhAAKCRAFnS7L/zaE
 w8/FEACu+Lh+tdC89M3eHhi2o42b1GFrjAwub1RFY0Ue2qcudx76ODabzA/8EP71jCYv1nxGgQs
 rAl1SNzyQX0OCCibxS65KTzTM7y15h+b5PIdJSme585y7WX1xYDFnoTNEJKGW8jZL/iLsfmR5Wj
 fr1bbxCSVKl79G1wyTvIW2JXmu/xXx035RXMT0izLubeqw18RSxqozygAMW7HDs3oVEHKfN40z6
 7sHdDxMLCw+lSP8W6XgTFPIbNnLveyoAeVex0ULm//Xn8e+QwrA5NU1rWaxqKhcPiEQq3ybBmge
 dX4DDkYE1vFpu6codz6pzIfcfgFJ2soV52Z10U74gt1WyU4eeuu6wDDc9NIzHSXuq77+uBZNCNh
 zO+r2lLJkIdMDpt9U3He9CO8Pkz8RgM9RwJuYKzYvMKlAa31NrS3IlxtJRIr6//MU8gjhhzH2EH
 56dkwWJbzwfhWhWfjgpf5erlik4JHOx2wMAZCV9eFqOzmjWbqvwDXxfbwrVh7PbK4wVFcdwxPLi
 caG71lwphAVjhjhXpCdZfSl7IUnYJYTip3APNUMvo4armE33cnhgkaAYYGarVtoVjIwMSqqI+Jo
 J2fnTs33XvRQeExPXFaqNH3jiVZCmedgcRGasRV6atSnzHIH+1BZ15s+uW2KGUX2UwG+nQETlzD
 DnyrTqPBZ/WECyw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: P-ewsdkt7yORomkj0Xak6xtQzCh1UQQ9
X-Proofpoint-ORIG-GUID: P-ewsdkt7yORomkj0Xak6xtQzCh1UQQ9
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba592 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=9zVEpjMGfH8rPmTIezIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX+MmBi4VLCZUD
 0xR8Y1lmzSvemslZnIG+CrtPxvKcHMjh1klMBJ0vntfguybnVioiQ97WPJZgEC14Eqe82lCp2AI
 xYnVIG850p9Y9RjJT3GCgUD7183DGSqaADuPKoM/BCmeO1vBEh3bOb4KAfxkk4wU8teVqITOLHv
 pxoggUDYcK5iknFkVkZ7226QFjMb2eZuvLlAZEmBYscWdJ4YzGgE6+zscWHgBp1BuNsD+KgYRT5
 +3sKcFbXey9QtQ2GHu9+Teycvq7o3i+hBsRKVTSWglhXD3bycLYQYDZhoJMDYxkSQMf1jaWx/Yt
 p7nQ3bGFYzzvS+dHjxwnuIcYa9rTMQLtTCRYzS55RuWABjLPIXaMBayrGGiaRwSBsvtm22Pipwy
 6PIjUVUjaNL3gPRcEHxt6zhY9+vb3eohTQ3qpeqLf+OgI631YbATA8ypO8n/bvker5eQKQxhKnC
 LcLGVPLD+ss3e/I2aBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXyWSeklMBLRFE
 4UJZy1pWn7+gbAtwlRp9wwRlI4PNnP6M1e1/SfrzrKO8ql0kH06TvwAvNMTvdWaaEzgLejMHfkv
 HzA2iaunU2m8O/NhAI7pv8tYQMdrGSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

Add a kunit test suite for fw_devlink support for software nodes.

Most cases call add_links() directly and inspect the resulting fwnode
supplier/consumer lists: a single reference, multiple references, a
reference to an unregistered node, a "remote-endpoint" reference and a
reference array. The last case is end-to-end - it registers real consumer
and supplier platform devices together with their drivers, adds the
consumer first and checks that fw_devlink defers its probe until the
supplier has been bound.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS                             |   1 +
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 4 files changed, 347 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce2447c3e89784b142d998f7384b95..d7741614c941ceed9e46e9caea72bad77cfb7618 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25105,6 +25105,7 @@ L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c
 F:	drivers/base/swnode.c
+F:	drivers/base/test/swnode-devlink-test.c
 F:	include/linux/fwnode.h
 F:	include/linux/property.h
 
diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 2756870615ccab67ec26d8671c1e4dba69342134..1ecf0791241a1b2eee7e1e787772217724abacb9 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -18,3 +18,8 @@ config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+
+config DRIVER_SWNODE_KUNIT_TEST
+	tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index e321dfc7e92266d2073d442f652cadb6e911dba5..9ced7bbd569fc49ba2719aa0cab57c7d8245dde1 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -6,3 +6,5 @@ obj-$(CONFIG_DM_KUNIT_TEST)	+= platform-device-test.o
 
 obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
+
+obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
diff --git a/drivers/base/test/swnode-devlink-test.c b/drivers/base/test/swnode-devlink-test.c
new file mode 100644
index 0000000000000000000000000000000000000000..6f59f13214fcf39cebe02244bd0029470d3d104a
--- /dev/null
+++ b/drivers/base/test/swnode-devlink-test.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/list.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/time.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+#include <kunit/fwnode.h>
+#include <kunit/platform_device.h>
+#include <kunit/test.h>
+
+static int swnode_count_suppliers(struct fwnode_handle *fwnode)
+{
+	struct fwnode_link *link;
+	unsigned int count = 0;
+
+	/*
+	 * The suppliers and consumers lists should typically only be accessed
+	 * with the fwnode_link_lock taken but it's private to the driver core.
+	 *
+	 * These are tests and at this point nobody should be modifying them so
+	 * let's just access the list.
+	 */
+	list_for_each_entry(link, &fwnode->suppliers, c_hook)
+		count++;
+
+	return count;
+}
+
+/* True if a supplier link con->sup exists, checked from both list ends. */
+static bool swnode_has_link(struct fwnode_handle *consumer,
+			    struct fwnode_handle *supplier)
+{
+	bool from_con = false, from_sup = false;
+	struct fwnode_link *link;
+
+	list_for_each_entry(link, &consumer->suppliers, c_hook) {
+		if (link->supplier == supplier && link->consumer == consumer)
+			from_con = true;
+	}
+
+	list_for_each_entry(link, &supplier->consumers, s_hook) {
+		if (link->supplier == supplier && link->consumer == consumer)
+			from_sup = true;
+	}
+
+	return from_con && from_sup;
+}
+
+/* A single reference creates exactly one supplier link, on both list ends. */
+static void swnode_devlink_test_single_ref(struct kunit *test)
+{
+	static const struct software_node supp_swnode = {
+		.name = "swnode-devlink-test-supplier",
+	};
+
+	struct fwnode_handle *cons_fwnode, *supp_fwnode;
+	int ret;
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
+		{ }
+	};
+
+	supp_fwnode = kunit_software_node_register(test, &supp_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
+
+	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
+
+	ret = fwnode_call_int_op(cons_fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 1);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(cons_fwnode, supp_fwnode));
+}
+
+/* Multiple distinct references create multiple supplier links. */
+static void swnode_devlink_test_multiple_refs(struct kunit *test)
+{
+	static const struct software_node supp1_swnode = {
+		.name = "swnode-devlink-test-supplier-1",
+	};
+	static const struct software_node supp2_swnode = {
+		.name = "swnode-devlink-test-supplier-2",
+	};
+	static const struct software_node *supp_nodes[] = {
+		&supp1_swnode, &supp2_swnode, NULL
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("foo", &supp1_swnode),
+		PROPERTY_ENTRY_REF("bar", &supp2_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_software_node_register_node_group(test, supp_nodes);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 2);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp1_swnode)));
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp2_swnode)));
+}
+
+/* A reference to an unregistered node creates no link (graceful skip). */
+static void swnode_devlink_test_unregistered_ref(struct kunit *test)
+{
+	static const struct software_node supp_swnode = {
+		.name = "swnode-devlink-test-supplier",
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("supplier", &supp_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 0);
+}
+
+/* Graph "remote-endpoint" references are excluded. */
+static void swnode_devlink_test_remote_endpoint_excluded(struct kunit *test)
+{
+	static const struct software_node ep_swnode = {
+		.name = "swnode-devlink-test-end-point"
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF("remote-endpoint", &ep_swnode),
+		{ }
+	};
+
+	struct fwnode_handle *cons_fwnode, *supp_fwnode;
+	int ret;
+
+	supp_fwnode = kunit_software_node_register(test, &ep_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supp_fwnode);
+
+	cons_fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons_fwnode);
+
+	ret = fwnode_call_int_op(cons_fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(cons_fwnode), 0);
+}
+
+/* A reference array creates one link per registered element. */
+static void swnode_devlink_test_ref_array(struct kunit *test)
+{
+	static const struct software_node supp1_swnode = {
+		.name = "swnode-devlink-test-supplier-1",
+	};
+	static const struct software_node supp2_swnode = {
+		.name = "swnode-devlink-test-supplier-2",
+	};
+	static const struct software_node *supp_nodes[] = {
+		&supp1_swnode, &supp2_swnode, NULL
+	};
+	static const struct software_node_ref_args refs[] = {
+		SOFTWARE_NODE_REFERENCE(&supp1_swnode),
+		SOFTWARE_NODE_REFERENCE(&supp2_swnode, 4, 2),
+	};
+
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_REF_ARRAY("suppliers", refs),
+		{ }
+	};
+
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_software_node_register_node_group(test, supp_nodes);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_fwnode_create_software_node(test, props, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = fwnode_call_int_op(fwnode, add_links);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, swnode_count_suppliers(fwnode), 2);
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp1_swnode)));
+	KUNIT_EXPECT_TRUE(test, swnode_has_link(fwnode, software_node_fwnode(&supp2_swnode)));
+}
+
+/*
+ * End-to-end test: fw_devlink must defer a consumer's probe until its
+ * supplier has probed.
+ *
+ * The reference created by software_node_add_links() is only useful if the
+ * driver core promotes it to a real device_link and uses it to order probing.
+ * This test drives actual probing through the platform bus and asserts the
+ * supplier binds before the consumer.
+ */
+
+#define SWNODE_DEVLINK_TEST_SUPPLIER	"swnode-link-supplier"
+#define SWNODE_DEVLINK_TEST_CONSUMER	"swnode-link-consumer"
+#define SWNODE_DEVLINK_TEST_TIMEOUT_MS	(2 * MSEC_PER_SEC)
+
+struct swnode_test_probe_order {
+	/* Names in the order their drivers' .probe ran. */
+	const char *probed[2];
+	unsigned int count;
+	wait_queue_head_t wq;
+};
+
+static int swnode_test_record_probe(struct platform_device *pdev)
+{
+	struct swnode_test_probe_order *order = platform_get_drvdata(pdev);
+
+	if (order && order->count < ARRAY_SIZE(order->probed)) {
+		order->probed[order->count++] = dev_name(&pdev->dev);
+		wake_up_interruptible(&order->wq);
+	}
+
+	return 0;
+}
+
+static struct platform_driver swnode_test_supplier_driver = {
+	.probe = swnode_test_record_probe,
+	.driver = {
+		.name = SWNODE_DEVLINK_TEST_SUPPLIER,
+	},
+};
+
+static struct platform_driver swnode_test_consumer_driver = {
+	.probe = swnode_test_record_probe,
+	.driver = {
+		.name = SWNODE_DEVLINK_TEST_CONSUMER,
+	},
+};
+
+static void swnode_devlink_test_probe_order(struct kunit *test)
+{
+	static const struct software_node supplier_swnode = {
+		.name = "swnode-devlink-test-supplier",
+	};
+
+	const struct property_entry consumer_props[] = {
+		PROPERTY_ENTRY_REF("supplier-ref", &supplier_swnode),
+		{ }
+	};
+
+	struct platform_device *supplier, *consumer;
+	struct swnode_test_probe_order *order;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	order = kunit_kzalloc(test, sizeof(*order), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
+	init_waitqueue_head(&order->wq);
+
+	fwnode = kunit_software_node_register(test, &supplier_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = kunit_platform_driver_register(test, &swnode_test_supplier_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = kunit_platform_driver_register(test, &swnode_test_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	supplier = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_SUPPLIER,
+					       PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+	consumer = kunit_platform_device_alloc(test, SWNODE_DEVLINK_TEST_CONSUMER,
+					       PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, consumer);
+
+	platform_set_drvdata(supplier, order);
+	platform_set_drvdata(consumer, order);
+
+	ret = device_add_software_node(&supplier->dev, &supplier_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = device_create_managed_software_node(&consumer->dev,
+						  consumer_props, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_device_add(test, consumer);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ret = kunit_platform_device_add(test, supplier);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = wait_event_interruptible_timeout(order->wq,
+					       order->count == 2,
+					       msecs_to_jiffies(SWNODE_DEVLINK_TEST_TIMEOUT_MS));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	KUNIT_EXPECT_STREQ(test, order->probed[0], SWNODE_DEVLINK_TEST_SUPPLIER);
+	KUNIT_EXPECT_STREQ(test, order->probed[1], SWNODE_DEVLINK_TEST_CONSUMER);
+
+	/* Tear down the consumer (and its device link) before the supplier. */
+	kunit_platform_device_unregister(test, consumer);
+
+	device_remove_software_node(&supplier->dev);
+}
+
+static struct kunit_case swnode_test_cases[] = {
+	KUNIT_CASE(swnode_devlink_test_single_ref),
+	KUNIT_CASE(swnode_devlink_test_multiple_refs),
+	KUNIT_CASE(swnode_devlink_test_unregistered_ref),
+	KUNIT_CASE(swnode_devlink_test_remote_endpoint_excluded),
+	KUNIT_CASE(swnode_devlink_test_ref_array),
+	KUNIT_CASE(swnode_devlink_test_probe_order),
+	{ }
+};
+
+static struct kunit_suite swnode_test_suite = {
+	.name = "software-node-links",
+	.test_cases = swnode_test_cases,
+};
+
+kunit_test_suite(swnode_test_suite);
+
+MODULE_DESCRIPTION("Test module for software node fw_devlink support");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

