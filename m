Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491534;
	b=U6tGC76dulEIqaUOSvbyX80nrPxU1+HwBQpwkF3pCKFKJOXWvHYxzb2x8ERmWSZLD5dW
	 V2B5NFrvehyfkCFreHD8oRfuyL6TXlqJtz6n2jdwmMldoOOQEVi4jUjxicn1wJk1FIbTq
	 mHh7k67h9Pb5OaCCi6KStPSkwZG4p/9+fHj2RYsgYSqsvC/DdyuaPctTsKeBg28qqXZE1
	 w3ItEDIFl8YkAYCWhsMX4ZTdJ6OlfvpkCLvQU3y88xOpPmdseSe4NpBnDm4t1/3slmyjQ
	 VGeVcPAckx9c4/wf3Ndyum7lFvdSMJMrvpzlProOfJn2bI5hHOwg05FmO7r49NNgdsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
	b=yhrRzQKBoMSHiWf9gxLeK/pAMUVxb+rXicaVFjkMSkX6fzLDKXdjAAQKCY21PRsKnPxw
	 rwFd9B2ROBuSL9ir5j0u/a16oaAF+pm6xj8D4GHnOwBVuidIViyrYPFw057nzRYbXnzNl
	 Uz18/OwEtk0OFosu+HFyJ6ha/dFuSrRxRAAvtIyaXc1E3Y6a4rfZO/0c9UbaE4/zGof3J
	 QI95lIeuuQgkbhyBvQR+d9AkP1gN8C1At0VwkCTDSia6qRSLW8JNcOVSpUl17BnQwXffo
	 FROCRTdtKKxfcijMOrVSpBMFArew+DzMGAIKMJubbXxMNPND6OfXP8lQUHgVzo1HPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E659660A2630
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E659660A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2271436a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491533; x=1793096333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=JFBN4KRFAZ43sCeTjeCE1szadaKAUH8DaeSNJoSbW350D3FK6xZe0sGxcfgSBPZl+s
         8ZnKpscdxT5pg7lvsIl3t8JOgV0lzwX4IhdgYSSuYYKRjNgn+mtFG8SOvIs96W9pYXFC
         xp5/OVn+QhS9Y4RJkRwE2rt/K2WhZ0HCX+zqBL9VjRmUuvCsxIIsG2daC5mogziqzbH6
         ikP9Iig7ySjDmD79GiglVWN9sOHXKVf8QOb/MwkX7/2Tha+8xpWwhWtjyhI06HK5TsHn
         qE238JBOFQPecUsoZDLo+E7cGUp1qxmEkOlYAFZkk7Z3t1m1cKenlpLLY3yZG4deec4l
         6pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491533; x=1793096333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=PSGcq4N9mWcl2EfCi5XK2hz+pkvdS3fMfvKaq1fcvA+A1nl2xuYl+lLepnwWu80zB+
         1QxDyOjlfp8uQnVaaEvGzygW0AY3TzJaPvPSgjuGoK+OIo/oHnqvGkKguEe/cPlLfs1y
         KwzXxBXfNTLzCnujXhVeZR+9AeJtAtSoSegp5fcGKJKow6uxQWHY4gA0ou5OwOesa6fM
         lsYc684pJ5e0uEX12bBJHtIgyqwH/ilZBGP5axxJdpRdRvasdoXxF3nA87gS63wG2wHu
         lZTVWJ+jUaPYpaYV3oxQz84iNFOzM50PLhwwBo3/xBVwj83ZzjbNOxoDsd4yHxvy04PS
         667w==
X-Forwarded-Encrypted: i=1; AKwUvBzpsCHyQ5YlhILehcCSiuMBDr4zo7qhGFWGXIY+WZLyyF4LX614qI4XCYhAivqVpcrkpQRD3Z7i3NiWwHt4QKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKAScY4Ml0DQspegPSwMmDX/9h2UKpM+08ZfAAKEIzY7eBFiV2
	2nhzkxvxWujMdYdnUkXK/L+J/K9Ges+jrUFJ2thYHmhyrBPaW0vec5he
X-Gm-Gg: AYBFou3YiiVoBve0OBtmmSeVoZQP3fk462aSN6xpp3qtszg1csTLXkl2uSfr3jjiJ8e
	ZFjK4H7By9d+UtqoTvevRywDdSYURNXgg0yOcJ52GDEIKYyVh8oH8H2nIneKXjgctVmWqoI0fGU
	IOWv/2aiNr46ufR6lxmXe9fSTnAlY3nQlb/oDmG91c5viEdVvqC0YPGyvlZNbrRKx13CVu4lfuV
	0mxmT4UpuqRqvGv3C1ySA/wM3Fl36PzY/FZeocp1bdSPE4SVwupBdLiXjSc+Zc4CJ19Waw8/KqC
	zwOisGeuic4iwt7oFMBArmiiqb38gcMIHGDHuIGru4BwxV6qLEhO09yr9LsC3Av0+l47JqrLuVX
	6/YGaUhr+G4KXkISkIBlvim+2Y8RzYioYELcD6CMnm2b8Kea+FWAPeT0f8ISKtF9ktXmlBGB2Ld
	Ji+gdELFfXNUYRcivhQ1A0gFIrHNdpPzSQrgNDNVA2F+0SiZgm2xLausS24ApnyoqBIKERX2I57
	tlXT+KWdwEcUTYin+s52stZHBP7tQLc9L4MzkGRb6m/JQ3ye4VC2G+1hy8cGC4FQADDYawnGMV9
	JMKeUOKEmfY/JlR+nwPa/DphToGae4QK+JWwHWSz3CQeNtkVnoKF9sogRv+j/wpyyko=
X-Received: by 2002:a17:90b:28c7:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3acef15c97cmr8904570a91.66.1792491533262;
        Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:52 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Make room for the longest fill pattern
Date: Tue, 20 Oct 2026 19:18:37 +0900
Message-ID: <7cbbcef84d2c14a2f0ec0ad2ba55c6ba0a15a8d8.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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

The driver accepts fill patterns of up to 4096 bytes, as pcmtest.rst
documents. The test reads each pattern into a 1024-byte buffer, using
the length the driver reports. So a pattern longer than 1024 bytes
overflows the buffer into the next pattern and past the array.

Size the buffer to the driver's maximum.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 5bba17434a6b..e025a7bac26b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -10,9 +10,11 @@
 #include "kselftest_harness.h"
 
 #define CH_NUM 4
+/* The driver accepts patterns of up to 4096 bytes */
+#define MAX_PATTERN_LEN 4096
 
 struct pattern_buf {
-	char buf[1024];
+	char buf[MAX_PATTERN_LEN];
 	int len;
 };
 
-- 
2.43.0

