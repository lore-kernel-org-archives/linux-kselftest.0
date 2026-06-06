Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A127732;
	Sat,  6 Jun 2026 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711416; cv=none; b=FmSRbxJnPzFnhitdkoqE/i5JvG/f/UZtFJvQQYhUONvAZ4L+5rEJxbdZMQYcRf3Xv0Vx8E0xfHvtIWyRunR/dE1o9GGze1lXiH0udRKhJT5KWR+kkmqGVPhtiyk4LaDKyIU8w1xvVIa12Yc9YyTo9kL4srNE444myhnqJ2MHZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711416; c=relaxed/simple;
	bh=dD123OHVdzbCXf35ks7oq1KmBsgfgCLsUgLmeyEdK5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p26jCBoOWDqZ3YCS14LC3Fs06AuS0m8JMfPpLOvAlJMY2N8r+DO73mOz4EY/abOaf83r9XnYJsRWs5pATJscWMLNTHIkaE7VBwojwcbXlDgbOeG3MLsA63C3CSB02JPvNsqd2AOTHGCFGMJ6u6l+WdvVMpgewJpHhz18PVQ4cMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=np+/fT/y; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=dpUyInKb; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="np+/fT/y";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="dpUyInKb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780711412;
	bh=dD123OHVdzbCXf35ks7oq1KmBsgfgCLsUgLmeyEdK5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=np+/fT/y2E5HXCLF8kT8CsyalGzhk+JUWXOWfIBTa25XYF5ivmYhkEl4aLu3cifeS
	 MSYAGa85NJQdP9cZxq8WiG1/zF+s0B3hHrlqlZLCLfOn30aIoZ3r9ys5UseoFkC0Oc
	 XnnXBHA4tZBw/527I3Ye1Mnbn2G/Bt7V8THlXlfaV1/O+pfYNOzfP2ZOmFl9y+++kJ
	 dQEqo7qi6+wMQ21wSjQD7p9kHKKvcmrj6YF7nlMeSTEQ5SFufdhN/QoqDU8yrbTkYF
	 2fBrVFPm2cWcx0fJpX8naQklhoZlgzCiPfMGgaYBnvnodyECXLsfFSZ5Qf4FoD5Nwi
	 jJDtHKHf6FyfXb55Uo2pqtaeIrzxa9gQ9ppgOFLvX4u6kspJzWk24xIdsZm/CbXKaI
	 Kb5LwYaw3CuK6GPPSGksFgN6p1EHoDMnLLzwA9drerwGJdmMBSvupU6Zvs0sg0Wi5A
	 2BQGPXVtaepKQwEnfv3v6RgD1OSSCczKD0Cb3elU8NoGqUCEDynz3ZDGxo4XjeIsjb
	 RWhHdAFu+TJ27N37Hw6y/GVEZs3OuCzNJappOaeNoZafEYeezvYK9Rn/dvrPi+wtLs
	 +O+/jJXIVinYInwsgKyW+DEk0ATsdDV9wXMjYozTkq0BTYNeQHpLgWexmbZVBmdx9l
	 vn/sDpFZXj2xB1qNzUzCu25c=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B402F1EA0D3; Sat,  6 Jun 2026 10:03:32 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1780711411;
	bh=dD123OHVdzbCXf35ks7oq1KmBsgfgCLsUgLmeyEdK5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=dpUyInKbCANi+XYgxUHz+GO2TF1zXiRU1+wymIGiWm9lMmPnVOjQWPS68i1mCekQu
	 wDMbn4I2BPKtLOaDOaaqHoTs+H0uF8tgV0ILV1T95hJrPNDoH3oeP/t3wHxcn0ofPb
	 jAnc513GxZ4xfpIdrAAFayY5RzprRliGyaAYIsOq+GbXk9POEnUXlZRY7v/cczEB3P
	 LROqrS7wsaE5ZV2yhvB7tbK6A8ZN/xB6rOFzAGtc2YshgpRVZqGZifNuUedVkEgjtr
	 KP5gvjrm50eo8pni0+KMZMgWkxL5klzNaQu6pgCV4MEWcsUUpjsLO+j7dyuLQnlCFu
	 XRDHfw6/vxoojvxYGQAkhfos/x7T8dM6qeXGHeXXNreoR4Rage4LIftQW3CnROhNI0
	 h79nRh3KgZ7ESQiIV4LmRn9NxH+S9quplcD3S/uvAR4HpbK65ArK0cz1bvruXOy0B/
	 TtUCURwwm6IXxrR9+ptx02JvHPWeF2BkzRKAFAyJihxFeySG/72tHg2qfBeDbp3Vlj
	 vOce/PRHVqE5wSsI09yywe2CBqtg3kUT+GxwPw39l9wFyVA9xkZjFP5+/+/zExIlB6
	 RakcV5PgdB2LxO3pPUKy13/DCiB/4TplP5moy+PR+fHq/lwj8fTkpfoPEclv8SH9uA
	 xpt898uPKLO2AxBxKD0L+NXg=
