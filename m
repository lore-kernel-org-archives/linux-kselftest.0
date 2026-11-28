Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848765;
	b=5UArrrDvnbYB3R6GhHce3EjZ3njniJ5WM7wEAapvPMG+b4q8VukodlMDVTncoH1jQIBG
	 HKe9FMIhy2m3bbCfI0KBx/omH0JFPteMR26GATJucWY8jipnQB5+Lj/ktyZ6v3SsjWR1k
	 nYufLMGzWIScKDBsnwuqZKpiUcIrgfLn3d+br7Pct9p9MizkRDQUzMRaOC7uRErfo0pVW
	 ymOvxkvyml4QlFlfUhQ7m/fFVC42Ilw6yDrHP+EYGsDQjxUXhFX9VENijoG8ZJpsBOD4K
	 isUCoBSuYB2YS2pUWroNcBZCntS/5bfRw9kyX5a+LuuNZzM36kW2AnT3rF98gXydFrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
	b=EPu7rbpi6ytCImoWfTVAdHW0rppVW90z8oWRTKN/3ULe5REVUyDz73XE3QTdE/v/tY0p
	 7WG1MvhJYqkL1JZJeb3p+OIdXofjiVyFEt7z0r/yWBzIriR8nABfZeRRm3um85OZZd/sp
	 xA83phzPtns37FHDRuY0WmbcONx+yAvXi/Vb0pwROK2/QGJdYq1s632cGVPudarpGyqbT
	 2GievIkgWb+zOC8kjGQTP9xeQ4w5ybm8VSA2tiBwnmYJY+zWj6SYfnYYEh2P+vtWfjMWg
	 t5UIteNtZk9adpMexxNJ7wEcSVPg+k9OjdztStuu6+Lizw9gN0O/iVTifT5TmAgDr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469CA606A334
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 06:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469CA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wgw5NiQZ
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3976709a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 22:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848765; x=1796453565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=Wgw5NiQZUceuxOQxc2tauQLWvq3tcPn2/7gmKBB95k4EKFQTfCBOp/nCTx0SEi8fRu
         3Mkjrtzh24NiMd4aY4SLUqQPntrXmnV4ZaY+X+i5MG2oBaThN1sBnKhDdZY2Ef8N90Pc
         lc8gsJ7BWjFz9YL5DZMcNXAG2H69eJW5gCcSSsRV3sx6B2WLe0+widcEZMjcI45zD12H
         ox8htxy2pnkKedOX38tft8B0I8YiR3svHqOA+qS4mbbf3tEdCSC1B0sfLzlJSxH5uyWa
         DpsI3tRY02tBmmwDeXpiiJLURqAxV8vx/M3KHSEHXJ0ORNbOeDnQmK4z8V47e1vU/18Y
         sewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848765; x=1796453565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTcZKKzHAeS7Mwx/kr7PKAioen5WcsycTXqL7tdd7kk=;
        b=iCt2ISA1ozQGScUWAuTiWPK/RZiYFO62CBLez0X9J3i4QTRK6c3AZLF8aXjnoJsKhD
         JqNza8fza0nEr183zAZ4Ep/hS7bZ9fmNiISa0+Z8o4iS6sgNGMqD1GRuWjduleZdN5/H
         +mcQeEk9aXnvQAsCCAShZC4ySTvcBt9WLcpNDvWBtL2JmtEE1cmIiwkpNbnZ0ZX6FMxJ
         n/E/06ebsLiY2UhBWrTf7GUD8Jt3OWMvyClWe+U5D9A5WawAPjgqvo73f7SVsK6ivW7c
         OMt3g9a9vYvJAx6I5FVz5iOrZOE/4f/0yvOEcHq2AiqiT82DUIlFp/vQKz9s0oj3erT0
         jdXg==
