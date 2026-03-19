Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8223E7169
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934745; cv=none; b=p6MsoiK7p0Pv8v5eZ1StqVWL9N1e6lPJo7UbFAztm5m8kHNcE57DUHBJNYNuzxBcNzObji3VmHWg1euPI94+nN3N2w1YmENVBo/F8zYmkzVhajrsBO1kqOv20kLxCl5mHv69XdzaY7+KPXVKvNUf1D3f64k64LT4YGKAj5CCY5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934745; c=relaxed/simple;
	bh=BducJre5dIvWUwqIuXg2VZYe2Xl4IFaR4KGdZYCz85Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=C1i1lHpDxXIGt9VeR2IdnwdqMfz99B75L98hKirhnF7IWjpPAvJGx4OMtAxSpI9+eOzoIMaWQporC/wMiWOd6ZOqk36fENa8nM+Ydmkf1HHj8PmjhhFKHV8iO6rjte7sCjLa2ogIoEixgLZLA2dt0lkfy6Fq93ZNaow1iP6tVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ElpFaWiv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElpFaWiv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a27a7f711eso916641e87.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773934740; x=1774539540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bCGX/ouIFX/0r7IDQvkvFcVLJ3SRfiz7ptJfb2y+lc=;
        b=ElpFaWiveGbwlSCq9lWl5GgNDWEgnAOcaSHcVYDurQbB0M2Tme4LxBopjR7SO3TKpS
         buYjMEsl3E1nQeEmbtrF0Umw1MbtvMx4L0/oqr1JC+V08FicyYiHZTPb0DCH9ZekfYEX
         WCH9O8LssRuUuvCjiSynhDalrji5n52rAAiyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934740; x=1774539540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bCGX/ouIFX/0r7IDQvkvFcVLJ3SRfiz7ptJfb2y+lc=;
        b=VYXYSrZ/qegkroI13ipB7+M0+dOWHlDkYFG9ZNEyif8pjXhbfxSsGxDN5UXa4pLqcf
         bdfLFLaoobIrUWhBb/0uN90ZRdS9csgoR37WuFs0OfNveCH43ZeJkFsOu1hUKtSgyFEO
         e/dJfrB57e4Xk7m9egsXhLcTo7DrGhEx9d3bMHjCskKzDAo7Hjq9oHzxA9d0b75dMJYf
         fu2L1W1tqh7hVTaQNXyIFDKGSUOmal6/Y4yS5FDNRHenLcH8ZxBWzkt5PNDzUTKgaBC+
         ppBA/IrqxjE7XxSIns11T5ZfW1XibpA1yqaqyx6nAeKRAJeyyi70mUKUIsc0X2uGXZ+f
         Xd2A==
X-Forwarded-Encrypted: i=1; AJvYcCWhmIQSTXXy2NxF/0iHXrDF9GYez89vSs1Xfgwk2gqAPcZ6+6Nx88sjEeiW1zFhi5+tjmf+PatbXD6WsAL0fh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrsICnlsZACP7Wg8Un49xmZ51WHQx0ax2xnEmnPLcricCofM+3
	op5x4RQrlKe9GRsVLJD8GrrgAY0ZyKFs8tYypnBAll96321x8MQTl3ZSJ7XjOS1GYg==
X-Gm-Gg: ATEYQzx11cgY6qHD+QgkyYcZr0kRXh1Envt2kgQ38II88xtO/KJa4rfncUBnkpCwaFC
	19avcNqBI2DJPENX0WOzXcixP+I1VPKCw0CBhPWQaU/zmWIUWVILosE7SAMXks7nJgd+SAWTlgy
	Y4uytcZqXj5NCdF8cP9wxyk82XoHvILvdupOJoGJYAcU+YBXDrDItdoPrRuZDn1oubQ5PVNCDmI
	PpOn5Jtn5/slpoV14PNRVaSvO9+Ci8JhdMFvkSAwhGukKjoyhpXNmsfo/IKBGvG9qDduddcLpaC
	xE5Wzpn2YhNisHws5xFOywXEES5NLAjzSR/Lx67xsXR22w5GDicsyVTZkRF4uZ6wsnG3EznlY+i
	G5imRhV9/iFh5vFdOO5N95VHZrH726oX0K/vIzp3c4FXyXwIde8JColp4vc29S+JeyK6H2jiKps
	zaKvfB8oTYBF7NFL/bcb/ZYBXRtjJTkQas51Z+TMrXbVc=
X-Received: by 2002:a19:c207:0:b0:5a1:d0d:1ba9 with SMTP id 2adb3069b0e04-5a27959cde1mr2020086e87.7.1773934740184;
        Thu, 19 Mar 2026 08:39:00 -0700 (PDT)
Received: from dmaluka1.corp.google.com ([2a00:79e1:abd:1300:d347:f02a:266b:b67])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c3025bsm1253728e87.34.2026.03.19.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:38:59 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Shuah Khan <shuah@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Dmytro Maluka <dmaluka@chromium.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] selftests/cpu-hotplug: Fix check for cpu hotplug not supported
Date: Thu, 19 Mar 2026 16:38:12 +0100
Message-ID: <20260319153825.2813576-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_HOTPLUG_CPU is disabled, /sys/devices/system/cpu/cpu*
directories are still populated, so the test fails to correctly detect
that CPU hotplug is not supported.

Fix this by checking for the presence of 'online' files in those
directories instead. The 'online' node is created for the given CPU if
and only if this CPU supports hotplug. So if none of the CPUs have
'online' nodes, it means CPU hotplug is not supported.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 6232a46ca6e1..287cfd5809f6 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -24,7 +24,7 @@ prerequisite()
 		exit $ksft_skip
 	fi
 
-	if ! ls $SYSFS/devices/system/cpu/cpu* > /dev/null 2>&1; then
+	if ! ls $SYSFS/devices/system/cpu/cpu*/online > /dev/null 2>&1; then
 		echo $msg cpu hotplug is not supported >&2
 		exit $ksft_skip
 	fi
-- 
2.53.0.851.ga537e3e6e9-goog

