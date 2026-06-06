Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721324466C;
	Sat,  6 Jun 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709941; cv=none; b=U3sjg4ZcKamtuFV90uHlrTWCq8ismCEnXsu/sTLIeORrKonjAvkzC8J9QBf/T8JdYaqf0kFyyK6jei/pNG6UvwMeSznig4vOSfH/pokNNf5ZBYkpOTAnBtatGT7rec5OvsARAvtCl37p4E4j1EYWmPJ1d5emHYp63fnZWeZaqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709941; c=relaxed/simple;
	bh=bmfYE6DWFjcDMC6rdCoT2i271r5SBqSVuvfk9FdNjqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rq3aoTmGrmlj3rPHyKrRZZhYT3seSlK6kEPBDMFgc9GQU+THImCn1teK07mj2VtryxfD78UxdrI/c5KB5Q+u5dx2pkc8D3Bqa/UkMap+Pi/1V88NDFoSD6p4KBUesiX7fHiR7bIqqYSNIJkSKUlenf54TZMHP5+YHcI+6/cV1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=oze/gNtS; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=iQWE2U2M; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="oze/gNtS";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="iQWE2U2M"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780709930;
	bh=bmfYE6DWFjcDMC6rdCoT2i271r5SBqSVuvfk9FdNjqY=;
	h=From:To:Cc:Subject:Date:From;
	b=oze/gNtSBLJZ6P5byLyFBldTxmNu3bsJgggIe+zzruMb4xuBLDU4lIg3VIR4f+sZW
	 XX0fMzanCHZS06Y3ymrgTmB8ty6uUNkCuXc1HUQlXRvrN8DNPPtmiscCzoN5ZfvWrL
	 GIoamgh7CwUudHgyDCZ/XbZwiyxgM6JXwlngngRxTWKjNiQ2CUmd8AiAtc9lwXLp3U
	 ofxN8kyPtnxDWenGZoPvxt/oJtQNjzBr4gQg/AcpiqyZLl/tkQpXVai2vJHw4ksbNd
	 NTF5Prf9laIjgiEN18b3aaAaLj9YAvDuuVJlHbk1IkW6Y29fDz0rc63+1lAtkwa/wg
	 QxGCKW+1U6reJ9ThOmpkfnfCvycAwlryyRE5W0G6yOt+09fKXTXad+o1/a8u/nv1H9
	 YkexJ+wY+Yk25K+67Z0XdT9wSiVKR8VYE4FcIBoJzKJBNe5LKyhucKrvsUKDMVoBxq
	 fKnXOJDvWm69wdiwqQHLlj/mHDNNN8nuD6528cr8Qi1PzE3GpIRlGIv+KCBReAgs0k
	 UxeddmgvxtC58t3xenjQZu3sR/l+3vuSLMgXAqKIbTgCL//USaxRsvHRclJlbgg1Wf
	 oUw3E4LwNLqqeBij4eBHtPrACgCpYpqzIY2vWe9CMOUNF/18+LXWWMXVSpHQuexnU3
	 OKkroU8oBcbl98tZVaHi+itc=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id BB6351EA0CF; Sat,  6 Jun 2026 09:38:50 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780709928;
	bh=bmfYE6DWFjcDMC6rdCoT2i271r5SBqSVuvfk9FdNjqY=;
	h=From:To:Cc:Subject:Date:From;
	b=iQWE2U2MXTel1UDb+v4zLi3ppXUImpvmG2U0ZfbfI7S/T8NAWoX/degrZwSGI1Pln
	 GcK9/SZW3QAvf2jQfi9II0eixjpvib4RkP6/3Z5AvA30OkwGlQxbVSK7YjqQIzdLNZ
	 bBMngd3icXFK9XSaYMyxcTj06v5YV2i0LgiG3eCsBNhuK2TG2TPH67DaDHpZ0llnKt
	 8ZhQSxZQpA02OU+rli3pRX0FF8XgWN5Qs56skXlYH8BG9ubZtRdaNKbZ1621rc1abd
	 U53X8YCTRwjn78ZrwoniqckT1e4/4Oo4jkLlONJnbrq09Zdpv8Y2cQUEEJFGfxWAJV
	 QEEH0DtptMKpuLoglDns3uA94+jcpQSiB64aIifmSzECTJFayM3cRXzejfxi5HjoYW
	 P3sCF58nHdoyjQajJWjrw3t0h6MYhuQ77DdfLf1izP0pO6lT8JMwggONHzXip8zYqz
	 XPoewZFzmfsb/TYU265agvGnoqkwxLIHrSpJyiX0ftCKSY9A3uCIDessuXTLfyR01b
	 wn43Au8x9nNZcWeUDLUMwpTWzDyCWQgjZPN91r6+mNPnnHjETjNdIHfF9Q2S6TN+lY
	 y615fwkLHkYBAOXTElAw0C7e3UM5TBVHjs6AV9tj4Izk1/3jpX6njmv1pZPhnk8MW+
	 za4XFi+igNvzMALFW+9j2+3c=
Received: from localhost (pa49-196-181-228.pa.vic.optusnet.com.au [49.196.181.228])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id BC5D91EA0C8;
	Sat,  6 Jun 2026 09:38:46 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v4 1/2] kunit: tool: Parse and print the reason tests are skipped
