Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF63E7BA0;
	Fri, 26 Jun 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464341; cv=none; b=jsepNd0/vP4pniK/9WnC065fNFzlDDLmYT4YsAdWifs7D5hNeA1vcwm/G+Anf5ifd62flJO+Rd2XPb2uhh4/6oqEgsrb0iXonaHiR9Ls+jm1dZ3r2N3v6hee20rcSmBVtP+1ZSEch9X9awXUOOCSICrEwwM6l+hyAXQGn98uEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464341; c=relaxed/simple;
	bh=9+KOepVfHcgzyx1aoeHZk05QJnP0tYBRGnk+hf3cU+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8pe6LEzn7lnRJ/1rDqQluCf7ll5Ik4m6RPhvyvpIuHEPxXhaT3xHDZxRdR9xzoEr4GZ38aQj3zuyXoaWKFJBVasaF3dLgkXsx0DT7uXTbIfNScXFp2YhwzUV9z0w1gtcjmdOY9kDOCAbAH3e9lcFDAyJ6/nUEuIyaFhyTVj/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OSWTvxHd; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OSWTvxHd"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6nBfc2221391;
	Fri, 26 Jun 2026 08:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dq2iJH3ZBxy9MuvW6
	3gPgQjNUyVQUQHN+hh9clQFrqw=; b=OSWTvxHdkeMs7oFspfn/vpBlKgW+OnZks
	M/oIkwuW6s1B1MypgxPmffzhng2mZnG76ZFi2V60dO/jCYohpclcDJYabZIiXJAG
	mvg+2aYyPnsX/Pi+tOCH18/FcuePoj7A2B+XghL18iGrrhvG81UOR806FRIEAFjo
	Z1hk5Ikq53LKCKmOjKNAd89LqcBlmFDRvyc+vwRO/0SnuUBkN336oKRjJBaiDHff
	SKiX9ZBbRITuvNxKFOzLy0Dxiu9azhBO7mfh7QI7aIEZ0fm3O7hyiZRyB1IjLbIp
	2/cTeFOzrVA9s7GgBf0jXsTMW3ak+Z2miH2hCm4pl6MGm/j/Kk8Tw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j62yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 08:58:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65Q8njNO001484;
	Fri, 26 Jun 2026 08:58:35 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex56qthuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 08:58:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65Q8wYvU32703216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 08:58:34 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 108FB5803F;
	Fri, 26 Jun 2026 08:58:34 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 817B958056;
	Fri, 26 Jun 2026 08:58:29 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.20.139])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with SMTP;
	Fri, 26 Jun 2026 08:58:29 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 26 Jun 2026 14:28:28 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v4 2/2] kunit: Add example of test suite that can be skipped at runtime
Date: Fri, 26 Jun 2026 14:28:07 +0530
Message-ID: <20260626085811.151133-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626085811.151133-1-vaibhav@linux.ibm.com>
References: <20260626085811.151133-1-vaibhav@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ZJ8nUWzOPibnE_4HGKDwr7KZD7-vjhPI
X-Proofpoint-GUID: LSCqZt8pxDgpYvnHYkLVsI-2UQyVz1-N
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3e3f3d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=nzuXsxulAAAA:8
 a=ER9KG9QWV2A1lhMn8r8A:9 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX+K4XeN0OChbK
 gsEfb8qxoF/2mD/0bpgiStMhEoLgIHejVSNd9iUpyTMT8tkHSUCFHPXgvli2gWSOcFdYQqIbhgf
 RnufnotmcvNkwn9B9UNNFqx8QhrcX/rPrpX9xw9Zcbc1r7/cnIU8UR013ZEg715qz4jGtZXr5zp
 ECecIP3JAzvBPE1GPtQo58v3aY2pA+ggvuqZF2cX86MVbB5DqFRSwO+fHCg+eNQa7T21rBvHg4F
 CCMc9npIaW9wq7u2LUj6EwYT9QIjHECio4cSptdiQYpD+/2UZpfRhk5CStVuQ9U8qvfwkmFR372
 yReHC2h21+FMyJJGKajb8Nj8y4XlVBDr39bYeCPjw2PlJRXvgvbRuDgHsOvepeU4Z5drpfyqUOQ
 tZlmon74vMDBVnZUK1D5XzVSCGKNdNy3xgddpAKqw5gydJaeZCwtDDTrsEZiLj+SIaECqlclzCX
 to7RE+wvoArjTYj7n7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX2Y5pxUSuobM5
 LTziNjbjv8zx99Kqq67lxKSIE+RtLymWq5dlTCzAE2QnT2gv7/kB8VUAL+b0kpCmtMCmNLlJqBm
 kGSfbLmuD1f6Y8MCIncTBMGYlqBRYJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260070

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

Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog
=========
V3->V4:
Link:
https://lore.kernel.org/all/20260617121535.462459-4-vaibhav@linux.ibm.com
* Updated patch index in the series
* Added RB from David Gow

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

