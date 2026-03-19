Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54523AC0E5
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909900; cv=none; b=eGY6oKbd+lpjoDQ7SxdJAcG2jnUiwjGUh7Sy+g8g5SPfE/N3k6CBx+KP5I+9bUa5xRdZTc9A7D/OhzRIz8VysAH4H4vzAQgmDwpRtTK97AY8xBoGY18C2uUOJDiF+tjdQiFwSGPsk4JJ1u+fsnxwp5aUXnqVU1EhwDlB77I57M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909900; c=relaxed/simple;
	bh=gxLBEZqdXaKc856agQwhtmyN5sTi6Yx6xfnEKXHzg5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVT4mv3L0kJDvELrfxbwHvg+EPyTcBT/Mk5ozTlNmYFbseikpciY5aoPNLmQ+a/tIWoJJ5yTiAPrUDUpDv38DGU8GqxAx+lzVVogqpGMzVXnQwsH/VTIjhj72Xfy6DYDkPxkWCe7D7dCXHLahWD1xCtzSZunz8yvaKFMjk+YoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2FOyMnD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2FOyMnD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so7070505e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773909897; x=1774514697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSYKzBrwIsqKKLO2G7NMhCI1+z9REObNSxdVlwMMyGA=;
        b=w2FOyMnDG3jt0mHYKcsIGpcWDzwqIk8cCyDCGfF2jW22hKmUmQi5H43iJSRlCLG/Kq
         bdZH+h6pXlQ+h8o4RGgzR4jYiEP2utIxreuyoF1ZwbxA8CuEL/h+Xo5MA0lT1miqn1qu
         iw9ck1ifE78vwCE4wE5FYSyQEXcwwYXXi3FrBzq9gtPGk6ZkqaHHuqPVKKKB8Yhjaykk
         T9EpN3ZjZWWk9hfoe+LR9UIhiDQOgWmotsndYAXdruiH8yvpgQfZLQ6WFbZx4F+hekCc
         B6DYQCy+pwJyjRmtZ16nvTCZxjhX6Akt5yb4dfnmKAmB8Aw7oceIhJYImh12spHzlxS1
         nZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773909897; x=1774514697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSYKzBrwIsqKKLO2G7NMhCI1+z9REObNSxdVlwMMyGA=;
        b=CU6K9/AukJasIlOFwy3Xk9hllWItT5AMcLGm+eVDWE1v9QQSwcWAqUnKbw85tVG/14
         ySNDjRHqmWUbjX5oiCqfJRVp0Hx8qo/kImF8hqNw8Q1WNR23cedlKe3MA0L2BwALOoos
         7aLqTnE3n4R8lzRyj8GGjbahySHxMB7s5n6T5/RGDJaiom3JrAZKAKx7qs99en+JLB84
         ef9oNpPVlR1igGe+NNqdvyue2qIx1kPBAE3iXJBd0TkEtSroqIYgLz9rTAVJ66QTP+r3
         kgvcnvuC3FIy71JqpgGPxT4tyurczU+RZipE3S4TXiIfmEzY6VLqGV2KNRDpI/d5Ruzs
         WyJA==
X-Forwarded-Encrypted: i=1; AJvYcCXU/IvjJ15DXEtuMJi8tzXnw0kG10SId9hIfv1kF6rJjCANI6o7mE6UojWgc6x2br0LWv3pl1xoHD7eqbXmkwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy81s6a9fWyRLzAsF6Vio+UQuXXDrQMQuZyMBB6wZrkuF/mYnKq
	962xtyxJ1XR+hPq6zoevo8zmm9KxmKtyfjOdIkYWssoCm8LoeHbk0cIl1sfwyIQk2Q==
X-Gm-Gg: ATEYQzzmqdwF+xT+i0BcoOBdsQw5bqSLnR/fSYl7U4cuiDpMn1j0VFL/CpjryxuMETN
	YTi6PqjBBli/pQyAEv4XGP/Lq3Zte1n04jPIQ7pddHpVGtiiqOA0i/7vPA2uX9G4mIOjeu9R/BJ
	jpFs91O8d05hkDOfKLgB0hPSCgxAXh1lsuHjxZg30Oxme8gNpNglpkH/7kVRk+jvFHZ8vXJIuDe
	959afRsQvuq7ncaUf+s6caXTRKClRMARKPcPZlzIEhShEe1E+6tjRwQMgqLB8cASaYU53fkpzE+
	OOl/CR9HPBZuVK+jPxZCOrRtmGX1KaOofBsJD83cgRvS/BqMhtYuyTEF/xyLvIT29KxKN80WjGW
	F1574J3Xjm+0QpJyi7wIsZ+39F+Jx22AI88eWHwR6FtqKPy7J/pIC0tVUHGzUqnckzJ3LVfaA4F
	sSKJbk8ylHJIQLg997MwkDPJJ6lGISSHII+O9zklZJgALCH8fDYBBRpPn8YUDAa6CSXQWgG0Q8P
	+wkJOqfdXxis5LRcnSN/3c=
X-Received: by 2002:a05:600c:630f:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-486f44384c9mr112835575e9.12.1773909897008;
        Thu, 19 Mar 2026 01:44:57 -0700 (PDT)
Received: from pickles.copeland.me.uk ([149.40.2.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm12899015e9.14.2026.03.19.01.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:44:56 -0700 (PDT)
From: Ben Copeland <ben.copeland@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Copeland <ben.copeland@linaro.org>
Subject: [PATCH] selftests: alsa: add config for required kernel options
Date: Thu, 19 Mar 2026 08:43:47 +0000
Message-ID: <20260319084347.134744-1-ben.copeland@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alsa kselftests are missing a config file to declare their required
kernel configuration options. This causes the utimer-test (timer_f.utimer)
to fail on kernels without CONFIG_SND_UTIMER enabled, as the
SNDRV_TIMER_IOCTL_CREATE ioctl returns -1.

Add the config file with the necessary sound configs so that
'make kselftest-merge' can enable them automatically.

Link: https://lore.kernel.org/linux-kselftest/0e9c25d3-efbd-433b-9fb1-0923010101b9@stanley.mountain/
Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
---
 tools/testing/selftests/alsa/config | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..810cc31f09b3
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,7 @@
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+CONFIG_SND_PCM_TIMER=y
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_UTIMER=y
+CONFIG_DEBUG_FS=y
-- 
2.53.0

