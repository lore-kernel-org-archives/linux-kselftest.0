Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96819067C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686043; cv=none; b=oZBzS0pBn0261TVDMK2o7QV2StzZH7IO9mzi/d7Jo+BoUydDJEa75JCGxKvrCWGEveF1RkLsofRtqn5zrsSWE//7BxRs14nnPrQtfU70V4Qnays65+Jygh9i4FbMLy+Z8gkp09tWEgE9B5OD/5BTDZFYpmcPctL9tzpzw1wmvVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686043; c=relaxed/simple;
	bh=EKC+gjybz5QCo3/A2SoLkAdJ9dHzP8glwvLLU31BmCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3QE5U2HQKUHiLHSYjyyv0h28CI20uAiujzwq7x5N/1g/IJXv/P8VSGl33nTPXH41tKGVU/ZEK1XEbPFQ3bzlOzGgNbh8fRXmzlFTmcoAy7Cymu7CUjrPj6YbkpogJ+cU9LwFAcH9U0ZQgYaRg1JAJ8C0fyMXqslhehk5avfbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk2tUUGw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk2tUUGw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a9296b3926so20320165ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 07:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771686042; x=1772290842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE+gTqS6Acm3OjdFoCwcpAog50aFpqNiNU85af164dY=;
        b=Kk2tUUGwvD9uGvq0ltLEbkA6gi0NU9z4MP00tht7MoU2o6bKhEQ6dueKkPeMGPqu3T
         r+i2gbnfgZqBNGm9kfrCE7+uSZaWCNdYObcf3IJCxMQxdP8lSS640twG57Zp/TxJBeCH
         eKkXO17an2qluj9ez+oUTd/Mjhb0d5rImThkDbDzR/Zh2No26sF43Q7+08D7P7ZgelBW
         ac9A19JzfVstuTVnX1ktYq+qhw9iN5VSre+latY9KomlTbH81/2Sw0Il9oIKwc5VdSJ3
         cykMuY6M7c07+TCRFacC4SoRR3WRJCkXs+Tao3xNxLET/B8qr42QlE2DCWV09ZTsAoLd
         g+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771686042; x=1772290842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cE+gTqS6Acm3OjdFoCwcpAog50aFpqNiNU85af164dY=;
        b=rqfCkl4HAAnbQ8C4dI4VkOJRnozvdQNdvlpwxpaIt2+R2EZF/ZVCrO4/UUd7KKL7Au
         C7klvSOXTa5qXZPI1floO8u+nFgcFnvilbNEYN+qQmbJCg1+nCDf9Tt6bOLmdPwx/ocP
         sqJdBcWfzDMS4hY998ILnNMjpwAkOiOchoxL4GChfmB3JUOGW4mNmYMFKhjhoyui6GBR
         NzucgJxZtMh2MvwTni16/FM5Hpr32uchupDX623K0LTndkX/ecL14agad7X7EDgwMwuR
         8Nl2MPMym/mN74LHcT/QkRbnyETTydsrBeBm6RhLFOADh6u2HJNCuEq6/ymBtgplSs+Y
         WHqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTScRzpoT55KjrzE21K/0b4bSb8lwKS88/ahNMoKUG9jL7qdd7ikBdSHF+6nCNWX2iX5g2c+p0KjHO4aZ3ER0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmaJ7Gp1001oNiFbox7M5v7Y64tfRJyjYryeEzGCL2SdnMbdB3
	Di3CE0cPhihz+/82YCNKDes7CTlyhX25EL9VfI48iuK33fLBv/rxKbtm
X-Gm-Gg: AZuq6aKJUnHm4FM2VkHouFUfYuc3YDQcGjN62urAl3mwKbEqvV5h1DlEhhcp9japB/k
	LC2k09E2MnhDi6Iiy+0H2GiNRotCSdyTNhqhGGxyeEUkQGHURSvKHWzuJUIgDppj/WTkAGiN2Dd
	txkF2RFABOClnouPh6AEAGm4s1Vm/zSKOuODbxIr8IcazE9eotc7Rd4cjs1+Yd+pBm0ciVUhBDM
	iC8PikqI7MprtCC9XbRw0ZepVyxA1A4kWXkxiU5dy3I9O9khvJBMvoSNw7xm9S4yqEzu+net7Bf
	VQCmUzWz+trB1hHTf9q5cg2Zx1Y0u8KglNlbVuVGC/CFJ8y3AQBIEQ5Qb8FpfOjJQw8by2ntjbq
	6Ck2Ju+KczdcgCXV+9QJmSDxipp/1QZUzwSeCdwHe8up5gCwcdKqceYD6GKC0slIEk/G4H5Brvh
	GWSRMLftz8iKJLzPbEgcQf9IEw6n/+oWUJZsI/NFqa7Mg8gGDQs5WPq/A=
X-Received: by 2002:a17:902:ce90:b0:2a9:5b28:94c0 with SMTP id d9443c01a7336-2ad744e13bemr26077275ad.27.1771686041931;
        Sat, 21 Feb 2026 07:00:41 -0800 (PST)
Received: from toolbx ([103.230.182.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm23730205ad.79.2026.02.21.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 07:00:41 -0800 (PST)
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
Subject: [PATCH v4 4/4] mips/fcntl.h: convert O_* flag macros from hex to octal
Date: Sat, 21 Feb 2026 20:45:46 +0600
Message-ID: <20260221145915.81749-5-dorjoychy111@gmail.com>
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

