Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637797;
	b=EnkD3VpRWCMgNzdsRMj1oentFWB1Hy+QRHbKFlPt7EvGZqeFMdM3hlGpbnkWOdacwvVn
	 GgYBEkR9d6c7Gzp9IjJ+y23+qUfwMJVQUfKLtYO+zT29osMSz1qfKk56JoD9DMHUC1j3o
	 ShPbp2FKWDtbVBkNTfdUmtFuvkhgz0gGRuQZzXE1fJC3AJ34a8KsWnvDWCCh0PBzryV7F
	 QKkx1xfjmiKIwWLxKkE+57IbNe+xa1XQN19UOkMxCACov0+84z3cMmpAR7AjdM6wuBmQB
	 8nfmMCBSAOuxVWVvub/KEfYtuqnVjltPPn8C7tGuQOH7M27voOsIGc4hDzI3MWMnhcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637797;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VKEMJtPIGsYWPD7vXVQQKFHcH9qLZCoKOisHNhsibWM=;
	b=wZ/AiiYMycR9WuiCrIrGYskj+V2ZUfbhGdZCy6gLENh2w5PKNdKu/PteJ4bA8oqLTECl
	 JOJNmXEkwcbvwXNogRtpHakzf6H0PgK0vJ8sY7t11bRlmCWFhWIB3XB05CE2jQaLSkelN
	 rLzHyhLn4rpvuv7Lw4od4Sfy2S2BCSRL57b5prPcxg9BB5Px27iw2ZHH7jbEZoiVdmvV6
	 68NLVL6H9OWaBCo2Kx3PZQJECgLjZw54D5vPHfW/rVYBTCUvWmAdY//L4hUJY8O3A9EKV
	 LXmwEd2xwcVa6F7tsAEaJLvPslwOFFmOV4BqJgZI2EAFTs/cY3/EH/II1Uj2Hj6JBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0XQugCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094D60A6C36;
	Mon,  2 Nov 2026 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0XQugCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6777E1F00A16;
	Mon,  2 Nov 2026 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637796;
	bh=VKEMJtPIGsYWPD7vXVQQKFHcH9qLZCoKOisHNhsibWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j0XQugCHLLCCguReDnYvHoOTv5zl+T6gIf89ycZyyq7ohYz0yWP32l9mSoOWQJdgs
	 Tv7tivPcvTwM5ALDUMvvMSIl/5GXiByKJYeNBz7gA0fXAISiz9WuNGD//UaEnZpnTX
	 hob11MisLkxndqmPl1MTqow8zCTUI4D1tLPAZFXWyrTTemP43+eyy3Ugf2qGTWkmAv
	 r9ATbmzv6h9SkbUwre6uR07No7/57qYDlpp0ZmpCpZopgQzygaDeEqLBbpbUOm/6KU
	 SK5h4utyeeDldNVoMN1nT21v6yI9sDZnMYJbLFyomt0SJm208Y6rM63T3qeC7YhTeK
	 KtviNxBkvTX8g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:48 +0000
Subject: [PATCH v2 7/7] kunit: tool: Add --parallel to run suites in
 concurrent kernels
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
Message-Id: <20261102-kunit-parallel-v2-7-8774b558d4b0@kernel.org>
References: <20261102-kunit-parallel-v2-0-8774b558d4b0@kernel.org>
In-Reply-To: <20261102-kunit-parallel-v2-0-8774b558d4b0@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Latypov <dlatypov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=24300; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EzPIUmbXW7nOcCmVLAWgNNURCGTCS0JiiauznvRxvl4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O2N830lGRvWufJ78jbG/CdzCwxSdCZWOK2RDhUQ2
 f/G09G3o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABN5c4WR4Ynl6WutX8WTWGZ1
 XDX39e371a5Xev7elWyvT4+za0uvvGH4p3zF9HyIcmB4C39Mh7FxBbfrN54PErHLU5qDO4491Hz
 NCQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

kunit.py boots a single kernel to run all the selected tests, one after
another on a single CPU. This is good for robustness but means that the
overall time taken to complete testing could be improved. Since we are
already able to split up the set of tests run into multiple kernel boots
with the --run-isolated option let's take advantage of that and allow
execution in parallel.

