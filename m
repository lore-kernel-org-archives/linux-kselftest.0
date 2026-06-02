Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DF3DD85B
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405942; cv=none; b=qh4zHZE/6KhgYMSfaW/6rz5W6y7GkeGnwL4DHVTqvdEOiorfHyRDX0tVHLKlRVHt/La7ziW/m2kn9eOIJ+12jVQy02hVFXvbaG6fcyCknEg9wBtgxJ9Zx3rpdorWJRIrHHvmIZkp68jCFpUye6gGq5W8LemRO9XoZczwSoJEx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405942; c=relaxed/simple;
	bh=lH4adT+KW+NSXkVWtCeyRqT0psLwQ589XQm4UKcrMsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkUe1yJ05KfKJPUlsGDmy+jFIzW2DmLeHoKktlvAasFN0kC+9vI1YJhIPsHNQGCcUsAq8D9DKdyfrnVh2iUg0yjuAYzlj45v2K7ZXtaNoIcQZYdw/1kgKrfdvdToJp4JQKYbc+vxrAJN11S4XlXmMHlJMOLcb6Tzj0isxXBNASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLWrYHxV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLWrYHxV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2657960f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405939; x=1781010739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MaPoAdcJpUD5zXv0uj/EISz2QKWf/USntIRhT5xYGc=;
        b=ZLWrYHxV9DSFsFVaE5wEJHcMFj2LoYFYbAfcR1rAI3j8k+yZieKO+XaihM1nbClGfc
         cYBNXo9VQkQ6Iqiz/3saFBgiTWzr9s89xwIX+0faidHkMsbVLl5abmHJ9tliilh6SanK
         pLMU3JGYDTV1lQAYrtBSY7WswKacEsG02kPzmmWEQCAUVh5eNVVj95F7wukQ9j/EXs4c
         zJ5Ni2ObvbKHMbKOgN3OFwqxvn2iOLXgp7ZKDEES81IxKIRpiNygGvP/AFkDnUXCsUFJ
         ArUfBCWvH2J+pCGqTNMdS5GQRAnKB9DSZ2fIVGhjBC/BTcR5onspuUKRaVRvvy3XGlch
         44fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405939; x=1781010739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MaPoAdcJpUD5zXv0uj/EISz2QKWf/USntIRhT5xYGc=;
        b=BAP2DaM/LbUyqP9rxwPI+1kC+Zcti5whnbvR4XlVC6XCE7mqpylk63X5+Cf0xG1Jkd
         KDA5/OsMxJFSbf9jkJek2adqS1XJBDfwTYsba+VfiqOP05WjMc70KTJ5QfQdqPyDtHH9
         L3PGjZuDzQbe0GMvuSDj+JOkh6X2np8w4dHnPUBnVQqEej3X6n4BV0NeMqJd01DKJsPt
         qcT4TAiwg/psSVw9gI5B9Z9HmAv925NT5oQwmqI4ygML/kyVbdjZ7sk29Tkj4rp3pSa0
         IrjQMhRq9JUefsHzttNbe8zzb78THXqLmgLY7H+Afz/NIx3cmfhpM1K2CiBdsAYGbKfe
         PSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9ObK06blxlNKlVCThdGAyaEeJMo4KrqJVAEMgpVzLDltg1UL8dTVDbXRxWNfiLs1vsG944raPZm574ar7Bys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFreLMgkgnKgqaV9Lt5pcJe9O1ysQct6I6c15tm6gnFDhMFnbL
	S31VaUCCf/UBwfdzToY/fc8H6cdZNBCYSoY1QUNdS+7qia9ZAQqNKMl9LZtS8Wf2Bewi2Q==
X-Gm-Gg: Acq92OFmx69TLnJbpZFDSlF+EQRV/yD2v6px14nOt4ljb6fUM2S0Z+KUciNRi9FkTa5
	N17h4wBdWvI0j0XWIZto6O2c8sAja1ocjE0HJAO+3VxF1USPA+qvchYIBMORZ4P2mVPkU1+tmvf
	Jg+T0JsJs8AvC46j86+XdK5BxfvoNot6WskevlUX3EHNLHnV/6JTwXWI7czrPsHXDgBCkl77sWM
	usOz01I5me3cFbV55+tfp/vqylv/QX5BW46umGMnrNNqlTKYyEPuYdOWlTDc0sfbtC3mIJ2hEzB
	VGUx/VR3JvF1MDs4qU+Rz1n/GViaHuEiVr7kqzBkX0UKvoZvCVawKytMQmCf59N4j+YPLSGNH8t
	OUZFdMELRQgxPbcTsWPOyBWeO2844tH4/h41yWRVUyvVb3i7scVvAWK51eNupI6aylutXRKeUhl
	SDYSzOnuwaqe4/YWWx59GJMcwM0w/dXpGAwip3DNDnqw==
X-Received: by 2002:adf:e008:0:20b0:460:18cb:8f9e with SMTP id ffacd0b85a97d-46018cb95f7mr5518471f8f.12.1780405938958;
        Tue, 02 Jun 2026 06:12:18 -0700 (PDT)
Received: from x1.tail0e71db.ts.net ([46.140.7.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm33234665f8f.15.2026.06.02.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:12:18 -0700 (PDT)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxoid@gmail.com
Subject: [PATCH 0/2] selftests/damon: test kdamond refresh_ms
Date: Tue,  2 Jun 2026 15:12:15 +0200
Message-ID: <20260602131217.2210912-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kdamond 'refresh_ms' sysfs file makes DAMON periodically update its
read-only sysfs files (DAMOS stats, tuned monitoring intervals and the
kdamond pid) on its own, so users don't have to write update keywords
such as 'update_schemes_stats' to the 'state' file.  It has no selftest
coverage.

The first patch adds refresh_ms support to the _damon_sysfs.py test
control module.  The second adds a test that sets refresh_ms and confirms
a scheme's stats are updated under sysfs without an explicit update
request; the test skips on kernels that predate the refresh_ms file.

Tested on current mainline under a DAMON-enabled kernel: the new test
passes and the existing DAMON selftests show no new failures.

Ruslan Valiyev (2):
  selftests/damon/_damon_sysfs: support kdamond refresh_ms
  selftests/damon/sysfs_refresh: test kdamond refresh_ms

 tools/testing/selftests/damon/Makefile        |  1 +
 tools/testing/selftests/damon/_damon_sysfs.py |  9 ++-
 .../testing/selftests/damon/sysfs_refresh.py  | 75 +++++++++++++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/damon/sysfs_refresh.py


base-commit: 174914ea551314c52a61713b9c4bde9e42d48073
-- 
2.43.0

