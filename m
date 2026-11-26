Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707296;
	b=5H6IxAaj6MkbYBMJc0IFQWlST/QZGqfJ6dMdBH4cFTbonL3V0hgBv6E7KQWBwLxeRRBr
	 aRzEzscRqZJBp7PKwZ6vM103vf7yqF2lXNL20H11/FAb9nCIXc2v2Exs05YXW8qosylhY
	 RmMw7mVtEDk3UVfjWy361LAiANhGmRZTgmsqgB+VqpxEywfkdCemPoRDwDX+NU/dFIAqo
	 KFQIkMYf/UCzqH/Dc+vWRUkoRfCebSYDvOmt/YUDrdNap+j+/6ugrf6a9sqGw/10PoNXJ
	 Szj2+MRWAzSv8OlDqirUbXJw5AR52aWJlvhQBtxwnblteN/DDHXBZXLaRuBStgI7dzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707296;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:In-Reply-To:References:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=B/HUnvAbOtNt4rDSrPJDRorwf8U9aGoTH/cBx0v4eEk=;
	b=H5Q5pi0A4BSpO9q5Uq+O1xGmXuX/sLU7Z+5dLPdHYOV3zN1LKJsImXXtL16//KEcYcMP
	 og9JNrgAt3AMasfRXYGYkx7OB5F34VVxE2DAPCREgRmM6o5F9xgozwr6607JeQHNMPvN6
	 b7Q5stHA9Y4dBIafvoOzkaXodkOC6mYmitMFhPXyjFMDbpkfrmDZRhc8HgheWXthNLzl6
	 lgCvQN0T9Z2yt/UbefimbwMRD1BOuzcC/MWalrVuKfKDy4BL8knOIdWM58VEss0qzKxTc
	 qN8ysOgQFO1/M9P4J2yukfiOib++y5E+sXiNAxFqJVN8d6sxtjDZ++FNThpQ93n8PRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZPmR89F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2F606A31C;
	Thu, 26 Nov 2026 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZPmR89F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795707295;
	b=r48tsQoyMuneuZwuccDXMkonx3UU4nkQnqh1oipscps3g8OQU084GxLUaOEWGidHInp3
	 8uPPU9+sWFQ2iez9CxMpIEIWO6QwKkOqQchWg2c3OMD7fuM6uhDeRtKoHspfxAW0pGWhs
	 +qhWnm8SNhRBJIUoq98tC+V/plkWdreAxQmaWSHGbdN+MtYvvN6rZc4dWbSlB8jTwZk0M
	 9PNlcNt7DXi3F9f0xaFup9jxVRzljady4X7ESRntjiz4aedaxTiywPJUYvbYN0d3N+Eg6
	 Q2l7KzZlyPxZvW2QMbX/Crqph+UqVfEhDWcd3erP+EH9iEhZYX5tnEWPvP76KrJfvhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795707295;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:
	 In-Reply-To:References:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=B/HUnvAbOtNt4rDSrPJDRorwf8U9aGoTH/cBx0v4eEk=;
	b=FPDnvbn27ZoEU6Cr19fv54jVRDR4i8sgLy0vnuNz8tvNvNq8BPamgPWWCY7qEdmSSE5n
	 nLus2BDapafjUwV4lJLfDIJa61Jxx5SGIcCLOC1hzICdd5+XF/vwdLBq/IiF7W5lX9Nof
	 iEiYlYd1yjZEE05mntK+42WRxTe3sEjsTGNgO83hvGKvv9S4dgTAppxQ2g28xWemtzZ4+
	 ZsnT32aw16UvFxNXY65Xaqu4zLpaBVllJcw+HoqP9FTQrEyFr8acPvGCVkbT2ECQeaUI8
	 FmYKPZtPHhxRi7BDVlnXEpyAWwdRo52aeEPofpMyqLzSksqJXaDSEY9NTFHBAC/mZNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 053061F000C0;
	Thu, 26 Nov 2026 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707295;
	bh=B/HUnvAbOtNt4rDSrPJDRorwf8U9aGoTH/cBx0v4eEk=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To;
	b=TZPmR89FlTTj6292+TCY/leZORZRvZrvfuYx3XAkky3UlPBxJWLqBFoMjjq+ky0pY
	 sEIyL1TqPjzLQHjGwT0J+TzVWeCHhoi/dTr/Uuuo/uJUqfD5+UMAgBu0XumGhsvvuR
	 EJQEqt842UhiGgVV/2ZbG1bPzqFyBEEbe8iX9svnhVBZmc7vOhApd+BtQdlTsCEnkf
	 zGOHHvlCDYn1t53ma0WwrQLcG7hK2isAVKsMY8WfpTCCSiEciwbWT7UqI/xVlmdASj
	 cWZojR34MXzB+23WJS2JcaKTwAXBuUrlo6mHTa/dhdjg6dupLKln1xMdbA/68V0svE
	 3dfOAbf/BomXQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 76D864D5D9;
	Thu, 26 Nov 2026 15:34:45 +0000 (UTC)
From: Daniil Matus via B4 Relay <devnull+matus.daniil.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 18:34:27 +0300
Subject: [PATCH RESEND v2] kunit: tool: Preserve suite ancestry in JUnit
 test identities
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-kunit-junit-classname-resend-v2-1-9b64a461fd86@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIJRCGsC/y2OwW7CMBBEfwXtua6wKaGphNQIgioOSKGHHioOj
 lkSA7FTb8ClKP/e2O1lpHmzeto7EDqNBC+jOzi8atLWDEU8jEDV0lTI9H7oIMYi4Vwk7HQxumP
 HmOosiYxskDkkNHs2TcaSH1KphOIwKFqHB/0d9Z+wzd/zzRJ2f5wu5RFVF9zhspSErHTSqDqgf
 1+gYa01ddbd4pdXHm2LbI3ZCtupr7pt++azjcWv9ekjnzzf5ulPUaQ4a2zh2cTlT7Ny7lf+tZH
 6/FjFVLaBXd/3v/FwwncBAQAA
