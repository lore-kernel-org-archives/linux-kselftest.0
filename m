Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC93F20ED;
	Wed, 17 Jun 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698581; cv=none; b=V/gPNVh6dt+aVSn9CsQzuAFI+i59OpirXnL4ykj939nGkJ9sgjsEnZsvjgS4nvjfF2FjTy7CmemjiUbBY7I/4LbPmObx5VJRlWeubs45gYpPfVcvIojU2BwMsZwruK5MQMvvd/4D8NsTgT0SWm4pyRu84FKwJ9Gz2F1wRUkf1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698581; c=relaxed/simple;
	bh=rWMmuPXNPZYuXCf0IK8PiNj/naG3EltoCFg7IKUVDe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2Kbq1J+u8HJfiCc3gv7StC377nVMVpPJLr9USx5ZrkxJKI/+kOGjfHHl5sm+UG/x3pBi36VkCeG062j5Fs+UGn2hIPH0WNdqyKOzWkUol6lq1ar4AZ+7EnACbVSf5EHCCl0JJm1iLJzZcpeCy4/fbSOI8wI3Hh5ObrrBnRAYkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Jq38LFTz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Jq38LFTz"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8m9Nm4104751;
	Wed, 17 Jun 2026 12:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Lp5ORq++2+BvA9FkC
	wo+C6vv3BB15kQyt4s6LN66vUk=; b=Jq38LFTzNTG9MasRhUCfAjbKb4BBUpFBo
	Fig4RGOpYtZa0y6K4y8hvu7UamDIl/K8bYV9PvCXDys55aLhEu258sh21aP7pZg5
	eAPdpLWhfpxyGll5VARcrmb4jiMDlKYZCEgAW3YJw/svjBCxKOx5JNdmCssH48Km
	SOKZWp2GGbKNEu6SvJFYrWzlKEXxscx2Qu43JD0EfMMkCvyLaEaIMUvHQsD7O/3y
	NnqPpSvzwiO0GNuBuBGTbUpubXSCqiAhM8ijsDxKehpGyetIIrTxMdOxl/p3sR+M
	3NXfJYHPK/J2XsFNwQrkINcSsM3JWCGFX2asYjQqgoV38pH9rvoyA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqvtst5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:16:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HC4caL005518;
	Wed, 17 Jun 2026 12:16:05 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eudva329r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:16:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HCG35q65995134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 12:16:04 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D431F5805E;
	Wed, 17 Jun 2026 12:16:03 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73B435805A;
	Wed, 17 Jun 2026 12:15:59 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.28.81])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with SMTP;
	Wed, 17 Jun 2026 12:15:59 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 17 Jun 2026 17:45:57 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v3 3/3] kunit: Add example of test suite that can be skipped at runtime
Date: Wed, 17 Jun 2026 17:45:23 +0530
Message-ID: <20260617121535.462459-4-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617121535.462459-1-vaibhav@linux.ibm.com>
References: <20260617121535.462459-1-vaibhav@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX5lzwSdkU5kUj
 NG1yV/KtkjqcP/AsxETM84zNeHsaveU1l2CjISjaVV4WpUbFBi3TQj3JEPM0ePRIFxMbqrFZWmd
 exL4cmQQ5vbDIN89YW40RiBazad90m0=
X-Proofpoint-GUID: ohnN4LU32mtJ1IAQ9HdXvLriLk6aEjkO
X-Authority-Analysis: v=2.4 cv=bMgm5v+Z c=1 sm=1 tr=0 ts=6a329007 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ER9KG9QWV2A1lhMn8r8A:9
X-Proofpoint-ORIG-GUID: liK3RVwI3Oltud2mHYGxdyTLYwibjwiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX+P7OcCe9CDMc
 uBttvxxMAYuKSb3KfqpwjcOY3I3qJwIZb7yV698Fc/1H2v2IG7JbR7cdtTs7FD71DArgN2+KD3L
 A3KK5VLsWrUYAtuodd0WnrVRsY4ofRyl6z9dV9eJsYUc4Fx5kyqU5L8jcNnqZkBRfQ4fY7S2rI2
 Xk/V/wmalDebVoKuTvrBxITH2it8mOv7X/1JHMro/jLNQCyWwPuQuI4wcCVYBEFNtDFNZy0NE7k
 ihqiPkTYcNIUWVt70ltFipvS3ndeAfYbnRWev/mgFFlpzGBOVBHKRak0jccnX4bd4lwVYFKImgQ
 qjfgmMM7pbtqRzGFsp35b1nZujdUGAYfBazbRED1y67u7+VHKwOh/ZeDV9e7w6bYLbvtehjUC/x
 uOAwDSGMImHz0bIYacyP9xN63+QPhehcXlsbnn1j4HJuQreSaA59iliJuxN93u+5YDOk5RyjrB6
 P1bjbFYj+OMXpbAIpEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170112

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
V2->V3:
Link:
https://lore.kernel.org/all/20260608090438.219497-3-vaibhav@linux.ibm.com
* Updated patch index in the series

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

