Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732574;
	b=nmBXCnGCOhsiwz9QRgS6E8B15U/VEOAcU5gugTqk99i3WhqSlrWspgeLITTvnr2Aefu9
	 fNtADytKvGplL218My9r4HBzDqJ+Y5bjHCxP5kv3qk2TysL6+64kTTCi4pWLcG2dtFp8d
	 kKC4zit432BIXX5jP0SqkQi8QDZ4ibVnridHSx3UC74yZ8mDuFXtFXBF7/hPwuwBxDdwO
	 JvHqJQY85mfJ/DxmxXxAQOZ6hV2PoV8p3OanHK4al9ETUuWUHOK1+g/8de2fV3urcpy+G
	 VzAftaTSwdnba+hGzd4O0+6J+aHPsebO5tg5vknKCAVGyIilUpBxo0TDczzIRFu+5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
	b=baOLELGAGAqom0A5e5ZIACxupGsCdfN1Llqm+AeBPBhrjgsKaZNPHNLLOoagmQN/8EFS
	 wPkQHTfw9kxGoqZT0k/kS4e10ogiS3K7/fPRam9sSkVuZhPTMjY0Icj6ZM8RsU3xMZqGJ
	 ecCO9nCWZUKMep82MyUzsPNlpGM3tzVbbnjFy4XuZEQ0wdfA9jredUmoETG2pK93Egje7
	 wF1xtNGDua9zgb0SElma1hNxFfARqgnGxFgTOsXnYAZTeCI3JID31mGsMNbKxwEL06TJC
	 AOQQTQk3SFlBBom9xaW3ke1J5aUxWaJPlcq2rGMivCVRLzh1GT7Z/+OC47qCNn9GLvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OCuvD+/Z";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85135606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85135606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OCuvD+/Z
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1062890eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732574; x=1795337374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
        b=OCuvD+/ZYUyJBwtcZ9SiBfGB0R3m8CJJ7uqWGLa/nM4vATgtMPx+ctTwj7DOFy/WSy
         xYM9s7AIC71gtafU34SjUfbP42VHORHeDHCgT/rxFrQm27TQZuWF8oxNkE4n70r9XOqO
         LBER5aF0bszPgv3x4eLobOwaI5Zb7garF+Vx6tN4kfj6yIKL7yslnHPCgo99qdkuBz1m
         XGR13Qcev8Cv8rQqXmAIVPC3l0malD4Nrx9xckR6EA4PqvZYdQhzOZg6v0V9CVZ4Uvo8
         APkxqimHzKZCWFVghVvRp9+5q/bcR0GIoqiJ43qR+OogwZmegVnsi2ThhqlNyiLLplL/
         iQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732574; x=1795337374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+DlzZ54z+gqYS2j5LWpmlloxzsta3AIypG5vjV0hKY=;
        b=Eg5TPzLtmkTjkwzLV8kmSeGPweCjDpXCQT+vtRCEhdOlZEfZM9uweZMHKGD1mt10U7
         t+NLeISwtCSsdLcJgKMnCFp4hAg/CoDJTxBptyyYjTw5OR3r4fqU/t1ZMEM5UT77fDWa
         yJVenkmuRPtnN+Et7qaN3YpGZrJjLrTj4r26a692FmVbXm6MrJco+9l3ywQ4icSrQLcr
         Ubvgn17X8bR6i0siSd1aY2rNXkSyWOWr5PV/A4fONS12XFh+kKP3wZjjGoEv/cFV/CMi
         91kid+aQ7lSZNFkwkPVV3eDNYiaVSCwapfIrn06fFBvLMwmsAPU7AANGYc9C1xoTUTFz
         N0bg==
X-Forwarded-Encrypted: i=1; AL+hErF8f/gkgSni7MPN5O+8UI8Sg0aEmz2N1Tby8hRAX2FwZH2aR+KWh03r7aR2cuIpqjx5VGPaFv7z6j+2G28N8rA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aqi8ukXNfiYA6lOZW+tGLO9F90TaMN/F5qP+1QiYv6mH1Xnve
	wLwKctKDATkNuiektXdgz0Oor+08GHPvMb2/h1PQ5JbKDOTD0iwmil1T
X-Gm-Gg: AYBFou2qMT6CFzJFdXJ3qOpXi74xKLS32ROwBUwrPV12DzLXDNn1uLYI1jGanlTU2B4
	LPKbwjrQJ5vNdAa3s5Dn1Ni2+kmKAcSQ4CweO1YO3c5DTbW3IBQf2rMjXKwUhA2OZDGbde7XuId
	xERIfpAbc32v1SDKYhjCZk519UBV5aGzie/tDmodXx0exsQZsisQDUgDDaS/Df3RARvVbKeP4sN
	n57qSs7HAFJuHgdF1mavuSeD5vkvvzmZIm8+mpQzs78QUuOLIhzrCCs3EZQ+aqPz024ZVibpQtG
	dIlCmcnXHx5S4n8NqbEXJkzp+VJIxhNwi1hdSE1RowjBhCevLCvIf7jBJxxwKY+KhxtsbLbQJmb
	NvpkFRpoBvHFP3Dnbgp/wI+qbb1txwv1G5oUFgkE5Urhkkay3mXJnvb1KpxvHd0UTrN4j/3xixA
	5+x+D8K4o7PuPVzpROC1pZJ8HhDfknHtew2fcm1wv5fRqvgdERDl4IXM1n0QFNCcV+Y1rKLFj/C
	LT0sTdtMXmw63h6/OqxI96dhVQ1YREDVOp0mA6SSIg3Chsq1LoRFnrD5SC4d9cV8AN5/hK3nfL9
	ADqFr4TEEtOczq0IclgLJzIr6yBPana40SfZydSgg0w6EOcCP2wPkjBCn48L1EI6IUmrxt7Wf11
	b8XQT9HMYN1XSfYSzOorBeINRmrwjiofO6K9p1Q==
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr6019030eec.14.1794732573612;
        Sun, 15 Nov 2026 00:49:33 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm25221051eec.23.2026.11.15.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:33 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v2 0/2] Fix unaligned enum values in btf_dump
Date: Sun, 15 Nov 2026 08:49:21 +0000
Message-ID: <20261115084923.53182-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size, which shifts a
__u64 by 64. Patch 1 copies unaligned enum data into an aligned buffer
instead, as btf_dump_int_data() does. Patch 2 adds the tests Alexei
posted in the v1 review.

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (2):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                          | 13 ++++---------
 tools/testing/selftests/bpf/prog_tests/btf_dump.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 10 deletions(-)


base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.43.0

