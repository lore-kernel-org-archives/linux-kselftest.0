Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070966;
	b=rsZEBuzB7v/oWMMO/lBSU+DYlR4tAqFw/WRUPEqviJ18OUVVxtbWz0561fOjfIzOuBkC
	 gkghEVMKwjzqn2O9/+c6f3hWS8kXIYxwHv4sEaXKOU4x0KXNEGhdLb4yykXyL2jenreOE
	 DN6kRv7RDVlhcwttHoSNv5NBjhvy0P1cL8+ibkfKv66GuCBgneTs/wqSNS19iHlnOZd+K
	 w4zsJbT0brCy+sQQvHdIb60w9KVzohMBBQSjkIpehLxa2Sbm11R6yfCD2TBLug7xanT6l
	 MLeOOxWP9D1DWW4GGJS58ldlwzBUFyTi/NDFtTUUsfSUj0IFcxePR5QeaAdofj6tp8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070966;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0k8SjqfV40GoMj5uo467qPGka1/JYX8qZC07b5bhn/I=;
	b=qCF5t75NBOfaELalTh76Ri+LyjhSAK8Gwk3KRQ66rOgGteFQgikcTJ+sCcZyCHtpdEjE
	 fy2PeayX5KBrCQFA8Isiq2qAe9sQnh0ETv+urJkH8CwlBD1DIHQ+lERbfOfWQr1YEg9mC
	 X8j6PnB0ppXddRaQ0rGFsFcfiktJFh5uuViNR62GnrG5ZuvrEfhvz37PHzdW2cvais89a
	 K3frepFvns1MpMPY4wCkwrqJey79XW4nxU55lJjEdMrT8XiEYmR77eiHmXVKzS4+vVf6n
	 hri2R3Xqd6RN280bfJ1AFCYEGCqA0jjmWteISPDnUe5tILzOvXXzsDju7sU52iWYO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JoHTTGB+;
	arc=none smtp.remote-ip=95.215.58.205
Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A9606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JoHTTGB+
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/paUg1xcKXQDviTgdVFByKx4J0HVlCDf5eq8bk6XF5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795070963; v=1; x=1795675763;
 b=JoHTTGB+yCfmB7CRrkISQDC3FqnODTbZ+9Av3bWP1nqjdik3U5+UScBLE8lqOyREXyjVNbOF
 g98PEt+hQhFMVonh0NrP/b628RvLGvPLNZeS4Sel3ahwKLkqmDHLd1u5yOG1jjdImQZ9yjC8eoO
 9DWE1TEd+IernVs6MGFUZvpM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b0ae60659841cff;
	Thu, 19 Nov 2026 06:49:23 +0000
X-Mizu-Trace-ID: 1b0ae60659841cff
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 0/2] netdevsim: add TLS device offload emulation and test
Date: Thu, 19 Nov 2026 14:48:49 +0800
Message-ID: <20261119064902.242502-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running kTLS over this already found a few bugs:

  b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()")
  ed642349d87d ("tls: fix the open record check in the max payload size setsockopt")

So I think it is worth sending a formal patchset.  v1 [1] was asked to
wait for a selftest that can also run against real hardware.  That test,
drivers/net/hw/tls_hw_offload.py, is in the tree now, so this can move
forward.

The kTLS device offload path in net/tls/tls_device.c has no test
coverage upstream -- selftests/net/tls.c is software only, and the
offload code needs a driver that implements it.

So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
advertises the TLS features.  Patch 2 lets the existing hardware offload
test, drivers/net/hw/tls_hw_offload.py, run on netdevsim as well, so the
same test covers real devices and the netdevsim pair CI already uses.

No crypto is done, like the IPsec, MACsec and PSP emulation netdevsim
already has: TX puts the plaintext record on the wire.  That only works
with netdevsim on both ends and offload on in both directions, which is
what the netdevsim environment of the drivers/net tests gives.  It still
covers record assembly and the offload lifecycle.

[1] https://lore.kernel.org/netdev/20260901154914.11637-3-jiayuan.chen@linux.dev/

v2 -> v3:
  - fix the build with CONFIG_IPV6=n (kernel test robot)
  - address some of the issues Sashiko reported
v2: https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@linux.dev/
v1 -> v2:
  - drop the netdevsim-only selftest, run the upstream tls_hw_offload.py
    on netdevsim instead so the test also covers real hardware (Jakub)
  - rebase on net-next
v1: https://lore.kernel.org/netdev/20260901154914.11637-1-jiayuan.chen@linux.dev/
RFC (July): https://lore.kernel.org/netdev/20260728125658.390500-1-jiayuan.chen@linux.dev/

Jiayuan Chen (2):
  netdevsim: add TLS device offload emulation
  selftests: drv-net: run tls_hw_offload on netdevsim

 drivers/net/Kconfig                           |   1 +
 drivers/net/netdevsim/Makefile                |   4 +
 drivers/net/netdevsim/netdev.c                |   9 +-
 drivers/net/netdevsim/netdevsim.h             |  34 ++
 drivers/net/netdevsim/tls.c                   | 453 ++++++++++++++++++
 .../drivers/net/hw/tls_hw_offload.py          |   5 +-
 6 files changed, 503 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/netdevsim/tls.c

-- 
2.43.0

