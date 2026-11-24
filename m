Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538648;
	b=kp+c6jCOO+QB3tS7mznzZ/oFr8kxFhuhq7nGkmNsE0SrxL4g2p7fqTXZ+2ffZ5hT3+vh
	 HopID05QSsY2PmCKT/igvEGQnjhPho379rkyAuLpknDKnI7j8tsz2Te4PZSHG8x2h1P1m
	 mhRpyj0XkI3dxvJoyqsHADvSDJ+IFt2OtHuHJ1s2Da8gqOaOaQ7nGuI82ZLyBxR3faMBF
	 0/hTVl1ZyLewJ6jaFPoHahn691Pi1gGYmBQzPtiG6PPk/Yk0I1ktjgix85zVmMhf3L8K+
	 n7bMrlAyxnmscMtxCnOvIwS00dNTaDytzv672ynpuvrdgZM+Zap9qnKnQFiWjxJyUDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538648;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kPorgZPzCv84UPzzTybyHL3htSBwB805FyfxNdGB0uI=;
	b=DmpF5j2mh2XT2cvm1AFkEwC8pCkdnlF2OW0ytmhn5T9W0wd3jv7QeOTtox9O/FLqaqz6
	 WgNGNCmoNMjMd+vFRBJu2Og88VdJGxlh6XP4mfs/OIR8Qy4/ThhLJsJlhn7yxaPsrPuSg
	 9iNFoLwzgZj+FS+dJOcBccKb4sXUGyH8mzbCB5ZJ5yxWyHQ1ZNV9OnaArVFwOECq7Ck6j
	 BrXOcGxFRzLNRZiRccGjF9ky12vv4D+V2q+6NJ8M+bX4hyZw7yZx2Uk1OG2yBVScqOVx6
	 zatvlNgIuq2lokiv7xU8Zat4LC4ZAn9STavQnqmBwHrmtoN7Xca/cTkcvJJjUa0eI2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7MrOZ63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7C9606A329;
	Tue, 24 Nov 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7MrOZ63
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795538648;
	b=jqucQ0lwolKug8Hcgsdxrcw8LtMGbk93esF79PgWouhJ2cTXlWQ+t4Gp0Onkp6QsIZ03
	 PjZcIcTtUIfRS1nsTSe/rla9Qqii4K7sKTVvj5hPZcth2LyvpgezBotwJfrqz0Kb7X1jm
	 rSV5mZzJ/DauUuBPqi8GayuDSl9DqpG3olV217M/vQGnkmBJF2sFuqZ/0sToHYScCNmg+
	 UkxcjRHzeI5juTw32HFJazUYyIFr4lbzAVDC8HLxfD2yvmGdcJD0ONkw0OoGKS7ThS7tx
	 K0R5ETy2BkdG8vz+DT+jUwzBTFha0EWIBu6rYFZrzsfdqH64aDSfb4oTRvSXQ19PyLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795538648;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kPorgZPzCv84UPzzTybyHL3htSBwB805FyfxNdGB0uI=;
	b=uj+1NGpMbo2tpIAx/uEFKYSridzrVNEaEzJfOEnKgmGtH+RvbUC/i9GPajTcw/8Xt2K7
	 AzLJ9eU0ZGe5dVAsjk2HXmAFspEPzVpMdotep7/s8CpolrTsA/w4d8oqgKHlGCe5qkCPi
	 xv4c8t7qCsvSRDOJGYUMrGHBi7bxY9Dy6erlgkDvRk8ZqnqC1EWhNMczoS95+lfcGxXAS
	 kMRKUAEBXj6TH6zZ5LtjQihjmILOhP36T4DG1Sb6nVVk4AkATAFZDgKAfzlfsLkkaVFCu
	 Qo5KGOLPu/G5VmMW6VeIlrVSMa91A//MLPxb1M95mMOnbPJ4T01ZU8pjfGsGZWkDLXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 171F41F00AD3;
	Tue, 24 Nov 2026 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538648;
	bh=kPorgZPzCv84UPzzTybyHL3htSBwB805FyfxNdGB0uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h7MrOZ63sujezsDDX3S8FP0W4tUeG7Sk5IHCTaMrLoKAQMT4Vj1ooJHP77D3pW+AS
	 md1d565/jGhoQjonRu9AjE9sDfIyuUJSEm8V6KpDBLFvqh55P3I6gyvrREFWaMtYhS
	 dDIAEdoBjdWpyhc3DcFEz8SpqIgcGKii84rbx1mG5WN+McOlk52snMBFglUfLnNbTd
	 tqK2QhyMyl9hEXB9TGBMJ7gcawEVWUU8+GDblmLAkbAUKlnqjUOX0sq/M6t5+w9tNy
	 y/xNooFKiuvXd4TUFKKC1Hg24V8PlDVWEo8chmkf1cQFSWMNj8IHdn+Vtr6WDA0o9i
	 KglaVdkkEPQmw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8B5B74CAE0;
	Tue, 24 Nov 2026 16:43:51 +0000 (UTC)
