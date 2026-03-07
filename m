Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5782DEA9B
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892540; cv=none; b=tLvDEJpZpyGsQjAKleZNvHTnmAZ8P2HNZ3LYNTcqDqQnENyFatVQl1RPAllKZOrnJnJjphGCyawl0TN9x7MsL2C4QzAD6aShxF0LxFHabpfy+Y4O14PE3+LoHBQz7yZPrkYUFYfEvs8gjBQO76BdXM6kJ8kpk1ig7e9GGmBTMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892540; c=relaxed/simple;
	bh=EKC+gjybz5QCo3/A2SoLkAdJ9dHzP8glwvLLU31BmCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+Gq394CNx+fqYDWW3Mx8ztrpVostCRLEnrv+lfk0A4kKIOdP/MX9ImT4dryjP/Gxsl5tsZsooPlHDXm+irfpbnbP91wb0+OT8D92uzTtRNxhKhMnq7W98rTZgkchwpCx6ihRdhWLBBmYK0aesfaUJEc3cYk8k9abk9C7FSLQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb4wDDw+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb4wDDw+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a568f3ccso738081b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Mar 2026 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892538; x=1773497338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE+gTqS6Acm3OjdFoCwcpAog50aFpqNiNU85af164dY=;
        b=Wb4wDDw+bHkQ4QFzd7CHYDyzuX9Cl9DuRHEoFHcFXRQBaG189KJfreVVIKpg0El3ca
         Yuse00bqCOE7lUV8ol5l8BttdYmXWtdgfInJa2s4lr7KWXKlPikHYp9gToDd23z/uFPX
         U+TjbjA09cEMI7QhrOSNztXQQVqWppg93HTKILs6u4qdZ5V720HMM9ubv/3AkShDxd9+
         HRuqnQAn4xWwYR1PHOJdWmJCGECsOSGBGhYLHsia68y4sZd5DPJY4F2d+2aJsGGMLRsr
         F0HGQMF39Ct7hJv9fyZjDVmFUDKFQybmZJkVqkcXWPKPr5N6RY0roySeVDzrZld+y9WG
         fo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892538; x=1773497338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cE+gTqS6Acm3OjdFoCwcpAog50aFpqNiNU85af164dY=;
        b=Yx5Iq2RrLcGCnt1fW8d34zQZOtlEOmVwIPiF4jBHUI3SNawEIlqMNmGTq9GL/UjK72
         I33FdGLDGDwcx0rUUp3rMACa+EkO8RQ0aanDwexvY7EwZZocYukF3aKjljOV+OwuR6Dq
         hAgEAmmxe7QNoG1l7bSfj1ssY2X6R0swep/lVIk9nZ3ga3K3pt89M7ERSPvzvseycMiR
         X0J+5Yh+S1TMDAcTd8t9Scf78F9BuKzQpvAvqa5Ck2ag+glAMmvmuOeQbJEHG2VBUFsy
         l4TuN/rrzaOGNhZpfVFifC63UjIdXTeGWdzhnSeKwt8e2sAKS631rb0M3RBJ8LuA/qXk
         n6Zg==
X-Forwarded-Encrypted: i=1; AJvYcCW46aiuuLVeHbzogSbfGdD4JYSG+cUi7wWMjhWES3l5EcIrfYXzQm03+HZ9VPwCl3vLrGaH2nvy3niFttktsYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HYKPvEI7bYGXZe/j37a9XBh7uGzDCY/5BR3W5xgqRnhmKwFM
	T7pnKYKG7Ci6+tXCz9Dco5HtgvAtvr1TJM203MJW6EUibPXQlNo/F4qR
