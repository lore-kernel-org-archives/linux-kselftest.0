Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826582;
	b=E1eYiEcuXz/t7Wg9GFRKByqCQ3i2JAEz6yuu+FdXZ5RUOhuDthPfYM0NIaUoCppnhp8X
	 AyXqj6b5Uqe4rm68O93aFXEfT2rdaaW1wB3mtdLLMKZddUsrzgpwjCZwpngMJoLp1KF3U
	 nY+lPBvTymVwRRhPzFvjHmJGykxvt1N1kj79hYMVjduj21xsiaFX4bi1CnTyW+6LnawTJ
	 sKkCAYG3n4Wa3A3CngF8UGKKq7e/BH3qwkRYcKKz5ApGs/If+NBXKjbqr/THyv9vFEee7
	 N3fK/tGNu8tlPCvcHyAANvdt8MEO9VyFaEiGZk6H1+4U9y6S2j2oWYeq1IC+qnKhiRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
	b=qPrOBG4Xj/BQ2VljMA+t1Xrb+Jfd3mD7RsHF0FKS03yXx1bIbV5aLoqc8iEv1FAF14yv
	 6clGZb1zDUh5ZaLaxWIqZtAUMknr5fXU3+6SqHEErYUTpZQ1d+D3xERVPsJRB7Him1WAi
	 niipwwalDTNeb5+9yz/NPg54q58uVDHast1d2IsqpArdkq3rpn0ziYNK6GYAAzZima7w9
	 yw8OiKxgEdt8iGCpXAiBHGdFePFcrMndMq+ZiSSWK8HO/OcFGPGaHEwrbRfRXiU3Ng3FD
	 hkaoMGRRJzLBrskBsUEVJBHqlwjN9FZpMtJ2gkTkWn4doHJ3j+aHBA8PcAqvxjuWFJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLfxyyNn;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CC60EA9AE
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D80CC60EA9AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLfxyyNn
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so620894f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826580; x=1794431380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
        b=MLfxyyNnEZcm5BNvBQl93qnqyelGby9KG1DmschMbVmDIbOW54mBF0Dkyzgm7I3hLG
         gOeX+pS5P1Iv9wi3WpVNIjLe0xoOtkzydwj59wN2x255Ea8oVvyJSmkGqNsEmVH4cfpw
         aMdQYaplGYqM/tHOEkiRPHKF2zCJPv9ex0HBmc6Y5LCioAEYXXzkN77/o1/EN1JUa2mE
         OjLbY4dlqZiv/f/6CENHFs8d3nXO9C9N2DKIebXsTOMIibxvHv8JmbUmAV4RS7X2s8JP
         LHT6qJG58btj+Pa+EVsCsDFQRsKkAwIBCSChwZOAsX9FYfRQ58RktUM1PM/KofiigjbC
         3gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826580; x=1794431380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wGIoR4gp9in+6KA2rLo+JQCdAPIELIZ6U8ykblXyZGY=;
        b=pjvQ0LYfe10eFjAzvg7/ccXADjxLvf4qdVVnMfaUJx3z38VhHtyVRxRIf50Wt73u5W
         IOz8Xve5Rq6U+g7CVyUFL/9ICIMr3O9lFGNilvTg0duvyiwelcUKAeuUzQrYO6u2BcTI
         mf1SB2fpEPqsmLR6ohHpypxz2PfbWlYEPdRxVMhKxRYxEpfVC5ZYgbsCdU0myvT8Lfjh
         gtSo3VUbBhvb5t7mM38vF3tdlZxkckMh+fUe3XLngURO7Ab//R5akQvUAfPPK7T+I3mp
         rZraq9RtmZMrCkwmn20tPSWem6IAPJPRqu1L5V8emIerAP3I0Gaq+A9JnpXzqvbqrgOx
         cJTg==
X-Forwarded-Encrypted: i=1; AKwUvBzw7ocAUWcRkrRxtk4PTZln0opYyPyLPAtUD+HC9kAksip4kdqXPobg3hpjMHummSZy66Jf5Y820ifJMqGHPQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MbebEVLkwrluQodbEVaf8oPneCn4D1m2FkV1rhl9LRloHIf5h
	ucIJwB/ZThuhy/GY8UgYIKym6XT2rhgdD3XNlhmFp7tey2dt4ihuZztF
X-Gm-Gg: AYBFou1EQzaZ+ikd2/ANSKgC3IsvA6ArVIRGUJlEIfXaFW6RZtX+LyeHqck6YU2JkOc
	tLs3CwW7FMxtTFadDcq1MCV8qYyJJ63MF/btDVTLcC9TmuZkeO35khp0clI07cYV22w4+s6B2KJ
	gkRyvDXBeRRTC1RJVPyziceWtX+wVAegvEs3G+LxYVGpg7XFQqHTddD7hoUs5SMz0NBHWISpalV
	ju6WTd90iF4Ilb76mSSqwfnBrsKUS0wN+d31a03T8p8jubIXwrMSS8nLzY1vGFflAJvu5y+fhQY
	1kFqW1bhTepuyGEuuVrw+vv3ObjVzz0slusU73hfpzORkWrvWpOX+9ceyb+xZSvaeLD9GDJ1+VY
	OC5f29+z3v61XrxhzL487JLOLVNOAikhMzLbxduikTVlnQ7gXVAy2g/MLh1juCJLVZCc/OPVOol
	gbbOQyd02KBl7PGgxjqUpIU7H2vBBeSIIsEujzdfoUMipwUF0Fkm/6+mPnKCy8TGcdsyDa4nbKG
	dMyxwEULDcITWlt/u19Ge4+IdkspXyAgpfraAdgBY6aLcduikNcbfuhMC4o+rzEyvfFUeHdopzv
	g1+VGUPvPGgPKYxwiWyZn+u8WbkZ2ZoK05UkgjXfxtW8GAoIz0M6T6M=
X-Received: by 2002:a5d:59ca:0:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-48fbcf02289mr9041398f8f.13.1793826580198;
        Wed, 04 Nov 2026 13:09:40 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm5568567f8f.52.2026.11.04.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:40 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:06 +0100
Subject: [PATCH v2 20/27] selftests/landlock: Fix the snprintf() error
 check in matches_log_fs_extra()
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
Message-Id: <20261104-selftests-refactor-v2-20-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

By storing the snprintf result in a size_t, the chunk_len < 0 check
could never be true.  Store it in an int instead, matching the return
type of snprintf().

Fixes: 316d06b01130 ("selftests/landlock: Add audit tests for filesystem")
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 10a386a573dd..1e94a3171e02 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -7449,7 +7449,7 @@ static int matches_log_fs_extra(struct __test_metadata *const _metadata,
 				     (extra ? strlen(extra) : 0) + 1;
 	char log_match[log_match_remaining];
 	char *log_match_cursor = log_match;
-	size_t chunk_len;
+	int chunk_len;
 	ssize_t escaped_len;
 
 	chunk_len = snprintf(log_match_cursor, log_match_remaining,

-- 
2.56.0

