Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505861;
	b=H+lfJIB4cnR6GiO3f1rHLfhQcQPgAhrvYC4SBuor3Jml/oe6uALMXPIGaq+cWFo2J+/H
	 KCC29DBrl8HnWuqlMPD7W89GZgDHdoOopBOfsg56KcQXArEyxGm/2jpd9dtFJthZMDuKq
	 thjXibZE7SCc8FNYgLYckmtj2gUygZcRi924ZVKcT+SlsLJ+3zcbE/OobarlPYlvyujJD
	 kYOXBZ3hbXqYbelCeB5s3Kl1G64FIb+0a285U6MCGJ7B8Pl/jjq9HUOFM4GS6WrbPX9ir
	 QQ4TAdVO5hOboxOwnvQbsd9++63cPsPaX3XkbP84/PYWcBl/CmWTG3ZvnzmYmXNoCFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=;
	b=ZjPBY8aXuV5OH6KWp/3dupI23zJTvQw1pT99BQU/IIrcZCD+ZAqp2oG0JK4tnVrhLvpD
	 DucBCHvgI82aMhhIl9oWA0tj3nmc7c7VVjb25TaKpimA9Ay0kuq75yXyypo4UnV2PCdm7
	 AYbnMt1YPwzVd1U7cAm+YLs02WLdPoQis1vFUvlINEpip8Ygo7e2JvQzCSNn2Jj7BjYKf
	 XwYZ4ULQi0Y/dsQSX6XCpi5wpof2GqXuaEomAVREp9ZvGBprx19K57hx94Rzm68giopLM
	 mwJ7WoQU5m22k5shpYBGQDXRwG8IS2BrXp96jF83Zqvm6M4UEippa6ILzjYFtuUE0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HgTU9/O/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eu28FxZz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A289606AA21
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A289606AA21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HgTU9/O/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eu28FxZz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9twW2809577
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1NDBcYoeE+s
	SJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=; b=HgTU9/O/2Vlzvei/HDHzQCwgv79
	5GKISE2mAhdmqyBEdXw/cwFJ/VAlbLskloD/kBgGq5jDV+gD11g5m9a5HzsR1qT5
	P6E5BsSTxGg4YcTPSTxN1x8AlxoA2BQe6WlQmprZEWpxmAoBuO6Iqw6w244BbUfg
	iXefClq6N94eTp6K/Ecw9PAVlOAN5GIdDGnsp6X9H8hufHhWuBCnlNvJ3O+doQP0
	LjG+OJS1qeqFlHEaGyAbGB31cRyK4XwZXcl/7ZL4Q75aG85zuJtfKk1w45YZQa3k
	TBwFAekXSUTtAcda0VPGPPGbEWEUNYQ1JuC833XfYvi730eAayCWvMsr+nQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2v6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so674231085a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792505859; x=1793110659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=;
        b=Eu28FxZz6v5n7ZC3W4zlh0NH7x7mktgrXcL0BrCjfecE7jmnYpBxEHEIT+Y2yTL/4c
         nq2HxIRQxCn4OezExFVZZxG03+qtFZfnp7jmFy+MzDF4FwS62OzQbXsi3xDKDw7vuHCk
         ugmJpbfbO0/bVwyMLUicsJFK0lM38H/AlrWBesjMFIyC89mMKVnxN1Mjrd1KEzR/CmN9
         imL7jAaRWKGur+ddpChpr8VKzJH45uV1an1scpGiXFgk40T9de/NY6pfmVuKn1KmseVo
         cEV213h7yP9bdBXGbSgYRY9MLA2TIpWkqucvcU9y/82oEinHMhuw9BpGK/7GNvNAGB1T
         qjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505859; x=1793110659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NDBcYoeE+sSJBb2f8lqRgiwhotRgd/vtsQ8UHxnhhE=;
        b=iqBe9AksaPkreYJoWx4uK76Fm2Jso+mCdEOsdfSmZmIeBSMiTDnFnSomgxQ/f4JUX2
         qE9UYs9cJN7EURkUazZ4S3DemXr85I46LoPN2oSvLiT1/mHddDJWqIWVgB6LExHStHQ5
         rkvESFz6vogNH2xJHbPQj3EytLOYYuzABQJO3dtBPVEWpFAcReH8yRkoCB/Ltal9jdWg
         VWPNUp+9QDLsIAKHYYVtdmhw0+35pV2hfW71U1mtOvEALmWYNh83zKQ70iQJZjSJOGqf
         PardC/U9HlBi4ZqFMbk6WFKxYFeWIuV+4hKuCD83AHlO6987AfZ2MA5tiFwiwfx7jlqX
         o8ww==
