Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C95349B9;
	Tue, 13 Oct 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906718; cv=none; b=Mgv0sL9YVwg5gHHEOBWTRutNexIyaEANP1MeKt/LdICL3hOpRMHC0HZvshqX5OcRIUBbAN4zCosb9MYEHZ21yjMVDXiofu+mi0LurqVY4OhJpArlK1hi3r1VSx+/Jf1gFbWqz/Tjqu/twirQluY65b0G7qCsiki0mEf2DF84F/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906718; c=relaxed/simple;
	bh=lXZ9eXBljOMjPYVQDmvSpVu2QKIdNgQesVPJGPs4i6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xjbz7ppYfjbEY/SpdaNUpUJ0VZGl/q+S1wh+t8zD3uDvcgNXH3qu9cFCJwfVyuP4468vZl/qsflOPfkHcsuKrxBup6ZqDcWU5+7/jGEGdq5Rp6bHBsuR1jTZqTxatBYp47T5Cr4lfC5IQ6rPnKCRb+RDuYg96wL1yPcHGo8MZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWwmj9zs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWwmj9zs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3637C1F00893;
	Tue, 13 Oct 2026 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906716;
	bh=xKS8ksh8ABYDg1n6CfUN9PLWMQd1ubfCdxxv/bLfaqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RWwmj9zsulS9uwk0NJkgpL4eoi5UM8vaX2XiQz/E+xLJBIqsjQbPElfcweHt1m46J
	 5kO0Y15a/jNhqVPOB2+igRzyt8lsh/9ZNpovyEbFNodCq/YuID9yubNCKwQFcF3/1O
	 xvvD/Y7cE9dbUBMTkRIm/jHmafw6NlFdgqgJgL9cpfjBFa+nzrqjMIi72hBIYEhAg4
	 eVJFQcVqR9pWn1h6psZUo/bhHy6pKbP3VBsy3hJa+G0VaKpnfz+16fcHkRI5YJ7dCH
	 TR9rh9Rk4uO26eljJ3PkXOnkAnfXtqr2Ax7W9O1r0gTyv4e2BeY5HztU79C+9KU3AA
	 /C4CdnrvOPj8g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 16:43:23 +0100
Subject: [PATCH 4/7] kunit: tool: Add an outfile argument to run_kernel()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kunit-parallel-v1-4-f4be28c895e5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5293; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lXZ9eXBljOMjPYVQDmvSpVu2QKIdNgQesVPJGPs4i6E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbcmnbLZ8jj651SrXYfuLWz8mJB3ZYbNPSOhbSdL4
 rfEmEyq6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEtu1kZPgc32OvHxcSb2Ge
 2J3lItU++3Jnt1NnwdyS/ZMS2Nx3PWNkuDb34dnEljPHqi929fibiD7NuXPvsdLOZM0c39RDrW9
 u8AMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

run_kernel() always tees the kernel's console output to test.log in the
build directory. If more than one kernel were to be run at a time they
would all write to the same file, so allow the caller to choose where
the log goes with a new optional outfile argument.

Also teach get_outfile_path() to generate per-kernel log names of the
form test.<name>.log when given a name, for callers that need to keep
the logs of several kernels apart. Characters that are awkward in file
names, such as the '*' in a filter glob, are replaced with '_'.

Add a unit test covering the new argument.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit_kernel.py    | 28 ++++++++++++++++++++++++----
 tools/testing/kunit/kunit_tool_test.py | 17 +++++++++++++++++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 58557c47d85f..2641db9eddba 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -11,6 +11,7 @@ import importlib.util
 import logging
 import subprocess
 import os
+import re
 import shlex
 import shutil
 import signal
