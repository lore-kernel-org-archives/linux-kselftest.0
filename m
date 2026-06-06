Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38A2571D7;
	Sat,  6 Jun 2026 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709945; cv=none; b=nn3f9ZvlX3s2ZMNixnj5GXDFMfJ+bE4ggWZQ8uIa9T4DSOIc3uzejVGfwWjV4lXu+ReeH1cN2MylDK9vlA7dlJ5HAD57C1A7G+KyDzOY/+BA4S2Be1FTFmqZ9zLaiWHtFEoe+ZD1SvZcr2cumduUaNx1pRHXXrVB0SA+Y6Bmd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709945; c=relaxed/simple;
	bh=yNLsEOI+io/2TNurWv4M74uZ/SQgAeYVyMZTyhKBCMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yw6m5oT1kMkTszUfggD/gwKjGZCqAHfyoYOoMPXctKfJsBS+qtf6gFnnoQDPu2RU0mHDWQEDTE//j4MeB6TwkCVnkxbG/2vlnKkuUsBIiR9ZwgDW+g/MFNfuQ95l3oXujWUYrq6pifXteAMoqzr1dEZSVRDFYcKLGuK6w5gR++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=LeE2gIB8; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=o5jIwnyt; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="LeE2gIB8";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="o5jIwnyt"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780709933;
	bh=yNLsEOI+io/2TNurWv4M74uZ/SQgAeYVyMZTyhKBCMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeE2gIB8M75Wc83nVoEo6wCc+CMLdAheyXqj7mqZShRyWxTlc+ZB80dZaoFm+j4As
	 2SlsmC2afyitPaYK1uu5ApPcgf9mzETEWXMb2bt14H9BwOeDXaQKF6VUYKalliV4B1
	 Vn9knPzRX+w7VF2SYl0+RdNSIxxom159cwHj/1ubhWSi8mREEOtG+ldFm3KxENCwGW
	 ZfIUM2PzZOpxx6pVvImPYRcvVexB//WsFxenV/KYzIWOG0b8snDDQ7b3OX+/36pKrS
	 xXFDFSd7ghkLBPT1dVQi0oOPbZdJoteZwsNlFh62j4wgnnUzf2RiOYV4bhycXK87R+
	 s9gKCzCRHNSXHHCuM+1kJv+kpxE6ufly2w3Q2TXkrlLzN/WWWkJ9GZzlo4N4J3Ui0/
	 AV7sjGTOO9mGpR6jCOiQEbh3OTuD1QQ1i+z+2Xq8P1G3yXUk45yAlD1ZCTONuUAuoB
	 h2j4e5nYdjXCyIlZjTVTW1CK6iiedoXlDCj+iVzJNZtz2y8toZ1IcbIN5zt0DQLZ2w
	 2OMPRNU9eykuYQbMBuHHj86NIdI+7L9vkH6PbPNeucFzaBgDdtzLHYVErgv/qT6pJE
	 qcVbp+lByr+ApZaMFSYiuywAOIO518aXq0DdesY7uJONj4D5/jN9zhHcpLUUoDtenR
	 rLOY1xKzZVAEtnfYklPI5sxU=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id CD95D1EA0D7; Sat,  6 Jun 2026 09:38:53 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780709930;
	bh=yNLsEOI+io/2TNurWv4M74uZ/SQgAeYVyMZTyhKBCMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o5jIwnyt4xF8p5S4LoSv5/N3oSOEHI+9voN0SpvmNRTn9Z8kSE7+vn/rQxP3cVTuA
	 XCFrC/rtA+ax1Hw44CaVMF/j4nbHHvEqHpMBy3jNOQut9o6OMIDPV1bX6Dak4Q2ngR
	 nqgoB6DdZEF+1/p9wILogvy3fhk5h/pwd978hkdB7ALrXGXsQK7yLhUF+DoDvdrUmM
	 kZfdpnT56TvHK9GTLmhAa2Py8qe9M+mZ1K9mp81dGOkt/IcnQFhfT6Cdwkpg8WP49y
	 zO9bJYIma7KbOTRgyFlnNXRazWCAktVxdlvCeJffuyKY8pl2Wt1VNIiGKyOf9H2w4p
	 P4ncPh1znpUT6OJxm7BFfOh3Ji9U8QjtWwyjiMG00vsSIjKEzL6YxRMSyxs8MkZ5+9
	 ZM+DgbjpLpln87ES2FsZrR6wEBDlp/ewnCjj4gNW2tdC0RAK/6re/juEXXHzSLtZnB
	 Lql3bMFP2i2/wqL5v1mZMLREE4d/yCf1uOgBBp1U0hmaNgjluEqzh1wIa4VmU8Pj6c
	 gywvIJourpjxByjtC3aoyyZR3aViSmx8EFHKa/9Pie3sYCm1vfwLTfOKyQyInZoVbI
	 CBlkRSyjlvYvTahEqi1ZC7u79VpjoCj0RKBvDlamM0z0t2eztsF6W3V/CjY3Ogzlso
	 d7T1rZG1t4eCWAsL04ZmPww4=
