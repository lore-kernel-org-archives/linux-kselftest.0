Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637786;
	b=u9c1WQnLCm3GprJdtekuE6Xa2ks695XtNJ9to3GqGaDw5JOuiRgOoI2OJ4FIXzwO6ln4
	 m8z04emK7XYLc1XGXmq7YLJuDgNY0RntHKa+TiuYHSwSPlA/Qe+HZOzkXqdXU04b/YFq1
	 QHeNFuqJC5C1wcmizu42auOQh5Q2C7g+/EZF2FQYbkJ+S6l4FLwzsjYv4Wom+lZb+wTXa
	 hXnOn79mF0eiP9SSaxkSO/RFwmxT1RaQKcGAXtYqK32fON8mp2KU0TihewC6E2VDvT5Vi
	 Aijmn4h9C8OOKuFBLJo4riSZQ+w7s4jpuqQRkh3o0jF04pkD7dS+5mDx8n8RoWCvRVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637786;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RGW2X2a9i1It8Ht3QPVjmgBH8i3IxBnYaK2D86OciC8=;
	b=PciXuNdubn/ULNkLzdy9iJWa5+qYmBcY2lQHlrXQ7u9dO5U1EzoEI4yN9AzAH6+tMjym
	 03OmYsH3XjzAp8qloa2XOx2qvep9h3mLhjSwPB/XPDJc0jHYJEucnsj6BAH0bdkalSoTv
	 vOToXkSmdxUZG1dwnpN/e9J6J4iKoSBtiUfiar9zuollZ90FGit3qhLX7hf6iy+H9lx66
	 BOXzLI2PAXEX0Rx5oL32YBPJAyzste3Fj4mHEeg+cpb6F9g5Q/VZ3pdQJsEK7ltJgsA0R
	 cP4mJkI1gOcD6Plpw+g4z2gqNeAHPlRKBf/vysYYmVHc//JFR+JSNdtkB2bjW6WiFig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoYzVBqn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E560A44CD;
	Mon,  2 Nov 2026 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoYzVBqn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1B61F00A16;
	Mon,  2 Nov 2026 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637785;
	bh=RGW2X2a9i1It8Ht3QPVjmgBH8i3IxBnYaK2D86OciC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LoYzVBqnYhgDqCK4MvIH/wyRZBaEdefCO/rr1q/heqq2LppEBfRz3k3SAtQJI0mEh
	 Ydb5zlN17Ap2hu6WF+ih2XcAjTVu2bfHoFb+HMFubEMhq43aPa3IpYuAy+e5bawnIt
	 wvWZk6wIIT91m/BPRmyl894hSx3ovSWPZ9v1dwt6V1LYId6ug29doSL0dbR0UFPA8x
	 /NkRqUgf4HqyiZ0Yx+gAiVkP6qLCdnNMTNEe7dEa28aT5tQ7miVXlIU+CXUdAthLuJ
	 y1ApljA4zK9e4coQrWsIfBHa2siHVsp2WerHI9100A6XRWxk/qKL3Q9Qx+UvbIPlx8
	 Xciojdt8tWNlw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:44 +0000
Subject: [PATCH v2 3/7] kunit: tool: Boot with a larger log buffer when
 listing tests
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
Message-Id: <20261102-kunit-parallel-v2-3-8774b558d4b0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AqCNoXSCcf9LGRuUnv9kym1iD2Mmttshr8Da0mvCvDs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O0tO7z8C9u7ukTXWNYrzKw9pp9bemRvbT7fl+/T8
 +yk578FHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIKQ9GhhuaFstyFr8TTNcM
 y6x52PvvyEJ38dX77lZv/7rK9l0bQyEjw+wffTGrvSdl7J/Xv9KR3VRR5tzKBW1OChvXuHSf/xb
 NzwMA
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

