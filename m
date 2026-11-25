Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630497;
	b=D9eW1vghPj7FgWThH8sZjYbBsCAkGq0vULFvQeJRZj5KTiioe17gjtvFqtjZxhCbAHwi
	 WlBHqyNoB8QKzDlBY3eWmZg/d24jsYFf4PmKYzBctUPcftdlJxCsnhHEpzeB1QDQxd2jQ
	 upABDIlhw7+QlgnYGCrBZeniK8T2tydFadofPbcrAE3r4betjvF2yzl0+Oxq3Ap/URJlz
	 lM8LHKzLL2HVHHCJyTKnGVm1jxyWwYno0Ef9ro5lLSP2RAjzlwTVTeiE0lDVWTvpJmo6Q
	 MrCAHunJ1IJxoqQO+9l2O2da5tQ8/k8nJ5vV697YkEPNzqtLvuPwWO0L4UhiqVIRcfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
	b=lfdUAlIDa9i9Mx/Z/PyxUc9LDwooaebgWkJBWIbjUkU39GWoeZnAOVToFBuu8486Z4uK
	 thNgmJxSGNEC/91thPa/7Dmq1vF9aYGPQX3AUBVo8eVfw0rUy9vqvFkIqaSRsYNZZUEtY
	 YXDnRXkNNKXCHZzBMIGBpeLLz2Eb3CrU7hGUPfGqfivsth88IA/ThEu4Pu4ARqHjMBKUu
	 gqd0PYFpGjOha3uOBfDx23Zp8LUGrrOJD5E67JQQnLlNeqkO4j/F//rMnmG5avWBkeylx
	 ldi798pgJnVqmmjqD1m8C8r6R3Q5BQE411VxKr1AQ5p/SaNKO1fZ0P5p8JMP6bECiRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kbqh4Eb/";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73742606A68C
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73742606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbqh4Eb/
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4efdc8c20so37520827b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630495; x=1796235295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
        b=kbqh4Eb//yLrc6tOqxrgUFFGqFnUNHFY6GozDX05Z+5BG176V6qLThFZNI4L9TfDvQ
         MaR9joMj8txXUb+ZUD7TWTG2vLkbCyMB9BwanANkL+YEmvqfV11aFFqb7S6tDBoNAIty
         70ToEs2kIKmwyw/Xrq13IncPEr29QOLIF8Po0b2WkdVaBIbo+nQWKwW4+g7SGxOAtPzS
         E749CIoNuFToCEQNMDOsd45RXcJpVovW5KFs5uvnAK80cv0EetCcYcUGR2wXDp6lUvXp
         8gcd9EjMkN8Vin32w6qsngNt574f0Pyn8ZQOVpP8tbslTNtmZK38ug8da4Qkv/I62g0Z
         CaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630495; x=1796235295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3R9jInxYucZc5UgFwp0iS2EvpFdqsgv2PW7AZ1EIq8=;
        b=LzZLw162BlgVQLwBLdIPQCSXDEhVWOVQUJPfVg7wPJtPbf0s00LTrtJZ7VPkqFyvCr
         ggpLztfBJ9KKxlkrcmxyLzegqcDW52ZqqY3lfCxcesWe42dGgG0EvjIM9VCjTKA5RKeX
         VZtZYhg1x+XpUGd5kM1pp8YQYURsNWs7Mzaqr+gwYhDpnjsB8t8WO65Y/wODTJfJoxJb
         IwUeOlJQqclEMveaNUd7LXMAGXZdPLpN/aRF3fUHJGQgCjj2mHrrVPl105QE4f+ZoQID
         FHNCH0v/CrqFLy1jJ5eaDc6udsfMvohXdRKNG36U5bPjeA15oGygM+ULfWRXhWqvFj6Q
         jU5Q==
X-Forwarded-Encrypted: i=1; AL+hErEMxysF75RRqgOA+o26+yMSmK8XLa9vnZkagN1YThK1JP02DAu8AEaePx16+d+fbaxFnt/7jNxwHgzyTbRkHgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qW05CytMLvXga5WMN6DD194DtOYP2W2eSxwjKzq0RilHoCO57
	FDLtEvhs9CTuJPsy78qVRaw8gOeYgl4usJ5K/Jpn39sIhAc/GbwpwX0=
