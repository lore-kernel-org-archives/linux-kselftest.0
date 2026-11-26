Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665336;
	b=ctjwCRhe29ZXN9ndx85YASLvPwji6BltFENWU5J3v1i01ju99Ard6WYX0/mj/h5ZMzoL
	 CT7/SduwmfBJvVR4xjCEjgPLuJ+BN2LdpIlayKncJdWwVmFXoau8uVzNWdICXp4LQEROM
	 fNN29ClE2x8+effkwWWs1bta0Le8YZoJE03h01YmtG8jFJNsyir3KQnNH45HueWNoHoiM
	 8LZdHTaOk7haPRMJZsd4250TASJ3ghlQmXtjl4fhkwBsWTcX5xvsIOP5hnm/Nw8LqHpsH
	 4MVI6tVYNVUivJnNpZTAoBoxdR4aVzCfpK9aZZ8sgzXnnV/Do37T7uPprnwpQBv5DQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
	b=hCTYJ8TTMsZgwczMStZgqM4p4m7+xdZCxu3jOI2/IPo886SpdLSAseF9gxSh8df7Xxcq
	 1DAGeZ5yzNMX36o9a36o3DEocGMkEZNVOLAfsjnp37mXPUKeSpbKBhsTRTaBp4M3+XT89
	 RXdCdTIZAzklY8eszfrwl9iXeVJZWBnseIjYbBtdMH2ANXHyfyof/nnZJO0MGz4pvFB07
	 4QmuDVOOiHL3uYZ2KIE71tpga4fvdeuCUqkgXX6KzcCh9gstKq64pQHkXmwNkUVDzIXH3
	 LvgsHUGRnH89F81m4/cSYzm4rF067elDXpjS2EJKXhd3lfIDrS0Zxh9XcbiYqob0lOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi97+Y5X;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A8606A329
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 03:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5A8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yi97+Y5X
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b402824d07so4420054a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665335; x=1796270135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
        b=Yi97+Y5XxVeLxoZ0GcRiPTJnArsCMa6UtJZnLgRDB8kwD+g6+rvGeTyifi/3EXA9tE
         gp1R4DPBr1NFm5nxhzzjOj2ogUCxxGJ50U4jgGA32mmEv1msP6P2Pak6NIPl1tJN7E9C
         P2MDO1tMS+B+hxM/8EH2H9fxx5gp6EX9/RfT2p28tb2EHNfck5uvRHOUzUKhKeB22WrL
         2zlq4lXLk3z/QryViswDP395WEItttcjwUhPRqaYJAF6Eyswd0eehfkos6hoTjJom4F1
         mBzlzopGNu7G0d64OrTmAaB8tt45cMQGjxAtsm0vOtCqonc/y4fhpfV1CUZjBbYcSo0A
         WxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665335; x=1796270135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wufck9mMxhIwVpcO+iDjKyRgZZw2XaM/SGzNzGqVqrg=;
        b=L1ebWywo9UCoXTwt04jbozKWVRitN+5UWWea/MkAeTQ3oR8GkhgSgPqNOxkCEACWXO
         OdaIX/yUocqf8hAQeW9PgM9r7thpbeueuztJ4Glsw+5kxT75cNqF5bZge5tUdbIy+ApQ
         Crman1+daEXRBLj9bIPS3zc4HLKrwWcRtmVTu6tu0pi2vnLuSxe6us82TeIya/XXy7mb
         T11vlG+wJMrhflmg0sVFzPwWp+W2PB6AoNKX7+++mrqpj5nWkpLfJehlL1r+eK4QT6gY
         Y8UW66YLdZXg1mhHsvEfzK0UwaLYGJTEvp7y9bA4zrs2IjZk3qo2pRlRHdWdJxyWo4dF
         Krvg==
