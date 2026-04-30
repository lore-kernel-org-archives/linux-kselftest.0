Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA323A9629
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535188; cv=none; b=LKz37iov9OVsoYTZ4Bfm/Qjtz46auXl2optUfmyEubY6G/USKf+rzyVmmem/xXQxCy09hway+ohNnwT1YArz+6A//71aEi4B28SZ0ro+Dkdg8IgjKzIo5K9oIQXmNIT03QbzfTmo7Ofvj/GfUw3az3agrfd30I2OiDbljbCOF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535188; c=relaxed/simple;
	bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duymL9obLQ5bszf1V1/FYtL4SjHCdY5UGnyDvlVyp5+lTo/h7sFT3MeJ484Tu+njiHRbw72YmpMGsFt8u0UrZqtW/d3kGihZ2LDfFjTC+TdxuTSRT/BYGd5I5P4HQygRnN+T4mlEGIcHnOvAzvrhy3tJbBAjDwWd8X2IH1AiMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afcE2Nah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE/9G2n2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afcE2Nah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE/9G2n2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59Jk42907492
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=; b=afcE2NahFTka7BEJ
	CkqHwAjfphrGRqwXXEfkjS421Z0/IZet+pxrGIfzvqaaxiWvc1Aa6wtOWzpdBv88
	GIBvn5QHSTsLJTYG93NZ/tgRoBFJi7tEiClBJwJtVO7TqIM4hHN3H7IVdblkzfvT
	6kcNIUpeau61kNnRp1l8nTXblyGivpy1MefRURu7Sghh+5R3aa8Ba2y9QHJslYII
	J1JYtSTqKD+bLRPI9o3xRhkv00GhhCESuD1KyePnZEaTRg4xqIslKqu5dZHQoUxd
	RdhJ1iOmpOj80UW3QfDQyek80c4o/YAQuG+IbihAytDlJ0a0pjWMx61xqZVONQz3
	Jk8TsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf8hb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 07:46:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso14004421cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535183; x=1778139983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=bE/9G2n2tAKGt2K3hW7rghikTek3HZPlbpZPRT5IEsp992GFvz+1I1LfB+NccqTGW5
         FFhN3Kl8QbdHGbsUjgVZJjxw8COjPeXdT1bkCQXEqte+VH3yrl8krxK1flDe9zKJKx7Y
         CO4XwCHDih698zALSulmyDSnAaeB5mJYpMD+VQlAmeU6L1L1goGMA7L2dw2rnenuTn3Y
         HIeDvszGuVRPyTbh//ADGtIOm90ad/A+IlFt29teEIWm+uIChcdUabwUpoujmyUa0bKw
         gUUXaZrGMxILUUGbO7fGBEzJOb1Tn8nvgqqHYG1PpFttXK2a+Vs05RNTzBRbLJ26AaDF
         VO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535183; x=1778139983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=pH07OAcs9gYW46B3uWHjsuIMWS4ye7rRWRcvuU6s8KTCCMpsxhJwZWEYVv9FQuNIEa
         enffUtEPO0MHU+OeGaEj3WYOvhQRf8WI27L5IVhQ2t+tvWNFIpV1vQv8soOLWA49DLZ6
         yl3WfosXr5boPgKMA4xcr0MRNaz+g83nKHyqWMMDESnnwxy5U+aiQPvSndBxvUeaeCEP
         LDXOgZuAv4Yl9xs9MKbPDeLWG0wQGG5+RvW4UUZ4s6MaFKY7pVUusEvHpiq3ySXOtKly
         W4DhNMVrzhWHR24zHz8t0SNP+EoExT6p/ZW3QUkXOyOykXLBvFW+vL8sXXew5DQ5S7gi
         QJoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gpmPJK2hgu70HSHvBswFEthOGIyfLN2Rk7vh9RDnD6OO4lWpCLVqK3mdodYrBXLHEtqUoNYCNXA7NyjPrP2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMIg/FdlyZ4I9GguVidKa5EDAb0J6NCDhFrZJX5JEKGrSldZ+g
	GypKVg2DlhUpks1u6jm1KncHKoxJ38hOW4iux+OiOMyfp4qAyT3XMYf65jIGgnkaQUi4tyvMn90
	WGYJT8jga76NPxkU6KGdCyifCJJzXEmalT9xiyVaDw7rKF2MtASRCNcecQIB6ZZqk4PxW0/fYfd
	zOTsA=