Date: Sat,  6 Jun 2026 09:38:17 +0800
Message-ID: <20260606013827.240790-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a KUnit test (or other KTAP test) is skipped, a "skip reason" can be
provided. kunit.py has never done anything with this, ignoring anything
included in the KTAP output after the 'SKIP' directive.

Since we have it, and it's used, print it in a nice friendly yellow in
parentheses after a skipped test's name.

(And, by parsing it, it can be included in the JUnit results as well.)

Signed-off-by: David Gow <david@davidgow.net>
---

There are a few bits of KTAP that kunit.py has never actually parsed, and
this is one of them. It's also nice to have a good way of quickly seeing
why a test has been skipped, given most tests do provide good reason
strings.

Happy to hear comments about the style: yellow in parentheses looks pretty
good here, but could be a bit confusing if the test name includes parentheses
and there's no colour support.

Changes since v3:
https://lore.kernel.org/all/20260604123207.2615485-1-david@davidgow.net/
- Make the parentheses yellow as well (Thanks, Thomas)
- Add some tests for the actual parsing of the SKIP reason. (Thanks, Thomas)

This patch was new in v2.

---
 tools/testing/kunit/kunit_parser.py    | 15 ++++++++++-----
 tools/testing/kunit/kunit_tool_test.py | 17 +++++++++++++++++
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 0e1d2f4985eb..7a021517f58b 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -44,11 +44,12 @@ class Test:
 		self.subtests = []  # type: List[Test]
 		self.log = []  # type: List[str]
 		self.counts = TestCounts()
+		self.skip_reason = ''
 
 	def __str__(self) -> str:
 		"""Returns string representation of a Test class object."""
 		return (f'Test({self.status}, {self.name}, {self.expected_count}, '
-			f'{self.subtests}, {self.log}, {self.counts})')
+			f'{self.subtests}, {self.log}, {self.counts}, {self.skip_reason})')
 
 	def __repr__(self) -> str:
 		"""Returns string representation of a Test class object."""
@@ -352,9 +353,9 @@ def parse_test_plan(lines: LineStream, test: Test) -> bool:
 	lines.pop()
 	return True
 
-TEST_RESULT = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(- )?([^#]*)( # .*)?$')
+TEST_RESULT = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(:?- )?([^#]*)( # .*)?$')
 
-TEST_RESULT_SKIP = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(- )?(.*) # SKIP ?(.*)$')
+TEST_RESULT_SKIP = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(:?- )?(.*) # SKIP ?(.*)$')
 
 def peek_test_name_match(lines: LineStream, test: Test) -> bool:
 	"""
@@ -418,7 +419,7 @@ def parse_test_result(lines: LineStream, test: Test,
 
 	# Set name of test object
 	if skip_match:
-		test.name = skip_match.group(4) or skip_match.group(5)
+		test.name = skip_match.group(4)
 	else:
 		test.name = match.group(4)
 
@@ -431,6 +432,7 @@ def parse_test_result(lines: LineStream, test: Test,
 	status = match.group(1)
 	if skip_match:
 		test.status = TestStatus.SKIPPED
+		test.skip_reason = skip_match.group(5) or ''
 	elif status == 'ok':
 		test.status = TestStatus.SUCCESS
 	else:
@@ -539,7 +541,10 @@ def format_test_result(test: Test, printer: Printer) -> str:
 	if test.status == TestStatus.SUCCESS:
 		return printer.green('[PASSED] ') + test.name
 	if test.status == TestStatus.SKIPPED:
-		return printer.yellow('[SKIPPED] ') + test.name
+		skip_message = printer.yellow('[SKIPPED] ') + test.name
+		if test.skip_reason != '':
+			skip_message += printer.yellow(' (' + test.skip_reason + ')')
+		return skip_message
 	if test.status == TestStatus.NO_TESTS:
 		return printer.yellow('[NO TESTS RUN] ') + test.name
 	if test.status == TestStatus.TEST_CRASHED:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 267c33cecf87..5ebd551b5072 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -235,10 +235,27 @@ class KUnitParserTest(unittest.TestCase):
 		with open(skipped_log) as file:
 			result = kunit_parser.parse_run_tests(file.readlines(), stdout)
 
+		# The test result is skipped, and the skip reason is valid
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.subtests[1].subtests[1].status)
+		self.assertEqual("this test should be skipped", result.subtests[1].subtests[1].skip_reason)
+
 		# A skipped test does not fail the whole suite.
 		self.assertEqual(kunit_parser.TestStatus.SUCCESS, result.status)
 		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=4, skipped=1))
 
+	def test_skipped_reason_parse(self):
+		skipped_log = _test_data_path('test_skip_all_tests.log')
+		with open(skipped_log) as file:
+			result = kunit_parser.parse_run_tests(file.readlines(), stdout)
+
+		# The first test is skipped, with the correct reaons
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.subtests[0].subtests[0].status)
+		self.assertEqual("all tests skipped", result.subtests[0].subtests[0].skip_reason)
+
+		# The first suite is skipped, with no reason
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.subtests[0].status)
+		self.assertEqual("", result.subtests[0].skip_reason)
+
 	def test_skipped_all_tests(self):
 		skipped_log = _test_data_path('test_skip_all_tests.log')
 		with open(skipped_log) as file:
-- 
2.54.0

