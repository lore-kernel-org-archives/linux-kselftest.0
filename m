Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BC3E3D99
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 17:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916466; cv=none; b=HtCz06ErD0uZqYtMiKdULs9pW5wcIgw/OC+oKYumEokbwpx2F7O1mS+p4038e8XHZiWCHxMySqeFKxV5ITnWFx6JLYaSDC6TFUp+d4cgXoc3BxJWuQ0yTzNN6Cj2ntNl227O2/FPmn5V0Ew9uCSIccRRFyytZWjn52nPwxKBiR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916466; c=relaxed/simple;
	bh=1UsReSX+8wdCLHB7KFJQ+E5VgWUto9I66Wc7oO8lIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aoy8CR9ar0NMDYcOOzLYTf0L3Gsd4Di4qnOXMrA1dEIIThCbgbVndGTP7J99xWSJy9Vncnn6WZ4AlTvsulMvUjsJDvnbZtJTzSFe92bjpJbZt4asIo9gIYobxY26NErqibQ1HuEPHnPnQShpJHbjhL6/gdBaG4Nc5mrc0ydzp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In0E+sY4; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In0E+sY4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7bd4c61765dso47422127b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 10:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916465; x=1778521265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVXd468iEVfxLrg6jVOPb84V8zxADSA4fIpheWYNkXw=;
        b=In0E+sY40WjXr38vjuFwqy9YAP9Uo5UgBmqy3Qprdg5mlu2uyL3cy122gNEsaFn7dW
         hemO1tPw3qQKb/8uImOiRWerTgkuXuMxY9hC5ksTd15rzo7mvVVgKwbO2iwXgj1M0DRS
         tOz/dABDMi9XANL5ylOcZmTqAdGzRyX9eFFhieD8mhKYmdv0C4XnPJaRSdopimwHWP1C
         wtpswnK194r2H0ywyWanBu80k9l9BwvH1QkO3dB1rQkAg+Li1zNA81PQdrLFspAbftCt
         mUPWMh2QQPtS8e+PX8vL+Y99AaJllfysXy505pavZqqNorromYownMlnhXrwWxZi4Mtm
         pZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916465; x=1778521265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVXd468iEVfxLrg6jVOPb84V8zxADSA4fIpheWYNkXw=;
        b=q57UkEbYCnMzdcFeKk+XlCgC0Vy+hoUczAlthFORqveRwTW7MuL/j3VWnqK64dQaJQ
         aRMdTfZPA2IDalrIk5SN9CaCmzOX614Dcc6JPZ13UIjp5TVmPfx+XhjFgzX1fHdSiFP+
         pSMR8W0Bqw1V4BeD+eN2SOu6OWeS1gHIRAZ31Wed9hp5ORSuUsJIWevU7Tj49t1X5ZcG
         10FXx00rbtmc38AsByb7X/F32tdIooCzAfdlkLHOvneZtkPo9F2Qee11l86SQKdCSlEa
         JA4h/3Ee4Ex18R2FpbqpIMoBMhaS9okzdzTh9kzZGgzQujJwlhF5i3leVFdo7GCMSSvy
         1Fig==
X-Forwarded-Encrypted: i=1; AFNElJ9bnf+HobP4MElaxhsTeun7/+87JdhcXwhU0E9DEcKekeAwBA1FZLdyBYyINr7TRl55msbJCbOJhs/MH/rX2x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxILarzChZIciHOz0qy+4ZwQmdNKxIdD2CWI0gkcfZKarw0Aklz
	1URl7mizBo3Est1oRvEO/ARl6MAAtIGPTV6wO7CNzJyTej2H1xINxw90
X-Gm-Gg: AeBDiesTO8uL6+jPqMl7LyRoMjRK8kXgNOCNHpFxrUjL0t/FRqVOYRbDveXDPMZZIqM
	pSHczBKN9VVuyASV/E/v5aKtK6eX1eobt2Ul5c8Iw1zdo4820d1QAi3TslaiP+Ow0TjsZacjwhu
	pD9QJ7ZapPUuFYM1xB/llokBQumkX6yfpsEWTqCTjxd5+fraAZj2uHid9XUxQshbi7xoyi/fNZk
	Sf3p1RYYat15wHT9kROeoIHEIjhvJeuFw1CVOV3rFRmcA1ZeZGi7YFOUzgZek8FnY4LmwBQIEip
	xLqZPVxyyP+KuWCyh1o6bW2cKYu8GDkenv4I33sxjP80ftT/NaT9mb8FGNaEgUGM7xo+3Q1BRIi
	q+R+Lc0BbmVuiYmSXTOSZhFeAzusijh+KIUUQepRkRKq1Rt6PY6FXwsRo53AHhbbece037RHhGy
	U6XezyjIpIkNfhh7RXMfH4S110n7pPZeagwYofA2YSMCMSoU91udgqcNgMAT2P9z8bXWx7ahaNT
	o/UaS0qjX6cUZud01NEGM/RGNL0h232I6kkPw==
X-Received: by 2002:a05:690c:c0b:b0:7b4:b591:e77e with SMTP id 00721157ae682-7bd76fdb62bmr112277547b3.18.1777916464547;
        Mon, 04 May 2026 10:41:04 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d0cbsm51551767b3.35.2026.05.04.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:41:02 -0700 (PDT)
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
Subject: [PATCH net-next v7 0/3] selftests: drv-net: convert so_txtime to drv-net
Date: Mon,  4 May 2026 13:38:31 -0400
Message-ID: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
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

See individual patches for details and detailed changelog

Previous versions:

v6: https://lore.kernel.org/netdev/20260430132820.1944517-1-willemdebruijn.kernel@gmail.com/
v5: https://lore.kernel.org/netdev/20260427201640.294694-1-willemdebruijn.kernel@gmail.com/
v4: https://lore.kernel.org/netdev/20260409164238.661091-1-willemdebruijn.kernel@gmail.com/
v3: https://lore.kernel.org/netdev/20260406025020.1636895-1-willemdebruijn.kernel@gmail.com/
v2: https://lore.kernel.org/netdev/20260405014458.1038165-1-willemdebruijn.kernel@gmail.com/
v1: https://lore.kernel.org/netdev/20260403175047.152646-1-willemdebruijn.kernel@gmail.com/

Willem de Bruijn (3):
  selftests: net: py: support cmd verifying expected failure
  selftests: net: py: add tc utility
  selftests: drv-net: convert so_txtime to drv-net

 .../testing/selftests/drivers/net/.gitignore  |   1 +
 tools/testing/selftests/drivers/net/Makefile  |   2 +
 tools/testing/selftests/drivers/net/config    |   2 +
 .../selftests/drivers/net/lib/py/__init__.py  |   5 +-
 .../selftests/{ => drivers}/net/so_txtime.c   |  25 +++-
 .../selftests/drivers/net/so_txtime.py        |  96 +++++++++++++++
 tools/testing/selftests/net/.gitignore        |   1 -
 tools/testing/selftests/net/Makefile          |   2 -
 .../testing/selftests/net/lib/py/__init__.py  |   4 +-
 tools/testing/selftests/net/lib/py/utils.py   |  51 ++++++--
 tools/testing/selftests/net/so_txtime.sh      | 110 ------------------
 11 files changed, 166 insertions(+), 133 deletions(-)
 rename tools/testing/selftests/{ => drivers}/net/so_txtime.c (96%)
 create mode 100755 tools/testing/selftests/drivers/net/so_txtime.py
 delete mode 100755 tools/testing/selftests/net/so_txtime.sh

-- 
2.54.0.545.g6539524ca2-goog

