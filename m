Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35944DBD67
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797693; cv=none; b=iw9xBmAzacvlnj3CbbpY/QCv1npj8oNVT+yj2cx0o8onXNOyXuFrwcoV8wHhsH1PU2wqkdXjRaBCzP8UxDELnbo2/fqW5nQEDg6eMNzJu10X7I0I4/1WP2khEczU3LlUUWBkJWA80aZ8mLlnP38sVgE6gmKRy3iDmYt1cDtv7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797693; c=relaxed/simple;
	bh=gWNNBH/8ik7zKyhFYLyGskN+w5uScFhl4PyboR0fegY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6Ac3Q8cRK/PR6TiuDTbzFta+uFof1W8xvMd70UD0/l98kX4pGC4gFIVhRy1Di+KOxmfh+DNg6EfIP2D/4bMT8m8FhgHALmUDmz47K0sIrOpv2bAK85KlYecXkHk10RWqyQsoDR6y6lqYDTGn/XQwFqRfMGah3ZrXXlDGbcXTAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0JvrS2ZD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0JvrS2ZD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 15B0F4E4156A;
	Mon,  7 Sep 2026 16:14:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D698660383;
	Mon,  7 Sep 2026 16:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DBC111C79257;
	Mon,  7 Sep 2026 18:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788797683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=bzQS0SQV+MIhTjSJhNIXgjRAgj5KvFckOQuhEmYopSA=;
	b=0JvrS2ZDqB2DQInzb/4+L+J++3K0kiUCL8y4/oh6SDS/I7gXQs4kx8nBmvszCljeyeupo8
	XsGmQQdUPQfgXC4pFT5c33RGyKz4YFU7rPIRFIBpxAU8xtNuH5pzXyZrW6v0rMxDShaPv5
	aSL49JqyaRnSpghzj+mtmunBn+P969jgoVgZne+hKDs3pFEBvCpzCMO+ujpu641fCFxJNm
	jCNIbloVxYo8BkHvm63TrwtA1PBvYh0CpddbZmMREvGkdoTyFEI5HuucFrtoY8qXBqGrIS
	Mmr+vgKeQH0TX4aDVMlVtlKTRdN//EJ1YTJEFVnAk0nRvKxCNrXiSQPKRtNHkQ==
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
Subject: [PATCH net-next v3 0/2] selftests: drv-net: Allow cross-compiling the hardware tests
Date: Mon,  7 Sep 2026 18:14:34 +0200
Message-ID: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This is the third version for the ynl and drivers/net/hw
cross-compilation enablement series.

Changes come from Sashiko reviews, that detected some Makefile inclusion
ordering issues, a stray 'Q = @' in the ynl makefiles to have proper
verbosity support, and some commit log rewording.

Changes in V3:
 - Add Matthieu's review tags
 - Drop 'Q = @' line in patch 1, it's now handled properly through
   Makefile.include
 - Include Makefile.include before Makefile.arch
 - Reword the commit logs to explain the limitations

Changes in V2:
V2: https://lore.kernel.org/r/20260903155524.2241065-1-maxime.chevallier@bootlin.com
 - Update the topic for patch 1
 - Update the CC construction for patch 2

V1: https://lore.kernel.org/r/20260901164200.1124343-1-maxime.chevallier@bootlin.com

Maxime Chevallier (Netdev Foundation) (2):
  tools: ynl: Allow cross-compiling ynl and associated tools
  selftests: drv-net: Use cross-compilation environment for the io_uring
    check

 tools/net/ynl/Makefile                          | 1 +
 tools/net/ynl/generated/Makefile                | 3 ++-
 tools/net/ynl/lib/Makefile                      | 3 ++-
 tools/net/ynl/tests/Makefile                    | 2 +-
 tools/net/ynl/ynltool/Makefile                  | 6 ++----
 tools/testing/selftests/drivers/net/hw/Makefile | 5 +++++
 6 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.55.0

