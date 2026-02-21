Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE21FBC8C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686033; cv=none; b=aUXlv7B1/11wzr1xd7INxNa2hApCeWnneGgxAu1QLMjkW3Nml6bIjE5Sa4iK9Rx7q382irUpia4xb/CSBN48MUdahcDsFkh/sdtbWBLA6vBLAW/S1TVvWhNG8DaUD0DvsbBoIJcWAuqGEDxkOtRC59VKY94iCAAm/uK9RgxPlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686033; c=relaxed/simple;
	bh=Q9dm8LTnk+DFIEJAAB7tpFWixf8EizWYmak8EK7I1tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gB8UPSJdse6gN/A7dOZp3/ql05SaFkBMmeoqsQoVhQBHsTDxYj7i6PXpjihMysdZNs4fP9EE9G14EvLIyhRgIt8/D3/m1juHkasQWL8XhdQ9x+aztIlel2HmoFyY5NL9zcO7PPjEYvv5sroAavcVe/BGgrpDuH2dtKocz9aX1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoaEikxV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoaEikxV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a79ded11a2so19975395ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771686031; x=1772290831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4HfR25bhfBsIe8RbNyIL8PstGgybd8nsB9r91rb4k4=;
        b=QoaEikxVe/VW7CptlKiNICAD7tmpMMr/0J6YPt6eQkP8r/WCydBth99dNPZxzAKuMn
         TbekW7sldSxTzRiJgJoXrVTE0eEUEkndwOd4gdZR46OwGIcRkowvRRsii8YTzZ9wmd9b
         MM1PwVAxKzfjmkC1e/+43i74vv3vZZlItHtE3tDmVluhHbc7h9vdWtJ3pY3SKCQGX8hV
         LBxq9wug25zAWMiCy+x2XRNQx7FsFkYiiQ6YeGx8nJe6lFnfkK78jjzLZymWFBopfsK3
         TeTxenm3ODXomdKlTJhkRntV2r2OTqr3JMM6tc3rctw14sshcD2rZPUNPPt9gHlWZ/5k
         Y/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771686031; x=1772290831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4HfR25bhfBsIe8RbNyIL8PstGgybd8nsB9r91rb4k4=;
        b=BBUubxM8nLUj0Lzpqc6QTu1SyvI8u7uzcJCu+o7Tu27brpnPv+Op07+lnC9g2WMKm9
         pfk0pO6CQJe+kkkItD7R+oNFJl0RdUsh0udDeaZ0GaLOz6zX0Fun5SJiAoijwDQx/hr9
         wxXi1+2WCSUnF/Wqp80gmCcZXSN8g1Ys3Ux8+oyz7v7PZgMOgq0U0USHP9O0r7GalMq4
         QoF6bXTO15mC3MWmZuShpfHeQ5jhfBeUDF4NgptwWnn9NU/aoRuP1z3H6ZCsNi0xc3Ot
         /VgsHZ0Eer8NAgUS3pQsDlhiTSEnWNDMZPbk1k9a71OBWZj/ZxqLq0Xg7hjMd09eHTVL
         m8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTHu6OAJhhVFvmOC6kDvVlTJxlU285/PRM3TCISvXXuTWJX0Ig6jcluxLbxIfxKzmeT0UJ4jmvNLgr9vGgDLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPBlFWYwOmI99DZlX6lpb1/g3iWJqRAw2gkjAHvNuAWiHzCL3e
	dyV1Crn6KIzjOZD24BOrWwabeFxbSTcf0/tJuhEwEjS9vfZsG5lObLRG
X-Gm-Gg: AZuq6aKQeWLPoTZgCsR72kkJ+h0wVHRQRikcNJjzB+Bxe7cC2h5rUoMlJph6M5CCc9j
	GXqxKK4AKnqF+8/fckM1Btdh55vUKBa0kFteNYjhU78undZz6mdyqhX0Rqo8VN2ok3Zb3atYudB
	UQXyPbc0MITIqH0B1ssK8ULCKpAP3s+eABEYL00wGHRT8cGhK4y3ocuN1zga1Wc4b3gFzy2pwqA
	GheKAhYjKtklSwDSr6V0/rMgMMG3/hy8sEFtvhNMieydexHmZyle+y+ec66cPqs0hsOstwVH8o6
	zFz1Zuhssq8aif7DH0qMWuEZjGuNfRLohREMedaiBCYoDitlk6ejOe1hW84nQEBu6INviXSQzs1
	XusRYVl/XV/1DExOhBIZA3T08yX2pk11YcAySmNc8ZyiGmU0xtQ7sGYjqgK0xeoErhjoQOy7n+I
	iyyFYi0+Z+boUilGrejWPqX3gy0/gUY6b+antvLQeraGKe5crOzoQ0KG4=
X-Received: by 2002:a17:903:3510:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2ad743fe17amr28627765ad.5.1771686027291;
        Sat, 21 Feb 2026 07:00:27 -0800 (PST)
Received: from toolbx ([103.230.182.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm23730205ad.79.2026.02.21.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 07:00:27 -0800 (PST)
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
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
Subject: [PATCH v4 3/4] sparc/fcntl.h: convert O_* flag macros from hex to octal
Date: Sat, 21 Feb 2026 20:45:45 +0600
Message-ID: <20260221145915.81749-4-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221145915.81749-1-dorjoychy111@gmail.com>
References: <20260221145915.81749-1-dorjoychy111@gmail.com>
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

