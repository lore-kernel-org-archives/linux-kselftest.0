Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647846;
	b=oUpYLbJtvbkzDN4p9NDNxMF0wFpnVz9L2l5aR8cil/Rfpkkpli4yUayG8l1Hlv357grD
	 wYS93pqsYQf0vCmsAxs2N1EDFoIASJdhofLjX2gQTIS0wSV0GnjiLxpNgCIiSKQhL9nWo
	 kVYY4PjS2uF9M1EGYQ+4tNiOrACVpJnapGuZwgSz75PGl0mKNK12jTEEOEeXZEz5A/pNo
	 9WQtmfjaxNo1boapyQcySw/XI8ySBBvH8JkQkYrTNLSA4jr5LMhLX9BAhPQchsTDRTtba
	 DjXyMJFze4CfCBXt9J26fOYlGKEr0cUaqCv4A/TCSD+M6jlJWROCZAJX6Ljo2wfFDZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
	b=LIi98JoXCoaQxAlOcckOpRXEWEyBRsyWax9rjLWlw9Av+XJjv3YZjPDxf7bpNXVCGpcA
	 WYoRymlQrKNFivR1L0VO29XxUrW/XCcdFLTHouqQlWbR0MJrNEkvX6Cf843py+M9oyCNV
	 hcCG1mALNzgieH3Edz100a+RfuH9YajcFsfl9iw3Gh0lOk4mNvUqeg8X6R5lbtiV/68pq
	 qQXyDQqr3LAoJmYXkU8GsBIUqDfSylz7cFUUIvMZ5MYF/W77lb+FRzV+s5aPlYthIDJ6D
	 U27Yb1cN+XeZEKElkKUIWUodioyMKukJSy4Z0VystvvKzXBCZPZe1AfZ9iO+T/7+t9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuoHyeq2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0E606A32D
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 09:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E0E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuoHyeq2
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d28f75d62so404308166b.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 01:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647844; cv=none;
        d=google.com; s=arc-20260327;
        b=cUTTFxW+Lw5rNn7BhoYKXvwFiUjo8M22ZSgYQNEOCY8o7cbMcfmfEC+GjdejPjuzpS
         ThHRechcDDdHTcW3G0mgRYKXtoYS/L/4Lel0hlglaQcN9YOfWWdK6e4XJUMDukE72W+g
         r4GRPYLhHfYatZ12gyvs5z3me/yuOBmC2+dIxNJPCIJC9HqO9xq6hsz1MtU83ujkzFhp
         i8qgM28llBbpe1+0v48LC001ruGeVQrtiJWG1sMABhF9sp2NVgQFW8kurrWzFIHbYXe6
         N+njALeqdX1BHWo+msTKenwTEEalnFjxLvDT3HeMSy3MSCNyHJuOj5cxRl+NIn5D63h/
         0+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        fh=tHp7dJdBt3FzoXlCZvct8SX9eGTXOTsrRFKJ0cYTPPM=;
        b=YhDBk+pEkGt7E+TE5YGuHxrQjR0rNQkVSC6U3pt4gPZYyexTilhHWhbAwZHlQzE8/v
         a7oYcmJRQVjGvcHjvjQdq5d6jfxOhrd2gYs/ZI6b3ncKtKrhuAk2r9OYahYnlgNPhQxH
         moY2dMVIBtIObz07kF9aCmTAKgYowmAQlsrgGtPnY55AjgAc78HHMBYGuTcK19IxVgcl
         4ZOmDE6GTkEgIJAxLS7MoVHJzYYxZr5JNvC3ye+NT9GbDfWkxbLFSLGQ4pIgMzeixlKB
         O+N9260DlNgYqm9/VWhxG9rPdBcDalzBFsnYwb1dxa6dIrYL6V8zntfMGRbZ5MrgI8IA
         qnHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647844; x=1795252644; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        b=zuoHyeq28xYk/LkSZzD8EwyUVkcS8Ed3zGazNJNNODS59hIqCO95aozy3R/cca1rSr
         t7B67SIGfsKYQ8EGX2QZSFsl0j5k9UMSvhMbNJWpZKPY/6ZXjR5/FIDlODuog6aT/jts
         w5CM8fxUhXLAksP5M9wLde2w3HHXBpLehV2feC86d+L0pE/jfMyGTO6yhgLnMfAmuAUv
         bqiZ1Qp79q3IC2yFoT5aXoDb2HUclPtmRJftexpcfkOLo/yMTUcLM2t2fRI5deqkEY97
         +pQrz6smxXxPda7/ZKT843Xc2KQmeFHK5sgAiIrknrFz9ThVFTWQZR5Gajy7QdRa5zG+
         9FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647844; x=1795252644;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkmjD2w6BuG3aRUNMDh6318/ifTepnivrtcxC2LrWG8=;
        b=bAMxnGoKd4aJHPTopmk53If+xdU/0avyu+4ligJdv151T3HqOYfNKZpiPXVvWdg5us
         yY9bffnL0q2k1NjydDh5bM1T/Dm5HrFobP1kswX7PDd7EUQUfVHoG9qu/0mb9iUYWzF1
         0Kd440+fF9s8bMUYxrcGOYyIajj7v2sxTQtwyPIWRMDEsdb8w/Zhy2iO+rmt+NdGpAFY
         +aWhmc26eoHanLjWF+xntqJ2ZjcvqpHNJYBRdUnS7X4H3EM8bFIF2EfR6w3ZhlNzrvV9
         32tyCeoDwq9T3v6PRMDJNLjMAI3ZCHQJXJa5hj/853BGQZBG03dgf2CPAwpRMkMj1DWe
         5I2A==
