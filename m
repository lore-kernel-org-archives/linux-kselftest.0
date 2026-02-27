Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB12D7D3A;
	Fri, 27 Feb 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174762; cv=none; b=PzQDRKsnR2XRWrAW2acjAjBgGROrpFqD1AFz63RrDORb+ciXEsM2ON0reaQVK0UzyhDuiyPuaxHf0Szi1yfrsPVG3BJpCw7v+58eh2qyOvcQtpLnGgMF8ejChP9+elOYje//lOD0dhbHY+uzve7WasyXHdq6GZ9PUObnwVDAopU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174762; c=relaxed/simple;
	bh=qdplXksflaIpAj6SChFbBtMX+ZhagxTRKNTqANtxra0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PVXosgxz9ruWdAJ1ScjO/MqEHCCiFPe2XMN0ORIPAMsICwCuf6ng/J3mLY/KNAfHUqC4NLbC/Uow+twx4qEHRHusUOjA8DgsiA2mOuTUjP0Q0xEQYSMQDnDenXeE0TsIGOIngC0tpmzpgTVglmqeOwUntW7JVljCeHanzDSuddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YUQtfPlO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+hH2cSbr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YUQtfPlO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+hH2cSbr"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZ0YiYV65qLyG/Pj68g9bid0NzdAUQripL6OO6mzYv4=;
	b=YUQtfPlOW6DnphUEQzaScXwmSgqJYYqRelWWzXXGozwj7n309Hc0mX1iCIVarW2V5oQmj9
	yBcVTpP7Zfm7ud6y2rY/QB4VrpG+e2cHiX4t+BF0R3ptY5h0x5XZSboO0cuNYiRhP0+39j
	hvCxu0wUi1gLEzSyHEMn9y4AcRPs9eP+kAY3B93KOW2S+A8JeKGJrCFTJgRBilmj1boO4Y
	LVXp7f2W259GHZ0OMhwyyJ42dY4qDq3LCIYWzB+1JJbrgxP8YxxV2syGDjJALWxEffK69l
	ISMnjwHFhzttLJ6lNbr4tdWfCobzJrjt7YES3PndjA4Jew+h39Y+3TL6pZbjJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZ0YiYV65qLyG/Pj68g9bid0NzdAUQripL6OO6mzYv4=;
	b=+hH2cSbrMFEYm+JeaIACvFBdavTY21mvnmz9/sHVSAOJ2YKxkevAN4UKDQ2u9HE+venIDj
	q1+JASZtD+fAxNCQ==
Subject: [PATCH v2 0/6] selftests: vDSO: Assorted cleanups and improvements
Date: Fri, 27 Feb 2026 07:45:55 +0100
Message-Id: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQqDMBBFryJZd0oSrdKueo/iwiaTOiCJZGKwi
 HdvKnTZ5Xvw398EYyRkcas2ETETU/AF9KkSZhz8C4FsYaGlbqVSDWTLARgnl5ATmAkHv8wMXXd
 1nTWtdUMjyniO6Gg9wo++8EicQnwfP1l97S95+ZfMCiQoWaMy5umsqe8T+SXF4Gk9WxT9vu8fM
 IV4a8AAAAA=
X-Change-ID: 20260114-vdso-selftest-cleanups-779f7dc6dfa4
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Andreas Larsson <andreas@gaisler.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=1277;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qdplXksflaIpAj6SChFbBtMX+ZhagxTRKNTqANtxra0=;
 b=8Wbq6uMgnQUWRO+tKdXqLHXph6PrGHQDVN91EmlF3scx2vPJTX94M0HB/1Zpb4uf3w9grZZft
 LnYGuMLGkA1D9E+cXMUaSv5+vN8Knmzbc32EAT2MHgQfDfgIlf0vFR0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

I had these lying around in different, unrelated serieses.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260115-vdso-selftest-cleanups-v1-0-103e1ccbfdc3@linutronix.de

---
Thomas Weißschuh (6):
      Revert "selftests: vDSO: parse_vdso: Use UAPI headers instead of libc headers"
      selftests: vDSO: vdso_test_gettimeofday: Remove nolibc checks
      selftests: vDSO: vdso_test_correctness: Drop SYS_getcpu fallbacks
      selftests: vDSO: vdso_test_correctness: Handle different tv_usec types
      selftests: vDSO: vdso_test_correctness: Use facilities from parse_vdso.c
      selftests: vDSO: vdso_test_correctness: Add a test for time()

 tools/testing/selftests/vDSO/Makefile              |   6 +-
 tools/testing/selftests/vDSO/parse_vdso.c          |   3 +-
 .../testing/selftests/vDSO/vdso_test_correctness.c | 112 +++++++++++++++------
 .../selftests/vDSO/vdso_test_gettimeofday.c        |   2 -
 4 files changed, 85 insertions(+), 38 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260114-vdso-selftest-cleanups-779f7dc6dfa4

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

