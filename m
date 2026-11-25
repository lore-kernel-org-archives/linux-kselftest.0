Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630499;
	b=h5LvQ74EVdt4Z54uVSDZAUAxP3InS7XFbpZ6nFJ30SJgOSrKeFeMPRnnXzigIQU2+TpI
	 wQ63I8nJFlN4AvJSiV3lBZpB1EuGW7b8It3JpxJ6EnUkznK/sPp2fwkYkhGUV0sH5l/tx
	 pQxqAfPNArMPDoxPBDqMYB2CsDBgRXotFN9CXof7obDnTYMWjDRtAHt37KlZiSxOwg4MO
	 dR+lcffX4HaZRHhrT6LFPDAYV8U7qhRGX1e5DRvUvEO1VaRhOR1+GERwRrhl2s5CQfFIP
	 qOkBef6Xgj154Ju326LpF5utpd/6eBTzM3gyPywhg1mOd1eh8z09qnZtYkYYDqSkGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
	b=C/AMRssA3Yj8QfrMgBWRidgnASQveue4ZVd+Q1woO3HIfyylDvbLyFFTmEZ2HlAqh+Gt
	 ohRS8EKW92UqZSLEpY5tX5FpkxiTofJ2O/XOuPlFgBB66f3gY6oN1V3zJ6JytsdQzKSVl
	 w9LWwTlaAIxTfB2hhCff+5rfBgYDi1YkswgrqHZfmJdyOzq9oz8K0w1qDteY+PDnApXGG
	 v+h8urGQdfQmKkiG21fLwZUBFTMOd8kUrCTRiMmxBnYf2OR+38vfURVC4+rw0MCnBNa3f
	 IR27CPyp5fxjeOO3sIJO2whDrDexNISE8S3/8vmHz5M/1V31SbLv7z/n13LhndoAUVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDOT7tOH;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D958606A696
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D958606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDOT7tOH
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4efdc8c20so37520917b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630496; x=1796235296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
        b=qDOT7tOH0yEyKtTGHuPGtwNIe23KLKgYLOYamckSwZfDJrX6/t3m7FR+zwsEYBPXmz
         nRHwaRyVVwXKQMhDYuFH7r+OO1n8yx1BhSW+HpDwMP9kq2x6qpsAkRVjeax73hi2zQhg
         zwdXIiW/s3m5BKZSuvjtKS0oCt1W2wTIqVUqYJExyiGg8emOfDtorhZEq++vDln/r16W
         CA9G5yG02X9zGcXwJpIfJHef/Xg9CrnmipqljW9KTsix0AIdWuHzyPivm8CMOCNxvFZ9
         p7Pcx6uQp0oGuU1TIIqT/XoagYtWEkEwta1Bde2g0BmbJN5Ee99OGGeNgKs/E4aWzYoG
         YEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630496; x=1796235296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVuTcz49Q9b2+slht8YsCMlxCLCkOo7/QKC3OMQMooE=;
        b=LmO7L27jMaQpE1DwVuzYcotd42jF1ZFey1C+F72a1CqKtRBTFQF+EN+KEeGgucQITH
         rkehoGD3tSlSRE3OamHqhtW/S3k20Zs9/3F3E037MqVoKVWxGKG+FnJDKnl20QUJUpV6
         kacPAzBsQuJW4Zi4fcah6wdwDtNRh1PlfNkWdAr9MyeYAvUkXvK/wHU4d7TkgpDhEelH
         9SMdeiUdd4wx2vYFrSco6QoEphCCFROz5hJxUPO/HSfVKIbaMa2sk0bNgq41kIbpUc7O
         n6FOTkpH1wu5YSM3LfPsmwhtJl/XKRkXbKyWN8AVGM5Jxn4iYTlZuuW7j+oIavtVObfD
         t/dw==
