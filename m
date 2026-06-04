Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4FA43D508;
	Thu,  4 Jun 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576956; cv=none; b=qJ4SrXo/Kt+MnzBqwjQoloNR0P+fqBD3k6nUasnQM6LWGdwCiGCqXBzCoZakFmSi2Gi1IsLf/sfr9FRegAYD2JDXgpgL5kzBU3gE6tPbYKckcByIbtpy8uzpGtghD4Ufb83LjM9bsBmkuZy+CvTWwizIZ9NYSpFz9Dwhn8zIvp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576956; c=relaxed/simple;
	bh=DyEqa6XEM9Mffh9hjQjZla5OH87SfMsISMtk2ABEBFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btPRXBeZlhDoVtYaLBEhKIGNDfRSN0z1ar5ZbRN1CNHe7OLeGhoTqTgTBA+/5ScTKxUlhyyUWCrgp0XRW+/233K2OG/ItNXKhJVXPpmyyTc7tNV/X0Gy0uZ9H60f5BCOyyQdIQwp5ldpPHEThop9eGbkQsQBRFlap9nMITdvZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=kxgg3K90; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=P/8RTayF; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="kxgg3K90";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="P/8RTayF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780576346;
	bh=DyEqa6XEM9Mffh9hjQjZla5OH87SfMsISMtk2ABEBFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kxgg3K90ae2MK/bRFvxiKPhI5jlWG4JxkzR9yjNAb0ouYK3S28XbisjQcs2V4RLlp
	 vuo81fUF/se84K7w//8J40em5QkqchMdFuKfXFH3Gqf4QCCFVIZ9PExFaDsSVqF7yT
	 ZSNr6XByGyBvlWCprGel4/YOtr6axnc+e4Q8i4T5TfmY6MUtc2mHaGLh6w5vQFUSRE
	 pkAoHmXYNa5F/yWNpoggzp4Cel2TttTZStCfXZa/7CSqZztgfD1xzanrEUxz2+1eMj
	 lThTYphFh+ZSk0gqh53A7uC1oVj2hrNHjlEzzDQ/V8d3XD1HvZbWMZv6+JLI31uuQ3
	 sjgK+h7DjyLYjGfOBf+zeOUJWlz/rbe2f5LnIYJEv7vu9+P/lTE5maWsp3bQ54su/X
	 NoBPTZHlkBEF36YFs1hI0zSeMBFbTtMQfrSmaSQH6kuE7LKbl6+gwrxKOQwczQsKu7
	 wOcy/h0QWdv7CQf9zr3fPTBfZ1/073BStK+BPxEcya17q6PzpsqrHJ68CwQDBed/4A
	 FIh1nfSDX9piwpgqxUYe8xdo0HdcwiFD/ajIBkFfiHqqK7a3v/yxcO7XGlz8uvrrne
	 Y90fNCpYtYJPtMLa1C9/4ZrX/I3xi21tRWawLOHNbTtFeochfiwDif3/DN+9eCExSl
	 GpEetZS2c03RnFA27kEgBYhs=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 803981E917E; Thu,  4 Jun 2026 20:32:26 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780576342;
	bh=DyEqa6XEM9Mffh9hjQjZla5OH87SfMsISMtk2ABEBFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P/8RTayFWd6v0ntaPPtJTMsnMjt/1SYfepJDUL3W2hnXOYh+VCADBcUipCdiK0vr5
	 HUfuor5E3XRvTs5h6VHCYh/WfwPfbAknAHk+DGJ5Kg4y8nt4RnDuQxnRAlpklBZApc
	 MxLM5qKAbt5d19YvaR7aq0r4bVEAwXzbwSQOPku+FS84cwpm2n9wANk6mRFQ8gOgbu
	 g5Sax14JyQgK9/iT1duAA3WgNOOTE4JhAQBQENQNPoETXqOnB785r/Xz/BPtW1/ndM
	 3Dif6/EbNfwfKBvInrXAm8FCr6sL9gTZlEj609RlXeypZIgLYFr7SW+Ks2Xd6Q2HLZ
	 lZPclY9SvMtx+fmJ8nNx4ZwTsgNa8JsLSHpNSdNO7Aac5D1dxEnHxcHvq3URA5iTXz
	 L/BZHcQeEH816AjVcfCs98Gh2eM4jNcdaHgDZ8EoHDHTw3rB1tv9pkMIlKyeMKFXIP
	 c7AXpyYG02R2G/NUZvRud9s7VUVIL5QluKnH/rNMGCrRxJpdcETykIWmod8p6CCQ7A
	 5yyU47BIstvX0/+dN+5uo21c4cNDId0noM1oc+mcJ6su/QB39sKahlv2VUWpROaHrM
	 5ZQBwf535EuE/JHmIwpQxIFCrLxluL9ivaH+2Oitpi3A/xi3zqLHNONSFDWCwesxsR
	 yaIz38Q8RCoytBrKcsY6VpLM=
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 813931E917A;
	Thu,  4 Jun 2026 20:32:22 +0800 (AWST)
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
Subject: [PATCH v3 2/2] kunit: tool: Add (primitive) support for outputting JUnit XML
Date: Thu,  4 Jun 2026 20:32:05 +0800
Message-ID: <20260604123207.2615485-2-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604123207.2615485-1-david@davidgow.net>
References: <20260604123207.2615485-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used by things like Jenkins and other CI systems, which can
pretty-print the test output and potentially provide test-level comparisons
between runs.

The implementation here is pretty basic: it only provides the raw results,
split into tests and test suites, and doesn't provide any overall metadata.
However, CI systems like Jenkins can ingest it and it is already useful.

Signed-off-by: David Gow <david@davidgow.net>
---
Here's version 3 of the JUnit support patch. This one uses python's ElementTree
API to generate the XML, rather than writing strings directly. The only real
difference in the output is that this escapes any log lines, rather than using
CDATA sections. (There are both advantages and disadvantages to this, but
they're all pretty minor. Equally, the option of using the
xml.sax.saxutils.XMLGenerator API instead is a possibility. ElementTree ended
up being slightly more aligned with the way the JSON version worked.)

The other big change is that skipped tests now include their skip reason, rather
than hardcoding "Test skipped", hence the introduction of patch 1.

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
index 267c33cecf87..9797c26d981f 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -24,6 +24,7 @@ import kunit_config
 import kunit_parser
 import kunit_kernel
 import kunit_json
+import kunit_junit
 import kunit
 from kunit_printer import stdout
 
@@ -676,6 +677,38 @@ class StrContains(str):
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
@@ -923,7 +956,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.return_value = ['TAP version 14', 'init: random output'] + want
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
@@ -936,7 +969,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300),
@@ -949,7 +982,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300),
-- 
2.54.0

