Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DC39448D
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774718666; cv=none; b=kDBVFost1uO5+IVs9gRAu6OqazJ4nUMf5KqkwqUkGFXDeaOwUq8cydbBl/kPjGn1q/4j8O/qTPTFBdMJJghVzA8W2yCNodnlaNYQBR7oNTMyHJJ4hTunOEYbavpA4svl1wQ6jjb9TzHlVSRmfDEtKpb7eV+7EQB9au88KRXclUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774718666; c=relaxed/simple;
	bh=Q9dm8LTnk+DFIEJAAB7tpFWixf8EizWYmak8EK7I1tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKlpF8USs/JjgGEcqvnZXEIqUiBj3lJcW1fZ8XjbgUUogvQ6pIZfaJ1okv2b+9Rq1PZ3BzmNSnr1rWYcWgkXOsLA+r60BZAwEWgI6KoHuk/0h+21mvbfdOHwWCT7QchZs2e7SwfRHnckzNxHLXjkTbJ20ktOELGWqWJaJxsYaN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUHC39t5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUHC39t5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso257672a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774718665; x=1775323465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4HfR25bhfBsIe8RbNyIL8PstGgybd8nsB9r91rb4k4=;
        b=fUHC39t5SVFYPhzjdVkydSn6kkxLe/mQ3HnNYH/M5q3wq6Eoem2pwd7OqgnlJpwO+I
         p/mg53wMg9CJ2i8ZMMAWJuGt9mbPfa3mspXRaSxC7dEBgKRsM5EWJW1Umw8805nuLH1x
         kUvZWoYQ7QEleQ9S6i5L/U2m47KXH+m2Ld9THKApeMdTTV1A6THnMVIXevNDPgCzaPMv
         rBj672km8OsufCBY/xztP1co6wDvqD15FyUDMEPp15Xz5cnxylowDbInB/mSxjDP5kiT
         RgAHkTDt2k9W+GGrPwix3NpyxqfQaRE2k9rmYWyaNIBMT0YIRSDvd+t3q7qICRlLSVQO
         IPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774718665; x=1775323465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4HfR25bhfBsIe8RbNyIL8PstGgybd8nsB9r91rb4k4=;
        b=O2rFtxmimlym+SkHmG8Q4nGZ6cdJX5NvLkeUyWaJ+efXJ00dGolQJ08o9w4DFfdF1U
         GW+ZKRqLCaH0pdMcSg8e911acECmMiOM3KSctA90EpOX0G+MemAZmisY9AFmtxzWUQ9D
         c/7TAIhLQiw2243hGRXpF1TiNq6b1WRmSXbHm3GEO742JhKSe/SN92YgQnt8+qSevPAc
         6BPZEoku30N4cViipvewvofJzAZ1VIxgU8HHpvfncLgqI4ZGmDpd+9AfupKhyRCbx5ch
         D65l8IItOlsBXq7aKkmDbmjfh6Jdo+rqaFXZIG9nKBk14fd7GfHq2MxO8hGR5LO7/CMX
         Injg==
X-Forwarded-Encrypted: i=1; AJvYcCXrSdROXbjsQ1ZjfsWjuHtdI9WDNv/4oiKej0iP2CaWwCBfTmVF8pH5o8KcSgwzel85e0wD+Q83IEE7ftD1QV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWaRgz6mo+TrtOiVNgejxnXtABHO1+Yf3Nz2Tl+Im4ZVXCI7Yu
	SBWRjchJ7geDxDWsFGE/FGNP1dSOQjXyNBMwGD85BxNh5ydO1ev6+uyf
X-Gm-Gg: ATEYQzwrx30/Y/SvxAdklGYWVlUscVfxQVCUZ58SvBPHe9pko5VjoDqUAy84cxRQLRM
	5HH2Vqarykzp9c5zoXLQ0N9+bIOH1CO7z8TKaq83fAqF5GzOnYekZ0CGR7TvM6NhMWni6fo5G0J
	2n8XW19FmvdswIj+Q/soWC36X/uKu3C8eqUq+IfETX2tD1midMy95G0j/xilsjuvvpNsNNU6bbH
	xOU+cFLPrglEECqQq5B4b6QkX73smv8s99pdvjrIGTbXFRj1FLUple+NHuLywAsepX7mVS4aaLF
	x2lJ/fdhBD0EfT+McQYaTJKuUODxsX5UQltAngMqm042Yx34LVtZ3IOUzj8Fn4D+JEWSkLnBR8M
	MUlduPD46uriktSn5kABOcPPBogqvUI/HUbnBKhOJNu4CPQE5io47QWNvXsGJJurkRqOUnaOBAc
	UbeZMnUUAwqJUwCU54xEHyim4OojKEOaKuISMRrY5Qy7BSbkdgy/EE7/A=
