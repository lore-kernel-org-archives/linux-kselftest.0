Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60144472798;
	Thu,  4 Jun 2026 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576657; cv=none; b=QzO06R6ePhA3QB2Q1aDPADzoRiKfznP+MQYL9nfuMeryb5XNhDXWQkAGVdzqf0MqbGS5LSXmoqPdUO5NSJSPillS3Kn2rHaUm9HpMn4dwJQOMhILHe53rtReL6hfVlsSWqYjQ32dtxrLFuE+Ph2TfV9p6G3maqGUUjp6pIZe5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576657; c=relaxed/simple;
	bh=dqIDEslQCzd6fKJ5g2l3UD1jEDxQ3jg0RqPV3z5hhOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNTKRCxS8QnHsXKgSIz5pTV+TyWe//2UhTP5VNxj4YEy6emNlrpEDtnMwNYWvXu5VNR5WskZcBShC6TH03xyrUb2f/jtu4Uq4WMbM33u5rtSt2OTHtEl9QJIM0pvpsRAnPm3F9Oee4cGaXRfwINX2DC/zmmjL9arHHjEuPS/D2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=UJAsmfBt; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=fJBgxfd9; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="UJAsmfBt";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="fJBgxfd9"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780576343;
	bh=dqIDEslQCzd6fKJ5g2l3UD1jEDxQ3jg0RqPV3z5hhOg=;
	h=From:To:Cc:Subject:Date:From;
	b=UJAsmfBtILK9VUY8wTRTnibw6vcemj+25LaiTSA9eeLlqSeFJGflqXqXsdcTJXq8i
	 kpY9n/HkkKyo1oI6sYVKl1NH5jO4XNpF6yB+n48aNgC7hnYYayncW6+pkPfvKyU5Yw
	 y8KAAtz5dGdVrZYNLvK2E4c6iVPEq9ymEX2b+x+m7X63zgxn2xNz/EMkCl3IocrV30
	 K/DCsSlj4SgymYOLxRILDFxbWJCzPdh2W3WJ5hjWkeqcVvkZqZ+j2Uhl7+weIdC/nK
	 RVYdbJUYcAnKriU0BJMP1OXFzxQjwfM0DsqtDdEvLFa15bPlfAhc2t6YtmY5Gt92vc
	 LXwEYh+FWJAr9vjHanNcwbLnHIH4B5ShHBmVdGMUAxW3y9KVmD56olAe8R0z4XYlxY
	 J6eWEdxGHx4SGQCnWnv5G/mlg+bf8gi0N/QXmjUZ27ZJRQAxzyDGlRtrwDZbLl5VXt
	 pvNTa0vIP/ypitTBnaMg3V/22PSFuaxEU2z5xQbpc9nxEWuwm0BGqq9ViWYyy7hDLU
	 4IlbD6ViW3gemafDrkbVWNjxxe4JtD6CHtiODEgpDHun6rLQ0hB7YrU6U3IW9/zcSA
	 kI1VTcK+V7T76mDm+CzKGb1M+FMEKDCAYc/Q7iZjvkBQ36A4kwEoPLQa7Ib0Ac0Bpz
	 38E/lkaBY7C2t1Vv/0JTg/+E=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id EE6801E9180; Thu,  4 Jun 2026 20:32:23 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780576341;
	bh=dqIDEslQCzd6fKJ5g2l3UD1jEDxQ3jg0RqPV3z5hhOg=;
	h=From:To:Cc:Subject:Date:From;
	b=fJBgxfd9EdyzhOuq1vdMd+PEkdHuJBmVRaHD8jfoP0GeXjuETaZJ19vq4EjINUHif
	 lDhG2g3Ve3y2qpgtwr7IpDFMK7FCE2wZ3FmKQbxZzQPa33Eh+M6/Yam8I5cf4/cieC
	 12bOn44xlToGq9TXSWXQCSc+RT1vb9aF9Spzs2TZduAmR90XtHnUro7omN3ef6SGEG
	 kOvP0RHvpSQZ5I7xSIpVIo/NbhTzYCe8PPPyZx9GGIo37iYIJA0ebg2OMucA2ZoBRv
	 7ttIuYf2Qwc0Nqa57e92SzygXnJP+SUPOF4Imsi5VpkOJdsZ/Gt1wYh2uM/rfHCwrf
	 TH875QB8AzPXS5vwDcNnebc5oZd96MdU6qAPdFFy9DfZQKyVvwR5l0GceUv+sRNNkl
	 /PT7vJ5Lwb7NFv6xX2BR1SxlpOAJkA2PH5haFOaRTaUt4wEmYWH9NH9PsGaxnGEGI+
	 PLF7n5onLBPvpb3X8HjPmEAmlgWG53BokWU0IwWTqcOoB/BO9STBF8ZAeQi0SHng4V
	 KjKtwfg7LBC4bkFAQRxpq/n7zwDGMbGlsgGudloXtgMW1OT1imN1UGCkTeuKQ71WH0
	 PvLwhQMpbx5qKLcoJnhQydWbsL8dMdna74+YU5Rn1vhw7tc34u9UIU1c7MbS35e7ju
	 u8lT7gLvc7DnexPPYphfDYHg=
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9D8151E9177;
	Thu,  4 Jun 2026 20:32:21 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v3 1/2] kunit: tool: Parse and print the reason tests are skipped
