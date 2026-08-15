Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8D2931F1
	for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786828619; cv=none; b=WvKjdZxW9NWF2R8Wrlp3tWzJGZMWYLZom7Tp1MAQMyXuyO1EBtsjlorHuOpKmZ1BTka7lZZqMNvhlWE3chsfPtlGsD/dGgJshn4U2gaIjgnh6FZYetndH3VfXNTS5FyhSrd6mqV0K5TGBKzctef25CMrkAKrlwTiCQ6EMwTJwZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786828619; c=relaxed/simple;
	bh=8Dyszp/ViJIWjqj4NnTBUS6BvfWhFPjS+Jxwotbephc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jz1u7CKwjHVAZ+K108yFn/7sAaSntD/7uWHvDqN0ttiqi11048mgQlfdJpHN6qLzxJgN9JycE86H1qYV90raS+2kh3YDMTc+gSCZ9X3UV/xujGdlVr2x+HvRsfWzgaXByqlUmhEC3EB4RfmEGyVPizK78G6op7gkfmb65zOZBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZffYIEdz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZffYIEdz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so14173415ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 14:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786828617; x=1787433417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/0nI5pWAg0Hf27MY4SemLJOmlydRHBae8pVSxpdRNI=;
        b=ZffYIEdzx9U1JJVJ2JfdZXsrhLBQ+kAX0++KeIbWu8/uRpk9tGF1ayoMhmMSTWFNY1
         yZf+Kaw4B9iBvVrgMBZicRhjjchMMFrolSsyIH5GdLZuVY+2r33NBWr5niuCyiJtX3HU
         68cy7siBu89r0Wk7SsVG25tbJlA6p6U1vLUlkJHavNElMVEJKHZ5PvK4HpicCkoAaZbv
         kXMcmlI0is6pJjTWmVxvq2Q0gwTuUZKtHm/8WgWymKI4Gk+9ZZ+1V5IsKN1eU/ldwC4I
         +nsMqmWRWjRcn7tayxpkaMhDM2kq0Vo7nQ68429bcj+IxU1pPHm3XpEuVKUnaAlpSKX8
         UWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786828617; x=1787433417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/0nI5pWAg0Hf27MY4SemLJOmlydRHBae8pVSxpdRNI=;
        b=HSNsATrw0vlgxBWtpgfhhzvp0pGe3F+vCo+f8Zv/eajr1SDFVCea6OFVbCy1Rreshl
         Imu0OQH07dI0vxGyBqKWfvIAQQpxCn8+lplqdckfR00r9QIXXnwL6mYjFKAT08g7HJyA
         wC/9KWuHUSvUIO2SExQJEaBMOT/5PoggfXbFZUwGL6heKYx4PqedJ4XtGLWVEdVR1WKq
         tIV106+ahcojoFjz5dJd7E5F6TaCiXq0ENw/8HuDlOgbYjawwW4QEQG1IQ4f4byqvaJP
         UcTX/IMBQqVUp4228fLc2dY3O1jSGMH3tffuljlAF2qqELTIhRrQTxGY2o8LSkI9c7p6
         y68Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCbyWCcNiLRjTUtYpa7+LQiz1u4ZtA5he9R+R4/MR7aKtmH+vH+Ac0z5BDp8/t9wHnVNf7aHJfAHbt2/Qwdg8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CFPOHZbiiqG9LAimdDFfieXa2ykt8sxhTLBkN9STCfDzUu4y
	3dhr4ArKmDs6CwtXmRyOFdrj6odG7MoiIpGMK91a/qXXpcOuEvOqL2pgTD5C/Yw9
X-Gm-Gg: AR+sD10MHa9PhSUHDaNTbuO5ZS0e3ymBsEaActguMAxNgBjUxe9Tr+CkRcqOHt+JFdj
	M31CFpujsPxoouxkVlnwSnsjy4RtyO+1M1aLp92dWYqYhMWLijINA3KMST4mp3C9M8DHjsxshr3
	6zA1oNBbVyywQot1myodz2LlUvptjLEbD6B2TGswx0yAiy2tnFGQMB0YTiWARC6yRVBT4vHpqGn
	sz1nNSsKONDbIAZ18Z915i4dx7zHYQKQQsWP6oUGOSE99fGPrlAzptiuYixsW2cAxrEyXlaO5Ca
	43LHirRMOmspThJ1GrL5HKpSK6Q1P70ge0fwftzIdqFS2jb+FDBz7VVA3iULVnB4Hxf07lWGE12
	F5S+eKipOX4rpN91yNvgI0VC5zCceJZeVrh1bja3ywazjOhMWEAhPhcF9kX8kaD7D1v2pPoaZUO
	bqlOcOalIJUC/IahInLnCGfXTvXNm/xae0y50YIyUBM4tbXQlsJSCPVq+sBRpQQ56O4NCUXGj6Q
	DRvISEG1z5//foGlE+78jiwr5ACKUrh
X-Received: by 2002:a05:6a20:7fa9:b0:3cc:22bb:8911 with SMTP id adf61e73a8af0-3cc71ac37f9mr17008877637.6.1786828617188;
        Sat, 15 Aug 2026 14:16:57 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03d4sm16425621eec.15.2026.08.15.14.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:16:56 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: shuah@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] selftests/proc: skip setns-dcache if CONFIG_UNIX is disabled
Date: Sat, 15 Aug 2026 21:16:48 +0000
Message-ID: <20260815211648.21510-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setns-dcache test looks for /proc/net/unix, which doesn't exist
if CONFIG_UNIX is disabled in the kernel, causing the test to fail.

Fixed this by checking if the file exists right at the start of the
test. If it's missing, skip the test cleanly. This also removes
the old FIXME note.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 tools/testing/selftests/proc/setns-dcache.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/setns-dcache.c b/tools/testing/selftests/proc/setns-dcache.c
index 60ab197a73fc..35665e7894b2 100644
--- a/tools/testing/selftests/proc/setns-dcache.c
+++ b/tools/testing/selftests/proc/setns-dcache.c
@@ -17,7 +17,6 @@
  * Test that setns(CLONE_NEWNET) points to new /proc/net content even
  * if old one is in dcache.
  *
- * FIXME /proc/net/unix is under CONFIG_UNIX which can be disabled.
  */
 #undef NDEBUG
 #include <assert.h>
@@ -32,6 +31,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <sys/socket.h>
+#include "kselftest.h"
 
 static pid_t pid = -1;
 
@@ -48,6 +48,9 @@ int main(void)
 	char _ = 0;
 	int nsfd;
 
+	if (access("/proc/net/unix", F_OK) != 0)
+		ksft_exit_skip("CONFIG_UNIX is disabled or /proc/net/unix is missing\n");
+
 	atexit(f);
 
 	/* Check for priviledges and syscall availability straight away. */
-- 
2.43.0