X-Gm-Gg: AeBDieupio3mfshybWxcQHA7pTnbW7GYmCPHECK4teQGZwBrHciXADAh5FbbUAYd5u2
	5RXjop5L7tYQFLAIKIRyLqsdBM6oZ7PEa7h9Ewcc1wGVAUVVmSIHGjL2mlTuEGpmdhMm6b67l6/
	M0TPSUP+kFq27OSfRv1d7WhV6IX5tffjAwPKgF9yiVAFWUDq8AtVYmcEqZ8S3H4RlgnC+H38Lzv
	YPxBGp6WCHBwq4x9OBTCnwS5raE6jKHxYkPUxDujVpJ+/bKV6f6MH9PIVbcvSgKV5IuAiAeaZ9X
	KiD3GwY5yu+KLIWij0LoQM4hSp//z46jqlaapuz6kHDAnnt8gMwUZ5Q8bj6Dtq3s4NZ6O9YCEX/
	JqGCl1Kj9OWMrwHX71Yb8F29toLsqr6BabFRRTr0DUOHoZNKlEiyM4Vniv3Xp
X-Received: by 2002:a05:622a:1649:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5102aaf8c62mr22664931cf.10.1777535182983;
        Thu, 30 Apr 2026 00:46:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1649:b0:50b:4778:ac60 with SMTP id d75a77b69052e-5102aaf8c62mr22664561cf.10.1777535182507;
        Thu, 30 Apr 2026 00:46:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:46:05 +0200
Subject: [PATCH v4 2/3] kunit: provide kunit_software_node_register()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-2-01574da0aed3@oss.qualcomm.com>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
In-Reply-To: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wjG4LWnpl5HGfVVOZ6PBIjYsxHmWZz+BysSn
 mcqVbAduDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMIxgAKCRAFnS7L/zaE
 w1ifD/0cvTNmatAEAtSQJ6hCjOITJQt9OMIRaQYby9TNG3tbFUUgkmawvBzfVNvcgsAt9quWOd/
 H0asnxBXL/pk5aSoQz1El0I5x0KBlpNTd+WYTksN47q7Eq48oBVB1K8jneuSpJT2HFogKsC8izs
 xfLuivW7vySa7sISNJailwBmGWbfrGiiuTBCsOmIFyuJmj5dOBmj74r6fDsRy645v5mQOFYHgRF
 YtWJh2aZS/59iZOmgdKHy+iE8l+V8JBDqzABJXUINwBHd34Z/Hh8C3Ho5+xVxjIhQgZRhWM8bxc
 IDkdlK0OIId8ntLQGPryXCMwXqnSoPWOp6IrFhN53KD9rd5PQ+kfcU7iCFXokI/QtkymJseLRWM
 3sRB6/drvRjYMRP/0OHCBNQ54TA6ZIvJe1JGc61qhP+z7Zn+5th8927CreJAske7v4iGgRv/Yyi
 IKUDc4/Wt/HHMbPMsBdL/rdi/C2CqRbM9kmq5aJs4rwxnEgYfEnMmTLhgG5znykkUh7fg4osOsr
 cs7FGJQn9opuhXKZzxX7NirDiZcmIXCckTdY46yhLy5m2H32KEEOIF3cQbyoaQQy7u6AzvaLmFt
 grkiIVoFpz2tvRas1sYMCckyK8zYlkVb6JNyQETOnlnbbsaqnBR+sSYEGN9KGYzIbQoFASJIsIg
 LisL5a3Wvbb4u9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfXyoE952DaeWaT
 esemWezH2ioO9CMwFHMDljz3VV/1s3JPMxEC3ZqefDAvN3zugQ2qkSDu2Rd7Dx+dT5+GX+BzmU1
 /PaSwYX1WIZAZz53dVV/oSv7NZ6YnVzFMA1pLjX2obiNSNY+RRaywHm4EEHQLgkqKCsPrljioBO
 X4CipKnPEB8TML2VDRBC2pwdkg+26Jvnm4P7PcDIyS9FX/xBOXCcP46RfcuSkXONQvKBqK4MKma
 H3ODy9dpOawRNF1MTAyw/4v7wu8w+/kkP1ewzB2UYh1QwC5QCFWt3sNtmiT8y8ayDBVJTQXvf2+
 TTM4DvAI6h14bVxwBDAy02MTeXGdliXneaShp2P3BV4xpKtyYWvJL6h95XGawn+UUTLvVvn0VVs
 15KqgoClie1rN2VidNaSq8YPHJVNlL02oJEFlikCIUL/+/3pn9Dyl1EV9GI8xuc9opex+V5RFPE
 AyEGF3zRTYi3+6rb+6Q==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f308d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0NWOcHYCwBz2ZqcsIPkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _gf3FMAGCtSBlacyDlMZVXrJRUdDl7Fs
X-Proofpoint-GUID: _gf3FMAGCtSBlacyDlMZVXrJRUdDl7Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300075

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

