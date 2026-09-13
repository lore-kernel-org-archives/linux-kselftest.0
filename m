Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469D3E51E2;
	Sun, 13 Sep 2026 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343431; cv=none; b=NlrvYOQChbjFHatI1YZjDIDtIYVkgD/OQc1VdjR/Jmv8UJwtCdjI1JHuKARL8LiIBZhBzOvfyHWSsmEJDi4bpiht0pY1AcldTt0FE/MF+RqSYl8JKJuGJvF+Gc8BVZuNP5lksqlwC+rMOveWkWj2+HTQTwr8uXCVyfOzCnqNS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343431; c=relaxed/simple;
	bh=47t/BnchK8lADjlejQ0oF1vY5hblA9MezhK+dtcxmUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1sVtwkIH4BsZSwLxY78ixdG7eEBuqlD+pL/woup+Mh9Gp18XlGRVmDjiHYWXBnHcp2hr4LZGoPlXQOP4MzTc6T6WYrvhkYolNpRLCS8JRsQebclWCX9T14me09EZuoB4xELxof/t3TS2m/Dm0NLoTnDDtAlK2CV/zF3a7e37EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LuUdVZ40; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LuUdVZ40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789343423;
	bh=47t/BnchK8lADjlejQ0oF1vY5hblA9MezhK+dtcxmUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LuUdVZ40b0vDKGt+UuGkWTt4d5q4m91ST5UhukOh0HCV3nR8ffqBZ3jhor6g+jTFu
	 pGXLDCkDaTyQpmfbAESOV6C7dG2FhGiGHdVYXB/zWuEaApSQUJNRHE1NoFkkMqSkBk
	 L5cERnpQ578mMJlN+vhaWUNMccyH4HwYgsQhiZFw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 14 Sep 2026 01:50:10 +0200
Subject: [PATCH v2 3/5] microblaze: reset: Call POWER_OFF handlers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-kunit-microblaze-v2-3-7d5756e858f8@weissschuh.net>
References: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
In-Reply-To: <20260914-kunit-microblaze-v2-0-7d5756e858f8@weissschuh.net>
To: Michal Simek <monstr@monstr.eu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789343420; l=776;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=47t/BnchK8lADjlejQ0oF1vY5hblA9MezhK+dtcxmUY=;
 b=tkxh/ivHiCi9L0Dn7U7gbs961EgxOmXkB7CMUHGscF5EsWy1sJgglXa7PZUogD8L7//88skEf
 6/iWki82p7+BiMS9Y/wX3o+WyADpEEASJoc+1kpsZtm0jIyT8toOszP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

System power off might be implemented through sys_off handlers.

Currently these are not respected on microblaze.

On power_off call into the generic power off function which will execute
all regustered handlers.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: David Gow <david@davidgow.net>
---
 arch/microblaze/kernel/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index 2f66c7963084..774bc1f79119 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -28,6 +28,7 @@ void machine_halt(void)
 void machine_power_off(void)
 {
 	pr_notice("Machine power off...\n");
+	do_kernel_power_off();
 	while (1)
 		;
 }

-- 
2.55.0