Received: from localhost (pa49-196-181-228.pa.vic.optusnet.com.au [49.196.181.228])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 4234E1EA0C9;
	Sat,  6 Jun 2026 09:38:49 +0800 (AWST)
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
Subject: [PATCH v4 2/2] kunit: tool: Add (primitive) support for outputting JUnit XML
Date: Sat,  6 Jun 2026 09:38:18 +0800
Message-ID: <20260606013827.240790-2-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606013827.240790-1-david@davidgow.net>
References: <20260606013827.240790-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is used by things like Jenkins and other CI systems, which can
pretty-print the test output and potentially provide test-level comparisons
between runs.

The implementation here is pretty basic: it only provides the raw results,
split into tests and test suites, and doesn't provide any overall metadata.
However, CI systems like Jenkins can ingest it and it is already useful.

Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: David Gow <david@davidgow.net>
---

Only patch 1 changed, so v4 is the same as v3. I'm reserving the right to
switch to a more event-based XML writer in a follow-up, but that'd
probably happen as a part of a more broad refactoring of the various output
formats.

No changes since v3:
https://lore.kernel.org/all/20260604123207.2615485-2-david@davidgow.net/

Changes since v2:
https://lore.kernel.org/all/20260502024918.1056954-1-david@davidgow.net/
- Rework to use Python's ElementTree XML writing API (Thanks Thomas)
- Output the reason for a test to be skipped.

Changes since v1:
https://lore.kernel.org/all/20260119073426.1952867-1-davidgow@google.com/
- Use python's provided XML quote escaping, rather than coding our own (Thanks Thomas)
- Output proper <skipped> tags for skipped tests
- Report crashed tests as <error>
- Don't output <system-out> tags if there are no lines of log data

---
 Documentation/dev-tools/kunit/run_wrapper.rst |  3 +
 tools/testing/kunit/kunit.py                  | 21 ++++++-
 tools/testing/kunit/kunit_junit.py            | 61 +++++++++++++++++++
 tools/testing/kunit/kunit_tool_test.py        | 39 +++++++++++-
 4 files changed, 120 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/kunit/kunit_junit.py

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 770bb09a475a..cecc110a3399 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -324,6 +324,9 @@ command line arguments:
 - ``--json``: If set, stores the test results in a JSON format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
+  saves to a file if a filename is specified.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 742f5c555666..ac3f7159e67f 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -21,6 +21,7 @@ from enum import Enum, auto
 from typing import Iterable, List, Optional, Sequence, Tuple
 
 import kunit_json
+import kunit_junit
 import kunit_kernel
 import kunit_parser
 from kunit_printer import stdout, null_printer
@@ -49,6 +50,7 @@ class KunitBuildRequest(KunitConfigRequest):
 class KunitParseRequest:
 	raw_output: Optional[str]
 	json: Optional[str]
