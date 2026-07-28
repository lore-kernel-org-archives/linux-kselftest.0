Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C43B47F9
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243460; cv=none; b=ihKocPIgnFfcooAbQiXW9P9cqArvcy4nzs5m4PGihh56zkzIvAx75vW6iy8f/UoHt/+Cj5Ny+1z5h4tA9iRc70n5plrwakxs3c+1On9siX7SfqWfZ+9J3CUVOdaklsquYST4XaLsSq6S4lKHBG80NaDUzQ3so51RO/WbzqLX83M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243460; c=relaxed/simple;
	bh=CKdaJ4RVyg5xO4qiT5Z8eo8Bg5bmcyNHIs2Iro2YCF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HINJRV452horEKCIvzpWGMICRxSZaw4VPMhESEcQE/1+2dOK5iqOkNTRug3pD8L8uFUoEZ0k5pqx097eJ5pp9Vvmn4FAKKjU35/qMbMGuNhH6yqFD3gGCeIW2vE79zpv1Wv53z2cqnkuHIWeqg47X2HcmsQVo+fM0hAq9OdQbgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aZtHnrFR; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aZtHnrFR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785243446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BWKS7h7Bvs7leKu2fQzHoZ0qE96P17btMRNJKxUMLhI=;
	b=aZtHnrFRQXoZs5EFDgR3MgewP/Rs85b6dsyp+3F7v+C9HaRemxHFTeb0HNOZAfka35DGuY
	CByeNs6y7PVtchU5Dc+Z6AWXsk30C1ZrYHgzlNP/f4H61Xo8uLPpCBVkcQIsaPG+Yb4kxc
	SuyGa+FgbjkkAO4ezQ/BiAV96s5Y/dA=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next 0/2] netdevsim: add TLS device offload emulation and test
Date: Tue, 28 Jul 2026 20:56:39 +0800
Message-ID: <20260728125658.390500-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The kTLS device offload path in net/tls/tls_device.c has no test
coverage upstream -- selftests/net/tls.c is software only, and the
offload code needs a driver that implements it.

So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
advertises the TLS features, patch 2 adds a selftest.

No crypto is done: TX puts the plaintext record on the wire, RX just
sets skb->decrypted.  That only works netdevsim to netdevsim, but it
covers record assembly and the offload lifecycle.  Real ciphertext, and
more on top of it, can come later.

Jiayuan Chen (2):
  netdevsim: add TLS device offload emulation
  selftests: netdevsim: add a kTLS device offload test

 drivers/net/Kconfig                           |   1 +
 drivers/net/netdevsim/Makefile                |   4 +
 drivers/net/netdevsim/netdev.c                |   5 +
 drivers/net/netdevsim/netdevsim.h             |  35 ++
 drivers/net/netdevsim/tls.c                   | 418 +++++++++++++++
 .../drivers/net/netdevsim/.gitignore          |   2 +
 .../selftests/drivers/net/netdevsim/Makefile  |   7 +
 .../selftests/drivers/net/netdevsim/tls.sh    | 271 ++++++++++
 .../drivers/net/netdevsim/tls_offload.c       | 498 ++++++++++++++++++
 9 files changed, 1241 insertions(+)
 create mode 100644 drivers/net/netdevsim/tls.c
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/.gitignore
 create mode 100755 tools/testing/selftests/drivers/net/netdevsim/tls.sh
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/tls_offload.c

-- 
2.43.0

