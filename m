Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7594FB9CE
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370971; cv=none; b=rWkRTYAXu75l4YcFjnZS70n9MlaLScjyLKJZ0aN/l4dha41TEEZB+US95/v44t5walnDo1eWrgYvn7QvLjGtzZ7LMUKJO9FxwPkHJtBblXO/UIhDRBRXqR9+xHWn49dM9lsjESCkyMmInyg22UmYnL0A1vzpQ4bc2qUk/tNBEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370971; c=relaxed/simple;
	bh=vuVChJnQWWZ8u94uOgQGJ74rzfafInWZtiXnsAThBqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0bnlRXl3aDg2tFKJ91nApa058tQRBIeqeOjlU/AUXX7K6pQDmu2Wno+ucEU92X0vY5BfTHn29vsItFNCC5nLblfKLnNYduuxZrze0XMVXjwE35UtgYgd2eJ91aRq9sp1fih79hRRVohVQZY59G94u8hyH+N0Dkep2aObU28tUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOE5IA8h; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOE5IA8h"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0776592e3so784817b6e.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370967; x=1790975767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oee6XIob49W0bQwe7IHXcVEe2xWZKG+qR8xRtFWbBx0=;
        b=iOE5IA8h02NQaUADBl8julNkvcJNFT3tL4sPRZL5NhbqSyYhsNAae3FmXdhGp2vNvK
         dQd+y8DsDV/U8n4wCWTF5zYYmxzm1eP60TC5fFkxi9y5lWbCZl6ls8bbOs1o/qFLBqwf
         txKbiigCdGjWnO68va/H46rtjhTRIGuSCmGmaiZy5OYx/MOCKN2vbyCnyq2uAC2khODC
         Ha3qQmKGIMTQ5Alr16AcNCFQOQ//GfbMpvTBGNncaPY7GWiyghT5umi53hL1Uo7inHuj
         BpYqpFNouhnEtuHai2OxyVS9kXKnPjywoVXyHWGuTqAptTm9TszY97iKVcl5Ai/31jIS
         lw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370967; x=1790975767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oee6XIob49W0bQwe7IHXcVEe2xWZKG+qR8xRtFWbBx0=;
        b=ZbxFgGDpcJ2FyVcN0yO2U03mcZPxPXwkY/TUXFPwpNTVqadu0CQa2/vLzCLZNsFU9J
         VZpemePYRwx/s0+XOvhBXqABiXH4xXku1q30nOKWF8Ev9Kpe24YGUgEzHVEN/J1rAMmV
         HxVuKi93ZLX1pvWmD6V3Fmo7HZnKzM4S1CNJqzuGPR6JtO2FlZl189eDQ8VZ/cY7CVCG
         H9/bl7A2sGvQ7WfsD+eLQGxnMwTW83g2dfHEmz/HXM3Wlk9Lj5JEGOvL19KJWfpztcfF
         wyeXDcb11rAeBNWBtT9nrXUgAmdMPuWS0IbuB2CTieftVDr3X5LnvXgjOmuXa0S3Psgq
         9VLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4BRqaZuJGNbqJ7yirCpLaatQ30dNJMrdVfqScuW7W/D8nYk8yu/QDWv2lQ+nvY2yYT9SZQ8UFf1lviIpgd50=@vger.kernel.org
X-Gm-Message-State: AFuF++nD1NIyHyHv0PgCoDbwbTo8JP2tHzQtayg4Ic62VGLNYcwnODz0
	hZ4hArvm/7Qb8pE9R8J5yDP3ghCHW0YoAlqwPPQ2riJgTmcFHTkgk0Cl
