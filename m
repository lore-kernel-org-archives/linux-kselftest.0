Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795492562;
	b=Vx5f6nkUXlZncOFmtk6+RY2tSQqM+PaF4fH9ISbslTi8KEjeLifDLzTrmrGVSPLdk0tc
	 Od0uaplm47UjYItJ3pzpgxcl2zu0v/djHBLFfYmnskV/jWPhaOZ37DVOGStaaF1D+4Pm5
	 p3B/ToZdvRSUpbPVwCkfJoX4ivbGMLTaT4fsx5zl8dGbqf/F4xugVtjr89MmgRRgqbWlH
	 2E3R0oF3wCcVU4v7AGd/Pa9UZSKuzkKlW1T+3/NmXDT/J/vjEHnyAUBy4rJ4QPyCp3UQC
	 0n84LEjrw0lsdNHM74T3q/oP4DxFM9OMuu7vtakL3Hm+WIMfW3h9BPJEz5uoKDZY7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795492562;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dsw35PX7hCcW1qKge/zhNdyX7SMaBaKsuKoMAnrPlU0=;
	b=xGeY8mzBm2XtqzN0L3jNjEyMJRcqYc1bVLPkEczVkhvG1NCu+Sa8sJM3nD6tbOQWlCUi
	 28HsYL3z5BEyHzH9M3tT/xsDSAUk4Ral7A7CxrWBhL2k1r/zPDsb8nyMvDUuUgEzRZh8X
	 qqYpjnTOvdyrSUVCs1DvDeX9jVzyjou4xOJXLePJEkwAeuqUfGlUtlACgtRY9WiZLKbMk
	 B/26NhmyvefWF0IAMRCcohBGbrx4zhRxkRywKolDZy0j6w7IFA38duOD7UP9wYIVGfM9k
	 cLfiiM25Njmv3WDQAerGEsRTVVDnB0zsdeTwlojy75SCszOoipJdX7M7Bey7peIg2pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64376606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64376606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id E918E200E10; Tue, 24 Nov 2026 11:55:58 +0800 (AWST)
X-Spam-Level: 
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 6F19A200E0B;
	Tue, 24 Nov 2026 11:55:57 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH] kunit: tool: Autodetect a default architecture
Date: Tue, 24 Nov 2026 11:55:46 +0800
Message-ID: <20261124035547.907987-1-david@davidgow.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kunit.py always defaults to using UML (--arch=um) for building / running
tests, but it is only available on x86 architectures. Instead, attempt to
select a better default: UML on x86, or the host architecture otherwise. A
cut-down version of the map from uname -m -> Linux kernel architecture from
scripts/subarch.include is used to detect this, but it only includes the
most common ones for now.

Ultimately, this should be replaced by something in the architecture
config, which we'll be replacing anyway, so something simple like this
should suffice for now.

Signed-off-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/kunit.py           | 27 +++++++++++++++++++++++++-
 tools/testing/kunit/kunit_tool_test.py |  3 +++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 91d234ac3b57..41ca3d32bdc5 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -9,6 +9,7 @@
 
 import argparse
 import os
+import platform
 import re
 import shlex
 import sys
@@ -340,6 +341,30 @@ def get_default_jobs() -> int:
 		return ncpu
 	raise RuntimeError("os.cpu_count() returned None")
 
+# Map from host architecture (uname -m) -> default KUnit architecture
+# Should be 'um' for architectures supporting UML, or the name of the
+# qemu_config otherwise (typically the kernel arch name).
+# See scripts/subarch.include for a reference.
+default_arch_map = {
+		'i386': 'um',
+		'i486': 'um',
+		'i586': 'um',
+		'i686': 'um',
+		'x86_64': 'um',
+		'aarch64': 'arm64',
+		'sun4u': 'sparc64',
+		's390x': 's390',
+		'loongarch64': 'loongarch',
+		'ppc64': 'powerpc64',
+}
+
+def get_default_arch() -> str:
+	host_uname_arch = platform.machine()
+	if host_uname_arch in default_arch_map:
+		return default_arch_map[host_uname_arch]
+
+	return host_uname_arch
+
 def get_default_build_dir() -> str:
 	if 'KBUILD_OUTPUT' in os.environ:
 		return os.path.join(os.environ['KBUILD_OUTPUT'], '.kunit')
@@ -384,7 +409,7 @@ def add_common_opts(parser: argparse.ArgumentParser) -> None:
 				  'string passed to the ARCH make param, '
 				  'e.g. i386, x86_64, arm, um, etc. Non-UML '
 				  'architectures run on QEMU.'),
-			    type=str, default='um', metavar='ARCH')
+				  type=str, default=get_default_arch(), metavar='ARCH')
 
 	parser.add_argument('--cross_compile',
 			    help=('Sets make\'s CROSS_COMPILE variable; it should '
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 85ae21754bdf..6b5f32ed25f6 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -742,6 +742,9 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.build_kernel.return_value = True
 		self.linux_source_mock.run_kernel.return_value = all_passed_log
 
+		self.default_arch_mock = mock.patch('kunit.get_default_arch').start()
+		self.default_arch_mock.return_value = 'um'
+
 	def test_config_passes_args_pass(self):
 		kunit.main(['config', '--build_dir=.kunit'])
 		self.assertEqual(self.linux_source_mock.build_reconfig.call_count, 1)
-- 
2.56.1

