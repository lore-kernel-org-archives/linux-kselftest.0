Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826592;
	b=FLZ9Jp/ip6dyx4hQ6ALp6CVe3DMrkN2Vkjv0MS+LRKfK8gEYCkH1lqoP16oMS5NxNBMn
	 2oHASUoZtHg2ff3cpqBq4DuQNdOxXauLVqnCqOSQw54NnraiqZToCDz/oRhqmVNwwtz2N
	 LbR06CU69C/3yPANrOvNileVhqDDHH9kvWmSgDhxtJRnre81Y8yzKr8bho5+nYonzI1iq
	 00Bp9c0/inyHDD7GvxxdDHXI6MijlP808qNgwimSHDT1TDjQI8zn14J50eQ+xEtFIG28u
	 go1d8hNWpeKQ9aAfC/Yek3r6IaPQVqoyXD3pdsgu1R4C20LJP8Q0mIQYtx4NX+fpHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
	b=SNI0yVtFRUQtRRFrzYFXecdswOJrzIB+TuUZBZL/uILv5zS82A87PAuJ6v+xkFUH36e3
	 xXNgRaRcXBBIVpbzONfqVQEykv5EoDrTyw+pzZt/aLNF4HQsboCjhiXDulxXp9j5I8L+T
	 xC9gpylu7BWtXEbacpQ8M7JV5C36bg7QV9Tg1Zu80plm8ysVVftFwoHXAZthFa1MMwS8x
	 w5G05MG0bhW7NADO6+NTBENSqp+rNcoyAT4SbSUjaDDD+739w6C9+X99XPL704R+FA0y/
	 Kz2c/YbKWWi0HOMJH4YZ9jFYHI25XIBH7YI/IXbpNLWjj4Hb5wGivwMbfkQFmsxUBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ynZ/RqCq";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5E60A0E88
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A5E60A0E88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynZ/RqCq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so12771665e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826589; x=1794431389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
        b=ynZ/RqCqh89OHwjvqNp+vs25vjiK4Ou7DN7zQEKZabuWvRZv4Y0j7AnYawI83cN6dH
         z1rcgOqnQgwQKNU9ghnJ9OmG3ay6wvEOeSZw/J/tpQrH1rJocOqNROCU546pI1PMoruz
         438Fs2ftK429eBbeLisQNvyR8Odbi0mpXN3m4a1/f8FFKRkyYcHCRU43gP3JKQyflUw8
         TgJro1GMnp6hkk1QdgxQ/5MB2YjmoG00ACya3Pn7/CMYA1flOgYp8HL+Ic5sWIScHbNY
         av46JXDg/8zY25s5wf/2LE7YEebsdBdm4T70v6VvWj+J2DvjboDI0Gn/KYr8ERDyrShu
         czeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826589; x=1794431389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
        b=AUDYo1SblXz2vWDa9aqTnwX9B+WdX/9WEhFWngT3TLuqA8LkhAL5cOk7X6Aj5YzA26
         hZR5pbEvS4myMqEVPbg3Sc4LGAID3yWqEVes09TWlZzl2wcDis2yjLBSUxLMt35BmF6D
         rcgvU2u8vxC1ygdxn5aZ8oExF5w1kPOAYWRPzPRFBJuvX/bbe4Qs0xNLGbT6GtRyb3oH
         uO3Fz98N4Z6luZJhZdYzGkK8fLvbrGUB61gEuHEuUUCiAfa2fOj9U1tsB4bKoK3rMD1u
         lyhW6cR0+qJdHnvAgddNqjEzeAqc2khjVv9K2GP+l96MyGK5wcsNI2kVODW2PPvtqtVU
         EQPg==
X-Forwarded-Encrypted: i=1; AKwUvBzzcYQYOkRAX2CTWSOjl67c5dqHm8m0qYpdxlVELXoasYNwtoHitsaKTdt9+eteiZEki7V3q/+qP42qhirr31k=@vger.kernel.org
X-Gm-Message-State: APuU4Z91YlguTAyJzqUH/RpHoBniyEyXOe1imfW6yhnwRVshgCleax7v
	RxyFQDYagbPJs+tHhAtCIBh3Tp7/dA5lB6gapoOg6b9YjsPn9FNNRh3z
