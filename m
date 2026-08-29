Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD93264C7
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787995220; cv=none; b=e2c/njhTq73UIdyYND/bVZeiP+n2a1XJ49oNVsHTpS2fxryxpQKJJ4o8j2QFBQZp3cBtBQmHRULc2EnXOBaPJ8plBG9FSGeRELIqskr1pHvcoFjWBBrsZu22xJyvuIdev+KtRKVcmSa/S6Gm1Dtylaw2ozHdkFRj6RiPW+xz57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787995220; c=relaxed/simple;
	bh=A7A7tfVdIw0fqksy6K/RAQDXSydaakdf38nA9yk7vdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gwJ1tylfrmaQ16JoA1QOjShz+y4tQe9tpK3DZ0Z7T5FrnStX5hrvXWmzpDJ86kjFxEA/RW/9eYVAYydkIWaChPbHQbwLcHEUZ12dUSN91v8K/zPSHysY2AelKAZzfrjrXkah2HL0Wb4Rr5A2k/YJSWtEom3NFu6cBfEyg4sBeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIvEm8gw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIvEm8gw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so13727625e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787995217; x=1788600017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=juu7PZIMdibr8mHtJHcDYqhZT86zpDmrpz+TH3//V10=;
        b=fIvEm8gwg1N/7eCEGHNZWLSZ5BOvuMACO60OnZhxw/lwLHPzSuTDs312g95SNbRlUp
         MsCfMl+ZrAqcSimTj2ZXxXceaJddDt0i2vR3yRSLbROBbczgeE2KbfODAK9DsHbLiqkA
         hOoe0ea9Lf5V7hNq2J51qlPxHCeCCLPeoRJhXUN58gwkqQHetr2cq2iAL29K0/XsBX0F
         3B338ECR3tqVOMX18lEdkYmV9M3/Xg5myvdmL5DKI6nAEQ5Yo/BAYQUEIPboSU3iK67z
         yX1HgJlzZEkRvOhjOLtdOFOvG9FLnrwJKLiPkBZY6gKFcovrWn4Dm3wqcDwq7Yf33NnM
         xIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787995217; x=1788600017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juu7PZIMdibr8mHtJHcDYqhZT86zpDmrpz+TH3//V10=;
        b=NgOD+z2u0y0xCuE90wvf9ODfy+Y2gBqcmvGwiyDV5VBLfPY5Z0JdA9+OhCe6QPRsRH
         Gf4PEgCiIWfexgGd5UrXjakvr7JERAKpJWgfI8gIxWgCOnv2+hv6x4IKykD9fwlg04mE
         YJQAyVKRnRCQtE0vWwNZ2dq+Q8gBBnyfU9WPwDEp5r0/7h6X831i6C48Hgl6nOTw3X4v
         dPvKCKpXTtJqIM1reuPsZLILs/AjYYB+qqzepXZBrR/jEMqieL9OYOJOKEz/Wj4K1GsV
         gwY6WMeJZLdTpF5szF49UUlS6JBlA1El63MMZ3OUBA2s+2OEzygLCjvLB+FwusMZkbJH
         B4tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAFn/lxR4Rh/tHyqRWJOj3RYTcgx9e/bbntwUSSWFyCdDDMgbyl2+1rNWhvfbqwP6vgvijIAYARqnVHhz6jwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kyhTjDB0XdHthI1NyJQsvQ+IZ8D4leXJTiKnzxQVylFmwjwPfW
	jUnPk0xRd47OiRYq1shpLHZLh2d7hE2peaa4dvTSryqGKkQSAYKzqEK+
X-Gm-Gg: AR+sD12p6frnQhp7PiYP8S96B0EIEfgFDfv+BwPGxKm3Q6OuuTOYfgNRpHFFJJ4pxg5
	5whJRmLZadEf3Qio1lWs//TxENcsFXcwYm7tu9/WG1ivAmtlm4DziQUGTAGrTnmPhQ+udR26QSd
	ZMkPdQiOzeg1/W0v/NJoxFfecr+6YWBdraG/1FH3CtSHVDW7CM807d8rvN98ljBqgMegpqJBIpb
	BqJcT8M9j4Weaa1JN/6gVUoPs7JGwGJflXPTrFA2ctS68FsWNlX40aOMaL+o6LTL9EgangNhLRm
	GlN7R7I+JaAJDMzM7KeoLX4jzRG86mooHv6sKFQUVWCLT0ACqMmCi5ja66PaowH8tQPb2VPFus8
	Xel1N5N5WwUTL/ABu5eIkjmk+emZoVMsjN76eeD8OZK3OJmfJQFxGNYVSKq1nkaGrsmFYdQvhLi
	0NSNlh/qssJcIcSGflOe0fOzBra00OjYBEm6T3A2h+d81VpoCT01IPcruHJfUGXXjm3rXrd7s5n
	0iVYcmBo1z1UCzNqihxSDfGYpAyE7FBuccUW1T2J/33oJY5i9YPrAlwhf2djdQ4wSlJukK03mOM
	JGTvD5XA68Pvr005W1hB
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr151221065e9.10.1787995217257;
        Sat, 29 Aug 2026 02:20:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm80468505e9.0.2026.08.29.02.20.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 02:20:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Haren Myneni <haren@us.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Streetman <ddstreet@ieee.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] lib/842: reject malformed streams before invalid memory accesses
Date: Sat, 29 Aug 2026 11:18:48 +0200
Message-Id: <cover.1787978627.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sw842_decompress() backs the crypto 842 algorithm, the NX-842 software
fallback and zram's 842 backend. Two malformed-stream checks are missing:

  - indexed and short-data templates can write beyond the caller's stated
    output capacity; and
  - a repeat after one to seven bytes of short data reads before the
    output buffer.

The first underflows the unsigned remaining length, so every later capacity
check passes. The decoder keeps writing past the destination and can
return success with an output length the caller will trust.

The decoder already returns errors for format, capacity and CRC problems;
these two cases perform invalid accesses instead.

Patches 1 and 2 add the checks. After them every output write site is
capacity-checked, repeat cannot read before the output, and all input reads
stay bounded. Patch 3 adds KUnit cases for the three malformed streams and
for three valid streams at the exact acceptance boundaries, so the new
rejections cannot regress into off-by-one.

The KMSAN reports from
syzbot+e774233ff687aada969e and syzbot+8f77ff6144a73f0cf71b are unrelated.
They trace poison from uninitialized swapped-page storage, not these bounds
failures.

KUnit under QEMU 10.2.1 TCG, two vCPUs:

                  baseline      fixed
  i386              3/6          6/6
  x86_64            3/6          6/6

Baseline runs applied patch 3 alone: the three boundary cases pass, the
three malformed streams wrongly return success. A fixed x86_64 lockdep
kernel also passes 6/6.

Separately, an x86_64 KASAN QEMU run exercised all three malformed cases
through zram's compressed writeback path by corrupting the backing-disk
contents after writeback. The baseline reported two out-of-bounds writes
and one out-of-bounds read; fixed readback returned -EIO in all three cases
without a KASAN report.

Karl Mehltretter (3):
  lib/842: reject output overflows from index and short data
  lib/842: require a complete history block for repeat templates
  lib/842: add KUnit tests for the decompressor

 MAINTAINERS                      |   1 +
 lib/842/842_decompress.c         |   7 +-
 lib/Kconfig.debug                |  15 ++++
 lib/tests/842_decompress_kunit.c | 144 +++++++++++++++++++++++++++++++
 lib/tests/Makefile               |   1 +
 5 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 lib/tests/842_decompress_kunit.c


base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.53.0