X-Gm-Gg: ATEYQzxG76cbLKdifTYqCSH/qv0NMV9a6hmShh0zNMw56gSFBwngPtY5c9DqU1Tw+Pi
	k0Up+Kvtl2pN7IVldoDT4i6bUM88M9n/WkQtHYveRqVJIr2/N6sjNm1j7pL6GbJpAcf5CQ6nIeM
	kfyohbIMPFqGi7p93hol0cvP7VAjSkwdtFmpt4iGV1TWRZXtzB2ZMRRNCy1j/jwyOK/TFGGEhCN
	XQ0WWTBxmYKzQn8g6OHC1jnbT0Sg/VLwGZ39ta+ozr52p/a2rr6iMi+IOaB22Wir82VFlFQiZkH
	XSLH89Y/McWe400HFx9KbKpCrooq2oxtporIwgt5LzeaaFrUoozTRp0Sd42phPjLCNduwD357g+
	CEva3vVdfyX8wrOK/47a4cD2l2zeObNEvXf1mgwNPLEBz6gg6re2mx2dD3xBFCJ+yp9VQNqA2Jq
	9eVOBmW7OCpXSe2Hwwi9sm0ODX8v5GlNxsbgAGWi5ZGKpcRUgpTlPW9AQ=
X-Received: by 2002:a05:6a21:700c:b0:366:14ac:e20a with SMTP id adf61e73a8af0-398591082a4mr5640721637.72.1772892538431;
        Sat, 07 Mar 2026 06:08:58 -0800 (PST)
Received: from toolbx ([103.103.35.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm4747313b3a.56.2026.03.07.06.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:08:58 -0800 (PST)
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
Subject: [PATCH v5 4/4] mips/fcntl.h: convert O_* flag macros from hex to octal
Date: Sat,  7 Mar 2026 20:06:46 +0600
Message-ID: <20260307140726.70219-5-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307140726.70219-1-dorjoychy111@gmail.com>
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
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
 arch/mips/include/uapi/asm/fcntl.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/uapi/asm/fcntl.h b/arch/mips/include/uapi/asm/fcntl.h
index 0369a38e3d4f..6aa3f49df17e 100644
--- a/arch/mips/include/uapi/asm/fcntl.h
+++ b/arch/mips/include/uapi/asm/fcntl.h
@@ -11,15 +11,15 @@
 
 #include <asm/sgidefs.h>
 
-#define O_APPEND	0x0008
-#define O_DSYNC		0x0010	/* used to be O_SYNC, see below */
-#define O_NONBLOCK	0x0080
-#define O_CREAT		0x0100	/* not fcntl */
-#define O_TRUNC		0x0200	/* not fcntl */
-#define O_EXCL		0x0400	/* not fcntl */
-#define O_NOCTTY	0x0800	/* not fcntl */
-#define FASYNC		0x1000	/* fcntl, for BSD compatibility */
-#define O_LARGEFILE	0x2000	/* allow large file opens */
+#define O_APPEND	0000010
+#define O_DSYNC		0000020	/* used to be O_SYNC, see below */
+#define O_NONBLOCK	0000200
+#define O_CREAT		0000400	/* not fcntl */
+#define O_TRUNC		0001000	/* not fcntl */
+#define O_EXCL		0002000	/* not fcntl */
+#define O_NOCTTY	0004000	/* not fcntl */
+#define FASYNC		0010000	/* fcntl, for BSD compatibility */
+#define O_LARGEFILE	0020000	/* allow large file opens */
 /*
  * Before Linux 2.6.33 only O_DSYNC semantics were implemented, but using
  * the O_SYNC flag.  We continue to use the existing numerical value
@@ -33,9 +33,9 @@
  *
  * Note: __O_SYNC must never be used directly.
  */
-#define __O_SYNC	0x4000
+#define __O_SYNC	0040000
 #define O_SYNC		(__O_SYNC|O_DSYNC)
-#define O_DIRECT	0x8000	/* direct disk access hint */
+#define O_DIRECT	0100000	/* direct disk access hint */
 
 #define F_GETLK		14
 #define F_SETLK		6
-- 
2.53.0