X-Gm-Gg: AZFdTZfYaa5dvH1g9gNaZNUAlf3PBKN0c8M/VXwph5NZN7DNCAFg1+af3FVcVCbARp+
	kDEG1YeFOZBsy09cxmGx+ZdlwOvGQI8onp8JkJQcAhD1DCrbx9dPAl1D0a3sJy2dtilbN2adb+K
	WkpKYF6nH9RzjrjW6X+1k0WjcteBD5SaB66ZMOie4vsRF3TyUkt9QX2VLWHhf2btUFA8Rf3ZcGb
	YdvpOS9IOzJpB5qeDlZm/Mk1ilhe+TYOdrz5URlcAepvKPy57mQBofc2JWvO+RE0uZR6jW9IRrB
	9SU5RqERNt96VB0cBpIkEYKQnsSZuAXYLCna4NFPUx+pVSgNVHaCO0QDP4MdcsS96ODoYvDptPd
	vbUQtPkcj6xMMDnR+S/0b197FTxt2tG/N3aibMItqPN2GzMbRziWRDp/1a3ei/Fw0OJbpR1N3W8
	OwCBJM0aALFVwCTpkM6HGYdQJnG914Hj/Nauq6y+/tvAumduA8hzUGqRe5dvebf7EmAAEzntU2x
	SwSrSeZ/tO69SfnXGSwLdJnLNWnexGJ/KmwGsYikP4mD7OBb6+IQun0V+r4E8NOnfX/qnKxq3Ly
	msKs1DfZnKL0IQ==
X-Received: by 2002:a05:690c:6886:b0:8b3:1fab:fbdc with SMTP id 00721157ae682-8b52051799emr73665767b3.64.1795630495470;
        Wed, 25 Nov 2026 10:14:55 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:55 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] tools/nolibc: fix strchr() and strrchr() for the NUL terminator
Date: Wed, 25 Nov 2026 12:14:51 -0600
Message-ID: <20261125181453.814976-2-svav2021@gmail.com>
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

The C standard says that the terminating NUL character is considered
part of the string, so strchr(s, '\0') and strrchr(s, '\0') must
return a pointer to the terminator. Both functions stop before it and
return NULL instead.

Check the terminator too and add test cases.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/string.h                | 10 ++++------
 tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 4000926f44ac4..2693b9bef43a6 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -111,11 +111,10 @@ void *memchr(const void *s, int c, size_t len)
 static __attribute__((unused))
 char *strchr(const char *s, int c)
 {
-	while (*s) {
+	do {
 		if (*s == (char)c)
 			return (char *)s;
-		s++;
-	}
+	} while (*s++);
 	return NULL;
 }
 
@@ -299,11 +298,10 @@ char *strrchr(const char *s, int c)
 {
 	const char *ret = NULL;
 
-	while (*s) {
+	do {
 		if (*s == (char)c)
 			ret = s;
-		s++;
-	}
+	} while (*s++);
 	return (char *)ret;
 }
 
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1157b521e65b1..9e1d0f3afb901 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2028,8 +2028,10 @@ int run_stdlib(int min, int max)
 		CASE_TEST(setncmp_blah_blah6); EXPECT_NE(1, strncmp("blah", "blah6", 6), 0); break;
 		CASE_TEST(strchr_foobar_o);    EXPECT_STREQ(1, strchr("foobar", 'o'), "oobar"); break;
 		CASE_TEST(strchr_foobar_z);    EXPECT_STRZR(1, strchr("foobar", 'z')); break;
+		CASE_TEST(strchr_foobar_nul);  EXPECT_STREQ(1, strchr("foobar", '\0'), ""); break;
 		CASE_TEST(strrchr_foobar_o);   EXPECT_STREQ(1, strrchr("foobar", 'o'), "obar"); break;
 		CASE_TEST(strrchr_foobar_z);   EXPECT_STRZR(1, strrchr("foobar", 'z')); break;
+		CASE_TEST(strrchr_foobar_nul); EXPECT_STREQ(1, strrchr("foobar", '\0'), ""); break;
 		CASE_TEST(strlcat_0);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 0), buf, 3, "test"); break;
 		CASE_TEST(strlcat_1);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 1), buf, 4, "test"); break;
 		CASE_TEST(strlcat_5);          EXPECT_STRBUFEQ(is_nolibc, strlcat(buf, "bar", 5), buf, 7, "test"); break;
-- 
2.47.3

