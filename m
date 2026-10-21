Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573747;
	b=d52PyuWo29HB/y2tnR2PamGChOp1czCfx6OchfveYD+P85/r8NeXmDhOagMwZq422Ns8
	 k22UfursURRDIMB65iMya378rozMi2/OTzwN1x8z6Hf72fP0YJQZZ/m2cazFqnqxWFp32
	 YEP07avf13Y+CowfloKinUbWDkBlJoCE74uW3gFQD+fEy4tM5gK+dR3GqBmmV/CJYP/ly
	 D86xGxbG7qzHwnMYQ5AIK6p+gzc8H4sDkpeXHotZRf4Y/4ePcL5RxNapN+hm0c50K7HpQ
	 RgvJaQYL5guYosxKVAgdU6nxwT/jZDkiwqcicwGV5oZwAvQ7LAUOkuE/fsIz/yYwKUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573747;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=m4m+8auzD/3I9aBzl5NjCoQklre0jbzlsPnF0O/VYTM=;
	b=ceP4XLbyo/fMk4zXjqWrNYWqiWcFOwbjrR6oTnz5yJY2mzZNMdUTQtMpjtRMl5veW0eJ
	 NKIm4vrSB4NZfMBVM2Epz70U+oL/SNGkqTyIwDjp3gfF+ltpju+bvq8+ZoFxX/tsKhWUS
	 h3FyqFXe7xVw4s+io6m8aG6zmvd4QNs+A0Zo5nquxDKgMaZP2z3Ohtn+NWhulrqLnPWgx
	 lqCJ8P+1KwCK9Z+qkEQdiRDVcFqsCA2P8VZWPAAknybVW+461qSxPns8Ui4rqVUT4Iqzm
	 M6UGIEO0nf66TetKDIKfU+EfMHg2BACE7s7AYRl/W+pIxAalLwG2h1463yNaLkt1rmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yZQo5++J;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D45606A32D;
	Wed, 21 Oct 2026 09:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D45606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yZQo5++J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7973C5CD73;
	Wed, 21 Oct 2026 09:10:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDF8A606E3;
	Wed, 21 Oct 2026 09:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5945810328D3A;
	Wed, 21 Oct 2026 11:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792573742; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=m4m+8auzD/3I9aBzl5NjCoQklre0jbzlsPnF0O/VYTM=;
	b=yZQo5++JcnYNWNXWd0vHBue5PUMvZ6865ctrT4zoe2JrbgrRHJ86isl6CN0ky4hiy+4pHf
	KyVMZlLhg1Gs+3vI4jnTDXHpoFj/9Ya+NbQpfy9b7u0nIhrmq0sXHT1Y4LeKOfU0FnEyE7
	4b7RCljF2m/0sRwQtQGL+vzXD/kceq/NQwFTPxAEHnH3fxGojN8xoxfwP+IE+vQV8GVjZc
	dM6HJkK9T77PXSWZ70Kzade1WUQKstj1HgDuMJiyJEwhJ9c7p7DSlh7eMzR0/+5EceK3UW
	c8hsfuvh8eHKo1HXWJbDts+Rbf5P7GTKT6Fjrn4Iz0ALOsAPW9IP/qYMyf39lg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Breno Leitao <leitao@debian.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs isn't supported
Date: Wed, 21 Oct 2026 11:08:51 +0200
Message-ID: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
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
X-Last-TLS-Session-Version: TLSv1.3

The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
which is only available when hugetlbfs is supported. This isn't the
case on all CPU architectures, for example it isn't supported on ARM
32-bits on cores that don't support LPAE.

On these devices, the devmem kselftest doesn't skip gracefully, it hits
an exception while trying to open the nr_hugepages file :

  # Exception|     _reserve_hugepages()
  # Exception|     ~~~~~~~~~~~~~~~~~~^^
  # Exception|   File "/usr/lib/kselftests/drivers/net/hw/devmem_lib.py", line 36, in _reserve_hugepages
  # Exception|     with open(NR_HUGEPAGES_FILE, 'r+', encoding='utf-8') as f:
  # Exception|          ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  # Exception| FileNotFoundError: [Errno 2] No such file or directory: '/proc/sys/vm/nr_hugepages'

Let's check if the file exists before trying to open it, and return
immediately if we can't.

The _reserve_hugepages() runs as part of the "require_devmem()", that
skips if devmem itself isn't supported. Before the blamed commit, this
check was done prior to accessing nr_hugepages, so the problem wasn't
showing.

This has been found by trying to run the selftest on stmmac, on an
Altera CycloneV SoC (Cortex A9, doesn't support hugepages).

Fixes: 8ac4255c1e0c ("selftests/net: devmem.py: add check_rx_large_niov")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 tools/testing/selftests/drivers/net/hw/devmem_lib.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 3554954a6691..24637fb180ca 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -33,6 +33,8 @@ def _restore_nr_hugepages(nr_hugepages):
 
 def _reserve_hugepages(want=64):
     """Raise nr_hugepages to @want and arrange for it to be restored."""
+    if not os.path.exists(NR_HUGEPAGES_FILE):
+        return
     with open(NR_HUGEPAGES_FILE, 'r+', encoding='utf-8') as f:
         nr_hugepages = int(f.read().strip())
         if nr_hugepages >= want:
-- 
2.56.0

