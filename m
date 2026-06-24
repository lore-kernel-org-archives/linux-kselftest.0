Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4013932D1
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285674; cv=none; b=Jh4VNEzH8BWZ2eu2jV2EowgAasKj6eQ1HB4M4HfVRS8fKXU92BCigUdIjTDVR9rcafUq4dlM06yk+FrnKRxkO55ST3uHOIzjpxfanKz31Veoazlg3vIc+czn7jokNWFA3KNNzb6hDqml+89kCVTgQCasMP0weevKOOTvZj7cAuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285674; c=relaxed/simple;
	bh=qO+g6GQpV6aFlIxqo0yG0p024slXcrAoJ12MOHIcRwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gF9HcqKMGCrQRaZ3233++KT8KFv9FWo2Io0vfFrUqDuT9JqB9bh6kgL3hHJhRnb1wB3tbYp+IoliT2SoWW8tZj4LjdkaC/+YXF4h4GF4MwPvpf2R7zCgj6wLbMF8IddRKzwZek4jv5JVPiby1VeFXKpdEmqGLAUqhl4eSy4M2ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyLzigKU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyLzigKU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845385adf4cso519626b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782285665; x=1782890465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dUh+3hu7+3YOFigDkyuoP/RqrqgTKFXSD3jKDVwGwY=;
        b=fyLzigKUluiB+9+U2qCvMTegEaIiBnTOnyK4f5GCtG43bW/4tE7viovvXEz8viztQI
         fSgCm+Fs5/Uq8nYG67OdgUBnGm04ijXT24gMZodkd7gK6WPWiH5kqAHgSSPrk6xeh8ql
         m3av2KHNS5yZm/wZiS6C4nRIUZtJY6ox7qiL+X84FhaRDmG6pGplSNeW+XzGrkygW5W6
         Zb9yxS67qMXx5/qO/Y7KPW6whCnZiElxVmY8nN4K/BIvR5eigXV6RQkqt1LGBwJ3bIvV
         nfvOvuAOSj4W3+uo0lNJSD977GUarOFIaTBQu2kF8UU34ZJgXC3V6UGEJTAR0EsqJHeP
         ziPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782285665; x=1782890465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dUh+3hu7+3YOFigDkyuoP/RqrqgTKFXSD3jKDVwGwY=;
        b=FpXpBQTch0wQBiFFWdR73pLI8OKYwqsYvYcARC/kaLe7ShAbay/S16/91i0VXjsYzv
         7VzQu81lYkDTwisOyE1hgLknnxc8RRX4v10bCrFqgkHRpU1Q9YKHIessCGZ7v/QXDWoW
         RQhOtuNQh/Qmlm/9wjdF1oQIJ4pKJgkCzJdQJvxUchaLFT0ZXnrtCKf8SrVe1COeXaAc
         W/Exi771j6CceB2of7ikibTDh2trqjwJRBqAodUIexst1cG/dOrqgeC4copZxFppzmFG
         fo+mFdXYqjLlzcI0pFHhEMN3eEcWG0pk/nnKF+zCCqIgklFxROHQOZW8lM76+9g8otYp
         kpOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GmCblogyCqyqBC9K5HYDodD1M9l6O18jRsW4pSpZ6DFcjY8YuIEwnX/7Zpn7xA3P74lxASbqBZwzv7Rfd8hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAn6vDO1aBkFDt3TUx54QEb6E8+zaSSMX5P5RsmoC+1G3RplTS
	vOgKmexeiST5ph8ZQW3moZaLwOsDVBb+1PCVqdseOh4/6IHWq1yb7Rea
