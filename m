Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884D3E9F71
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119772; cv=none; b=fPHvgZTIg7z0VXtSrUYquZnH9APKlD9fkZu2wD+cJAcJz9UnX5UrE1jfFuQGuBZBZK6Cbec4Yw8TtdbaZjl7ISkEgJguW5V56KqRUQ95WSxQj8QThDzaHIPCnyxz2/bXdpDe2Kh6NWK5pZ9J9Qm5uCph6hgQalwWntvcM7XSre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119772; c=relaxed/simple;
	bh=KdTxgR9EBLNyZnFRa/HnfcRh9fouIMSWk6+JTAcBD4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBw1881vSF5ye3qFgPp/MfdUyYWzGmLDT+ZjG/kB2a8HsziY/YBjMWUMKY8DWs36aSD3SpvUI88PQgp0cKrQyuGp5cj+dg4TJ11Gq+rScv8aqLkIft18bMXaj/tTQ+EaE6kdVIowLSf2NMHO0bVamGe6NuC+gtw+yYghA4MFXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt6SkyQ4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt6SkyQ4"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82747396358so206348b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772119770; x=1772724570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TlQh4nIRsXGFML1TwWAE1gHVHpIUgIj6w9/dUqr7Qlc=;
        b=Xt6SkyQ44otMzRRVgvlQbFxbM7ISKt3Fr8RaGdrULYkAlcTfvrezDdfK+IISy306/w
         vKSe4962/81YuNK6Qe+ptU6rAFqjeUtar3lkhMbgvyie1o3I2oLAiA0tJJStnCjtlkT/
         BebMkjAej9f5qTMgKN81t+JIBC5KgLYzWB00qTrYkmgNlLl0hk1ag/saJ9cP6NT+t7Rx
         SMf1W+xF+662Cgo36dd56PghGdgD10MF6kxk2xvRk3iAB2wss4KhFJy0kzsMRYOEc090
         DGFjqLsaSKQ0JPZsRGyCRbkghiXAp32df4O+rVOy8W+wzIOjGGSDsi+e4Hc3NWFeGpC7
         ibFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119770; x=1772724570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlQh4nIRsXGFML1TwWAE1gHVHpIUgIj6w9/dUqr7Qlc=;
        b=jZEojyYIOvdhx9LN1foCtzI35I6v1jyRrnKyZ4eQ3gD7E9hhUaxjehmu9MP8okOc6j
         NwyFMH/ZnphkoPto65hEh2e8xAS/T0tT4GRU2psB8E9pHA2CbggyFpiWfvSg4vVjYEeM
         F0H2W202yI1FceW5EsDQftJatTe69vSLffnrB/jEnUvA21/X9Vy7acZWS5dPOUbGY8V7
         bX0nOU1xAXxMaYiHIKCVSCcGWA+/hg8AR56CMN+bvX7okTmr9CI3VP49M3qUbRiXQz6I
         8QY3tXaPVvRTpgJLKSSDqJcpZU6O7kylYQY60xqVz8mIVgfNMT37Eaip2FGi3PlMfFeY
         d3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoeGUkMWRuic9hs0+4e4n+B3ooAa0mVOJAYA4nftFf3KixmlmKLEe3n8tpXq+SQM4xxC0A5qMXFRLhBAHqwF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymCrvISDLLQTfV7q5ODD/Is2ewWAqEmx9GvDjnAmkvHpNX/PJA
	uIJQN4i6Nsrs5C1RbcH2uMtqsbQMMjr4SqgPG+StxcK7iizbwQ5sIsmrSYlPepnA
X-Gm-Gg: ATEYQzxrj/j8UblNjgl9i/HOWfuv8nObetEJIHCTfEKcNQ8DoyVth6A+Wpu+tEcOxJs
	yoyhGpsrBQwWH1EYuGUNTgzoTfOhaKTESjDfG2cFoKQHF36INinmuxU906oa/oWu57H1POXw5jK
	TL9gyK7rZb/56a0Rvv6qDEq4bhkDZs6o3u8JpLiXTB+dVUW1KzsLUVB9eTcyr5lHhjeeekSi6rA
	MhTB4S6jTQ+eHjccGocivMxGva0qiNfOzlAjWryvhLJpBOANWMGpzkVC8rjpGY/Vzsmi0mf8EX4
	sWsMaWG9HHONEXXevUgDYTGj8ItFRQ+r2DGdCYOlva10PuY1BbMtL/4lxJ+QYwbC2jFNrJnX6tj
	HxrCpvnrME8f5afWGrZ8rMTKLlnIY9HC40KpUH74Vl2JLI7C/7WuoOszXW6I1Y1v97CIfQZyGn1
	xm31SzbgP2aHERWM3MySl2DpzXvxGlo+JLy3tYif1K59Aq1sG0A0tNb9CB1ciP+zit0Q==
