Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218071;
	b=KywlNTmmU+Ch9JE2ifaQKtx2whzU68towEdbBf0/eSj5XcVGDBpsoCJ2k0cxMDeOmTY8
	 ilAfhV7hhHwzoTxhbavdMPGhaWIy2QXXyMbsRz66zvotDF0qglrA8JV/xq0PmFd18OsTi
	 OrRvg2pbBeiUJlVaf7gwCZf5IBLF2q2l02u28cQe8q28VN6w1RsvYBYrbk5pCtqs5nCsx
	 6U/PH5oE+F03eeGCnI2kg5yJdtLp/t6aOQj++wKNA3iWoYnJNfns+WlOtV2MyMx6xKhGM
	 r7kaO/67BKJekcVnr3UBCC/Qe7aOJmbfXSZoNXnrW5AS8SlY6egeXY1mdO70kpC2VOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
	b=3n7hxiv4XCIJ+gqCohzPuhesEFmEbkNJamgcctEa/IxvJesc3smtaSdHI0bQBt4j/m2O
	 Ip+9qwZ4PxbOS0p0LEyskBF1+5otUHbaQMBoqxNf4m1+OoUvOoEmIfeeDLRCWk4TBxOKk
	 8jsyo+4tYa8AureukMIcpEUC+A1A8xVd+waqLvJ6nWksUZNxm2ah+4Jk+s41VfLNmRSxO
	 GD2CgleldmSG79qMbGGTvjHZSfPgCAVEx2vil8subLmRBKHqjDdQOL5YEdda/B0PGWRyo
	 K7c/xo6cVdn6y2ZLPy6QetBY9RndIkVOZra9BRfMbUZP1wtR75/1mZnERkJWDuAyWMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv2yY5bC;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49215606A338
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49215606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv2yY5bC
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85ac281604dso750500a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218070; x=1793822870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
        b=Yv2yY5bCMtedG56M+matoiFXdcZTzrCvxxmk9VtZNA42QRT7hjNx0ivck+SsYuzKNd
         gU7ZJ1sOnYdLXuOSXe7A2r/KrJQsZXdcayOC1hjZJsseX59OABaTVNdgFd3uPZVq+uRg
         zgfcIAGsqJXItpfb11g4Pz0Gmu9IFGPgQdBHfqBB5MRtXUVfoAXI5wc63N9JIWUZpVXQ
         4IfnReIyQCyYtu0FT6LE2DY4tP45SVhUCaqoPhcP1x7Uipud71YNRNN7MWz61buBJWIa
         KnNre1ueV04832QeOIyaZx8I8CBKDAVX5F+clVSelbdWz19wdRGYaYBsLI3JAmblo8lA
         fvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218070; x=1793822870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45B3EYVV7L9uR4EJrE7Zfbp22ck+MWK5PE+WpGQpSrM=;
        b=Hev9clTlokQI2gx2pmGxWMygfzHmLKQAnPIPm7DmGYV0VORJrmFdxi/haRFEzKa4HV
         /rzo1yC/mZDs1m6W4kLHiiEibtWGATvFAlciDxnMrTE1dyeaQUYvuXdtoBPbw4hYiHvz
         BH0Y1wOpq/8/HTBA7TAdJHXHFfXIoo3xSVeHlYoIbcgNKlR40QKggZ4ZReP/miznQVAx
         SWxcpdRJQGjgp+1OCQfTdb5vQTM8V8kE5aTPUrfiPa8sMI1DcTViUsmvSP/140rAiGAB
         Xu72dZUu1cMAxdiLY3jHpPLW8unR9yC7R8qb2HPeHCpjLm7vP1iCFHuMBDhtpk8Ph5m5
         vwSA==
X-Forwarded-Encrypted: i=1; AKwUvBwuGUgSoOaBBQlX6cQ0+1Zwq6sjwARkYhEj9972aoIicL2ug70PjZf8BQhFV4AaLkmpKjkr6C+hi+mm7lX6e60=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRjgOTlt2O/6S9OhevIBxWPNhZ0eb1z3tCPd2PUEuPxq4ZwSYU
	/ilPn6U8GA4c97MhJqpuIGN5QPqGM8qH4n7XBnI6QKLpc4nMSwNWaG54
