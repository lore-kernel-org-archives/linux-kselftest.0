Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B32192F4;
	Mon,  8 Jun 2026 09:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909523; cv=none; b=dWBX8O5O7XpEUf/aNuED2ybnJkI1RaDu3ZKy3MtCAzNcLZlpeUqqRcs2KTlPtQQiyPWo9pEk5/NN7ZutI4YM/V7Qrbb250SkfJ3GyJZ20H4VOaeyoMO90YsL68iK/x8UtV5yVTY0SW7izgEVn6We9H0k+P/yGYOBcgs6/N1LoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909523; c=relaxed/simple;
	bh=TbuJ2CgJMG4rOUDNAaA/w4OZimD7xrZ6erXAAUTMH/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzSbDOXaVVFK64Q+Px8CHK4v4JAeJdFiYrjj3tMDXVh2kGVO3gr7btM/yNjGUSDTBczxRd07MYstBKViHYgxNGGc6hSpufwSHVF/K9IE7H19sV5kZBvoMp9mbaXcaQe8KoS6fbwlcI27tf9LV2Mq7miwr6WXdid8F+OlWlJsQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=U7cbwa06; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="U7cbwa06"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657MBcE83003996;
	Mon, 8 Jun 2026 09:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rIAvynihvTvD5RaUn
	NV/jjK12aySuGAqj/WVEBcxugQ=; b=U7cbwa06h1m02uvJLfvpaHT5qGvmY5tE8
	vb8r0YL9WZDnB8UpkUZVMHZqpi9gcNiz/mbdB5NPhiVgo+3zKB0kRJVfJpuwhGNS
	xUilVkWvMUsegheKpFcNUvfI1z23DpV2ERyOuYf+o+JxEylXV5/deDnnpCtkDnyh
	11N6aRk3f5D1lTiAycruywWj6nxNMRoKIlJiUadSaOl5yEZcsAB3p++7GV91uhP0
	szkWFZljyz6jsUkoPbUVIyKjuMl74qa38Z72pw9rSwYxuyfTnPO9oYiJd82uyyRE
	kK/iSz+6pGVAv0j4vrhJzXyGZPK1tU7qH1Ymywyp3bRJ2aKnu3H/A==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4emb956fxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:05:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65894cHE015647;
	Mon, 8 Jun 2026 09:05:02 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4emxvjmkks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:05:02 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 658950jc18219530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2026 09:05:00 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 800D45805A;
	Mon,  8 Jun 2026 09:05:00 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E872658052;
	Mon,  8 Jun 2026 09:04:55 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.211.219])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with SMTP;
	Mon,  8 Jun 2026 09:04:55 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 08 Jun 2026 14:34:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v2 1/2] kunit: Add ability to skip entire test suites
Date: Mon,  8 Jun 2026 14:34:26 +0530
Message-ID: <20260608090438.219497-2-vaibhav@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a2685bf cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Zg9uCksi-im-w5in-NIA:9
X-Proofpoint-ORIG-GUID: 8pSnSy5kBh8tee63PpVVlmLBxAgsKOFz
X-Proofpoint-GUID: DkYZbUnsmocdeUrPbrh-iaQRMY2tlocF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfXyMwsWYcgVE/U
 Vy2wDkXEvOlHin5YPH1HcY0/7oL7usJsLU2jO5RO32/rQDGUWXPNdHdHUUxs9Ulp9nbd8JjjmJS
 fcEQrdJrwcldu0Bl0nDRq1iUPGtqKAH4BjH1NtbV6BxBMk2voKJV1qFgjPYT6agmktRnirY99S3
 IAl6wNulfsROb/Pp0DdEO7rrsVCSJVd2fQe5wp2VPZRCg+7eicvP6KZ0GqBaYF+GuE6Gz6EkTO4
 Ra6xP94vVwWwr+cAcVDThg/nVyAwL0bWX6tFOrhQVrhqFCb4MbL8NGqeDjuk09bhnna5O5A9PEd
 zpFPUzVPnLN3MwYaV7ETRu/UfViZKVbiZ9c+iyydbZwzJxr83sBH2aqvpXWVc9mz6z74UEhFTF8
 KF7r5OMcLZTpR4eIndHvpWlPViyqzyXeOVQYcr/c+p1mXegAH86Kq4crv87g9QvI2qr4YvRuKAn
 qtlgBD40Xmx20X/YqKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080079

Currently, KUnit provides mechanisms to skip individual test cases, but
there is no way to skip an entire test suite based on runtime conditions
checked during suite initialization. This limitation forces test suites
to either fail or skip tests individually when certain prerequisites are
not available.

To address this limitation, the patch adds a 'status' field to struct
kunit_suite that allows suite_init callbacks to mark the entire suite as
KUNIT_SKIPPED. When a suite is marked as skipped, all test cases within
that suite are bypassed without execution.

The patch proposed changes to kunit_suite_has_succeeded() to Check suite
status before evaluating individual test case results. Also
kunit_run_tests() is updated to skip suite execution if kunit_suite's
'status' is KUNIT_SKIPPED, thats either set before suite_init or by the
suite_init callback itself. kunit_init_suite() is updated to initialize the
'status' of kunit_suite to KUNIT_SUCCESS so that any skipped suite's can be
restarted from debugfs.

This enables test suites to perform runtime capability checks in their
'suite_init' callback and gracefully skip all tests when prerequisites are
not met, rather than reporting failures or requiring each test case to
perform redundant checks. In case a kunit-suite is skipped it can be re-run
from the kunit's debugfs interface.