X-Forwarded-Encrypted: i=1; AKwUvByR6aH2OOKw1y2BTto2k+bH5FuIMI4Dxgn2EzJyWSSPo8RYFOZ8XEnUD0PAMWs3QD3GLBNhjBOB/QrhPJnwZ5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbyE6OYrl3TSRem3l2uJVqaYZBU73ipDk4j3px0+Qmf+2bWxdn
	NJzCmBClc5DmgWXRi3AQKIEfLKoBxdyxpbQXrunQb5MEkxeCg5HbtcJH8ZfybxbRUThHv5L5gPW
	k66ilkqvmU8JSogO8KSJRmrzx1Ut1pDEST8m5oV6ro52W1EgPkO9wELZQzaomIIx4986pVj0=
X-Gm-Gg: AYBFou3dT5JUnKK6orOj/n71FpQ75PHnLyKU7a8Xp+dLIi144o54oUyx7Ts2VZPDJ1j
	U/SK2kbYCcXabMu9vrsz0aPDWl2L2+EcF3RLPOJHoNBoW8tFrDJaZqMxsn2lYBK2cdJB6i1v0MK
	6TYjcQsTc9mwochiYD0VQH9bw+ae0FjqIK4Wo017BT4i/XaY41XOSQ1+6Bls57LhupZOckotWm9
	mvBy8pqBE9ra2rsMLnCPk4Lflx9OisBFxOup9FOgphIi3lyD0q0JtuSKyh1SnOm2RqHRgVwtWpo
	K9rZTxScnDvgvrGUOjeaf4m4f9ytbY8WJmVVxL0UyUVgBmcIQHmnBjz2EiHzeH/UysJmpf4kE9p
	pa4DUib58M/0BfXosTNaVpLgpEVw=
X-Received: by 2002:a05:620a:c4f:b0:93e:6c02:d181 with SMTP id af79cd13be357-93f29cefaa6mr1839545485a.14.1792505858400;
        Tue, 20 Oct 2026 07:17:38 -0700 (PDT)
X-Received: by 2002:a05:620a:c4f:b0:93e:6c02:d181 with SMTP id af79cd13be357-93f29cefaa6mr1839537185a.14.1792505857796;
        Tue, 20 Oct 2026 07:17:37 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810043sm6642276f8f.16.2026.10.20.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:17:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org,
        Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v3 2/6] selftests/powercap: Add powercap hierarchy creation API tests
Date: Tue, 20 Oct 2026 16:16:52 +0200
Message-ID: <83799bf79e85e9e2ab77140e632f11d96b17a04f.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1792504834.git.daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: enW_S_9qc32np48TuDo8HPaYYScmSzrv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfX1y3OGiLeK9Ec
 3N2VFZ78MjaquEGOJr82cxkXcNEH7mpnhXgHMvR6GsVtoaw4jpbZyWpxVi9m0kTSXTpKkGERK/d
 5usA8mmQ32XJtmonLJBnyJArLB5ZeP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NiBTYWx0ZWRfXz+/hUWUFNpWA
 fgSL203VOQfGMHuQZVBgjicXeoPn7KfYEdfobYLtEcLzy4RFcTay0P7mNX7WHV/zy69tywlrZOd
 veT4y8QZNfeoUVV4JOV+uGRUT3ylqXjgjUl8WlNoq5ILBD+ftmB7tmQQG7LZVfSj3kHNhaRgmsC
 19WY76vKPx/6WghgCzKBqixN5mWZGkctnCjHOBY0LdaH9B2rhQ2npYWEPxVN4dEJRcmyr9qrZmU
 H+PpNguJJrRP2hCkkgm3iAi7rd660vnKMm1nLGsfDcGaxuazhhHZRkPYPglyfnRvug6ZQd3gVin
 Hzi+/vzLDDoPW0n35bWT1b8PWpqCRYgkqc9N/ef3+MfNUGTRuqdHKTCKgSvUlwczqbyN7RGn4YI
 Qv414uwkKcfMOIfhq5y14O/F7Mg0AV8n3Gcmhr9oDmTS+G1abJQZkccnkaXS1BdOgkKZL4z2C3u
 RpscuzVS6UquGcXEdNw==
X-Proofpoint-GUID: enW_S_9qc32np48TuDo8HPaYYScmSzrv
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad77803 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NQaYcpb_sPWQE13iVsoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200056

