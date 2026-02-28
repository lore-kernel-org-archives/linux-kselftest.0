Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30C36BCDE;
	Sat, 28 Feb 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273268; cv=none; b=EHBUXE/lTpAvE3SbZduDenW7DlN+L+f3pDGoLqQJi7FUdxOUI0Pgmamf2oWGDQn5CSALeHV+2qPCAZXOMBfvItBx3WHPnrmDN5g7LElZ0V8ghMsy6aburL83SxvVEk+VC33Y+5tDYYxpEhd4HQMdhXwbWmDUuMNcQGWQ+DoG6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273268; c=relaxed/simple;
	bh=mVBAYvlcFJN+S+i3QvPmlel8NHaxvGvieZ23tVS+zVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ph+g+5hJmzH2fuC3zxX/GF0p4Xkjl5v+Zsa/wWgoMLyQlKNb7BUxDrK4lJ1QFCnid2NkSc4mluaImRutUu3k0QNZ0xyJSp7xtdCh9y0G2nKgcR5xMZTRPvhTo+WTQCIwDdePLqP6MM/8AxzftjzCWXfcVrJ/5f1PEzpp6IPKLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=gqWT56tB; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=dWtBVyfT; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="gqWT56tB";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="dWtBVyfT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772273259;
	bh=mVBAYvlcFJN+S+i3QvPmlel8NHaxvGvieZ23tVS+zVA=;
	h=From:To:Cc:Subject:Date:From;
	b=gqWT56tB5BN22dFdit9efRKHwgfQ3IDQXA4b9EVUl2Tk1kzc/JNGB+5YyUw1m4CQ6
	 GwGX8s50CDLVHgoyH2hNVLmBbcyaMZeHEDhct2lPyf45snOv3N96IkgGG+h7D2e2bK
	 jn8PHPj2wOt/kbr++nV+CxDTs/1XPV8WzZtP3kyQecDjSamaZkj1hWGFdnJUh6mhY2
	 VkwNELHhDjl0URnqKakKl5gKXp8gFvJj3iK4fhLLTremFHUQrf0iLeV9Q6o5sW6sGa
	 7k1yYygR/ap68PrfaanDPWEIl1HIRo9CNkjzMEbMJtb0jIzPzIH266fafechPC12iW
	 g1TV5joA5rAFcQek94b5OetBfrUU1wh9XXmkh7pxqIAeAeQITirIstSPdMWd5wbm4F
	 Pd37z9fUGrjF1oDW04kfqelXedyWwv2AyYXNP72tnZrcbNXDjLVH2ky4xBIYqcVLiF
	 TGwwCnOIMY9W1ayQvGtUPhv4slxGrt7LADf1E0akrc0q/1AgmIoU6/EO0XiUgO7Vom
	 /b7/VweN7AkAgJMAKw1pUSCMXvVuB6I31oA3u3HU7sAjkJuJKAhq39pBum4LRS+z4i
	 KMuWyA0ifj475tgGuO3kVsr/EiY8g3r2DBlwLiqxbUHAT6WLSworRbDB2ICuQPx3Ry
	 iJssKQqGbRmSpnP59U8TRgsw=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 3A03C1E7A94; Sat, 28 Feb 2026 18:07:39 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772273257;
	bh=mVBAYvlcFJN+S+i3QvPmlel8NHaxvGvieZ23tVS+zVA=;
	h=From:To:Cc:Subject:Date:From;
	b=dWtBVyfTZnkH2nhuCtrQGnAbDjv7YMQAxKuq7lgmNipVCqchnezPS5GoGRI2VYYB2
	 tvWcVSLD4Nj8DMmpcbfh2+O0t+tQ3KvtS2TybmSDrl9skggzJzcXaT2Ca0sMIDQ0HA
	 JJxErOKVaC6AbayxFdMvfYSFtax7HiaQOg5yNbKn53q2yc6ZGNasFckO5Y9EKKkvf8
	 KCc8KoIo7rsyYksizvbn60v+cin0GuHOKbDZxet0st2pGI/BFDlGh8FbkzJzwQ0rQQ
	 jK7unGyXBbgDP7HArzRIxRLh1MlNRqvm3TzDhN8ZHEU+n89mHScLOyOuGdTw/fjQZ6
	 4vfOBC/cbZxVmXsPWQoebp621GSYSG8S8lx4pKnSl1xNAHEF6M3c7Da4y1FJcDKwNu
	 8tC9YMdBsbztAE52mzAHYPmix3OhifB/MzumurYzj84iGhB0/dLTouK2EgC1etjoB7
	 ubTP9Qx6QPGCIiyIu5ekZguVf5RufHPT0ngAfKGpeD/1XhO6RzxJfKel23Wc5TlpEV
	 wUkB+Wxc+IG4LkKIIvgwlP/V68xhCTP2yd4k54JzLC5uzWaiVfDwnnvk8OnaWpH61c
	 fLacBGUwxRnHRok0GJkq6VoWWB9wgExvzxcSaETRadrjavaL2wRJ3PtjEX9TMyYGFp
	 6Iofpsiv+hRzGUcWfwflLRkg=
