Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796337E5F5
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060809; cv=none; b=sR/vba0Z7bIJolLXhsSQGLWGhW5RjZj+6XyfIJx3fN+rxRdbTJkEOV23xVo+NdoC8zpzvPWZvzMTKNQjqooCJWTRzQo9aW4fBty4vFdUvoqXH2LbUKreykbnCwM353GUJMZWZ0v2CZu+uamBsDHOipPQSt78tpA8DqLHnSh4qiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060809; c=relaxed/simple;
	bh=7OCUhmo3YD9ofJoscwFmxQOt4jzM3aGcuPX2u6bhnOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQN5Q7n7qo70cuiYmoYzR5stvsseFhn9g4D0kMiS1Hr9BIOSYzVupD5GnCYhzKuiYNoM6lZQQOUN2twiDapUA0+CO8pdz3+iorJeUN6tXA26lWl0S5YLHcWkR2arWbyT++MHeLAg682EzO3aGxwovVb1aPTLbW144gKz+u6JFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=WTCxYUiT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="WTCxYUiT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1418761a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060807; x=1785665607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFzxRl2W6j8iJng14jgnrShRQTusWOg9FAzc5E6yZYg=;
        b=WTCxYUiTaDLxVagq0Vlsc2fbvI++Qp8YgAtwsnylH+1RNPn4B778KeSU83xLrnRbK7
         eCDgVBVV8UzahM1P2mehY9Q1GHKFfJKXQoAOYwbZsGdMmmUczwhJrR8wnfxnZkDjYQm0
         OuDTHj2axPKPxkH/o1diPDaWsVB2gSQHbWmI3KWXdKHI4WqjJEDKZLcv5UD6XqsF9FNY
         yxOshkSnQgX6THHJoWtGAZzENecmxhsmYq25vJwYm4XJ1RzRxm0RYAcRFri2SeD2f+sq
         JZQJuUFo0+Pz1Vl22ZbSSUnwHPxLsCDGa59HZLC5jwYktITlU3LpvRNmB7TQVn5etbsW
         wsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060807; x=1785665607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFzxRl2W6j8iJng14jgnrShRQTusWOg9FAzc5E6yZYg=;
        b=nVU5EE64MX5e1+zGQuUI20rCL9Oy1Ghw/vfWz4OABjK95/TlaF4NVU5zkiePqGdIKR
         iyp/DHEb0CgDJMiLQ7MESo/A841PKg5fhR5F0aWG+O55tKzZ4/CLLsVn1byQWGnKFgtn
         za2OOwsD24whAWw6hOJXsXcf+H1VsnZzAeVhCm0YV20Zi3Vm/NxjhvNECR0K6J0BsKto
         DEus66Si623a2VPb2e4K9MNw7yb2trcPbCLg5KLgWP14O0ELsC7FT8zt5wR3iJx+9iKJ
         ehnDWdClGVeKgGdxc12jHG1PU89h/u4NnougT4FGa8hONNDTt2DHuWBFR83JtXzcNtdU
         rplA==
X-Forwarded-Encrypted: i=1; AHgh+RoxTf65GltODiwCFt74mWW8vle5v4k7/ZB8IZCJEBdwpkwvsgLBaDv94wCQs0KaVLUx4afCq+gSDqZ061bZxnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3vP/4KCMAhopRxq6OVByeb3GengJcIpzN8SN4GGbYAW6q/RR
	4GFMklOOh2qZIKU8wqGN6OU9cJw7gwbu8zi63UX5MKdI8jRl9E6BHZcsn2x7s4kEpmSX74OsE2k
	5lJ3bZNi27w==
X-Gm-Gg: AR+sD10C2PTlkd5g22e39LNODsNUX/3glr8px4i8VVXusbWIR3tbo9FMPic4ciBraCj
	r3kdO/v2MxidXvs8kM1MxDfRvOeZq0gnpC5Eb4atp6j6Oe0E9o5gzugSoP3JghIvqNBZZ5B30Vj
	8W8kot6EPsaiOuQu2x3qI0AnTwoY+R923n9gzmC5KoQT34RCNnLD9QGPi6WkJuc5UzKdlTs17er
	7HObfNYUsaVnA9ylTJl2aOMOXoUpxzLv79Uq7qOHTctc0/5q3VgqIj3NthlB21BMv71NAQ51C+7
	S7AjZRbn84fVKaexW1GvOivg+CHmQns7CMVf4rjsdBaeH54lyNkyznKcvsXH3RcIQWsWjioGAvk
	FvT2CinBXkQJPK9yFXBXXMyIevkTsoya+LHi+sJWyeOtITwlKByQGawrGpNVrU8/UnM2RKtty54
	7kbay5KvnGafLtjg==
