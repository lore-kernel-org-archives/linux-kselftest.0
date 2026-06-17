Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC313F1670;
	Wed, 17 Jun 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698575; cv=none; b=AK16pZHd9GLPyJSI1HSXgAmlLrcznIXMzKxHPDI5SVbPpIJTWTYPXKuYK3mLrCZqyyrUxHVfLPVcFDMLAc1QUqKgj7TdwxHZ0sxnGOe60AEkxDV0sTCV9Juq/S2Dd0ziB9jT//o/a+tr03+GzMH9gr0LN+o4SH+uisNLopGU5jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698575; c=relaxed/simple;
	bh=VZLduKYIBGRDepTqxpHkDLZ6viXm3eq6MS9AMmjn/BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IA/h4lks4NpcS0VnSMZ11VyGcg6lbN38NFekQAxrdlXz2DeVv6XwyplovkMmKggomysf1Njfjjf46J8eyZNd3u8amWfCdl76OtxXhAfVGQcCBJXfHlYeW7+rSVNaOD7StiOr2phEFq4w8qOZC56sz1qBNx0RxE37PvNYOGqrCWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HtSLt4dQ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HtSLt4dQ"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8mcVP4022190;
	Wed, 17 Jun 2026 12:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=wEQDaVHiK5xfbGt3lK8/tXc0Yt0FuTeoj2gNZRX5c
	Fs=; b=HtSLt4dQtX2tGpMurWyfuXH/F0+H66/zUafhZB6pBqqXRnItHs86yH36w
	nYpjwooSwMc4P3SJ4ZIjTbJ21wbLDTka6YCbjbZOICq5xv2KQQs8JOi7Q5rRSszu
	zuc7DMg2GsHL3S9ZkkNG2ahRqJlfChtIFawjpj3S9sYn9LV/ODt0V6wy71QzJ543
	EFwRxnVG1NeRB8igvjExQcok9w1IBcvMDFhDUkI7KCOJHSVuzl+ab6e3yYobAu40
	6NkclydMzT+/794NQYTYzSX5spoC/Z5khTdmyhGdLN3PjxrhSI9Li712GxZ4pEty
	KJMXzY9Dyvv1APWc3altRy+H4DxMg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqx2rsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:15:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HC4ew7004065;
	Wed, 17 Jun 2026 12:15:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4eudvab1bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 12:15:45 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65HCFh5m4850348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2026 12:15:43 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8850D58055;
	Wed, 17 Jun 2026 12:15:43 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6D035804E;
	Wed, 17 Jun 2026 12:15:38 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.28.81])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with SMTP;
	Wed, 17 Jun 2026 12:15:38 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 17 Jun 2026 17:45:36 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v3 0/3] kunit: Add support for skipping entire test suites
Date: Wed, 17 Jun 2026 17:45:20 +0530
Message-ID: <20260617121535.462459-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX/qXY/Hn5V1Er
 CTWO+W2zh47l0Runmv1az0O3mju3xCX6yjPWZR1AERwDOlCOK4UThpRcdr/yE5dLpkw16ENzBAA
 ytdzyKjrU/6y2GGvP0VN9skP/3B4Znz+xSe8k71ExwuhBjhPAQmqMqAjKhpCLWzqR27lN1dd9lx
 tPsl/+vB2lgQ9pScjkO7bNoH2gek/e4vP42ScAi8qGzb5QzbdU5TTLOHEICSkE/tE90kK2U/j1+
 OK62Job6AeH7L9l5IxdjvGtwzWSivWAj+ssK+41eYW5MmDvERIBTyjnhzChChIz17NLDRu4zqES
 CZ0mFcZNgdPE1VpS2oAwElpnYP4y9qQcewjL5SZmD9H97Q0l1kSSDToxbIh4AfmUT2kREp2QjJU
 OegkT7oBBdpvcBdKCrpN7m3grQej1JIKsEsCeOKLX4r2mLht38GL2m824Sy/uSVc6UST3fod2Jj
 kj4fPxHWcJxyjwdFJaA==
X-Proofpoint-GUID: J_Ck-BgBFGWTYq7i0bZ7KsJIJuVaX77n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMiBTYWx0ZWRfX8uENqdpXcGaL
 cCBmtUkICiWQky+G8/d142G1WlvU+HgsO9TrAA0wo6nSUVkyxE9dXK/v1EZ2opXCCU9lcMZsbN0
 5nbOlmLwx+GLBh44tALW1GOUahKz/68=
X-Proofpoint-ORIG-GUID: CbSL_kjeXMjCdd79U_alFBZCr65ywxoW
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a328ff2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=DQcA_oo1D6j7zdmmKPYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170112

Changelog:
==========
Previous version:
https://lore.kernel.org/all/20260608090438.219497-1-vaibhav@linux.ibm.com

* Added a new patch to update KUnit Rust binding macro-rule
'kunit_unsafe_test_suite' to include and initialize the newly introduced
'kunit_suite.status'

Summary of changes
==================

This patch series introduces the ability to skip entire 'kunit_suite'
based on runtime conditions, addressing a limitation where test suites
could only skip individual test cases or fail when prerequisites were not
met.

The motivation for this feature comes from test suites that depend on
specific hardware features, kernel capabilities, or runtime conditions.
Currently, such suites must either:
* Fail when prerequisites are missing
* Skip each test case individually with redundant checks
* Implement workarounds to avoid running tests

An example of such a requirement came from [1] where the patch author
wanted to skip the entire 'kunit_suite' but then had to resort marking all
struct 'kunit_case' as skipped by accessing 'kunit_case.status' private
struct member. This usecase being addressed in the patch[1] can be better
implemented with the changes proposed in this patch series.

Structure of the patch series
=============================
PATCH 1:
* Add a 'status' field to struct kunit_suite that allows 'suite_init'
  callbacks to mark the entire suite as KUNIT_SKIPPED.
* Modify the KUnit core to check this newly introduced 'status' field
  and bypass all test cases when a suite is marked as skipped.
* Update debugfs_print_results() to emmit correct logs for skipped
  'kunit-suite'
* Init 'kunit_suite.status' to KUNIT_SUCCESS so that kunit_suite can be
  re-run from debugfs

Patch 2:
* Update KUnit Rust binding macro-rule 'kunit_unsafe_test_suite' to include
  and initialize the newly introduced 'kunit_suite.status'

Patch 3:
* Providing an example in kunit-example-test.c demonstrating the usage
  pattern.

The implementation is minimal and non-intrusive, adding only a status field
to kunit_suite and checks in two key functions. Test suites that don't use
this proposed feature should be unaffected.

References
==========
[1] https://lore.kernel.org/all/20260604092931.344101-1-vaibhav@linux.ibm.com

Vaibhav Jain (3):
  kunit: Add ability to skip entire test suites
  rust: kunit: add 'kunit_suite.status' binding to
    'kunit_unsafe_test_suite'
  kunit: Add example of test suite that can be skipped at runtime

 include/kunit/test.h           |  1 +
 lib/kunit/debugfs.c            | 30 +++++++++++++++++++++---------
 lib/kunit/kunit-example-test.c | 29 +++++++++++++++++++++++++++++
 lib/kunit/test.c               | 17 ++++++++++++++++-
 rust/kernel/kunit.rs           |  1 +
 5 files changed, 68 insertions(+), 10 deletions(-)

-- 
2.54.0

