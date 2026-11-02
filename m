Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637791;
	b=avsYKl3D/ePrb6ZEdjKqmqzWR4jff9gJhsGsydd+totb32Pr2Ss+TdJ5C1oHt83s0sHp
	 gdKWaeRRSOrHhBUfGaA8QLVVDEKEFNFeemAa8BUt5agqrSalFLTO0n0a63LhIXCsMf/nD
	 mdXBqYWY20TXQ94Q/3WpAgnUVHGX/SEuwRcqzdfxONi2KH/ocavAo39VL/J/qVmtTWoKK
	 eFbqTuNZrJ1dcCDaotDEbL88DHXWa1xIKToJp2gDcKjewjQOFa4bdpWjaNJfYYYqgYgES
	 q81MSIqksIvY6Ngsnp78lE+UwMvS8pG80l/bg076XTsobOmBfnjA081kGW8msBd64+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637791;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Nf7/alv68IXjWnlt4DekDFFd76Dlk/dK2BFAvWipGHg=;
	b=ey5BN3nCc6t214gsqZRtWONkC9aPXvA03B+DFtIuqGffQz9Kj+rZBe3N5nZdrwVLPrE2
	 qCTSzQExqntbFCuJa7rKw6hlaDVMsi+ToBMSxhnvnduQWzD5CurWo1ZOJ6z5t1AACJarv
	 kCs8HeswtnKXpbl725MGq9G7Bzr/yLT7/sXthIjJTwwLA9qVToWwpRQDMLQHmHALpPq6v
	 3Ps59Aw5z7IXG4jpa4xc/c+yXS67ab2rjetrqKvwQ45y/RwgnLCvWKdNEAb+YkwHDafek
	 sV0Mdbwa1rN0TOnNy1MPkW6+0dO+IMb5z0vc6kqC7kmM47idxoAn16Phi0hE26f2ntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dz59r6xh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DC60A5BEA;
	Mon,  2 Nov 2026 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dz59r6xh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081431F00A16;
	Mon,  2 Nov 2026 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637791;
	bh=Nf7/alv68IXjWnlt4DekDFFd76Dlk/dK2BFAvWipGHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dz59r6xhqzlIAvYjDfGaSaxSh1h68eApMsKIzNfpYWrTjCFawS4ulBsaUH8rlW1pS
	 c4ZYKaCHaNz4oDSeuYHU0Who36zxcDBt0iB+p+DYptEMfgSOqRkEOKX1f1gOkfToOS
	 E01DWv/ckx6VhJsrV0NEDTKdY/9YVQpADjRZM6TpUl9MG529nnG67C8iwUGXvLPou/
	 imy1gpBcn85Nxo65VCwfC47GZyPVuSgJdvC6UV1Gu82YBZPJsAcZ4LNT1AQv0cZPbr
	 YbgZVGHhY8qIC/l08AY5GJYvkq8N/Ejijzfa8DGdo6RqQwM78JYNdk4QcGR3AKFx9X
	 hvtZz1Gj79low==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:46 +0000
Subject: [PATCH v2 5/7] kunit: tool: Allow several run_kernel() calls to be
 in flight at once
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
Message-Id: <20261102-kunit-parallel-v2-5-8774b558d4b0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o0udMlqUIfAznzMuinvP8zQVnSnw1dlQ3/LfRtrt4IE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O0NV/20+mKd1aou940sblUuQW61lf8kNiovrBUzX
 aU2a65qRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZyIZmR4dr8w8sMKlZzr5C3
 CvkVssB162H3iYVvFhm98zvY8Sx5zmyGf9o5JVNslNyOfnYv/BqRdXPGvN/CzNqnS3tyLu5LZQr
 YyAYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

run_kernel() records the kernel it starts in a single self._process
attribute, which the timeout thread, the cleanup at the end of the
output and the SIGINT handler all read back. That only works while one
kernel is running at a time, which rules out running suites in
parallel guests from multiple threads.

Track running kernels in a list protected by a lock instead, with each
run_kernel() invocation only adding and removing its own entry. The
timeout thread and the cleanup code work on a local reference to their
own process rather than going via self, so one kernel timing out can no
longer terminate a different one. The SIGINT handler terminates every
kernel that is still running.

No functional change when a single kernel is run at a time.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit_kernel.py    | 45 ++++++++++++++++++++--------------
 tools/testing/kunit/kunit_tool_test.py | 27 ++++++++++++++++++++
 2 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 2641db9eddba..1d3226f5a136 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -277,7 +277,11 @@ class LinuxSourceTree:
 		if kconfig_add:
 			kconfig = kunit_config.parse_from_string('\n'.join(kconfig_add))
 			self._kconfig.merge_in_entries(kconfig)
-		self._process : Optional[subprocess.Popen[Any]] = None
+		# Kernels currently running. There can be several when
+		# run_kernel() is called concurrently from multiple threads.
+		self._processes : List[subprocess.Popen[Any]] = []
+		# SIGINT can interrupt the main thread while it holds this lock.
+		self._processes_lock = threading.RLock()
 
 	def arch(self) -> str:
 		return self._arch