+	junit: Optional[str]
 	summary: bool
 	failed: bool
 
@@ -268,6 +270,13 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
 			stdout.print_with_timestamp("Test results stored in %s" %
 				os.path.abspath(request.json))
 
+	if request.junit:
+		if request.junit == 'stdout':
+			kunit_junit.print_junit_result(test=test)
+		else:
+			kunit_junit.write_junit_result(test=test,filename=request.junit)
+			stdout.print_with_timestamp(f"Test results stored in {os.path.abspath(request.junit)}")
+
 	if test.status != kunit_parser.TestStatus.SUCCESS:
 		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
 
@@ -309,6 +318,7 @@ def run_tests(linux: kunit_kernel.LinuxSourceTree,
 # So we hackily automatically rewrite --json => --json=stdout
 pseudo_bool_flag_defaults = {
 		'--json': 'stdout',
+		'--junit': 'stdout',
 		'--raw_output': 'kunit',
 }
 def massage_argv(argv: Sequence[str]) -> Sequence[str]:
@@ -459,6 +469,11 @@ def add_parse_opts(parser: argparse.ArgumentParser) -> None:
 			    help='Prints parsed test results as JSON to stdout or a file if '
 			    'a filename is specified. Does nothing if --raw_output is set.',
 			    type=str, const='stdout', default=None, metavar='FILE')