Add a --parallel N option to the run and exec subcommands. When N is
greater than one the tests are enumerated with kunit.action=list and
split up by top level suite, as --run_isolated=suite does, or by
individual test if --run_isolated=test is also given. The resulting
kernels are run from a thread pool N wide, each logging its console to
test.<suite/test>.log in the build directory.

Each kernel's output is buffered by its worker and handed to the parser
in the order the suites were enumerated in, which is the order the
kernel would have run them, so the results are reported identically
regardless of which kernel happens to finish first. While developing
this I noticed some issues with the existing --run_isolated support due
to test naming, with those fixes in place results were identical with
and without parallelism.

Performance results with --alltests, using the elapsed time reported by
the KUnit runner with an already built kernel on a Raspberry Pi 5 with 4
CPUs and a Graviton 4 with 192 CPUs:

		     default  parallel  per test   parallel per test
  Raspberry Pi 5     67.7s    49.4s     836.4s     326.5s
  Graviton 4         64.1s    30.8s     445.9s      39.7s

Even with the overhead of having to boot more kernels we are seeing
substantial speedups, for obvious reasons these are much better with
more CPUs available.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/dev-tools/kunit/run_wrapper.rst |  11 ++
 tools/testing/kunit/kunit.py                  |  95 +++++++++++----
 tools/testing/kunit/kunit_tool_test.py        | 165 +++++++++++++++++++++-----
 3 files changed, 218 insertions(+), 53 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a3399..af5176463966 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -315,6 +315,17 @@ command line arguments:
   This is useful for debugging a non-hermetic test, one that
   might pass/fail based on what ran before it.
 
+- ``--parallel``: Specifies the number of kernels to run at the same time.
+  The tests are split up by suite (or by test, with ``--run_isolated=test``)
+  and each is run in its own kernel, up to ``N`` at a time. The results are
+  reported in the same order as a sequential run, so the output is stable
+  regardless of which kernel finishes first. Each kernel's console output is
+  saved to its own log in the build directory, named after the suite or test
+  it ran, e.g. ``test.kunit_executor_test.log``. Note that each
+  kernel needs its own memory (1GiB for QEMU), so this is best combined with
+  ``--filter`` or a filter glob to avoid running more kernels than the host
+  can comfortably accommodate.
+
 - ``--raw_output``: If set, generates unformatted output from kernel. Possible options are:
 
    - ``all``: To view the full kernel output, use ``--raw_output=all``.
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 0132687cdd43..4c320ef207df 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -8,6 +8,7 @@
 # Author: Brendan Higgins <brendanhiggins@google.com>
 
 import argparse
+import concurrent.futures
 import os
 import re
 import shlex
@@ -18,7 +19,7 @@ assert sys.version_info >= (3, 7), "Python version is too old"
 
 from dataclasses import dataclass, replace
 from enum import Enum, auto
-from typing import Iterable, List, Optional, Sequence, Tuple
+from typing import Iterable, Iterator, List, Optional, Sequence, Tuple
 
 import kunit_json
 import kunit_junit
@@ -66,6 +67,7 @@ class KunitExecRequest(KunitParseRequest):
 	list_tests: bool
 	list_tests_attr: bool
 	list_suites: bool
+	parallel: int
 
 @dataclass
 class KunitRequest(KunitExecRequest, KunitBuildRequest):
@@ -166,6 +168,52 @@ def _suites_from_test_list(tests: List[str]) -> List[str]:
 			suites.append(suite)
 	return suites
 
