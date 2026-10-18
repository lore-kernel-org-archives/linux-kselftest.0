Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34963D8123
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330243; cv=none; b=ACY/yMPyBQeNP28LiP8kO2+ctRLA4XUUL/3juB/DseU5p/CHYrnliYm2iHtS3iERi/aJmerjoKoKPlRCkBR81i0yjCVnXFjIirgOqztPsImoyZRVG1vV533jNHas6LTPmv9JHpMCdRVu1xjPivlCoxSXsO7aYUC9CcLCgmuspTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330243; c=relaxed/simple;
	bh=qrzi95Oq2S2eYQxeNpqeAFIRlsq0hms8Ekh9Kejv1C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMPxpG9rVXORu2SnnoYY5AhLVp2krU26RakmRH+CibhqNQrGDqtvb685BVfPm465oM6hU+x4ees1g/SfLFRHMHPOv/Tu8Vb6fisnRiyJzPuJL/PHi3xSSfb7iR1FNfFF5ARa3cNBays+43IbvgqPVsVJFKGYRNFi4LKizEQIhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajC8l9iz; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajC8l9iz"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-16079d54c17so3180870c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792330241; x=1792935041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7Y5TCLZ/XXwZ/QABX7rhbQbCsuKhsYxhP2OR9BV3m0=;
        b=ajC8l9izqPC08mhm3zZ/O+pk4tdNjFORtKRurUIZwFRxwHeZUgiyr9hrZ4xZ7bMFr/
         w7Kn99Hl5iJ7AHWbg0ZFf+oyD536ugEA2m7wVdOrJR2MRfOoNPRHEag4RdQtUVk+Cv36
         eKiQ4R+zILjUZLz+HzCnlU36ZI0C1oRPqekOFlnw19khabNplQMLXx0OMa7h4d5Bt9HZ
         ipTifqxk1Y23Fv0UjBWTlsE5tFy+eJPPatMA25gbhnq1/raLXy6OOEiAIFPqwRS38PFx
         /0gQuNCc5/AamOZVoZHEv7U3mYn77AO1/zYyAxDBjmuhqdJ1dFY5Jkc1Y+xu6M73tXnE
         JPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792330241; x=1792935041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7Y5TCLZ/XXwZ/QABX7rhbQbCsuKhsYxhP2OR9BV3m0=;
        b=FZ3QcFoXbFdEAchEAYfdPL4O24YC89X0K2xNfcm/OqAr0DjAAlT2prN6NE3x3e+dJ0
         o+MCQUE/huZPtOBQK1aBL5ow4q4y74fk2tp/nz92L63cZ0GtHn2vXPFJsiPz6ykQMPl2
         iOJ0kXPoBRdMrmiGMgeUi6tbphSH/iI26BqfC7eFNauPeTuBIYwRduPTlc4i3mfVz3HI
         qchtZcapaRA8R14tcOiEl1NqERtW6bPMhcPrwh4gL/SUQ6aY/fpELASi4HhflOSajCYf
         kT/46S0LaFHjLbExy8K3ggWams/ZE1OGpy07dEFS9u7/+6UchYBseA7yptJbORXJh18V
         G5sA==
X-Forwarded-Encrypted: i=1; AKwUvBxYZb0nwj2R5zk39w3BBthZjKq0pbMxjhOl7lcSrK7cWP28l+PiBcpffJfpROmVBYCfD6F/yU+YE5JpxDjSSL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYInZeAcBjBvhgkGDCxcd5ohI2yPSm9Tp8LxcWfkUAkp4ETXAxCp
	SJPuj0VvoyGpEYNl/U5ljebsDluPXjsQ1TDTn+dirH/etd2LGGMIrS3F
X-Gm-Gg: AYBFou01uETtBTPv+5DT7/D8x59eoAvkmbhxSxWVCxdjD5lbsZRsv0IUZwFERKX4+OF
	xvJGMIdq78LSIt5pE4x7zM2WnHGa6VbFxRlta4rB0YGFcIkKUwL6pU8d5M+dhGo9BsCF0BYqkzd
	KRO4Ws71mVaUPboA/iZnZHtJAZLDw9WcsDp1KYZYMjhgsi/pNoJi1/MdHDK0aja2w+zsYBE/FLO
	dVK9dw7yggvBK2JBcgN2M5ma0OGe6gJdZpDG1bxvf5a/DJGgNYmHfiBVRMcCbNPhbAaa8tm3leC
	stNNnpZnLIwvMQeXDlPWY0eT3NxfACgY3+JcAVD52sbRjE90YC7AWkmpHMXw2pIhwG6Q2xV8mgL
	rkuQLYp8+drF+40KSL418oaXvW+xDjxkLHte6bBSkCu1HmVsGqRkM8q4hAjFDuLlLbj6H+1UbDk
	tGC+cTn96DbpNyn8cUB+F/oEfotYnV5/UQ55Z9HDpRTngsywiR0QttiBylsoDJEylmNDa3iP6M6
	AotCEFNXEA227G2eCb5CBaE2hYFIx855YCoL2wTyw==
