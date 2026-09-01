Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31896442364;
	Tue,  1 Sep 2026 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280945; cv=none; b=RrdJulWnVJBENxpi9hR6bmjK1oi0btRpqBd2cTFn4LYliw62jJjtnn4xwPb3AyoPF5QkvDLZA4KJKxmW8qOJ/YHbmI+fABr68uRI0mtUw3niwbC5mCN8bSlbey+O6JVamoVM1k/u1lWyTC7Q0Ff32pU9160btKmdvdlwTElDB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280945; c=relaxed/simple;
	bh=ZD/kCtjz8xee7i676g+C50i9IkQsD/dILLlKmohF2p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FXoBwGzAS8gupr2fiEMY8T2dMb15iXgM9NpOJnPfAu6Ly2oWXa+p1PSUsh8wBP5SjiaE0UADC/E9jZ+EbFgOIHhrjUw56SviZ7oA13CGB9dMOwO0/511nSQgVk9Zn5qh7TNvm2t4+cmAZyYP/E5MYJMyj3H3b1WwRtT51VJokjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k4oNKKk6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k4oNKKk6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35BCF4E414A8;
	Tue,  1 Sep 2026 16:42:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC0BC6053C;
	Tue,  1 Sep 2026 16:42:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4095711C7927A;
	Tue,  1 Sep 2026 18:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788280936; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RyCFguoNYjy2w/mkeOQR3Xu3bsp4TaY18KFr9XMsMRA=;
	b=k4oNKKk65oP9+cQtozKRueW9PiexLe/nuE2gHqwSbTL7+blLA5j1NIGt9ZkjVnDz+7Rqz4
	EvxyO9NdaHsbUaA1qsdz42M9bA4CDlLiYdOwe6HGw/+V4HZ7M+JZ8hpFeqXh7dQkFI9ZRg
	NIizZQGC3bE59MumAyaTOjpcSajWz8xkDg+4QWpJylS98n7WUEy0rNDNEeOUAqu1p7xuEx
	ZjshAvyBtoz+TndLh9/s9B/qZdzHR/wDBUPUfR9iK5TZaWLK6UmQ3fZhGfuzPKe8+x+OZr
	teC1J2EN8axcK0xtdgp2lZJ9TqjkQQzMnAzo+DiNVhtMhgGEevBCIU2YLgsxuw==
From: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	matttbe@kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/2] selftests: drv-net: Allow cross-compiling the hardware tests
Date: Tue,  1 Sep 2026 18:41:57 +0200
Message-ID: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

Here a small series to address some of the issues found while trying to run
the drivers/net/hw selftests on some variety of embedded devices. In
that case, tests are cross-compiled and installed to the rootfs with the
'install' target of the selftests.

Some tests require ynl, and ynl's build machinery hardcodes CC to gcc,
which doesn't work with cross-compiled setups. Let's use the
tools/scripts/Makefile.include instead.

This is duplicated across the ynl tools as it seems to be fairly common
to build alone.

Let's also deal with the io_uring zerocopy check that builds a tiny program
to verify that liburing is available and in the right version.

Maxime Chevallier (Netdev Foundation) (2):
  selftests: drv-net: ynl: Allow cross-compiling ynl and associated
    tools
  selftests: drv-net: Use cross-compilation environment for the io_uring
    check

 tools/net/ynl/Makefile                          | 1 +
 tools/net/ynl/generated/Makefile                | 3 ++-
 tools/net/ynl/lib/Makefile                      | 3 ++-
 tools/net/ynl/tests/Makefile                    | 2 +-
 tools/net/ynl/ynltool/Makefile                  | 4 ++--
 tools/testing/selftests/drivers/net/hw/Makefile | 3 +++
 6 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.55.0