X-Gm-Gg: AYBFou1I/w21hC/jKxwQ8OS5U+25/aYZV4VoTdTTuCKzGpbK19tnpiRYWWlNvBqtL7M
	RNcVwpD1quCkK0iV/xXtr8zZ8jOMKZg8qvfZX/bz81hK6EmxsasRuTM3rCNN5GC7V7jbNGvB149
	Yoz8CbKNoe05saNBscTxpasIyJoi84+9a0Chotxj31C5lIkt8XzWQmCAtzTcCQmQdm3TnKWQNqH
	tEtd2s8gqU8+lhEAmM0HC1/FcFTxP5DQYgsyQ4HXP9JgXVW4RFvxi/GFciCwdD4mZlRw92w06v9
	c/9rKnpjHuEYztfWCHZQOk9IDFCHelOIr7rWt9Pem/ut/bnEjgY/XqjD3mashPclJEaQeABBoLU
	zO2XsT7lJulrw/B7H8MOWBf8zyfq7GPRXaxpYP0e6hCvlvCZSwFfey/Mk5RCFkjLLrtPImTz1Id
	RG8kjQees7kUv82Wefoqq40ujmO1JFESkwgrWKiuU+Z4IBTBIyu/r764WgVIhyhnvmiMonsULKF
	WlJ8jCcgtUIeNEJ6wRqDhTPXhJyej8gWg00w05YeP++7jpy94wkNb4/DHlrxdTbRqY4CrPvYv12
	7ikm6zIycMD9hqv51jscWE45hPUQXRoKyoNWVoML0HbQW31y+qw7kg==
X-Received: by 2002:a05:600c:3e05:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ac1765e5c8mr385324485e9.23.1793826589271;
        Wed, 04 Nov 2026 13:09:49 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm12083535e9.1.2026.11.04.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:48 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:11 +0100
Subject: [PATCH v2 25/27] selftests/landlock: Assert WIFEXITED() before
 checking the exit status
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-25-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

WEXITSTATUS() is only meaningful if WIFEXITED() was true (see
wait(2)).  Check WIFEXITED() with ASSERT, as most tests already do, so
that a signaled child does not also produce a misleading exit status
failure.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c |  2 +-
 tools/testing/selftests/landlock/fs_test.c   | 10 +++++-----
 tools/testing/selftests/landlock/net_test.c  | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index b1a729b94e7b..4cb30b943aa8 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -637,7 +637,7 @@ TEST(cred_transfer)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Re-checks ruleset enforcement. */
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index fe1ca9c2d949..183dfc42895c 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4640,7 +4640,7 @@ static void test_connect_to_parent(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Clean up. */
@@ -4739,7 +4739,7 @@ static void test_connect_to_child(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 
@@ -5409,7 +5409,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	ASSERT_EQ(0, rename(dir_s4d2, dir_s1d3))
@@ -5431,7 +5431,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -7985,7 +7985,7 @@ TEST_F(audit_layout1, resolve_unix)
 	}
 
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	EXPECT_EQ(0, matches_log_fs_extra(_metadata, self->audit_fd,
diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
index 51bcb4740dde..e194fd78d8a1 100644
--- a/tools/testing/selftests/landlock/net_test.c
+++ b/tools/testing/selftests/landlock/net_test.c
@@ -903,7 +903,7 @@ static void test_bind_and_connect(struct __test_metadata *const _metadata,
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1274,7 +1274,7 @@ TEST_F(protocol, connect_unspec)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1373,7 +1373,7 @@ TEST_F(protocol, tcp_fastopen)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	if (client_fd != bind_fd)
@@ -1528,7 +1528,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1571,7 +1571,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1642,7 +1642,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1677,7 +1677,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 

-- 
2.56.0

