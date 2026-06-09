Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D94331EB4
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781027713; cv=none; b=GcVHUcXvXpuBxbATnrnVRGKo9rUwdwnUav3VYlL6w+sZPN5CLfNOtCM8AiSvYd6t7Dfzhr6gBwoE5nbxHMZF1qrU10FNxegdxAv8qxozNL8FxeZ/DV1sUYJn0pakORb19IdPwBtT+/u1RzhGgsmHq+TjUtu8vhnjpBDmX6KJglE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781027713; c=relaxed/simple;
	bh=JB3pvYDFmiwdINt/+5BUpwv5mFWj0AJGyYHELGxa8qY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wnlfn7/B5zcpNwLKovDqrxxlWBhu9eLuV321Q8NwKRihF408b8ucFz0ZP0Vd7jzX6phk2appWaINijW8loGdfywW7Jbfx9+hRIdDJlv28kjTDwfgzaP+JAJtSZcuPzxJis2XLrsynhdK0QSYaqFEJMZJPJC2mo9wBhe907iQ8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lg71xzsb; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg71xzsb"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137dd523634so9275273c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781027711; x=1781632511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFtqMj6mfwPk1h1V5GuLjVXRoPeFZiJCWq3L0vBGFEs=;
        b=lg71xzsb62X8g7SSO5Gmvv2FDju+WQEbY0Nki6pa9gJvF7NSugcTpIx/+segG714FL
         s5aCMNaLqWARo055nnVWucGEXHAVgcPnQYar7e+yfAaInq75yevDOL6AIdYrLaiD2aJ8
         rsPNZBFHsq4bf7qklRZ2TD+/Y8x3nEfdJdrdSUQQco2EN6JNDcPXpSibmdNOE3FoX2qB
         SUpJ8ty3FRLHfQ5o5C/VPdCJoF2CrHDKlpsvejwIVChZavFLMb1gawdifctCMmLca/Wc
         nO+jw6an1qeKLvrazN4h78HAYPdfyefuD84ZeqBIZ3rM3SPUIozQRSiPiN2WKxL4PxdH
         +9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781027711; x=1781632511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFtqMj6mfwPk1h1V5GuLjVXRoPeFZiJCWq3L0vBGFEs=;
        b=j09Jns+k/Ze3zpOZ7Lpw93oqJK7eUwU7wdWDpJuh1nNYfdrpE8pzFKBIZjjcK6emqX
         nbpMgmoo8iFcaYvniHDHC408pEW5R/0cFhDFVm/dwbV5T4H24YupJ6+S4k4/p0DP+jXp
         x9OQeMN6nGNMJ4JYyzei6polpEAfg9QWIJOxlN0UXV1t6OdONOQV3QrqLmuE5XYA5JnO
         8klCgsAlzMLVDbvgFZlQlokyZ7ptDMCKsuWyzykEKYNcjhzWST9Fy1zdvLzXVTh3dLEf
         AHtVAP+X5my13YcPsdbK35YLzDiqy6CZ3h/dWvs/IjlEElF8X/jTeWxPzbmA7JL8ENid
         U1Ow==
X-Gm-Message-State: AOJu0Yz+IjhJCjymLRjoZHJunrFFR6SfN6XgbFYETzh0/AoH/RA2jcTx
	gSYRG1U79C2BViMvHdrmKkFS/P5Zj2yKpOLJ5q1x54YKDvO5+G8V8vGgGEgbhl+4
X-Gm-Gg: Acq92OFwCisl+TAn8WCa0Lf1KhLQSivYBxsHFYrAkbbdYd2Qu//PNm3eVrhFK0sOOk3
	tuXMus+lA3QEGCOu1zaILuxjbzMvdrV2ODY3PX/MM4JijU7nw9PfC0dYZGQV7pEnuuYfRvjFYgd
	bHeuENSSsaY4liwFfQfkFbaXtaMTuaUl9zr30eKwUkj+NMM2pUB911uhgg6VoG0GKAdXNIlnIFD
	yNw7Bw/YCSvNRa6Rz+OjXqap+IVD4Nd3FjHJJMd7Qn3jicuskAqD017rnLhtKjkkIh7eUiWFl5k
	tigvSjgrKp1seQEL00CS/D9QPB/IHeDW6j37Vg9PM1XIbGx+DI/TkSWiZTBlQ2SVJblnE6M0uRO
	0mboGplw2vqv1vz5ARXtAtiGkf9Ep0jesVglYkVmUbSV93IjZCfZXhfjl9ZD18XkQJM2zA7zvpt
	LSVLVa+yOYpEzxQWfO/TRHPp3ugSpd4B/q4bt9UlKwF10MaKrGwAJ0GqpohADxSbIbSqhovsstz
	sgYNk2LQs64MHvUYS04anbKEBsQr75Nr+nkVG+aVohkmXPvbo194NSrFDLRBvdg6ONjSUy/nv+d
	OgA61tHKqaHmznVWX86Bd1VsaNvP
X-Received: by 2002:a05:701b:458e:20b0:138:13e9:e66c with SMTP id a92af1059eb24-13813e9e80dmr5695557c88.6.1781027710891;
        Tue, 09 Jun 2026 10:55:10 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm11969808c88.13.2026.06.09.10.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:55:10 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Elizabeth Figura <zfigura@codeweavers.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] selftests: ntsync: correct CONFIG_NTSYNC name
Date: Tue,  9 Jun 2026 10:55:04 -0700
Message-ID: <20260609175505.19632-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The config fragment for these tests defines CONFIG_WINESYNC, which
refers to an earlier name for the ntsync driver before it was merged
[1]. Correct it to define CONFIG_NTSYNC instead.

[1] https://lore.kernel.org/all/f4cc1a38-1441-62f8-47e4-0c67f5ad1d43@codeweavers.com/

Fixes: 7f853a252cde ("selftests: ntsync: Add some tests for semaphore state.")
Cc: stable@vger.kernel.org # 6.18+
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 tools/testing/selftests/drivers/ntsync/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/ntsync/config b/tools/testing/selftests/drivers/ntsync/config
index 60539c826d06..0aa68de147af 100644
--- a/tools/testing/selftests/drivers/ntsync/config
+++ b/tools/testing/selftests/drivers/ntsync/config
@@ -1 +1 @@
-CONFIG_WINESYNC=y
+CONFIG_NTSYNC=y
-- 
2.43.0