X-Forwarded-Encrypted: i=1; AL+hErGLqzwr8QfQKiCFRZQ8BEqD5owbgjrk7VcFzuker/2JbtjUt4W1k2+lPSrFTmqqhXz/mdFnqV7FeUiBVcP2WbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UcYFg1LsWlIW97/ajOozDe5zFlWIS3qNew4t32IKHEBWl/Mij
	cQn+JSO9E+pYvDPNgdYiYjCanP4I8QCEiApjnQ7M4HSth65gJrjQ3etJ
X-Gm-Gg: AZFdTZcwpMgpxkRzLZs0k04J+8JCkX+JqLqR1MHl2aPbVHKtV70HGfMwcELFiedbfeD
	X67Xc5GCbTHwffwxUgjrgE04MiYz8krQ2X3wHT6ToetV+rNSt8Dlmudgr43fYjOPsvD6yMd1YKz
	6UfZ4I/+HjxJqwpJk1zKItqQSDk4ayuWNxTV9zpTVOxzaHUo8PpMxBB+FHdLCz/uE1I8cOzRgEh
	PUoHt9r7FW0iJW85XWuJlNFxkKWUePa5kDMF7B+VjrX4bmxbU357piEvZHE/WhtbeEDi+Wduf1c
	JIY9ajpWopgFeBW6PTWpKUeDkkoCZLveITFpfONFUpQVHBbmxuw58eE9YYBlGeCSg1SlJ4uvmnN
	PkkCELOUCAn67gPIW+B8LHAKZzWJsQcG9CZo+C7113NNmjcgtxuclg82BCmyGDB4BB1GAP9mWUn
	mg/3I8pe3XPKsllaVX61uU+q9DawadbAXIkTGHJl6cWNAL2KIE8bx19mGi+4Qc9nH4D7/Yp1RFH
	Xpo9PaptKpfIasdgH+0hvgvqKbdve53AuB0GSRjAUN79FUgL0HedMDfxRg/esMiLC0jjK133e8Y
	0cKxtAqXh+R/ha92FFlV2TQnqwHrk1Teg3/HqmOsmqt1UkBiCtUL9eJCPtxWsfjHCcX7BMAekMh
	DzxqQMO3+fqexGGSTyD1QtyyY1dmDt0RPGm8IEKq40XJp+agcxk0xzAw6AUKGDw==
X-Received: by 2002:a17:90b:268f:b0:3b3:a421:7e00 with SMTP id 98e67ed59e1d1-3b41c8d4831mr25103895a91.16.1795848764542;
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Sat, 28 Nov 2026 15:52:27 +0900
Message-ID: <20261128065228.3628550-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

test-pcmtest-driver skips when the pcmtest debugfs files are missing.
The driver has no device to bind to, so nothing loads the module, and the
test skips even on a kernel that builds it.

Run modprobe once before skipping, as the net pktgen test does. Each test
runs in a child process, so record whether the module was loaded before
the tests start, and unload it at exit if the tests loaded it.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
A built-in pcmtest creates its debugfs files at boot, so read_patterns()
succeeds and modprobe is not run. If debugfs is not mounted, modprobe of
a built-in module returns 0, the second read fails, and the test skips as
before.

 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..3bd6f75ac6f6 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -6,6 +6,7 @@
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
@@ -149,6 +150,22 @@ static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
 	return 0;
 }
 
+static bool module_was_loaded;
+
+/* remember whether snd-pcmtest was loaded before the tests ran */
+static void __attribute__((constructor)) check_module(void)
+{
+	module_was_loaded = !access("/sys/module/snd_pcmtest", F_OK);
+}
+
+/* each test runs in a child, so unload in the parent once all are done */
+static void __attribute__((destructor)) unload_module(void)
+{
+	if (!module_was_loaded && !access("/sys/module/snd_pcmtest", F_OK) &&
+	    system("modprobe -r -q snd-pcmtest"))
+		ksft_print_msg("Failed to unload snd-pcmtest\n");
+}
+
 FIXTURE(pcmtest) {
 	int card;
 	snd_pcm_sw_params_t *swparams;
@@ -171,6 +188,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

