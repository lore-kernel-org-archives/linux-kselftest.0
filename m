Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637789;
	b=xsFhlgh3JMSekbNXVKmjOxxHBU+vV06yQzC9BcT33PUsC1x/0HhEcB98OksVmbbhImrv
	 fjpTpCcppXEETl9jKU3vP2JWee1DkO7LiCfCqA14yIyOcAyiohkkWm+YYsqNriK/yQHwb
	 FO/aM2L3RaHVvEFHHCKNSxI0VJDO7cBj0ol+d3awtzqHd7JE+bRTA81AEiFWN41NuUxvb
	 hzRKavVdTatGuzE13CFrru8L5tWL6MZOsiYSDq228pj6NCNUbsf6buKTjiPdvNeGHgaG1
	 HPvcZ30EPLzFwIy9495V24mwf0a5ctYY7/goRmFgpSnbWhDYFrXKEQDWdhdLdZHoGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637789;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xKS8ksh8ABYDg1n6CfUN9PLWMQd1ubfCdxxv/bLfaqk=;
	b=YkMFy7nQg9oNgeuXeiKtcSmZj/h2rzPQ32roR+0y5ou+ENKAfjJ3MZImAK5sSDmNlD1F
	 RG5QvCfqRlknaeDwaUMdGUFMyOizv9u0nw8fHyuS40O8oTFr8uEJxPYORR+QOw9V+W2u1
	 8tKpGu0bUGqIAHhHTjmiwOQ1I5i3jnPvTzWlZmrhhy64l/pwr63xXGB4stRWPVpiDgB/9
	 fUfslsRQAJRVACyrOIr54cVFoB6QKGXFWFq0JxtabeqlhsXnpnzBAf/8J3KdRvuhNnERV
	 JenMiQCSBoHo4+7yOQ5auuUurCo0OHJ/BWsUNpB/NNHEtkmZS4kyE00NJ6XZh+LdV+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqJZBRWo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42260A5BCE;
	Mon,  2 Nov 2026 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqJZBRWo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FD81F00A17;
	Mon,  2 Nov 2026 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637788;
	bh=xKS8ksh8ABYDg1n6CfUN9PLWMQd1ubfCdxxv/bLfaqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NqJZBRWo/1fdYiCVa4jzwBiHqEhBYnmhsbAYUKTmmspv59Z3CaUrZ4YbbK4tcNYid
	 d5cO9beTpa8D6spZlCp2JKcj6mQlKKJ1GbM3T1zOgvt8RzNoOircwNz2CKds+Wwt/l
	 ocPwc6/A4a4bVOGpbVRS8Oh3W+aKrjA69qtjktDoq3E90CCb2w4acgLJkW+VzOI6TE
	 FzG9kqIaWQyBFwbTK8/QJ8XeeQ15kVpBlPY9lC0YiiYxZcsKxrQus6/8MM3v+UNX1v
	 B8J+dXXuC5Yx/3Wh7/xmedF50RwmPssx5yE9tIw8IUq2xNfsImseIt7PYlgABIoaTW
	 weAWfhqjVHLuw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:45 +0000
Subject: [PATCH v2 4/7] kunit: tool: Add an outfile argument to
 run_kernel()
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
Message-Id: <20261102-kunit-parallel-v2-4-8774b558d4b0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5293; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lXZ9eXBljOMjPYVQDmvSpVu2QKIdNgQesVPJGPs4i6E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O3NviTuGacXO3vG2eC0I4vLOxYJbeRqXv+gNPe4Q
 /neGXM2d5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAii+4w/NPaG9Ertiv1gGNO
 4sLIN4qHFbbphNxVimj/ftLrna8ckzzDH/429rupYsyefoa/K2IrlXaeDnjfMstpoejLQrOdp3Q
 3sQIA
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

