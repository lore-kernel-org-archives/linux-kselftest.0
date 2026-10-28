Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218069;
	b=T2htyufUXjMa+dJBwDjKLb7nG5nb9CCNpDqnK4TGDIlrKMHiClKNIPINv1Cl+zc25+ki
	 CsYySxp8up81DYgNpgiDI/WvL0ye2Z9ioA+6+fFMNFpQT2xPvJ+7cCxpsmkzNNHGXwKNV
	 KnIVbpLmH/opMEWlTqQFJ2NmdweHOfFGsKzFOYetVhKV0QCS9eaX1cfnXUzTqYPA2igHE
	 KxRg/lmCD0fVyyWT/iQaRCRP60Ntnie4BOOrzYpAhPasxXHt/O9pu02MojTurN+zs1VI4
	 Zk8LNd09JJMkg+SjHYA6Fhkbp9QKy3kmijnO5O03ZCXhIGDc0kLcAQNQOaZiu+BY71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
	b=C3tvxJZDuD6d6b+DMacvdxF3gKSTjxWhWuE/LWNCkf546O1zGuhjWrjay+ai4Gxkf4fQ
	 lrxqSQKt2lK0OKcIFlcC0C5P+lEMzYtaBv9jmmsg55hIqmXWOiqhWM7Ou0BkO9yV/BZIh
	 CRdAXMEdPB3hcS53x+0FbwfSD2/9xB0QcOK/sdB+zEybFsjeeKYk90RcnV788O2Ln8q+a
	 0Ek28/Yf7szQZXlDhVWFKtGfnhpG5lJbe8r6tPHI4dHxlWzz0/kN8OIoHQZffoKUwWdTi
	 JFeC0jfknHTkpwYOpWTV1iUyQwaklmiQlAFc86OlFrFScR6LI35vIc2B5FGrtryZ+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHfr7qP;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D0606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6D0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHfr7qP
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1115520eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218067; x=1793822867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
        b=YtHfr7qPjSYo96TVPgIMHoy8TBA2zUpb+VWu3s4l+GYonVMnKgWsOoiF2MHC7T5Aiu
         a8QeoYoB/RxiaqXFiAxtLlLym5Yh1X2BCJqzlz6Zxy1HAa71p84IBQLq6/U/hJ9XDIwz
         1RyC2Vz90wgp9orha9NteWCbpe/Bx9GndPp1lUyKYhz4W5d1b3fZ5DHyFROdd3TP209E
         Lr0RVF2c34MlgbcKiClhiInQkrAhesp0GTt42Zp6sVt5+DVmunNJ9xxusTlokYLkH0mQ
         fEglLI95ubsTdGN/s4Y6EqFYE0IEnuHJh01m50A9Egw+uegxkzSMJRe9x4q56xCV95CY
         beGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218067; x=1793822867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU15C9lGWv33DmyhVTu5h/6S42IJzqFMS8tB7NUy6cw=;
        b=Rh41J6GY5r/OC7VEd9Ij+VS9wq4bLxQdy/M54HLKV643zQ1SL6ZWLR+rdI2psAVDnM
         YoPzw26XAwhar+5q2T4vFkTa6k4+Iw3141J0znBWI/HzsgwX/2+VMhpZoBa6G84siDYb
         0EFy1msATiHYKBemYio9KcGo0c8wydePuXULp7X/nNVc4k7sYcEYf8XItPP3+VJH9ccQ
         2+SQ3Uwm0gUJ0u732XtpHxDQifRhw/QDTiSwy/ONoiSkL16L0kjSOxU3OseO4zwub7jY
         VmBkagbpgkB6g0G0mE3eCAXbHi+zCHnNE5EUb/UNb/6iiXUGe8uM/kN0QPAhj2LK8981
         kTaQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ/oYot7+HFxAxRqneDRyI9UCfQmmDIOv17BPxAMaEoPp+XThmLBWk2SqVB5RmhqX0A9SKf6ud1OpNE0VsrgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUYzNda2UY1D44d6E/B7veR6WlCuxytYifNT6Co8eBGZLBYYNa
	2wjga7NxIMwuVw8dTCO5MLoeKHJvYU2z8T7kPrlGh/8OKcAjfgjLHAuH
X-Gm-Gg: AYBFou0kvhVGu3b770xUxDL6bE+ORBzmhc0PDBMrmnDJ/zb2t2lDQDD+JHyP4gmE1dC
	PE7qKN+Tjn7aMPUVmIxMJXT5MAOUh5vz/ngKztJy4hnk3Ix6Vv52QFLJlWRIXfSW9ba6QgwgtH2
	16VRiMxRt9Qz3eG1eWQRRe/y1JUP2IF00uJ7HNmnyN3QKzbGacCxTffEi+uGKQv1vpLnqgSGrZt
	ePK+ICBfmUcJNuDFuKSrCv3gWt3K8IF7T+RU6yi08fc93W+GlvZvBPBkCaODCu41XuTuRFOKrOz
	Ae0v3Sva9eBLTcGGLqSiLIw7r5tOxKhnnN6jctH68SJ3QPV3LfO14j0y0E/Xbn9xWmXqt9n9pBk
	GvlPR3UxEu7HDfL4dvDURavEraaOMISL+4lrXT0ioF9TvUMpw6alY/5VCJQXnSXzmUGzYOFGfh7
	LmfW+mioFfeh1JxPODFqz/ENGqV5TKFNxaQnOO9Ac7LxL5wu+fdGaKREiRlzb65gEOuWbgLXmHH
	hyF/1owvWsGO2K0HnqFTJ7iSHlGJMqh1LDUO7oxmQ6PvBJWpz4MiXiPn69QPQnru1KOfgXFWKWE
	b+ol8QEQJWoBPmf8HIcGwC1hCHM+0izIe9DqlcjV8Cblygsn0WeZdcSQG4xxgHF+uwp76e4=
X-Received: by 2002:a05:6820:828:b0:6c3:2390:c293 with SMTP id 006d021491bc7-713edca6654mr2114633eaf.32.1793218067584;
        Wed, 28 Oct 2026 13:07:47 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:47 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/3] tools/nolibc: fix fopen() errno when open() fails
Date: Wed, 28 Oct 2026 15:07:41 -0500
Message-ID: <20261028200743.154151-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200743.154151-1-danishkhateeb03@gmail.com>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
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

When open() fails, fopen() passes its -1 on to fdopen(), which sets
errno to EBADF and so overwrites the error from open(). A missing file
is reported as EBADF instead of ENOENT, and a file without permission as
EBADF instead of EACCES.

Return NULL as soon as open() fails, leaving its errno in place.

Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdio.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index ebdd413d13ec..00a95a267d90 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -79,6 +79,9 @@ FILE *fopen(const char *pathname, const char *mode)
 		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
 
 	fd = open(pathname, flags, 0666);
+	if (fd < 0)
+		return NULL;
+
 	return fdopen(fd, mode);
 }
 
-- 
2.56.0