X-Received: by 2002:a05:6a21:681:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3c67daaaf88mr4403603637.30.1785060807009;
        Sun, 26 Jul 2026 03:13:27 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:26 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
	LLVM Mailing List <llvm@lists.linux.dev>,
	Yichun Zhang <yichun@openresty.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	gwml@gnuweeb.org
Subject: [PATCH 3/4] selftests/nolibc: add abs() range test
Date: Sun, 26 Jul 2026 17:13:04 +0700
Message-Id: <20260726101306.3772237-4-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing abs/abs_noop cases only cover abs(-10) and abs(10), and
labs() and llabs() have no coverage at all.  Nothing exercises the type
minimum, where negating the argument overflows.

Add a case walking all three functions over the interesting points of
their argument type: the minimum, the minimum plus one, an ordinary
negative value, zero and the maximum. At the minimum the absolute
value is not representable and the argument is returned unchanged.

Both the arguments and the results have to be hidden from the
optimizer. The compiler knows these functions never return a negative
value, so it folds the comparisons at build time otherwise, and that
would equally hide the overflow being tested for.

Note that the overflow itself is only reported through the:

    -fsanitize=undefined -fsanitize-trap=all

flags the suite already builds with; without them the wrapped result
is the same as the correct one. With the flags, and with the preceding
fix reverted, the run dies with SIGILL on this test on both i386 and
x86-64.

Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 996e8d13508e..4dc2ffea63bd 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1728,6 +1728,52 @@ int test_alloca(void)
 	return *x - 0x1234;
 }
 
+/* abs(), labs() and llabs() over the whole range of their argument type */
+int test_abs_range(void)
+{
+	int i, ri;
+	long l, rl;
+	long long ll, rll;
+
+	/*
+	 * Both the inputs and the results have to stay opaque: the compiler
+	 * knows abs() and friends never return a negative value and would
+	 * otherwise fold the comparisons below at build time, which would also
+	 * hide the undefined behavior that is being tested for.
+	 */
+	i = INT_MIN; l = LONG_MIN; ll = LLONG_MIN;
+	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
+	ri = abs(i); rl = labs(l); rll = llabs(ll);
+	__asm__ ("" : "+r" (ri), "+r" (rl), "+r" (rll));
+	/* the absolute value is not representable, the input is returned */
+	if (ri != INT_MIN || rl != LONG_MIN || rll != LLONG_MIN)
+		return 1;
+
+	i = INT_MIN + 1; l = LONG_MIN + 1; ll = LLONG_MIN + 1;
+	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
+	ri = abs(i); rl = labs(l); rll = llabs(ll);
+	__asm__ ("" : "+r" (ri), "+r" (rl), "+r" (rll));
+	if (ri != INT_MAX || rl != LONG_MAX || rll != LLONG_MAX)
+		return 2;
+
+	i = -42; l = -42; ll = -42;
+	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
+	if (abs(i) != 42 || labs(l) != 42 || llabs(ll) != 42)
+		return 3;
+
+	i = 0; l = 0; ll = 0;
+	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
+	if (abs(i) != 0 || labs(l) != 0 || llabs(ll) != 0)
+		return 4;
+
+	i = INT_MAX; l = LONG_MAX; ll = LLONG_MAX;
+	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
+	if (abs(i) != INT_MAX || labs(l) != LONG_MAX || llabs(ll) != LLONG_MAX)
+		return 5;
+
+	return 0;
+}
+
 int test_difftime(void)
 {
 	if (difftime(200., 100.) != 100.)
@@ -1943,6 +1989,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(toupper_noop);            EXPECT_EQ(1, toupper('A'), 'A'); break;
 		CASE_TEST(abs);                     EXPECT_EQ(1, abs(-10), 10); break;
 		CASE_TEST(abs_noop);                EXPECT_EQ(1, abs(10), 10); break;
+		CASE_TEST(abs_range);               EXPECT_ZR(1, test_abs_range()); break;
 		CASE_TEST(alloca);                  EXPECT_ZR(1, test_alloca()); break;
 		CASE_TEST(difftime);                EXPECT_ZR(1, test_difftime()); break;
 		CASE_TEST(memchr_foobar6_o);        EXPECT_STREQ(1, memchr("foobar", 'o', 6), "oobar"); break;
-- 
Ammar Faizi

