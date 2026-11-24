Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538649;
	b=l8UYy9XOlbIvFvpyVdfi04son0A0TT9DELfiganT1uJlK/28bfPs+gSPtP9/mwR0cUbo
	 Lkl5bKk2RyQR/gR9Sx9t2uXQEsLm1X5G7ZQ6dxgIUYx6ccmxjgQNHXc7gILRfUcHNxao2
	 WEqS21krEjvIqgdUsf9FE92tPwM0KzheShS5s4vLkbFPtnYbJPafqcX0H+aYM4OWECqy6
	 dykDDHA7Jp7qhnar20+6R9gOOcZaIcPwbGBYDeAvSZwfhUNT8oK7/tOBMROLlu48hUg9K
	 aeTXZRKKrgziocU8yiauJ0hVTM/TjVnHT0X2hWWdFxiv/IhZAxjY10cR4byCaB/ZcqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538649;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2kGWDLp/BfGH9hESLhfoFwYnNZbaS5sbCerz9BqE1+A=;
	b=3BgGvfW0ZJlf1ZdICs/wU5gWvCxLbmd/GDMaM9CAHGOp8jKNG7fxeudzDILmgn3f2PAt
	 B00MruqBOEQYBQ4EA8EYsB/L4WxbRovwjJZD/OY3rtR7af1i9MmlIQ3851q8UNA3MKmG3
	 QcuMnnaJf8/3n51yQbjvhIIsLtDf8mYu+l/BhBKzyXImZsAxbjpgh34jtlMlYUXUzA3bk
	 Gf0Fh5479nnHiMazhmIgIsJ+xU4wcl8CmbpHcXCqd0nrfiuV+toCEwIff6pZqyoSaRj0x
	 sVhu8BCKjqfyzIY11D19rjmooW5a6/xg2P8BsE8jBf9SkzD3JYx9mdk/ZpECpv7iaPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d030bkLI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13D606A323;
	Tue, 24 Nov 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d030bkLI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795538648;
	b=Y+17EtfAOOOsWiA4RutXCN9XoIF7H+XQdwMzWmFDW27Tso/M1SjSPdl+GY1W6RLS8Uhx
	 46sJZh3Ap2gE5CbucsZmEXzVSfKMK5vj0fZBrNCgF1eH+s1R2q2mtvUwZMveC5tdptclc
	 DRvu7v+tyPpALC3xEnjmNF3ZJTg+eEj+JIuYugPOToebIWXFA5a//IYFk4s0LmqIRY8P8
	 8AfLLtdqQn68Yhz9ZFJR2CqfyG7LS6336PGSzjGiLnUAqxXVUur4QBzLXINCb3onwVRmV
	 jIwecdNAVaYDKYENWWKaSj3tf1XCrH31HzfhErk5d5QByDJFn4ZqGQWy9knlvZzDAWA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795538648;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2kGWDLp/BfGH9hESLhfoFwYnNZbaS5sbCerz9BqE1+A=;
	b=f139UdWOs0ke+67pm+W/6ttBKwUbLtk0rDQvd7xcH+u82e8hsaYMtKvVfD0+JHJXjMB0
	 jmAdNVy2JqeBtFO8MwpU6eXnsw6MDDaijkI15qZxnWziBUHxw+3QmEipFFKtABtPv0ZD2
	 vcJUBtBKogMzGgRH82GAIsrNMiiHXYmDJtbHmqY6qoDl6/Iqh0kRJj39xHNXrF39bjcJw
	 bnQ+dzyp5uVklfH2u1YHAKnpvCOzPqFfCccIYvW16dFvNISNf8SbdPKVND5ia6reCNiMA
	 UfxsoOsEILOm9N9cr9cinh3OsdUSCf2fm0t6meZ69nkUU8XlLfjmxa3+pHqbRDu6sUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DC301F01561;
	Tue, 24 Nov 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538648;
	bh=2kGWDLp/BfGH9hESLhfoFwYnNZbaS5sbCerz9BqE1+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d030bkLIiQZVSzu2W9LONcD52mM6g8bLLJiM4TW8q39f3hrQ6NqV4USf8eUqxlk6U
	 KYjc37drYpYBiD15AS2FJmWDTdpTrc9xvpNpCl97EqYqE7yeoShjYU1Jz/bHpjhHyX
	 qd5Q+Z36qFoP8yrotqpOHBdwKmT5Q/b1Jv5KRdo5E5+BzbZg7Rq+DFxq8/3VANq2Ds
	 UY+xicQRlzmdM8vc8N9KV00ze8fqi4cXcx76+W3Saveum0sdZe50PlpAzQE2lCDBRi
	 3mMDX9jRkBly0x6V9BUyrNPLpazdCLVN80tzQRmAFi6fqjW/QzKsoNqQW+JLK7Nma0
	 uRxWlenMa9nVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A994C4CADC;
	Tue, 24 Nov 2026 16:43:51 +0000 (UTC)
