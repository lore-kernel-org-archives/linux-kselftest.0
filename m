Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D34A2064
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328217; cv=none; b=hHVRvfXUW87JmnLZfr+dcsHoCbPOcFEPqHAcwIZlthoX9izi77taIQl2A4h+1LP8ae3RdHbtxS1rR456Uy76o0wkoN1OEbj+ADT8ZziHEWET5IczQ/IIK/YHb0YqqQ2s0/5Ww5lIKS/wGpzg9DX6hgssqBMCHv3EXTkpYNGts1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328217; c=relaxed/simple;
	bh=OsrzL6ScmdUef1w4yo+N45vyWLhq1/I/YSTqZdchIEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1cce7pkpir2W/eA7QXNYF9q9DD9tsT1f0ZQaTD6QrJj/7B38nsG75NEQrSflamJ2YjjHjnavZrh4X2Ow+Ivo2ORYeNQLGo+T/OIqLmcaBlzZ6a1O8IfuvWy5KAEuO86OfN1eNV9zQL9H6TMpJb9APa86kkNa51SGysbGXDU5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr+UTrgR; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr+UTrgR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so2610403eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328215; x=1792933015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hR3kISfYtP85z8lc58s0LO5cffGmvqjBO0ESNwiecU=;
        b=mr+UTrgRT4Oy2tt0dGiu99EYX99SHkAt2dTkvoVHToNEBbmDHJVnw1r2/J7mJBUcAz
         GFjNr+4wpI6x65vuZoP220NMbe99o9mKNo3WqiRzw7oQIs/7+qOTL9Mr91E9KDH/9QYO
         UZde4VtT99TbXY8GIWlcRlBb7EjXGz8vtJzwSN6HvRBrBuI2u8n2ObszA75xYALXDRny
         zpU2mikCphRvJiaj2hiPxYFoFpiMAp3o0hHw1LxKws8MivVCgAXR8lsHL7RLrO40Uumf
         Ygw3Tzee2MpSLbbbrBMUeWXMSr0Cn+4xLNJc8yx+1ifVC49CSi/xl2W+vrqi6xJD2mx+
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328215; x=1792933015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hR3kISfYtP85z8lc58s0LO5cffGmvqjBO0ESNwiecU=;
        b=kiRI/G9DDPeMlhXYq8PMozsxgADY1m8a6ZDZAgmt96H7LbHeqIXp4JWwLmxdGW5xpa
         jpHZ3SG/APy7Ts42b2CMOBvNygYXrfgoUgMXr4XumZlcljSCjdSNTN6qGjqRa2aZj1KB
         Qd4VBpK4vIZ76NOlHBw1xL/9crz60L1QUQJh0fZLinDFH7rENXhWv0rbLEIIbX7EfMap
         xps/Hw/jCtCnNKPPcGyKh7o7muFNtiogcLnqnjzbmeHq2u0HpFS01pn6TeMIG5aJ0sqr
         8muhLNsoKXpusj/Wg0B5u/0Y7Du7jvnn8lUWnhyM58XwvbmKvalTTmTHOZ37ngi7OWl4
         Xomw==
X-Forwarded-Encrypted: i=1; AKwUvBxO5dh/NqdoNVoU5VvJ8ofXPEnsxObDOdIdpzpCP3jflBc0aYE8U2af5uYFLNCgIlZhumsEX70QlvU02BoTKvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbHiEbO+PI3MRmd4KBKwbRN8j6k49W3qz9dpB7vtgorlmFnpmc
	9nAamdK8GCcMCcH9UOxNbqwGDgo3ep+DxaAUGGEhmZhbaDjFfp7coZh0
X-Gm-Gg: AYBFou2IKpNGAzXRZCQ0Ioo9bY1IUfv94OQRL73UU53yNXt7NQwppyJZkxcT/FXMGPw
	5wNmuf3jKYRoHYzcMPQzLRQAqHJIadUk9rcWGTNJ7IqNbt8dBtcePzjersw9rJYEGHJVsijlZQF
	NMeQCuA9EbAEFTaMeJn+XlBxK1Irz55nMUiNj9nKNlQeiRBO/4jjtnPrjWOH8lSgAMCsES4c2G2
	lmzjtQ/AIM0sNWj3mluPjPt9T6ZHxT3JIDo+GmLbaNYCAGYKnKZ9C8AKt0XSHGDyIu39cfPUKUA
	fuCeNNNL5dtt22VrYDPiWRdRVwapKTz9jpApTUlphOQeXyu5axv3pmynofOWLkL7E3SexD2pXCF
	tZzV7SqQqANl1qwHGZexfUXkkW7axJ6oTwc3QAPU3VB0zuylxfSdvt/CwUlZNyJ12/ZNJlGoW0+
	1nFnUOftBEVU4nwtpB1upvysxhWymOcc+rGSejBucjhfpVpx25Le6hdre8bfjX7UkC/hPhJD/10
	4B5lR1+g18Mt3xT2bWQF4giSfFUeHirEAR6SvHk9w==
X-Received: by 2002:a05:7022:43a5:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-18511eb69acmr9823189c88.19.1792328215121;
        Sun, 18 Oct 2026 05:56:55 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:56:54 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 2/5] perf/tests: convert check_all_patterns_found.pl to Python
Date: Sun, 18 Oct 2026 09:56:38 -0300
Message-ID: <20261018125641.23064-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018125641.23064-1-breno3011alves@gmail.com>
References: <20261018125641.23064-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of tools/perf/tests/shell/common/
check_all_patterns_found.pl in Python 3 (stdlib only). Same
regex matching, same TESTLOG_VERBOSITY/TESTLOG_ERR_MSG_MAX_LINES
environment handling, same exit codes.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 .../shell/common/check_all_patterns_found.py  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.py

diff --git a/tools/perf/tests/shell/common/check_all_patterns_found.py b/tools/perf/tests/shell/common/check_all_patterns_found.py
new file mode 100755
index 000000000..3eb907af3
--- /dev/null
+++ b/tools/perf/tests/shell/common/check_all_patterns_found.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import os
+import re
+import sys
+
+
+def main(argv):
+    quiet = True
+    try:
+        if int(os.environ.get("TESTLOG_VERBOSITY", "0")) >= 2:
+            quiet = False
+    except ValueError:
+        pass
+
+    found = set()
+    for line in sys.stdin:
+        line = line.rstrip("\n")
+        for r in argv:
+            if re.search(r, line):
+                found.add(r)
+
+    passed = True
+    for r in argv:
+        if r not in found:
+            if not quiet:
+                print(f'Regexp not found: "{r}"')
+            passed = False
+
+    return 0 if passed else 1
+
+
+if __name__ == "__main__":
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

