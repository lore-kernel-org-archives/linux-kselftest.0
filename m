Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7128396B6F;
	Wed, 17 Jun 2026 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698577; cv=none; b=T2VgCEceG+T7CPgUH0wHzZlAwYCO3P+xGo18hJ+PN+KPzOI58U0OdF9OVSUt44TI+arAO3IsmIkm1CnMoEWKaumOmJrAvSZOdcvMIX0YMzD5MuyVBvWSuOe0qqQ1VPdyBt/PRS1iIiVtIR75dQJy2rMRIWyrIZ0bYJfunckrKdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698577; c=relaxed/simple;
	bh=PaBRJAscqDs1Ev9V3Mb45A2uRApMGcwA4/tJ5GUnFn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5HneMC+DuMj1ecYpotjYfYCn3B4TUSW9DXydJZD6msBGEHLZX1auDmkqQFmKB3TczBQE/E7/MUIFrYvkUVL20usPthqe1vWSeGLc1rITgqWRiwbSKPYhrcV8pi87R0JlOPO8feW2nWcDR333/cIgKR/iJoHnPEBR1sjhZxVEFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P+WRvz7u; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P+WRvz7u"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8mHwk4127553;
	Wed, 17 Jun 2026 12:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=U8WbZBppaX3cVtD2i
	eLZHoL8dv42OAUrFAdxYx34Dig=; b=P+WRvz7u4t5VKSTD7PIbN+PN7lIh+fEAv
	lzTt6keyTBST5NcGTePXopL/wy+o8gH07gDbvhgEjbaZoHHoGB0cvQ1Rcb6mLczf
	aPebpiPRHM4bh4j5v2iRfNrN/kS7sdtSus3nXFJrSl1ajN+rGzFDyOmp0dcUnd6n
	ieW1OyXFeAnCSIYK4n2LB5vV/SvjFFsGwAt9T/WJ50HHr5BsGw7aJRDwucmc15zK
	s92sDVZyK+2iu0tCg16dakBH88j/Tlkas4BMHir8We84bVfRmMXUJWoIzstN8nCo
	WO+3uYowzoCizt/IXWmpz1d3S6l0nPd6/3TjXGaINFZp9Ebhr3nUw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqtjt3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:15:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HC4ok4024118;
	Wed, 17 Jun 2026 12:15:53 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4eudvab25t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:15:53 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HCFp1t38601398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 12:15:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10D785805E;
	Wed, 17 Jun 2026 12:15:51 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90C1F58060;
	Wed, 17 Jun 2026 12:15:46 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.28.81])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with SMTP;
	Wed, 17 Jun 2026 12:15:46 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 17 Jun 2026 17:45:44 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v3 1/3] kunit: Add ability to skip entire test suites
Date: Wed, 17 Jun 2026 17:45:21 +0530
Message-ID: <20260617121535.462459-2-vaibhav@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: rWF53SGGY-t37nY-GcLYCkT6yk8dOs3D
X-Proofpoint-GUID: hex1UeAVYHQUCstV0OBuKpH5GHZgxTZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX5nmUSbjOK+t5
 1NVsOnyWi7H1hmtlAnwj83FJX5ZAYsrv+C/8Dr4A7VmqOm9ZzViBonAmjHE9i7oV2ZXRN1HlLmq
 KwxFwZ4p8XLtayS+Cew7iKKduN+wh8NXumxOVxhcugGUPH2KC8CEACqUdpZE9qi+0I+FJxCMb+o
 yUgFh0+Z8cnEbW33yA78BAuyCLc6k/W4TPJqfP+20lsax/nv+Ock58V9upPcNqanI36OQqqKvBt
 V3O8ZRch4rcrbXgaWezgfogQSTG+yy0h6CyUgO0uUTMV9Li3GxBHgQhGPTsfNZiHtzaHeMYyFID
 dm14Yn5VjmoOgyt3etZdx3odjFz56T6Kv+34vmBVarL5f1c4MExy18iwi+zUf8kfuMO0lYYuDbK
 bszf0c3TAYoUSyxiAQxffhBwt9NLgAEDcAzFueWXZ8uV/YxffSitvKqtT4TxcpZPqxSI0zNYuGk
 f+bh6UHXFc/ojulvO8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX1acRM2aV+1ug
 /NIaRDxzxfR2CoxnL1INjmvCtz91VQk9ITuNE6dj8EtRrGjehZHun1GACqWbFbh1q+xrX6Ukidf
 NMweiIbOBL1NA8+S3k+URvu3m3kyAjo=
X-Authority-Analysis: v=2.4 cv=B4KJFutM c=1 sm=1 tr=0 ts=6a328ffa cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Zg9uCksi-im-w5in-NIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170112

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

V2->V3:
Link:
https://lore.kernel.org/all/20260608090438.219497-2-vaibhav@linux.ibm.com

None

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