X-Received: by 2002:a05:6a21:46c5:b0:38c:4371:23f8 with SMTP id adf61e73a8af0-395b499813dmr2888346637.67.1772119770381;
        Thu, 26 Feb 2026 07:29:30 -0800 (PST)
Received: from mac ([113.199.232.144])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801963sm2191191a12.21.2026.02.26.07.29.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Feb 2026 07:29:29 -0800 (PST)
From: Shuvam Pandey <shuvampandey1@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com
Cc: raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Shuvam Pandey <shuvampandey1@gmail.com>
Subject: [PATCH] kunit: tool: copy caller args in run_kernel to prevent mutation
Date: Thu, 26 Feb 2026 21:14:10 +0545
Message-ID: <20260226152910.34530-1-shuvampandey1@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_kernel() appended KUnit flags directly to the caller-provided args
list. When exec_tests() calls run_kernel() repeatedly (e.g. with
--run_isolated), each call mutated the same list, causing later runs
to inherit stale filter_glob values and duplicate kunit.enable flags.

Fix this by copying args at the start of run_kernel(). Add a regression
test that calls run_kernel() twice with the same list and verifies the
original remains unchanged.

Fixes: ff9e09a3762f ("kunit: tool: support running each suite/test separately")
Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
---
 tools/testing/kunit/kunit_kernel.py    |  6 ++++--
 tools/testing/kunit/kunit_tool_test.py | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 260d8d9aa1db..2998e1bc088b 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -346,8 +346,10 @@ class LinuxSourceTree:
 		return self.validate_config(build_dir)
 
 	def run_kernel(self, args: Optional[List[str]]=None, build_dir: str='', filter_glob: str='', filter: str='', filter_action: Optional[str]=None, timeout: Optional[int]=None) -> Iterator[str]:
-		if not args:
-			args = []
+		# Copy to avoid mutating the caller-supplied list. exec_tests() reuses
+		# the same args across repeated run_kernel() calls (e.g. --run_isolated),
+		# so appending to the original would accumulate stale flags on each call.
+		args = list(args) if args else []
 		if filter_glob:
 			args.append('kunit.filter_glob=' + filter_glob)
 		if filter:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index b67408147c1f..f6383884c599 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -503,6 +503,32 @@ class LinuxSourceTreeTest(unittest.TestCase):
 			with open(kunit_kernel.get_outfile_path(build_dir), 'rt') as outfile:
 				self.assertEqual(outfile.read(), 'hi\nbye\n', msg='Missing some output')
 
+	def test_run_kernel_args_not_mutated(self):
+		"""Verify run_kernel() copies args so callers can reuse them."""
+		start_calls = []
+
+		def fake_start(start_args, unused_build_dir):
+			start_calls.append(list(start_args))
+			return subprocess.Popen(['printf', 'KTAP version 1\n'],
+						text=True, stdout=subprocess.PIPE)
+
+		with tempfile.TemporaryDirectory('') as build_dir:
+			tree = kunit_kernel.LinuxSourceTree(build_dir,
+					kunitconfig_paths=[os.devnull])
+			with mock.patch.object(tree._ops, 'start', side_effect=fake_start), \
+			     mock.patch.object(kunit_kernel.subprocess, 'call'):
+				kernel_args = ['mem=1G']
+				for _ in tree.run_kernel(args=kernel_args, build_dir=build_dir,
+							 filter_glob='suite.test1'):
+					pass
+				for _ in tree.run_kernel(args=kernel_args, build_dir=build_dir,
+							 filter_glob='suite.test2'):
+					pass
+				self.assertEqual(kernel_args, ['mem=1G'],
+					'run_kernel() should not modify caller args')
+				self.assertIn('kunit.filter_glob=suite.test1', start_calls[0])
+				self.assertIn('kunit.filter_glob=suite.test2', start_calls[1])
+
 	def test_build_reconfig_no_config(self):
 		with tempfile.TemporaryDirectory('') as build_dir:
 			with open(kunit_kernel.get_kunitconfig_path(build_dir), 'w') as f:

base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
-- 
2.50.0

