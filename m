Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86A2C027C
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321010; cv=none; b=SOaJXET4UZ5pw1Z06E7JrYkcBb4D2J6pj10P8by3G0QjTEnDaKbVHEkwUe3b05xBqWb7xziD6qPtaq0eKFzPn/9nh2qHdRHNEExJem24fKqNUWWp8Dz8ceszMiQkbrWeF6znt5p1zdZgxSetLkTze23JpMBdeB0vfwM79N6z0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321010; c=relaxed/simple;
	bh=6IRZDJj+r5sp+QVknT1l4Md6WM8TiqCR6LQHlxM2R3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iG4GnZ3sV3RmnnlTwOfKjaL8UGwRZ+4JSlFTYKalklhvUr3uztjJZtcy2pXs5SroEUc5FBsiKHWBvk6RtSWwI/Q3hGsJOoqUHcPY+GMg4x2OEfhTFwrp+/+o7xclQLNEE7i8YHLdnVUAhIpicenzoHoDvT97XD8B1dKMJ1UltNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsEKMxBy; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsEKMxBy"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79ab5fd969aso119148487b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777321007; x=1777925807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey+vtW5zGSIcS5Imm4MD7T8reur80NswJgiOxTbyp3o=;
        b=fsEKMxBy8WLLheSQTzxfMZwJypobw1namm0UEtshAEIi9Lr5Xx3x0i+29ctd1aZPGc
         igmviZrXSeQVOakucrO7fMf6gHN6J5954A30tL5V4lAdjvKqJ/ChjwJWGojwUR6agSUX
         hZ2+GDbLCSE7Nvca4Uf5RL+tPEN/SPxXaovhQ81m3k0gsQcIXrXooLIqsWrnjnPz54+L
         Ai1F/rfPZI+WLGrYTNlc54ARGIOM3M+IWbMUzQsY52dUstFGNJhHDUIFYguTLBGQMpTH
         qgR4zpShkPi0LdOxlwZ8IPuzW3SZLjkzLvoja760ibB8FZ79xqHW8ad81TiqpEx/xWc7
         GdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777321007; x=1777925807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey+vtW5zGSIcS5Imm4MD7T8reur80NswJgiOxTbyp3o=;
        b=kL5Ls2s3DvlrA1YyTpizDcVrt8eds9TYf7tpebu8rKCQgNZ1FBwUS4Pm7AMq/a0TJK
         WGur1IBj6Aud0lxLZk8ai3bHGF/OK/WG+itPpMT96MXzMnv4LyWsAOtRcGYPJ98ciNj8
         KjTAu6Nm8fg+1c8IWePWA3ZmOIO38EMNJd6B6nRdfwo7KrLlXA0B1gaFCyfggELXQocc
         RHO6en6ihqyP/etGs1to7l5/gD9YEamqXt8/++3yzwONLF+nMTEDakpiverkiR4jfuov
         R7woD2VGrG3QrZHc0n+GdNkslKmDRJI1aiLkMN8/0OpgHkLziSd4fIyKYXPK7B0K/EdP
         I6Og==
X-Forwarded-Encrypted: i=1; AFNElJ+oiWvXzW6FNK5/EvR0LhPrjaQcTJTvqlCPQ+kWgYVilKbwPnH5ECgYGQKQco7gMCbV0/OFlGUDlWEkxHZl6vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI0q6bHCoLFlB4SYITe0XJ5eJGnk6qR3MQP2Cvq1Ng8T3JJiB/
	zpFA7ViJ6Hnyhi8VGx6YHTeArkI7QxbU/DyMNf0uDEsovIshk+mRW2HW
X-Gm-Gg: AeBDies+EZquST1wJohYTtgLgEY+jhHAYQPFCYQa5SADYGzpFO3I16svayfZ2FZG9m6
	+JeB7v9ERr4l8CU7lh7DRHfZb3Uvtn0p+L4Tv8uAyc22x3fzL29pCJE84RhIBnaV6nYsToefFWH
	dD7smDauncetwYzqOJoaxv6BNkyRAzTG9JtGO4RipCJ3krrDmFWcp2uj5cCCHL0tuAGB5cMrjJp
	v5t1zHmmGMyAQ6q/T+0s0gPZzNSJqFF7r6y4AUfvUJH5DDR7gcaQwivHkkhlm+jHpegv3oW3ryI
	rqAVyKCezkEHmzgVGr94fmZUcBYwW2QRA0JqTMfTBGqOUNB7BjWIq/Jfip8x8ymbGvPjRhZAtvM
	TANC7Ml1B6wgjO0i0/AxCKe1ZlibWnuKOMfjiyB0D5HzN8iT+9eeMMHv99+/nXc9w6bcIylFFft
	a0qzIbMltem28u8P3ePcm9tXJUMos2214uh0r6vwXy6HVhctS2iwXtGVvJphrSg/UC7is57U9BU
	f0Q8tHgsTzXvBOqX4G4EQvTX7LpaOz8GxjRkA==
X-Received: by 2002:a05:690c:c1d9:b0:7a2:f14d:5a1 with SMTP id 00721157ae682-7bcf58cb7e4mr153787b3.49.1777321007663;
        Mon, 27 Apr 2026 13:16:47 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e6149sm1753387b3.11.2026.04.27.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:16:46 -0700 (PDT)
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
Subject: [PATCH net-next v5 0/3] selftests: drv-net: convert so_txtime to drv-net
Date: Mon, 27 Apr 2026 16:14:32 -0400
Message-ID: <20260427201640.294694-1-willemdebruijn.kernel@gmail.com>
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

