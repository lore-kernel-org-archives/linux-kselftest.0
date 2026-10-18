Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31404AB1DE
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331012; cv=none; b=IZHYps4osVxRuM4Zol73sMNl0n/qs8peVFix6KOxeWaDCdYfS5m+OnCc/Vlhpvu/GkxPWD+GBUbaVZ8vOo6gSBCJzyCSB3lBaDwXnkA4t05941oqR/YVkIqzNLJlbMHlhbN74bU/vTGWfiqN8uMk/e+p2DoG4SRQVz/Faeav43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331012; c=relaxed/simple;
	bh=3c8FLbHksQibEqB3kL5wCeH5x61Waf9pm1mxuk+dweU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUMep1lBsXt+82JvEX+QPO3VowBzApAxvvSdTUb+n5uxn3V/pDzfHj1MLEwvIeibba0Rh3/Kvd7zf7bpcC92fqnu22TNKy4V3ehOqkV2A+WKoGfPTC5Kxv0MG5MBH3CJK0TruTymCby5Ph/sMhZ94owJozw5gjKEo2R1dLOgsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMC0W6lK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMC0W6lK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2304019eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 06:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331011; x=1792935811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZCDb29RXoNd3s2gr9vco9lTSJAXM4DbUDPNku3m12E=;
        b=OMC0W6lKBQvYsZKtS3Ss6ZAEwgzihd6Vg/TzKcfCw3FgdjXCHmwqCsTYBHxc+TwnDY
         SIl6cBf2VnivZCAjWLzNGfftxTWSDWd7hZEHP8tp4fm/CUr0qWN7wbNCBchP+IjweHWc
         mx/ibx64YQD/CRx0HwtYnI4KtjORhX8pd1PD5arvg7Wy0ifc11XyMEsDeWw92ByDQZIV
         otBnUI7i8lEN9S9tRe4o2/onRZwzZXgJipPciroPiDJZi5zWZ2oXkSisd+O/1EmH27yw
         vgp1gHGKXolGLsRjiQcS7hpJVhivRbubdmbUPAf0AxUYfk6O6/yvO7CpHzXlXLPCpjM5
         qyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331011; x=1792935811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZCDb29RXoNd3s2gr9vco9lTSJAXM4DbUDPNku3m12E=;
        b=Fd0I4E08BfPD4OVqtDEYg2IyGhvv8RWdjZy5Jzc/7pqkAlioM7DPFgrRG6wFPiiWc8
         /J+lIsvw3pajof1881Li9e2KUhENMw9bhseIAUnrH7HFFj27K/vhOPqZkyl/Ch9c0gX3
         O5nTLrqYaAa2WQNjEUnX6dSw7bN2VTPQaWxBtUbJW1uuIOBAyLExXYAdIvrgPkiAJih0
         aTehL88mQmOL7NdTMdG89zYgC/WKBjKFq4V22/l+KBFZnk+uRYbkU+VquBDOioQFMdnS
         iqsDPq03ff281V9AQgsxYhWC0zjOGPkU/g062jOn/Oejh4/iQF/t35RKlXU9yX5M5XkE
         bFiw==
X-Forwarded-Encrypted: i=1; AKwUvBwqfBpTdgpuB7nAgg1CbV7z3rnbqKAQ+ANT/pj4uGq40pe8DdxTpbHMEkNn98YTLB/fl+tN4/z82J2yTAzsYZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbQXA3sOfnRl/ME0uAJIFYDF9+sTTlLYFYW+3mSjvsW7S5cKpT
	9I6MI5Qx3D+yj9o1EEYjfYCllYY3sXaC5rRjPrheNE78Wq2fIzbuEfwl
X-Gm-Gg: AYBFou3yLmPG4EHO5MjqoOXb+xzMyGPT2WKo5kmHy/h/AcANHHMQlWrXIusElFQ/c5h
	/wW1nU19wX1YP1gHT4SrPStT5/jhOBgZUNoEDQ7YY6LlWVvCtBoX58EOYYd40GRwfavwJ2OzNte
	jNmryVg420yWJlPNFclp+YSd/I++5+66tWwcWGg55IGERbYL67yMItzNoruKqcgE/qU/nNeKSA4
	0fNOqtGANNpcXmiOT+Q2UVCbaMMkW57ObtiiAqrNWYtOfUIbPJc98++Awfe02ODipZRBcawwwq9
	I5ssuP7GZQL7/bDzTwRjkWEiZBxej5RIpE7ji9wTeoSU6sWLgFZHZNbTXpB14Y0E4qNLcBDdaxw
	C239qtbaMnw+8B+/mduB0S1DdNxW+OJe6HlBiRiODfLxHVqG5H4/f/UL4RPxEdDUT4uYXATiCYg
	6xHpX4WFzs3SC4mcMbln/I9GxobWFm4SKOm5ejD43I39zxkTchCqf2inSiE3LgIrQAmRvbpzieN
	i3Di/kLtAJty4crbMcJAYGNcz+jJetuWI/lO5t+nQ==
X-Received: by 2002:a05:7022:b050:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-18512c38593mr6986527c88.8.1792331010569;
        Sun, 18 Oct 2026 06:43:30 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm27868593c88.16.2026.10.18.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:43:30 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v3 1/2] perf/kselftest: convert prefix.pl to Python
Date: Sun, 18 Oct 2026 10:43:21 -0300
Message-ID: <20261018134322.26445-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018134322.26445-1-breno3011alves@gmail.com>
References: <20261018133032.24467-1-breno3011alves@gmail.com>
 <20261018134322.26445-1-breno3011alves@gmail.com>
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
 tools/testing/selftests/kselftest/runner.sh |  4 ++--
 4 files changed, 27 insertions(+), 27 deletions(-)
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
index 311811dc5..1944c74f1 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -29,10 +29,10 @@ TR_CMD=$(command -v tr)
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
 
-- 
2.43.0