Received: from localhost (pa49-196-181-228.pa.vic.optusnet.com.au [49.196.181.228])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 665DB1EA0CF;
	Sat,  6 Jun 2026 10:03:30 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] kunit:tool: Don't write to stdout when it should be disabled
Date: Sat,  6 Jun 2026 10:03:15 +0800
Message-ID: <20260606020317.264178-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kunit_parser module accepts a 'printer' object which is used as a
destination for all output. This is typically set to stdout, so that the
parsed results are visible, but can be set to a special 'null_printer' to
implement options where not all results are always printed.

However, there are a few places where use of stdout is hardcoded, notably
in handling crashed tests and in outputting the colour escape sequences.

Properly use the specified printer for all output. This is okay for the
colour handling (as this is already gated behind isatty() anyway), and also
for the crash handling, as cases where printer != stdout are separately
printed afterwards.

Fixes: 062a9dd9bad7 ("kunit: tool: Only print the summary")
Signed-off-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/kunit_parser.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 1c61a0ed740d..266c9dd95351 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -17,7 +17,7 @@ import textwrap
 from enum import Enum, auto
 from typing import Iterable, Iterator, List, Optional, Tuple
 
-from kunit_printer import Printer, stdout
+from kunit_printer import Printer
 
 class Test:
 	"""
@@ -57,7 +57,7 @@ class Test:
 	def add_error(self, printer: Printer, error_message: str) -> None:
 		"""Records an error that occurred while parsing this test."""
 		self.counts.errors += 1
-		printer.print_with_timestamp(stdout.red('[ERROR]') + f' Test: {self.name}: {error_message}')
+		printer.print_with_timestamp(printer.red('[ERROR]') + f' Test: {self.name}: {error_message}')
 
 	def ok_status(self) -> bool:
 		"""Returns true if the status was ok, i.e. passed or skipped."""
@@ -544,7 +544,7 @@ def format_test_result(test: Test, printer: Printer) -> str:
 		return printer.yellow('[NO TESTS RUN] ') + test.name
 	if test.status == TestStatus.TEST_CRASHED:
 		print_log(test.log, printer)
-		return stdout.red('[CRASHED] ') + test.name
+		return printer.red('[CRASHED] ') + test.name
 	print_log(test.log, printer)
 	return printer.red('[FAILED] ') + test.name
 
@@ -651,11 +651,11 @@ def print_summary_line(test: Test, printer: Printer) -> None:
 	printer - Printer object to output results
 	"""
 	if test.status == TestStatus.SUCCESS:
-		color = stdout.green
+		color = printer.green
 	elif test.status in (TestStatus.SKIPPED, TestStatus.NO_TESTS):
-		color = stdout.yellow
+		color = printer.yellow
 	else:
-		color = stdout.red
+		color = printer.red
 	printer.print_with_timestamp(color(f'Testing complete. {test.counts}'))
 
 	# Summarize failures that might have gone off-screen since we had a lot
-- 
2.54.0

