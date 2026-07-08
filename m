Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE943ED5A9
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501327; cv=none; b=Y6tUmTOjihDJtbsIfApReaqrrtzMeZPE6lwbwN+Ex+7e+aBvvhqrHqBSW3+csAnXBEqNRivM2tnrJAe2pB95cgDUNrx8Zl7LBX3YrdANmBQyur3aX7VS5jyjImVPAOlIQ8L25C7Trttb40HgjkCSLBEDwT1sJSKFl6aSKZPHY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501327; c=relaxed/simple;
	bh=M1P4/cPSFe+WUlSiXFOFYdixMqAxgBQz5tvO8+L8ULM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNt7g18kwwyeUF67IahZst/p0z73hu7bb5C+cbz6BJVmO5ZbHNRC71XznWJLftltauzUbRxTaUQJImpzTwyYQv5VxQ/8JCUZXyIifHU+VVs0oEugwBxbcnSAilCiHLriBS4GApYYWCS4lpOfi4aRGUQr0zbDnJcmZr7az8663bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6NUFI4/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6NUFI4/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3811e59df58so280409a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501326; x=1784106126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJQzme8jzbB96K3QvlmGt0r3KOuvo5Qma1CtSmtIkL0=;
        b=Y6NUFI4/RyFPywcEmi6jt5TPey6KLqdTPlqU9MQezey4TDnrO4EjwO6zPfvOAv/oco
         BQ+WDTz4/wwV/ewpbv8/SpnLeUxeVMOsfs7cbiRtqgm6jdCM26OiGVDa7qzxmJ+h/M+T
         KpjrISxIZDh/MCILPC4afB8rqwWmqnkAa79RCeYj0UONHyW+OV0pBGemcfnlicIlcDLy
         ZFauA5HCfjaZ1yO9sNu6RZ8MsXRbaRkqKzg3UfANZvpTmCcvrsZIBajx/xV4MMA4E+ta
         iGAYKv91JIKX/IwuHhIqULBGdGWj/NMUM/AAHix/nQYaxs73gw/P1qbiOXkx8712Ot46
         q/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501326; x=1784106126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJQzme8jzbB96K3QvlmGt0r3KOuvo5Qma1CtSmtIkL0=;
        b=oJ71f4z1YSHBXIh4AcE1aISEdTim4nmSEmN1AC/Fhzj4dt/GlN32a4kLzidZt23nDW
         DY4Rch9+Sez0OXS7sY7E/jlyWtsnlQ3PuPgn5W+dm8OQEA5whj0X9YzDboLuVwy3ckjl
         lFAk1/deXedAFWFcIEeoyR0XXiagjreeub8ohkYzKXGNr8eRfVT8vFOtH81CYPd6S29I
         PnnVjFVB+ppX2FajeYiKPmqHQvkmYcB2/oo4s9LGikI0SzZlrMNWX5fFwZeh67pNB4q5
         aPpnma1LIZrd/4bu8bSeSW/olPBujH+0ZQxSrbFj6dKPADhVEjGOG6RKQ1kbudfHT+A+
         CbLg==
X-Forwarded-Encrypted: i=1; AHgh+RrGUnF1zF9AnrENWqlDuAIQXHKW0WMfm7yKdxFybvH1RD9oXfYmNlPxJ0963Ykn4XupiawMd2h/VzU8zB8qGzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzxxTHybFOVtAgb9Hsde5FN7n7A1TfNFgFX3doaWfrRAX2BRg
	l3M1U4tr/sIGPiGjSxmMgjOMEO0MdvqAyPGLAbs8xW7vU64RBQok+LI4
X-Gm-Gg: AfdE7cnHv90InyhPMxzupubVFcwm9SXyrY5gN/716P6eWALLnCkyUFBmKWpPJlOd3aI
	oMCA26sYiIhphUOZEleBXRG1CsNEIosIksTN41r0EGhFStdoSF9NRwfPB9DJJuf6jfCKgAAPiar
	XeJWmFUxAka56TKI571kBLQisreHxfJhmI1+269q06ZRTXYpOcMAQJRklV+y8z0qyIFvhOY9N/c
	RwuwLcf4uieANZXEAfMpk48D18E31oQaxKHdyZ4QVIjOcpfsLhRXi0u860rm216VlauWZ/ghGMo
	+4Z71CoUzzsn953H0+4eLfLlYjOCOhCWuwpn0BXND7PLDgbC+1CoL6SG1aTBuanoNLbYQYofM83
	LUM380RHaxFVrDJYXxXaGZHYIaCtI3Qc+XGp4JtfEbDA/RpJ16KWufwqJmM8QCXgZvAbZ6qCg5b
	VIGPWDbqT0UFqlkBsjlr9OUxxCdX1yPGmQ9MP4Vkjxy47wtfYLPS6G61stYDSsAlZ8a+lkGELzY
	nYfJTAyRLdlxiWdqLCAQZ5mTZxW4Y3R2g==
X-Received: by 2002:a17:90b:5290:b0:381:6466:7160 with SMTP id 98e67ed59e1d1-38941acc1ddmr1716634a91.26.1783501325649;
        Wed, 08 Jul 2026 02:02:05 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.tailf6b5e0.ts.net ([24.4.24.156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm19515493eec.30.2026.07.08.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:02:05 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org,
	mmullins@fb.com,
	shung-hsi.yu@suse.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 0/2] bpf: Reject negative const offsets for buffer pointers
Date: Wed,  8 Jul 2026 02:01:49 -0700
Message-ID: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reject negative effective offsets for PTR_TO_TP_BUFFER and PTR_TO_BUF
buffer accesses, and add raw tracepoint writable coverage for both
load-time rejection and the attach-time max_tp_access path.

---

Changes in v4:
- Correct the Fixes tag to point to 022ac0750883, where pointer offsets
  were folded into reg->var_off.
- Drop the end > U32_MAX check, which is unreachable after bounding const
  var_off with BPF_MAX_VAR_OFF while keeping instruction offsets and access
  sizes bounded.

Changes in v3:
- Check constant var_off against +/-BPF_MAX_VAR_OFF before computing
  the effective access range, matching the existing verifier pointer
  offset convention.
- Keep explicit rejection of negative instruction offsets and keep
  bounded negative constant var_off valid when the effective offset is
  non-negative.

Changes in v2:
- Split the kernel fix and selftests into separate patches.
- Add an attach-time raw tracepoint writable test that exercises
  max_tp_access against nbd_send_request's writable size.
- Adjust selftest formatting to use the 100 character line width.

Tested:
- ./test_progs -t verifier_raw_tp_writable
- ./test_progs -t raw_tp_writable_reject_nbd_invalid -v
- ./test_progs -t raw_tp_writable_test_run

v3: https://lore.kernel.org/bpf/20260708040715.116680-1-sun.jian.kdev@gmail.com/
v2: https://lore.kernel.org/bpf/20260707060804.93561-1-sun.jian.kdev@gmail.com/
v1: https://lore.kernel.org/bpf/20260703035137.109608-1-sun.jian.kdev@gmail.com/

Sun Jian (2):
  bpf: Reject negative const offsets for buffer pointers
  selftests/bpf: Cover negative raw_tp writable buffer offsets

 kernel/bpf/verifier.c                         | 40 +++++++++++--
 .../raw_tp_writable_reject_nbd_invalid.c      | 58 +++++++++++--------
 .../bpf/progs/verifier_raw_tp_writable.c      | 16 +++++
 3 files changed, 85 insertions(+), 29 deletions(-)


base-commit: 12091470c6b4c1c14b2de12dcbae2ada6cb6d20b
-- 
2.43.0

