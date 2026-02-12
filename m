Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CDF3587A2
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914263; cv=none; b=V55JdUMjdbZkRDGC1QMYZsEjdBs+2ZZ2OVqJKhE5CM5z1629YOYaz7u9R5fyUwyzQQ5GTUs1lWjcAouDPiJLKbvW7kzbRZ8rFmTKbasMcGIX85MxUq0xBH2e/p8YZ/QYGx76XOcC+JzmBL2NaneJ8MFE6BSOYVmDX9edhvYjmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914263; c=relaxed/simple;
	bh=bNYJhF/vrfnqfdjS1Xo0X9csm/vyWSOMWcUkGWy2eqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q9c7YFb+x6XGCiuybgMuhrIiTl/NlmdYG+/EVot+xQWK+oONeBuHDzCcvMe+jAC4sV8xzuZzSsWCnxCfc1qtdGCrJGF/RwQ42FbxBVoX4WK4QLSEwG8K9uih+cXc8r++9+xu3Zt7xyZXy64Bkn93q//LyxkWVIF0IvYQMQeiEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzJRB6dG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzJRB6dG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7b47a5460so12165855ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770914260; x=1771519060; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RshJ2GX59bxxjI+XoqRN3YBnxOSZhELYxBIuUEvTR0k=;
        b=dzJRB6dGPRJ3/lYhnj/U+zlJS+Ux7Qez5+p2k1tsest8HMOr8fVvRE7qEWI9knqkWX
         6faCRfYKYPO3ipII2coxhA1ViqxrYoImlWQspUkWAC1OhBcB4ixKil+W3cPrt2Ln/e4i
         0MTvF74XqZJCusYtY3PW4msLE8K9U2ddSg0ISjl8+VNcKkHP4O8EGa6uxA1/udLNByJ3
         euktrEXkeR0gibd8RorIDxXPnNLfpZbBX5ouG/s3N5DPBwjLNYD5DgtoMOkchQjLjDQt
         zZTDYNXavCg+IvZzDElqM+umcHEx6nxmXwMuLJ26cicwHMto3T8YgEEjeorubcNwsGHa
         49HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914260; x=1771519060;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RshJ2GX59bxxjI+XoqRN3YBnxOSZhELYxBIuUEvTR0k=;
        b=q3SJovoPwtLe7iGukNqu3rvPq7jfzdWI9S5fUFBYdMgKM7Ii2hjnYmy19NC+QT/UbA
         b8f1QOWfTo8QZMBgquEPgK82cYAySowJWDpXgMdDAAgvsfaVrrKmYRA2Lg+X0px0nSer
         PibnfcYk8bjnD682l7VLb3Yru64R1eTS2KxRlFOEHr4BqE4KkR1L+BsY1QAcyCO2a+3Z
         15f1WQ0QEMY1za8ReLoLF85tfdzHpJkiL2QDYuM5AEky0wz3L1ueCDHyEfIl3v4AcEH+
         aYk0399chlkaxCgyxkY3EUmbxrqmxEr4QRBva0LsCo4JveZmzJTq72VNIManpRwkGTSq
         1G1g==
X-Gm-Message-State: AOJu0YxpmqvzsohYhmo031oH8UsFayRiGUmCRlmLPVWQ8qNqZD1jPGgj
	HqZ1ftlbvS1c7iYnE9niT4pe6tmiYsESv8df/qAIV1gJW1V1ncv3hJS5jdk9RZG1
X-Gm-Gg: AZuq6aKZKWf5ZoOYkbIqT8XgVdvsyJDlCu2/ceDlEzyQaE1Pq+hA85yYUIVE8YNN2Uf
	t5HqRNU+nIqO7txRrtr2YAQAUY4R8GSNSPPCPBIx+zZ8sHUl0S5zcJ9nARyNDpmy5AkBmQkeEZ+
	p1UN35SgU/SkLJ8zK3L8EPzC1Hbm0OhkwIrXdEQIYo+2jmkw0cfvnLw4o/POAKnqAAiHA6IKC8U
	QJy36bVsIxHnuUChUIYh1OtOD/rGqtubp0JYBMbK9JKj/tc8sZZVuNFbs5jpt9huEXC5r/Udrfw
	GYhHnsrK8kR+xfByAi6UDPqm8YOIMjhrDry2daPDBPbr7VRa8l2MONQju1XgBIHpN0qCICWyLLb
	NoL6zj4FQYk26nlUnn1KxLQNPgorPMpVvPSCopK3A+jpp/CsNesancYXcwy6YTgw2mWr9b5Ers9
	FEjVSoTC+mhQnj1+M1rML+V74zUMAE1xs=
X-Received: by 2002:a17:903:28c:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2ab3a635772mr31062095ad.5.1770914259478;
        Thu, 12 Feb 2026 08:37:39 -0800 (PST)