From: "Louis H. Poulin II via B4 Relay" <devnull+poulin.louis.student.oaklandcc.edu@kernel.org>
Date: Tue, 24 Nov 2026 11:43:52 -0500
Subject: [PATCH v2 2/2] kunit: tool: Fail on out-of-sequence test numbers
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
Message-Id: <20261124-kunit-v2-v2-2-e1adbcad6b48@student.oaklandcc.edu>
References: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
In-Reply-To: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538631; l=7561;
 i=poulin.louis@student.oaklandcc.edu; s=20261123;
 h=from:subject:message-id;
 bh=9gIm8lwEHUBfPgQsOux5N4mfKiU+6pcgKwtui91p1t4=;
 b=f4nQNOjB4AHdvJL1btW6LZtQfAeiO1Vg0vrOlewhReNYB94rc1wHXYHf9SKuDY3j/MMWwxD6k
 5wmnTQeIjl1DuIN03PB/4/dKhhO0FEhY+a0tBjltfV/jRgYc0OI9Hmv
X-Developer-Key: i=poulin.louis@student.oaklandcc.edu; a=ed25519;
 pk=LwBiuOLz0gqWTufz54rXgw2coado8UrJcWQ13DbYfxw=
X-Endpoint-Received: by B4 Relay for
 poulin.louis@student.oaklandcc.edu/20261123 with auth_id=1616
X-Original-From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Reply-To: poulin.louis@student.oaklandcc.edu
Content-Transfer-Encoding: 7bit

From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>

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
 tools/testing/kunit/kunit_parser.py    | 11 ++---
 tools/testing/kunit/kunit_tool_test.py | 79 ++++++++++++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index dce365d1..38547312 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -423,11 +423,6 @@ def parse_test_result(lines: LineStream, test: Test,
 	else:
 		test.name = match.group(4)
 
-	# Check test num
-	num = int(match.group(2))
-	if num != expected_num:
-		test.add_error(printer, f'Expected test number {expected_num} but found {num}')
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
+		test.add_error(printer, f'Expected test number {expected_num} but found {num}')
+		test.status = TestStatus.FAILURE
 	return True
 
 def parse_diagnostic(lines: LineStream) -> List[str]:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
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
 		self.print_mock.assert_any_call(StrContains('Could not find any KTAP output.'))
 
+	def test_parse_duplicate_number_exits_failure(self):
+		with tempfile.NamedTemporaryFile(mode='w+', delete=True) as log:
+			log.write('KTAP version 1\n1..2\nok 1 - first\nok 1 - second\n')
+			log.flush()
+			with self.assertRaises(SystemExit) as result:
+				kunit.main(['parse', log.name])
+		self.assertEqual(result.exception.code, 1)
+
 	def test_exec_no_tests(self):
 		self.linux_source_mock.run_kernel = mock.Mock(return_value=['TAP version 14', '1..0'])
 		with self.assertRaises(SystemExit) as e:

-- 
2.56.1


