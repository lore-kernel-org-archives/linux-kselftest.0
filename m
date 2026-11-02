Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637780;
	b=tt4Bs+ORKY1m5H3YpwBGSc/mVtoHmPuDvQOoEbjR9euArczwLYpMVWVbZ+U/VsggTz7d
	 jR+0f7YnK+YtdiSXiguW99k4Tm4KNPF7qHeKgEYM+LK4FfmCbid5oJc2MJHnSUqO64A/F
	 kXMisQ8usQoFLcqAGYi4vC5pkPFYB02Z1XGSZf65bAwgjTh/IEknqtieGXJyfZ4H1ggro
	 BbCHlw9NkFC8Xq9JtLZw1S5soZvZnlc3A/VHPIW1O9RGrxpb7DNV1mAZd3SBaQArEaYrC
	 20Bjq3nKPo/NRnw7uAGSIY1kr3YSfRiYv8lQUzzzkdm/rMKDyaMkGQeMtmcSERgZNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637780;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xHJeHvXACorKK44UnJWTQGTj0sq3EbOMAUr07ROOR1g=;
	b=i6Ha3o+zT7ddNXge2JoS7+eRTiH1YvdpvvVCZyl0GE2+/HqD5vzTP5eLoiqOSvaZ3zHk
	 mHvJHwTaXe70vocQ0y7I6qLHVrcTmw91FFJP4p6n23A370Wz+QHPbgwR9sQbcQeKDskMc
	 rB8QYd8sgOYf573O8qfn24NXjAUz7RmNlR96Tk47uqUgDb/BMof5dmw8K+77DM/iZMjuk
	 qWgHOqoxEJtthk2MGvBCUMeHvmArIBSBASSvhh2pBGUR2mlodppQKgC+9VmyzjqkRX5tm
	 IGrSieWViM+kpeP5+VuqK1coIoizwqtgPUkBQnYb6/kQKKBARYdVGnnQzWttJTXuM/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leKwA0uj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F960A44D8;
	Mon,  2 Nov 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leKwA0uj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E3B1F00A26;
	Mon,  2 Nov 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637780;
	bh=xHJeHvXACorKK44UnJWTQGTj0sq3EbOMAUr07ROOR1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=leKwA0uj2kWxNO/8AG3qGwX4ZEi1Q62SLMlWBl/QU/vcRLE1/Nao3pLHyzn77TLnW
	 IpBCU8U3n1gpU7meLd0yLOD3uV5RtVAtGRKfqo6EtTYhDAhZQvjEeuHbgZhiAV4+aa
	 l98bhftWBAh9DFums9N/yna13aXZ+h0wHzsy3Kvgjm+2ZK9NEw7+9L8QhX3zhXwnBZ
	 urO1KoejJXGkHf58IBcm5gYP3Q9eeCJgeqsneXKMsP4xI0IHqD0ihgQaDNAD9CsCzJ
	 Lu3flfLyiSel57AYPzwRLmgA5RCL6D6FPJPvPaIbRXA5LyIPEzGDKazv83ZQCPwBrh
	 VSui6emGuwYRQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:42 +0000
Subject: [PATCH v2 1/7] kunit: tool: Preserve failures from kernels without
 test results
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
Message-Id: <20261102-kunit-parallel-v2-1-8774b558d4b0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ngOWZldry4i5/7ftUvL3DAkS9yqqg6eLn3r2dMgr/Hc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O0xeLe3bv+cozU+Egx7dTPPbV+3bdOyEIFdsqxZy
 jxlnwSmdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiW9MYGWb9Tqvyk2RQ2lPI
 e433+I6uZ1caO3fIBqr51U4paCwKvM3IsONQzCK3p1Jcy8NL1Bnnrs0/pvDMM/LD9gNW186XrWl
 1YQAA
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

