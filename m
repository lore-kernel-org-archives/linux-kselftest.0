Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616132;
	b=RPrVeyL8BosHW8Wm3i6G3QmRw1RywwhhbbdmrYwKa9FZqSKk95AbjX/Pc5uUp5AYQQYS
	 ZudwFeOCHT2jSZ8I6Ac5AK9ugmjBvE3zKqfhhjO2PaunTKy48yrGqaLlnQdkDb+PFb3gZ
	 /CO0whqblcCVwWM8cPC9lpwu3BWl++zu6eEPOsk4PJSvsNPTzkFr2MiEVah+RwKif0bXV
	 lEj8tm4dAJjZ/Cia/1J/xBNIqNfNovHz+e+0F+Jlj/tYjymWmhkDz0zUx+XGCKFWGD5EY
	 HINeabL/bxRTQedogq8L69CSb/ruD3N1p6nWkql9uiPiodEgKpFppvxw4xRGXn6okOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k2CVahfdtfCEt6Rhl5+UPBC8R4qgo2uKGjGxWZGnVNc=;
	b=ZFEYiYQ3wOfgQLsSGOQIX6D8iYnBFtOJDJmgjAKqfR0ibPc4Z/WhCtjIzUcyuYjmp65v
	 iFf+dezgsgUllmtes39WVvm2JpanTW3+fERaRzQM5N+OzHBadHtDVDDnV5w3d+w4PZqfi
	 y7/I2425/6bfy5zHzELOo6U8TcsQIGmchv14ek46G4lv78YK37+KKEAK4YCE7aAitUDXi
	 St14XP4Cz9K7eB9p5GhZOVHm96ia9BpdAbg8FoDEhPfSyM18rHpGsQmygZ9JSKyty3Nwr
	 AY06n2cNIkHE8RyM7Y55t3QHArUgwjkodvfAJHG0+BLLvG+cUddXZbbfI61Iz6sDRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pal82Sk1;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 20:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6721E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pal82Sk1
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc0892f92cso427809137.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616130; x=1793220930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2CVahfdtfCEt6Rhl5+UPBC8R4qgo2uKGjGxWZGnVNc=;
        b=Pal82Sk1MxtlriboG/NXM+O/pVnBqIOA9veaPFQvJAXMxlmo29mkKVQb2jYoy1+KsJ
         PvjGx5DTLvqpv3AKnkr0VvRbkzq90T+S99IpYmwuEUDAc5qmEJgobeEcSb4m6oUXCeJa
         Ls/v0Xz8yUaa3XSh3Sg6g6pG3vqPi1/ZOsOBv3qDPP83Fq0CZJHprD8sbadbovTIBoOg
         0g3dyON3oil5G+pQRRD0Q5yPXokzxzaA4yoA7Zfm9C5qb8u/Gkrfpi/Dye8bMCljEaeD
         tMYyh2G8HFye9526ybmnM0xRie+IpPlYKsmOAgc8yA16LXxWqr5evtoUg3INlbw2UYkU
         XW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616130; x=1793220930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k2CVahfdtfCEt6Rhl5+UPBC8R4qgo2uKGjGxWZGnVNc=;
        b=FwiM9/n7AOMQJuctgnHR1l9vSU3eS3bWZUcTQxYlJowIjczvBm+bhepyTrg4LYZvWm
         tsz3OmakLaU9rUrGqtLN922qu7CQyG7U2SfMIRWEAw3KGbrVujUPA4VQUMrBVe8eZ084
         mWDYd4DvG5u9E1ZtH2h0vYO3H+nOoFZVxLmpwuSJqSwb91Oh92JCn1sCDS8G5+87dgkN
         wMpscLUolv9f0Pzfs/1YRphmDp+e7MTdwQG61Si1jriSsLkY9Ft/TIeQNYLAYfE3dheC
         w3+8AFrjf3AS6NfnpQHcVxlwd4GseM1EBUaNaf1rCXAmqqKUOwmexowXvsMVxjGq9Igc
         ynDQ==
X-Forwarded-Encrypted: i=1; AKwUvBweezJolGLZ2JWNli8X88e711lCixw+BebaXD3snih+Gk4x6RxuSWgr9SsyTEimRHLpTWt5lp1h/CL+AThFtdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR5T9mAgICoFRTrhIgrEuQE8Sr1h8FTvP2fBOG9YDkBPXRHNCd
	Q/NcvWgmki54usoEZs3RGq4jXHeHhXDdve4cj8P8zEAfEzl+6V1iDwrB
X-Gm-Gg: AYBFou3wPkbhu54zpIVrEMai/5B/DjwsN0FFMIKgPjE2JONMZ2DNCU3OGAOc8nlY9yb
	5wa7+b7yQp5KXkakvWmH8WOSgwh8Np//I/lMe9JTY/RitYkNXvVmHtJdXVry9au6aG8e8uR9uIY
	YSw0gLftQBziS7qWDX+LJecnozSoAJ2x/UoLHvK4tsMXPFbWNntAcVssmIKqLqmwkRgUextQTc/
	Zp7pXI1cUscVMxeKysF1AbXBjuprMdgDhLbzNTYEKDt15mVNfTvuhjzeVbNBH3KF7B9eDhpaJRg
	DFYN0XjMkWD3f7nkl9dP7/r+Y9GQ1J4t42yrVi5aGv88BR+7fJRg0F6pkFkxpVKiiesBtnmmxlv
	yO2utAhN8HVoW+IAeDH0togaAMuKF7pTp8MzTc8ItoiTeI0+HVtR2PuU9A61SQdsnwwpeivX3MB
	RpWCyRsISCm3HA73KI24Cb69T8P2K4Drb3E9ODyktXzhlFJ7uPJIjRwLxkJjSk2QOf0Dsz0Vkls
	3XPzhSZhGz2PQW260o6H0m4YkFRUNLeHWKH6Nt69jjUpR0aTf4dsNPw/+RaIjCqbKo3UEyfdnji
	8WRfKr0HkGsOSgFVepB+uY1OGzHQoqpcBbLELaQmmQ==
X-Received: by 2002:a05:6102:3709:b0:7c8:268:ecd7 with SMTP id ada2fe7eead31-7cc92739b17mr1017473137.23.1792616130118;
        Wed, 21 Oct 2026 13:55:30 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae980f64esm4553359e0c.13.2026.10.21.13.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:55:28 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: irogers@google.com
Cc: acme@kernel.org,
	namhyung@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v4 1/2] kselftest: convert prefix.pl to Python
Date: Wed, 21 Oct 2026 17:55:05 -0300
Message-ID: <20261021205506.26736-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021205506.26736-1-breno3011alves@gmail.com>
References: <20261018134322.26445-1-breno3011alves@gmail.com>
 <20261021205506.26736-1-breno3011alves@gmail.com>
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
index 2d960626750e..4bec301fe278 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -280,7 +280,7 @@ ifdef INSTALL_PATH
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
index 12a7f4ca2684..000000000000
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
index 000000000000..67c4fd0b6089
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
index 311811dc55a0..1944c74f1e31 100644
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
2.56.0

