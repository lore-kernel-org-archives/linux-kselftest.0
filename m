Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F934A1DEE
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328224; cv=none; b=ssZLB7Ajt/pe3J50v3zVOhsdykNd1CnuRx3TKTLSe59zsUrbOu3Kz2r7r3kiyIaE7LNviv2v+ejVdsqcsH5/8bbPDLVubmUf5fM6h2GLnKlmBys+kXzfDuNiiiVPuU0tB8kp5wxZX476fJDe1hm34bWB31AISOh/mVrGfBU4Xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328224; c=relaxed/simple;
	bh=3NqF9oFx556ARlbLAjVMnfvI/bYH2vz25WwpKD5JYVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDApCWUOVPyGutu2wF60FzzjEaU7SsYpL3Tsrunf/vSKzVyJGeENj5A48xrCMczy2J6AMT4YnGNLAPKiPpQ1SLzbnpb0plJQ0jrX2XYLZ5xwHVrKuoDJuS68wh6K6TPyUK2Pc6ip87NX06xgOieZdZrOtVplNvDCSg4qI+r0nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6ylTl7I; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6ylTl7I"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so3244512eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328221; x=1792933021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpCU0lBJpwjrApwyscimeM9CzakmAtWJtSfSGNyY77w=;
        b=d6ylTl7I2Dctsnab5bO0cSr2/qh8TBPcuLl+T/UPSkkeB89cojFkHP5NUmkQHnJdle
         jbEGtfBJJvfbP3FVYYl0pV2rfR03bVopn6BFYCSdLhIr7XyO2ItX44lbHUblFtcfV6Bc
         0ui4+JaD3ZZvacfP83ymmz2m5Ozc03kbXzuGL2C3XcsRBhioxB3M/SI/1p0d6rG+GflT
         pNVU31NJXacvSJ/GVAAUzJen51TlNWqdr2JiaRX51wPqw3T3wVLpKyKC5vo4RFedguNT
         CGPRlkd7VV539tz6lVC4E6vOQKCn+hmL6mr0ZGraINEMEFAEX26mUiuwD9gLaPAqHZp0
         oXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328221; x=1792933021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpCU0lBJpwjrApwyscimeM9CzakmAtWJtSfSGNyY77w=;
        b=Dtvn0ErZ6SfS+M/3dEksuzIaswdygpgPomwLti7DhWrnxOCdUS8o+tILkp7qM7cmMr
         h8cUAd0MVK6J5SiaOJXfpeZmoh7d/LPlSj2KT5P7fIoJBGwwfbStZyHQQor6qT1Je2cy
         B8u9PJgCgYdT3Y/DdYC43rPhqyMteFF5bawcX9nHd6XbTmzgDTs6yxlLxvjrv4d6fQMq
         A/MJXy3ZRjMzYYOn67YjWmxZ3dWUvdWShgvhlknJOgIvZSMbOvpS6+n6+umXKlbqKzDX
         fO99/403YaBlDMEkufMO6KKd+CFLcRi6q8J5iSFtzpX+8CcXAr7zUmOPfJZYq5rD6O47
         OwNg==
X-Forwarded-Encrypted: i=1; AKwUvBx0BkKS1+vStVXd+VuarKgQimZ0/FO1YBW+QIiqYBeWvqG0kTCINh6Sx6YEeWA1rkj7cpv+bU8TnOqAPKPZRqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI3+XzpLSSasEVBZtphDlShXY0ZLFSrlMK6UMlmqdE6eVxkZdp
	tPgTQfzsHA4AzQ3UCD8xgtK7RWrC1srMdGcURugMVLjixv9O+IcDtDQv
X-Gm-Gg: AYBFou0q7T3rw0Ff6TPFLaccahDKRuw2nK6oFM2WThs4tJZ2fFkDj6pGHQwd+6Pfssp
	hWZnl+mGCggvEiOE+gLt2XrWlwW5UCMI1M3FS+z6n/Gv2G2BDLZ3JOJphxdo9GOG9kTgammAIZV
	fUPIqkfjHeqK40DvtWWQMBAAhpy1sf1uacoB5Th9Eir78s9t5uclUc0Fy9ZrKkuaopPMJxLNnqE
	73BBZh/Df6W09UnjVhm6ukY/pmQAgK3s2+RfIIDc7XT49qEMoJDGqMKH+N+S/mNlJt3DChLt1IX
	Q29TLvKzXjzA74bVfHf1uIpvproACe6O1TluqZmh9Ry/+6u/tNLWphIUmZM0WDlA13wQAm6qZKA
	trsUpFtBYTOWDp6IYljX/CZs7NybTx2Uiu65LixMT1/WreDqqs7HWN/dAv9iXIujavZSrFwHmTO
	8RZDewv62O78mVvSnb2S6ntWak3HTO56LrLH+7e6jtF/CusuEsqmGEHD10iYB4IBexoCVVw/Zml
	ethpk4nP+45bLaaKbfyVHKajGnxCM3A5Yf5RSTxz1NwrlsH1fgWMFolaApW0nSRKzlyL7xAKlmk
	uAUg1kC/gzZOxAiPnNX3DYM=
X-Received: by 2002:a05:7022:1709:b0:144:fc5b:2121 with SMTP id a92af1059eb24-1851257915bmr5595386c88.17.1792328220803;
        Sun, 18 Oct 2026 05:57:00 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:57:00 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 4/5] perf/tests: convert check_all_lines_matched.pl to Python
Date: Sun, 18 Oct 2026 09:56:40 -0300
Message-ID: <20261018125641.23064-5-breno3011alves@gmail.com>
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
check_all_lines_matched.pl in Python 3 (stdlib only). Same
regex matching, same environment handling, same exit codes.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 .../shell/common/check_all_lines_matched.py   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.py

diff --git a/tools/perf/tests/shell/common/check_all_lines_matched.py b/tools/perf/tests/shell/common/check_all_lines_matched.py
new file mode 100755
index 000000000..352a56d8b
--- /dev/null
+++ b/tools/perf/tests/shell/common/check_all_lines_matched.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import os
+import re
+import sys
+
+
+def main(argv):
+    max_printed = 20
+    if "TESTLOG_ERR_MSG_MAX_LINES" in os.environ:
+        try:
+            max_printed = int(os.environ["TESTLOG_ERR_MSG_MAX_LINES"])
+        except ValueError:
+            pass
+
+    quiet = True
+    try:
+        if int(os.environ.get("TESTLOG_VERBOSITY", "0")) >= 2:
+            quiet = False
+    except ValueError:
+        pass
+
+    passed = True
+    lines_printed = 0
+
+    for line in sys.stdin:
+        line = line.rstrip("\n")
+        matched = False
+        for r in argv:
+            if re.search(r, line):
+                matched = True
+                break
+        if not matched:
+            show = lines_printed < max_printed
+            lines_printed += 1
+            if show and not quiet:
+                print(f'Line did not match any pattern: "{line}"')
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

