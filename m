Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601439;
	b=tWzTEcMP0owKh6bM0dDCn2MfVw6DLGWzJRWOotwjfkvSWGmWp8zRMF23D6Ric9p30Xop
	 q9W1lflNWj33D6c9gjWr7TaMtIEQoF6wRBDxlXEVI6qqHVz1h99CwDvVuJl3gOTDBdZfQ
	 6XOwvz4lLLBuI8WLUKpI9+7VykONz70mjwANgCWXCz2WX0yn+XLfPN6GHaqFkgWuK4Vgu
	 7EkUJ6zA82q35q87/5JiNuONLiHzIauB5T59yJiRj9ksnsygAxTxaPBcdRd1E1P8CPgqg
	 k+rtyKsKGKQPKoii2A8SfS+fxpOj3UP/dW5TAH9W4wNP29ZU0Hg5QU0wGYGaFkzmppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
	b=tCdnU0wwwtSV4woJPoLIPh9H4UTuDUCdu267Jed1wAkGuVj3d4jdsYHh8XIPWETjxfvl
	 6QRYHjmDw7IDDuaWprNEh4x9smcec7AM0oiUk8GCr8VtkRl5Csm5gh6wVwluqXvYwjF+S
	 Xnx4g5suTVBy8drZq7yrtoCOsuOTXDMSTCQJ9qBEbXabKu2BjLLHbBp6v8/jWmFKQKFD5
	 zY6dG/MB7pSZIkdIxYCwxWYxwXa0UcrwwzKhn/2YNdzdsCsl0YcBVtXC/pDzDik/jE5a7
	 gieCXi8yfbnftBScN6ALhCzUfaBLIrNYnmabsZetVQVLXrCvTL8X4Wp7jluHzxFKA5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yga/QSqb";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8E606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 20:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF8E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yga/QSqb
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49134c8509fso1588656f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 12:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601437; x=1795206237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
        b=Yga/QSqbbsvIGtL60aI1kAe5OPZjPUAJxR18Z0gEJRPCeu7mHEpaqlir2hvikPClmJ
         VQ9aDqcjqM1tnBxEJ3nhAbq3m30/Qx4voX2Hg45lE7g2RqvnsWT5ZLk6UPC3+GEp+41X
         p3yM2sLV23WedO2RYYSoV3BE+pWZmHRVlvYz9Y6J8JE4bKuwPCObU2vss8dHVqnqrJOc
         UqRp6XH+jUjNgZBRvEEcK0qK5vZSgxbbk6/J7P/7HjViG+XiW5b2yyI3IIb4oUkCQ2QM
         B6w/EMth+rNtWJqIPtxw13cTDw0fPGmC/bOm9/sSiofCFI9IYQinQy4bkQsbtMsZDVG5
         pa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601437; x=1795206237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jvEUnUJrd74/uF8JXphTJ/RHPybs0qTVGP2JvV6cQ4=;
        b=07xZRPm9quL0PbJx4tozG6ryNDJxwhdfYFWDaayKLVSKHAS2Seq+buSYCNgdYoWBVP
         /1z8oIMJVAWgrbOixo9FgSXEBMQ6IvDYsL0RtbH0Rw2ZbYOy07JoMBTAhkQXBcVZ1hn9
         x0a7DgrRd87WtP6iRwrF2CYr5oVZuF5UGy52MBhvLDBcrnCZCGl3oqPsOTI5uSt11dCC
         7g3SKSU8vNjh53hQwLxK8+E4O0zpjOnc/bN49fhq0dS7iK6IWHxbANKE/a1TupArcHzP
         RN5wMkrqy8kty/JZ7yZvsnn6pJceOLD2HkhX6YCrb17VuRkCElGzg94/xtlQQ5JpuFCx
         Dx2A==
X-Forwarded-Encrypted: i=1; AL+hErEcxlEebRigKdOjquZAe7jj3FxQdS9iw3iG0RuwIQkycagyg7lceOBsAighEbGCZVcnP+phmwTvamdoF9hgMQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GczS5z813WqdYdpPF9edOqVfmO0q2A+ELMgphnDv4GCS3FYc2
	x0sCBHSKcHO1AxfRzTgvKQjah0KIJMJ3tWwBh0RDI3nHAKOunPR1Rfs9
