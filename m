Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410746D2DC;
	Mon, 21 Sep 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984453; cv=none; b=NJ/AwHFJinViWRkG2X7wlru5IAw3uDhLLiREFDbHjYEOzA46i5hGaBZU4EeJIP0iT3KB02NweT1k8XlygGOd3FDMOtw9A/DL5S3vZl+OYb/VoRSYJVzikxmsNhek/n6TEfEnmjgzbjmYoTBka1dqFvv7/BuXdruKETSNUFXzvG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984453; c=relaxed/simple;
	bh=ZqQ9OsQlu40OI7oeLvjaumExphHJKVJMBJBKRLMleoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITuTeVNknWgMA3f0Vm1mMsb3ipEU8ubzlGdSYfzi/wfWy7nhbIRxF5XmUKHqDg/XLCDxNFO+Y++1kjKjVF/LWlS+N7cLBWiBFKMnRBKe66QH/dL3kwiXY+Lag2F1XFUbC04rTO0pSHyhsZJwTNkJXQ5ldRoJFfO2L52EZFe1Om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GtFZY7kC; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GtFZY7kC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789984449;
	bh=ZqQ9OsQlu40OI7oeLvjaumExphHJKVJMBJBKRLMleoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GtFZY7kC6aW1Jat4qL/x9ZrF0qCIFc5f9KSwGyOcjTlXd/OaN4d7umPkNJkAMdWz3
	 DVVCzTta7B6ifKZP7E1Iqvc5WeTiCWIhn3Nh2Me4xXOG4KSa+xV3z1x9j73uJHrgPd
	 zt+jIY5+qFpOk1XhGXksWk9Ap8MTl1PCPUDLKtL0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 21 Sep 2026 11:54:01 +0200
Subject: [PATCH 2/3] vdso/gettimeofday: Add support for
 CLOCK_BOOTTIME_ALARM
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vdso-alarm-clocks-v1-2-617abb5271c7@weissschuh.net>
References: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
In-Reply-To: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984448; l=1549;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZqQ9OsQlu40OI7oeLvjaumExphHJKVJMBJBKRLMleoE=;
 b=EOzUsGrBDTD6hx0RJYhu6oB9t+DkM5CpYuE/hDgVJCPmK4P+JudERogYbzT515Comp+41JIVN
 yTslyS2YQIABWUusxxDLvhmpDeKxT0d+9shi4WhXQ2/VdrTHhc1cLOq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

CLOCK_BOOTTIME_ALARM behaves exactly as CLOCK_BOOTTIME as far as the
vDSO is concerned. The vDSO library can handle it automatically
correctly. Only the basetime needs to be maintained during the tick.

The namespace offset is already set correctly, although it was not
used before.

Reuse the CLOCK_BOOTTIME basetime for CLOCK_BOOTTIME_ALARM and update
the userspace hres clock mask to include CLOCK_BOOTTIME_ALARM.
---
 include/vdso/datapage.h | 1 +
 kernel/time/vsyscall.c  | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 09897f76ae07..33297b5e2521 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -35,6 +35,7 @@ struct vdso_arch_data {
 #define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
 			 BIT(CLOCK_MONOTONIC)		| \
 			 BIT(CLOCK_BOOTTIME)		| \
+			 BIT(CLOCK_BOOTTIME_ALARM)	| \
 			 BIT(CLOCK_TAI))
 #define VDSO_COARSE	(BIT(CLOCK_REALTIME_COARSE)	| \
 			 BIT(CLOCK_MONOTONIC_COARSE))
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919b8f2c..24082b9d7869 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -63,6 +63,9 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	}
 	vdso_ts->nsec	= nsec;
 
+	/* CLOCK_BOOTTIME_ALARM, copy of CLOCK_BOOTIME */
+	vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME_ALARM] = *vdso_ts;
+
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;

-- 
2.55.0

