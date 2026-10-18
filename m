Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EAB4A1E03
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328214; cv=none; b=aSM8qvRJ8oLVNQUQZWsej9+Yl+hQ2862lOvvZ9sYnulGCPFOvSw+CFxU/HMDMorwXz+yqdNBXCHJYgcF8ilryf3A53luUrD2z0gQ8hsqOz5SiOHWRIws44AMmtz8U7W5uShehb4kN5uuMco4smTR1Q11ltW2sFOYCxFo1H8XlfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328214; c=relaxed/simple;
	bh=PksKvJSYmolkgiySGOXytWOGhgc2e/1kXd1gcpQcOvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlWsLU0k4oLv+GkFmxjQjaxAjc+ixylkEsVsuPWGrX3piue0R/C+ofImxM9ZQKlIGf7rr3z78dU3MMVOgGeQOkKi3cn/Ky/9BBzj/ga5HQ1PIlbhUp/T18oNDA8xdWQV+bXkA1vrDGZw8tXeOOzCQyPXMc8ZJ2L4OZaCjFCRSp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H57z7bI3; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H57z7bI3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1438d9363fbso144575c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792328212; x=1792933012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/T5q56CR4R9vbTCEnqV1OrpsFX4ExiSjkWfLjOv1KM=;
        b=H57z7bI3rqLOD7Q+RAwrDxoIYjURL/DrGIuSAwQEks5jQ+0N1RTCnpq9SekJ8pdWLT
         u+OVD2XgLwC4RL1D4mCgldrADW9tP3qufK62xph4DlLNic9PgAwgnQrSECg1h5h+tSai
         f4USRafC5ElF+uUoCL34I2HiD+kjeHbgMz0A+xtSt1QWr0ywdw35cySNZVOMHgWhGzIU
         7DndNKRH68QjTtGMrMdmL1awp9SlALDWYhasVgRvqvmYi8Khtdl4GdeqXoPuphwRrKJW
         uYDvhkk+fffFrbeRdfV4xdrtPZ4k8dWktRsitrmBw3Yqpc2vJM9c1OlvflN5hobI/qBl
         at+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328212; x=1792933012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/T5q56CR4R9vbTCEnqV1OrpsFX4ExiSjkWfLjOv1KM=;
        b=HDDQjtz559icnDIpaEwde37mgCZdPCN4BXM8/GTTup0nta51kkSO1CVz8W/SyQjsm8
         eSlG3irVNW87WyPw+6RgCzzZ1XhX4TQ4Y96DAywzTEDoNlIUNDyqI38XscuFsUfRsGfU
         lRZflhb0xQxb3r/WubF7zkR26Jv7W9Hx6XisTGDRHZmnzZ15QcfCCvZgptQg83EapNi8
         HL21UtUvFMpaXxqPojtqGd2pyGwjH3t8gdZo1NheTSRpskE6OetyjX+gRnQfh13Uaqcp
         HCMW14mhRmvd0/knSnerOx9npNRCbUVNdrOkY1PK28qjA+K5dyvFhPPvrJfUb+UvAZte
         IXdw==
X-Forwarded-Encrypted: i=1; AKwUvBwAfnJT2kUKCUaqeXqZXNHfBgakh9ABflhPlK1wOIw8jW9MVn3+pE2KDwydKySSOMU5hsyt2b0/L+TB/tKwV9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlrCTp4VUmQtwApq3T+AZVxvggKMJib066VuLDPXhem+FlUqbI
	+QWGYeH25Ho+jatqqFu6x6v88pxOJCOpqZOICeeECsxYL0FKuebtZt6g
X-Gm-Gg: AYBFou2US+USNpoy3ReyDBYMw5uF7dPIDF/kuVuBm656adDTKqUgUhI2cHtSPgM6lnQ
	tFwDvkwx2ZXGp7++nb+Xh9tH1pINU/2OQYAVumB8hwaRTEDQzJiSMb6IgLfc/5PPdQrOzgdaWT5
	/HTqxMzOxBHbCzj/kkN9CibAZRHQDISMkfkrrd0PeaNYkmbf/glYfFwlCTE2GDRYeu4QfkSa2dz
	YQXEay5D0MbSN0Bu48o+3ZBZckhmF1IoPqQYgwqrIvicosZIfNmWpoV4nertdGHEisVx+E8cGxT
	iHv8mBQLjGbrRX3apZRb/Sawsa7rNmAhWra4G5lUGNinuGX4lUOoUFfBlXd8U1zEwKo1Wiq6nbk
	Qj6+zxh4Ees0HIc3cbEv/cvVzR5J2buMyxL5iQeT/J3H2F9kopeq5s4YkqamcVFFwlO8ixfjwFt
	C9BC1arAQGy0ZHIZFbUWy/blfIJ2BtjPg3gQLqaSe43TzZJZyTURBCpn+k5D12t/gkBk2DuvAkm
	vQklJOnq+vAyd9zo6yEBLvVEDAJTygFXJafM3/p4g==
X-Received: by 2002:a05:7022:913:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-18511232282mr13479073c88.16.1792328212122;
        Sun, 18 Oct 2026 05:56:52 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm20404082c88.21.2026.10.18.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:56:51 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 1/5] perf/kselftest: convert prefix.pl to Python
Date: Sun, 18 Oct 2026 09:56:37 -0300
Message-ID: <20261018125641.23064-2-breno3011alves@gmail.com>
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

Faithful re-implementation of tools/testing/selftests/kselftest/
prefix.pl in Python 3 (stdlib only). Same unbuffered stdin-to-stdout
processing, same "# " prefix behavior.

Verified byte-for-byte identical to the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 tools/testing/selftests/kselftest/prefix.py | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 tools/testing/selftests/kselftest/prefix.py

diff --git a/tools/testing/selftests/kselftest/prefix.py b/tools/testing/selftests/kselftest/prefix.py
new file mode 100755
index 000000000..2bf16b37d
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
\ No newline at end of file
-- 
2.43.0