The powercap hierarchy API introduces generic helpers to duplicate,
instantiate and destroy a complete powercap hierarchy from a static
description.

Add a kselftest exercising this API. The test builds a synthetic
powercap hierarchy composed of a package, three CPU clusters and twelve
CPUs, registers it as a powercap control type and checks the zone count
and selected sysfs attribute values. It also checks that the controller
directory disappears when the module is unloaded.

Exercise direct static creation, duplication, skipped clusters and their
descendants, reuse after partial destruction, and repeated creation
returning -EBUSY without replacing existing zone pointers. Callback
checks verify the controller, name and backend-private data supplied by
the helpers.

The test consists of:

* a kernel module implementing a synthetic powercap hierarchy and
  dummy callbacks;
* a userspace kselftest script that loads the module, checks 16 zones
  and their power and constraint attributes, unloads the module with an
  attribute descriptor open, and checks controller removal.

Use powercap-owned zone allocations so registration failures are cleaned
up by the core. Build generated module files in the selftest output
directory and extend the common clean target with Kbuild module cleanup.

This provides a regression test for the powercap hierarchy helpers and
their integration with the powercap core.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806110159.69690-3-daniel.lezcano@oss.qualcomm.com
Assisted-by: LLM
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Use TEST_GEN_FILES and MO=$(OUTPUT); preserve the common clean recipe.
- Use powercap-owned allocations for consistent registration cleanup.
- Keep validation and counting in the main shell so failures propagate.
- Add static creation, skipped branches, reuse and -EBUSY checks, and
  hold a sysfs descriptor open across module removal.
- Document the tests and describe their actual assertions.
- Fix closing-brace indentation and __initdata placement.
- Add Assisted-by attribution.

 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/powercap/Kbuild       |   3 +
 tools/testing/selftests/powercap/Makefile     |  27 ++
 .../selftests/powercap/powercap_hierarchy.c   | 305 ++++++++++++++++++
 .../selftests/powercap/powercap_hierarchy.sh  | 126 ++++++++
 5 files changed, 462 insertions(+)
 create mode 100644 tools/testing/selftests/powercap/Kbuild
 create mode 100644 tools/testing/selftests/powercap/Makefile
 create mode 100644 tools/testing/selftests/powercap/powercap_hierarchy.c
 create mode 100755 tools/testing/selftests/powercap/powercap_hierarchy.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index bc4fdb6f5337..764cca6182ce 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -104,6 +104,7 @@ TARGETS += pidfd
 TARGETS += pid_namespace
 TARGETS += pipe
 TARGETS += power_supply
+TARGETS += powercap
 TARGETS += powerpc
 TARGETS += prctl
 TARGETS += proc
