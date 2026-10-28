Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218070;
	b=ijBq9GkmeHORu5Sfhsumisij2AoUvZVozgWnHBcbfV4PKgk258uvrnuTwIOOF1uVe4qy
	 bMOUFzEaTPKVSRUC6qmo7/qqFMVOIQAIVzBqbBA0Nagbjcay+rb/jFyJ0IXsLY5ZHKGfO
	 RT0zVthKCL2OAH+9HaTD/oRqIlJFJCTor/2PbnU9aGDjKnmIs2iiueoeHCPpBDRJRMBdH
	 irQTiDWUmVc+RWYuenVpeDI9BKlLO7DfarDcxzW/C4XafKLtrXefqvwUXrcOyc9vCsug8
	 uvUxKdgyyzyudBSc0FKNgyVUMEfsZYrf40lVWEzwTLJdf5UuVgmkWDCoF7wz6FMB71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
	b=AZfTxYRYFJzrHRCmfNy7LR36UOCsYBlT/Rx2UQQDqMnZZao/JuYX0Wi8vbWuzhrp9aTf
	 sqrV0lFq+0q+D73+3A4PUoP/76yikveDHXaDO9GxumIVxlGItzkCbo7JPzkd+M/gIFN2L
	 oOnsPp4ImXxIYtot8zoRXI9UsfdoPoNKhZMfJUwTVQojVjHh5SevbcrJTEz7jOkJlbw3M
	 RkbOBSkon5+7Tfz5GuTNe3BZYALU3/KSQvYm/Gn727t97xnSCJqUSBmMD1+Ubnb8dMt3J
	 +ronAcayqKTUwSWEICKNDt8IkGka4Uf2L9K3Of1X1w4SR9vowUzpsDN4NcWmRHQdm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goXdhqWT;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58318606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58318606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goXdhqWT
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso1115535eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218069; x=1793822869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
        b=goXdhqWTJfd+CTvBoGYly7epv4whyvY5KBKcnA+aojnz5OiFwcUJ/q8yH2EYgGvAyr
         GtrBqukrRoYshE1yD4nuOJ94bVch748DtdVEiC0YzG3HJp2AHbNnE4vx+fvN2moDOxSh
         4sWijukY3j2XW8cJv7pBIA16WSnHO4y2v1BoNWAZH8/ZOWNZAjV2u8Rb/7V+87k0bMdy
         rEdjTJGhy9nZgNzp33c3AA6WHs4AR0ryEYoY6zjXWIGnkno4bFZCyKlCljhIGzgwlwea
         MxfZP4Vim86tSEYKG6GZuC2+Gqr7mEaZh0yPHPUgP8z3g21eFKBdNqrql+6UEc4kk1nr
         3k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218069; x=1793822869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EEE0S447H07G14c/bigmjxl8UhVSTm88YqU2YDdK8f8=;
        b=v+hDbKjt7yZSo/HD3GLEXZI6VpVNY5/RXEaoPaMABMFOZyBy/jbaPMEuSYB5/QZzNW
         05gliI4rAUx653Kw1R+HShWY4ICeSC5vKERgxBVUIpwRl1TeShdVgDdG9ppchmVmtlbI
         5RMbWhPC0uE770JPjaeYSccXxzRb90frjN34GRjOcAhXrZdfXHLf0WR6LupdNNTtkPIE
         OP3pQsX8JlGkOehoZtZbSb8K/PVEMKndKu4k4KP3mBBZXLkkUTlAr/AKcg6VmTF848sl
         EGM2q0VuDTWdhAXT1i4bQxhnRJuqSlWH0Xv1oE2zIXurAfjTHS4ATMHE7alayWTJD55R
         D6sA==
X-Forwarded-Encrypted: i=1; AKwUvBygJZvpGI0tM9m8Lo2xqhFlrhFzJVqPyDSuieg3WvGush3qEEmM7DRa3VfW5y/3m0ZhGDUM2w8YiesPSisrKbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBAX1eXaA9dd0leCVoBC849ItVs+4ELQe6ZUG+JKZSbFXOR5OD
	IKgGyRsNwaTwYNVcL7dkOOp9M39hVexUWKDB1/ZYjV3L7A9kFQLFMI1P
X-Gm-Gg: AYBFou2ZcmcGwVFnbikOWUeZS8RIxbe/QzXQjoHVAOL2sRHgIjdngAKX1/zZK+iW767
	d/1gn0fWZqVNtaAJLI1hXVX9+lYOR+ErNyEGx4Lu0Fuxv4MKwrzoFTL4bkEAdDRs/hqUcIB6Sam
	lEnpgJP14X5WpDSza56CcqNMTZxvDFRJFzRayHB1D00rizU+DUNxkA4kbsrRdLpXD6LwU9AOaLY
	7AHHKSZNcYvVgxNgMQAhCNrb5KOZop6Nf8gfFnPKH/g+7bEDZ1sWydgeychHUrWoqcWMrgzTepR
	4EBnhvdf6eQYZM3c4FFZ7E+JoYd7c5lCnQSLCPoHeHIwTDO/VQfWptoxoGA32hV+JPNnCi9k7VM
	Wo0l7EE4cwY//QA82M6HA7VsS5tKTwMtJhD+CWFpaUY4q3ihhGsGXLU+/JSOpAU4Ssht/T7fHHt
	FdPDvVvbgj/SpLzSOM94CnNEylBz9wDWCKY8ZI81VWNqj84p0JNBD1aQYoyxc5qnLD4G60i91sF
	VCd1oFE01DonAZkU9CYWjzSBaRSP0y5YVUF48J1ii96L+udRBZRdYe16o4m29SnPv5xVC8hdZ9B
	Uh9iHwz3xeo2uvZSAcQhC7NPB6iLqdfW8sj4A4MP6bZUI5KYn+dyIwMiVGFfOnWwYrKPbzE=
X-Received: by 2002:a05:6820:151b:b0:6f6:dac4:65e6 with SMTP id 006d021491bc7-713ee08ee78mr2343918eaf.41.1793218069336;
        Wed, 28 Oct 2026 13:07:49 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:48 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/3] tools/nolibc: fix fopen() with the "rb+", "wb+" and "ab+" modes
Date: Wed, 28 Oct 2026 15:07:42 -0500
Message-ID: <20261028200743.154151-3-danishkhateeb03@gmail.com>
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

The C standard allows the '+' of an update mode to come before or after
the 'b', so "rb+" means the same as "r+b". fopen() only looks for the
'+' right after the first character, so it opens a file read-only in
"rb+" mode, and write-only in "wb+" and "ab+" modes. Writing to such a
stream, or reading from it, then fails with EBADF.

Look for the '+' anywhere in the mode string.

Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/stdio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
index 00a95a267d90..205b06f18b4b 100644
--- a/tools/include/nolibc/stdio.h
+++ b/tools/include/nolibc/stdio.h
@@ -75,7 +75,7 @@ FILE *fopen(const char *pathname, const char *mode)
 		SET_ERRNO(EINVAL); return NULL;
 	}
 
-	if (mode[1] == '+')
+	if (strchr(mode, '+'))
 		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
 
 	fd = open(pathname, flags, 0666);
-- 
2.56.0

