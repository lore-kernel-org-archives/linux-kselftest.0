Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF67B5349A2;
	Tue, 13 Oct 2026 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906714; cv=none; b=PZ8LCTUE6HIqIjwbv/7tqt+GXK5UKuxIAQzFA5yNgcdcnprYFToSpsug8aG9qSy0Vdui8jDzpl7VqD9Ol8B8DWNS13FN2T2hA0Ii78PSTzNg0KBHLI7yjCuiGI+BZ8IP8WlilCHdB8tl3kcO0xEXIQOdDtRaEttm6PDDV9jLjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906714; c=relaxed/simple;
	bh=AqCNoXSCcf9LGRuUnv9kym1iD2Mmttshr8Da0mvCvDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNrRcR8L75hG/ZpktiuJylzHJEnXW6BnmxTLxRB/aZUA5GyemqBjmX5rnfCwuJuc9jC7gFofUw3genivd3zTzt6Qdnymcv7rubkfGtLy7Li94G1UdezV96pZ1HoUAgSunJ9jBslf6FYNU4ZM5E2RY0Rla+rYk+PWrR2Fg19b0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeVzxpmw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeVzxpmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65E31F000FF;
	Tue, 13 Oct 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906712;
	bh=RGW2X2a9i1It8Ht3QPVjmgBH8i3IxBnYaK2D86OciC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aeVzxpmwkoBdrAN4Nb9d/UPqGeq5LkFInindOmkmGc2L7GRFV63ZZYR81h9ZtwKFH
	 ViAB2Ag34MmtCcZcrOBKJjbapw7HqIepfL5A3tJpvzS6NKloXEji733OJDlFOC928h
	 BoYvgTC406bhOa8BNX3jRT3rNU7X1fBJrx3focLpYLPUuOqyKBCyi50wGUxL5Gl23L
	 OMYI9YPq8wBpD84b3J50Dv1nu1+HASgwCzbV/o7yQvz5bdGiFJZ6uhKJVXBFQ03Owh
	 YAtHFpIPjf/KADcN5cMiSx2HNJYV0ocy1UP4v/6W08s6nhlyqr9IwjZatIZ6byLupE
	 DyToUMfI1+tzg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 16:43:22 +0100
Subject: [PATCH 3/7] kunit: tool: Boot with a larger log buffer when
 listing tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kunit-parallel-v1-3-f4be28c895e5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AqCNoXSCcf9LGRuUnv9kym1iD2Mmttshr8Da0mvCvDs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbduX7albOs8uc1HpxbqVpx9+n8b2/sj1l96/nX01
 6Xy1ES86ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBElqUw/E/7Gj5LVm5WVPBZ
 zsogX5cCAaE2J06V6j0GzgzbK9g+PWX4zcZz8XyvrP8HzV9SqZev39+Xe3M/Q8EGJ9tPC28aSCc
 7sAMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

kunit.action=list prints the name of every suite and test in one burst
during boot, which on a large configuration such as --alltests comes to
several thousand lines. That is more than the default 128KiB printk
ring buffer (CONFIG_LOG_BUF_SHIFT=17, overridden by many defconfigs) can
hold, and since the console drains more slowly than the executor prints
the buffer wraps and lines can easily be dropped.

If the KTAP header is dropped _list_tests() fails with:

  ValueError: LineStream: going past EOF, last line was

but otherwise the loss is silent, --list_tests prints an incomplete list
and --run_isolated=test will execute a timing dependent sent of tests.

Pass log_buf_len=4M on the kernel command line when booting to list
tests so that the whole list fits in the buffer, at least until we get
substantially more tests than we currently have.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit.py           | 11 +++++++++--
 tools/testing/kunit/kunit_tool_test.py |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index aea67b6a72c4..971e70b0fb1a 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -109,8 +109,15 @@ def config_and_build_tests(linux: kunit_kernel.LinuxSourceTree,
 
 	return build_tests(linux, request)
 
+# kunit.action=list prints every suite and test name in one burst at boot,
+# which can be thousands of lines on a large config. That easily overflows
+# the default 128KiB printk buffer before the console has drained it, so
+# lines (sometimes including the KTAP header) are dropped and the list
+# comes out incomplete. Give the kernel a large enough buffer to hold it.
+_LIST_KERNEL_ARGS = ['log_buf_len=4M']
+
 def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> List[str]:
-	args = ['kunit.action=list']
+	args = ['kunit.action=list'] + _LIST_KERNEL_ARGS
 
 	if request.kernel_args:
 		args.extend(request.kernel_args)
@@ -129,7 +136,7 @@ def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest)
 	return [l for l in lines if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
 
 def _list_tests_attr(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> Iterable[str]:
-	args = ['kunit.action=list_attr']
+	args = ['kunit.action=list_attr'] + _LIST_KERNEL_ARGS
 
 	if request.kernel_args:
 		args.extend(request.kernel_args)
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 4590108e4306..17f926ef2820 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -979,7 +979,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
-			args=['kunit.action=list'], build_dir='.kunit', filter_glob='suite*', filter='', filter_action=None, timeout=300)
+			args=['kunit.action=list', 'log_buf_len=4M'], build_dir='.kunit', filter_glob='suite*', filter='', filter_action=None, timeout=300)
 
 	def test_list_tests_with_prefix(self):
 		want = ['suite.test1', 'suite.test2', 'suite2.test1']

-- 
2.47.3

