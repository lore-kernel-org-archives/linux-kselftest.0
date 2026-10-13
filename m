Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE24A4F04
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919610; cv=pass; b=FhwHtVpz6F3eFH+R12FH4smMN9N3Ev8HdCX5fZIFwuAZODfDx5dfpWKvg22EKjtji/Zk8++gvjbjJjvX1HKMZG2n8Gc16ElkPGSWQdluJQT1TZHf8F9qpnxs+h9qc5vNvONpbMGeRwP3ApRCp80+dJbXvBEC8YDYYzNysde+jys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919610; c=relaxed/simple;
	bh=8ka4q1KK0fW/BGTp7rl53tFGJzuhjINRBDv+MXNJkdI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E3qdV0X5lJvCZgHsxVgJx0qsqjPFXGLoQGxJn0xYQoRJAZlAy1VzZnBq01pcrTVUgLpYqmAppVMpInkF1cl4TYbJ9ZsuAsC0H12ZQm4YaU1ipTYn1FuDT70mlzqraUgGeshGzevmvmP7+qC4tFU5SYgLM/NzkSxeu3ltzsGMaLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USHKady8; arc=pass smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USHKady8"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cc73514ac7dso1548279a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 12:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791919608; cv=none;
        d=google.com; s=arc-20260327;
        b=gzeBJgYnTNsaSBy/kVgbyodFyaHbxDQF62u4zk7nVMruHGion38ptCVM3YLwSDK7UL
         V5PIf1t3O24qYhaGhzKsdUdpyRcXk/gtPlyZVBzwvIRbntkBIIxq6rDeHs4VX5ueYykv
         LsbtzutOWZtsBw7LmwzX94AJHiupGVkWNmJmHRcMoXdOs7hCjaCCH2VazR/O6rgOJZpy
         KvbEiQE5RdtviDGru1O19gmh8vvW3Wby2pYGAwHzQRRAR+yslerLZ8ITlUuWTRs+5+rh
         edIebmrqw5O5R/fnR+6U8XQzWTbVrBG6N5PLr1wJrkcAHDFHLYB9p3n5Mmw1kkdkl+wQ
         W/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        fh=nHBjajGBWCLtZ/glAuryi5vidEBFHLq71NQ9dYzl8Rw=;
        b=PvnahHSnFqGZfV95EE42wZhREJw3beTWEX0HSQQ0kpQN5rXm11oQVYSqyND5L7/W/P
         gjUFpPiJO4UWnHD18ttRT5joNvlX4HNg/kHFTKtpooEiCnjBSJADmeEYU3sY4tPPnR6f
         n8U1SLQ5SZEEo+bzUOGDNI76HYFGpa1NLv9R+pvCAAEdLqWqRDn/l2uaQQ3XwkvmwEEY
         0LXglwWUR/ldPL4aJJzKnwC6n9wBcR8Shm0iqR7ty13659aI6sATq1Mnwym8yi7B4hyu
         3L9AtCnjzDY251RSSGv/6M/EhYV55F1rAygLhX+TEXfRemWvysYxilWdMJRihPye4F1W
         QmZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919608; x=1792524408; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        b=USHKady84enV074drcCnQDqZ+csD0M302pGSSLlH0fd+9bfIN1gWcAxIwDiGMr+GIo
         0pi/j6SoLVPxfRWwabXcoJUUjK950N3EMu/HKYBK2GcmqEzMyxc4rATrc3pfOiCmoQeF
         211GkOAKKkOiIdKUnDKIzKwqqvcJdSh968TsxLMryjDwueTduwXTaWQy0aGrtsBZ6cBW
         QPMX0/ng5nKpTeZWiiWrUPr/1fiJCy4WTPN+PrMUZWk5xn4hRNEmcI8fioaLDAmlTdcn
         0WMPZqxYq5il6hZDYjqF6bP22l5tsYt+gDGX2U834PPAR2Qr4byR4MSWenZQiyxEr0Dc
         PHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919608; x=1792524408;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yGO2CkNY642DwHHU7AtKwsaD6YR1oevFy+Ta3M7wXgU=;
        b=rzRm+mxaxEwPHTVgqulm650Dx6/G20R7EbjaLZkkid351kSuFVBQymmqLC+G/vSiZo
         JiCWSNRwnBRwwGMShWf3xoT3kTqRACg6x5gmN6/a7WCBouno8qqSLB2GumNothCngHEt
         QNJf5390AL0u7fnvK5fORw2pzUVWVpwgjkMl3ELPYiR0Jtjl7D5gDOZsZ5pOb5o5vQ9m
         k/wQ+ex7dsWHbEgRXDDMSa7afTBlGJZnfIl5DbnIjSuKSqzV/NC99kwpFmVQ4ISt9D10
         fyqw6UPGbO5CfX4ggtUgrrkfqEYpssjg64WrTyAUxoSpD6efEvOtbLyI+LGx67ZlNOUn
         FWfw==