+def _run_kernels(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest,
+		 filter_globs: List[str]) -> Iterator[Iterable[str]]:
+	"""Boots a kernel for each filter glob and yields each kernel's output.
+
+	Outputs are always yielded in the order of filter_globs, so the
+	results are reported in the same order whether the kernels are run
+	one after another or (with --parallel) several at a time.
+	"""
+	num_kernels = len(filter_globs)
+	workers = min(request.parallel, num_kernels)
+	if workers <= 1:
+		for i, filter_glob in enumerate(filter_globs):
+			stdout.print_with_timestamp('Starting KUnit Kernel ({}/{})...'.format(i+1, num_kernels))
+			yield linux.run_kernel(
+				args=request.kernel_args,
+				timeout=request.timeout,
+				filter_glob=filter_glob,
+				filter=request.filter,
+				filter_action=request.filter_action,
+				build_dir=request.build_dir)
+		return
+
+	# Each kernel's output is buffered by a worker thread and only
+	# handed back once all the kernels before it in filter_globs have
+	# been reported, so which kernel finishes first doesn't matter.
+	# The kernels write to separate log files named after the suite or
+	# test they ran, e.g. test.<suite>.log.
+	def run(filter_glob: str) -> List[str]:
+		return list(linux.run_kernel(
+			args=request.kernel_args,
+			timeout=request.timeout,
+			filter_glob=filter_glob,
+			filter=request.filter,
+			filter_action=request.filter_action,
+			build_dir=request.build_dir,
+			outfile=kunit_kernel.get_outfile_path(request.build_dir, filter_glob)))
+
+	stdout.print_with_timestamp('Starting {} KUnit Kernels, {} at a time...'.format(num_kernels, workers))
+	with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
+		futures = [pool.submit(run, filter_glob) for filter_glob in filter_globs]
+		for i, (filter_glob, future) in enumerate(zip(filter_globs, futures)):
+			output = future.result()
+			stdout.print_with_timestamp('Results from KUnit Kernel ({}/{}) for {}, console log in {}:'.format(
+				i+1, num_kernels, filter_glob, kunit_kernel.get_outfile_path(request.build_dir, filter_glob)))
+			yield output
+
 def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> KunitResult:
 	filter_globs = [request.filter_glob]
 	if request.list_tests:
@@ -184,11 +232,14 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 		for line in output:
 			print(line.rstrip())
 		return KunitResult(status=KunitStatus.SUCCESS, elapsed_time=0.0)
-	if request.run_isolated:
+	if request.run_isolated or request.parallel > 1:
 		tests = _list_tests(linux, request)
 		if request.run_isolated == 'test':
 			filter_globs = tests
-		elif request.run_isolated == 'suite':
+		else:
+			# One kernel per suite: either --run_isolated=suite, or
+			# --parallel, which splits the tests up by suite so that
+			# each suite can be run in a separate kernel.
 			filter_globs = _suites_from_test_list(tests)
 			# Apply the test-part of the user's glob, if present.
 			if '.' in request.filter_glob:
@@ -203,26 +254,9 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 	report.counts = test_counts
 	parse_request = replace(request, json=None, junit=None)
 	test_failed = False
-	exec_time = 0.0
-	for i, filter_glob in enumerate(filter_globs):
-		stdout.print_with_timestamp('Starting KUnit Kernel ({}/{})...'.format(i+1, len(filter_globs)))
-
-		test_start = time.time()
-		run_result = linux.run_kernel(
-			args=request.kernel_args,
-			timeout=request.timeout,
-			filter_glob=filter_glob,
-			filter=request.filter,
-			filter_action=request.filter_action,
-			build_dir=request.build_dir)
-
+	exec_start = time.time()
+	for run_result in _run_kernels(linux, request, filter_globs):
 		_, test_result = parse_tests(parse_request, metadata, run_result)
-		# run_kernel() doesn't block on the kernel exiting.
-		# That only happens after we get the last line of output from `run_result`.
-		# So exec_time here actually contains parsing + execution time, which is fine.
-		test_end = time.time()
-		exec_time += test_end - test_start
-
 		test_counts.add_subtest_counts(test_result.counts)
 		# A kernel with no results has no failed test counts to aggregate.
 		if _map_to_overall_status(test_result.status) != KunitStatus.SUCCESS:
@@ -240,6 +274,10 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 			report.status = kunit_parser.TestStatus.FAILURE_TO_PARSE_TESTS
 	if not request.raw_output:
 		_write_test_results(request, metadata, report)
