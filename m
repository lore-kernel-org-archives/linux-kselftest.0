Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8EE343890
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576694; cv=none; b=EKuXujz1OBxcx5V+rZj/TT/WkMoGAK+zVYNDirGTcs066W8/dpz7OOCqEA96dqNvFGQHzH3BDAUh7XbQBXRq2hQLIOGpUtwa5BttCOWJe79UU/MRfj0jKoTxbfKOjs4BH92Cd+YnxnQa0clzTGo8IdmwEP/oYEwzvaithR0f6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576694; c=relaxed/simple;
	bh=0oDNB+NNpmi/Ia5UjiAAkWEUmzFeJsRXTEAWNh6e61Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uJEm47MjvtvCnJALlV5jUlmP0v4hY371IGQueSO0L+RnTDUulXBxmW5yo8N8nH8cBIUckO33V1C3J8HCNTVrkuaxmSbEOXppo0X/buQcI8iQq+VzFuQqUcvqdZMXjrg78ForjQRm8rfmZqfdmgj+z9SelHaqA8de814kusoff/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZYXIZwx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZYXIZwx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso16875045e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576691; x=1789181491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=MZYXIZwxo83oWGZmBhCE7jrDgqzAHjLHYUeJ4DYSrl6Djz/zts0RsT+68tVmOUH3zl
         rlQuk9KaOvxdZWWHUIzqiaUVhblYwptMIx1lj1QmgiQ8T+GgEOhFyOlEsPDQdYhmh8bH
         mp5ZsbQw6K/4Mzr+5GSx6qia9F9jwZCGUFOscIe04S7WK7VH7uP32iM8vPOZbc6LzpEC
         npjs+sBu3XV+v7uF045QkdrZ1u1Noj1AIafN95oQGHlcEqy8Eegixu3A8tlObLb61O8D
         TRheXGxsJRWAQ7PhyP5ZoEymvceVzIvY6jHb231772+6UoQZz7XT7htMCkjQ2RbhMYbD
         nfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576691; x=1789181491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7My75hWOIQc2thwMD1HFJppKK9ULfChR8ooEsnbLug=;
        b=YkRSmjPwFAajyWSEm5s6uMxIfBosawcfa9FibIL4zeCkfNsDA4ruYvbClIAxtjsvys
         6RfKFXGfrhK9ioQHRCHMQNHBpTBD7vPdRa7Y5eYEgak68WOGUxeiatzBKpSl7uPsHsqg
         LKCS1bncT7AZFImr00TBL1gybf2zVRJOCsKNWW5CKxjjAUvK+mijfk9GvrmkLd3q1yac
         zT1mYnDaQ++fdmfj5a2N7wmhErw0GiNtLJExnguaK6mW4rkiaLNQKEqQkrBekyZEU3A8
         /vF9POfRP1ZdYNWeVtPsfYS2DQpx0Cr1XvKuy7HiDB1EOmg4QIFrWV/h9aMXxSsUCg7o
         Hfpw==
X-Forwarded-Encrypted: i=1; AKwUvBzJs6nP0tN27/WYZO4QnrjRH0pGWTVSWtNZwunzVWYWLNAYn0HEERlgejdGOQbnBa2mrmWTUgF7p9iV0q3LgZs=@vger.kernel.org
X-Gm-Message-State: AFuF++me/A9MlIFFkdAFD6S0WgZgj6w/pqQ+GztYOR+S95v1CPLQF1DR
	ay+C/HWAnlK9nW655jOmco+ZhOcAU2gJPjuCJ7LHMu7+nH0HEhYrMWNA
X-Gm-Gg: AYBFou1dhZzGYqN03fdvpaEL4Tc8F1+wiPcaUexhtdfq3uxIWQzjLkZwTKfQg1y4+kN
	QX0JIcRC+1FijZW/2V3uVGC3gmsxRwYRjgirwd6E5d6E36ZOeFMofYs7ZAfVTOVQHGzz/gZvB0D
	mzQAECXeRsVyCl+UNmyMbiPZJYT6DY1Mnb/76fT4yFDLalpCPzlaQS+XDbHE5MMI4TANnFfofUa
	r2Me78n0DuJa2aGoT9t6T/uFSc06mcrf2jvMl69jSmML+JZURL8xAz8q5nlVmy1BuBU1IqSGpK+
	l4cvrkbJ9UubBHNnpUgE5uXKUANIFPvmt5B/TzQIop9Cro0Q9QFs0KLmZIXot1RUN8PDaC7bcNt
	t86ppg6wZEImg/Plc9CHzKx22zBWf1NpXVuWVJnyWQvdbr+kGml37hRKko8Gq537FR6RDdzIyCT
	YgK1srO5FL9HgeeThtunWIXFhd6bYIjzcIxiAT+Of+W9QBRR9L8r//Aq7fSWo9o2Rg7o+HJrWcO
	30s5rlN5NHoMtMKRVI6ut9i26n36PLSPW5mdEmzEz989O/XGrRSnlKABhUSjjgpWiP/m19iMijj
	Xacb9vbFMX83fu0nL2s3lkEIg4g94EoQXjsAPz28mFbgb8aH/P19ODPcLuTWXlY6Lqs=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr197015325e9.16.1788576690772;
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm200740735e9.4.2026.09.04.19.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:51:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tim Bird <tim.bird@sony.com>,
	Harinder Singh <sharinder@google.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Daniel Latypov <dlatypov@google.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: KUnit: Fix cross-compiler prefix examples
Date: Sat,  5 Sep 2026 04:51:26 +0200
Message-Id: <20260905025126.83693-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GNU target-tuple prefixes shown in the CROSS_COMPILE examples are
missing their trailing dash.

Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
Fixes: 957063874c76 ("Documentation: kunit: Add CLI args for kunit_tool")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a3399f..9221acddf3fa8 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -189,10 +189,10 @@ via UML. To run tests on qemu, by default it requires two flags:
   Kbuild. As a reminder, this will be the prefix for the toolchain
   binaries such as GCC. For example:
 
-  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
+  - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a directory in our home directory called toolchains.
 
@@ -293,7 +293,7 @@ command line arguments:
   - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
     our system.
 
-  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
+  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
     if we have downloaded the microblaze toolchain from the 0-day
     website to a specified path in our home directory called toolchains.
 
-- 
2.53.0