X-Gm-Gg: AYBFou0FGVwTTUaecrY44pVJj+EehhRNqlNESYGoxjOIEQq9M4d2IQqaFF5SGInOEWs
	UNnDBxKxZoctRXWCWQXeSo6c53S1eTuDSQhHO/ANoGS9ukWZwinARLplR7Jk5M+G/5YtyJeDkpC
	pFLjYVvdbB/oZ3JFSbpefmLqr1DXWAZpV7oNDyz9Idq2BaqZGe3qtCxrSubwWTvK/D91Cn9cfk1
	yPF4xRW6A9BZIMV9a3uUFYrOVazd0kQx+k7ZknnPcvBlC3NcPRKV08hf6zM9WF6mxXxUXURMVqJ
	KO6iorh8vifwklX2gy467K/iZOb6mWv/isc8FBR3bCRDUdBoj8H3BlOOGgI+E476WbJ1EGDBw1C
	09Jc/ievZ9GQHv7mYbCslmNTT3VAZIR4fdmLX8+B/lz8a16XPQnqOv+I6LwzahCw3rcKI2BHI7Z
	FCjzsSYSb37moupSMV6BoUyuGeFRpTMgLlS3W0Xuac9PWPyVlMjU7uXqP4GvQGttdh2YvFCgFcg
	cOtxBotRyxZ4Cgg3PP3C8wjQ53/8LC3nW6onHeN/c8/j2sq31nn7VeUMbWrcfPNrBC00r07GoRj
	pmZKaM8UMhVg/ArJQo0gDhtI7r3K0s/18Mx9bhhCISDnHQTotN/ekCDazml2Yn5mc8+FtHPJABw
	=
X-Received: by 2002:a05:6000:178e:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-49c73a0550fmr8478003f8f.56.1794601437163;
        Fri, 13 Nov 2026 12:23:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm7424563f8f.59.2026.11.13.12.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:23:56 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Fri, 13 Nov 2026 21:23:24 +0100
Subject: [PATCH v3 2/5] landlock: Add KUnit test for
 landlock_get_fs_access_mask()
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
Message-Id: <20261113-b4-landlock-refer-nonfs-layer-v3-2-02d7e42bcdfd@gmail.com>
References: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
In-Reply-To: <20261113-b4-landlock-refer-nonfs-layer-v3-0-02d7e42bcdfd@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

This checks that landlock_upgrade_handled_layer_config() and
landlock_get_fs_access_mask() together result in the right handled
access rights being reported by landlock_get_fs_access_mask():
LANDLOCK_ACCESS_FS_REFER is only implicit if any of the other
filesystem access rights are handled.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/security/landlock/domain.c b/security/landlock/domain.c
index 4c0b1f0e1db5..71756c68d08e 100644
--- a/security/landlock/domain.c
+++ b/security/landlock/domain.c
@@ -753,6 +753,49 @@ static void test_landlock_get_deny_masks(struct kunit *const test)
 					&layers1));
 }
 
+static void test_get_fs_access_mask(struct kunit *const test)
+{
+	static const struct {
+		struct layer_config config;
+		access_mask_t expected_fs;
+	} layers[] = {
+		{
+			.config.handled.net = LANDLOCK_ACCESS_NET_BIND_TCP,
+			.expected_fs = 0,
+		},
+		{
+			.config.handled.scope = LANDLOCK_SCOPE_SIGNAL,
+			.expected_fs = 0,
+		},
+		{
+			.config.handled.fs = LANDLOCK_ACCESS_FS_EXECUTE,
+			.expected_fs = LANDLOCK_ACCESS_FS_EXECUTE |
+				       LANDLOCK_ACCESS_FS_REFER,
+		},
+		{
+			.config.handled.fs = LANDLOCK_ACCESS_FS_REFER,
+			.expected_fs = LANDLOCK_ACCESS_FS_REFER,
+		},
+	};
+	struct landlock_domain *domain;
+	size_t i;
+
+	domain = kunit_kzalloc(test,
+			       struct_size(domain, layers, ARRAY_SIZE(layers)),
+			       GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, domain);
+	domain->num_layers = ARRAY_SIZE(layers);
+
+	for (i = 0; i < ARRAY_SIZE(layers); i++)
+		domain->layers[i] =
+			landlock_upgrade_handled_layer_config(layers[i].config);
+
+	for (i = 0; i < ARRAY_SIZE(layers); i++)
+		KUNIT_EXPECT_EQ_MSG(test, layers[i].expected_fs,
+				    landlock_get_fs_access_mask(domain, i),
+				    "layer %zu", i);
+}
+
 #endif /* CONFIG_SECURITY_LANDLOCK_KUNIT_TEST */
 
 #ifdef CONFIG_SECURITY_LANDLOCK_KUNIT_TEST
@@ -761,6 +804,7 @@ static struct kunit_case test_cases[] = {
 	/* clang-format off */
 	KUNIT_CASE(test_get_layer_deny_mask),
 	KUNIT_CASE(test_landlock_get_deny_masks),
+	KUNIT_CASE(test_get_fs_access_mask),
 	{}
 	/* clang-format on */
 };

-- 
2.56.1

