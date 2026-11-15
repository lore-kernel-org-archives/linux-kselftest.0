Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725116;
	b=LS9QeStUtYvTnumJxUaTJiGpCKoGpt6MlK/9Gr1YgGTQAIBAOyYAy9XreIK1tVjNhnzT
	 KmhB9kPRGOd+Vjn/cuLTWMKfrUbUqzrM17DvCv+3uWpLC2Rj1RQub+q/eF1z8gxgmgaOj
	 E0fc67MFgVcT9+DnWD+pUfAwKMcNcZupphEuG+jSR2T5D+YmWYtA73tfgYM1+R3HpKbZp
	 +vy4Xcem2eCK9dUEh7vOSXfYzeOKsif5sH9yIxXPDzQkamZY7Ig1WJfbWjiR6c+P9HimL
	 DXBiwtqUlbfp1KctLCHeDGSc8a/+c3QR/3VOfppxRudJ8xfBd6n90mZM641Q93UVLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lfkn0hN6QzrTX68Z1qKlGmMDFllEj1OBByMdOUCrOIQ=;
	b=kLNseYdPOod81FUd/BcZe7ql5U5uJTMAbAdHwv+ktxmuezljyNOjjAQDcb29GEOeV2T7
	 uwsNCzhObVje/8zypXRHEmLyYr2JNQzrpqvhDrZ61XUVupyyXckJqJ2ndQgqG27EqgOTW
	 rsP/VXbujdc94XJgot+bh8TfT1BbQlelYSD9izodxxm8mqvwuwQeJto+021PRVD0lhZOV
	 Zek9A3UVV8bQWm79dFUiCaDdrNG9pu/vKtKRQPHegRx5+uJrNXoI6Sh9qeGcToqR9nLAO
	 PbSprKMSQe2h4HDTvF60Q6cxJ3YlwG9swfcQQr+BCTjtcxPHt3WkmvqsMEmz4xv4Dvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFgv0V9Q;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283E606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 06:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9283E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFgv0V9Q
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso26358675e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725115; x=1795329915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfkn0hN6QzrTX68Z1qKlGmMDFllEj1OBByMdOUCrOIQ=;
        b=uFgv0V9Q+o4d+jQ9KvS95fh9NqdqYnK3mCuLWDTl4MlebLKKEduac76HxZ4sLldpgS
         r+qAuHiKKwtUrPO+Pno70R+lgWhyguc2hOkmIQ8n7ySIF+IfmYy2Q5EZWJkWCkYVHDEF
         g0uw0AgBVLMGuIvgeYisDXeCPiq2c1+MycL6Fowr/dhvs4X07Ql29JODthdYjp2Mf72w
         0eVtKp63U4rWpOPgJf2Q4L9+aXQg57gFpKGq1BJmDQHZaHPg2D0QVQgn1zxddk3VWltq
         hAMUjgXQ6EbRl8z0Lv02U3erSqkK2SVitv75qT+g0HqUyIBwjYaoDqj41gvtZb2MXC66
         6dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725115; x=1795329915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfkn0hN6QzrTX68Z1qKlGmMDFllEj1OBByMdOUCrOIQ=;
        b=o19JI7Ai5rYJD+kRrT0z6gqU553bTlXH/yhqq5Ot1arEEZs+tHEWhUAUxNcZTDjiYb
         embnCRa1tysF/JfcDZrUqrTNLfof29I9/MuW6kBrAhaEIMql0AfOBYJn/eGFZFX3hLCu
         exJywXKI4M9fLwDOrXDaZqkhHixV+ScCv0AJjUJgTjRwe0GUHJ5ToAKYV0N+RhHxtOvt
         sByNXJZcK316lBCLTxllYdVYrgNxd5PBxb/vMzJf1WmZf0wABundGG3qjhUdcGp6ds1T
         lpSmRE7nPQl42ic5C2rHOf2AdldtqdEhHXZ/WiWuewppaRqEX+KP6npPWtIoxeSzvVz7
         AGQQ==