Received: from sparky.lan (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 3E2201E7A8D;
	Sat, 28 Feb 2026 18:07:37 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kunit: tool: Terminate kernel under test on SIGINT
Date: Sat, 28 Feb 2026 18:07:22 +0800
Message-ID: <20260228100727.208896-1-david@davidgow.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kunit.py will attempt to catch SIGINT / ^C in order to ensure the TTY isn't
messed up, but never actually attempts to terminate the running kernel (be
it UML or QEMU). This can lead to a bit of frustration if the kernel has
crashed or hung.

Terminate the kernel process in the signal handler, if it's running. This
requires plumbing through the process handle in a few more places (and
having some checks to see if the kernel is still running in places where it
may have already been killed).

Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Closes: https://lore.kernel.org/all/aaFmiAmg9S18EANA@smile.fi.intel.com/
Signed-off-by: David Gow <david@davidgow.net>
---

This was long overdue, and is much nicer to work with now.

Note that it's likely to conflict with some of the other changes to the
stty sane stuff, such as:
https://lore.kernel.org/all/20260227123136.91086-1-shuvampandey1@gmail.com/

---
 tools/testing/kunit/kunit_kernel.py | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 6f49b184a6fb..c3ebb0ac1116 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -16,7 +16,7 @@ import shutil
 import signal
 import sys
 import threading
-from typing import Iterator, List, Optional, Tuple
+from typing import Iterator, List, Optional, Tuple, Any
 from types import FrameType
 
 import kunit_config
@@ -265,6 +265,7 @@ class LinuxSourceTree:
 		if kconfig_add:
 			kconfig = kunit_config.parse_from_string('\n'.join(kconfig_add))
 			self._kconfig.merge_in_entries(kconfig)
+		self._process : Optional[subprocess.Popen[Any]] = None
 
 	def arch(self) -> str:
 		return self._arch
@@ -362,36 +363,45 @@ class LinuxSourceTree:
 			args.append('kunit.filter_action=' + filter_action)
 		args.append('kunit.enable=1')
 
-		process = self._ops.start(args, build_dir)
-		assert process.stdout is not None  # tell mypy it's set
+		self._process = self._ops.start(args, build_dir)
+		assert self._process is not None # tell mypy it's set
+		assert self._process.stdout is not None  # tell mypy it's set
 
 		# Enforce the timeout in a background thread.
 		def _wait_proc() -> None:
 			try:
-				process.wait(timeout=timeout)
+				if self._process:
+					self._process.wait(timeout=timeout)
 			except Exception as e:
 				print(e)
-				process.terminate()
-				process.wait()
+				if self._process:
+					self._process.terminate()
+					self._process.wait()
 		waiter = threading.Thread(target=_wait_proc)
 		waiter.start()
 
 		output = open(get_outfile_path(build_dir), 'w')
 		try:
 			# Tee the output to the file and to our caller in real time.
-			for line in process.stdout:
+			for line in self._process.stdout:
 				output.write(line)
 				yield line
 		# This runs even if our caller doesn't consume every line.
 		finally:
 			# Flush any leftover output to the file
-			output.write(process.stdout.read())
+			if self._process:
+				if self._process.stdout:
+					output.write(self._process.stdout.read())
+					self._process.stdout.close()
+				self._process = None
 			output.close()
-			process.stdout.close()
 
 			waiter.join()
 			self._restore_terminal_if_tty()
 
 	def signal_handler(self, unused_sig: int, unused_frame: Optional[FrameType]) -> None:
 		logging.error('Build interruption occurred. Cleaning console.')
+		if self._process:
+				self._process.terminate()
+				self._process.wait()
 		self._restore_terminal_if_tty()
-- 
2.53.0