X-Received: by 2002:a17:90b:3ec6:b0:35b:9397:7073 with SMTP id 98e67ed59e1d1-35c30126798mr6566152a91.30.1774718664565;
        Sat, 28 Mar 2026 10:24:24 -0700 (PDT)
Received: from toolbx ([103.103.35.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a5570esm10513773a91.3.2026.03.28.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:24:24 -0700 (PDT)
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	chuck.lever@oracle.com,
	alex.aring@gmail.com,
	arnd@arndb.de,
	adilger@dilger.ca,
	mjguzik@gmail.com,
	smfrench@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	slava@dubeyko.com,
	agruenba@redhat.com,
	trondmy@kernel.org,
	anna@kernel.org,
	sfrench@samba.org,
	pc@manguebit.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	shuah@kernel.org,
	miklos@szeredi.hu,
	hansg@kernel.org
Subject: [PATCH v6 3/4] sparc/fcntl.h: convert O_* flag macros from hex to octal
Date: Sat, 28 Mar 2026 23:22:24 +0600
Message-ID: <20260328172314.45807-4-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328172314.45807-1-dorjoychy111@gmail.com>
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the convention in include/uapi/asm-generic/fcntl.h and other
architecture specific arch/*/include/uapi/asm/fcntl.h files.

Signed-off-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>
---
 arch/sparc/include/uapi/asm/fcntl.h | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/sparc/include/uapi/asm/fcntl.h b/arch/sparc/include/uapi/asm/fcntl.h
index bb6e9fa94bc9..33ce58ec57f6 100644
--- a/arch/sparc/include/uapi/asm/fcntl.h
+++ b/arch/sparc/include/uapi/asm/fcntl.h
@@ -2,23 +2,23 @@
 #ifndef _SPARC_FCNTL_H
 #define _SPARC_FCNTL_H
 
-#define O_APPEND	0x0008
-#define FASYNC		0x0040	/* fcntl, for BSD compatibility */
-#define O_CREAT		0x0200	/* not fcntl */
-#define O_TRUNC		0x0400	/* not fcntl */
-#define O_EXCL		0x0800	/* not fcntl */
-#define O_DSYNC		0x2000	/* used to be O_SYNC, see below */
-#define O_NONBLOCK	0x4000
+#define O_APPEND	0000000010
+#define FASYNC		0000000100	/* fcntl, for BSD compatibility */
+#define O_CREAT		0000001000	/* not fcntl */
+#define O_TRUNC		0000002000	/* not fcntl */
+#define O_EXCL		0000004000	/* not fcntl */
+#define O_DSYNC		0000020000	/* used to be O_SYNC, see below */
+#define O_NONBLOCK	0000040000
 #if defined(__sparc__) && defined(__arch64__)
-#define O_NDELAY	0x0004
+#define O_NDELAY	0000000004
 #else
-#define O_NDELAY	(0x0004 | O_NONBLOCK)
+#define O_NDELAY	(0000000004 | O_NONBLOCK)
 #endif
-#define O_NOCTTY	0x8000	/* not fcntl */
-#define O_LARGEFILE	0x40000
-#define O_DIRECT        0x100000 /* direct disk access hint */
-#define O_NOATIME	0x200000
-#define O_CLOEXEC	0x400000
+#define O_NOCTTY	0000100000	/* not fcntl */
+#define O_LARGEFILE	0001000000
+#define O_DIRECT        0004000000 /* direct disk access hint */
+#define O_NOATIME	0010000000
+#define O_CLOEXEC	0020000000
 /*
  * Before Linux 2.6.33 only O_DSYNC semantics were implemented, but using
  * the O_SYNC flag.  We continue to use the existing numerical value
@@ -32,12 +32,12 @@
  *
  * Note: __O_SYNC must never be used directly.
  */
-#define __O_SYNC	0x800000
+#define __O_SYNC	0040000000
 #define O_SYNC		(__O_SYNC|O_DSYNC)
 
-#define O_PATH		0x1000000
-#define __O_TMPFILE	0x2000000
-#define OPENAT2_REGULAR	0x4000000
+#define O_PATH		0100000000
+#define __O_TMPFILE	0200000000
+#define OPENAT2_REGULAR	0400000000
 
 #define F_GETOWN	5	/*  for sockets. */
 #define F_SETOWN	6	/*  for sockets. */
-- 
2.53.0