+	# run_kernel() doesn't block on the kernel exiting.
+	# That only happens after we get the last line of output from `run_result`.
+	# So exec_time here actually contains parsing + execution time, which is fine.
+	exec_time = time.time() - exec_start
 
 	if len(filter_globs) == 1 and test_counts.crashed > 0:
 		bd = request.build_dir
@@ -492,6 +530,13 @@ def add_exec_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--list_suites', help='If set, list all suites that will be '
 			    'run.',
 			    action='store_true')
+	parser.add_argument('--parallel',
+			    help='Number of kernels to run at the same time. The tests '
+			    'are split up by suite (or by test with --run_isolated=test) '
+			    'and each suite is run in its own kernel, with the results '
+			    'reported in the same order as a sequential run. Defaults '
+			    'to 1, i.e. a single kernel running all the tests.',
+			    type=int, default=1, metavar='N')
 
 def add_parse_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--raw_output', help='If set don\'t parse output from kernel. '
@@ -562,7 +607,8 @@ def run_handler(cli_args: argparse.Namespace) -> None:
 					run_isolated=cli_args.run_isolated,
 					list_tests=cli_args.list_tests,
 					list_tests_attr=cli_args.list_tests_attr,
-					list_suites=cli_args.list_suites)
+					list_suites=cli_args.list_suites,
+					parallel=cli_args.parallel)
 	result = run_tests(linux, request)
 	if result.status != KunitStatus.SUCCESS:
 		sys.exit(1)
@@ -613,7 +659,8 @@ def exec_handler(cli_args: argparse.Namespace) -> None:
 					run_isolated=cli_args.run_isolated,
 					list_tests=cli_args.list_tests,
 					list_tests_attr=cli_args.list_tests_attr,
-					list_suites=cli_args.list_suites)
+					list_suites=cli_args.list_suites,
+					parallel=cli_args.parallel)
 	result = exec_tests(linux, exec_request)
 	stdout.print_with_timestamp((
 		'Elapsed time: %.3fs\n') % (result.elapsed_time))
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index c4999273e491..beb80c728004 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -19,6 +19,7 @@ import signal
 import subprocess
 import sys
 import textwrap
+import time
 from typing import Iterable
 import xml.etree.ElementTree as ET
 
@@ -1019,7 +1020,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.return_value = ['TAP version 14', 'init: random output'] + want
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False, 1))
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
@@ -1034,7 +1035,7 @@ class KUnitMainTest(unittest.TestCase):
 			'[    0.300000] suite2.test1']
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False, 1))
 		self.assertEqual(got, want)
 
 	@mock.patch.object(kunit, '_list_tests')
@@ -1044,7 +1045,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False, 1))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300),
@@ -1057,7 +1058,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False, 1))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300),
@@ -1065,35 +1066,115 @@ class KUnitMainTest(unittest.TestCase):
 		])
 
 	@mock.patch.object(kunit, '_list_tests')
