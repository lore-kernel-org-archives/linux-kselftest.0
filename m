Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902511;
	b=c7H7ZqymSwPwtLo9vGCV8gzb0gCQ9QPhNcmhTqI2K/y6IUXTzhNS8/A37sy3d6FKrNNC
	 Pa/m6yia177jQu7L3SVi3WYppDFlOBkALoqFLrJCxFm342AV4d58RPJHeN2OddMYaU5fA
	 oPQ2IEufk2DfpWcSn0n4GRe6/dEfeUsrTw2f6KiQ72ZgYJC0w3lGUAQGhe+3ujS96OEsO
	 rKN1prbeJabjA9bjsYWfdFvaowoIUQ+DE0K4x5SVryLQCOmbmLECof28QrMB8Mp/dOU4/
	 nt0lZ1axhEk3eLVl9mlN6Gw4vo+SvCC2NsEyX+hTXoaXqnvIAEfAB0xy7ioomyJom6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
	b=tJYtrABiotARbvLM5MPPRS8qUA6cNSMDaReWzKIwkpRF8KfCsGXB8jN/d74mte90n86z
	 BeNZfRnmrRKKviVuQ9t5G+sqpaW4+idZcCdPy/kG70kW2VTf/3gcgx9odo4t7zGOvems1
	 fIjsqDBNVfpD5MjMNGvFz5PyXZvBv5s65GfV9pZCssSZZ+b95MI9FA/TAbAZb/fH2dXWD
	 b+HDsYTfE1x/T3muRq5gqS12n/lDmr2W9LHa8C1WcYGRdxmDrZ27N41GIekXPjLIuPqnm
	 Gx6IW/cAfnfez56m+3KALk7hIFXV5DfULQZ2aaVznGrMa5bwNkTLENORkF6vx9MGmXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=fJt89TRB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48E606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 18:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F48E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=fJt89TRB
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b31261e8a9so15956887b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 10:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902509; cv=none;
        d=google.com; s=arc-20260327;
        b=XgaffJKgpavyE/o0CzXak7csgdADOPZQEJApAhCzR2e3OnjA07jmZCMNvIY2EcZXCA
         ROgjq8MTrAxPtnl8ArIxCd2heFV84i7Ao/gW2sMq4Irzvaqc75hpZz+l8mdk8QR1R8Q1
         s2b0+GIdCH1GcgTXpDl6edm3ub5A5ntbeuvMLnd/ZzHFZ96NUDq1JWKaHuqSwBTAamei
         ABlhhfBnLMhknVxBFr8SyNLHr5cHBijEQ5CPb05GMHA06wqMJhHmdLdM65g6iDJpMWlJ
         NqpjRM/xi3SPN3atTPoaFVlvW8ZYLoG2YpTCDGNuAhRWZOQ0M78sfNX8aHy2susdHKpF
         RxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        fh=yAUYFIxDLnAnKxj65lxqBLLSN6JFBYkpLKGXMxE53d0=;
        b=MRRNAmqf5CCBx+8UlXedCFXnnzKJ+c/SQ8u0ckX08jZW7KxffRvCrlNErJPmgM36wf
         yR5Ug8llRWkJIYrC47wissHurEiKZuB1lWNoSu5sKQZvUq5kxe+NtbWmpQakGL+Vej++
         46c5OtSKAxW0ccERd3ug+YV01eFQVEUnSvNKPCbMMRJeku8VQsK+9GijCAF21G70e77j
         VPreQOsimF1X4sdXpr6v2uwjtbB9noopLNpVrmUE2Qcgah45/RsnvMWRItwFHVkhXsyD
         bDEIebWm3rfqvvQ0t/4t7OusqeKeBEkat7z/Mxons2xgvP3N1OrQwOMErg/DlMb8He9A
         gZXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902509; x=1794507309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        b=fJt89TRBlMTogaHG80iNjELjafkYPbztK2xby+29lafEcwpFQgneAHsjuZX2CQDMyl
         EFo3UDd/pxOLMlZMmyKh9rHWpJqBazdmWPss8p7/qrQukGXj5EQDFTT647nBQLo/+MUf
         DWYGtH6yGmrdi9q3ObLftKEuWwTmy0mlVhDPACYvTtNlPDLv5aFHZBTYHvsxY8HCcwWb
         4RbeaGnV742BF7FO7cYI7w1GCFU8Xv70Qey9z994NzW9vS7isKcP/oC2DwTyDgM0lCrp
         Ii1LrddcwYW4r6xJ17/yDFirDFopTP7f1IR4jxzStazf7k73P/5e+mh5g5niu9+SlZY6
         ZzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902509; x=1794507309;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OIeDdEexw13ZpIihlOv1PeLZQLPa0fMafsQGzYNzVzU=;
        b=FyYPvtzV0/9O45vLU8q5UZVEhn8ahhjt/tdNKyiqa2ByXkRVsqU0foDOk+URk9Ybm3
         vw6Pw4ftK5HZOnnr6Ydg+4oVGU9ByNRPYVTqh2UUSLgur14vfr2SZndznhtwq6s5V7LC
         J+D2z2J06jfxQGvxp054+QSmZQv6wbvomWfXB9+qSQdPwjGqAvW7IQJ7/n2SkzjkX1X5
         l6viVtpqtujDtJg+rQvOXbepuPdc1606q7WvefZZ4ZYseWckGSpcttKxpUkGc4BYdazC
         5go8+5Gguy0e5uGTCYjQHQLmk5qnWuex997EgFSKTGQ1sj/iicmivszztAbWu3SGZrc9
         /DOA==