Date: Thu,  4 Jun 2026 20:32:04 +0800
Message-ID: <20260604123207.2615485-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a KUnit test (or other KTAP test) is skipped, a "skip reason" can be
provided. kunit.py has never done anything with this, ignoring anything
included in the KTAP output after the 'SKIP' directive.

Since we have it, and it's used, print it in a nice friendly yellow in
parentheses after a skipped test's name.

(And, by parsing it, it can be included in the JUnit results as well.)

Signed-off-by: David Gow <david@davidgow.net>
---

There are a few bits of KTAP that kunit.py has never actually parsed, and
this is one of them. It's also nice to have a good way of quickly seeing
why a test has been skipped, given most tests do provide good reason
strings.

Happy to hear comments about the style: yellow in parentheses looks pretty
good here, but could be a bit confusing if KUnit do

This is the first version of this patch, as it's a new dependency of v3 of
patch 2, the JUnit support, which also includes the skip reason.

--
 tools/testing/kunit/kunit_parser.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 0e1d2f4985eb..22b8464c6383 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -44,11 +44,12 @@ class Test:
 		self.subtests = []  # type: List[Test]
 		self.log = []  # type: List[str]
 		self.counts = TestCounts()
+		self.skip_reason = ''
 
 	def __str__(self) -> str:
 		"""Returns string representation of a Test class object."""
 		return (f'Test({self.status}, {self.name}, {self.expected_count}, '
-			f'{self.subtests}, {self.log}, {self.counts})')
+			f'{self.subtests}, {self.log}, {self.counts}, {self.skip_reason})')
 
 	def __repr__(self) -> str:
 		"""Returns string representation of a Test class object."""
@@ -352,9 +353,9 @@ def parse_test_plan(lines: LineStream, test: Test) -> bool:
 	lines.pop()
 	return True
 
-TEST_RESULT = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(- )?([^#]*)( # .*)?$')
+TEST_RESULT = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(:?- )?([^#]*)( # .*)?$')
 
-TEST_RESULT_SKIP = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(- )?(.*) # SKIP ?(.*)$')
+TEST_RESULT_SKIP = re.compile(r'^\s*(ok|not ok) ([0-9]+) ?(:?- )?(.*) # SKIP ?(.*)$')
 
 def peek_test_name_match(lines: LineStream, test: Test) -> bool:
 	"""
@@ -418,7 +419,7 @@ def parse_test_result(lines: LineStream, test: Test,
 
 	# Set name of test object
 	if skip_match:
-		test.name = skip_match.group(4) or skip_match.group(5)
+		test.name = skip_match.group(4)
 	else:
 		test.name = match.group(4)
 
@@ -431,6 +432,7 @@ def parse_test_result(lines: LineStream, test: Test,
 	status = match.group(1)
 	if skip_match:
 		test.status = TestStatus.SKIPPED
+		test.skip_reason = skip_match.group(5) or ''
 	elif status == 'ok':
 		test.status = TestStatus.SUCCESS
 	else:
@@ -539,7 +541,7 @@ def format_test_result(test: Test, printer: Printer) -> str:
 	if test.status == TestStatus.SUCCESS:
 		return printer.green('[PASSED] ') + test.name
 	if test.status == TestStatus.SKIPPED:
-		return printer.yellow('[SKIPPED] ') + test.name
+		return printer.yellow('[SKIPPED] ') + test.name + ' (' +  printer.yellow(test.skip_reason) + ')'
 	if test.status == TestStatus.NO_TESTS:
 		return printer.yellow('[NO TESTS RUN] ') + test.name
 	if test.status == TestStatus.TEST_CRASHED:
-- 
2.54.0

