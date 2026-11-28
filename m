Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848757;
	b=ZSXWPd1vKz66QwdKj5o3onSJChmjAR9GMU1eXXRan4020ERQ/2TtSUzP6cExChCWYJm/
	 AqAQ+5mKfmQ4KoRV+oVohWyEfEm5CzrpXgWljPRwbWNvOIN9MDTzQuDYcYDK/LGb7P1JD
	 1/VUYOSWf7mh1oqkoPrdGRamzoEprQlyiEki5TZSDGOG8JnGbZfGU768A/KGxQrUeFa/i
	 hp3ImX3WUPSXzlP4NsKplj6eLhMI9461HGfvEGfU9qKXuo5Uj9qc6OA06fgqT04yzuBwQ
	 vRhKf+jA9RNMrOM+FkTEstoxgFkAOdByJOwmSdkbWCaVbeIeORHhd3TlNYWWyU2+fbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
	b=4WIKTWJeDDVr5TRAQ/XnWBoto4j4F0fn+ibNlnj0d7aXDw7TdKREI4Pj8tCoVMEsQ14J
	 mgdaonfpBHgvaK10ChFhB43DRgwpCi8MCt8rInxy/HCvSSc4nyxHq3Vw5Zbwq+hw/TD5L
	 Dk4+FZEf3jD3xKBAVnTiq5pCNYkul5nKCjScK+tytzjsT3T2uasym8Ix/ItL7rJUzrDvC
	 MYE9hZ5bKvx+qPEBc5WHZcddXA2DZYx35HZf/zpReun20rreFWhCr864O0adwiXztnjgl
	 WTyXYKd07+Dl5D+QO0+TscGzzYfhRKygKp0co46z8AgvdENTWrCYKLwzgunWUIVotyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFCE606A32D
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 06:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFCE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb2893531bso4608219a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 22:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848755; x=1796453555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=ozrzSuj+tBVwucEUNw6rNl3r0Dl44+0eZyMmIj86t/YsGlH4ry14kwAIdUVsGkGzur
         Z3/zDMKQx7HCbpoKnQltGelr0o9ZvEcTG13i3rjzgfnAz6FvtoAc5mGFQFbFptg7wIWn
         6sfXlao+lCegr9lfIOXWKQ8+stqw0U4kIewGOBkSIWVo699lcYBNtssLoXOU0AHM9Tyc
         dsAbv/NX49N0zY/0ehTJGILTZKOtithPRIRj6LcFkdqc4lHqa3fXKzryxpyRXZL1JzrL
         cJCs7lLl9Uu90qMMz0wPd1xwd7QencG7w2MG5cFH0Mw9lBJMzX22HaO8MUJlHxhQ5iAQ
         4mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848755; x=1796453555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=sbUstoBTzE2h1V/2Nrv4zDBQlBCcQp2cKYvbmhnFWQbSgq8cO0lRbAqjvhTxNd3/19
         VbECLo/FEDqbUJHiZvQSDOH1/lP8sjoClUvrQtpbdl7WqZPQMSmz3N+WUAz5ssl7Ih5b
         JI8BdiwEdKRVIr6d7cGoBeeUgyoyQ2L1/vr3A3bGOHG/8zPkENdx3JA+UoF1hYjP4YyB
         v80YrbP2wRKm+ffmCyGxCgx1jP+jp3mUqd3mQeloQtPCA88pFgZAyLIlK1RB6sLVPQSY
         bNplhwoDy4690+68qceV0l4jjXq94S5gA/u9d8i0W9rsoj7bsgb8cKLoOc/ix9+8tkzY
         4QYA==
X-Forwarded-Encrypted: i=1; AL+hErH2tnLtbimQ9s1Monm3n7EeI+k7GHR0upkZ6Oj82r9G5UZg7Ruxzbt9A1Z7fZhnXu7srxLfjvto+kvTTBDPoGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TI3tFHyYcPRhQ0q7U02BQaZ5rbkUNqubHvVuQpt0QMdBYHeip
	p7Kqz5frRFSyNPWMJ9TNBEehHyuQHDe/77iDuJ0f4P6K1X6Rfq/P/aRd
X-Gm-Gg: AZFdTZd7zNSbdb3JgXOhmqKaEydjJpy2sHlj2yZV6iAJn63X7mMu2KU9qY6scFJK/sK
	PurFULXcBz20uDW77GQLfM2tnqOivSOIUY6xV87oCWDzpT5D2stW23XdBDNV8Rv9FugwQtm0USa
	a/f2vJLAqDh9Rm37BGHU+6VQXdB7cSrdyj7SZpocEpnHADUOo50zY5etmOEaCYzsUe9ykoq3m26
	sA3WJCOm0hrywCdZjPOL9+pEj/1O4g0GqWzRXLTrXGbPY1Eu83UXjsNa+vyHi3yAw+2Ua1I3KqB
	xKGFJPTZjvvFLPnSTYxh7pSUK53FZCtcyJKrWdoPthdPtpRCZnVL7fVhJWlyJQYigEXYc+x1Yc2
	pqeXBHyo0df2dr76hHShnKq7KWX4nP75tcbClDHDqnlWyE4kq+tn3cXKp1c8CvEuePMp3+ZuNDd
	s6CTXL1tPrIq6uoJjza3rRu1JZgqOg0WyBCBcPqJfi3mm/eVZvHi6FGWOZC99fO2Ez5tVn7S/n3
	4E5WGkjtKbxfz7Lz1kxW/b5DZz8B+26Qb0Zzu0o3s3X0LY9eFja7fypfaAcqedsxcWzFKd5I0B9
	8iAY3tWeEeGXwHBPYXDw9+ourXB2End5zKLYcu4Rwxwi1cQzgrqXMHB4b7UIpMo2wRiVMEOv4DS
	6kjPZL28sPN3LaVCU2kbFNBVavgauVItGQYaw7ATj
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr29820014a91.62.1795848754776;
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] selftests/alsa: Let the pcmtest test run on kselftest kernels
Date: Sat, 28 Nov 2026 15:52:25 +0900
Message-ID: <20261128065228.3628550-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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
options the tests themselves need. Patch 2 lets test-pcmtest-driver load
the module itself and unload it again at exit.

Tested in QEMU on sound/for-next 486060b97284, on x86_64 from
x86_64_defconfig and on arm64 from defconfig, each followed by make
kselftest-merge. On both, test-pcmtest-driver passes all 10 cases. The
module is gone after the run when it was not loaded before, and stays
loaded when it was. With a base config that turns off CONFIG_SND_DRIVERS,
the v1 config file lost CONFIG_SND_PCMTEST and CONFIG_SND_ALOOP in the
merge, and this one keeps them.

Changes in v2:
- Patch 1: Enable CONFIG_SND_DRIVERS, which pcmtest and aloop are under
  (Mark). Name the options that are off on KernelCI. snd-aloop is on
  there, so v1 was wrong to say all four were off.
- Patch 2: Unload the module at exit if the test loaded it (Mark).

v1: https://lore.kernel.org/all/20261126035526.1779288-1-sammiee5311@gmail.com/

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  selftests/alsa: Add a config file for the test-only options
  selftests: ALSA: pcmtest: Load the module when it is missing

 tools/testing/selftests/alsa/config           |  7 +++++++
 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

-- 
2.43.0

