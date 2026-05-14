Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F913A5420
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779384; cv=none; b=reDpiZ81TPu3+dgzWK79e3102cwBloMAeD4XZsLsYL04MGE4mF+i1KgdMEPa5SRtxHNQja2bk9CsNNdNNuLxxzmowCLytUbFPr0Ye+3CnFL0BkB5rvQG6HCqZF61tVbXxPEWhpQjL4a5vfNFPfCGLHuCbYPP4b4R9qQYUu+PU6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779384; c=relaxed/simple;
	bh=MVNfRK0cS8Dt06z8NeESFxJysl04Isvyco3jwpSwjh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fyKFVUPQSqJx/fH9ASR/r/WVZ2ranc2cVqkrl6o9KaIx4VJkXH/ptMXQBDMHjCzy+WdMwYghF+1SBvYNmnS0OkUL8B0w7/fmloSd60KFVnHs2FgiHe3G4lVJNAnau8UsDPTDUzcP2Tp8Vo/dzTDePjakylzlLoBYspcO1lqZy3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLjgY4MT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLjgY4MT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c569cb1so7232925e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778779379; x=1779384179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMaxR+q/wtm3s4msj3w1sOUTMessNfD3kYpKQBJanDw=;
        b=pLjgY4MTLJ//Cft02z8ASl+D/34IQfhhF3d0fC8zsq42DQ2ZsaJU1E6DyRIiqhxPEs
         qdGLKFDP3IHrnz9Jm/9ZwgB1oPxorg87zcC540lKwO6V7lM0/OVOjhquZSdSpOf6rFlA
         7mB6WddKr6D5anR8wiXBaUVcS9lC0qfHFXt2sH3rvDm0gyp9wna18OIHqXk3ZqknqDWK
         405F/JDX/SuxWg5RDSiDaf43cOXJgaUORawJ9/QQX2o1i5RN9p+75wZGhdVJj7qHv24Q
         UDM8vL2wPf8rD6TrBcywzNQLTMp3IR3OhMf+7ZoNUFPC7gn0UAgA/Emaoajqo00QWxJh
         TCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778779379; x=1779384179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMaxR+q/wtm3s4msj3w1sOUTMessNfD3kYpKQBJanDw=;
        b=NSnugziFQSSNGvlIavAOJbGYcczuBRyLEJue14BbnD7r6MFMO2VIYGoGebWl2s9e7h
         gEGM7YLvuFfOa1cRj4paOLnWbekDzabZdIwnO9Oc7BpATSUBeqS/sqBTvCzBH50YT8OX
         7mFGqbkMnPTStPkKGqmcyMbtEY9M+cyQRwIIhG9i45i55F978syh8JyvA3H0Ml45wN4X
         QdAIZ1JmnbRt8lf7wBE604k8bmYjo6/W+SJWZcxJ/8QCdH1OREr4cSjsHwDexP91EBFq
         lLg6uDvun7zOiAixKtk676RJUfmtpv9Mpf642imiR77wceWpYSw1hi1vWOzHprbJQbdu
         3RAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uEy+k6JjJWqDFwT0A550z7F6iSDeFBR//MDL9xMmS10cPyrNzN3kJ3qzSlD4ya345JVLtLcXWxifNmuR7Amk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBYSv8aNyzlvWqxrqqsbPP0lABpTBAi6OnEsjNX1QPK7TpnKHu
	MR7t9WPZzFtCxlMnTHdfIXfbKNba9gCb5w1z315PJiGpwgziJoU06IX8
X-Gm-Gg: Acq92OF/6gUvhYnl8qLvo9kTMvpNZcX2Vmfeo00XRfN4RCCc4cmFJ5fz9hvLOGcpoiZ
	qlhUxXnNyDpIjJvoDYlzgLXC85cOvpJXwykULZONHmMCxSHoHxLUvZAkKjpPigr3IhsLYbIk/zG
	+Zfvxxt6GPwsIb6SXF9l52jD/+N3NOADAlSw6OsbcA7B/ne11deQsga+/l9oq9sCeI2yawpKO9r
	aETXrdM31BDzjLIRJN5dgYncukhZtDkFFIsgMra/F8lgPRjHGn2hJTLlfc+kbNFJBeQbQ4xxMgs
	U3orzRTs5OAeWUQ+egyjlEt+/lkdvHq8xDQ3JdT91HeG2ZD8nEBvys6ff/5Kg9kCtyxUOb4jZhC
	7k660+M6OYDijdDLKyQEYIDnB11aONu+qLAtdb6371zcuXjazL+I9AXt6ZhHTM4+aY07OTHmAeU
	9jwzuBfLBVSIT6ZQke3fu9qEB/hQlNp6pal5zyaUuUrFgZ
