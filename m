Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3C3B14A8;
	Tue, 29 Sep 2026 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713830; cv=none; b=efTR96rhvLlyK9xTIfEULHq7UxdbcdZcjOmmkBtr7nLuTRBwBEGY9VztME/USVi7+XFCciooMxp8eZOK5BUxuqu6DgCBLljSPCrv25myDqcC9bnVeNWcOxRuwie1U7tA+/fjSSpipe6cKq1wBPB4JMwwjVkXdhaYloTK3lK4xfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713830; c=relaxed/simple;
	bh=mLPIHaLN1zwEgiiNoLS6x7fmmNkTgRH/XZf4sdQONSM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SbtlAaEyP3mQJhTPmt4wvpkHoVizxt3mJ0dFy8iG8/vGBXHF6Gamgp4m5OhJQF/y20OrSQizWPL1AjC4Glz69jNpS1OKWMC6CETrx7f0QqbUeH8Ors9O2HvqygrayGRBZTIMCOZW5/ckEIom7kFZ15/5z3IMKMe/c8SGOCZJD4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OhdYY5E6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OhdYY5E6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790713465;
	bh=mLPIHaLN1zwEgiiNoLS6x7fmmNkTgRH/XZf4sdQONSM=;
	h=From:Subject:Date:To:Cc:From;
	b=OhdYY5E6rsEcTNi84oAIaoCEg/UrQfODjAV6jfakIeUdDNqCf9Ias0UcGO56G+grg
	 4YTaQBA/ILbrmoCY/A35W+DZBvpB+7q44HBoXQewTuvPAdoth0wyqEvZN1ssGPA5gE
	 sp/Pwi1qXt9xVFUHuGB3gnJuXaTfuPGkywKZXUOc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] vdso/gettimeofday: Add support for ALARM clocks
Date: Tue, 29 Sep 2026 22:24:20 +0200
Message-Id: <20260929-vdso-alarm-clocks-v2-0-a7af4089a698@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OTQ7CIBCFr9KwFgMktNGV9zBd0OkoaC2Voahpe
 ndpNXHn8nt5fxMjDA6J7YuJBUyOnO8zqE3BwJr+jNy1mZkSqhQ7JXlqyXPTmXDj0Hm4Ei+1UEZ
 raVoNLOeGgCf3XDuP9YdpbC4IcSn6OgLexzwWfzbrKPrwWp8kuaj/RpPkgpeyMk2jVSWhOjzQE
 RHY0W57jKye5/kN7fSCLt4AAAA=
X-Change-ID: 20260921-vdso-alarm-clocks-6502a551ad5c
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790713464; l=1073;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mLPIHaLN1zwEgiiNoLS6x7fmmNkTgRH/XZf4sdQONSM=;
 b=fKnrtMutvKVcLjC7m84LyT9vBRESgFDml+XA9KRu8jPTnp/9U6/73QmS7sQn6ynlE9HCZGXKj
 izrm/2VyPlbCrSFUzQvZjQoFW02+h3qvzT+O0++IG3OZrLt/gDoVR5r
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Extend the generic vDSO library to also handle CLOCK_BOOTTIME_ALARM
and CLOCK_REALTIME_ALARM. This does not introduce any runtime overhead
in the userspace fast path and only memory copies in the tick update
path.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase on tip/timers/vdso.
- Add Signed-off-by tags.
- Link to v1: https://patch.msgid.link/20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net

---
Thomas Weißschuh (3):
      selftests: vDSO: vdso_test_abi: Also test ALARM clocks
      vdso/gettimeofday: Add support for CLOCK_BOOTTIME_ALARM
      vdso/gettimeofday: Add support for CLOCK_REALTIME_ALARM

 include/vdso/datapage.h                      | 2 ++
 kernel/time/vsyscall.c                       | 7 +++++++
 tools/testing/selftests/vDSO/vdso_test_abi.c | 4 +++-
 3 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: ca46a07c4b68246c4e400ce3649ab7228a878d8f
change-id: 20260921-vdso-alarm-clocks-6502a551ad5c

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