@@ -368,7 +372,9 @@ class LinuxSourceTree:
 		"""Boots the kernel and yields its console output line by line.
 
 		The output is also written to `outfile`, which defaults to
-		test.log in the build directory.
+		test.log in the build directory. This may be called from
+		several threads at once to run kernels concurrently, in which
+		case each caller must supply a distinct `outfile`.
 		"""
 		# Copy to avoid mutating the caller-supplied list. exec_tests() reuses
 		# the same args across repeated run_kernel() calls (e.g. --run_isolated),
@@ -385,37 +391,36 @@ class LinuxSourceTree:
 		if outfile is None:
 			outfile = get_outfile_path(build_dir)
 
-		self._process = self._ops.start(args, build_dir)
-		assert self._process is not None # tell mypy it's set
-		assert self._process.stdout is not None  # tell mypy it's set
+		process = self._ops.start(args, build_dir)
+		assert process is not None # tell mypy it's set
+		assert process.stdout is not None  # tell mypy it's set
+		with self._processes_lock:
+			self._processes.append(process)
 
 		# Enforce the timeout in a background thread.
 		def _wait_proc() -> None:
 			try:
-				if self._process:
-					self._process.wait(timeout=timeout)
+				process.wait(timeout=timeout)
 			except Exception as e:
 				print(e)
-				if self._process:
-					self._process.terminate()
-					self._process.wait()
+				process.terminate()
+				process.wait()
 		waiter = threading.Thread(target=_wait_proc)
 		waiter.start()
 
 		output = open(outfile, 'w')
 		try:
 			# Tee the output to the file and to our caller in real time.
-			for line in self._process.stdout:
+			for line in process.stdout:
 				output.write(line)
 				yield line
 		# This runs even if our caller doesn't consume every line.
 		finally:
 			# Flush any leftover output to the file
-			if self._process:
-				if self._process.stdout:
-					output.write(self._process.stdout.read())
-					self._process.stdout.close()
-				self._process = None
+			output.write(process.stdout.read())
+			process.stdout.close()
+			with self._processes_lock:
+				self._processes.remove(process)
 			output.close()
 
 			waiter.join()
@@ -423,7 +428,9 @@ class LinuxSourceTree:
 
 	def signal_handler(self, unused_sig: int, unused_frame: Optional[FrameType]) -> None:
 		logging.error('Build interruption occurred. Cleaning console.')
-		if self._process:
-				self._process.terminate()
-				self._process.wait()
+		with self._processes_lock:
+			processes = list(self._processes)
+		for process in processes:
+			process.terminate()
+			process.wait()
 		self._restore_terminal_if_tty()
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 4e8068dce918..c4999273e491 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -18,6 +18,7 @@ import os
 import signal
 import subprocess
 import sys
+import textwrap
 from typing import Iterable
 import xml.etree.ElementTree as ET
 
@@ -538,6 +539,8 @@ class LinuxSourceTreeTest(unittest.TestCase):
 			with open(outfile, 'rt') as f:
 				self.assertEqual(f.read(), 'hi\n')
 			self.assertFalse(os.path.exists(kunit_kernel.get_outfile_path(build_dir)))
+			# The kernel has exited so should no longer be tracked.
+			self.assertEqual(tree._processes, [])
 
 	def test_run_kernel_args_not_mutated(self):
 		"""Verify run_kernel() copies args so callers can reuse them."""
@@ -607,6 +610,30 @@ class LinuxSourceTreeTest(unittest.TestCase):
 			mock_error.assert_called_once()
 			mock_call.assert_called_once_with(['stty', 'sane'])
 
+	def test_signal_handler_during_process_update(self):
+		# Run in a subprocess so a deadlock fails with a timeout rather
+		# than hanging the test runner. Deliver a real signal while the
+		# main thread holds the lock used to update the process list.
+		code = textwrap.dedent('''\
+			import os
+			import signal
+			from unittest import mock
+			import kunit_kernel
+
+			tree = kunit_kernel.LinuxSourceTree('', kunitconfig_paths=[os.devnull])
+			process = mock.Mock()
+			with tree._processes_lock:
+				tree._processes.append(process)
+				os.kill(os.getpid(), signal.SIGINT)
+			process.terminate.assert_called_once_with()
+			process.wait.assert_called_once_with()
+		''')
+		result = subprocess.run([sys.executable, '-c', code],
+			cwd=os.path.dirname(os.path.abspath(__file__)),
+			stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
+			stderr=subprocess.STDOUT, text=True, timeout=5)
+		self.assertEqual(result.returncode, 0, msg=result.stdout)
+
 	def test_build_reconfig_no_config(self):
 		with tempfile.TemporaryDirectory('') as build_dir:
 			with open(kunit_kernel.get_kunitconfig_path(build_dir), 'w') as f:

-- 
2.47.3

