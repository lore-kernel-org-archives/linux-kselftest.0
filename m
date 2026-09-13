Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0373C09E0;
	Sun, 13 Sep 2026 23:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343432; cv=none; b=s7+T0DeRUPXl5t78AzBnbJSMz9B0DW+d0FGUDu3S8R1usw+rB7bZEEMEXNvA3xH2lQ2RoJlcxUuvx4UgWmHh4KI2dp/caeUIBrKxaCPUOzsPAGLdThPLUH75Xt/SO7rokoiIZBusPPS+3esSwFGd4lI1zw7C00qGX2x0zUmJt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343432; c=relaxed/simple;
	bh=c5l6g8eGfXC4ge/yVfySNfHnk+1v39+iTqVF268URHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AhTRmNaW4yZHTO1jH/P2wTm0yOEHc415FPEmry53qGnZ7tseJdSCAq79SFcAAa65jdLlSOSREdrWa/G14VprD0Lq3GObX1EzMT/BldehCKjWm1KyV3J/pS2yp7gTpzexiIMktGZrr9m8eAtImsAArQ0i52/doilNlFAxqS5vb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pgHphQ3h; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pgHphQ3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343423;
	bh=c5l6g8eGfXC4ge/yVfySNfHnk+1v39+iTqVF268URHs=;
	h=From:Subject:Date:To:Cc:From;
	b=pgHphQ3h48CHTfPmcAUVczMm5p/mkjtxdZDgSBYIsftXZ8nQVE18u7MpJDUphv1/e
	 7c7dVtUrw7ZSr95d/FnsywWFhunpHLX8dZK46xIlI1JxwNNXqcWE3t3stINjs8ras2
	 gKl/He19EyssBVs2uM8gUV442Kw2y4qdmimLx330=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/5] microblaze: KUnit support
Date: Mon, 14 Sep 2026 01:50:07 +0200
Message-Id: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2ppSCRJX/odh0cdgx0chnYIPw
 r8LGFcuT3LuuSMwRkKGQzZCxIGY2jCD2mRgvQ5nFORmBiVVKSupxLUPlMSdbGzNTb9R7PWuKbW
 tKlM4mGddxIaea/JUf5l7c0Gbls5ieOLUxtf6OeSL98sX//khF1KUzroGc4WmkMcHEjNb3/ttw
 AT1NE0fqrXoK8cAAAA=
X-Change-ID: 20260802-kunit-microblaze-7a3f6ac88b4d
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=1692;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=c5l6g8eGfXC4ge/yVfySNfHnk+1v39+iTqVF268URHs=;
 b=xlUnNQA136XNwuR07yiRXSYdEqrgsmV+l5sYTLeMgEhb2bWRYKwjkUiWPT9Uc3DqGeI4H1sB9
 zgR6Al7kR8SAe7JYRHS8gIFjQbhzCKCvN2G5LjH6uYAdt+5SU1qXbfq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add the necessary prerequisites and configuration to run KUnit on
microblaze.

Please note that various KUnit tests might fail depending on the
kernel configuration as the memmove() implementation from
arch/microblaze/lib/memmove.c seems to be broken.

gpu_buddy.gpu_test_buddy_alloc_exceeds_max_order is currently also
broken.

Intended for the microblaze tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase on v7.3-rc1.
- Pick up review tags.
- Move do_kernel_power_off() after the message printing.
- Little endian support.
- Link to v1: https://patch.msgid.link/20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net

---
Thomas Weißschuh (5):
      microblaze: uaccess: Zero out destination on failed get_user()
      microblaze: Pass -m{big,little}-endian through KBUILD_CPPFLAGS
      microblaze: reset: Call POWER_OFF handlers
      microblaze: reset: Provide a power off handler through an unaligned PC
      kunit: qemu_configs: Add microblaze configurations

 arch/microblaze/Kconfig                          |  9 ++++++++
 arch/microblaze/Makefile                         |  6 ++---
 arch/microblaze/include/asm/uaccess.h            |  3 ++-
 arch/microblaze/kernel/reset.c                   | 22 +++++++++++++++++++
 tools/testing/kunit/qemu_configs/microblazebe.py | 24 ++++++++++++++++++++
 tools/testing/kunit/qemu_configs/microblazeel.py | 28 ++++++++++++++++++++++++
 6 files changed, 87 insertions(+), 5 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260802-kunit-microblaze-7a3f6ac88b4d

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