X-Forwarded-Encrypted: i=1; AKwUvBzDMdlPqseouIsApCTS5UgBjYqI1x6em4T+V4YMsFQe7b+clk90D5I+1eBHNm7OqHHyogVBN9wMj24mHOtL7AU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiXa2goFVmy4fzpXyt7Fb/zAZccqJI6r3Hm/3YvV8+7Xl+AIqY
	610xEW2z08ivoweAC5nuKv2sKTMRRLbI6YjVT6fM8HDs/q8UOZGNCxIJrZioClPpuPFbcm8Y8yZ
	zsBjUpMfGsAvXa4jLZhdNlk9uUhVWbS4=
X-Gm-Gg: AYBFou3bis/+az1EJKDeW6SnWQUVh75SBLlYlV+L58nXNmusWaLGzBXxBX4Qi50Exv1
	9hQVScr35p4cKvzJYO3U5lTCXB65qSMsQDOHtMtgUNjQfi5ZewZ42/cUFWgGbhOUmbRdb5ooqee
	jGpOYaRVxXLBtpWY2EuT/LpkBVYQCZBbslV6e95WR/Odh1xBMLcgroke9WGuGIF9k1gANnaFodJ
	jl2JCVwNLgjIWQ1uHn9GDmpRjI1gLtsn61yvyVNfGZfUaTnUtKpA6j094omT4X5CisL6Q7LO3jb
	PvSiiAOPZfRm+Q7Q4qekxtOAincSZWgKIDKUrKMRbjpyd4qUEmuK
X-Received: by 2002:a05:6a21:3b8d:b0:3e0:ca2a:f9e with SMTP id
 adf61e73a8af0-3e1d25889b8mr863599637.39.1791919608114; Tue, 13 Oct 2026
 12:26:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 13 Oct 2026 12:26:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 13 Oct 2026 12:26:47 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rowan Vale <i46475812@gmail.com>
Date: Tue, 13 Oct 2026 12:26:47 -0700
X-Gm-Features: AclHuK8z0f5f-xNogq-tJPITNRjWjPlgjKDkJ5DRXZAhxM0OyQGM9LJKmluhxb0
Message-ID: <CA+yQJ6mTGC-e8O1g-wtz1Gvb1+dHG0apkatg9Bzp6wPetYfuuw@mail.gmail.com>
Subject: [PATCH] kunit: tool: Treat all-skipped results as success when parsing
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Parsing a log where every test is skipped exits with status 1, even
though the summary reports no failures. This can cause a CI job that
parses results collected separately to fail solely because all tests
were skipped. The run and exec commands already treat this outcome as
success.

Reuse _map_to_overall_status() in parse_tests() so the parse command
handles skipped results consistently with exec_tests(). Keep failures,
crashes and missing test results unsuccessful.

Add command-line regression coverage using the existing log fixtures.

Fixes: 5acaf6031f53 ("kunit: tool: Support skipped tests in kunit_tool")
Signed-off-by: Rowan Vale <i46475812@gmail.com>
---
Validation: all 94 kunit_tool_test.py tests pass on Python 3.12.14.
The added all-skipped regression fails before the fix. CLI checks keep
failed, crashed and missing-test logs unsuccessful, and preserve skipped
counts in JSON and JUnit exports. Only the Python tool was tested; no
full kernel build or hardware run was performed.

 tools/testing/kunit/kunit.py           |  6 ++----
 tools/testing/kunit/kunit_tool_test.py | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 91d234ac3..eb660b46c 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -277,10 +277,8 @@ def parse_tests(request: KunitParseRequest,
metadata: kunit_json.Metadata, input
 			kunit_junit.write_junit_result(test=test,filename=request.junit)
 			stdout.print_with_timestamp(f"Test results stored in
{os.path.abspath(request.junit)}")

-	if test.status != kunit_parser.TestStatus.SUCCESS:
-		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
-
-	return KunitResult(KunitStatus.SUCCESS, parse_time), test
+	kunit_status = _map_to_overall_status(test.status)
+	return KunitResult(kunit_status, parse_time), test

 def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	      request: KunitRequest) -> KunitResult:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754..1e65b36d4 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -747,6 +747,26 @@ class KUnitMainTest(unittest.TestCase):
 		self.assertEqual(self.linux_source_mock.build_reconfig.call_count, 1)
 		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 0)

+	def test_parse_skipped_all_tests(self):
+		kunit.main(['parse', _test_data_path('test_skip_all_tests.log')])
+		self.print_mock.assert_any_call(StrContains('skipped: 5'))
+
+	def test_parse_passed_tests(self):
+		for log in ('test_is_test_passed-all_passed.log',
+			    'test_skip_tests.log'):
+			with self.subTest(log=log):
+				kunit.main(['parse', _test_data_path(log)])
+
+	def test_parse_failed_tests(self):
+		for log in ('test_is_test_passed-failure.log',
+			    'test_kernel_panic_interrupt.log',
+			    'test_is_test_passed-no_tests_run_with_header.log',
+			    'test_is_test_passed-no_tests_run_no_header.log'):
+			with self.subTest(log=log):
+				with self.assertRaises(SystemExit) as e:
+					kunit.main(['parse', _test_data_path(log)])
+				self.assertEqual(e.exception.code, 1)
+
 	def test_build_passes_args_pass(self):
 		kunit.main(['build'])
 		self.assertEqual(self.linux_source_mock.build_reconfig.call_count, 1)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.51.1
