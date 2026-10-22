Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667574;
	b=pIaUZWnMvEJO5ZTSW9dNsuTiHK0YQkUoHyXH/F33gp63sTHFb188Cb+3xrd+Zt+37A8I
	 hK3b0MUpbFFE4olZrbxNraWprjp6AMKMpa2OimLS2uzDOTkgxSgeAYp27fb3eR8t9Y56y
	 Rofc591d1i/UFvooJalByhNzZFoqc06K2IdxVlwLX2B50cb+M5NECpMCkB+BKgsWUx2YR
	 XfikVLFBDZLxs0vbkgrdEomdd0HQwn80fTUGbqEUihaCjGez88Iet6q6zFVsxQIwMbFq0
	 UUJBx7R5NggqN+VVhbSePxEW0XeNIGBNdAmsqEp+3PSkVR4BKiKHBI++LEJ01OuXycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
	b=DL+pLpy6B623Te/1EEf5k7VD9ByHmOfP/spliMiSSbMAVgP/UEeDQyhsGqQimUBi/kma
	 gUTxw0QUh9uqwQu66bnkT1wDkmFLU37FD6o+ptsZY/1QrhNBDhTIXJgFvUKIz49KjDlBo
	 8VXgFeNO5CzmE19d489u43DH/j6Vqt4C9oUjZw3QnmpZ6DEYQzEj4BdhwcQ9dRLSDwHER
	 Nl05KauQH2yG6YKRLREkDpbGxgYOKs44wkmMydkeWWIV11OM3zZKamOv5tBiZJmI2rvit
	 n+ST3s8OacaKuIBI6BR4VIIKlbjQ3NeH5L3OhfSQBoFWc5HNlDXO3IDxEjOwfhqlceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE47F606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 11:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE47F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcTQ4KX2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so1030463eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667573; x=1793272373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=ZcTQ4KX2ntDRRIv4SBZYFcVfL7jnVW4UQvhEXGWiWO2WaAXbf6L074aFxyEF5iD3VU
         4TFuic1S+pCJGiSI35lB4I7yYkRHGoOHkXdWSQQR4U3pV/n4zJyPtm5tJ9to/ZtLygIL
         le71bgQxKUPJ3MyAo6g+jM3qtoi2NVbf5Tu1U4XLU3wq22zUyKosor89B0sLXvg0yDIV
         3DGnLQGNFIpxfp8p3/AE3QP52gMje/KQmxEVfnDkaKCDVcPIHw+3dGzlspUpR5Wj1XX5
         GsY/RV6Ly2TXnB+77J5z05vj6zruUmcCqE0FNG9s5P/kBrLI+wnh5D1vQfOLRbScC5sV
         x3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667573; x=1793272373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgDo4vP1xHG06cdv66t6KcA+DO/n1085uQpIt3C0Ugo=;
        b=ZERpHopP9WXF2/jctc7sUoAZ1KMU5d0YyrXc5WBryKSjlX1aCE72PQ+ypY0b6ZBevv
         aEWoSIzZPRUSBhrgjVpVuoSGc6vc+so3aMJCrRAgxP9t+pZs4JEMV+pO+p3+nyGVuM8o
         tlLDoDgY6Lehv+oHEGzAh3D7l643TzFk5faZuo77AWYDE+8dszp8y0atmHraoLi49mG9
         uh7A8CMjf8qv1E2m5WX3p0wh/+u+DfS9DND+2Xc0l9u8p1q9f71Ls3ToC4aAYXIHqGpZ
         P6dPFDob//XlGkb4OZdp+86Xg0nfB0kIXLX7Up5vV82DHCeIeN+GpXmLdglkh9UwjyJx
         vdhg==
X-Forwarded-Encrypted: i=1; AKwUvByfY/Gxy+jc+nOON+WQlxK2KBfmadS9HG4hFRfcQUvDGLBvDY5QI2dISGeRua2XDJCD0SOVqQIQlRcoalUEJxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRTgUwnAWbbFi3cFaoV3Z2Z5AFfzDoEsGVm+LU9et7uI3Vv/mW
	uSE/V9IjPVq5tFHGVZW8kRZWyblhY2nJLTr+6htahlqsnNcKfb2JeYsk
X-Gm-Gg: AYBFou1HX14DoMRx6pMzgxhAXpD4XJOPWrOgo3nTHcuU27AZHDkUZamiciusJt15JYd
	Ueb0Rp+w+rjK92la5JqcBlAMVd4CtK5fa3JiYZInweYRGWU31LlPaYKA0S0Hus56DAQkdML7SDb
	Jpx1XTnai4RdMPZdrp+f71LN65UcfwIpHA6Ok1AmgvEnC5y9qFpPr2vjvwMYhq+5tLcsQsN/C5R
	BarPXH2eWcikHj8vmm18u4j3pVAW83K2uNVBX3FFUOq2uzjunlP7Gi278sXDn0BCuhjBfJb7WEG
	fukKGrUWXVyAOBNc6UQaC9tbD6zn8FDIQscrJVz2to5/7qn84Sfpea/2J6+RCO+wGhtEFaNT2FD
	qps7zk32KZSnEP+7XCKnEAMIWDwzVKKOkN8ZXjA0vgdWyketVEPt3VbOhsLfK7UCUb5cC16/aj3
	o8sgG7pJeJ3B0BdDHkDkfd8iFmxEnbQHWAruSxeZ2Zc3M2epFT1fa7giyWQ929O6MjpqB6FxKtA
	jEAjpIWO4wmjinsZIAyJRXAPjP+GKHi8cCazzqxuGooXx8Em2EtFJ3M1N/XHpsknpejtRugMVbE
	7KXHCukQIzUC54+tmo3CYFWh4AmrXNawnKwk5apBczeLhK+joKBzpbkSKj255CStJKzRd4boImX
	+4tc3gXlyGHKj
X-Received: by 2002:a05:7301:4392:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-368af6a28c6mr2581832eec.12.1792667572921;
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-368ca914bb8sm6369653eec.5.2026.10.22.04.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:12:52 -0700 (PDT)
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
Subject: [PATCH 0/3] selftests: ALSA: pcmtest: Test error injection and pause
Date: Thu, 22 Oct 2026 20:12:41 +0900
Message-ID: <cover.1792660433.git.sammiee5311@gmail.com>
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

The pcmtest driver can return errors from its PCM callbacks and
supports pause, but the selftest covers neither. This series adds tests
for both.

Patch 1 moves the capture data check into a helper, so patch 3 can
reuse it. Patch 2 tests each inject_*_err parameter. Patch 3 tests
pausing a capture stream.

Tested on x86_64 with the sound/for-next driver, built for a 6.17 host.
All 10 tests pass in three runs. To check that the pause test catches
real bugs, I loaded two broken drivers. One keeps running on PAUSE_PUSH.
The other restarts the data on PAUSE_RELEASE. Only capture_pause fails
on each.

HyeongJun An (3):
  selftests: ALSA: pcmtest: Move the capture data check into a helper
  selftests: ALSA: pcmtest: Test errors from the PCM callbacks
  selftests: ALSA: pcmtest: Test pausing a capture stream

 .../selftests/alsa/test-pcmtest-driver.c      | 167 +++++++++++++++++-
 1 file changed, 158 insertions(+), 9 deletions(-)

-- 
2.43.0

