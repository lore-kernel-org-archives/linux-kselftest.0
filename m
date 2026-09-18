Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCF390222
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709052; cv=none; b=SK5kMCcj3ki1Fq9uNBl28TVy75Ky5HtiKN2wxoOBA86EolDAzjgQoKKZBc5ST2eDbqHQfWDlDBqvZQ5V87xFMacqKMlOMqWx2UuhdlgDmLrRQyaBIW5jPy6su6vgEi46qXIUSjlSs6ryVDyngjc10UMCptkIGPcqTVhLGKJIauE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709052; c=relaxed/simple;
	bh=ZTt/gD7kWLLL6huIYW1HxVDqTv4lUsHcd3HBN6kOVrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYNRYLujWqsWgx4lSlajDlafe4ureFBIe8Bjd6jFzewiCWo0o+OKzkGeUa0o6X+1DepcM4xVKzU1qez8rEQLsL784+c+ggec4xgnG1nFgkwttHWRr5GG3ksCZivmoDhBMHDwTJWqVMAnxDBceHZN3tvS4JMke4OUcsUk7m2CJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jsfy+Llt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jsfy+Llt"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VRoN042714;
	Fri, 18 Sep 2026 05:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=flOoCeiIYmtIwmF7m
	KO1K45FYQZ6Mrfw6jpQatZb2GE=; b=jsfy+Llt/yBhbQRXtGCyVcNNiOFX/VX45
	xaagFmye42xRoT3MOitw/nA2ZDsSVOoA6IfD2xn5WmCtWNbjeNRdCiUwdtqiZv06
	gC7J776HGjQEr+9FHGKT+iJ4pMqVKVbfgNGvSnWs4Ni7T3RmW3e5reaZXUAcBLuf
	Iv/EHWsF2KRqoLYEMiJL7NkWJyOaossfdJhwAffa9cJOVq1mwZRLoWmIQttqbet2
	rACX2gECvgTDdGoAr2ClH7061hH5mNizdRiiFWbbTGGFPGe6KlpRvblxg+LFTIHx
	vHwZthqoEJEuml8tCuueDXQXc8NggPpJ8stN+yWro5K/iIQ8dQ9mQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmx846c2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:24:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Z7JQ009697;
	Fri, 18 Sep 2026 05:24:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gr5ffdwk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:24:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68I5O2db32178560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 05:24:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C913620043;
	Fri, 18 Sep 2026 05:24:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02BAA20040;
	Fri, 18 Sep 2026 05:23:59 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com.com (unknown [9.66.68.7])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 05:23:58 +0000 (GMT)
From: Shirisha G <shirisha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kselftest@vger.kernel.org, maddy@linux.ibm.com,
        venkat88@linux.ibm.com, shirisha@linux.ibm.com
Subject: [PATCH 7/7] Subject: [PATCH] selftests/powerpc/rtas: consolidate TEST_GEN_PROGS definitions
Date: Fri, 18 Sep 2026 10:52:42 +0530
Message-ID: <20260918052321.932660-7-shirisha@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918052321.932660-1-shirisha@linux.ibm.com>
References: <20260918052321.932660-1-shirisha@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX14qVpEkVlSrO
 I6jYUEuX8Wc5PrnZa3p6LpBpDyZliqTmff9oGifaxhRqVZwu6ZWdSfrwoK3Ik0ttyjvJ9obSE5J
 Kqgyemn94AXGj6c5u6liflpkj71XH5aEYdixAQIHi/sKiw8XEMxmnZpeQGTiXBozpFGZ29lxC94
 LxmMkMEaucEwBNMtz98I0TCMiAMxGv/phser1AcyxHKVZRR7SstvFRzF/m8yIdE6rjOqNT0r5OB
 cXS70Ymlrt3nA87D6XwgLtCbCnpJYjtILTogHib+ihWQdMVj+GySZLHY96h243MPLdbdF2y+ulu
 I+WZMQ2Lkvfhvu086U9xshtiWC6+TkyrgQcSk3J5bKYW4UEsj8KNHJxzaeCFaC6dV/xzVNuiEiz
 0+tZIo6XOG8BMwJZDNIRd4PKzCWs3POQ+R6PEZRLT1tDLxYDsxqTqcMOavhnGQShU810stQxvsu
 QqdDLau+GGHuppIUDmA==
X-Proofpoint-ORIG-GUID: cvoS1Ct5q-llaZ_zpkx5zebQc_SSq8D_
X-Proofpoint-GUID: cvoS1Ct5q-llaZ_zpkx5zebQc_SSq8D_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX0EJRHFJscUXV
 8aVIQu4Y5bUXsrlxH+SsjTV+8p3ZQ5pkJaLUYx0Zy8oGyHOZthsjqTWM/rCnksyQbQ3Q5nBXdXJ
 i92pE6ToSbFti7XBNHhG7KYLdhoYaRA=
X-Authority-Analysis: v=2.4 cv=cY9HPXDM c=1 sm=1 tr=0 ts=6aaccaf7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=rbTJAiSUCfbnr-_MOTEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180064

Use a single TEST_GEN_PROGS assignment followed by incremental additions
for the RTAS selftests binaries.

Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
---
 tools/testing/selftests/powerpc/rtas/Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/rtas/Makefile

diff --git a/tools/testing/selftests/powerpc/rtas/Makefile b/tools/testing/selftests/powerpc/rtas/Makefile
new file mode 100644
index 000000000000..eb30f62c5636
--- /dev/null
+++ b/tools/testing/selftests/powerpc/rtas/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+# RTAS tests
+
+TEST_GEN_PROGS := rtas_rtc_test
+TEST_GEN_PROGS += nvram_test
+TEST_GEN_PROGS += rtas_proc_test
+TEST_GEN_PROGS += fadump_test
+TEST_GEN_PROGS += rtas_flash_test
+
+top_srcdir = ../../../../..
+include ../../lib.mk
+
+$(TEST_GEN_PROGS): utils.h
+
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests/powerpc/include
+CFLAGS += -Wall -Werror
-- 
2.43.5

