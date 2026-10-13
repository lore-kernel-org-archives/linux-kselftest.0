Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9184F393E;
	Tue, 13 Oct 2026 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906723; cv=none; b=rUIulx5RAqSkMWn/h+EQSLYpG62KpvSBnbcUoEpnaUSKNUzdXvNM7YTf6ru6bZ3BURxbbJB7qC+seoROUFM6d02bQDpdo7uAvW+n4Al/PSvZheuTNj90zUTgadlxaSwWiBpoVOR7cyU1nToMMGHKKfT1PRY2TUrd2a/9ot3xE5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906723; c=relaxed/simple;
	bh=o0udMlqUIfAznzMuinvP8zQVnSnw1dlQ3/LfRtrt4IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcDBpfSmop1e3856mxiYT/U7xdtOSxM8P3+EtrmOuAlp/FGRbhuTN9B8jFeoMUOfLjlnWbRyl6hXtA1xAVLE6e9D1DBzNDItPcpX43Hx6pTGy2hRCjLik2OlBkOj0aHvIuccbu6Dzw+Z9XfxXSR6vvhPVrtSJPvUNa2l3uRtJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz7yq3fn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz7yq3fn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746591F00898;
	Tue, 13 Oct 2026 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906721;
	bh=Nf7/alv68IXjWnlt4DekDFFd76Dlk/dK2BFAvWipGHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kz7yq3fnofuV99ds1hQW6LFEjhW9UDdL2PfAn7+4pUWmoJ1+z3yUlGa5w82dPnCT6
	 Kb1vF+l9ZlXwTHWOlmNTSq6oXfhdi5/jlcNlCaMgS4pt1v4xxmfHEEnUnc+rIrZZNu
	 njuVHkFHKwqi5Z2olBsEWuIR1W+mIH3Xp33rNXfn2+tC90bSeoB+LT7sWzF8VSlwZ3
	 DBgO7n+Adq8r0/dZOdANR74KcDaTJdpF3h7XC4tvoeigTW03qHDotU788Z5kXGC0ah
	 6dAsHfiWAm69SLPQdK6dkX0OCsMJESAm67AHhdIV3b/QipAvptaxl8tDUAjyyWLoZc
	 GAZdiErHCkZ8Q==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 16:43:24 +0100
Subject: [PATCH 5/7] kunit: tool: Allow several run_kernel() calls to be in
 flight at once
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kunit-parallel-v1-5-f4be28c895e5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=o0udMlqUIfAznzMuinvP8zQVnSnw1dlQ3/LfRtrt4IE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbcq1O3blSHE6DSfb9lcy/un+aMWiBW9vf1h/pfP9
 Wq/ZBZ/7ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBESmYw/JVUd7U22vSu8ECW
 SXhTxzW5e6H3q1YY/7jxVqDhWRdP8mqG/76/02tDNG/Wxv0QmxgQLrm+5LVt28fj8bInri18c2j
 2JB4A
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