X-Received: by 2002:a05:600c:310f:b0:48e:7a10:1f5e with SMTP id 5b1f17b1804b1-48fe5fd5b3amr2237065e9.2.1778779379407;
        Thu, 14 May 2026 10:22:59 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm7853932f8f.34.2026.05.14.10.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:22:58 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	david@davidgow.net,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] lib/uuid_kunit: add tests for the four random UUID/GUID generators
Date: Thu, 14 May 2026 22:22:41 +0500
Message-Id: <20260514172241.28006-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uuid_kunit currently exercises only guid_parse() and uuid_parse() (plus
their invalid-input paths). The four random generators exported from
lib/uuid.c -- generate_random_uuid(), generate_random_guid(),
uuid_gen() and guid_gen() -- have no direct kunit coverage.

Random output cannot be compared against a fixed expected value, but
RFC 4122 section 4.4 specifies two invariants that any version-4
random UUID/GUID must satisfy:

  - version 4 in the high nibble of the version byte
    (byte 6 in the wire uuid_t layout, byte 7 in the byte-swapped
    guid_t layout);
  - variant DCE 1.1 (binary 10x) in the high bits of byte 8.

Add four test cases that invoke each generator several times and
verify these bit patterns hold. The same checks catch a regression
in either the mask/OR sequence in the generators or the layout
constants. Run the loop a handful of times to cover the small but
non-zero chance that an unmasked random byte happens to satisfy
the version/variant pattern by accident on a single call.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 lib/tests/uuid_kunit.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/lib/tests/uuid_kunit.c b/lib/tests/uuid_kunit.c
index de71b2649..a800a80e6 100644
--- a/lib/tests/uuid_kunit.c
+++ b/lib/tests/uuid_kunit.c
@@ -86,11 +86,71 @@ static void uuid_test_uuid_invalid(struct kunit *test)
 	}
 }
 
+/*
+ * RFC 4122 section 4.4 says random UUIDs/GUIDs (version 4) must have:
+ *   - version 4 in the high nibble of the version byte,
+ *   - variant DCE 1.1 (binary 10x) in the high bits of byte 8.
+ *
+ * The version byte is byte 6 in the "wire" uuid_t layout and byte 7 in
+ * the byte-swapped guid_t layout.
+ */
+static void uuid_test_uuid_gen(struct kunit *test)
+{
+	unsigned int i;
+	uuid_t u;
+
+	for (i = 0; i < 8; i++) {
+		uuid_gen(&u);
+		KUNIT_EXPECT_EQ(test, u.b[6] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, u.b[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_guid_gen(struct kunit *test)
+{
+	unsigned int i;
+	guid_t g;
+
+	for (i = 0; i < 8; i++) {
+		guid_gen(&g);
+		KUNIT_EXPECT_EQ(test, g.b[7] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, g.b[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_generate_random_uuid(struct kunit *test)
+{
+	unsigned char buf[16];
+	unsigned int i;
+
+	for (i = 0; i < 8; i++) {
+		generate_random_uuid(buf);
+		KUNIT_EXPECT_EQ(test, buf[6] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, buf[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_generate_random_guid(struct kunit *test)
+{
+	unsigned char buf[16];
+	unsigned int i;
+
+	for (i = 0; i < 8; i++) {
+		generate_random_guid(buf);
+		KUNIT_EXPECT_EQ(test, buf[7] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, buf[8] & 0xc0, 0x80);
+	}
+}
+
 static struct kunit_case uuid_test_cases[] = {
 	KUNIT_CASE(uuid_test_guid_valid),
 	KUNIT_CASE(uuid_test_uuid_valid),
 	KUNIT_CASE(uuid_test_guid_invalid),
 	KUNIT_CASE(uuid_test_uuid_invalid),
+	KUNIT_CASE(uuid_test_uuid_gen),
+	KUNIT_CASE(uuid_test_guid_gen),
+	KUNIT_CASE(uuid_test_generate_random_uuid),
+	KUNIT_CASE(uuid_test_generate_random_guid),
 	{},
 };
 
-- 
2.43.0

