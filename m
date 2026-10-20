Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486420;
	b=gpvYl2QOEOTNPaCsgitP9tdbM/OM3WCOMj0Re0OLgfyFIyqFz0aJonVZM/m1pofZbk0z
	 Bmv60kuGDvbbGCkJgAjtKZHm/JVzeLlib5AvUEARTEgm81QP+xA950cLpG9ZwKm1luzag
	 0E4Y57EnLmNz1KMk6Oj79Hg+f9RmLLVRtHpTUDwdoBdn1pa2j+/af4Z3LoyiH/4cDoCFL
	 2EyewtHuIRva2mo69hKxl5WU07480Gdpln71xxdQ8IwMINy0i/hStUG5VGN+U1Y7KzE2C
	 I+ej5k2T3H60OtyhjvLJ8IutMYVjrNat88/C6KWzGbT9IEkJiCJ/87IEN0LxqjSrIWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486420;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ed5LLARE1oEpDNdKMvECE32HDwk9thX5ocTriX9n4fg=;
	b=qTCPpUFK1c8ayJuDNmBgLgVytOG2oWj7dEkCiXa104AwY2QNAqBkV2kgJId7cqG7Az3S
	 oIe8wwgLAfscckuzPTpzk4zn47zqzp1zY1F5r5+a52Lg1qdNEmYL3EMoCOMPzj58nQ3j1
	 UfzETyy5wJRAVc8E2Ph664XMtjMJgpk9igY+jsoZxqQHziCCTkesVs+5ycQZW9Oer9h7Q
	 z7MWZURHv6q4O7v5cOfCPRmpbfXy+EH3uda+LhtVotQD1VzttviOfXBH0T2FxuZsGWPEE
	 NU1zdp6+i5LpCxg1+I9S7A7QczpV9IFMEb8jGulETaU90ZCz3t/HVN76WkNETmTMxtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=FUEPu2am;
	arc=none smtp.remote-ip=93.77.172.67
Received: from forward103e.mail.yandex.net (forward103e.mail.yandex.net [93.77.172.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCD606A31B
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 08:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=FUEPu2am
Received: from mail-nwsmtp-smtp-production-main-62.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-62.yp-c.yandex.net)
	by forward103e.mail.yandex.net (postfix) with ESMTPS id B69FDC034D;
	Tue, 20 Oct 2026 11:53:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-62 with ESMTPSA id HrVkYxfiaqM0-7VcNl6Km;
	Tue, 20 Oct 2026 11:53:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1792486408; bh=Ed5LLARE1oEpDNdKMvECE32HDwk9thX5ocTriX9n4fg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=FUEPu2am22tARY8fDQl5NaZw3JT5CoP1ptCPxojc/3/DGhufeYgU8FRDBaqdcgyzh
	 TvGWIlxydSvY7NAfaG47z8hqmeVxIj1bdVfmzKSQ5Mj8j51hCD4G9+JldCEy7uw4eu
	 VP/lrHg004UFE/Ri9mGt/VVER+g4+j/vDyrcRodY=
Authentication-Results: mail-nwsmtp-smtp-production-main-62; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] kselftest: arm64: fix README typo
Date: Tue, 20 Oct 2026 11:53:16 +0300
Message-ID: <20261020085316.1880320-1-dmantipov@yandex.ru>
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

Fix trivial KFST -> KSFT typo.

Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 tools/testing/selftests/arm64/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/README b/tools/testing/selftests/arm64/README
index a1badd882102..04e102d789e5 100644
--- a/tools/testing/selftests/arm64/README
+++ b/tools/testing/selftests/arm64/README
@@ -21,5 +21,5 @@ KSelfTest ARM64
       $ make -C tools/testing/selftests TARGETS=arm64 ARM64_SUBTARGETS="tags signal" \
 		INSTALL_PATH=<your-installation-path> install
 
-   Further details on building and running KFST can be found in:
+   Further details on building and running KSFT can be found in:
      Documentation/dev-tools/kselftest.rst
-- 
2.56.0