X-Forwarded-Encrypted: i=1; AL+hErFEMScEDLK8FEaYgi0sx3IH0u/aHPt2q2SD0h9KhP8wdjVVEHczMVabKpNDK0/OjhSsRKpOZl7qKu5miBJ4WRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z84HwUcp8PXqeVHoz2sA1qkWYZBlP8WqCitghDuL6oaudj1Vrz0
	3xJ7K8LNDXtrkvYnZ3eXHm9x2qm8DFJQ1wyOjsY1EWls0Vjueh+1Y7GFshP4SwY=
X-Gm-Gg: AZFdTZcjUHcKOpZ0gGdiAoig4TY+fh4DnDStHK4vsUDQjVcFpOBk2zJOmqyjxu32HJY
	rzvwmaaC1zUzYTRJdDR8TqjVWOCPxiFLNsQhN+viH0lKxZhb09WTXL4wq/mTpngK3Y0nEjc69L/
	oNxg/aeEi6mO4tuVrK4NmU/HaMq8dX4mraOCMGgTiCQJFWfAE4Y4EAdwxgG09IEZq0337MiAjM3
	YIPLAYMq5MOFt8Q7MjziVHtbCuYsVpqEad+VAqPEnpD+dm2oeIv5xIfHU4/nRqU0atPvSGkZm32
	USOfGGKv0pnu64kJ+EF9sLmuanYPXwULFySAeTBHtdtf7jpsKbJLtdDAheetoT7pJCft6V4m+0H
	4aH35hFMsLk0KUeP4xOIwREbBZRcg0OQetlWk4ypLjjV7zOQGhJGtaIw3sPieNwnOVzovplNOTs
	yQxUgsgVFkS4pDzPJ4dtmG1XORtC9N6CvAHMFnvSHXz2qx6IXOhCF0UsNT1+vMAsdQkT0ccDHrh
	oVqX3uAMK5RqZ+EKNq0hHHZahWgtHvLsTilhqg0RMX6n1Z43KfZJyo5iL+1OUZQ7Na4csM/JwVt
	hblzKH5r5xTiOQ==
X-Received: by 2002:a05:690c:2a48:b0:8b4:d8f4:8ccd with SMTP id 00721157ae682-8b52042e7abmr80135727b3.12.1795630496306;
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/3] tools/nolibc: fix strstr() with an empty needle
Date: Wed, 25 Nov 2026 12:14:52 -0600
Message-ID: <20261125181453.814976-3-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125181453.814976-1-svav2021@gmail.com>
References: <20261125181453.814976-1-svav2021@gmail.com>
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

The C standard says that strstr() returns the haystack if the needle is
an empty string. nolibc returns NULL instead.

Return the haystack in that case and add a test case.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/string.h                | 2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 2693b9bef43a6..191a3bc8af29f 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -312,7 +312,7 @@ char *strstr(const char *haystack, const char *needle)
 
 	len_needle = strlen(needle);
 	if (!len_needle)
-		return NULL;
+		return (char *)haystack;
 
 	len_haystack = strlen(haystack);
 	while (len_haystack >= len_needle) {
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 9e1d0f3afb901..971a7f48e016d 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2046,6 +2046,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(strstr_foobar_foo);  EXPECT_STREQ(1, strstr("foobar", "foo"), "foobar"); break;
 		CASE_TEST(strstr_foobar_bar);  EXPECT_STREQ(1, strstr("foobar", "bar"), "bar"); break;
 		CASE_TEST(strstr_foobar_baz);  EXPECT_PTREQ(1, strstr("foobar", "baz"), NULL); break;
+		CASE_TEST(strstr_foobar_empty); EXPECT_STREQ(1, strstr("foo", ""), "foo"); break;
 		CASE_TEST(memcmp_20_20);       EXPECT_EQ(1, memcmp("aaa\x20", "aaa\x20", 4), 0); break;
 		CASE_TEST(memcmp_20_60);       EXPECT_LT(1, memcmp("aaa\x20", "aaa\x60", 4), 0); break;
 		CASE_TEST(memcmp_60_20);       EXPECT_GT(1, memcmp("aaa\x60", "aaa\x20", 4), 0); break;
-- 
2.47.3

