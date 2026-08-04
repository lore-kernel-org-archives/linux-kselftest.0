Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98F314D0D;
	Tue,  4 Aug 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821565; cv=none; b=fUe1CJigvBs1nPThb3hf9qgktxkrmfeZNzeY9v3ClUs5fQhCmx12Dp5ejTYYUo35oSVTd1ipuljJ242UXsMoOxOG+lvDb+NwSklq/AVfe9a0B1OeXRstIBxTc8bqynFrvdt428/gZ+MIjar1RSXKtgQzGGweGPuIZiz4tfH20GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821565; c=relaxed/simple;
	bh=WfarSD1C8rtafu5OZM72A/HXtK5ytMBNpjsQ/N/4UEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X7giRAejoF4FyC+C+y4l/wlvbH5BN0+EFzSoC3Gj9zmVSO39Q64zxZkV95nMwNU2dOnCTJX7WY9ZWUmeEEMupb8uCEnBPql1dsbasly+60+p+ZGoAOa1DqcMpdbzc86q/4adl5xH8aYcFqTYdsduCOWoe+IzmsVHY710KHeK3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TA9SuBQL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TA9SuBQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785821555;
	bh=WfarSD1C8rtafu5OZM72A/HXtK5ytMBNpjsQ/N/4UEk=;
	h=From:Subject:Date:To:Cc:From;
	b=TA9SuBQLUFM7Wp4xxXxOV3HewevRcl8FhwAT8C4J7eKsq4Vp8RC1aypquVuIEgxlg
	 /zho+tFXJ2JY95/AKnGmkXVfrK9ZURN2EGyITtAydzw9I1LP/T7NOJJxcq4RXT8r1I
	 yw68bd8IgNkR2nMWvtvcCxruaa16htzZeyTtsS7Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] microblaze: KUnit support
Date: Tue, 04 Aug 2026 07:32:32 +0200
Message-Id: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ7CIBBA4as0sy4JokHiVZou+Bl0bEsbKMZIu
 LtYl9/ivQIJI2GCW1cg4osSraHh1HdgHzrckZFrBsGF5IoLNuVAO1vIxtXM+oPsqs9eaquUuTh
 o2RbR0/tYDuPfKZsn2v33gVq/cbKSl3QAAAA=
X-Change-ID: 20260802-kunit-microblaze-7a3f6ac88b4d
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785821555; l=1093;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=WfarSD1C8rtafu5OZM72A/HXtK5ytMBNpjsQ/N/4UEk=;
 b=E3EBmv4mJ5ygACrq2tmLDue2afKpWEUf1yN40Q8VmM/gryKHM82ez2/vXuajjlGR80NovyQAw
 eez8VSx7WJ7DyQnUn1wcBZ0JqoR3pWiYEW26ZH7DQnDPwjrXJ1Ot57z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add the necessary prerequisites and configuration to run KUnit on
microblaze.

Please note that various KUnit tests will fail with the default
configuration as the memmove() implementation from
arch/microblaze/lib/memmove.c seems to be broken.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      microblaze: uaccess: Zero out destination on failed get_user()
      microblaze: reset: Call POWER_OFF handlers
      microblaze: reset: Provide a power off handler through an unaligned PC
      kunit: qemu_configs: Add microblaze configuration

 arch/microblaze/Kconfig                        |  9 +++++++++
 arch/microblaze/include/asm/uaccess.h          |  3 ++-
 arch/microblaze/kernel/reset.c                 | 22 ++++++++++++++++++++++
 tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
 4 files changed, 50 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260802-kunit-microblaze-7a3f6ac88b4d

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