Also update debugfs_print_results() to clearly log the kunit-suite as
'SKIP'. kunit_suite_has_succeeded() is also updated on which
debugfs_print_results() depends to update 'kunit_suite.status' in case any
of the kunit_case has failed.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog
=========
V1->V2:
Link:
https://lore.kernel.org/all/20260604162805.556135-2-vaibhav@linux.ibm.com/

* Fix malformed and missing test-log when skipping kunit-suite. [David Gow]
* Update kunit_init_suite() to reset the kunit-suite so that it can be
re-run [David Gow]
* Update kunit_suite_has_succeeded() to check for any failed test-case and
update the 'status' for kunit-suite.
---
 include/kunit/test.h |  1 +
 lib/kunit/debugfs.c  | 30 +++++++++++++++++++++---------
 lib/kunit/test.c     | 17 ++++++++++++++++-
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index ce0573e196ce..395221d623f7 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -285,6 +285,7 @@ struct kunit_suite {
 	struct string_stream *log;
 	int suite_init_err;
 	bool is_init;
+	enum kunit_status status;
 };
 
 /* Stores an array of suites, end points one past the end */
diff --git a/lib/kunit/debugfs.c b/lib/kunit/debugfs.c
index 9c326f1837bd..442b2ceb955b 100644
--- a/lib/kunit/debugfs.c
+++ b/lib/kunit/debugfs.c
@@ -76,18 +76,30 @@ static int debugfs_print_results(struct seq_file *seq, void *v)
 	seq_puts(seq, "KTAP version 1\n");
 	seq_puts(seq, "1..1\n");
 
-	/* Print suite header because it is not stored in the test logs. */
-	seq_puts(seq, KUNIT_SUBTEST_INDENT "KTAP version 1\n");
-	seq_printf(seq, KUNIT_SUBTEST_INDENT "# Subtest: %s\n", suite->name);
-	seq_printf(seq, KUNIT_SUBTEST_INDENT "1..%zd\n", kunit_suite_num_test_cases(suite));
-
-	kunit_suite_for_each_test_case(suite, test_case)
-		debugfs_print_result(seq, test_case->log);
+	if (suite->status != KUNIT_SKIPPED) {
+		/* Print suite header because it is not stored in the test logs. */
+		seq_puts(seq,
+			 KUNIT_SUBTEST_INDENT "KTAP version 1\n");
+		seq_printf(seq,
+			   KUNIT_SUBTEST_INDENT "# Subtest: %s\n",
+			   suite->name);
+		seq_printf(seq,
+			   KUNIT_SUBTEST_INDENT "1..%zd\n",
+			   kunit_suite_num_test_cases(suite));
+
+		kunit_suite_for_each_test_case(suite, test_case)
+			debugfs_print_result(seq, test_case->log);
+	}
 
 	debugfs_print_result(seq, suite->log);
 
-	seq_printf(seq, "%s %d %s\n",
-		   kunit_status_to_ok_not_ok(success), 1, suite->name);
+	if (suite->status != KUNIT_SKIPPED)
+		seq_printf(seq, "%s %d %s\n",
+			   kunit_status_to_ok_not_ok(success), 1, suite->name);
+	else
+		seq_printf(seq, "%s %d %s # SKIP %s\n",
+			   kunit_status_to_ok_not_ok(success), 1, suite->name,
+			   suite->status_comment);
 	return 0;
 }
 
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 99773e000e1b..09e3dabfac0c 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -214,12 +214,18 @@ enum kunit_status kunit_suite_has_succeeded(struct kunit_suite *suite)
 	const struct kunit_case *test_case;
 	enum kunit_status status = KUNIT_SKIPPED;
 
+	if (suite->status == KUNIT_SKIPPED)
+		return KUNIT_SKIPPED;
+
 	if (suite->suite_init_err)
 		return KUNIT_FAILURE;
 
 	kunit_suite_for_each_test_case(suite, test_case) {
-		if (test_case->status == KUNIT_FAILURE)
+		if (test_case->status == KUNIT_FAILURE) {
+			/* Update the kunit_suite status also */
+			suite->status = KUNIT_FAILURE;
 			return KUNIT_FAILURE;
+		}
 		else if (test_case->status == KUNIT_SUCCESS)
 			status = KUNIT_SUCCESS;
 	}
@@ -795,12 +801,20 @@ int kunit_run_tests(struct kunit_suite *suite)
 	/* Taint the kernel so we know we've run tests. */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
 
+	if (suite->status == KUNIT_SKIPPED)
+		goto suite_end;
+
 	if (suite->suite_init) {
 		suite->suite_init_err = suite->suite_init(suite);
 		if (suite->suite_init_err) {
+			suite->status = KUNIT_FAILURE;
 			kunit_err(suite, KUNIT_SUBTEST_INDENT
 				  "# failed to initialize (%d)", suite->suite_init_err);
 			goto suite_end;
+
+		} else if (suite->status == KUNIT_SKIPPED) {
+			/* Skip this kunit suite */
+			goto suite_end;
 		}
 	}
 
@@ -825,6 +839,7 @@ static void kunit_init_suite(struct kunit_suite *suite)
 	kunit_debugfs_create_suite(suite);
 	suite->status_comment[0] = '\0';
 	suite->suite_init_err = 0;
+	suite->status = KUNIT_SUCCESS;
 
 	if (suite->log)
 		string_stream_clear(suite->log);
-- 
2.54.0

