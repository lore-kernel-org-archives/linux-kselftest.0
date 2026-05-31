Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15038E8C9
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780239228; cv=none; b=UslbzZC37nQuS0JDiJvCQj5PJz/ONgXDMIZkOEjUIXXaAVXdIKHUUMdlC3kazNAuigAObVivIv6xL8jBPIrE2GlPj7x3QxW5asFYVhYgzOIlqhkfFRjOLZSCxNIeHXWq8hLfBBe1GoSfPpYc5h8zf00W0Pfpn1QT6gByig0/IPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780239228; c=relaxed/simple;
	bh=XK51geeL3+peWDyqzG1dtEA1t9N0Y1/v6t0z4dZe6eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5NfFAip0PHAT8zhAeROc5twNParqQiUG12cB9CIq74oK0sN+HafqZVfpm8RPO1s4LFo/I8yvV7ajy1SfjHC9N+xpCmzG1h5BpFwzKgYY5Ed0w2lipF06MxosYjFVKmO3oxX0TRRm/WslF8o9+G0ItZQGVVqL96D1yqPek6MEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Saow/BR8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Saow/BR8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso4143505e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780239224; x=1780844024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFQehZMTwDLdoBhXrsPY8v0PLCjeGjVTdtI7THwMy3A=;
        b=Saow/BR8NSyqvKaQWIzsTHW7f1LgOJ92i0jflT+Xlvl6nE1Jqmg0nb4ZaVqFzG6mjR
         R6anqEJKi07bTKLlpIHZGSY0Rdv4oDBrP0HP0I/cRmoT2H57EiKddAyX1jYikiYTcR6d
         5qQwkekUZNQ4yPkIMX3RjYYc36NtTxQ3xznoH4AGbZKDAqxIszHjUvrOqna9M75OBaZ7
         BGAUHYIABUaNsdukFnPaxubj3sY4+AZh7I3q9YXsf44NXzl090s9YwHKFeMUfGS15iTU
         LgSnPCeX1ec7AMVFt+jH3WqLBUDUo/v40dMxUMv594+1/oHeqdV5rIZz1DgwPC6Pu5tN
         EVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780239224; x=1780844024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFQehZMTwDLdoBhXrsPY8v0PLCjeGjVTdtI7THwMy3A=;
        b=hBYTuPQCR/jcbVynbMi2saGfBCwQ2UXBfvpU78hS9zOFK13UEKH2b5PObeRh2T4OJc
         Fo8f7WColMbsw5oi37vt42tZckPIStiPaVkiRDtdVQyaZBN2eHiTsNNDlq+CTzvpmxus
         rkFxZsjznB0vFnS6UBV/gBi0wVtH5NrW2UYistZ6rR34Nu+QtsUqEqW8vHeNYXDg3jnJ
         tfcMFAG7JhuHhF8f0h5vVgl2tA6NmWeFih9yNR23gzum1qaCWO2RmlnEMGjGQdW8rbk+
         +gsDXiRyE/NdarZC16LBZwTteUKKViaSe8w4dxqUrhxdwD58RQLQmZ9+dHJ0b7T/ah6l
         J18w==
X-Forwarded-Encrypted: i=1; AFNElJ9+pDzl1jPJrgpDC8cSOC4TxPhruKRJlZDqkMMRiZ9T6sdHglmUVFSrei0ZX9wVTCjI97mvdSagDIEmgTgNWFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKKe7QdkOQYNpnQX9PnRDr11+KUtPwf52uHS0+Cuufww3Khz2W
	fulaotS++tZKFi0WSQBrLqal7/u7kMzpJJMUm+GAcJH7wQw4BQPSUcum
X-Gm-Gg: Acq92OFEc6rCmg4AQJvx+1/FE+ZTghAN+l4H2hURX5induSyvZWbyQXSuaxlSsysSS7
	qa8BKn+c/ABAITLZClFjZGivMQSmwjEYE2V/9ZntEpK4cXeDWzIOVJo/L2ulaQzUuph2OkAN9ct
	Y8ZEbw2b0uKyU5t93xktXmS+lR24Ve6f7CuwwYAfjxoouEtN8BL4KGBmOwPQJNsK2M2NS+CaNgs
	UL3iotEnwiXtzUYsALvcvsxkApzFxDBuSkHMWga2xXwHkzWAjRWH/dbdN777+Z0rY/xVt9GwuRy
	jwv8f/pon9hr/zzO/ayZgkFinYm/t85s7Uo6vHemv4oimTog69I6ReRsx+mkrl2KNnTyPWWroGW
	K02hEfmqDY1fAoXc0Djp3ghyRx9JyPfijRAaqj6Oe1f1d9rzpO226vreYMKMP2EvCeo5BD/SHXj
	ZKsSKdwKyt8UZ5mmcyaY+53bA=
X-Received: by 2002:a05:600c:4f89:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-490a292ed68mr133428765e9.13.1780239223323;
        Sun, 31 May 2026 07:53:43 -0700 (PDT)
Received: from hisam ([39.40.47.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0ad269sm59217195e9.11.2026.05.31.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:53:42 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: pbonzini@redhat.com
Cc: seanjc@google.com,
	shuah@kernel.org,
	me@brighamcampbell.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] tools/include/linux/types.h: add ulong typedef for musl compatibility
Date: Sun, 31 May 2026 19:49:36 +0500
Message-ID: <20260531144934.403888-3-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building KVM selftests with musl libc fails across multiple files
(e.g. memslot_perf_test.c, cpuid_test.c) with 'ulong' undeclared.

Under glibc, <semaphore.h> includes <sys/types.h>, which exposes ulong.
Under musl, <semaphore.h> includes only <features.h>, <bits/alltypes.h>
and <fcntl.h>, and does not include <sys/types.h>. As a result, ulong is
not visible through the current selftests include chain.

include/linux/types.h already defines both ulong and ullong in its sysv
aliases block. tools/include/linux/types.h mirrors ullong but omits
ulong. Add ulong alongside ullong to close the gap.

Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/include/linux/types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
index d41f8a261bce..ccc90dd4baeb 100644
--- a/tools/include/linux/types.h
+++ b/tools/include/linux/types.h
@@ -42,6 +42,7 @@ typedef __s16 s16;
 typedef __u8  u8;
 typedef __s8  s8;
 
+typedef unsigned long		ulong;
 typedef unsigned long long	ullong;
 
 #ifdef __CHECKER__
-- 
2.51.0

