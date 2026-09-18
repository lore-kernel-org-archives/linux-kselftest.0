Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8439524E
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789709047; cv=none; b=eF64dYP+1YWtALeQcuv2cMvGWTrVqH+GdpeOEs6cCU1by662HWPdHcZdl9o1dh7BUoEwNOOKxqQZDYg82iR4jdiXQoVDPCPfl6a0w2i2qgoqM/2Hagvifeh/5HoDpiGyHLy9GnTMuOxGsQAT0/OfnGVokfz0VklJpuE6pBptaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789709047; c=relaxed/simple;
	bh=58xzDleznRaTieDuxAbOFAbcTgL+f92dMfRsPsg1fRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6kR5EFHZ443vGwoI3/JDLiVoKDRWKOW0mC11l2WmWEas0tS6JPwq21T21Mrr2qWvMvPdzV26I5yDxAH6dyTAjeqECK6r06z65qnPEP7+5goaTtXN3054I91twDCXjBys+ywNQwZ/RNIPCWt96JJBGO1ZHpZQY8zcLjHASn5byo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SmNlM4JI; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SmNlM4JI"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VZ394092001;
	Fri, 18 Sep 2026 05:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oGJk4n7WtHcVajpvK
	6Pm5G9qDj9Mg71rEE8uyPKn1GM=; b=SmNlM4JIETbV8hn5hXI0yr0wJkXm6ETLf
	n9uLv5/Pc+KKAmLXqrHl66uDpeOsNOEr6z5Rd9yT5AOwBrYh/YSzVjzFQy7I0aH/
	/tmEf253cyiXJfzLSWEYaYPsuOlvJSubL0BNAWlS+KMgzVD7sRWWd9OG3BmumDMm
	dI1TDcEOVRx8D35XGBZhZYd3D6y04BnRlCjch5svfu76rXM0VJyTxp08ITU3s3JA
	I8dr8fUF2/EFVV0++l2gRQVhBF3ivC0HCVWsHIJg8idfIi/9VvtMiXy8jv922f+b
	q/oeMlFYD6Du9PyjyLjkw6690vlA6aw+SmvMUp5hWnLXC4c011JdQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5j63b0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:24:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2Z5C8015610;
	Fri, 18 Sep 2026 05:24:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gra3yvyap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 05:24:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68I5NwkQ11206984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 05:23:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 361AC20043;
	Fri, 18 Sep 2026 05:23:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E2DF20040;
	Fri, 18 Sep 2026 05:23:53 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com.com (unknown [9.66.68.7])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 05:23:52 +0000 (GMT)
From: Shirisha G <shirisha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kselftest@vger.kernel.org, maddy@linux.ibm.com,
        venkat88@linux.ibm.com, shirisha@linux.ibm.com
Subject: [PATCH 6/7] Subject: [PATCH] selftests/powerpc: Add common test utilities header
Date: Fri, 18 Sep 2026 10:52:41 +0530
Message-ID: <20260918052321.932660-6-shirisha@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX0H9Wnt0SqZIu
 BseYmLqvcJEVp/a+HQPaB/uzpIjcVGBDWSddjH8vXlI1SpD/6AmOm32Pi1O8JSwXTWEqmcS391U
 ZC+q4AUDhOY7nFrNJHmAyU3UbCqMyBAqt3TipbneU9rFKpfsSnUCKJWVhDP7NT4p9sBNNUb3xhX
 l/cN8M19LCROQqXylgR4OKG4OYrC6JWS6xtDocUQ9E+jEoYn5YT4tXtTQdpXBYl1vQqajKKfKR0
 Q/CWhvFzsMRVHqSKXTpScgYKSeqLdC+ufoehn0b8AjT2JhlBkXqJBDtW6p8L+oOrzrAt9dINJ0+
 FZ1KmH7jowj+WB8kMxxfwAsbqASg+bDbV+lmp8XtLCRcRYxf+XTfpwsF4jZng1bv7wsXMF6Ntl8
 Oj0HU7oJXUkS+NZN1clZL2kjspNFkLC3ncoI6LJD2BT6EBB/7CObTXJ6/d73U4MDhCWgOHdN6Al
 w8M9kFwtRMTB1toMjuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2NCBTYWx0ZWRfX2nUnjEiPwjPZ
 8+mdk04kDOYp0PK0hQMfoNb1nkPPSWpllKYhyYlVYYoL7GsVpq4le2uF4S4rhnLx9GE9bpJpzEY
 sRhsoqmL5rVKC38eJcMM1Divuxi8JWs=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aaccaf4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=gxVX_hiJxzievkXEad0A:9
X-Proofpoint-ORIG-GUID: WYKlL7kpTH7lVmZbuOurxo_fP5mxqbB_
X-Proofpoint-GUID: WYKlL7kpTH7lVmZbuOurxo_fP5mxqbB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180064

Introduce a shared header `utils.h` providing basic test harness
macros and timeout handling for PowerPC selftests. This consolidates
common functionality used across RTAS, NVRAM, FADump, and other
selftests.

The header defines:
- SKIP_IF() macro for conditional skip
- FAIL_IF() macro for unconditional failure
- FAIL_IF_MSG() macro for failure with message
- test_harness_set_timeout() helper for alarm-based timeouts

This reduces duplication and ensures consistent behavior across
selftests.

Signed-off-by: Shirisha G <shirisha@linux.ibm.com>
---
 tools/testing/selftests/powerpc/rtas/utils.h | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/rtas/utils.h

diff --git a/tools/testing/selftests/powerpc/rtas/utils.h b/tools/testing/selftests/powerpc/rtas/utils.h
new file mode 100644
index 000000000000..58eef7642a3f
--- /dev/null
+++ b/tools/testing/selftests/powerpc/rtas/utils.h
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#ifndef _RTAS_TEST_UTILS_H
+#define _RTAS_TEST_UTILS_H
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+/* Test macros */
+#define SKIP_IF(x) \
+	do { \
+		if (x) { \
+			fprintf(stderr, "SKIP: %s\n", #x); \
+			exit(4); \
+		} \
+	} while (0)
+
+#define FAIL_IF(x) \
+	do { \
+		if (x) { \
+			fprintf(stderr, "FAIL: %s\n", #x); \
+			exit(1); \
+		} \
+	} while (0)
+
+#define FAIL_IF_MSG(x, fmt, ...) \
+	do { \
+		if (x) { \
+			fprintf(stderr, "FAIL: " fmt "\n", ##__VA_ARGS__); \
+			exit(1); \
+		} \
+	} while (0)
+
+static inline void test_harness_set_timeout(int seconds)
+{
+	alarm(seconds);
+}
+
+#endif /* _RTAS_TEST_UTILS_H */
-- 
2.43.5