Received: from [172.16.80.107] ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997bc2fsm60525635ad.76.2026.02.12.08.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:37:38 -0800 (PST)
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Fri, 13 Feb 2026 01:37:32 +0900
Subject: [PATCH] kunit: Add --list_suites to show suites
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-kunit-list_suites-v1-1-6e6394faf4c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBNUqKCrRETpVENh4WgE0t2Tl
 m/xfwbGQMjQiQwBb2I6fYGuBNht8itKcsVglGmU0VruyVOUB3EcOVFElnZStrZzi65xULor4EL
 P/+yH9/0Ab+iRKWMAAAA=
X-Change-ID: 20260211-kunit-list_suites-ca0c5cb7ed6d
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, Ryota Sakamoto <sakamo.ryota@gmail.com>
X-Mailer: b4 0.14.2

Currently, kunit.py allows listing all individual tests via --list_tests.
However, users often need to see only the available test suites.

Add --list_suites to show suites. This option parses the test list output
from the kernel and prints only the suite names.

Example of the output of --list_suites:
  example_init
  miscdev_init
  printk-ringbuffer

Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
---
 tools/testing/kunit/kunit.py           | 16 ++++++++++++++--
 tools/testing/kunit/kunit_tool_test.py | 16 +++++++++++++---
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 4ec5ecba6d49b1ba3360515a2b66a2a98813bd18..742f5c555666021f61c44a98229bb34f9664d3c2 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -63,6 +63,7 @@ class KunitExecRequest(KunitParseRequest):
 	run_isolated: Optional[str]
 	list_tests: bool
 	list_tests_attr: bool
+	list_suites: bool
 
 @dataclass
 class KunitRequest(KunitExecRequest, KunitBuildRequest):
@@ -168,6 +169,12 @@ def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -
 		for line in attr_output:
 			print(line.rstrip())
 		return KunitResult(status=KunitStatus.SUCCESS, elapsed_time=0.0)
+	if request.list_suites:
+		tests = _list_tests(linux, request)
+		output = _suites_from_test_list(tests)
+		for line in output:
+			print(line.rstrip())
+		return KunitResult(status=KunitStatus.SUCCESS, elapsed_time=0.0)
 	if request.run_isolated:
 		tests = _list_tests(linux, request)
 		if request.run_isolated == 'test':
@@ -438,6 +445,9 @@ def add_exec_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--list_tests_attr', help='If set, list all tests and test '
 			    'attributes.',
 			    action='store_true')
+	parser.add_argument('--list_suites', help='If set, list all suites that will be '
+			    'run.',
+			    action='store_true')
 
 def add_parse_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--raw_output', help='If set don\'t parse output from kernel. '
@@ -501,7 +511,8 @@ def run_handler(cli_args: argparse.Namespace) -> None:
 					kernel_args=cli_args.kernel_args,
 					run_isolated=cli_args.run_isolated,
 					list_tests=cli_args.list_tests,
-					list_tests_attr=cli_args.list_tests_attr)
+					list_tests_attr=cli_args.list_tests_attr,
+					list_suites=cli_args.list_suites)
 	result = run_tests(linux, request)
 	if result.status != KunitStatus.SUCCESS:
 		sys.exit(1)
@@ -550,7 +561,8 @@ def exec_handler(cli_args: argparse.Namespace) -> None:
 					kernel_args=cli_args.kernel_args,
 					run_isolated=cli_args.run_isolated,
 					list_tests=cli_args.list_tests,
-					list_tests_attr=cli_args.list_tests_attr)
+					list_tests_attr=cli_args.list_tests_attr,
+					list_suites=cli_args.list_suites)
 	result = exec_tests(linux, exec_request)
 	stdout.print_with_timestamp((
 		'Elapsed time: %.3fs\n') % (result.elapsed_time))
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index b67408147c1faaab12b168aabe3bfba8bf1b00aa..a7402afd33743455b3ece72a495a6c8769ed51af 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -855,7 +855,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.return_value = ['TAP version 14', 'init: random output'] + want
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False))
+				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
@@ -868,7 +868,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False))
+				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300),
@@ -881,13 +881,23 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False))
+				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test1', filter='', filter_action=None, timeout=300),
 		])
 
+	@mock.patch.object(kunit, '_list_tests')
+	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
+	def test_list_suites(self, mock_stdout, mock_tests):
+		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']
+		kunit.main(['run', '--list_suites'])
+
+		want = ['suite', 'suite2']
+		output = mock_stdout.getvalue().split()
+		self.assertEqual(output, want)
+
 	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
 	def test_list_cmds(self, mock_stdout):
 		kunit.main(['--list-cmds'])

---
base-commit: db0c35ca36526f3072affcb573631ccf8c85f827
change-id: 20260211-kunit-list_suites-ca0c5cb7ed6d

Best regards,
-- 
Ryota Sakamoto <sakamo.ryota@gmail.com>

