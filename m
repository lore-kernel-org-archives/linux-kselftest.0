Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EA3B3C1A;
	Mon,  8 Jun 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909531; cv=none; b=LR4eygSE2QpEvlgT22YxhtkVEWEpAAlPvi4bGdg+g0TYKjquilV35UALNrzYRemlRUHfCPpBKNVq7ipnxqz8EIf44PBgeh8tCifwUAtwDe84ffjpc5GHUToD3P2tD2Y0LebSheU1azHik+0L9ZgpSwsr7m3NxckBy4Zj3EAr+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909531; c=relaxed/simple;
	bh=TpWrD5gjmN1WPInRMN9PduOOKnV9C/59BHFBj1wnECE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtQKojtdu/zk07n5Q1D2Xdh2qSOq2sojHs8eSzHZ+rfYigB13KxL+BpnpqkaxD6KO2zxUwe8gt6R2sgoCfgm3xTxyJdhA/GldThKjSqIlR1HlO+QyK2sua12ApqmUiNwL16l2qEFUMnyHe7XmZ9AcdmOYwHjJMtRA8lap+bwmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=f76VVQsi; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f76VVQsi"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6582nIbe1271233;
	Mon, 8 Jun 2026 09:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=rwiFJLng3tyPnkhK9swVWgnZjidfD+EFCRnjHRrM3
	YE=; b=f76VVQsidm2W8nS8TOrGI14C9LSgob2LlWjOWkonC5QA82Mn40iMXA2p9
	zxNkPdaULkv0X13YvcAD5gb4nrLSsnkVB1d9fD01z7H6G85Q8Us2hCAT1mehiOPJ
	/L0raDUe5dXPQX3ohp8rzdkJMdCv16GxxvyeZ7FOIOjSl0u28a+h5+hpvdfWMZi3
	/LcvOYeXnYj+NK3sk7E5se3acrVdPdxH1ZV6CRHNchzVzMhYevOFpv96ByDzUD4J
	Esg5AJZvMPJHpi0OrNc4MymIxTc3xpVHQJ2sPsR6CTiwYh8ryhnf3/JSoc+kQWZV
	NK+IMs+81312TWr1Vydfeq1w2RlcA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4em9ydxgtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:04:56 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65894toV012186;
	Mon, 8 Jun 2026 09:04:55 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4en03fvdnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 09:04:55 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65894r2D30409300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2026 09:04:54 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3E8E58060;
	Mon,  8 Jun 2026 09:04:53 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 758245803F;
	Mon,  8 Jun 2026 09:04:49 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.211.219])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with SMTP;
	Mon,  8 Jun 2026 09:04:49 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 08 Jun 2026 14:34:47 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v2 0/2] kunit: Add support for skipping entire test suites
Date: Mon,  8 Jun 2026 14:34:25 +0530
Message-ID: <20260608090438.219497-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfX8761vXqvrv5i
 O257b+sGiTAmcdWmyDOymfzZyd2ZE7j4f1hDY4pckfggVFxnQs++PbKL6Uqokkv7qjxNpfuKsd1
 n826PJSZl4jsxPB94LfpDp5WseKRxazj5/Ke1dX8egCBcQEMGCwZV1aTr4CIvtwy4yzsv2GteJe
 4p05ZgQAL1G0l41tnMIv2U/GD2HfIS8EFObdvWJ34owhnu8htNDR29CawuHZAw/OBGF86dGs+Ya
 s41pulJzsSDrINynW8Li8ldpv7jX3jff7o03WlRUs+pG/sM/qOCuYP1TqsQen1Yq9UnFbcIbl/E
 QXIGR2vrfRUTp8k3YG+Iyj+IMqUPzN2iRJy9PjPQyadd8gWWxcSpK6rUNRCE5CdJTjrR0I3o/qJ
 ncZ7janwRE82BXQC8jjaEY6k7FJggRvGfjsoMrs5SZ5EICu4M3YO/zLUajwJjRpJD2FNzNh/RlJ
 kju0Ji4GTjmhtzQQ9UQ==
X-Authority-Analysis: v=2.4 cv=QKhYgALL c=1 sm=1 tr=0 ts=6a2685b8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=FF_GvKQqgJ40MD8C4q4A:9
X-Proofpoint-GUID: SXAeJE6n0o3roo0GAo-bW16fbPFbNpnS
X-Proofpoint-ORIG-GUID: f6UDockO6RwHIU5I8m9S0RRA0ENlbFWE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080079

Changelog:
==========
Previous version:
https://lore.kernel.org/all/20260604162805.556135-1-vaibhav@linux.ibm.com/

* Fix malformed and missing test-log when skipping kunit-suite. [David Gow]
* Update kunit_init_suite() to reset the kunit-suite so that it can be
re-run [David Gow]
* Update kunit_suite_has_succeeded() to check for any failed test-case and
update the 'status' for kunit-suite.
* Added David Gow's RB to Patch-2

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
* Providing an example in kunit-example-test.c demonstrating the usage
  pattern.

The implementation is minimal and non-intrusive, adding only a status field
to kunit_suite and checks in two key functions. Test suites that don't use
this proposed feature should be unaffected.

References
==========
[1] https://lore.kernel.org/all/20260604092931.344101-1-vaibhav@linux.ibm.com

Vaibhav Jain (2):
  kunit: Add ability to skip entire test suites
  kunit: Add example of test suite that can be skipped at runtime

 include/kunit/test.h           |  1 +
 lib/kunit/debugfs.c            | 30 +++++++++++++++++++++---------
 lib/kunit/kunit-example-test.c | 29 +++++++++++++++++++++++++++++
 lib/kunit/test.c               | 17 ++++++++++++++++-
 4 files changed, 67 insertions(+), 10 deletions(-)

-- 
2.54.0

