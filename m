Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C912E1DC
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195505; cv=none; b=DTjKx6KnSdiBcLRYVFqoM/IWvC5+zbTn7rDFO4jS4ioU1KQVhfQCL1xLEl/fGcz7pMiHfxoLLcldSVcQHqVicQdfD5EGfKvPkQhb2Tnc8DNWieyvXsTK4Jnb0pCgr0CauXjGZkELyV6GQuGob7Lz59KriWG9q7VV0n0aToIsxQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195505; c=relaxed/simple;
	bh=v2/57WwF8w7iACHfTCkO5W9+hM3Krg3WvgtT0li001I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POhuScTRFqHfx0FjAzeSrJP9CXrxAEvrLnhpR9CoNMLXijN5LhMzTI37z5E5Lq6EcK+pb1PsZCmROpt0A1TwL7VJahLXYT70gbFIuCopNJiwI88bcABBeuVjzzS4xOCmzRGPvo0sb3LwMLiPfx/elcyNQG4dKZBadVkfyFdXdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5SLup0z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5SLup0z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8273eb7798eso814877b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 04:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772195503; x=1772800303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajshf8l6anZvHOKZ2eAGK/RXqDyQYxeDuW8fo/WYnWI=;
        b=G5SLup0zCW7uYyKPE3yGlJpcOgJzAEZI4Xcx2+Bvy8Ob4cu8Xyb1uqhP3MVe5SAdYZ
         yPppYIMADWFC/FqgUsdB2hj1vQreNl19YZT23y9fIpVHM4Aa/qtSqxOQDrDKRFYmjoql
         ugG9RHf9UTcYPQio7Zx1BJg3sMTPyAQjRperUY1FxPnwRFBUTD9DnRX6E6LVuc4iWRP5
         2eEFzzNi0FAebPRpFwRSLB+tfrEpU4AWFbKCT4lJzvON5hRdpjH8/J3Ow7vUIXHpSqqW
         zHLdJatZl5JJ5K3O1r4XLkRTxjJYx5QpWKAlIfzfnjlbLMNMToPTr1cmtOpiUKT9xvbM
         VQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195503; x=1772800303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajshf8l6anZvHOKZ2eAGK/RXqDyQYxeDuW8fo/WYnWI=;
        b=Qqf90KSh2Zf6teurMUoeHZHpWsg25KfLwp2yrWN2gzErjju6oGmBbZvtRssRBVN+nF
         vJPKY8y0iw9eVLZrFuSuh8QUEiRHdjKSQS1BOqFvl5xt0UwF2N0TwOJBcJaA1Ir3ggb5
         8cQmgMW4MpVvSnBElRrDN/sVm9qglYqzVEUObdHS2EmZXhvfAtpRaNDPNoeyx7wjFjl+
         4G/29vgZxgwTMWgNw+a+MXxbonFbYvQny+EJfQPN8TY2yE/VFaiRWmra76Nwm9+v3DM/
         /Eyn7t7pfJmyQaTf63qH3tIZf5bNtpbDrwI997zy7ieluER9CT5NiIii4HkIkKZnQBXV
         1YhA==
X-Forwarded-Encrypted: i=1; AJvYcCVrw2hLRY7VmXWNBPonGcDDYNCswApofcrPC6XkIXJQE01gx4vjHpKuw54rAFOzE45mSb41eN9RoWsXuTdr0lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKlh9HoL3r2WXd3sSBzI+CE3PkxqTmF7BRwHxLtwAEGndJfA/
	PXZsTTMPlCpLP09+pmCgRC6DNn4CQGMQiXtwv0r6Y3+F+M6+AZAPl7sb
X-Gm-Gg: ATEYQzyx2NsaX2o9TjiurUQFH2e0ActuNdnLHB8xhCsFCyKNzAZ6kQGT7ZAvlBfnKUA
	ydxOsfabyUbYK/aCiVspiz8qfvF5Nu2sVqZh2aGB8GVrk4RkdxzHfbqCIsKc+E3IOL3MS47jxSA
	qN+JWOJbaE94XxXvVZ1jiiozuXbthIrIABl1wDNY593b6FMXPq7FjlafF50J7ULroj3941LMGcU
	25SIr6+vkd8ebSIqsZWbjrN5he4OsMmuX8Cpi8jSo54jTLy1fP639jABmetXKHWGfkWm/3eQlWu
	6Sbgx+2pv8kvkTn1h8SnrdKZJhjDtzUaG2d4204uWMi9YSgsoPYf4VZfuNWTL/JUe3SzyMJ1W6O
	XBecyxU/A0U5SUo21TYW1Gakv1nIUbADb6tbsMCE9qzRjrSd/d0zefYZ28M1lzITczLVNbunnaR
	+ouPXY4azhl/yZP0retny7yhQ1QVSsjm8ZJ7Iq8StVdTMQJzoj3nn3RB6ovJ2mNA==
