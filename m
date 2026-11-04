Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826573;
	b=zqCGKLWkud8FWY40H2F67r/zqWIzPNZ3BrKARImmsxFucu3hQRwdg3nDGtikSB6/+UUe
	 O2fJB9jBjIJcdC9He/hvyyFuTZWBKFQZq5YVhDMaF2SvU7WCFiVx3KYjPEu+hDqvKD0zo
	 YC3UwwNf3w8W4ywpezha1RyE8CQOYM64c6YSWEQTJNpbPkZ1dKQHwcVwj6k+yEVt5XuxY
	 WA6oZ2d/1JUbE7i4npcWwNQx4eQxKFJEEF0VRICMZRzPI76ZeCTkp6/clYsA2DB38ueo2
	 A7HQhLVpF12zKcff2QqDJFJASB1rYL5U64aVX+IBhwJIXdXMQ/NlO9ARf7SyMR8ziKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
	b=vj3a5Acd4TSXXU7ty8j0Yr5N5/LfaBRuBLRgKa9FHxpdWoVGKdw6/GGV3cYb6myBx1bO
	 IsNcBAPYVTNn64vOcMcw2vqRD6uD6aDDE7zRp2qBPiXOCvk6trSsQP9B3pEO7bQolDZg1
	 7e1h85rg5EqBmSPcUfX5VvDP5qbTbxUHDyuRw4EzKeHV3O24jRBEWtT1z06+iIl7Iqich
	 AQ7NLcuZn1Lhk3UzMLWIWvhX95wex928ArRNaUL8QpPXsxi/yxhyE2ELtojyQ6lsPLgR6
	 Q8r0a5JNqe4AdAg21xyO2W8qoo238/nMf28o+1DwymUMY6gkkoEgFYj+jQWtT5ITRrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNleuUFv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7398607E931
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7398607E931
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNleuUFv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so11978555e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826571; x=1794431371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
        b=yNleuUFvXKHQO5Qgbw//ExknATpNsOSVaC3K/xU3oDknAycNLKqEzInKcKsAtr5EPf
         Qy8MqurLXPEku7zhwKGhHi4YCR163qp3/bmpBefEtKKjbDV8x5iwk319b27zPIsZ8BQC
         GQCzghEJHgG2piORnYWKLx8CwtHDbKmbwrRs3TtMEu443e9gggfO78/v2w4vdRQZAC1o
         0hGj3M1pnqz78vq/OKDi632mKvpzbuxRPbH5pe2SbA3h6whxFEhwwGwztbxcCWvFzgx7
         6K3aCYxbxH2qvQDVbouruIm7cCVVkB/GHlsvxSHaoXZM2hYIOpO55EQe8GAh6Vq7cPOo
         4JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826571; x=1794431371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss5K7VdimwtEzHrJxiGNHkTNhcFCp3+4eOm/oJ/PrYc=;
        b=zpkdt/oJ6ovHwbnBDsbRBG5ck9E4hRQ8IXf6ioRQ2qEkWUk9Ault+J5SXolPbwMCaB
         gVoB3Y0798boPnktN7rSXov7zgddCgognENcHUmoDs2A9JQZrjN3IWd02otFpwPnTHxs
         d0ZifXozIgDwe2mgDv01S2MzOSg36dwxtYnYnZzEc+GjR0zZldDltJu3iRLqjs+knaJj
         Dnq6Wn4Q9DQCvy+jtEuZdfjrQhbgvBb2HvZctwZPEDz7qerMCdFM6r1yhaARmWpb6991
         0jMuX+dJHmMBc7+WRR8HQW3/c99l3TywfpZgWD03cAXZyTK2X11l9hZKkSGoQMgBrt0c
         ODjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjIPInjZnYjdSMdcPdX7iHMbknyO5BMFWdu1nLwO2TsIq/fT+t4UnlHa5gwXZjCU/trS6pz+6nUV9UqaWOWqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BP8WWEd1P5OatjpiWbYzNF6M8F6v0sQXXDoJiJ1eZxk6Lqgj0
	OqbRbSp7jTctgkGRrgZOvwKBU4T05ji7hSoHohtDrTvJmlz3I7g1OSqY
X-Gm-Gg: AYBFou0hdSiZ5m8HelGCcdRBx+VIgNSJvjsgyzHMaeZlhZwxltZRPWOy+OovY1J88xO
	axTlw5dXyrr335MOykzkp7ULp6/nKrHgX9d/4iKa6I+xUcDaD0esDDLHHfyUWC3gezd7uI/J1NB
	pBLhoSfVP1LNdKSFAUjL5kWwPZESK6ZkgTBOO/JREaWd3+RVzmWffhG5NB2lU0adMI52Ks5/EG+
	OSW4kwS3JYeaA4AwFFsqmMzGdMr9Iv9vlxMhAFrrKxrY+WoYZImoGsYLm7xMWHA4/yxM5xEWPwn
	gmxmFN2ZxxHDoSQlFu+AG+5z8eAwtT7f6aVowNd6I8JelH7rtxhNikXmtlNPCKW6Gow+hIfvvnB
	Irf+LMTF0ZqmHcEJPToO9JqeUEQKlifJ3Ia1VRATJPDOkSJHnPUOtMKscYM29rLIw1lxakwFYkO
	VCcnBX3X2liOY1lxThh3KLS2eMXMO433IVajRxT6A4E5s3c+HBKsn5+MmjfObqqJ5ROdMs7E3Tx
	xdL0PnqhglyL4qobRt5lfhj3n4Fwgvvn7b/81eR2qN4jrghiY1tq0sBFr4cH/tAH4whkUVL+Yes
	81kJb+3fKzT8RqlkgkN5o6vPeeqaMnacDSlI5LECNHJjf2Xbc0r3Yw==
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr390832275e9.3.1793826571178;
        Wed, 04 Nov 2026 13:09:31 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm5654419f8f.10.2026.11.04.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:21 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:02 +0100
Subject: [PATCH v2 16/27] selftests/landlock: Check errno for combined
 VERSION and ERRATA flags
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
Message-Id: <20261104-selftests-refactor-v2-16-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The errata test checks that combining LANDLOCK_CREATE_RULESET_VERSION
and LANDLOCK_CREATE_RULESET_ERRATA fails, but not the resulting errno,
unlike the other checks in this test.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index a6d355807dab..9a1d5b8aacb8 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -136,6 +136,8 @@ TEST(errata)
 			      NULL, 0,
 			      LANDLOCK_CREATE_RULESET_VERSION |
 				      LANDLOCK_CREATE_RULESET_ERRATA));
+	ASSERT_EQ(EINVAL, errno);
+
 	ASSERT_EQ(-1, landlock_create_ruleset(NULL, 0,
 					      LANDLOCK_CREATE_RULESET_ERRATA |
 						      1 << 31));

-- 
2.56.0