X-Gm-Gg: AYBFou3BAa/4VHCxZw5j/mhVObkGFU4i7zgrKtZlNA2HNF7XAKYVy2wPBl4IOSxzA/4
	w9y9MSvPSQB2yYdRRqDFU7tnmFc07o29gd9UnJfAQmbvRQX8/n5TLohRnedIbrrasU3r5wUMz3c
	zpVl2rZp3ivqXIsGEryJ0Sg8HiD+aXapuV5xKx67bQnIHBOtjUJmNTaNFpkrpQFY/oGjHUrMG/K
	6fIIKCiM2pA94g/qPnMXft5rmAoz8h6HOPA04+R0BlTFIkpj5pGn3lKO/VcgOuHVcGccACsLBAW
	fiZgMighaYg/ovcld2eCg6ZmW4TU6hpCRSBCbAy/ud3eC+Fzz7aSrsSo7ZEr0vvXk65hMnhv77e
	EcnURmZmcYbK+TMSfsMHX4D9w+vQW01uIKdd1/WTWTO22mnDp8cUnx9BWwhpaw+tNSxDAGXyva3
	pg44CJ4D5drshH4V2QqPcwol6eG8W/TT2vQfKNzkm4baOmJRZbIu8dJkVoQajWk0oNi8wYmtMcT
	EDn2MdtOdYFFWx3b4CC8PVSLuauF6bBGRAIQNBoUJ2GIsoW09u0LQjdsYuEBeaN/+xxuBkK0LG+
	UllIm5Ye0G1gU8BoctrZ/IsXOZA6gzD0GLARNaMpQpayX4u3yAGREe1PCWBymbl3nAIfydE=
X-Received: by 2002:a05:6820:1394:b0:70d:d3a7:24d3 with SMTP id 006d021491bc7-713ee089ee5mr1973598eaf.24.1793218070241;
        Wed, 28 Oct 2026 13:07:50 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142cc3982esm2275539eaf.11.2026.10.28.13.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:07:49 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 3/3] selftests/nolibc: test fopen() errors and update modes
Date: Wed, 28 Oct 2026 15:07:43 -0500
Message-ID: <20261028200743.154151-4-danishkhateeb03@gmail.com>
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

Check that fopen() of a missing file fails with ENOENT, and that a
stream opened in "rb+" or "wb+" mode can be both read and written.

Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index f3d0d27cdbe1..be501b5298d7 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1035,6 +1035,27 @@ int test_file_stream_wsr(void)
 	return 0;
 }
 
+/* checks that a stream opened with <mode> is readable and writable */
+int test_fopen_rw(const char *mode)
+{
+	FILE *f;
+	char c;
+	int r;
+
+	f = fopen("/dev/null", mode);
+	if (!f)
+		return -1;
+
+	/* reading /dev/null hits end-of-file, so a write may follow */
+	errno = 0;
+	r = fread(&c, 1, 1, f) != 0 || errno || fwrite("x", 1, 1, f) != 1;
+
+	if (fclose(f) == EOF)
+		return -1;
+
+	return r ? -1 : 0;
+}
+
 enum fork_type {
 	FORK_STANDARD,
 	FORK_VFORK,
@@ -1759,6 +1780,9 @@ int run_syscall(int min, int max)
 		CASE_TEST(fdopendir_notdir);  EXPECT_SYSER(1, (uintptr_t)fdopendir(STDIN_FILENO), (uintptr_t)NULL, ENOTDIR); break;
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
 		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
+		CASE_TEST(fopen_blah);        EXPECT_PTRER(1, fopen("/proc/self/blah", "r"), NULL, ENOENT); break;
+		CASE_TEST(fopen_rb_plus);     EXPECT_SYSZR(1, test_fopen_rw("rb+")); break;
+		CASE_TEST(fopen_wb_plus);     EXPECT_SYSZR(1, test_fopen_rw("wb+")); break;
 		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
 		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
-- 
2.56.0

