Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379667;
	b=0VrvsZNuG/KhiMtVEFB/XqKwgBDrIUGI3DjzDMBUD7VhRNAJYAvrAtB/HMfiwlgz9SlE
	 EsfvhUjo/a30dkubkRkp+fzxGpSmBGaJhKGhSLelTP6SR4HhJ8tiBPaFcgUzY7xjQK/Bd
	 qXkXSzQ/nLQZxItaj1XpA21qDD+CyxHX2OxY3k117p2os0iQ+pjzG+GIG/UnQ+cyzU5d+
	 yKXsmuDP9CzYrD0iY3T/k6jd55glcX8Jr/R/wbVxkWar2G92ZjYugmb6vcwHtEKY/OAXf
	 i+GxIihwMSSMn96+T7Q5LVRi4qBQkE/THT/nM57C56A32rMHaEYmH0MFiSULN0gPvzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
	b=dIOk/jmaSxBQuIl9L85Ykh8ckgFR7yae78ui8kEBkx6Szli29iNkAsBVm6KUNhaBqGbC
	 N7J164/1cpE6vbmaalAEirNNeSo4ZFiIF9DX9NW8+AGsC47BJbPvFdJT0UoMZFlA4DH9r
	 MpZQwc2BdVZxov/pry/wQ8eRMhts4p9X9njqVnakUgMm1mdKkElUnI+k12Qw580qf2ydB
	 bfccaH30APuvXFSm6ad3X5IeilP6rMS7EOqOMsUU1/LOwJEu//Xqf5VGSjxriPk95KemE
	 JRrBWEo1peR670bkjqdXB1T3ZU5tVwbDvOkJcTzTYKUI2HeX8ytp3xZPIhkDE08uLgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM5w6leR;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C00606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM5w6leR
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so825045f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379665; x=1793984465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=yM5w6leRa2ChVRYGNHPLUzxT0TAjhGmbXR8T1nYEpFhvp4B/17T+8Y0Mmgl947BoHi
         yIQu7/Kce8YxZ6JlFCmRgLq/uSmLz9w/g1+ay8NwtFr/Scz4/k7FEIy8FWjsC4YQKVwC
         1yKOJeoVEVBj6t0yOg17L57HzeKjkxrvNTXgqLXRAVxODk6bF8pXW7v+VeqcPMb9mAA5
         tBjuiLt0eP8Z9Nug0IjwerEqTlUnc8xWLQjJ63TM5TuSqXn2tSYzh/3zCeQEakclpXRe
         AE6l47N4xW22MwRCqXuLYh6ig3+jXoIxR9vKcEyOZ63YMAae7g1/E1L28RXR0/UawXHL
         Ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379665; x=1793984465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=btuU1gX0TxUQRYbq8msJy2uZoHLEX1Z9f7kaHNEd7mHmBKKUnUuwIvppFf46C0qYs8
         9Cp6Tn2xLqtPPcaJsLgiEKPveIq0FosDxmkjNpoj+RdN2Ot04Yf5t6Wxw2e/Mc5zY+ky
         7AxB+2AukxKeTkQN23v9fDKuCtRH/Y1rKkpGwbLlLLhwIxj4V01vo33dOlMgYfv0EhZf
         AML+jaOaj8Z3IGmX3V6W79hC2b9hj+tKX+MkEhIkMptLa/6xk+OnFNV2Bb3hFfjEXAo3
         oROvhzXkDWWbuWpaverRZdfnkPGxtwNVmtKMT9piJeM+2FEwN+e6u7Q0t3f8eHHCGECg
         3hMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBI5Xtolly+Ubrc3oSfPbgstTnAy/In9KQu9mCva9/2IG9xCwsuiqb9KSJyb56yFrEnDiX7neMZ9E56rgauqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo7jg8pNY3/7O/NiDKuDmY7SafKOBWq/VD4hq73BjL1j43O/UK
	uMtXOU+MwFHyWDp7oxdtKkAfbzTRe38KDFAkz40sr/eSW3vdwXA4L/2v
X-Gm-Gg: AYBFou3QztnEMSa1hFXbLBNb8vmhJptcYtoo70/q+kq6upsNWHGjL3XJ0XYvxvn8xHw
	9BbXppji640QJURnHEPb9ciRtdENFjdNgd8niavtVaY9q0rVZcwHVLAbIEps268zHx2cd7nKod4
	v5vHFuiun4Nr/QQcrTwNawUUYLD25GjLC1u3nSMev99weYPZXpbARKK3klqwJXakFEFFI80tc55
	1D8Ps2wD/AAq6Gd7RwhPTxsJHd4KfsR9DFnYRhfiIFFqJP0/tkfVEEOECkDRiUJwz2B7m2sxnSZ
	n0IOdUgR/90KQz1eiJlTLeKD4lwRNZ9bW1CIbbv1J9Fh9nhQ5E14tbqksYjIFJEfm1BCG78xwP5
	g8itm1DTjGoNWqgh2xvax3SR2WGu+GwLgkBmqayIjIMr8N1UN+yUWJWy1JZ5vm0EgT22tjXvlF6
	fUhpQNQneoyH5XuEOJDKR7EFRgLQX6K2+cyfBSMZZpNm7LhibFR4IqTwT/s8eT+MLmbfKGlvjig
	LtQ5KtzQx0nT8fNebOR18cFfa0nltC+GFbIiQVx7tMjgpWpiIZj+0ucGf7Aqo01csO4JqYnXUt1
	LQORdVl5BAAcWBpEBtS9kLrXd8k5lxLyAif9DwuiDllwRuvgHstf9laimcwQGoE1EQ==
X-Received: by 2002:a05:600c:468b:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4ac182dcb7amr64266985e9.14.1793379664392;
        Fri, 30 Oct 2026 10:01:04 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm41126555e9.3.2026.10.30.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:01:03 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] selftests/arm64: GCS must survive io_uring SQPOLL worker exit
Date: Fri, 30 Oct 2026 14:00:45 -0300
Message-ID: <20261030170046.439736-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179330742036.2531571.12603232226357262067.b4-ty@b4>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As suggested, a separate kselftest for the io_uring/SQPOLL worker
path that gcs_reset_thread() also covers.

SQPOLL is create_io_thread() (args->fn + CLONE_VM). Without the reset,
worker exit unmaps the parent's GCS. The test waits for iou-sqp-* to
leave /proc/self/task after close (teardown is async), then checks the
parent ss VMA count.

QEMU virt/max: pass with the reset; SIGSEGV on an unpatched kernel.

Iván Ezequiel Rodriguez (1):
  selftests/arm64: GCS must survive io_uring SQPOLL worker exit

 tools/testing/selftests/arm64/gcs/Makefile    |   2 +-
 .../selftests/arm64/gcs/gcs-uring-worker.c    | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-uring-worker.c

-- 
2.43.0