From: "Louis H. Poulin II via B4 Relay" <devnull+poulin.louis.student.oaklandcc.edu@kernel.org>
Date: Tue, 24 Nov 2026 11:43:51 -0500
Subject: [PATCH v2 1/2] kunit: tool: Count failed suites with only skipped
 tests
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
Message-Id: <20261124-kunit-v2-v2-1-e1adbcad6b48@student.oaklandcc.edu>
References: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
In-Reply-To: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538631; l=2838;
 i=poulin.louis@student.oaklandcc.edu; s=20261123;
 h=from:subject:message-id;
 bh=xh9sNC2jcUJyidrIOBVwX3s9EcjKEehFHQ3B5Y11RuI=;
 b=0ojOw3R2JUt7QEPqZWNFyndqLiWe91EEeNg+VL2FhuHnfOmjszpQHmB+kSUk3LFhNW+tM1Xw0
 yrrw43AkjtfDVhlYl2AkgOHLvsm5kOSJnJkYq6fZOlPgrHHrdT/Dks7
X-Developer-Key: i=poulin.louis@student.oaklandcc.edu; a=ed25519;
 pk=LwBiuOLz0gqWTufz54rXgw2coado8UrJcWQ13DbYfxw=
X-Endpoint-Received: by B4 Relay for
 poulin.louis@student.oaklandcc.edu/20261123 with auth_id=1616
X-Original-From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Reply-To: poulin.louis@student.oaklandcc.edu
Content-Transfer-Encoding: 7bit

From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>

A suite can report not ok while all its child cases are skipped.
The parser retains the suite status as FAILURE but counts only the
skipped children. The run status is then derived from those counts and
incorrectly reports SKIPPED.

When a suite reports failure and the child aggregate is SKIPPED, add
a failed count for the suite, as is already done when child aggregate
is SUCCESS. Cover a correctly numbered failing suite with a skipped
child.

Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of kunit_parser with KTAP specification")
Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
 tools/testing/kunit/kunit_parser.py    |  4 +++-
 tools/testing/kunit/kunit_tool_test.py | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index d722874b..dce365d1 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -694,7 +694,9 @@ def bubble_up_test_results(test: Test) -> None:
 	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
 		test.status = TestStatus.TEST_CRASHED
 
-	if status == TestStatus.FAILURE and test.counts.get_status() == TestStatus.SUCCESS:
+	# Preserve a failing suite result when its children all pass or skip.
+	if (status == TestStatus.FAILURE and
+			test.counts.get_status() in (TestStatus.SUCCESS, TestStatus.SKIPPED)):
 		counts.add_status(status)
 
 def parse_test(lines: LineStream, expected_num: int, log: List[str], is_subtest: bool, printer: Printer) -> Test:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 85ae2175..5fd386d0 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -265,6 +265,19 @@ class KUnitParserTest(unittest.TestCase):
 		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.status)
 		self.assertEqual(result.counts, kunit_parser.TestCounts(skipped=5))
 
+	def test_failed_suite_with_skipped_child_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case # SKIP reason', 'not ok 1 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, skipped=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
 	def test_ignores_hyphen(self):
 		hyphen_log = _test_data_path('test_strip_hyphen.log')
 		with open(hyphen_log) as file:

-- 
2.56.1