X-Forwarded-Encrypted: i=1; AL+hErFZSV1kmGQV1WdB1fYmIpHTSctp9P9/VnGYBm4G8tAOLgY4sp3OgVdCBTPPPh4WrAtnYxTJFy+qscODxlD2x9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eunvwJuDNGxFqP4OQZ+zLlT1re4JbwyzuGnz/nmBN2p5/2yQJ
	8jAFBqZKEKyJ5g/YIW89ofV3UAd5HH/GmwyrlRVGASkhIF212lwYLhdky0wwVFsbgDupoTflTYs
	bL7flS+Vy9jWXVPieRKaUUD7+cXTcnAQ3kxACsAYgQCzSfZMlN5vjOPc=
X-Gm-Gg: AYBFou3T1m+BgXk865CYiGQHFssfXqmQZwP29VCxJKGGY242Irrdhbv5bI5UvZrwPCO
	QcZIebNjR6qA8pUuMxbgvexh7WB5bcln2SA9pyf4BKbQNBtMnoxMUA2AhzxXvDZX3ZFmVdOIaW5
	YUUL3ZLxEM+ZCSyu7/1BZy/VRmKg/mzntalDLG8Wr+eUZJYBVp4jxqS0A9MycQmCNhRXZG6Ve22
	eZSlFA3yPozGRF5xpJ3JHk8lhW89vEzOc0hb2IltMv0kTPcRXW9Bvr3J/iATpnqBjO52XaqBIC0
	tB8tx/WheBCtkBWzXEMsH5lxJHfop+carZx5R0RYoTSEt8u2bCsxkbKcL+CuTdiDGobqnR3YkTP
	mM3pPzWtz3HdRzgNpIK6FbaWa2z55i78mgw==
X-Received: by 2002:a05:690c:c50d:b0:8ab:4f41:c97f with SMTP id
 00721157ae682-8b2b6719327mr123192277b3.30.1793902509478; Thu, 05 Nov 2026
 10:15:09 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:15:08 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:15:03 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 12:14:59 -0600
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
In-Reply-To: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
References: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Date: Thu, 5 Nov 2026 10:15:08 -0800
X-Gm-Features: AclHuK89qADI7pFkx0obg9IOMh8ymHTkC28ZGT0qB3IpQmXXy_-ySHjIDHs7acU
Message-ID: <CAGQButv8FgH0HhDmg6PTG=6S22NdjomUTjd+xyNSmQ09zuXjuA@mail.gmail.com>
Subject: [PATCH 2/2] kunit: tool: Fail on out-of-sequence test numbers
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

KTAP requires numbering to start at 1 and increase by one at each
nesting level. The parser notes a mismatch as an error but can still
mark an ok or skipped result as successful. A saved log with duplicate
numbers can make kunit.py parse exit 0.

After decoding ok or SKIP, mark a wrongly numbered result as FAILURE.
The result record is malformed even if the test assertion printed ok.
It then contributes to both failed and error counts. This avoids a
broader policy of failing on every parse error, which would also
change late-plan handling. The preceding patch preserves this failure
when a parent suite has only skipped children.

