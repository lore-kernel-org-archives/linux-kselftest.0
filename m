Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F0236920D
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179592; cv=none; b=JAgJMsEa2rmji92220nL100e/VW6d9zsvvdwlWJEqHpoD/RgVTQTErroII8Mk9ZTsD+iJbww56sB0ywH7vKh49vStwUU/bJnHMPsOIhQsi5mFnCAImz88Ov7FF5/eXE7UIpC7bo3OpDE6IwnaBhU4meVTXl7pd+vLagICrDb2pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179592; c=relaxed/simple;
	bh=uuNTx4qc25JmiOtcSrZROc24eW3q0s0py3Ks6ODa+Po=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuB+TsCXI0CkRpiQit4PQaHBB6bmJKpONfCkB1SH49f2sEYJUKvPX+m0lIuOYDXvmQAaMlg8bV6UiBczRYCxUVAvxkNi+32iv4PacgWB0IBUk5oExbVVteD+IsmU1e6Cw3C6UXzpeYXVanKqFChPj5qX1dpk92s8vgO1hQbplsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YBZR1kCO; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YBZR1kCO"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-914b4be9c4bso813709285a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179587; x=1780784387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTj0tA/bHNpv873y+awGsfoidHwlRovW0AIu32f5CU8=;
        b=YBZR1kCO+cVsB30CoEvIEbqeAFusIfaEDphvXJfAZRGbfyQpB2dBXuiKt7BUzhRKi4
         G9UR79BIDTBExj5vIaPEVZd6f0NdDn2Y8jkWrWIaJ0G+GZ7w/v/HMK/KDKLLQvCq76H0
         aro2OS/5v4gnBVq7emDCrR4jsGCMgTaOexavhALohtf4G6qB+zpetFfehVtBeKxGNRFh
         qjAaMiC20Jb/Iu7I3xdgX5uguKu6flyJywld+x0lViXrz0Sxdw9/H9j8NAi/Xq/1X9M5
         RBe/ROQaGtB+A0M3VC80F9s6VKNFjqTT3jnnCe6vC2c+hPGOjYIt+RE458v07jxVKZEx
         8i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179587; x=1780784387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTj0tA/bHNpv873y+awGsfoidHwlRovW0AIu32f5CU8=;
        b=KEGy5Wfzs+lTEyy8TaxkTq8i4TCUOdikmP7Pb282ZvIgobABLKEloAy5fd27C3Th83
         A9BNHeuqlKB027KJLPKND6W8gspRh8b/6+NDDpI9K+A3b6EHUWNUTWxtZ3Az0VqkagKK
         NR4zZAL6S+w1rGLB1OKX4pwVLru4a0DYi601rw5MBhxfOWcDFhXiJKxnM2/0nFFzin2a
         VcItrodGEj9iUH2C3kaCNaAKTuurFsParPjCCB1EmeAZyKTG24mJTTGNFnMDdIc6bUeR
         Ne4fv01NN2JPbEscFHG1Nxy0eLS5tJd5Q0dbpet9Y9iIR2z8/Y+8NkeJb5ZfoqlHsdpp
         TC+w==
X-Gm-Message-State: AOJu0Yxexuv04gLWLS9LAakJ9cWOtxIQem25oCTfrJE2mwxJA/i7sRRI
	Z8obAuVGh0DHPNTu4BSplCSmzei3e/DLsl6GvxohSi2feVe4WWebVW3dZRgGXBjBIgxv8yqB/Ol
	KZuXL
X-Gm-Gg: Acq92OFLpDcfQI/OJQSBDFwYr2IIHN2rfOn5hjYGvx2YA3+Elhkp4DO7cIK+f6Yev4t
	9jWaQlt9JHyWrceAOqUH+mdGIk17k00+zw9d1bcMnHmtjYedw7LD30YwS/k5pIWqqU84E5xzJt8
	nwy6qav6JDJjMuC8Lfzy6VZWotZPpc9nh8wT2fw+vjbOTFM2m1rPjtP1zIufCyc7aaRjzxlQY7V
	QyhP+nW0gEqp1Jz0KwriuC7eEOFcY6ob2PmCrG2tYTZpCrUpEKTlSkW40zYLhPvonsrVwPQCF59
	UW5UCJX0cEKHCFm+REhANFmhLGMaYGg6x57YCBX0WJTRIUXXsosnUK+71HXgChit+h/DQvsvf5f
	58AsIO24gvCKVMwi6Doay9jn27XgrIqCj9h8R5dmtA7wZpbf/xjLdkN6KbbU92Kx6ccEiMnUMzh
	tj93AoP1I8Mv6mqZasdbDwkbR+PjkptX0eAJL5d7Gy1WXY9ssCmthw1vGTQZHsKg==
X-Received: by 2002:a05:620a:2610:b0:8f8:cdd0:df82 with SMTP id af79cd13be357-9153dcb4b99mr859487985a.58.1780179586864;
        Sat, 30 May 2026 15:19:46 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:45 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Sat, 30 May 2026 22:19:27 +0000
Message-ID: <20260530221938.115978-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 146414933977..8d9201c25412 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
-	if (err < 0)
-		goto  err_put_fd;
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_retrieve_file(&session->file_set, argp->token, &file);
+		if (err < 0) {
+			put_unused_fd(argp->fd);
+			return err;
+		}
+	}
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
-	if (err)
-		goto err_put_file;
+	if (err) {
+		fput(file);
+		put_unused_fd(argp->fd);
+		return err;
+	}
 
 	fd_install(argp->fd, file);
 
 	return 0;
-
-err_put_file:
-	fput(file);
-err_put_fd:
-	put_unused_fd(argp->fd);
-
-	return err;
 }
 
 static int luo_session_finish(struct luo_session *session,
-- 
2.53.0

