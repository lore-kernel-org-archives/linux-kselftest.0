Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F2369D45
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829366; cv=none; b=USTzCG+0akOzX5pzy15P3XHChTdFYTCAkxT0ddqOrp748QEBNXtxbadKQRg6eWd8HQLP6UKV8xSv9zkYMC//6O7eaxybHrCsi/7ofcZep8LUqZc5UvzYGldH0m9dT/ZmSRHprdszfw7FU2yWh69CGwOYHFYTlx+5mp7AtLrWoVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829366; c=relaxed/simple;
	bh=Is1uTZcsjWqt1oeV/xKwtQSlcsYfiCUlqr6Nb3oqikA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRLpGws3pfhb5fjtByDyDuzYqsEGqec3yuo5HQrdB3RIKV5hF40jTnioo4ZbfLlSSK4kRR3CqEas94So46f+Wk96CWI44u54WDvetjW49HskmfCF/JXITTFI+r/SNd/3JgRDAxqKSpvZI++cVt5QxZ0gEau00MI3jSHBH1YvTL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9KOJYUZ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9KOJYUZ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92b21f65b60so185229485a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 21:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783829364; x=1784434164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zL5hMPwcvjap6kXmHdRAKsiza+E7uqt1h5fl6yej2OI=;
        b=B9KOJYUZK7Dg5H1VxN3mHgMFNIAKvPdh9B/WMh12KopedyNZ8Gcz9j6/QYd87tXZPS
         XVcBjIFdiqIJfyMiY12A9VsW+0dnxKv7Dl9oCyu+g/84BjOF0VKe9lrBYc+lOkXJGfKZ
         vSU9BeVBYAY8oAwdZclAfoDFWfezA1iEhwbMsTm0G/JyEZbGbdDma/ooC9WalehBbvaN
         SVoP1GaxjChCEG2tL+L6gxSV/GpZi6FfOjNuGCWvtBOfvYI/lF4nMv2Am/cgLe4q614b
         XWmx3Pj644djUQuQ4ZAx2keJ8yH6wO/kp0zUBHN8PoQiy+RjkOd2NNr3/YZlkww2ipKH
         UuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783829364; x=1784434164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zL5hMPwcvjap6kXmHdRAKsiza+E7uqt1h5fl6yej2OI=;
        b=a+WevbU5fiyC1DbnQM51CqnA2IPNblXEuK2Zq9Y9AGw0eAiWPq6WKnqH9lwtOTG0Q7
         qBLulHzzczeqLzCTPsiVSNnbqA0Hc/BrFS+8bzwZVKEBG6BZL+bW+7NnNiMcyU41HPrq
         616XC5u9VSFXrDP1fz5gVdgoGSA5Nx8gPTfbHqZRp26VEFKtqAV0Gaa+AXmJ+hvXTvR2
         7/zyqJtYZPNZnmVBe55ns2YkHgkeBVOUDhP3wjN3rLuqFmxQEmJJUsem3yaLTlUFYP3l
         2N0D22Mv0J0pKnlFnVVsKMqpveeozDn8G4vsu7+zF1VECVxnWzDcvqfY8PgMazGQ+rjX
         mIqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6/C5qRsLwwyblRtB8vJdkr2s8tpCrx01I5VA4VPH51QgKQC9tT6Rxu49tz0gSxs7yazZGJDy504XdpYv404=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+pXC9bUrRQkU1vHs+fk9f3KcIzUnAYreByWwpln3nANpd7Mo
	rIAO2P6DJlECsFZRaXY8bH2uzTG12UYtHm6DAXxV/oNuTk4t96ZqSUIk
X-Gm-Gg: AfdE7cmYrWSY61k19FmkCzR6CBEFQ1g6QCNgwh8JmE9qY9LAkpciSTZbvjF12gEZwma
	QrReR91AVVK9Eiwz20JgXFKTvGjAic/iJwuRY163imJJnEzKfbRkNLn+pwEGX548LIn+uPI8SKa
	dwrI92oiWOLDYxw6WhCLYivQNvWx5hDziHpbMEX9uQ7D0oP/zJGyvsnZmvRRUW+Q0in6U/HZoN/
	SgQYl1KIF0YzsvtCstt+2IGeeGm6DdssbCC1kERnWBwDqw2AQWYe7aMdOk3ecUfSmpcT3BRqdpi
	xTioR7MZg/SHRiuBhRAznI7BN1Hdf+zxzXBmEsWU/wcm8bFLAM/wz2rGv/ZCZEy2wdir2i6uNJH
	YdzorQ23GDQuDNh7TS719jBZzHBmJl0ydkVmwFDymZMxsg4Y4ioJ64sZsIDxghimZuFbalj573a
	ykR5GTC2/0i7Gq3/opufxBq1TmclntFALX3Sv/siKnWIhfpM7jsw2iUk4alne6kSzdpOAJHATxM
	SdUm8mSH3cXtmYMW0TiPWAxLQWEswT6Aq+McLoMi5A=
X-Received: by 2002:a05:620a:4482:b0:92e:d653:df0 with SMTP id af79cd13be357-92ee4b63693mr971094785a.5.1783829364008;
        Sat, 11 Jul 2026 21:09:24 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-214-82.compute-1.amazonaws.com. [44.200.214.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9d9bsm687147085a.28.2026.07.11.21.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 21:09:23 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH net 0/2] ptp: fix scaled_ppm_to_ppb() overflow bypassing the max_adj check
Date: Sun, 12 Jul 2026 04:09:20 +0000
Message-ID: <20260712040922.6403-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ptp_clock_adjtime() validates an ADJ_FREQUENCY request by converting
tx->freq to ppb and comparing it against ops->max_adj. On 64-bit systems
that conversion can overflow s64 and wrap the result back into range, so
a crafted tx->freq bypasses the check and reaches ->adjfine() unclamped.

Patch 1 rejects the overflow in ptp_clock_adjtime().
Patch 2 adds a regression test that crafts struct timex.freq directly
(testptp's int-ppb path cannot express the value) and confirms it is
rejected with -ERANGE.

Deep Shah (2):
  ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
  selftests: ptp: add a regression test for the frequency adjustment
    overflow

 drivers/ptp/ptp_clock.c                       | 14 +++-
 tools/testing/selftests/ptp/Makefile          |  2 +-
 .../testing/selftests/ptp/ptp_freq_overflow.c | 74 +++++++++++++++++++
 3 files changed, 88 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c


base-commit: 3f1f755366687d051174739fb99f7d560202f60b
-- 
2.43.0