-	def test_isolated_kernel_without_results_fails(self, mock_tests):
+	def test_parallel_by_suite(self, mock_tests):
+		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']
+		kunit.main(['exec', '--parallel=2', 'suite*.test*'])
+
+		# Should split by suite, respecting the user's filter glob.
+		mock_tests.assert_called_once_with(mock.ANY,
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, None, False, False, False, 2))
+		# Each kernel gets its own log file, named after its suite.
+		# The kernels run concurrently, so don't depend on the order
+		# they start in.
+		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 2)
+		self.linux_source_mock.run_kernel.assert_has_calls([
+			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300, outfile='.kunit/test.suite.test_.log'),
+			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300, outfile='.kunit/test.suite2.test_.log'),
+		], any_order=True)
+		self.print_mock.assert_any_call(StrContains('Starting 2 KUnit Kernels, 2 at a time...'))
+		self.print_mock.assert_any_call(StrContains('Results from KUnit Kernel (1/2) for suite.test*, console log in .kunit/test.suite.test_.log:'))
+		self.print_mock.assert_any_call(StrContains('Results from KUnit Kernel (2/2) for suite2.test*, console log in .kunit/test.suite2.test_.log:'))
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_by_test(self, mock_tests):
+		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']
+		kunit.main(['exec', '--parallel=2', '--run_isolated=test', 'suite*'])
+
+		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 3)
+		self.linux_source_mock.run_kernel.assert_has_calls([
+			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300, outfile='.kunit/test.suite.test1.log'),
+			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300, outfile='.kunit/test.suite.test2.log'),
+			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test1', filter='', filter_action=None, timeout=300, outfile='.kunit/test.suite2.test1.log'),
+		], any_order=True)
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_single_suite_runs_one_kernel(self, mock_tests):
+		# With only one suite there's nothing to parallelise, so this
+		# should behave exactly like a sequential run.
+		mock_tests.return_value = ['suite.test1', 'suite.test2']
+		kunit.main(['exec', '--parallel=4', 'suite'])
+
+		self.linux_source_mock.run_kernel.assert_called_once_with(
+			args=None, build_dir='.kunit', filter_glob='suite', filter='', filter_action=None, timeout=300)
+		self.print_mock.assert_any_call(StrContains('Starting KUnit Kernel (1/1)...'))
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_stable_order(self, mock_tests):
+		mock_tests.return_value = ['suite1.test1', 'suite2.test1', 'suite3.test1']
+
+		# Make the kernels finish in the reverse of the order they're
+		# listed in: results must still come out in the listed order.
+		def fake_run_kernel(filter_glob, **kwargs):
+			delay = {'suite1': 0.2, 'suite2': 0.1, 'suite3': 0.0}[filter_glob]
+			time.sleep(delay)
+			return ['TAP version 14', '1..1', 'ok 1 - ' + filter_glob]
+		self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+		kunit.main(['exec', '--parallel=3', '--raw_output=kunit'])
+
+		output = [call.args[0] for call in self.print_mock.call_args_list]
+		want = ['ok 1 - suite1', 'ok 1 - suite2', 'ok 1 - suite3']
+		self.assertEqual([l for l in output if l.startswith('ok')], want)
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_counts_all_kernels(self, mock_tests):
 		mock_tests.return_value = ['suite1.test1', 'suite2.test1']
-		for missing_output in ([], ['KTAP version 1', '1..0']):
-			for missing_suite in ('suite1', 'suite2'):
-				with self.subTest(output=missing_output,
-						 suite=missing_suite):
-					def fake_run_kernel(filter_glob, **kwargs):
-						if filter_glob == missing_suite:
-							return missing_output
-						return ['KTAP version 1', '1..1', 'ok 1 - test1']
-					self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
 
-					with self.assertRaises(SystemExit) as e:
-						kunit.main(['exec', '--run_isolated=suite'])
-					self.assertEqual(e.exception.code, 1)
+		def fake_run_kernel(filter_glob, **kwargs):
+			if filter_glob == 'suite2':
+				return ['TAP version 14', '1..1', 'not ok 1 - suite2']
+			return ['TAP version 14', '1..1', 'ok 1 - suite1']
+		self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+		# A failure in any of the kernels must fail the overall run.
+		with self.assertRaises(SystemExit) as e:
+			kunit.main(['exec', '--parallel=2'])
+		self.assertEqual(e.exception.code, 1)
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_isolated_kernel_without_results_fails(self, mock_tests):
+		mock_tests.return_value = ['suite1.test1', 'suite2.test1']
+		for parallel in (1, 2):
+			for missing_output in ([], ['KTAP version 1', '1..0']):
+				for missing_suite in ('suite1', 'suite2'):
+					with self.subTest(parallel=parallel, output=missing_output,
+							 suite=missing_suite):
+						def fake_run_kernel(filter_glob, **kwargs):
+							if filter_glob == missing_suite:
+								return missing_output
+							return ['KTAP version 1', '1..1', 'ok 1 - test1']
+						self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+						with self.assertRaises(SystemExit) as e:
+							kunit.main(['exec', '--run_isolated=suite',
+								    '--parallel=' + str(parallel)])
+						self.assertEqual(e.exception.code, 1)
 
 	@mock.patch.object(kunit, '_list_tests')
 	def test_isolated_skipped_kernels_succeed(self, mock_tests):
 		mock_tests.return_value = ['suite1.test1', 'suite2.test1']
