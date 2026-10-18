Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E54A2619
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328220; cv=none; b=dcP4AUDLQlVPoEfOpuCh3kIkpy9n3B82XqTM3SbFau+4ud4Lpt5c19dweBmFxCnVgUwWzDEdsfgBoWgYttP16PgyfYT7r6wYy2e6xLQwaH4xRBARTGovPVE5eZ4GbVMkie0bsXqBn1EqvbQnxrbPh4Gke9L6MeOJH891kDQ4lwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328220; c=relaxed/simple;
	bh=fGeuiXoT6xfJG+i1Q7CVs1QkQR99sQEgvsl5cYIXtGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtleJVQSDUgbrCecZMoYG33PzX+QSvR6IzvEvTrClyc1JCh0qxAIzOCyKcPOPtflABZ0Wz5wQrfHxu5pqZPtP0nYbFSNAON3MqiMoGdVua78/f79OCLna3cvOQr2Ywbl/WBy8kA0DBysnw0QYBGvk+txJrhLl4BkuiM9yCyObfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwTxB8Ib; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwTxB8Ib"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so1426377eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328218; x=1792933018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35zLSPgPljkvq7HeoKghafYVUm5JrdIxwci7K3QcKT8=;
        b=ZwTxB8IbH1a7pRx0svBvrSByCoJLD/UioBRo7HqbSF0/LkXuHhL+gCbBcwnJyDmGbN
         UWXbwB+WEXKr5La+nrh/fKBeO9e/iT3ZRIojcEXEfRNtKqlLr+O7AbApqzLxGDKRwm91
         8QYwhSYU93sZ5tYUPvbf4HL4Wssf7dCIFfUKWcuuDPk4wHc9aIQEZ7IvW0E8z5kUD7zj
         waaeu30/PW34nO8RxpYsmYJMp40Z65AmeyscylJGNp7Uo7N6w2EbO7Mw9snmaZNYmpdf
         Eec3dZnm5LaKd1uyTqgyGbBpri3mIgJqnxJRAzDwjAp+7TbRihAKco5koUSQ/VN8u8wW
         4SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328218; x=1792933018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35zLSPgPljkvq7HeoKghafYVUm5JrdIxwci7K3QcKT8=;
        b=VwQMIRcFJue1xVrnbl5y/yNQDXmL1l+lr2cvKbiuNdyTG696pNPjN3oVFPYdq5+n0Q
         MCkXuef8pzLVRiOUqTCPQHFIOpAg54S67uSK5SBt+uUKaYdBOiN6bLo9Wl4/+yKWmEPO
         9WLbkbVQAnjDO2Cp45RNF0AM23IZ8rR1Q1UIE/Zc/tn/i3DZUBsHbyMq5CR3PpJ1LimM
         wEozUZ3BxpzVGHCtuWBY52AsFzK0652xkLC9Z76BaCG73aKwgefgID/sBAC7KWpkL/xO
         1Tfj1Qn86F1ZiIiwImP5+Mm5Ibt5Ztb9wEWxQs1KPw8jdq0SdkcY1T5j3ezMUzg+5gH0
         Xgyg==
X-Forwarded-Encrypted: i=1; AKwUvByilFlAm2wDsMvhbuaXp/VqnytfFghWyhALEbmtlHlujpI+lqT1n5XZhpcOcFV9Hyn66zKjeUoVJ0SAU5lBqu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8o3yEayCT9QyrRbJoGStQLbu1RwGftN0lBu60QCl1eOkyinaG
	XrQa35efYGnXjQyTRWQMGCXKczO290d7L5jTY78+kCAXV9QGXjOAI2tn
X-Gm-Gg: AYBFou3cPb+up97ztc42VdNt40BmhFFUi8x3LY7FVEteY16CszsHXeyxhfBUSReRW8h
	MH9LgnterL8crPWvT/p4sKBpPBuTOUy9timwNJ3vpiV89f5cwjQAPpfDFJ9ROVRkzV2K+07cuq0
	Fjuh54YMQE2ftAQWsaCiKhkmoHeGUpW7EnIhMHJH6NxmUee15ph/FpsqQG00ah2wtA60Pg+9LrW
	JPLx0P++0OBMXXoqTLG6swAGYL1uQ/uzapxzUsZBEO9p6hzypS5hiJro2wa2zdgT7oyhy1NXqnd
	kXtyCk6qNhF1jhfuBnyQAznQULAr49L5Mg2v2rCtJu53NiRKvoGK9onuTNE/FNhMVe1oscVIgvp
	9vRJhz9rSGGneAj1/5TjVPp4f5hg7UtDGZq8k4sybf+TS6l9jg3WbgjBbrwf0B6W1XqadNTgct9
	tvih/sbVhkouuPqd7VkENUdHmjKjyuVrUYTmuno2dze+pHK4NWvplgIM5xbc/T/6RmaGqmfdavz
	5Nn+HLrIsN7azVvNJLT4fvGRNOF8dHRKBnRENwTaYjfwKGmlYxTBHdsCoT1u6wVjGuxK3/ZnVuB
	VTYCqn4Tffa0dHzM++ZedkE=
X-Received: by 2002:a05:701b:424d:10b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1850c9cf427mr8398805c88.3.1792328218029;
        Sun, 18 Oct 2026 05:56:58 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:56:57 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 3/5] perf/tests: convert check_no_patterns_found.pl to Python
Date: Sun, 18 Oct 2026 09:56:39 -0300
Message-ID: <20261018125641.23064-4-breno3011alves@gmail.com>
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
check_no_patterns_found.pl in Python 3 (stdlib only). Same
regex matching, same environment handling, same exit codes.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 .../shell/common/check_no_patterns_found.py   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 tools/perf/tests/shell/common/check_no_patterns_found.py

diff --git a/tools/perf/tests/shell/common/check_no_patterns_found.py b/tools/perf/tests/shell/common/check_no_patterns_found.py
new file mode 100755
index 000000000..0e5d931b9
--- /dev/null
+++ b/tools/perf/tests/shell/common/check_no_patterns_found.py
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
+        if r in found:
+            if not quiet:
+                print(f'Regexp found: "{r}"')
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