X-Received: by 2002:a05:701a:ca05:b0:17e:6de6:6a1a with SMTP id a92af1059eb24-18511ad9debmr8020299c88.8.1792330240810;
        Sun, 18 Oct 2026 06:30:40 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314ef8ed8sm19879934c88.3.2026.10.18.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:30:40 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 1/2] perf/kselftest: convert prefix.pl to Python
Date: Sun, 18 Oct 2026 10:30:31 -0300
Message-ID: <20261018133032.24467-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018133032.24467-1-breno3011alves@gmail.com>
References: <20261018125641.23064-1-breno3011alves@gmail.com>
 <20261018133032.24467-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of tools/testing/selftests/kselftest/
prefix.pl in Python 3 (stdlib only). Same unbuffered stdin-to-stdout
processing, same "# " prefix behavior.

Update runner.sh to invoke prefix.py instead of prefix.pl, update
the install target to install prefix.py, and remove the old
prefix.pl.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 tools/testing/selftests/Makefile            |  2 +-
 tools/testing/selftests/kselftest/prefix.pl | 24 ---------------------
 tools/testing/selftests/kselftest/prefix.py | 24 +++++++++++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  7 ++----
 4 files changed, 27 insertions(+), 30 deletions(-)
 delete mode 100755 tools/testing/selftests/kselftest/prefix.pl
 create mode 100755 tools/testing/selftests/kselftest/prefix.py

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index bc4fdb6f5..85ed9af96 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -285,7 +285,7 @@ ifdef INSTALL_PATH
 	mkdir -p $(INSTALL_PATH)/kselftest
 	install -m 744 kselftest/module.sh $(INSTALL_PATH)/kselftest/
 	install -m 744 kselftest/runner.sh $(INSTALL_PATH)/kselftest/
-	install -m 744 kselftest/prefix.pl $(INSTALL_PATH)/kselftest/
+	install -m 744 kselftest/prefix.py $(INSTALL_PATH)/kselftest/
 	install -m 744 kselftest/ktap_helpers.sh $(INSTALL_PATH)/kselftest/
 	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
 	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
diff --git a/tools/testing/selftests/kselftest/prefix.pl b/tools/testing/selftests/kselftest/prefix.pl
deleted file mode 100755
index 12a7f4ca2..000000000
--- a/tools/testing/selftests/kselftest/prefix.pl
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0
-# Prefix all lines with "# ", unbuffered. Command being piped in may need
-# to have unbuffering forced with "stdbuf -i0 -o0 -e0 $cmd".
-use strict;
-use IO::Handle;
-
-binmode STDIN;
-binmode STDOUT;
-
-STDOUT->autoflush(1);
-
-my $needed = 1;
-while (1) {
-	my $char;
-	my $bytes = sysread(STDIN, $char, 1);
-	exit 0 if ($bytes == 0);
-	if ($needed) {
-		print "# ";
-		$needed = 0;
-	}
-	print $char;
-	$needed = 1 if ($char eq "\n");
-}
diff --git a/tools/testing/selftests/kselftest/prefix.py b/tools/testing/selftests/kselftest/prefix.py
new file mode 100755
index 000000000..67c4fd0b6
--- /dev/null
+++ b/tools/testing/selftests/kselftest/prefix.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Prefix all lines with "# ", unbuffered.
+
+import sys
+
+
+def main():
+    needed = True
+    while True:
+        char = sys.stdin.buffer.read(1)
+        if not char:
+            return 0
+        if needed:
+            sys.stdout.buffer.write(b"# ")
+            needed = False
+        sys.stdout.buffer.write(char)
+        sys.stdout.buffer.flush()
+        if char == b"\n":
+            needed = True
+
+
+if __name__ == "__main__":
+    sys.exit(main())
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc5..b61ea6c2d 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -29,15 +29,12 @@ TR_CMD=$(command -v tr)
 # with sed instead of unbuffered output.
 tap_prefix()
 {
-	if [ ! -x /usr/bin/perl ]; then
+	if [ ! -x /usr/bin/python3 ]; then
 		sed -e 's/^/# /'
 	else
-		"$BASE_DIR"/kselftest/prefix.pl
+		"$BASE_DIR"/kselftest/prefix.py
 	fi
 }
-
-tap_timeout()
-{
 	# Make sure tests will time out if utility is available.
 	if [ -x /usr/bin/timeout ] ; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
-- 
2.43.0

