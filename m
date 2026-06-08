Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718F1DE8BF;
	Mon,  8 Jun 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909528; cv=none; b=uF+oCt5hJZCK/7UQlpBXgR2M/N98Blr6/x4hb6NGrZUDwxdn6Iphy0SLgwXkaxIczjIwwFVWXZ6UNg1kx2os93d3H8vDdr06Ww9kcl15Byj/lnPGF66QuIYBI5T4h9TnRx9b1N/aKRJC8l9AXLe5XV+W6N0xCo2xzAhW48yJXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909528; c=relaxed/simple;
	bh=VZUKXu5+ANsNBS8iJg4io4Q3BQa6sro7DOGAkcjaS3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GneTUV0NAc5HV+vn8rsGlZVrBjIXXvR9MlrRzgpJuDKUrQVWNQhuoMetOBTqFq3gGW9n5iQ79zXhJYLpoY/O/6+lEdCP0HHvV0dN2hwki1IZp4l5M/GFKN9IUxGcs2wMGHRiVId8GEdeN+oiyEDM2jpktYxuHJ4rWeitX7giQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mmDDcfA/; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mmDDcfA/"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6587tHMD1029990;
	Mon, 8 Jun 2026 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aNE0UbcYMIIM9/sFM
	W1z3XbSS7iO5WCDFQlDvbR5+tY=; b=mmDDcfA/kwrQOwZG0YIfbJeGfk38Tt+3d
	VP6OUGq3rmESQ0cSF7qQXTwCYW3Hrf8ryJn5PizUktjsDd6M8sEYXyQw+0Qfd8j+
	VYIMP+rG/e3+XwkiGYS/WF2qfIh0nb+qEIyfuW7MFxPOICw7HIvYDndq4GWNBscH
	CAmlvBcratz3GUsfEIcMji1s7fh8P+pDfPMAmsHWfJmuwr4UyGfd6HvVCVgTe1b/
	C07ZQL13t9B653HZT6DmQGndDqUk/3JhZRqmYEdt4j0ls7EQQMv8KSUbu4hv6sH5
	y3DrUbO5GS3hkwDG81/lDZiqIjBkF5CM8gNMbAC9f4H+fJi4biewQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4emb956fy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:05:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65894aWI028608;
	Mon, 8 Jun 2026 09:05:08 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4emx8vvq6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:05:08 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 658957V027984416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2026 09:05:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B59B58062;
	Mon,  8 Jun 2026 09:05:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9AC758045;
	Mon,  8 Jun 2026 09:05:02 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.211.219])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with SMTP;
	Mon,  8 Jun 2026 09:05:02 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 08 Jun 2026 14:35:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v2 2/2] kunit: Add example of test suite that can be skipped at runtime
Date: Mon,  8 Jun 2026 14:34:27 +0530
Message-ID: <20260608090438.219497-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608090438.219497-1-vaibhav@linux.ibm.com>
References: <20260608090438.219497-1-vaibhav@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a2685c6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ER9KG9QWV2A1lhMn8r8A:9
X-Proofpoint-ORIG-GUID: ZXtyWpRtDz84GBOHnrhEPGUKPV8n8nd1
X-Proofpoint-GUID: 5HQY0xBygz5vMZtnvGSObWMB25WItAOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfX6yK64qrZQy9Y
 xQS+9dsOqShh3I/HZbtHPjMo+nn33wyeiwFD5abhoUSAQLmkDVo7Qv/IKLO2iOYrXwQMn6WNZcx
 62CQXFlwxzH/T4cauj4FpMTGNe8hvsdZTTO0//ASC8z/7EnOCQslh6/LTlRTRP4FhsJFnjO/aLc
 HoFxH7n3JAKWq84IdiNwEtZL1ZgjoVjBo6VGbnfTzA48E5niP4uS/bOnGe56hSWtwbMscUv6859
 NmPjxyWAQDPm9h9pjzxs2vKQEw//t2wIQ0ZslwL8Nj09UKUoMrrTx+NLRL/ziO7i1MPfAJczWz0
 r8qbI9O6u0SC9ttxZhgnQPt6uffzEOhC2eLRgA5Q4SLcR2zjzxajQyx4T29nBioJlhTEhODzLPz
 ZM9mBcG4HHli5S3ztQw/Jcm2Ob67IAmm944pvdMxmzpUbWNZIs9Wu+sOKpjx3m2dI4z2psUoIvA
 az8LhHa7LhlAJ6bKJeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080079

Add an example test suite name 'example_test_skip_suite' to
'kunit-example-test.c' that shows how to skip an entire test suite based on
runtime conditions.

The example suite 'example_skip_suite' provides a 'suite_init' callback
named example_skip_suite_init() which marks the entire suite as skipped
using kunit_mark_skipped().

This demonstrates a way for conditionally skipping test suites when any
prerequisites for kunit_suite execution are not met. The 'suite_init'
callback can perform any necessary checks and mark the suite as skipped,
preventing all test cases from executing while also indicating why the
suite was skipped.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog
=========

V1->V2:
Link:
https://lore.kernel.org/all/20260604162805.556135-3-vaibhav@linux.ibm.com/
* Added RB from 'David Gow'
---
 lib/kunit/kunit-example-test.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 0bae7b7ca0b0..b8ded54fa46d 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -591,5 +591,34 @@ static struct kunit_suite example_init_test_suite = {
  */
 kunit_test_init_section_suites(&example_init_test_suite);
 
+/*
+ * This test should always be skipped.
+ */
+static void example_skip_suite_test(struct kunit *test)
+{
+	/* This line should never be seen */
+	KUNIT_FAIL(test, "You should not see a this.");
+}
+
+static struct kunit_case  example_skip_suite_test_cases[] = {
+	KUNIT_CASE(example_skip_suite_test),
+	{}
+};
+
+static int example_skip_suite_init(struct kunit_suite *suite)
+{
+	kunit_mark_skipped(suite, "Test suite expected to be skipped");
+	return 0;
+}
+
+static struct kunit_suite example_test_skip_suite = {
+	.name = "example_skip_suite",
+	.suite_init = example_skip_suite_init,
+	.test_cases = example_skip_suite_test_cases,
+};
+
+/* This registers a test suite that will be skipped */
+kunit_test_suite(example_test_skip_suite);
+
 MODULE_DESCRIPTION("Example KUnit test suite");
 MODULE_LICENSE("GPL v2");
-- 
2.54.0