-		for all_skipped in (False, True):
-			with self.subTest(all_skipped=all_skipped):
-				def fake_run_kernel(filter_glob, **kwargs):
-					result = 'ok 1 - test1'
-					if all_skipped or filter_glob == 'suite1':
-						result += ' # SKIP unavailable'
-					return ['KTAP version 1', '1..1', result]
-				self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+		for parallel in (1, 2):
+			for all_skipped in (False, True):
+				with self.subTest(parallel=parallel, all_skipped=all_skipped):
+					def fake_run_kernel(filter_glob, **kwargs):
+						result = 'ok 1 - test1'
+						if all_skipped or filter_glob == 'suite1':
+							result += ' # SKIP unavailable'
+						return ['KTAP version 1', '1..1', result]
+					self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
 
-				kunit.main(['exec', '--run_isolated=suite'])
+					kunit.main(['exec', '--run_isolated=suite',
+						    '--parallel=' + str(parallel)])
 
 	@mock.patch.object(kunit, '_list_tests')
 	def test_isolated_reports_include_all_kernels(self, mock_tests):
@@ -1109,8 +1190,8 @@ class KUnitMainTest(unittest.TestCase):
 				'    1..1', f'    {status} 1 - {case}', f'{status} 1 - {suite}']
 		self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
 
-		for isolation in ('suite', 'test'):
-			with self.subTest(isolation=isolation), \
+		for parallel, isolation in itertools.product((1, 2), ('suite', 'test')):
+			with self.subTest(parallel=parallel, isolation=isolation), \
 			     tempfile.TemporaryDirectory() as output_dir:
 				if isolation == 'suite':
 					mock_tests.return_value = ['suite1.test', 'suite2.test']
@@ -1121,7 +1202,8 @@ class KUnitMainTest(unittest.TestCase):
 				json_path = os.path.join(output_dir, 'results.json')
 				xml_path = os.path.join(output_dir, 'results.xml')
 				with self.assertRaises(SystemExit) as e:
-					kunit.main(['exec', '--run_isolated=' + isolation,
+					kunit.main(['exec', '--parallel=' + str(parallel),
+						    '--run_isolated=' + isolation,
 						    '--json=' + json_path, '--junit=' + xml_path])
 				self.assertEqual(e.exception.code, 1)
 
@@ -1139,6 +1221,31 @@ class KUnitMainTest(unittest.TestCase):
 					'FAIL' if case.find('failure') is not None else 'PASS')
 					for suite in root for case in suite], expected)
 
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_reports_to_stdout(self, mock_tests):
+		mock_tests.return_value = ['suite1.test', 'suite2.test']
+		self.linux_source_mock.run_kernel.side_effect = lambda filter_glob, **kwargs: [
+			'KTAP version 1', '1..1', 'ok 1 - ' + filter_glob]
+		kunit.main(['exec', '--parallel=2', '--json', '--junit'])
+		output = [call.args[0] for call in self.print_mock.call_args_list]
+		json_reports = [json.loads(line) for line in output if line.startswith('{')]
+		xml_reports = [ET.fromstring(line) for line in output if line.startswith('<testsuite')]
+		self.assertEqual(len(json_reports), 1)
+		self.assertEqual(json_reports[0]['misc']['tests'], 2)
+		self.assertEqual(len(xml_reports), 1)
+		self.assertEqual(xml_reports[0].get('tests'), '2')
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_parallel_raw_output_does_not_write_reports(self, mock_tests):
+		mock_tests.return_value = ['suite1.test', 'suite2.test']
+		with tempfile.TemporaryDirectory() as output_dir:
+			json_path = os.path.join(output_dir, 'results.json')
+			xml_path = os.path.join(output_dir, 'results.xml')
+			kunit.main(['exec', '--parallel=2', '--raw_output=all',
+				    '--json=' + json_path, '--junit=' + xml_path])
+			self.assertFalse(os.path.exists(json_path))
+			self.assertFalse(os.path.exists(xml_path))
+
 	def test_single_kernel_reports_match_parse(self):
 		with tempfile.TemporaryDirectory() as output_dir:
 			json_path = os.path.join(output_dir, 'results.json')

-- 
2.47.3

