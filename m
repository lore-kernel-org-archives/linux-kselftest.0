Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EA6423A8C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555707; cv=none; b=TKzmqhKZdrKpEYq3elPxNqfBc3Z5DLLE5SLxCe7er1JJi8VcH16+UHoPcyPkGX1PR5PK4F4Fl+r38a6fJbGAPBOn9c4ze/d3+FliJWDdaffDIQe9hNwnx4LUj1qC0YEULFL3xt8mAzruopO12rD9QVrRMOD9QXIG1L2fQs9p0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555707; c=relaxed/simple;
	bh=6IRZDJj+r5sp+QVknT1l4Md6WM8TiqCR6LQHlxM2R3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9mnOctD5f6hsuUaiTwmkkYonhimfPrxEgjrioCdmgfYQdpc3eqyxfS+KHVKYB1UUW8/dBBe+vKTH4vTqafq7bz4HdDfJe77eBwal2dmDSI4K/e6oG74ZbzM1JsB7QAj8hb8r09Axr80Ph4n0jfxNhPnbm/uAJylkGYVpeqQ46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKaweblP; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKaweblP"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79885f4a8ffso9807037b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777555705; x=1778160505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey+vtW5zGSIcS5Imm4MD7T8reur80NswJgiOxTbyp3o=;
        b=RKaweblPPPKB2u6vCMtKE8JKAFu7aHW4Mq1o7zNyOD7s9Q5r5LPKYtkz0RWLAv0IF3
         kQPa330GniI+5e2QfTiBpMk6PMxeLrNfpxHOaqolFKJ0DZe2lW3N7ee7CXaQRwki0tpf
         XX++sGG3NpG5GDJaRY9WcCzKvM04090lWNyHCB2W9xT934BF/xKBvSWktA3WcZ/26xUn
         xkfz0cDOqvmCnwF9czR1/IXrnokAkb8mx2kfzxZZLTRAs9boZjtrsSSN28q6vpfmCmz4
         cZmfjVD7CDyKRD3YWuCHTVxjXcegT8wpHR2DSvt2a00selJilFT0SmwHjdxP+U9qcudM
         i8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555705; x=1778160505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey+vtW5zGSIcS5Imm4MD7T8reur80NswJgiOxTbyp3o=;
        b=s8YuHrJXf6xaOBTzJQ90eINTFwUhWpW1OEILWUQXBoCAmTxiQ8wQmZaxHYDnETIS6+
         H0F4k13P+FKmLl6LkNkeuUkwnwpCzS5IbrqfTmYDiB5m4q8Emkvhr+hvop5fI2G98Fb6
         bfA6C6ndPRV/qEaPP1oHvlo3UKn3jXXif/caYO7iT8aBM7rZp654YIst1mkJuMUhyDyu
         v6QzFFm2vw8PRxdHPPYlZMswcjBe3MLIWpz+O6oWTuRRVM3XezSCOLE9xVg2SNLzcvEd
         DoGi4mrL2JOSXbdEqrqwL06zi24LozuK6gBejq0E4r1j7JSNIKyvOppYhwwvdRifxbTl
         Cw+w==
X-Forwarded-Encrypted: i=1; AFNElJ9lMs6LROUnlT3wUGGnnS/ARbzsk3lMWgqZc4fwBrN7sAoTX2f93p5sFUrxoJZWKZVh6KGtt7HW0L101QZ7O34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6StOk1uEPqi4406KmySjr5pBXJLUrEnoWuJ5ApZyUSmHLjtw
	knW07VRI5Y02YbOHoUNQnRIwih7cbbogXoPUEzmwCiakUvJIKtVvqfRj
X-Gm-Gg: AeBDietyB+l/pYZNHqdFYmrwlCwh8o2KN34OiRu5PnZ1SIQePuEVJvXGutVKVxtQ7fS
	yhVS51fxReIT61wxSwmxuFaK9KC9AI3x+bO2hTjyZx7+3fby2ta1NxeTdBFd8CGVvbxdnGp/p2a
	LjITGCA6GR3JQJBsWAHrk+JQymcp0NcgL8upL1S1ni9q+hx99Qu1FZfhxkSlNJ5iIFZjSSV1P8K
	5/NBc7LMszOklgYfWOAj477g4p3e5dkjxTfzLDrIz9HD4Zd3Jd7J3llq/qGREobmP/DkFXEnRSF
	mfsLhVgZ/ghTyfrtU2op7tEfO1090WkfSNnL8xBKBEVk0TmFJWNkKvtVMlePFPaRwnQW7uZB6CB
	EhGGX0al9iBu3vox3KLBp+rVB9D1Ri0EVSEgz3m8pCrLNRcDlDTf8Z5IYtvVq1xrbGV7ZGTvvhH
	GBOm7/n4eF+aTcaLmjxJkNVQzCQizINfcBLoUdEQqNvKSea4vN/YKvcu5YG0uWAQXvc0daaHLKI
	io3XjIpbdbYQ/PDoH4pxEln8rvSg1o9zOeEbw==
X-Received: by 2002:a05:690c:d1d:b0:7bd:6043:7eab with SMTP id 00721157ae682-7bd604387ffmr4540877b3.45.1777555705511;
        Thu, 30 Apr 2026 06:28:25 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd54b332fcsm8592957b3.16.2026.04.30.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:28:24 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v6 0/3] selftests: drv-net: convert so_txtime to drv-net
Date: Thu, 30 Apr 2026 09:28:03 -0400
Message-ID: <20260430132820.1944517-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

In preparation for extending to pacing hardware offload, convert the
so_txtime.sh test to a drv-net test that can be run against netdevsim
and real hardware.

Two preparatory patches
1. support negative tests, where tests are expected to fail
2. add a tc helper 

See individual patches for details.

Willem de Bruijn (3):
  selftests: net: py: support cmd verifying expected failure
  selftests: net: py: add tc utility
  selftests: drv-net: convert so_txtime to drv-net

 .../testing/selftests/drivers/net/.gitignore  |   1 +
 tools/testing/selftests/drivers/net/Makefile  |   2 +
 tools/testing/selftests/drivers/net/config    |   2 +
 .../selftests/drivers/net/lib/py/__init__.py  |   5 +-
 .../selftests/{ => drivers}/net/so_txtime.c   |  25 +++-
 .../selftests/drivers/net/so_txtime.py        |  95 +++++++++++++++
 tools/testing/selftests/net/.gitignore        |   1 -
 tools/testing/selftests/net/Makefile          |   2 -
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/utils.py   |  18 ++-
 tools/testing/selftests/net/so_txtime.sh      | 110 ------------------
 11 files changed, 141 insertions(+), 124 deletions(-)
 rename tools/testing/selftests/{ => drivers}/net/so_txtime.c (96%)
 create mode 100755 tools/testing/selftests/drivers/net/so_txtime.py
 delete mode 100755 tools/testing/selftests/net/so_txtime.sh

-- 
2.54.0.545.g6539524ca2-goog