diff --git a/tools/testing/selftests/powercap/Kbuild b/tools/testing/selftests/powercap/Kbuild
new file mode 100644
index 000000000000..baa0d0ba9593
--- /dev/null
+++ b/tools/testing/selftests/powercap/Kbuild
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-m += powercap_hierarchy.o
\ No newline at end of file
diff --git a/tools/testing/selftests/powercap/Makefile b/tools/testing/selftests/powercap/Makefile
new file mode 100644
index 000000000000..5041ff1acee5
--- /dev/null
+++ b/tools/testing/selftests/powercap/Makefile
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# User-space test script
+TEST_PROGS := powercap_hierarchy.sh
+
+# Kernel module built as part of the test
+TEST_GEN_FILES := powercap_hierarchy.ko
+
+KDIR ?= $(if $(O),$(O),$(realpath ../../../..))
+
+.DEFAULT_GOAL := all
+
+include ../lib.mk
+
+.PHONY: modules
+
+$(OUTPUT)/powercap_hierarchy.ko: modules
+
+modules:
+	$(MAKE) -C $(KDIR) M=$(CURDIR) MO=$(OUTPUT) modules
+
+.PHONY: clean_modules
+
+clean: clean_modules
+
+clean_modules:
+	$(MAKE) -C $(KDIR) M=$(CURDIR) MO=$(OUTPUT) clean
diff --git a/tools/testing/selftests/powercap/powercap_hierarchy.c b/tools/testing/selftests/powercap/powercap_hierarchy.c
new file mode 100644
index 000000000000..baabd2420f9c
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
+ *
+ * Powercap hierarchy description test module
+ *
+ * Test coverage:
+ * - Duplicate an init-only description for use after module initialization.
+ * - Create and destroy a hierarchy directly from a static initializer.
+ * - Skip a cluster and its children while creating independent branches.
+ * - Destroy the partial hierarchy and create the complete hierarchy again.
+ * - Reject repeated creation with -EBUSY and preserve existing zone pointers.
+ * - Check callback arguments and preservation of backend-private data.
+ *
+ * The complete hierarchy remains registered for powercap_hierarchy.sh to
+ * check its 16 zones and exported attribute values. Module removal destroys
+ * it so the script can check cleanup with a sysfs descriptor still open.
+ */
+#include <linux/powercap.h>
+#include <linux/string.h>
+
+struct pch_test_data {
+	int value;
+};
+
+static struct powercap_node pch_test_nodes[] __initdata = {
+	[0] = { .name = "package",
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[1] = { .name = "cluster0", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[2] = { .name = "cluster1", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[3] = { .name = "cluster2", .parent = &pch_test_nodes[0],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[4] = { .name = "cpu0", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[5] = { .name = "cpu1", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[6] = { .name = "cpu2", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[7] = { .name = "cpu3", .parent = &pch_test_nodes[1],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[8] = { .name = "cpu4", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[9] = { .name = "cpu5", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[10] = { .name = "cpu6", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[11] = { .name = "cpu7", .parent = &pch_test_nodes[2],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[12] = { .name = "cpu8", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[13] = { .name = "cpu9", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[14] = { .name = "cpu10", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+	[15] = { .name = "cpu11", .parent = &pch_test_nodes[3],
+		.data = &(struct pch_test_data) { .value = 0xDEADBEEF } },
+};
+
+static struct powercap_hierarchy pch_test_hierarchy __initdata =
+	POWERCAP_HIERARCHY_INIT(pch_test_hierarchy, pch_test_nodes,
+				ARRAY_SIZE(pch_test_nodes));
+
+static struct powercap_hierarchy *hierarchy;
+
+static struct powercap_control_type *pct;
+
+static int pch_test_get_max_power_range_uw(struct powercap_zone *pcz,
+					   u64 *power_uw)
+{
+	*power_uw = 0xBADC0FFEE;
+	return 0;
+}
+
+static int pch_test_get_power_uw(struct powercap_zone *pcz,
+				 u64 *power_uw)
+{
+	*power_uw = 0xC0FFEE;
+	return 0;
+}
+
+static const struct powercap_zone_ops pch_test_ops = {
+	.get_max_power_range_uw = pch_test_get_max_power_range_uw,
+	.get_power_uw = pch_test_get_power_uw,
+};
+
+static int pch_test_set_power_limit_uw(struct powercap_zone *pcz,
+				       int cid, u64 power_uw)
+{
+	return 0;
+}
+
+static int pch_test_get_power_limit_uw(struct powercap_zone *pcz,
+				       int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static int pch_test_set_time_window_us(struct powercap_zone *pcz,
+				       int cid, u64 power_uw)
+{
+	return 0;
+}
+
+static int pch_test_get_time_window_us(struct powercap_zone *pcz,
+				       int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static int pch_test_get_max_power_uw(struct powercap_zone *pcz,
+				     int cid, u64 *power_uw)
+{
+	*power_uw = 0xDEADC0DE;
+	return 0;
+}
+
+static const char *pch_test_get_name(struct powercap_zone *pcz, int cid)
+{
+	return "my constraint name";
+}
+
+static const struct powercap_zone_constraint_ops pch_test_constraint_ops = {
+	.set_power_limit_uw = pch_test_set_power_limit_uw,
+	.get_power_limit_uw = pch_test_get_power_limit_uw,
+	.set_time_window_us = pch_test_set_time_window_us,
+	.get_time_window_us = pch_test_get_time_window_us,
+	.get_max_power_uw = pch_test_get_max_power_uw,
+	.get_name = pch_test_get_name,
+};
+
+static struct powercap_zone *pch_test_create(struct powercap_control_type *pct,
+					     const char *name, void *data,
+					     struct powercap_zone *parent)
+{
+	struct pch_test_data *pcht_data = data;
+	struct powercap_zone *pcz;
+
+	/* Validate the arguments and private data supplied by the helper. */
+	if (!pct) {
+		pr_err("Invalid NULL controller type\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!name) {
+		pr_err("Invalid NULL name\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (pcht_data->value != 0xDEADBEEF) {
+		pr_err("Invalid pcht data != 0xDEADBEEF");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pcz = powercap_register_zone(NULL, pct, name, parent,
+				     &pch_test_ops, 1, &pch_test_constraint_ops);
+	if (IS_ERR(pcz)) {
+		pr_err("Failed to register powercap zone '%s': %ld\n",
+		       name, PTR_ERR(pcz));
+	}
+
+	return pcz;
+}
+
+static void pch_test_destroy(struct powercap_control_type *pct,
+			     struct powercap_zone *zone,
+			     void *data)
+{
+	struct pch_test_data *pcht_data = data;
+
+	/* Destruction must receive the original private data and a valid zone. */
+	if (!pct) {
+		pr_err("Invalid NULL controller type\n");
+		return;
+	}
+
+	if (!zone) {
+		pr_err("Invalid NULL zone\n");
+		return;
+	}
+
+	if (pcht_data->value != 0xDEADBEEF) {
+		pr_err("Invalid pcht data != 0xDEADBEEF");
+		return;
+	}
+
+	powercap_unregister_zone(pct, zone);
+}
+
+static struct powercap_zone *
+pch_test_skip_cluster(struct powercap_control_type *pct, const char *name,
+		      void *data, struct powercap_zone *parent)
+{
+	if (!strcmp(name, "cluster0"))
+		return NULL;
+
+	return pch_test_create(pct, name, data, parent);
+}
+
+static int __init pch_test_init(void)
+{
+	struct powercap_zone *zones[ARRAY_SIZE(pch_test_nodes)];
+	size_t i;
+	int ret;
+
+	/* Keep a runtime copy whose parent pointers survive init memory release. */
+	hierarchy = powercap_hierarchy_dup(&pch_test_hierarchy);
+	if (IS_ERR(hierarchy)) {
+		ret = PTR_ERR(hierarchy);
+		pr_err("Failed to dup the hierarchy: %d\n", ret);
+		return ret;
+	}
+
+	pct = powercap_register_control_type(NULL, "powercap-test", NULL);
+	if (IS_ERR(pct)) {
+		ret = PTR_ERR(pct);
+		pr_err("Failed to register control type: %d\n", ret);
+		goto out_free_hierarchy;
+	}
+
+	/* Exercise direct creation with a statically initialized hierarchy lock. */
+	ret = powercap_hierarchy_create(pct, &pch_test_hierarchy,
+					pch_test_create, pch_test_destroy);
+	if (ret) {
+		pr_err("Failed to create the static hierarchy: %d\n", ret);
+		goto out_unregister_pct;
+	}
+
+	powercap_hierarchy_destroy(pct, &pch_test_hierarchy, pch_test_destroy);
+
+	/* NULL skips cluster0 and its descendants, but not the other clusters. */
+	ret = powercap_hierarchy_create(pct, hierarchy,
+					pch_test_skip_cluster, pch_test_destroy);
+	if (ret)
+		goto out_unregister_pct;
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		/* Node 1 is cluster0; nodes 4 through 7 are its four CPUs. */
+		bool skipped = i == 1 || (i >= 4 && i <= 7);
+
+		if (!!hierarchy->nodes[i].zone == skipped) {
+			pr_err("Unexpected zone state after skipping cluster0\n");
+			ret = -EINVAL;
+			goto out_destroy_hierarchy;
+		}
+	}
+
+	/* Partial destruction must leave the hierarchy reusable for a full tree. */
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+
+	ret = powercap_hierarchy_create(pct, hierarchy, pch_test_create, pch_test_destroy);
+	if (ret) {
+		pr_err("Failed to create the hierarchy: %d\n", ret);
+		goto out_unregister_pct;
+	}
+
+	/* A second creation must return -EBUSY without replacing any zone. */
+	for (i = 0; i < hierarchy->nr_nodes; i++)
+		zones[i] = hierarchy->nodes[i].zone;
+
+	ret = powercap_hierarchy_create(pct, hierarchy, pch_test_create, pch_test_destroy);
+	if (ret != -EBUSY) {
+		pr_err("Expected -EBUSY when recreating the hierarchy, got %d\n", ret);
+		ret = -EINVAL;
+		goto out_destroy_hierarchy;
+	}
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		if (hierarchy->nodes[i].zone != zones[i]) {
+			pr_err("Recreation changed an existing zone\n");
+			ret = -EINVAL;
+			goto out_destroy_hierarchy;
+		}
+	}
+
+	/* Leave the full tree available for the userspace sysfs checks. */
+	return 0;
+
+out_destroy_hierarchy:
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+out_unregister_pct:
+	powercap_unregister_control_type(pct);
+out_free_hierarchy:
+	powercap_hierarchy_free(hierarchy);
+	return ret;
+}
+module_init(pch_test_init);
+
+static void __exit pch_test_exit(void)
+{
+	/* Remove zones before their controller; the script checks disappearance. */
+	powercap_hierarchy_destroy(pct, hierarchy, pch_test_destroy);
+	powercap_hierarchy_free(hierarchy);
+	powercap_unregister_control_type(pct);
+}
+module_exit(pch_test_exit);
+
+MODULE_DESCRIPTION("Powercap hierarchy test driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Daniel Lezcano <daniel.lezcano@oss.qualcomm.com");
diff --git a/tools/testing/selftests/powercap/powercap_hierarchy.sh b/tools/testing/selftests/powercap/powercap_hierarchy.sh
new file mode 100755
index 000000000000..6d1394a7d56b
--- /dev/null
+++ b/tools/testing/selftests/powercap/powercap_hierarchy.sh
@@ -0,0 +1,126 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Loading the module runs its in-kernel hierarchy API checks. Then validate
+# all 16 exported zones, their power readings and constraint attributes, and
+# removal of the controller while a sysfs attribute descriptor remains open.
+
+ksft_pass=0
+ksft_fail=1
+ksft_skip=4
+
+MODULE=powercap_hierarchy
+CONTROL=powercap-test
+SYSFS=/sys/devices/virtual/powercap/$CONTROL
+
+fail()
+{
+	echo "FAIL: $*"
+	exit $ksft_fail
+}
+
+skip()
+{
+	echo "SKIP: $*"
+	exit $ksft_skip
+}
+
+cleanup()
+{
+	if lsmod | grep -q "^${MODULE}\b"; then
+		if ! rmmod "$MODULE"; then
+			echo "WARNING: failed to unload $MODULE"
+		fi
+	fi
+}
+
+trap cleanup EXIT INT TERM
+
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+
+insmod ./powercap_hierarchy.ko || fail "failed to load module"
+
+[ -d "$SYSFS" ] || fail "missing $SYSFS"
+
+check_zone()
+{
+	zone=$1
+
+	# Check required attributes and the deterministic values from the module.
+	[ -f "$zone/name" ] || fail "$zone/name missing"
+
+	[ -f "$zone/power_uw" ] || \
+		fail "$zone/power_uw missing"
+
+	[ -f "$zone/max_power_range_uw" ] || \
+		fail "$zone/max_power_range_uw missing"
+
+	power=$(cat "$zone/power_uw")
+	[ "$power" = "12648430" ] || \
+		fail "$zone: unexpected power_uw ($power)"
+
+	max=$(cat "$zone/max_power_range_uw")
+	[ "$max" = "50159747054" ] || \
+		fail "$zone: unexpected max_power_range_uw ($max)"
+
+	constraint="$zone/constraint_0"
+
+	name=$(cat "$constraint""_name")
+	[ "$name" = "my constraint name" ] || \
+		fail "$constraint: bad constraint name"
+
+	pl=$(cat "$constraint""_power_limit_uw")
+	[ "$pl" = "3735929054" ] || \
+		fail "$constraint: bad power limit"
+
+	mp=$(cat "$constraint""_max_power_uw")
+	[ "$mp" = "3735929054" ] || \
+		fail "$constraint: bad max power"
+}
+
+zones=0
+
+namefiles=$(find "$SYSFS" -type f -name name) || fail "failed to list zones"
+
+while IFS= read -r namefile
+do
+	zone=$(dirname "$namefile")
+
+	case "$zone" in
+		*/constraint_*)
+			continue
+			;;
+	esac
+
+	check_zone "$zone"
+
+	zones=$((zones + 1))
+done <<EOF
+$namefiles
+EOF
+
+#
+# Count the number of powercap zones.
+#
+[ "$zones" -eq 16 ] || \
+	fail "expected 16 zones, got $zones"
+
+#
+# Keep an attribute open across module removal, then close it afterwards.
+#
+exec 3<"$zone/power_uw" || fail "failed to open power_uw before removal"
+cleanup
+exec 3<&-
+
+#
+# Verify that the hierarchy disappeared.
+#
+if [ -d "$SYSFS" ]; then
+	fail "$SYSFS still exists after module removal"
+fi
+
+trap - EXIT INT TERM
+
+echo "PASS"
+
+exit $ksft_pass
-- 
2.43.0

