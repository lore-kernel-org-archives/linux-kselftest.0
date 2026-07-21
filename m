Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D163FDC06
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598183; cv=none; b=Pc14r/ajwS317V9xdxNxMRVk/edf5we6qXkJQydT3q+OGLTfKZf3ujENE+MKgeeJJr4AkojkYzrOOAOtKrGXWLDLp8IhDA/x8e+qOiABAQuA0RiH5heweklMAySiVcWRQ2XMtoiOm/n7m+UBk+f6LjA977TYxbcT3Xl6VPpVLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598183; c=relaxed/simple;
	bh=mQkScGSrLsYTkQbmAFUS26qOkwVlPQxOZaGXJa9pixQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PNRLmVps/xFZKXXWcS0aw7VZSYi5B9TRDeDFu9oEmTxxhPSvJf1h7Jd8mi6aSFYSLrRd88FarluHoa19WX1DG+VQwjJy/Z9XqU40hJtxOBB5kx1Yv7Xgg/K1UqgOi0XpGDKqfP3CHHZNFXogmeDJYkkDwwT38xSVhccjQ2BxZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvaFBOoX; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvaFBOoX"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so77273636d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 18:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784598181; x=1785202981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TIhPn926bcTJS822r3FkEsmh9asbzmZ7+yhUCWhALnw=;
        b=SvaFBOoXceskOKy7qbZJ5kZNOwjrXax6us7iss/zjTMBzR83f5vhliUIkffya5r5p0
         blfiORT+44kMVjMf6JSN4gPyrebCuMjhUmxch1+y4UvupNRCfCfAGqZU7guUqhS73P+v
         TfdYccxyBwV77x4i9zKAlLnRmwxQnZmzwLA7d0ayL/HgzGaTjsUc4QCOoLT8F1JMRFvc
         OF5SGuwp2suCBOVTM/3SAma8rqywCrxSJKzZ+5agE6pRSkT4OrzCYC1bmK1n8MDwnP3f
         ATjzIzjhfKKv+OxtceNqU7mI3anVGgAE/m/9F43a5OL0rN0v8GPtZbzbc09OE1Y4/4/i
         7SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784598181; x=1785202981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TIhPn926bcTJS822r3FkEsmh9asbzmZ7+yhUCWhALnw=;
        b=jN49qUg5l3OC/FLFoCSdvLyxZar5LgBR5us5swBvxuD2x3f4DlF0aPvqEXMazE+giG
         ZjIh7Dt2v2pCemtb7hOx4v/a2cjye8h9NltwmNx5u4o2qrPMMLoWUk+/PZbNu8Pa7uTl
         apkemQtaBlW3Ha1gv635Ze+yDuqOqpsu2pdDwhSlT9gAtctS4e4MAJlm9xtcMlQkPdHQ
         C6w3bf62k6cj3UQf6luwzNUwrLQJD2eamLutt9nDXH1yNGKq2hzuPg+763jLjfTAlS6k
         Cnz6B1jTv02Meqo1GsBpqKX/13XbaYtpwOtAi6loXuH49CHO0eKta+Ydh4duimw8hUrf
         gzUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCmJs5+TqQY4A12yUP8n6ToQ/6/QKsv48O9Lh9M56YPzBQQMcLyZUjifcBd7fkC79x7m7OwF0fqkgRUYDRQsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMsP2g+nz7bjZMqwl9MhsJtyQrbSTXCVoYd2dToYpxr3bgROb
	1e4ACgad7+bc9hF/1E0tWiQhUvpBJDZbMVqUdXJpmrglBF5Bnft8NqAh
X-Gm-Gg: AR+sD13zdTDYRm7et1YiaWJlghYXowP+Ohy9wtjSnq06lOTILHIiqL07rnnKblmIGai
	39oDGArh9JZArr7eMQ8KNO4xVmgj1JfSZ++VVTLg6ufD64fVx/j/T3PGtfQdvuATYQgRgkE0f9a
	RaUUQrg2x262YK6J3gHifmAqvYIZOwn9NmBDSvrDAREX/pDgFvPjebgi6Ja0xML+mGeNQiBlV/B
	j9okBRTgQPJEg1TMLgEPNcyHwcrVQlZNtiQefPowWisdgP4Ub1ovpcqtYz8CgDYBIJ3Or0ZXq3a
	b7FDKe9PLch78sbE045f5IYD9MXV2Q3a9dumj6+Xmf9E/gpn3UY83M7zu2kAi2547eO2JkHtw9b
	ebIROYpJNQ+0MQARjiaBFIgJHh2p4syd49xQPipQ7gTyuN/JyY54xmYrhmy2jjVG6odjbWYlU2B
	I5M8+QpWoYdnwNxh3ZcTbd9OKTWK341kV638OTU/Ydaf0Cj5hz0VZ2r3Lwnv1wPLBm/QsFQ7BB5
	GnrDfwgK3pqaiwXe3sA+pjqWYM=
X-Received: by 2002:ad4:5c43:0:b0:8f1:36c7:497c with SMTP id 6a1803df08f44-907784ddb2dmr181885246d6.33.1784598180883;
        Mon, 20 Jul 2026 18:43:00 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-13-222-20-6.compute-1.amazonaws.com. [13.222.20.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm104418266d6.45.2026.07.20.18.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:42:58 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH v2 net 0/2] ptp: fix scaled_ppm_to_ppb() overflow bypassing the max_adj check
Date: Tue, 21 Jul 2026 01:42:54 +0000
Message-ID: <20260721014256.1876-1-deepshah146@gmail.com>
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

Changes in v2:
- patch 1: unchanged, added Reviewed-by from Vadim Fedorenko.
- patch 2 (all from Simon Horman's review):
  - cast fd to unsigned before the shift in FD_TO_CLOCKID (UBSan)
  - only set the 64-bit test value on 64-bit builds (32-bit -Woverflow)
  - save and restore the clock frequency
  - skip instead of fail on -EBUSY (free-running clock)

Link to v1:
https://lore.kernel.org/netdev/20260712040922.6403-1-deepshah146@gmail.com/

Deep Shah (2):
  ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
  selftests: ptp: add a regression test for the frequency adjustment
    overflow

 drivers/ptp/ptp_clock.c                       | 14 ++-
 tools/testing/selftests/ptp/Makefile          |  2 +-
 .../testing/selftests/ptp/ptp_freq_overflow.c | 99 +++++++++++++++++++
 3 files changed, 113 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c


base-commit: 1c975de3343cdef506f2eecc833cc1f14b0401c4
-- 
2.43.0

