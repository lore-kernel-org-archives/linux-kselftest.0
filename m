Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286539;
	b=h93oBx6ogdne5J0aPQBz7L6w+eyfQLXQhPykHSGa0BknXsHGc2I6j3Hujp+gwJy7uRfF
	 MUUUSl0SzX23CdXCtQzX+RvIGZIhlyXBsiz836KHB+4wDuGs8HkY5COmWcfQKN9Vy9uzb
	 +staiIulCXz4R9REDqsWTt0bMnNiAiK1pbZTqWRvdfj8NH9A/4icZaCohlqb8cGuS6NHn
	 8yuOYxag47urEONQ6NqtBGupgoIM9skne0KUFQOEVuQtjtjinNHrM/+6ymDy3quobZek1
	 K7VHBIYZs6+sBZPB9ULJM7Xq3HIF97f+D6FrUDgXiLAJfLSyeFjwqVF7290EHRGtfZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GjLpY1CKPj0eCFHlrRrrfFi/jmOkP03r0FnUiwT8DXQ=;
	b=2btC6jP5+nPyhc1nWVXI962TlKm9p4+XcH6zeFVBMEJlj04PiZap0jBjsfzla4DQwLmS
	 ZaKLqJiNHKj/JUIDbvS6wBTNXlRBAdYgKn6h2E11YcEsXFSi1HdkmFyVy8GncVoxx8vPy
	 8zpWp5At42euPJ9GbHExfK16xtPfdvr+cb3N/JQgkG4K5zfGKE4TeZstPwNVdhCWN0101
	 UIq1IluN8YK+XUHjouZbz7FupatgiA6cxdf+YryO4bhuqGGrfR4vd+W8v3or8rUhDI7Ex
	 ibQk1RZXb5QsL0mombU849OpetGEzgQB5yBZ5OVRC6B8NG+5hVmPInvJHtWGYVaEs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5ZrevY;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729B606A320
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4729B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5ZrevY
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c5b6584ceso15507911cf.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795286538; x=1795891338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjLpY1CKPj0eCFHlrRrrfFi/jmOkP03r0FnUiwT8DXQ=;
        b=yd5ZrevYNJ5vwHoAtXXlSYrLtSWp/xktYV9c34TMqrfVWU53FFVucnseLiHnbzER/k
         M2jqu/wKGNI8qvabv6LsBOY4T1t/LdwtXX02Z4fjF+EB0Q3O3Huo7kOQBxoTo2sQFAnQ
         fPojYU9K+LMMHAikgXoNNxHIZpSftGRIbxuOgI/i71694ad6e081XFbF6SdvTPKpgw07
         jMWsSJqqrId3lsM75lDJCuWeC3ieQ+6FCC9+/uMKPdIKd5gheSWXotwT4Ap3X47HpJaM
         QBJJxkhSZwbsLEsFxdJyR04KCsOxO41Bba8vKwGXBGphVzwFIpaJPMDUjVwHV5BNCA+g
         8SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286538; x=1795891338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjLpY1CKPj0eCFHlrRrrfFi/jmOkP03r0FnUiwT8DXQ=;
        b=WmVdvIkOKY1QSeGD/LwJ6jpJFmlIQfKUVUsLyaIlsjJwtoMh9MNn3oLk+MLwn7phcc
         8rWmbMX01dHcODhCgHnhtjPiSTiStb/3XnjSR0Zonl8DhFSpcOUz9oMbybSEH8rWpVSV
         RNV9tbfRukDpxcLPx6kEG6KUtziNjvI0pI9tVZWugvA4Z0nFa2qtSTwj4gm1K68dZ1xO
         IMSIEDW9/kbMk79Eydu+3d1wEQe3A8ydeOG0Jq0tCRdqo7dQeMVlAc/7VTX2tgDgEN5o
         wLL3ao50OOJmPYxkFGMouARr/MBEMKEOoNLw61T7SEHQLr+vlaBtOQaEb2qcjww83uwh
         3P7A==
