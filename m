Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A73E6DFF;
	Fri, 26 Jun 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782464330; cv=none; b=tHhiOYzFeAEF84ljtbdKuMH9sV/DS0+wUrZzbDLaZI4wRTbR6lPbFqRPmRXLkqx5WP77/AeuSSG8wiHvTfmxVFxhjWFsIajucr6UVqJtMUo9Hoag/7eDjC5XHOG6oHh3AQWImVvfUWmxbOv/oq2ZKDit1QULwHxLJv2vFiKhNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782464330; c=relaxed/simple;
	bh=xz7w/pHVrUedjzTyeG0dJsgJKJIXNmFj9ZtEp8AwUL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgt6lP7iKt93lRAP75JX/4xt03U2mdzS2/OCmJHHGFMyHv8+ixV5vInVPDpcitC9Ho2K1bqHiA79+YbRngkv6blqW588t8Si7ANeP+8D57LNitnuwFiOHhOe6AZC4rLvPSqXHKO/mpy2rsqUZSUqgNy4+/09w1YuCwvjQDFCqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dBjBa4Cu; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dBjBa4Cu"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6mtee2220768;
	Fri, 26 Jun 2026 08:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=O7oXCJbRKAYcUKitUCxoVUnPEUiiGF6hsfMLMh4f0
	6o=; b=dBjBa4CuuGJ7Emt9KO8CviLOFXnfrz93+lSeqD5LipDmQuX8j4wO11RJ+
	hNVHYsv7okoTeBWZVXDUyDUI4c1WPDVo71m1bQA+ISNGDy5QjQv8rYrcxzIM3ZnM
	sO7F5bdQZvSW2qfXuyvcyDwaV6LyVJ+g88wJKW7evA9AqNWzflrEJCyoA85Mv9Md
	PFyS0amcsYRfMdIFm1sgZWjHnphMcrW7TN8Hr1N25Ka1q2obbZ78e4IugVzuXrjn
	zXKMf4OA6fvHROAZeCu1ttvIDjS7C+qfM7DZ6d/cPoqN4TtxbweGsRZ4azJl7lWu
	7C8P35CBBXpufZw6p59b9OeQqQq6g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gwsfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 08:58:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65Q8negw022803;
	Fri, 26 Jun 2026 08:58:22 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7dgj3dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 08:58:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65Q8wLgU26411520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 08:58:21 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15B115805E;
	Fri, 26 Jun 2026 08:58:21 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97DB158056;
	Fri, 26 Jun 2026 08:58:16 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.20.139])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with SMTP;
	Fri, 26 Jun 2026 08:58:16 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 26 Jun 2026 14:28:14 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: [PATCH v4 0/2] kunit: Add support for skipping entire test suites
Date: Fri, 26 Jun 2026 14:28:05 +0530
Message-ID: <20260626085811.151133-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: UNJBq8_YnAj-fi6ugCZ3fU4P4D-_97Rj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfXyvZB9LMd3ddY
 YIf6IPcx0wPduiUd0GcP0cHGzRdC2YJ8uzA+MdxDTUhrh0ODwckvx7HMsmq1go0vA9lddAuKUNx
 VxAafPkUORQw4XHjBH2i5jOf6Ahm6yE=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3e3f2f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=FF_GvKQqgJ40MD8C4q4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX9S7LtgcNaIld
 n7EE33sbJTjm6ig+KuRXKiX+7Hb9isRqHGvMe6XG0zzuGJZzQ1R64ihRUix0dTGWxeObG2wUrsJ
 orBoRxRKN4+3ven3AnZpgi5jpCJIQJT1dsxeyh/3elQfoqCyK8ZZMNm0Nc8UA7AHMSxt1G4c7rh
 q4W6ohfF6kDbZSZ0wD4jPepd8X7yBiyLYgxqV5X79CfRbDo+dSeIhNOQu8I8OuHR+uI9/5+0sgx
 L80sfs7hkdUa0ip2z8wY59yUawg6FpIyUYBXoF5hqfOLd2HEZyKu8yAv676KjMnPT8R3YjQQVuQ
 1OdqLo0YqB23+bLf7vlVL6PmvopUl2BnGWp84lH34SjKbL5IGr/kU0QOX43ZL7c8Crp4qDBhuZ0
 xzZ7g0kfYqg2+R6Ne0qwgXHXUBZKzb/YB2tgW+/eajQbHHtLjbeufMbLJyE2zBGggnnmWN7rh+B
 kok+48e8qSD6MYR6swA==
X-Proofpoint-ORIG-GUID: 2NZMWzdmNhbMG9yGo1uB05padzAI6FhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260070

Changelog:
==========
Previous version:
https://lore.kernel.org/all/20260617121535.462459-1-vaibhav@linux.ibm.com

* Merged the KUnit rust binding updates to Patch-1

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
[1]
https://lore.kernel.org/all/20260604092931.344101-1-vaibhav@linux.ibm.com

Vaibhav Jain (2):
  kunit,rust: Add ability to skip entire test suites
  kunit: Add example of test suite that can be skipped at runtime

 include/kunit/test.h           |  1 +
 lib/kunit/debugfs.c            | 30 +++++++++++++++++++++---------
 lib/kunit/kunit-example-test.c | 29 +++++++++++++++++++++++++++++
 lib/kunit/test.c               | 17 ++++++++++++++++-
 rust/kernel/kunit.rs           |  1 +
 5 files changed, 68 insertions(+), 10 deletions(-)

-- 
2.54.0