X-Change-ID: 20261126-kunit-junit-classname-resend-560a1f9ac2c1
In-Reply-To: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
References: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
To: David Gow <david@davidgow.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Rae Moar <raemoar63@gmail.com>, kunit-dev@googlegroups.com, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795707284; l=4395;
 i=matus.daniil@gmail.com; s=kunit-20261126; h=from:subject:message-id;
 bh=guR65c33Yy6aOn8l/8tEcwaApr1EtihpO6MCIUvqnig=;
 b=OAlOK6QD2zDRU86EtZTjHU+7BGEvLys9zTcQJMeqtmHEgE/MucNHt/p6naj4j4nQ+mI/tn+9S
 lfggROcFKXgDuv/TKWgdJS+fHPcCgcuS4sZ8uMXchaANYix+YCXs2RJ
X-Developer-Key: i=matus.daniil@gmail.com; a=ed25519;
 pk=fz9V2/QhKszS4ZwqnIRXMj1O2LdUSQGVUgqGmMdZk0o=
X-Endpoint-Received: by B4 Relay for matus.daniil@gmail.com/kunit-20261126
 with auth_id=1654
X-Original-From: Daniil Matus <matus.daniil@gmail.com>
Reply-To: matus.daniil@gmail.com

From: Daniil Matus <matus.daniil@mail.ru>

JUnit testcases currently carry only a name. A parameterized KUnit test
becomes a nested testsuite named after the test function. Reusing that
function in several outer suites therefore produces the same immediate
suite name and parameter name in each of them.

For example, cs_dsp_test_run_stop_callbacks is registered in four cs_dsp
callback suites with the same "all ops" parameter. GitLab identifies cases
by suite name, classname and testcase name. Without a classname, these
distinct cases have identical keys in the imported report.

Set classname to the dot-separated ancestor suite names, including the
parser's main root. Preserve the existing suite hierarchy, testcase names,
statuses and logs. Add a regression using the existing nested log fixture,
whose seven testcases otherwise have only five distinct identity tuples.

Validation: all 92 kunit_tool_test.py tests pass. The new regression fails
on the unmodified generator. Comparing all 24 log fixtures shows no XML
changes other than the added classname attributes.

Fixes: e9e05c72752f ("kunit: tool: Add (primitive) support for outputting JUnit XML")
Signed-off-by: Daniil Matus <matus.daniil@mail.ru>
---
The first posting wrapped several diff lines in transit. This resend uses
b4 as David suggested. The code and commit message are unchanged.
---
 tools/testing/kunit/kunit_junit.py     | 10 +++++++---
 tools/testing/kunit/kunit_tool_test.py | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 362207035..d5730aebe 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -10,7 +10,8 @@ from kunit_parser import Test, TestStatus
 from typing import Optional
 
 # Get a string representing a tes suite (including subtests) in JUnit XML
-def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
+def get_test_suite(test: Test, parent: Optional[ET.Element], name_prefix: str = '') -> ET.Element:
+	classname = f'{name_prefix}.{test.name}' if name_prefix else test.name
 	suite_attrs = {
 		'name': test.name,
 		'tests': str(test.counts.total()),
@@ -26,9 +27,12 @@ def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
 
 	for subtest in test.subtests:
 		if subtest.subtests:
-			get_test_suite(subtest, test_suite_element)
+			get_test_suite(subtest, test_suite_element, classname)
 			continue
-		test_case_element = ET.SubElement(test_suite_element, 'testcase', {'name': subtest.name})
+		test_case_element = ET.SubElement(test_suite_element, 'testcase', {
+			'name': subtest.name,
+			'classname': classname,
+		})
 		if subtest.status == TestStatus.FAILURE:
 			ET.SubElement(test_case_element, 'failure', {}).text = 'Test Failed'
 		elif subtest.status == TestStatus.SKIPPED:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754..d37354c70 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -18,6 +18,7 @@ import os
 import signal
 import subprocess
 import sys
+import xml.etree.ElementTree as ET
 from typing import Iterable
 
 import kunit_config
@@ -725,6 +726,19 @@ class KUnitJUnitTest(unittest.TestCase):
 		self.assertTrue("tests=\"0\"" in result)
 		self.assertFalse("testcase" in result)
 
+	def test_nested_test_classnames_junit(self):
+		result = self._junit_string('test_is_test_passed-all_passed_nested.log')
+		testcases = ET.fromstring(result).iter('testcase')
+		self.assertEqual([
+			('main.sysctl_test', 'sysctl_test_dointvec_null_tbl_data'),
+			('main.sysctl_test.example', 'example_simple_test'),
+			('main.sysctl_test.example', 'example_mock_test'),
+			('main.sysctl_test', 'sysctl_test_dointvec_table_len_is_zero'),
+			('main.sysctl_test', 'sysctl_test_dointvec_table_read_but_position_set'),
+			('main.example', 'example_simple_test'),
+			('main.example', 'example_mock_test'),
+		], [(case.get('classname'), case.get('name')) for case in testcases])
+
 
 class KUnitMainTest(unittest.TestCase):
 	def setUp(self):

---
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
change-id: 20261126-kunit-junit-classname-resend-560a1f9ac2c1

Best regards,
--  
Daniil Matus <matus.daniil@gmail.com>


