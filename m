Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F647989A;
	Tue, 13 Oct 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906705; cv=none; b=WwEstvTPhc61FVOcMynKNEXpVYLlEphpzS/rtmQfwAvc9q1gtnnCDeL/6BiOvFXCbhMNZbDdcXw5Swh+oEfhIg/0qm1uoZNQpuCUXo+teuk+kk/RgOr5KpoSjT7esmzE6NXzi5lCpBldJUE+Z5RTJu4y9DeRq9cjf7F2eaStJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906705; c=relaxed/simple;
	bh=ngOWZldry4i5/7ftUvL3DAkS9yqqg6eLn3r2dMgr/Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awWDpzm6/HUG61lfnjbyvZZrBZEeh77mBdLEGXSvOEnsuVI5mUwX/d057JuvpTioIarIBonMSHypKeFC2REG4eK6sE0v5RTYzCMkQiWCk2XUXCc4lB+7DafZrP98BZ/rUYrk8iXeL+XvpKMoIP38F+QDSGYbRliG1KBJ1RmWuEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEc/OGWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEc/OGWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC14A1F000FF;
	Tue, 13 Oct 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906704;
	bh=xHJeHvXACorKK44UnJWTQGTj0sq3EbOMAUr07ROOR1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hEc/OGWrPRjTsynS4Sz4xsTZwTo+USHkdGBwFVkh+zDHY53u7X4M/LkU2YwdXUHZV
	 Fm99BgEMyNpncpvvkEUVsfcmer9Qd7LIsIhTymCC9Iqg/VHvqEGIkaz0RUi0jJrr7K
	 GMhh2yFE7acwu3uH+v2Mljw7cVF1LNg68f2UrAxH7hwxeR7RP+ZwQPW2IZ1s+qRIzi
	 lb6ZfNZGPuMass+LtLIMwJDyY3oXeRZ6kqNc4jXck1KK6oFee5UAzDdYN3aD+smrGc
	 3uPhVQaONhPviUTtf7aN/jV5pHkBy7v6gbO21p0pHTlG+a6ToLVtqm+DxGnYmSL8qt
	 VjuQorHO2B36g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 16:43:20 +0100
Subject: [PATCH 1/7] kunit: tool: Preserve failures from kernels without
 test results
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kunit-parallel-v1-1-f4be28c895e5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ngOWZldry4i5/7ftUvL3DAkS9yqqg6eLn3r2dMgr/Hc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbd+5Pl261/pmgTLrH9x52Zeachn++4kfO5vo05JS
 Gxzc5tvRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayo5aRYfXs2RaZs4PbHKXX
 r3zc+fb4J45PYYd+f29OnKVhsrqzQYbhJ+O6StvjszP8DuQf/bua0Ut8g4Laah4Z7YknuEr3cbC
 IMQEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When an isolated kernel produces no test results, the parser
reports failure without adding failed test counts. Aggregating only the
counts therefore lets a passing kernel mask the missing results and makes
the command exit successfully. A kernel reporting an empty test plan has
the same problem.

Preserve each kernel's failure status alongside the aggregate counts.
Keep treating skipped tests as successful and retain the failure when no
kernels run at all. Add regression coverage for missing and empty
results in either execution order and for passing and skipped kernels.

Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of kunit_parser with KTAP specification")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit.py           |  6 ++++++
 tools/testing/kunit/kunit_tool_test.py | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 91d234ac3b57..218ae294ad1b 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -191,6 +191,7 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 	metadata = kunit_json.Metadata(arch=linux.arch(), build_dir=request.build_dir, def_config='kunit_defconfig')
 
 	test_counts = kunit_parser.TestCounts()
+	test_failed = False
 	exec_time = 0.0
 	for i, filter_glob in enumerate(filter_globs):
 		stdout.print_with_timestamp('Starting KUnit Kernel ({}/{})...'.format(i+1, len(filter_globs)))
@@ -212,6 +213,9 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 		exec_time += test_end - test_start
 
 		test_counts.add_subtest_counts(test_result.counts)
+		# A kernel with no results has no failed test counts to aggregate.
+		if _map_to_overall_status(test_result.status) != KunitStatus.SUCCESS:
+			test_failed = True
 
 	if len(filter_globs) == 1 and test_counts.crashed > 0:
 		bd = request.build_dir
@@ -220,6 +224,8 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 				bd, bd, kunit_kernel.get_outfile_path(bd), bd, sys.argv[0]))
 
 	kunit_status = _map_to_overall_status(test_counts.get_status())
+	if test_failed:
+		kunit_status = KunitStatus.TEST_FAILURE
 	return KunitResult(status=kunit_status, elapsed_time=exec_time)
 
 def _map_to_overall_status(test_status: kunit_parser.TestStatus) -> KunitStatus:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754bdf..ca2dac6651aa 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -1018,6 +1018,37 @@ class KUnitMainTest(unittest.TestCase):
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test1', filter='', filter_action=None, timeout=300),
 		])
 
+	@mock.patch.object(kunit, '_list_tests')
+	def test_isolated_kernel_without_results_fails(self, mock_tests):
+		mock_tests.return_value = ['suite1.test1', 'suite2.test1']
+		for missing_output in ([], ['KTAP version 1', '1..0']):
+			for missing_suite in ('suite1', 'suite2'):
+				with self.subTest(output=missing_output,
+						 suite=missing_suite):
+					def fake_run_kernel(filter_glob, **kwargs):
+						if filter_glob == missing_suite:
+							return missing_output
+						return ['KTAP version 1', '1..1', 'ok 1 - test1']
+					self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+					with self.assertRaises(SystemExit) as e:
+						kunit.main(['exec', '--run_isolated=suite'])
+					self.assertEqual(e.exception.code, 1)
+
+	@mock.patch.object(kunit, '_list_tests')
+	def test_isolated_skipped_kernels_succeed(self, mock_tests):
+		mock_tests.return_value = ['suite1.test1', 'suite2.test1']
+		for all_skipped in (False, True):
+			with self.subTest(all_skipped=all_skipped):
+				def fake_run_kernel(filter_glob, **kwargs):
+					result = 'ok 1 - test1'
+					if all_skipped or filter_glob == 'suite1':
+						result += ' # SKIP unavailable'
+					return ['KTAP version 1', '1..1', result]
+				self.linux_source_mock.run_kernel.side_effect = fake_run_kernel
+
+				kunit.main(['exec', '--run_isolated=suite'])
+
 	@mock.patch.object(kunit, '_list_tests')
 	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
 	def test_list_suites(self, mock_stdout, mock_tests):

-- 
2.47.3