X-Forwarded-Encrypted: i=1; AL+hErH6KZzJGIEyny7XyIURmnuBnsjBPVXwzuUEp3qr+S8PmXzfxPG5mqjAI8wHIkGPK62Opf4o2jIDEfbSwlJH6ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MItB71bUzMNaI9vA4znTkB0R2McUSF0AlrN+Bwd7/BCBYaOt3
	GDm2ZkNZA9vFW/qxanUrTxKqW4IJ5SnjHKm+ma2JskSsrQTcCHWh1LBq
X-Gm-Gg: AZFdTZewGMcL1eA1cKeEZIZY79Z6r9DgE478nu9rbiXHruFCUriI6jq8KPy2yEFJTR2
	69u9g6G6pWw1sS7ge8f5crdiXt00GVrueuzk7NSaW8gHV4OwAVtgzMUtbSAX8p9AgsXxjZWgmz8
	O7A8jsAcbe+SGcnO0bVJrycTTaVTlyycmRlGi2Ksav3sCHjHkDkiPnofb+1Out+WYt6lRtNAaP3
	sUhz/Gy6PTbE4K9DjK6AnAGWJuTQJxYL7zsygoc6WrnuFWJcUezrx5fz+sxTRQFS7l+H+poI5fU
	U69pqJC6uW3jw1tubEzz/E8BtygWAto/O+TQiWEMXbWhLyw/m/QX03QoFxZ6cp3yyiSKoZK/gqQ
	w7J3ZzigkKnUbpHO+hDARaKw5NI9W90T/Xc/U9HEEiDH5YqsCjOq5epGpbukeAFJ0tb+upKfnJf
	OLfXGp5oSCLdlasqKYE8C19gq9vI8gwE9lJqAdsPb/H3Y8NUf7DT26lEXrzhiL+udFa9NgDBIke
	gE+NHVG2ncRNHrSA0ijSsaO02cA650Zr5gL8kJ+yiVGcUAoZsmlnz7wPH5u4LU2Es9JOxwr3u3R
	tNdir1yCzdk0LK4Ge2SNcERoI1ZJIn+d9OkenUX64ZQS0VshTI5Z7mV7NjCrVkLUertkWqpl1bz
	aPe3uouDfI2TwHAOAVOTpFEMLfnI1HhEebgiTJbYC
X-Received: by 2002:a17:90b:560f:b0:3b4:60aa:9b74 with SMTP id 98e67ed59e1d1-3b460aaa7efmr13255990a91.65.1795665335073;
        Wed, 25 Nov 2026 19:55:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] selftests/alsa: Let the pcmtest test run on kselftest kernels
Date: Thu, 26 Nov 2026 12:55:23 +0900
Message-ID: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

On the kernels that CI labs such as KernelCI build for kselftest, every
test-pcmtest-driver case skips. The KernelCI arm64 kselftest kernel has
CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP and CONFIG_SND_UTIMER off, and
nothing would load the pcmtest module even if it were built.

Patch 1 adds a config file for make kselftest-merge with only the
options the tests themselves need. When Ben sent a config file in March
[1], Mark pointed out that mixer-test and pcm-test check whatever
drivers a system has, while test-pcmtest-driver does need a config
option for its module. So no drivers are listed here. Patch 2 lets
test-pcmtest-driver load the module itself.

Tested in QEMU (x86_64) on sound/for-next 0dfd513a1557, with a kernel
from defconfig and make kselftest-merge and no sound modules loaded at
boot. All four options are on with patch 1 and off without it. On the
kernel with patch 1, test-pcmtest-driver goes from 10 skipped to 10
passed with patch 2, and seq-ump-test, which skips without
CONFIG_SND_SEQ_UMP, passes.

[1] https://lore.kernel.org/all/20260319084347.134744-1-ben.copeland@linaro.org/

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  selftests/alsa: Add a config file for the test-only options
  selftests: ALSA: pcmtest: Load the module when it is missing

 tools/testing/selftests/alsa/config                | 6 ++++++
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

-- 
2.43.0

