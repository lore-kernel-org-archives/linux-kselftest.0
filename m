Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D109B2C2363;
	Tue, 21 Apr 2026 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782599; cv=none; b=WgjaBaA2JSDEtmrZlTeB9/u8DPSSJFBL3XoKtc+6eLlR/l0zR9dfyRS6PqswDybtL6yWNOp8vFrIhbDcrc4vhHe8LdXsiRUVavwrttdPGb83XxHNl3dWKXfiVck/LjfIqOigGXQt2bxkuo0nRtRrDVsE1ZTHtaHicsQT6izIxF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782599; c=relaxed/simple;
	bh=ErZqLqG4z1mz022InKJE68dLicLEokhYYUkZnoSROZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tiKboxIkkzI36ygCBNImhD/WQG9t23wVrcmzOUeF9MojNAV0Xp9Vtp7KwsIckGxKiYjOccDWJRXHGG/8j9Vml9NGTDoRLlO0sa0cI1ufBkesmNsGnYA3KP1MtUi82pAir3Kvt3LzjySv3r2IZ3uUWrA2eW7E9LRbFdixHwrr5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BCUzE2ds; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BCUzE2ds"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A3125DE;
	Tue, 21 Apr 2026 07:43:11 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58753FAF5;
	Tue, 21 Apr 2026 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782597; bh=ErZqLqG4z1mz022InKJE68dLicLEokhYYUkZnoSROZI=;
	h=From:To:Cc:Subject:Date:From;
	b=BCUzE2dsRxMqokii6HC3etc90tBjGaI6CFX54qlaUIXVnAxCNPreYUNHFr3aHbglU
	 n6PoRpqzce4soGEVJhAtwlZCViT+qSdaBK443FB99MXkHX237vlSx3B1LP5y2Ma1jn
	 qhwfxt/Msa3qnlTODYEf9k0ybHDrpd6vbYXNQV2Q=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/4] POE sigreturn fix and extra tests
Date: Tue, 21 Apr 2026 15:42:48 +0100
Message-ID: <20260421144252.1440365-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
avoid uaccess failures") introduced special handling for EL0 registers
that impact uaccess. This did not however handle the case where a signal
handler removes the relevant record (poe_context for POE) from the
signal frame; this is clearly not typical behaviour but it is legal.
That commit resulted in arbitrary data from the kernel stack being
written to POR_EL0 in that case.

Patch 1 fixes this by tracking which fields in struct user_access_state
are actually valid. This restores the original behaviour, where POR_EL0
is left untouched if poe_context is removed.

The remaining patches add new tests to the arm64 signal kselftests to
check that POR_EL0 is reset and restored (or preserved) as expected.
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org
---
Kevin Brodsky (4):
  arm64: signal: Preserve POR_EL0 if poe_context is missing
  kselftest/arm64: Add POE as a feature in the signal tests
  kselftest/arm64: Add POE helpers to test_signals_utils.h
  kselftest/arm64: Add tests for POR_EL0 save/reset/restore

 arch/arm64/kernel/signal.c                    | 19 +++--
 .../selftests/arm64/signal/test_signals.h     |  2 +
 .../arm64/signal/test_signals_utils.c         |  3 +
 .../arm64/signal/test_signals_utils.h         | 16 ++++
 .../testcases/poe_missing_poe_context.c       | 73 +++++++++++++++++++
 .../arm64/signal/testcases/poe_restore.c      | 64 ++++++++++++++++
 .../arm64/signal/testcases/poe_siginfo.c      | 15 ----
 7 files changed, 172 insertions(+), 20 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_restore.c


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.51.2

