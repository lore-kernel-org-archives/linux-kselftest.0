Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA29534445;
	Tue, 13 Oct 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906710; cv=none; b=IE5zywmU35BZp+ZQ8ptYBysJA0Y2tf7xrIoYIHjL0E3zcQ0l8SPKPBDIo7Zrfskj1UIyW3G4rawWue5vO0lFWlq21mRxTK4ftMMJqcVH0PFWmutyRDQJA1ikwjt30L5Q5Fw5QsoPh+m4l0wxtKJnryR32qqTND6ADH/9fvjRy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906710; c=relaxed/simple;
	bh=A35L6Q7hsMqUUGIICc26rNTi4oeHr02NhRo80fSwbgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwlUCGhB2XvyyGtBRiB2O1ysmcpbHjvTOnawCL1ZitlQ04oCEBDH+Klxr47owU/IOPP5PzCRnTsYBwmEkPYIbx3BWW8BKerzkmzFSP1aweqvHWaEnJZiBDxuoh5RTe8JNr3ADf+zwxmmyWv7Uy3fVdtZFgNIGt2DUQ4Ic/bCzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkmpbF3Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkmpbF3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F371F00893;
	Tue, 13 Oct 2026 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906708;
	bh=kBxMiRcH/Vi9sqDIcqKSoWnC/0LT576mtSR4HtTbyTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dkmpbF3ZM99Lv1Z16OUNDcisi8DeAvjYMghln28TKyd7yTRt/l6z0vz7gCk5i0E9i
	 wER3HhQKro2acH4xZvgqflWQk3imnXcZPtlxzVoMK2nGTLlzXYBFqItnoSJMsK+0F0
	 2e8qf9Wlg1Ld53EUYV15blVEB1LnHJ1i1jaSSl/6X1XLfslKXWTLO8I1Yqtln/AKEd
	 N5N8MtfLU1pZa6PNy1U7XjdhxL2iIBK/hfiDatj4X9nkBUCytec682/hjOvaiHxe0v
	 ma0NJLit1hYKaf7e1i07CYeQV8SaZdkZ1Zymwue/MEebnkU2JFEU50KqQ29h83dNmp
	 LnHBAx5E2E4mQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 16:43:21 +0100
Subject: [PATCH 2/7] kunit: tool: Combine reports from isolated kernels
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kunit-parallel-v1-2-f4be28c895e5@kernel.org>
References: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org>
In-Reply-To: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Latypov <dlatypov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8638; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A35L6Q7hsMqUUGIICc26rNTi4oeHr02NhRo80fSwbgE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbfu6K1wcCmWiIiObDNR6vnxXnr/k/gbVsVJ3puv2
 bMe6tjSUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIlo5TH8z2Q6sHyzmsDJ5Ska
 R+Pmxb5b82ntHSbWGe9uh+ZXWeW7nmD4X3ehsNeT60H4Vv7m9rcdcx/NXr5ZNzuaIT8+XvQNY3I
 PFwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

With --run_isolated, parse_tests() writes the same JSON or JUnit
destination after every kernel. Only the last kernel survives in a file,
so an earlier failing suite can disappear from the saved results.
Stdout similarly receives several independent report documents.

Separate report writing from parsing. Keep printing each kernel's results
as they are parsed, accumulate the top-level tests and counts, and write
one report after execution finishes. Preserve the parsed root for a
single kernel and continue suppressing reports with --raw_output.

Test JSON and JUnit files with an early failure and suite and test
isolation. Also check equivalence between single-kernel execution and
parsing.

Fixes: ff9e09a3762f ("kunit: tool: support running each suite/test separately")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit.py           | 35 +++++++++++++++----
 tools/testing/kunit/kunit_tool_test.py | 61 ++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 218ae294ad1b..aea67b6a72c4 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -16,7 +16,7 @@ import time
 
 assert sys.version_info >= (3, 7), "Python version is too old"
 
-from dataclasses import dataclass
+from dataclasses import dataclass, replace
 from enum import Enum, auto
 from typing import Iterable, List, Optional, Sequence, Tuple
 
@@ -191,6 +191,10 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 	metadata = kunit_json.Metadata(arch=linux.arch(), build_dir=request.build_dir, def_config='kunit_defconfig')
 
 	test_counts = kunit_parser.TestCounts()
+	report = kunit_parser.Test()
+	report.name = 'main'
+	report.counts = test_counts
+	parse_request = replace(request, json=None, junit=None)
 	test_failed = False
 	exec_time = 0.0
 	for i, filter_glob in enumerate(filter_globs):
@@ -205,7 +209,7 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 			filter_action=request.filter_action,
 			build_dir=request.build_dir)
 
-		_, test_result = parse_tests(request, metadata, run_result)
+		_, test_result = parse_tests(parse_request, metadata, run_result)
 		# run_kernel() doesn't block on the kernel exiting.
 		# That only happens after we get the last line of output from `run_result`.
 		# So exec_time here actually contains parsing + execution time, which is fine.
@@ -216,6 +220,19 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 		# A kernel with no results has no failed test counts to aggregate.
 		if _map_to_overall_status(test_result.status) != KunitStatus.SUCCESS:
 			test_failed = True