X-Forwarded-Encrypted: i=1; AL+hErFFmAq+cNH+sRluTjO2kIUHVcpRoFoAh+fOUylJz9SlXXJBSmoK4Fl46InRTM1DXmm92jRENSKxPVb7ANITJwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kywaDlI9jcjTpfnnJWr1HYIY8iueLJ+gUdxbj2HPBTdB7yz/6
	P/uooN6/D8w9Qwh847PxIH7RtO8IDyexQ+s6G5TnwG7xWaGmqusA1cEl
X-Gm-Gg: AZFdTZc0xqwKN9kDT2+phQqOed32xJLCIXI6zBPJ8vcHWtoDdGAgexhHN86uAL09Zwm
	cJLKqFIC/I5cmcIGMolMqCyaI6apagD4nPPeBQqhE0Ai+YaQy19TmN2wFrxMHdRRT93NCOVR4eT
	F5T2adynuzSdJdFqNEYDtBiLO0WpyX5jfR7Jqdr7qxiO7IPnjjU2KtMbOF7zXeWrK6s91+6HXix
	K6HxnDSQhpKBu8Qe1063dHSLW4Fxr9+9Sj7OnIt0aSn97wjWYbKm7jtWmAufl4OnFA4uU/1huS2
	9+cIiaRbc857if68XwrDDLAZRuqsWngDt5Kn9Egh7VRbaZNVMrXXYU90+DYlBu6zriX/VP1hmtV
	nSzYQ6A093UugyOFpKOFDz3LpfgVhgGWuktZf4rrbn4th+t1VZ6SGAQBV6mVmyugDNYp9ZiZqPK
	7iRqBLCEg/hTY8T14C7XXRxhG8/GSiN5O/4Vf5cQyxtIN6aUa4IvToeKKYeLNbqfztYCOK5dDMJ
	iwYq4iEQyqzqLdgYyVuZo8TA+zbnG+ZVlhaHXBRHruMWcWFD3I1GAMQCby1pGRRLbPDwNtCtUbw
	64rsOYyLHmpL68VlLLpYYOZxwBXHZB83f7UE2Obsw7t0FLDCwUV5cnI8a9F7YFkBFaiGF9uhSzB
	rj9treTD1x26EGCyGu3uT3Ts=
X-Received: by 2002:a05:622a:5c1b:b0:55c:abad:a72c with SMTP id d75a77b69052e-55d76a6260dmr122239201cf.56.1795286538132;
        Sat, 21 Nov 2026 10:42:18 -0800 (PST)
Received: from localhost ([143.198.29.12])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm59458726d6.39.2026.11.21.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:42:17 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] selftests/filesystems: move kernel UAPI includes after libc headers
Date: Sat, 21 Nov 2026 21:42:15 +0300
Message-Id: <20261121184215.90813-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.34.1
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

<linux/fs.h> includes <linux/mount.h>, which defines the MS_* flags as
macros.  <sys/mount.h> declares the same flags as enum constants, so
including <linux/fs.h> first makes the macros expand inside the enum
declaration and the build fails:

  /usr/include/x86_64-linux-gnu/sys/mount.h:35:3:
  error: expected identifier before numeric constant

Seen with glibc 2.35 on Ubuntu 22.04.

Move the two kernel UAPI includes after the libc headers.

Fixes: 073d71c5118f ("selftests/filesystems: add a test for freezing a shared block device")
Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 tools/testing/selftests/filesystems/freeze/shared_bdev_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filesystems/freeze/shared_bdev_test.c b/tools/testing/selftests/filesystems/freeze/shared_bdev_test.c
index 0ee352268a97..6454cabce83f 100644
--- a/tools/testing/selftests/filesystems/freeze/shared_bdev_test.c
+++ b/tools/testing/selftests/filesystems/freeze/shared_bdev_test.c
@@ -14,8 +14,6 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <ftw.h>
-#include <linux/dm-ioctl.h>
-#include <linux/fs.h>
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -29,6 +27,8 @@
 #include <sys/sysmacros.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include <linux/dm-ioctl.h>
+#include <linux/fs.h>
 
 #include "../../kselftest_harness.h"
 #include "loop_util.h"
-- 
2.34.1

