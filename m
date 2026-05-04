Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0618314D06
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927527; cv=none; b=AwVsZqPPM2CnsNue9WwvTSUNhpSiolb2aU0n91LU50sPnsQMjUpB9h3ecKmhhQjtME40WOl2MBeflSkscBUpEK1RDXzfFYAKSb7a+nCQ8NIIZZsxHZrjBoBB8Bd+qB2HY4CCFLXW4De8Resgkjy2MqCjpNr1PjRpJUpJNk9NNSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927527; c=relaxed/simple;
	bh=oj/Ot2bWBTE+4nkkrZtF2E5fiS0cgL9bGDg3h5lqHLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0KtqH1ZpnLuvbuYV4ZK47aEZgvOHnfVEGldb43ksMuMr8J7I6cgGu0MyMoDXQAnep8jA/g+4qgsRXf0wp1hL0MrGA8J5DjoXX14T6i8N773qFjKAjypuRtsvbG1b+GxlROwq6RWUJPpCGAEdBirIFmWpqST7UDiZJZlUrH/Eug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dqez2XUF; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dqez2XUF"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de4e6c5a30so4023766a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927524; x=1778532324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTL39RgoHy7Hy10nIALTSWo+06ICA733pPcAGxt5zbo=;
        b=Dqez2XUFHos39M4H/wZlFrOECHG43VBb0ChLHNdE3Bb9P6EZbANxzyDVVmTx2VYTgb
         0BdAHEIZz7dMbcxItPUcjW4mY/Pmm9wdZHxMbhwFmtAUXbyPOfWmz5aUsmobF02FngNu
         mGif2ZbbBL3+kYw67waDghJLU0ngt5eHCCivsp0XC/Fl4fgnVCyw7PyRrIftyXvCW2EV
         qE6Scicg22Dxkis/36Lwa78fY4bQ+FVgR3dxgxWH2+cVMNmoOyMoj2doaG7x8in//11Y
         piDSI2Kqt3BkzGgiODYekFlfPr/A5yKZLhM0lnhyeHgNIzBpNNddYsmDg3kpLY2iM9Wf
         1HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927524; x=1778532324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTL39RgoHy7Hy10nIALTSWo+06ICA733pPcAGxt5zbo=;
        b=LbkqJil1rVpmWqOgdEeIPEvAYF2kUqIMc1PQ302YyW/g+cCk/YXa1kfZyKTTmCulGc
         5ji53i7V/Ey9OVgN3/pL3YZzJee1qa/fxyGzkWxENyhUhoYFQ7AqWaerNcTZ5EmoN0vd
         XAu1fqS8reEyUxASxL/k8sBJDXEMSlfvDRHgAPi4XTr40E7v9qzBt+GHtGGkdyGQSSVA
         sqQB80o5kIBABWPVvQrPJkkkQ/BzvC+iumya3wC2F8tO/v6Bn956XwF+78JU7iq+wbyb
         hvhok/OOpV5W1T8LF1gj6DoLtO7SAkjXq4necMiPrr/SAG5dH86RPPtJluwH5TJfLb2E
         5ltw==
X-Forwarded-Encrypted: i=1; AFNElJ85Q2y6Md8GV8c5RtxL6ubOU57laRnpdwh2Rk4q11oXU/YuXW5cxEeMeFM4NzMIOrBtizMZ3KKcNp6GkrIlX68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqNOJq1UQCAj0eOYkSqdCjQ5cqntZdv1/62psXVeTkww0WgSx
	Gpq61N7xAx7bi0s/l8+FsztCFa5X/JQIiK0w3o8SPFbd6aM6uWR03WVJ
X-Gm-Gg: AeBDieuYMKxRcQETWj5mPBMFPhHqEB8uyMHQYdMlBNoKZ5tb9p710xCULZ8vyR7IT8R
	AT26co4DrsGMgplIIvk5PuL3Vyn+7pztEYE0M6w5HRQSRg3b9mOl8cQbrs8Ntgb0pxlL0r2EK1u
	FHX/EUQJ77tUFBE4BUOZFqjzdVaaEwPrKzOQAilBmhQwOaq7djoe3TnbqbCmnr1eH+1MZDaldMN
	Dy3DG/J586ysnFmVv/zC/29tmIPFt1CqV429uZ8X6CGTTrAlra9FWNHKOGw+4Rj79ftVTcvDQnm
	fiMSSclptvj3tU2vT3LTqmIB9g0FRya3aaMe7oSng+GB/FlQ8hLSGIv900db0vruYV0s9br2Jtl
	0oJQlYxwZfFFDXiHDAb/kep9em9DL5qfjgmyXONJ1w1CTOg1duAn3Dh+2apDqNoGemryYeowLTQ
	/7F+KLsUrPoTziKaYO+IvbNglOH5gxV4uVwDldDZEyKeVdD53lFdczk3klIUGmMAmRb0km7P2j
X-Received: by 2002:a05:6820:4b13:b0:696:8c3f:d7cd with SMTP id 006d021491bc7-696979bbc12mr5833412eaf.4.1777927523995;
        Mon, 04 May 2026 13:45:23 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:12 -0600
Subject: [PATCH 06/17] dyndbg: tweak pr_fmt to avoid expansion conflicts
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-6-6fdd24040642@gmail.com>
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
In-Reply-To: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=739;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=oj/Ot2bWBTE+4nkkrZtF2E5fiS0cgL9bGDg3h5lqHLg=;
 b=OM/4itX0syjUVS+fzKdiSWH5WDfAynGpozVyS+iUO+rug/4fBDTiHSJONmNbHs2rEntZDeBBi
 16N/2nOT4oLCKdrsuLPYJPW3g7dWdWvjJR+bRt5uUKpMxX8X5ciDIVh
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ffa1cf7c2c72..9575b92a8deb 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>

-- 
2.54.0