+		if request.json or request.junit:
+			if len(filter_globs) == 1:
+				report = test_result
+			else:
+				report.subtests.extend(test_result.subtests)
+				report.log.extend(test_result.log)
+	if len(filter_globs) != 1:
+		report.expected_count = len(report.subtests)
+		report.status = test_counts.get_status()
+		if test_failed and report.ok_status():
+			report.status = kunit_parser.TestStatus.FAILURE_TO_PARSE_TESTS
+	if not request.raw_output:
+		_write_test_results(request, metadata, report)
 
 	if len(filter_globs) == 1 and test_counts.crashed > 0:
 		bd = request.build_dir
@@ -264,6 +281,15 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
 		kunit_parser.print_test(test, request.failed, stdout)
 	kunit_parser.print_summary_line(test, stdout)
 
+	_write_test_results(request, metadata, test)
+
+	if test.status != kunit_parser.TestStatus.SUCCESS:
+		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
+
+	return KunitResult(KunitStatus.SUCCESS, parse_time), test
+
+def _write_test_results(request: KunitParseRequest, metadata: kunit_json.Metadata,
+			test: kunit_parser.Test) -> None:
 	if request.json:
 		json_str = kunit_json.get_json_result(
 					test=test,
@@ -283,11 +309,6 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
 			kunit_junit.write_junit_result(test=test,filename=request.junit)
 			stdout.print_with_timestamp(f"Test results stored in {os.path.abspath(request.junit)}")
 
-	if test.status != kunit_parser.TestStatus.SUCCESS:
-		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
-
-	return KunitResult(KunitStatus.SUCCESS, parse_time), test
-
 def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	      request: KunitRequest) -> KunitResult:
 	run_start = time.time()
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index ca2dac6651aa..4590108e4306 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -19,6 +19,7 @@ import signal
 import subprocess
 import sys
 from typing import Iterable
+import xml.etree.ElementTree as ET
 
 import kunit_config
 import kunit_parser
@@ -738,6 +739,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		self.mock_linux_init = mock.patch.object(kunit_kernel, 'LinuxSourceTree').start()
 		self.linux_source_mock = self.mock_linux_init.return_value
+		self.linux_source_mock.arch.return_value = 'um'
 		self.linux_source_mock.build_reconfig.return_value = True
 		self.linux_source_mock.build_kernel.return_value = True
 		self.linux_source_mock.run_kernel.return_value = all_passed_log
@@ -1049,6 +1051,65 @@ class KUnitMainTest(unittest.TestCase):
 
 				kunit.main(['exec', '--run_isolated=suite'])
 
+	@mock.patch.object(kunit, '_list_tests')
+	def test_isolated_reports_include_all_kernels(self, mock_tests):
+		def fake_run_kernel(filter_glob, **kwargs):
+			if '.' in filter_glob:
+				suite, case = filter_glob.split('.')
+				failed = case == 'test1'
+			else:
+				suite, case = filter_glob, 'test'
+				failed = suite == 'suite1'
+			status = 'not ok' if failed else 'ok'
+			return ['KTAP version 1', '1..1', '    # Subtest: ' + suite,
+				'    1..1', f'    {status} 1 - {case}', f'{status} 1 - {suite}']
+		self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+		for isolation in ('suite', 'test'):
+			with self.subTest(isolation=isolation), \
+			     tempfile.TemporaryDirectory() as output_dir:
+				if isolation == 'suite':
+					mock_tests.return_value = ['suite1.test', 'suite2.test']
+					expected = [('suite1', 'test', 'FAIL'), ('suite2', 'test', 'PASS')]
+				else:
+					mock_tests.return_value = ['suite.test1', 'suite.test2']
+					expected = [('suite', 'test1', 'FAIL'), ('suite', 'test2', 'PASS')]
+				json_path = os.path.join(output_dir, 'results.json')
+				xml_path = os.path.join(output_dir, 'results.xml')
+				with self.assertRaises(SystemExit) as e:
+					kunit.main(['exec', '--run_isolated=' + isolation,
+						    '--json=' + json_path, '--junit=' + xml_path])
+				self.assertEqual(e.exception.code, 1)
+
+				with open(json_path) as f:
+					report = json.load(f)
+				self.assertEqual(report['misc']['tests'], 2)
+				self.assertEqual(report['misc']['failed'], 1)
+				self.assertEqual(report['arch'], 'um')
+				self.assertEqual([(suite['name'], case['name'], case['status'])
+					for suite in report['sub_groups'] for case in suite['test_cases']], expected)
+				root = ET.parse(xml_path).getroot()
+				self.assertEqual(root.get('tests'), '2')
+				self.assertEqual(root.get('failures'), '1')
+				self.assertEqual([(suite.get('name'), case.get('name'),
+					'FAIL' if case.find('failure') is not None else 'PASS')
+					for suite in root for case in suite], expected)
+
+	def test_single_kernel_reports_match_parse(self):
+		with tempfile.TemporaryDirectory() as output_dir:
+			json_path = os.path.join(output_dir, 'results.json')
+			xml_path = os.path.join(output_dir, 'results.xml')
+			reports = []
+			for args in (['exec'], ['parse', _test_data_path('test_is_test_passed-all_passed.log')]):
+				kunit.main(args + ['--json=' + json_path, '--junit=' + xml_path])
+				with open(json_path) as f:
+					report = json.load(f)
+				# Execution adds build metadata, which parse cannot know.
+				reports.append((report['misc'],
+					[(s['name'], s['test_cases']) for s in report['sub_groups']],
+					ET.tostring(ET.parse(xml_path).getroot())))
+			self.assertEqual(reports[0], reports[1])
+
 	@mock.patch.object(kunit, '_list_tests')
 	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
 	def test_list_suites(self, mock_stdout, mock_tests):

-- 
2.47.3