X-Forwarded-Encrypted: i=1; AL+hErEyw7MNzcpGgBOZEtgjwkxWRhLCkRzZ2Ugrh/D4vTVeqVXZgDYh3gzC1gKFi02YH4k3/tjjtc7B0saNLXxptJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sBZMlYuO3Qmt8Vrm4xKa4ZmxGJmbuWmq1iP4S5vsH4YquWPOl
	ceIKW+ZP34OxAaeCtd4kV6MCb1P/NNy6zy+gB0b7L3vLRdW1JGG43mCM
X-Gm-Gg: AYBFou1EYyr8LrOAprcVVrrSjmYgoTIUqUFzBZ25Mzewt8MIgkMfotXEiTBMorpXoxq
	3DoZNw5RO+HegnXow/l/yGM+W4iEVNQWZilHjILgm75H56/I8Bv+qQgKC8FJSKnqMFKEJy8ST8G
	0WvnJVKxmZSY5Onu56E5QxpVp68SMH+SND9BJBO6g7x6IuMgFkX8hdW+lZ/JEVBsDSUx74HuPOf
	LvaBNeF10N/bfw429y7jrqebiln3Fx9WQQYGnLiu76F7h1znhEoJT4o6XhhnBeiZfxCRvUuGcch
	YKqVXm5/m6MgD6QEJ0Uu76fiAnRsVtgdtS0/xpKHXpKAeOwYpSb0VILxL/RLjWG7fuyIEtKUwws
	JXedCT2r3LiZ7Ea3sWxgKB4/IHjshKAZAjbV0uI2IJcJ2hQSujmb4M+UlsLZeFif6nBuycr/ceq
	IVSxJyvE+PIF/a/sBTEnkNx9gUkdMOFlK516mtG2fFGdqqRzmm5AesmsT0G8QGuDn0Bcn2gTgPv
	rnDIOH0Lo/ocPWigj1FSLuHHXGWzh0vSaAD60IsBkzq7b/dGAFny8CJBHRVA08x/PhvJdp/cUvg
	mMeTrHP5029OIpw9d1tlT+129E6+JbONcPXi
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr97635105e9.26.1794725114755;
        Sat, 14 Nov 2026 22:45:14 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:dc0a:bc51:e26f:5cf8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm14073284f8f.34.2026.11.14.22.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:45:13 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	houtao1@huawei.com,
	linux-kselftest@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH bpf 0/2] bpf: Clear invalid cpumask bits after population
Date: Sun, 15 Nov 2026 08:45:10 +0200
Message-ID: <cover.1794724099.git.thnkslprpt@gmail.com>
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

bpf_cpumask_populate() copies the final bitmap word without clearing
bits beyond nr_cpu_ids. On configurations where cpumask operations
scan a whole word, those bits can inflate the reported mask weight.

Patch 1 clears the unused tail bits. Patch 2 checks the resulting
weight in the existing populate selftest.

Tested on 97d73c825122 (x86_64, CONFIG_NR_CPUS=64, 4 possible CPUs):
- Unpatched: cpumask/test_populate FAIL (err=5).
- Patched: cpumask/test_populate PASS.
- Patched: cpumask selftests 36/36 subtests PASS.

Not run: allmodconfig, allyesconfig, the full BPF selftest suite,
cross-architecture builds or a dedicated performance benchmark.
The changes have not been rebuilt on top of the target BPF fixes tip.

Avi Weiss (2):
  bpf: Clear invalid tail bits when populating a cpumask
  selftests/bpf: Check cpumask weight after population

 kernel/bpf/cpumask.c                                | 2 +-
 tools/testing/selftests/bpf/progs/cpumask_success.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)


base-commit: 4b4eb7f44ee05754339d07e9df649809f45d14c5
-- 
2.43.0