X-Gm-Gg: AYBFou2WCaDFqq8iehEnTO/Alf6XGF/Es44C7XqtIfqAfnIOVsGJjzeC/b+uLe/weS/
	1OfDs0iBwWoEUFC+UNIli74wVDKXaem+RHIFj7iL+dtHELizHYakPW+/NbU4Ms8Lia/U6kGG7rU
	/yoysEjt+DY69E022eRGs/lCHzUpiHYFrCwAC4UKme4o9P/Axq3IXPZ2eRHmMameqTakCfIFPM/
	IAcvr1EyVgXJZB2JDeNBkcwDezG6fMcD5e6J/gxN2fQKM23ZAOmjfdX2FEmaqwm8gIuuBsSrp1H
	AdtOn4usfaP8mISAOAfHgGFYZMM48ihdbkCJsgEgaQEGzxTNWy8Ss4dV/k6yQWftU9S1H1pnofC
	RCpwFw37/5+05OFijhgBSLd5lUxeOhl9ie2Y2df7WZm4kue0ROoCVNo9XFarzzFucugzRtlXfJi
	8QwtQ73YjLmVw5PVyyhs1tauDkrsxAbRAZh2yheFcjwxyMQpRsfr+McmxLAToCZ7i+/Z1gYcIUi
	liIUDd6LzuyKVHCLkpnajzfhslh0PulzuVgo7DE
X-Received: by 2002:a05:6808:16a0:b0:4d5:295c:a831 with SMTP id 5614622812f47-4d72f34fa3fmr7037829b6e.62.1790370967256;
        Fri, 25 Sep 2026 14:16:07 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:06 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 3/3] selftests/nolibc: test the FD_* macros
Date: Fri, 25 Sep 2026 16:16:00 -0500
Message-ID: <20260925211600.119116-4-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only test that uses the FD_* macros passes fd 1, so nothing noticed
that they used the wrong bits for fds 31-63 of each word on 64-bit
architectures.

Check that FD_SET() and FD_CLR() change exactly one fd, for every fd
below FD_SETSIZE.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2:
    - Dropped the select() test.
    - Moved the FD_* test to the stdlib tests, with its helper in the same
      order as the test cases.
    - Shortened it: FD_CLR() is now checked on a set filled with memset().
    
    v1: https://lore.kernel.org/all/20260924015222.31693-4-danishkhateeb03@gmail.com/
    
    Tested with nolibc-test on x86_64 (GCC and clang), i386, arm, arm64 and
    sparc64 (qemu-user), and against glibc. With the fix, fd_set passes
    everywhere. Without it, fd_set fails on the 64-bit architectures (or
    UBSan traps on the shift) and passes on the 32-bit ones, which were not
    affected.

 tools/testing/selftests/nolibc/nolibc-test.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 37c11a7fce23..1995d67dcca6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1841,6 +1841,26 @@ int test_time_types(void)
 	return 0;
 }
 
+int test_fd_set(void)
+{
+	fd_set set, clr;
+	int fd, i;
+
+	/* FD_SET() and FD_CLR() must change exactly one fd */
+	for (fd = 0; fd < FD_SETSIZE; fd++) {
+		FD_ZERO(&set);
+		FD_SET(fd, &set);
+		memset(&clr, 0xff, sizeof(clr));
+		FD_CLR(fd, &clr);
+		for (i = 0; i < FD_SETSIZE; i++)
+			if (!!FD_ISSET(i, &set) != (i == fd) ||
+			    !!FD_ISSET(i, &clr) != (i != fd))
+				return 1;
+	}
+
+	return 0;
+}
+
 int test_malloc(void)
 {
 	size_t sz_array1, sz_array2, sz_array3;
@@ -2022,6 +2042,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(memchr_foobar6_o);        EXPECT_STREQ(1, memchr("foobar", 'o', 6), "oobar"); break;
 		CASE_TEST(memchr_foobar3_b);        EXPECT_STRZR(1, memchr("foobar", 'b', 3)); break;
 		CASE_TEST(time_types);              EXPECT_ZR(is_nolibc, test_time_types()); break;
+		CASE_TEST(fd_set);                  EXPECT_ZR(1, test_fd_set()); break;
 		CASE_TEST(makedev);                 EXPECT_EQ(1, makedev(0x12, 0x34), 0x1234); break;
 		CASE_TEST(major);                   EXPECT_EQ(1, major(0x1234), 0x12); break;
 		CASE_TEST(minor);                   EXPECT_EQ(1, minor(0x1234), 0x34); break;
-- 
2.55.0