This change covers numbering mismatches only. A missing numbered line
can flag subsequent results whose numbers differ from their expected
positions. Other malformed or truncated logs retain their existing
status policy.

Commit 14e594a1fc8b ("kunit: tool: fix count of tests if late test
plan") deliberately kept a parsed pass despite missing results after
a late plan. Its fixture also had an unrelated ok 4 result. Number
that result as ok 1 to keep the plan test focused, and cover a wrong
first number separately. Add duplicate, SKIP, nested-suite, missing
number and CLI exit-code tests.

Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
 tools/testing/kunit/kunit_parser.py    | 11 ++--
 tools/testing/kunit/kunit_tool_test.py | 79 +++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py
b/tools/testing/kunit/kunit_parser.py
index dce365d1..38547312 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -423,11 +423,6 @@ def parse_test_result(lines: LineStream, test: Test,
 	else:
 		test.name = match.group(4)

-	# Check test num
-	num = int(match.group(2))
-	if num != expected_num:
-		test.add_error(printer, f'Expected test number {expected_num} but
found {num}')
-
 	# Set status of test object
 	status = match.group(1)
 	if skip_match:
@@ -437,6 +432,12 @@ def parse_test_result(lines: LineStream, test: Test,
 		test.status = TestStatus.SUCCESS
 	else:
 		test.status = TestStatus.FAILURE
+
+	# A malformed result must not make the run successful.
+	num = int(match.group(2))
+	if num != expected_num:
+		test.add_error(printer, f'Expected test number {expected_num} but
found {num}')
+		test.status = TestStatus.FAILURE
 	return True

 def parse_diagnostic(lines: LineStream) -> List[str]:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 5fd386d0..6a3011de 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -410,13 +410,78 @@ class KUnitParserTest(unittest.TestCase):
 	def test_parse_late_test_plan(self):
 		output = """
 		TAP version 13
-		ok 4 test4
+		ok 1 test1
 		1..4
 		"""
 		result = kunit_parser.parse_run_tests(output.splitlines(), stdout)
-		# Missing test results after test plan should alert a suspected test crash.
+		# Keep this test focused on a late plan, not result numbering.
 		self.assertEqual(kunit_parser.TestStatus.SUCCESS, result.status)
-		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=2))
+		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=1))
+
+	def test_wrong_first_number_fails(self):
+		output = ['KTAP version 1', '1..1', 'ok 4 - fourth']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
+
+	def test_repeated_test_number_fails(self):
+		output = ['KTAP version 1', '1..2', 'ok 1 - first', 'ok 1 - second']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts,
+			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
+
+	def test_missing_number_fails_later_results(self):
+		output = ['KTAP version 1', '1..3',
+			'ok 1 - first', 'ok 3 - third', 'ok 4 - fourth']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts,
+			kunit_parser.TestCounts(passed=1, failed=2, errors=2))
+
+	def test_wrong_numbered_skip_fails(self):
+		output = ['KTAP version 1', '1..1', 'ok 2 - skipped # SKIP reason']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
+
+	def test_wrong_numbered_suite_result_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case', 'ok 2 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SUCCESS, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
+	def test_wrong_numbered_nested_case_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 2 - case', 'ok 1 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.subtests[0].status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
+	def test_wrong_numbered_suite_with_skipped_child_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case # SKIP reason', 'ok 2 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, skipped=1, errors=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)

 def line_stream_from_strs(strs: Iterable[str]) -> kunit_parser.LineStream:
 	return kunit_parser.LineStream(enumerate(strs, start=1))
@@ -797,6 +862,14 @@ class KUnitMainTest(unittest.TestCase):
 		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 1)
 		self.print_mock.assert_any_call(StrContains('Could not find any
KTAP output.'))

+	def test_parse_duplicate_number_exits_failure(self):
+		with tempfile.NamedTemporaryFile(mode='w+', delete=True) as log:
+			log.write('KTAP version 1\n1..2\nok 1 - first\nok 1 - second\n')
+			log.flush()
+			with self.assertRaises(SystemExit) as result:
+				kunit.main(['parse', log.name])
+		self.assertEqual(result.exception.code, 1)
+
 	def test_exec_no_tests(self):
 		self.linux_source_mock.run_kernel = mock.Mock(return_value=['TAP
version 14', '1..0'])
 		with self.assertRaises(SystemExit) as e:
-- 
2.53.0
