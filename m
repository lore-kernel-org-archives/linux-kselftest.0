Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637794;
	b=3hruwfaU7Y6xUpWUSstoUlzWrrdBLwhOOIWRadxT3iIyhGr8XwtRQfCrsRCsqoxCUWGv
	 ZIDCIo5Xb9k/ChuzIH4zoJ0ytnYFQBw2cJr0HmyqTFZm8f4/CifZAc+o9ipG2IrRtAKke
	 zUFJoors4CriUXwMEi3vz6dus8d4cd7NjIAeTkQbUXJASY09bt7/jFubt3Bm4/YO/MgXv
	 FNNltRGnYZ+QJKQdJGzcEh5c3pSdhsXkgHX2c1V3KkWg2m3e7ObJfVBh/z4p+tG0KppaP
	 +56ddIaNFfjuDysTph01pUVAIo0CRZTmhfmeI5Sq+4e1X4cciwMI2Pxr1cl4MdEGCrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637794;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bVae4teEAY5lN0cAm+GuxPC0EcqQhfJZCICDDMYyghA=;
	b=amsS+aWE9GTlALfl5IUTPSWbKzZfvic5NyWbbXDx/PyW/PoiUk3nOxLzqHbki4KRpe/w
	 ZWd40/oJMBXVjTr6Jgp2VNFAiXAVyn1mAvLWL8cOWHOX9RtaYOmNj6nWXJUu9QgxG0tdc
	 50M5/Yf3A5ICeiYrDNlQx6wJDWLpNcwOdTjsAC77u2rTste+ijdqc6LrDbXHUGJW9TyUH
	 dUHmefVrYDeVuTzCior0tFcdQnamhaBNLiYEE3g3mMBVgUctUM7lPetmMiyHcRk29GY9D
	 uX8Gd3bWZ5uhZwyqZk7YEfrLLM5XOFEE3snxPqqaEUcvxbFIuoe0Mmeeb43kfcDSdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6MyOZh1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBB60A6C2D;
	Mon,  2 Nov 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6MyOZh1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59C91F00A17;
	Mon,  2 Nov 2026 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637794;
	bh=bVae4teEAY5lN0cAm+GuxPC0EcqQhfJZCICDDMYyghA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M6MyOZh1S3t/uew7aipAfZgjPVGQKyQ8IyEVYW4v6XlHw46pPCHsOKib9oRApiOrz
	 RxUSFrgWNaJ91waThvpkP8JL9q+3Soec7zEZLsO2sTY6TeiFAxUhv9x0IK2sdWayiO
	 RbyhukXcvLUfQUIjuKtpFlcSCGGZRTDNo4Nx5YHTJmbBaFGCJAaxzZGe/4uzdp27J+
	 zZkxVSt9H8GrCWze/mYHfmKWq2H5rERN6LnI2gJhjfPKd8aDXhGBcUl1jz1RSDAmRJ
	 lrZ+BOZpOwTeyf0SXBs5K2alzGno4Ug8DDNJO2kknNcCTitbmgZC4EQnAekGfG/eq6
	 a4mZWEF24QRUQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Nov 2026 16:37:47 +0000
Subject: [PATCH v2 6/7] kunit: tool: Serialise output written from multiple
 threads
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
Message-Id: <20261102-kunit-parallel-v2-6-8774b558d4b0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5630; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cXd+WW/FwqTOdRuY2BWdty+JQCn54Oy/6vpztjlwqdM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O11N0l0mLT1oW70lH5L+cOSW42fdck8/7B21VRbm
 eu3F5UUd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiR1kY/grXOW97fzCOTSXo
 C+MTVfunJw7F1Ct7yel4TCpjfmukuoeR4cT6l4v9v37zPlAYVPbrmuLBqpitnXaydb4CG99rdrf
 kMgMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Python's text streams are not thread safe. If two threads write to
sys.stdout at the same time the stream's internal buffer can be
corrupted, resulting in lost output and runs of NUL bytes or heap
garbage being written in its place. This isn't an issue currently, but
will be when we implement support for parallel test execution.

Add a lock to kunit_printer which Printer.print() takes around each
write, and route the other prints that can run concurrently with the
test results through the printer: the kernel start banners and timeout
message in kunit_kernel, and the raw, JSON and JUnit output to stdout.
Prints that only happen before any kernel is started, such as during
configuration and build, are left alone.

No change in output when a single kernel is run at a time.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/kunit.py         | 4 ++--
 tools/testing/kunit/kunit_junit.py   | 3 ++-
 tools/testing/kunit/kunit_kernel.py  | 7 ++++---
 tools/testing/kunit/kunit_printer.py | 9 ++++++++-
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 971e70b0fb1a..0132687cdd43 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -272,7 +272,7 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
 		elif request.raw_output == 'kunit':
 			output = kunit_parser.extract_tap_lines(output)
 		for line in output:
-			print(line.rstrip())
+			stdout.print(line.rstrip())
 		parse_time = time.time() - parse_start
 		return KunitResult(KunitStatus.SUCCESS, parse_time), fake_test
 
@@ -302,7 +302,7 @@ def _write_test_results(request: KunitParseRequest, metadata: kunit_json.Metadat
 					test=test,
 					metadata=metadata)
 		if request.json == 'stdout':
-			print(json_str)
+			stdout.print(json_str)
 		else:
 			with open(request.json, 'w') as f:
 				f.write(json_str)
diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 3622070358e7..a15c6061003f 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -6,6 +6,7 @@
 
 from xml.sax.saxutils import quoteattr, XMLGenerator
 import xml.etree.ElementTree as ET
+import kunit_printer
 from kunit_parser import Test, TestStatus
 from typing import Optional
 
@@ -51,7 +52,7 @@ def get_junit_result(test: Test) -> str:
 def print_junit_result(test: Test) -> None:
 	root_element = get_test_suite(test, None)
 	ET.indent(root_element)
-	ET.dump(root_element)
+	kunit_printer.stdout.print(ET.tostring(root_element, encoding='unicode'))
 
 # Write an entire XML file for the test structure starting at test
 def write_junit_result(test: Test, filename: str) -> None:
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 1d3226f5a136..508bd62eaa40 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -21,6 +21,7 @@ from typing import Iterator, List, Optional, Tuple, Any
 from types import FrameType
 
 import kunit_config
+import kunit_printer
 import qemu_config
 
 KCONFIG_PATH = '.config'
@@ -132,7 +133,7 @@ class LinuxSourceTreeOperationsQemu(LinuxSourceTreeOperations):
 				'-accel', 'tcg',
 				'-serial', self._serial] + self._extra_qemu_params
 		# Note: shlex.join() does what we want, but requires python 3.8+.
-		print('Running tests with:\n$', ' '.join(shlex.quote(arg) for arg in qemu_command))
+		kunit_printer.stdout.print('Running tests with:\n$ ' + ' '.join(shlex.quote(arg) for arg in qemu_command))
 		return subprocess.Popen(qemu_command,
 					stdin=subprocess.PIPE,
 					stdout=subprocess.PIPE,
@@ -154,7 +155,7 @@ class LinuxSourceTreeOperationsUml(LinuxSourceTreeOperations):
 		"""Runs the Linux UML binary. Must be named 'linux'."""
 		linux_bin = os.path.join(build_dir, 'linux')
 		params.extend(['mem=1G', 'console=tty', 'kunit_shutdown=halt'])
-		print('Running tests with:\n$', linux_bin, ' '.join(shlex.quote(arg) for arg in params))
+		kunit_printer.stdout.print('Running tests with:\n$ ' + linux_bin + ' ' + ' '.join(shlex.quote(arg) for arg in params))
 		return subprocess.Popen([linux_bin] + params,
 					   stdin=subprocess.PIPE,
 					   stdout=subprocess.PIPE,
@@ -402,7 +403,7 @@ class LinuxSourceTree:
 			try:
 				process.wait(timeout=timeout)
 			except Exception as e:
-				print(e)
+				kunit_printer.stdout.print(str(e))
 				process.terminate()
 				process.wait()
 		waiter = threading.Thread(target=_wait_proc)
diff --git a/tools/testing/kunit/kunit_printer.py b/tools/testing/kunit/kunit_printer.py
index ca119f61fe79..440aa7667ece 100644
--- a/tools/testing/kunit/kunit_printer.py
+++ b/tools/testing/kunit/kunit_printer.py
@@ -8,10 +8,16 @@
 
 import datetime
 import sys
+import threading
 import typing
 
 _RESET = '\033[0;0m'
 
+# Python's text streams aren't thread safe: concurrent writes to
+# sys.stdout from several threads can lose output or write garbage. All
+# output from the tool should go through this lock.
+print_lock = threading.Lock()
+
 class Printer:
 	"""Wraps a file object, providing utilities for coloring output, etc."""
 
@@ -25,7 +31,8 @@ class Printer:
 
 	def print(self, message: str) -> None:
 		if self._print:
-			print(message, file=self._output)
+			with print_lock:
+				print(message, file=self._output)
 
 	def print_with_timestamp(self, message: str) -> None:
 		ts = datetime.datetime.now().strftime('%H:%M:%S')

-- 
2.47.3