X-Received: by 2002:a05:6a20:938b:b0:394:6646:d3eb with SMTP id adf61e73a8af0-395c3b3abf9mr2842434637.64.1772195502633;
        Fri, 27 Feb 2026 04:31:42 -0800 (PST)
Received: from mac ([49.244.49.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcad63esm6380432a91.2.2026.02.27.04.31.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 04:31:42 -0800 (PST)
From: Shuvam Pandey <shuvampandey1@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com
Cc: raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Shuvam Pandey <shuvampandey1@gmail.com>
Subject: [PATCH] kunit: tool: skip stty when stdin is not a tty
Date: Fri, 27 Feb 2026 18:16:36 +0545
Message-ID: <20260227123136.91086-1-shuvampandey1@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_kernel() cleanup and signal_handler() invoke stty unconditionally.
When stdin is not a tty (for example in CI or unit tests), this writes
noise to stderr.

Call stty only when stdin is a tty.

Add regression tests for these paths:
- run_kernel() with non-tty stdin
- signal_handler() with non-tty stdin
- signal_handler() with tty stdin

Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 tools/testing/kunit/kunit_kernel.py    | 10 ++++--
 tools/testing/kunit/kunit_tool_test.py | 42 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 260d8d9aa1db..6f49b184a6fb 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -345,6 +345,12 @@ class LinuxSourceTree:
 			return False
 		return self.validate_config(build_dir)
 
+	def _restore_terminal_if_tty(self) -> None:
+		# stty requires a controlling terminal; skip headless runs.
+		if sys.stdin is None or not sys.stdin.isatty():
+			return
+		subprocess.call(['stty', 'sane'])
+
 	def run_kernel(self, args: Optional[List[str]]=None, build_dir: str='', filter_glob: str='', filter: str='', filter_action: Optional[str]=None, timeout: Optional[int]=None) -> Iterator[str]:
 		if not args:
 			args = []
@@ -384,8 +390,8 @@ class LinuxSourceTree:
 			process.stdout.close()
 
 			waiter.join()
-			subprocess.call(['stty', 'sane'])
+			self._restore_terminal_if_tty()
 
 	def signal_handler(self, unused_sig: int, unused_frame: Optional[FrameType]) -> None:
 		logging.error('Build interruption occurred. Cleaning console.')
-		subprocess.call(['stty', 'sane'])
+		self._restore_terminal_if_tty()
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index b67408147c1f..201d5245a9f4 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -503,6 +503,48 @@ class LinuxSourceTreeTest(unittest.TestCase):
 			with open(kunit_kernel.get_outfile_path(build_dir), 'rt') as outfile:
 				self.assertEqual(outfile.read(), 'hi\nbye\n', msg='Missing some output')
 
+	def test_run_kernel_skips_terminal_reset_without_tty(self):
+		def fake_start(unused_args, unused_build_dir):
+			return subprocess.Popen(['printf', 'KTAP version 1\n'],
+						text=True, stdout=subprocess.PIPE)
+
+		non_tty_stdin = mock.Mock()
+		non_tty_stdin.isatty.return_value = False
+
+		with tempfile.TemporaryDirectory('') as build_dir:
+			tree = kunit_kernel.LinuxSourceTree(build_dir, kunitconfig_paths=[os.devnull])
+			with mock.patch.object(tree._ops, 'start', side_effect=fake_start), \
+			     mock.patch.object(kunit_kernel.sys, 'stdin', non_tty_stdin), \
+			     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call:
+				for _ in tree.run_kernel(build_dir=build_dir):
+					pass
+
+				mock_call.assert_not_called()
+
+	def test_signal_handler_skips_terminal_reset_without_tty(self):
+		non_tty_stdin = mock.Mock()
+		non_tty_stdin.isatty.return_value = False
+		tree = kunit_kernel.LinuxSourceTree('', kunitconfig_paths=[os.devnull])
+
+		with mock.patch.object(kunit_kernel.sys, 'stdin', non_tty_stdin), \
+		     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call, \
+		     mock.patch.object(kunit_kernel.logging, 'error') as mock_error:
+			tree.signal_handler(signal.SIGINT, None)
+			mock_error.assert_called_once()
+			mock_call.assert_not_called()
+
+	def test_signal_handler_resets_terminal_with_tty(self):
+		tty_stdin = mock.Mock()
+		tty_stdin.isatty.return_value = True
+		tree = kunit_kernel.LinuxSourceTree('', kunitconfig_paths=[os.devnull])
+
+		with mock.patch.object(kunit_kernel.sys, 'stdin', tty_stdin), \
+		     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call, \
+		     mock.patch.object(kunit_kernel.logging, 'error') as mock_error:
+			tree.signal_handler(signal.SIGINT, None)
+			mock_error.assert_called_once()
+			mock_call.assert_called_once_with(['stty', 'sane'])
+
 	def test_build_reconfig_no_config(self):
 		with tempfile.TemporaryDirectory('') as build_dir:
 			with open(kunit_kernel.get_kunitconfig_path(build_dir), 'w') as f:

base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
-- 
2.50.0