X-Forwarded-Encrypted: i=1; AL+hErG6c7zf7NNfRYUz7wkBA4LSTXUoc+US7Dx0JIWe/x93hVpeF5bYgagTWkD75N2dxinR0ZHSgewUdmZ5gNa0/so=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oPgZjmbCT6157+DOL5nEnzECQI2BDv9RsZeuDXLP30BoTZO7s
	aLeqR+EA5fSNzpwdZ/OlZ1j/d1BqRaq+eq77zs5vSe71W18KOCPFd8fwjqUf3NE7HpYuar51Puf
	l4PFiwJTAbHJzwGxyCZsCz4xK66dW4qU=
X-Gm-Gg: AYBFou3yvv5C4CFvHGRmscMfMkYz0/OA8jbhFJcBeTyxov8+Vxz71gkahjn7/DpWIvF
	OeQ4hcuZBoLZJ4tG55MtEW9lEZg/SnmCdKTJX/HKHHemVeHDI6C+G9y9KQQTVWPNOVN07Ufo2bq
	U5B/MCri/hFOJx1aWC5zjQ5Mx+5i9yU+qEdGUAC10r6NQF4izSK932JZK5no+X9bm3eh6aEL7lN
	5sNz7Zpb91UFDOmNJzax2kToitw0IoRocUQUdkY8GAOXhH6o4P713hEzXxH2uCTYOBePyX8OrqP
	XXRn+ovzPYlKduiCm+OQkPczx47PKIgI5E8suRZeUdt+CQ5gIo0m9xtUAyNzf/pu2HW7RdQL5Ss
	/4WP5GOwxOb2CHcqVJ8COCin0E/st6HdEpshqYcZEX7VkNbhkBbmMRrWxIPXqKJxwlreUMwEDU5
	gBeInqds0JHwiS5Us83pheDcfuFVHIw1cVuBtHtRlK
X-Received: by 2002:a17:907:97cf:b0:c50:4d71:a855 with SMTP id
 a640c23a62f3a-c509636747cmr373247266b.19.1794647843950; Sat, 14 Nov 2026
 01:17:23 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 14 Nov 2026 03:17:22 -0600
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Matus Daniil <matus.daniil@gmail.com>
Date: Sat, 14 Nov 2026 03:17:22 -0600
X-Gm-Features: AclHuK_-xZ7mU1NTkodBroHEs2k2-ma0Wf43DuoTZk_clmWCABnU1f1w0Md0UBg
Message-ID: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
Subject: [PATCH] kunit: tool: Preserve suite ancestry in JUnit test identities
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

Fixes: e9e05c72752f ("kunit: tool: Add (primitive) support for
outputting JUnit XML")
Signed-off-by: Daniil Matus <matus.daniil@mail.ru>
---
 tools/testing/kunit/kunit_junit.py     | 10 +++++++---
 tools/testing/kunit/kunit_tool_test.py | 14 ++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit_junit.py
b/tools/testing/kunit/kunit_junit.py
index 362207035..d5730aebe 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -10,7 +10,8 @@ from kunit_parser import Test, TestStatus
 from typing import Optional

 # Get a string representing a tes suite (including subtests) in JUnit XML
-def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
+def get_test_suite(test: Test, parent: Optional[ET.Element],
name_prefix: str = '') -> ET.Element:
+	classname = f'{name_prefix}.{test.name}' if name_prefix else test.name
 	suite_attrs = {
 		'name': test.name,
 		'tests': str(test.counts.total()),
@@ -26,9 +27,12 @@ def get_test_suite(test: Test, parent:
Optional[ET.Element]) -> ET.Element:

 	for subtest in test.subtests:
 		if subtest.subtests:
-			get_test_suite(subtest, test_suite_element)
+			get_test_suite(subtest, test_suite_element, classname)
 			continue
-		test_case_element = ET.SubElement(test_suite_element, 'testcase',
{'name': subtest.name})
+		test_case_element = ET.SubElement(test_suite_element, 'testcase', {
+			'name': subtest.name,
+			'classname': classname,
+		})
 		if subtest.status == TestStatus.FAILURE:
 			ET.SubElement(test_case_element, 'failure', {}).text = 'Test Failed'
 		elif subtest.status == TestStatus.SKIPPED:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
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

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0
