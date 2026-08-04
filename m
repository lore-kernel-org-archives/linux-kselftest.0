Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9142F549F;
	Tue,  4 Aug 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821565; cv=none; b=fiPuSxzRRhW+B2migB/6d8obUxypDD6uMANLjR+r9t+WpZZn+9OHYpy3yM9CL32R3YCF/HuxSzHH7AXXX+B1l7Gyz5SbpwYoR4AuCwhoVHvMC1pickRDYMcxxoAN0qxPLuoUJrz15RPC9vmSy8UVqSoNODH32y1Ue5C750A2erY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821565; c=relaxed/simple;
	bh=qixbBq7k4YBaI4/OV+RQ152xtR4OYpge7ewoXR+VjIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ci1VAreieK7fueXOAUEQ5JrmVCZ+nsqLvJi+qd7RT4/NXfGMo3/RKI8sDanQJ/SBF7dj1p7fpsk0rEgMisbN8dhW7i+ybaX+St+70AgA9L1IVi901L0S5pKxuSLQ2iSm00aMtp99y6TBHNzll51qNJnCMXoUTT2dNctwAJEOg9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=h2HSEI1v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="h2HSEI1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785821555;
	bh=qixbBq7k4YBaI4/OV+RQ152xtR4OYpge7ewoXR+VjIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h2HSEI1vaeFg0fEBPHY7SpnXbfPg2Wg8vB9ONWGYTPmveq+M9oViBkIRDXA7B7M2A
	 iMB7SGKgENS10uIxgJKwgIubtPfXJb/Zif1j1R3zKdWzvUkrX8o479wDQ5l3f2Mcln
	 SoqAt0jWlu6wDilEOepfDY9hdVicmC0Fagf1XcLg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 04 Aug 2026 07:32:34 +0200
Subject: [PATCH 2/4] microblaze: reset: Call POWER_OFF handlers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-kunit-microblaze-v1-2-6dcdfe12eb40@weissschuh.net>
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
In-Reply-To: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785821555; l=733;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qixbBq7k4YBaI4/OV+RQ152xtR4OYpge7ewoXR+VjIs=;
 b=tynOwURVoKpTj3HfBD2gMDRsT27IwbyIcrVdn0UhC/Eo2RoUFKNOpe6bC36hi93tfwGRZ9cKi
 Yg2O5tbT2FJDb66bx8GA0uh1cCFyLQ/sQa4bwt1i72/XNyZAtUMrbLI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

System power off might be implemented through sys_off handlers.

Currently these are not respected on microblaze.

On power_off call into the generic power off function which will execute
all regustered handlers.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/microblaze/kernel/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index 2f66c7963084..3612a20ca16d 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -27,6 +27,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
+	do_kernel_power_off();
 	pr_notice("Machine power off...\n");
 	while (1)
 		;

-- 
2.55.0

