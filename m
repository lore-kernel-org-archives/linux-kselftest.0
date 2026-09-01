Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15F342E428
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277773; cv=none; b=iyDnLyUYqCIaM94uGvuxVTf7TzqSK8Zk3zS0FQT/4gAmTkEAWGZb2bsk3Mi/F3fKC6RAVHj7aMpG7GCirF2cAdikDLiy8Ccl0t36oMXcFkpz4j80C+G961SXE3XcH53kAugHWR2k7oVeVm5acCPsDV3mlrlz5KRGkh3wEyyExK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277773; c=relaxed/simple;
	bh=7tAbQ3FNXQwdtFApJLSmfPJ1AsLIn5kjlzDFefq/f9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=till0bRZaID6mBXtB+5kpeIzsK3QBojHTuYrs3sLZYhFhpSK+1OEVY5Ifm3D3+H8ZqaHBA1uG7bHOBE3rdXQAKTNo2kbh1fMhD0XZtPvZSF6IsxTR/rIlVscq7KnILm256ntjw7ciA+nnxsFOaA7Tj2sW9std0Wn7LYBFJp9jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oqPvH9G0; arc=none smtp.client-ip=91.218.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oqPvH9G0"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7tAbQ3FNXQwdtFApJLSmfPJ1AsLIn5kjlzDFefq/f9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788277767; v=1; x=1788882567;
 b=oqPvH9G0IQCIELA8f3NPRCikXTuSJBmmty31hKFio7mhRBJvrxyXenO9359O2Fz3XDj7ZeQ4
 KX7OyGpnk4oNAsv/J51zXfE74a1vC5phnLsqPTq9cEXPHPX3Tp4/s4FczpopfsKzTNkFSfqBh9L
 zm3pmXbl6ErLnzva2CagwOPg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36ff23f91a58beb3;
	Tue, 01 Sep 2026 15:49:27 +0000
X-Mizu-Trace-ID: 36ff23f91a58beb3
X-Migadu-Flow: FLOW_OUT
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
Subject: [PATCH net-next v1 0/2] netdevsim: add TLS device offload emulation and test
Date: Tue,  1 Sep 2026 23:48:55 +0800
Message-ID: <20260901154914.11637-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


It helped me find
commit b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()").

So I think it is worth sending a formal patchset.

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
 drivers/net/netdevsim/tls.c                   | 482 +++++++++++++++++
 .../drivers/net/netdevsim/.gitignore          |   2 +
 .../selftests/drivers/net/netdevsim/Makefile  |   7 +
 .../selftests/drivers/net/netdevsim/config    |   2 +
 .../selftests/drivers/net/netdevsim/tls.sh    | 334 ++++++++++++
 .../drivers/net/netdevsim/tls_offload.c       | 505 ++++++++++++++++++
 10 files changed, 1377 insertions(+)
 create mode 100644 drivers/net/netdevsim/tls.c
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/.gitignore
 create mode 100755 tools/testing/selftests/drivers/net/netdevsim/tls.sh
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/tls_offload.c

-- 
2.43.0

