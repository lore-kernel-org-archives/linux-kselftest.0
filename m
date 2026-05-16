Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F883D646A
	for <linux-kselftest@vger.kernel.org>; Sat, 16 May 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778933374; cv=none; b=T6SgfCLTkUz3LOdqz7VXMcy70kxH3QafC0PS3N/5A4dNaFX5+52Yx5Ncw+Xxlz81nP4BGYFBGbVlvu6cViH0dgm0j22bavA/+Y+A9eylDZmH4273B+n7sSP2iFGcBeeUXKosTwwhslwkyK9ePSLir3a03EtKlCc2OJIjP42R984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778933374; c=relaxed/simple;
	bh=WigzUkQhDQXkuTaj/aA+DWPFt4McdPUB35it5BTy8x0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UmWK5wLlC813aG0GMiCJd+PP/wmjGSkJKFZd20kAyGCClBzlSjcGi0V7Lux3bEdY3ZRDLqQT3FdCUbMMeyvVKBcXm71SuBcaPD87boDyePtx4W7Ye1bSuYpkwljW2NIyQ1Tea79iIuhUekIZ91IPQyBAW2OG1ct0KKmEqVZ0FKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VChew1dk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VChew1dk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fe6629235so870715e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 16 May 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778933371; x=1779538171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xDdmLlH4yGQsstl1746kg3F4bXclg41Alo5RBf4g7w=;
        b=VChew1dkXAaR3AnXN/0hEI12Jc3bJREgPdoiWhdS/f9X6ljYLdPAaesvYX4I+Z8G3g
         XvWFZeLuNue2Oj9M6+FhdF3MnopppUV74OwDCxa9V2tot1aI9Y/t3QB9/gCL0RMjZkbO
         MLe+ZFSqMIUF1DB9yZKUdXdB21h6z0yFaOB/jlS0u6aC5M5nNhp2QBtBuiHe/Zn0ORw6
         aAkYpy/RdZ93RYNYB1g9yfElQ1isjaQ4z7BT+1NU2eZQ8yPGg9BrJrOwHMRgnHuaVo9l
         U7ZF8s8l8uzarqRAjdAvgTFkGjP1igeSMwXJoJqgTZumGu/nzPfO0/Z5Vr/Lu+gXbqLX
         t6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778933371; x=1779538171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xDdmLlH4yGQsstl1746kg3F4bXclg41Alo5RBf4g7w=;
        b=o/6toOYyH8KpMgU8Q9oCf2aW85tXIx2tsuBOq2+TxZpL2CI05It6mFozJWAsm++Vym
         kzjMwpo36cBf77aeI2Kh8vQrZNE5qwXvCDznubiPH8BxD2OY9sSKPyjfih9TYFGhnyi8
         bUM658BZ6cEGcNFFj3/lffAayltgesG2WMSSWgSEIgKi5luBE8cnoopiX/U5QbCb735S
         kqOOImmzSiA5+p9yWk1yHoPvbERG2dle36hTfrqXcAd8kQ0zRumEKMX4ZepEZvhwcnYq
         tVtc1Vww99LL4mKgLl++nQP4f8d43s6fepW0cTl1lfiXHV57lWla1t9+r8WARhBUvk3L
         ThRA==
X-Forwarded-Encrypted: i=1; AFNElJ+F2gQdqLGPa7DNbLf32Loaf+CQP/GqmjQVDBWA8wikf25kEH+bTwPMS+T1JSSBxMUCsaRLdRAUz/v+Ed77SXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNBo/r/jvKH79SvzTRqDdCyTpaixgfrwJt+X8P8imkioQAwcfY
	glFwUXfZzX3EB3z4wFpmWCGiWKTYZgaOV9MrZA35Y2lAvLHz7AJjXsto
X-Gm-Gg: Acq92OG/zMxPu5vmyM3pOIykHxr+6DAzegdsqGDCzANzB6lHRxI44LQSizH+i9CzcjC
	L2YPW6/sxB9mKdILOt0f95FfmT5qd9VFHLmJmaNGO7bJhfc2TtaTNRg+18mkvApRCGgGvIEF7ft
	IRX7werSeZI3eh/79vxiWOf2Q3z5qLaH467+47VQ4OIHtACq/C6LzYPvVhvPH35omdqq+PyuuO9
	RtJd3C+nzfqHGZclpF3Qxr3S4xIs1qnzqIMlBIhovEvHGZoLpkhBwuCAW2YlpDVAvRWUARs6GeB
	2q0NR4S4B6S7ZK+RIAAVcn+Q8+a9tTOOhoY15PvkEkaTayNzgm1S7QCHN2A6L7zjlui2HkkoHFl
	+QkyJgo3gTgAyOp+S6IPFiG/jhrMlgTSMTXTX2yFTYCzr0y3qYQ+noHHbrlXi4VADuMiMqkOGLG
	u1d9au+If4tPJMXiTL1yR2oOz7ELVuOZiFicI1vb1XqNOj9A==
X-Received: by 2002:a05:600c:45c3:b0:48a:797f:24f8 with SMTP id 5b1f17b1804b1-48fe59ab0e7mr51093745e9.0.1778933371253;
        Sat, 16 May 2026 05:09:31 -0700 (PDT)
Received: from localhost.localdomain ([185.139.138.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm22242665f8f.21.2026.05.16.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:09:30 -0700 (PDT)
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
Subject: [PATCH v2] lib/uuid_kunit: add tests for the four random UUID/GUID generators
Date: Sat, 16 May 2026 17:09:15 +0500
Message-Id: <20260516120915.40544-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260514172241.28006-1-sozdayvek@gmail.com>
References: <20260514172241.28006-1-sozdayvek@gmail.com>
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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
Changes since v1:
- Declare loop counter inside the for(...) header (C99 style) in all
  four new test cases, per Andy's review.
- Add Andy's Acked-by.

v1: https://lore.kernel.org/lkml/20260514172241.28006-1-sozdayvek@gmail.com/
---
 lib/tests/uuid_kunit.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/lib/tests/uuid_kunit.c b/lib/tests/uuid_kunit.c
index de71b2649..2ef64fbe6 100644
--- a/lib/tests/uuid_kunit.c
+++ b/lib/tests/uuid_kunit.c
@@ -86,11 +86,67 @@ static void uuid_test_uuid_invalid(struct kunit *test)
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
+	uuid_t u;
+
+	for (unsigned int i = 0; i < 8; i++) {
+		uuid_gen(&u);
+		KUNIT_EXPECT_EQ(test, u.b[6] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, u.b[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_guid_gen(struct kunit *test)
+{
+	guid_t g;
+
+	for (unsigned int i = 0; i < 8; i++) {
+		guid_gen(&g);
+		KUNIT_EXPECT_EQ(test, g.b[7] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, g.b[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_generate_random_uuid(struct kunit *test)
+{
+	unsigned char buf[16];
+
+	for (unsigned int i = 0; i < 8; i++) {
+		generate_random_uuid(buf);
+		KUNIT_EXPECT_EQ(test, buf[6] & 0xf0, 0x40);
+		KUNIT_EXPECT_EQ(test, buf[8] & 0xc0, 0x80);
+	}
+}
+
+static void uuid_test_generate_random_guid(struct kunit *test)
+{
+	unsigned char buf[16];
+
+	for (unsigned int i = 0; i < 8; i++) {
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