X-Gm-Gg: AfdE7cnhtBEXI3U1ThTNX46pOUjHItfseUDx6UAyb8jd52oZvNLYxrM0yyAyVUZMe3b
	UuE3XeQbcTR/T+9amDegiX1f681sxsmdXEJS6ubskQayV0xNpuMgQeHTINz4rYhZAWHPPZWHFrX
	kHne91iSN6RgegfvwHyWqhHdooyZUKsWt50R7zA2T5rKJuDj4jd5cEr/B67D+NwDVraHigKqkV7
	GHeNiCVILj5nUhxbIjqtMdSAlFmWj/NC1CaKHgHJyXV6e0/BICGS3Uqnnat+gP0xYjQro8HO9C1
	1Dnum21ltdIACaWNAwEStSznd4bdvB56e/qI0awzRSI8W/fJmOtS84F+KgrnXDr9XhBdjeh9a46
	aQRowi9N/wg/mC2aWBaYmBrzNdjxL3SPqj9PHe7dDLuhjdlHsDQlYFAfjxLb13tlYs+E3aF7+Gl
	dWWR6emLBWRNM7zNkvtDxOnH+MQzmsDhcVaXri31BZeHnCwZxxwAEju9F8PQu5sCYHDdiJK7TkW
	/2H9w65XEJeBsjElkAh62fG1gfBz0WSIXGlTw==
X-Received: by 2002:a05:6a00:22d4:b0:845:286d:468a with SMTP id d2e1a72fcca58-845a26febfcmr3101719b3a.13.1782285664853;
        Wed, 24 Jun 2026 00:21:04 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([202.8.105.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a413c7ecsm1498555b3a.56.2026.06.24.00.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 00:21:04 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: sun.jian.kdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	dxu@dxuuu.xyz
Subject: [PATCH bpf 2/2] selftests/bpf: Add inner map template lookup NULLness test
Date: Wed, 24 Jun 2026 15:20:31 +0800
Message-ID: <20260624072031.735846-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624072031.735846-1-sun.jian.kdev@gmail.com>
References: <20260624072031.735846-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a verifier test that performs an inner array lookup with a constant
key that is within the template's max_entries, and then dereferences the
lookup result without a NULL check.

The test covers array maps used as inner map templates, where the
template's max_entries does not prove that a runtime lookup against a
concrete inner map cannot return NULL.

The verifier should reject the program because the lookup result must
remain PTR_TO_MAP_VALUE_OR_NULL.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/progs/verifier_map_in_map.c | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_map_in_map.c b/tools/testing/selftests/bpf/progs/verifier_map_in_map.c
index 16b761e510f0..c650731c6151 100644
--- a/tools/testing/selftests/bpf/progs/verifier_map_in_map.c
+++ b/tools/testing/selftests/bpf/progs/verifier_map_in_map.c
@@ -18,6 +18,20 @@ struct {
 	});
 } map_in_map SEC(".maps");
 
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY_OF_MAPS);
+	__uint(max_entries, 1);
+	__type(key, int);
+	__type(value, int);
+	__array(values, struct {
+		__uint(type, BPF_MAP_TYPE_ARRAY);
+		__uint(max_entries, 8);
+		__uint(map_flags, BPF_F_INNER_MAP);
+		__type(key, int);
+		__type(value, int);
+	});
+} map_in_map_inner_array SEC(".maps");
+
 SEC("socket")
 __description("map in map access")
 __success __success_unpriv __retval(0)
@@ -139,6 +153,36 @@ __naked void on_the_inner_map_pointer(void)
 	: __clobber_all);
 }
 
+SEC("socket")
+__description("inner array lookup requires null check")
+__failure __msg("invalid mem access 'map_value_or_null'")
+__failure_unpriv
+__naked void inner_array_lookup_requires_null_check(void)
+{
+	asm volatile ("					\
+	r1 = 0;						\
+	*(u32*)(r10 - 4) = r1;				\
+	r2 = r10;					\
+	r2 += -4;					\
+	r1 = %[map_in_map_inner_array] ll;		\
+	call %[bpf_map_lookup_elem];			\
+	if r0 == 0 goto l0_%=;				\
+	r1 = 6;						\
+	*(u32*)(r10 - 4) = r1;				\
+	r2 = r10;					\
+	r2 += -4;					\
+	r1 = r0;					\
+	call %[bpf_map_lookup_elem];			\
+	r0 = *(u32*)(r0 + 0);				\
+	exit;						\
+l0_%=:	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_map_lookup_elem),
+	  __imm_addr(map_in_map_inner_array)
+	: __clobber_all);
+}
+
 SEC("socket")
 __description("map_ptr is never null")
 __success
-- 
2.43.0