+	parser.add_argument('--junit',
+			    nargs='?',
+			    help='Prints parsed test results as JUnit XML to stdout or a file if '
+			    'a filename is specified. Does nothing if --raw_output is set.',
+			    type=str, const='stdout', default=None, metavar='FILE')
 	parser.add_argument('--summary',
 			    help='Prints only the summary line for parsed test results.'
 				'Does nothing if --raw_output is set.',
@@ -502,6 +517,7 @@ def run_handler(cli_args: argparse.Namespace) -> None:
 					jobs=cli_args.jobs,
 					raw_output=cli_args.raw_output,
 					json=cli_args.json,
+					junit=cli_args.junit,
 					summary=cli_args.summary,
 					failed=cli_args.failed,
 					timeout=cli_args.timeout,
@@ -552,6 +568,7 @@ def exec_handler(cli_args: argparse.Namespace) -> None:
 	exec_request = KunitExecRequest(raw_output=cli_args.raw_output,
 					build_dir=cli_args.build_dir,
 					json=cli_args.json,
+					junit=cli_args.junit,
 					summary=cli_args.summary,
 					failed=cli_args.failed,
 					timeout=cli_args.timeout,
@@ -580,7 +597,9 @@ def parse_handler(cli_args: argparse.Namespace) -> None:
 	# We know nothing about how the result was created!
 	metadata = kunit_json.Metadata()
 	request = KunitParseRequest(raw_output=cli_args.raw_output,
-					json=cli_args.json, summary=cli_args.summary,
+					json=cli_args.json,
+					junit=cli_args.junit,
+					summary=cli_args.summary,
 					failed=cli_args.failed)
 	result, _ = parse_tests(request, metadata, kunit_output)
 	if result.status != KunitStatus.SUCCESS:
diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
new file mode 100644
index 000000000000..3622070358e7
--- /dev/null
+++ b/tools/testing/kunit/kunit_junit.py
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Generates JUnit XML files from KUnit test results
+#
+# Copyright (C) 2026, Google LLC and David Gow.
+
+from xml.sax.saxutils import quoteattr, XMLGenerator
+import xml.etree.ElementTree as ET
+from kunit_parser import Test, TestStatus
+from typing import Optional
+
+# Get a string representing a tes suite (including subtests) in JUnit XML
+def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
+	suite_attrs = {
+		'name': test.name,
+		'tests': str(test.counts.total()),
+		'failures': str(test.counts.failed),
+		'skipped': str(test.counts.skipped),
+		'errors': str(test.counts.crashed + test.counts.errors),
+	}
+
+	if parent is not None:
+		test_suite_element = ET.SubElement(parent, 'testsuite', suite_attrs)
+	else:
+		test_suite_element = ET.Element('testsuite', suite_attrs)
+
+	for subtest in test.subtests:
+		if subtest.subtests:
+			get_test_suite(subtest, test_suite_element)
+			continue
+		test_case_element = ET.SubElement(test_suite_element, 'testcase', {'name': subtest.name})
+		if subtest.status == TestStatus.FAILURE:
+			ET.SubElement(test_case_element, 'failure', {}).text = 'Test Failed'
+		elif subtest.status == TestStatus.SKIPPED:
+			ET.SubElement(test_case_element, 'skipped', {}).text = subtest.skip_reason
+		elif subtest.status == TestStatus.TEST_CRASHED:
+			ET.SubElement(test_case_element, 'error', {}).text = 'Test Crashed'
+
+		if subtest.log:
+			ET.SubElement(test_case_element, 'system-out', {}).text = "\n".join(subtest.log)
+
+	return test_suite_element
+
+# Get a string for an entire XML file for the test structure starting at test
+def get_junit_result(test: Test) -> str:
+	root_element = get_test_suite(test, None)
+	ET.indent(root_element)
+	return ET.tostring(root_element, encoding="unicode", xml_declaration=True)
+
+# Print a JUnit result to stdout.
+def print_junit_result(test: Test) -> None:
+	root_element = get_test_suite(test, None)
+	ET.indent(root_element)
+	ET.dump(root_element)
+
+# Write an entire XML file for the test structure starting at test
+def write_junit_result(test: Test, filename: str) -> None:
+	root_element = get_test_suite(test, None)
+	ET.indent(root_element)
+	root_et = ET.ElementTree(root_element)
+	root_et.write(filename, encoding='utf-8', xml_declaration=True)
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 5ebd551b5072..da88c3a1651d 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -24,6 +24,7 @@ import kunit_config
 import kunit_parser
 import kunit_kernel
 import kunit_json
+import kunit_junit
 import kunit
 from kunit_printer import stdout
 
@@ -693,6 +694,38 @@ class StrContains(str):
 	def __eq__(self, other):
 		return self in other
 
+class KUnitJUnitTest(unittest.TestCase):
+	def setUp(self):
+		self.print_mock = mock.patch('kunit_printer.Printer.print').start()
+		self.addCleanup(mock.patch.stopall)
+
+	def _junit_string(self, log_file):
+		with open(_test_data_path(log_file)) as file:
+			test_result = kunit_parser.parse_run_tests(file, stdout)
+			junit_string = kunit_junit.get_junit_result(
+					test=test_result)
+		print(junit_string)
+		return junit_string
+
+	def test_failed_test_junit(self):
+		result = self._junit_string('test_is_test_passed-failure.log')
+		self.assertTrue("<failure>" in result)
+
+	def test_skipped_test_junit(self):
+		result = self._junit_string('test_skip_tests.log')
+		self.assertTrue("<skipped>" in result)
+		self.assertTrue("skipped=\"1\"" in result)
+
+	def test_crashed_test_junit(self):
+		result = self._junit_string('test_kernel_panic_interrupt.log')
+		self.assertTrue("<error>" in result);
+
+	def test_no_tests_junit(self):
+		result = self._junit_string('test_is_test_passed-no_tests_run_with_header.log')
+		self.assertTrue("tests=\"0\"" in result)
+		self.assertFalse("testcase" in result)
+
+
 class KUnitMainTest(unittest.TestCase):
 	def setUp(self):
 		path = _test_data_path('test_is_test_passed-all_passed.log')
@@ -940,7 +973,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.return_value = ['TAP version 14', 'init: random output'] + want
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
@@ -953,7 +986,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300),
@@ -966,7 +999,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300),
-- 
2.54.0

