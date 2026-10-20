Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491524;
	b=GacCoXE+TqtU9zN9ElNXtWhRvjC/hDBTEOAre0oGoTDCFxjGD4viRUxKkzIuVu9sx6fx
	 zMfV/BpcGfjBBrWrLv3Az21OerIXJC0UWENdZdmbugX0qATPphs7+F6DiGJVAEvK+ZNXU
	 y0QoH/MqMdP03BkNF66wWNMcPPe5b27nIsnAK8SpWhax8SBF1dz0HY28koiXyCfWGCXKP
	 tZ1F/zucu1o9IDz7/x8wIhfyWxoR84RwMf0wpZ6hSfwjS8ovtUVHXKclY5kncVaga26XG
	 gnxZuh0KdBl39+HSRCtGucWAqQ8XGmJ0h7LU82mnt2rqZqpZ5xTftjFn1eEACafUcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
	b=JpWCrE4Gugx2Ku8LZScNPyKZU9VAoqThKeMxmenXmDDEuhC4UM6CCv5Rzbz+jDgTQ527
	 3ehVG7pKdj/Rd6cO4bCrBVbn931uAZ4mCLaZGX9ysyER8P28vXBWJUypTZpV+dARjah3J
	 /GfyJJWK9eyfI6QX2hNU5CcNqMPY6IbFM0IWQUKP+ao6+8lkW7YJln4JynmIupS5BGGVA
	 z+wuCVd+CbK9jStNbtmyq5ag+FddAzC6Z30yEk3SAMlCMdaIkm2ifSaou0zi/0JNXHPQX
	 l9QcG8bSVWpRHaAwE7OJy2OCpKEuvgOfefjmOglYLdz1gJSqP/ovt7X3THuUgJtYASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0437606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0437606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso993183a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491523; x=1793096323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=FMS5SmBKqmR3FOeqRu9NPrVBF3sRL7+sasEaKIq+pZErHIsInCvmt7/abw7PBxiO0b
         /kcXmODuJJky7WdFK3b7Yleqp5ab6o3+YBrBw9biK+8blt5RC4K1m6cHxISUY8SMOsBD
         5OBWDi08NGprHsWOpf2kTZWHdna5ZnyFKqtT/qXO/Rrkz26GGfHzJpP+D1G8up5SgT5d
         n1Xhy+6XJXVAx9pNZBTAs46c9QiLYEh8wde20OfDxsfqySCjqN3btgHlluDOt3Uw91go
         O04Xy8U2pLdq/VKK4tEqGfyvR16zqHaUkZ1hQWNzImnIa/yn2DgFHT6j5siiYQeVhogK
         Fb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491523; x=1793096323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=ljPiswQff0NvN6Be4nY/h6HkY+diJ4DFU2PH+MrPnKSJUkfo4mEJMLCTtDoErz/jho
         L92xJJtQvzIHntgfe/CYfWXmYt7Cranr2RRgbzx3swKzgWUouPfQcbR/1YdvAQHG3bOO
         UGlCOTJRG2PU/abgO/MTev6SEzt65KDYWt6XZxLIrrjbvmk2R/LFK6ledRwMBgORKXZv
         vBVptO0r8f2r3iHCXqP/d03ToPHk91LjN7/PInB1mA/igU43pFFr5fLFaSxc1Ec4l+js
         n/7b0qjl7EBUuZ1fLFO7ZnNLumb6DpueIXh0YVsnotc4PWc1u+ITh65Bvdxaoe+vaxJA
         GUyg==
X-Forwarded-Encrypted: i=1; AKwUvBzdVscfvRXl5FMObi3hlAj+mihiacA5J9DSlM44TkyPJ/zbPrUTyKCqKgKow2x+/KM3+GixYUYPL7Oiwb9ty54=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb55Xzgtr93foeRFFASqxn4s8EAES6/bKFaHYm78mcRDerS4LO
	OS+mEjaOjd8ocLl64873sqZw7r4GPZD3cKIC06zP4w8S0LXGCdA3GNhw
X-Gm-Gg: AYBFou1t5WA/aI8gwCrpZeaYWh83tdbU1YYy45caM7aDqQrHksPM7BHVXhrvkcTC0jQ
	eN+T11spkpgOriXvWKdIcacrLRNj4laGZ6gakz2w5RxvqUUeTPmo7Szd23ualE3FllpwulHfzf7
	CABFdQqDZb5bHY89gtzP8gozsLLT2C7Q0DmM90/bWGhhdUXOcIxxyAGXB1NxecQjS2B7T+cOeaM
	L8Uh0rhzsTKiPRUFIqp+P7Lqs44wq7hP5wITsqqexUpH7qa65zkAmv+k1mCQU7HjWG4eUltPyx9
	pEtHU8qMG3bUnf4A1NUk6XYMgorNJtE4Dzdsn/TKq8J8jUlv5hEtCc/mqqcG2ZEusA8Ua37wZvP
	9fQ+GQIz4jFZgd28gOpqgey5/Dx4+K/ALAyejKIOmc39FJMOwgxD3bL/IPlJBLVb9hMnHokW4Jy
	3quI16pEpJc9cXp3QSOxyOu6d10AjFOfUsESo8/T1E3EcsZLxBctX7xW4zoxY9PjMWJA6qH9FBy
	PQTfgBvtduZXsd24zb4cSpjJofCIx5NaqZsRLUasGBlE16l3Z6FSqXMSKIupMRzGL8jaZLQPDSQ
	X0J7x4hH5g==
X-Received: by 2002:a17:90b:580c:b0:3ac:c03a:38ad with SMTP id 98e67ed59e1d1-3acee276f1fmr9591757a91.5.1792491523233;
        Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:42 -0700 (PDT)
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
Subject: [PATCH 0/2] selftests: ALSA: pcmtest: Fix two test bugs
Date: Tue, 20 Oct 2026 19:18:35 +0900
Message-ID: <cover.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two fixes for the pcmtest selftest. The first makes the playback tests
fail when a transfer fails. The second sizes the pattern buffer to the
4096 bytes the driver allows.

Tested on x86_64 with snd-pcmtest. All five tests pass as before. With
inject_trigger_err=1 the playback and ni_playback tests passed before
and now fail. With a 2000-byte pattern on channel 0 four tests failed
before and now pass.

HyeongJun An (2):
  selftests: ALSA: pcmtest: Check the frame count of each transfer
  selftests: ALSA: pcmtest: Make room for the longest fill pattern

 .../selftests/alsa/test-pcmtest-driver.c      | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.43.0