@@ -193,8 +194,19 @@ def get_parsed_kunitconfig(build_dir: str,
 		merged.merge_in_entries(partial)
 	return merged
 
-def get_outfile_path(build_dir: str) -> str:
-	return os.path.join(build_dir, OUTFILE_PATH)
+def get_outfile_path(build_dir: str, name: Optional[str]=None) -> str:
+	"""Returns the path of the kernel console log.
+
+	When several kernels are run each needs its own log, so `name` is
+	used to tell them apart, giving test.<name>.log. Characters that are
+	awkward in file names (anything other than letters, digits, '_', '-'
+	and '.') are replaced with '_'.
+	"""
+	if name is None:
+		return os.path.join(build_dir, OUTFILE_PATH)
+	base, ext = os.path.splitext(OUTFILE_PATH)
+	name = re.sub(r'[^\w.-]', '_', name)
+	return os.path.join(build_dir, f'{base}.{name}{ext}')
 
 def _default_qemu_config_path(arch: str) -> str:
 	config_path = os.path.join(QEMU_CONFIGS_DIR, arch + '.py')
@@ -352,7 +364,12 @@ class LinuxSourceTree:
 			return
 		subprocess.call(['stty', 'sane'])
 
-	def run_kernel(self, args: Optional[List[str]]=None, build_dir: str='', filter_glob: str='', filter: str='', filter_action: Optional[str]=None, timeout: Optional[int]=None) -> Iterator[str]:
+	def run_kernel(self, args: Optional[List[str]]=None, build_dir: str='', filter_glob: str='', filter: str='', filter_action: Optional[str]=None, timeout: Optional[int]=None, outfile: Optional[str]=None) -> Iterator[str]:
+		"""Boots the kernel and yields its console output line by line.
+
+		The output is also written to `outfile`, which defaults to
+		test.log in the build directory.
+		"""
 		# Copy to avoid mutating the caller-supplied list. exec_tests() reuses
 		# the same args across repeated run_kernel() calls (e.g. --run_isolated),
 		# so appending to the original would accumulate stale flags on each call.
@@ -365,6 +382,9 @@ class LinuxSourceTree:
 			args.append('kunit.filter_action=' + filter_action)
 		args.append('kunit.enable=1')
 
+		if outfile is None:
+			outfile = get_outfile_path(build_dir)
+
 		self._process = self._ops.start(args, build_dir)
 		assert self._process is not None # tell mypy it's set
 		assert self._process.stdout is not None  # tell mypy it's set
@@ -382,7 +402,7 @@ class LinuxSourceTree:
 		waiter = threading.Thread(target=_wait_proc)
 		waiter.start()
 
-		output = open(get_outfile_path(build_dir), 'w')
+		output = open(outfile, 'w')
 		try:
 			# Tee the output to the file and to our caller in real time.
 			for line in self._process.stdout:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 17f926ef2820..4e8068dce918 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -522,6 +522,23 @@ class LinuxSourceTreeTest(unittest.TestCase):
 			with open(kunit_kernel.get_outfile_path(build_dir), 'rt') as outfile:
 				self.assertEqual(outfile.read(), 'hi\nbye\n', msg='Missing some output')
 
+	def test_run_kernel_outfile(self):
+		"""Verify run_kernel() logs to the given outfile instead of test.log."""
+		def fake_start(unused_args, unused_build_dir):
+			return subprocess.Popen(['printf', 'hi\n'], text=True, stdout=subprocess.PIPE)
+
+		with tempfile.TemporaryDirectory('') as build_dir:
+			tree = kunit_kernel.LinuxSourceTree(build_dir, kunitconfig_paths=[os.devnull])
+			mock.patch.object(tree._ops, 'start', side_effect=fake_start).start()
+
+			# Awkward characters in the name are sanitised.
+			outfile = kunit_kernel.get_outfile_path(build_dir, 'my suite.test*')
+			self.assertEqual(outfile, os.path.join(build_dir, 'test.my_suite.test_.log'))
+			self.assertEqual(list(tree.run_kernel(build_dir=build_dir, outfile=outfile)), ['hi\n'])
+			with open(outfile, 'rt') as f:
+				self.assertEqual(f.read(), 'hi\n')
+			self.assertFalse(os.path.exists(kunit_kernel.get_outfile_path(build_dir)))
+
 	def test_run_kernel_args_not_mutated(self):
 		"""Verify run_kernel() copies args so callers can reuse them."""
 		start_calls = []

-- 
2.47.3

