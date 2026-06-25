Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FB37B030
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403659; cv=none; b=Rvez6/EkNy14igFu3XHLxl55c5yyG5Z1VHsy3PPAu2RDWCmLq4pXkXrLF4uHtLl3hj8UYFLQk+Hld0IH5U7mhtkRgNTXri5ZCQYU+0UCJK27MfxjHDi6dGOXmfFLPfDMk55vaNKmI3MabXOjnCVnNQiMhRhiXl+q7ZwN3fJM4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403659; c=relaxed/simple;
	bh=Dr5pVOCfCtLgESp7BZBpALP9oXjjL95wrkaWuiXd0G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiaW3Uuzzq6UUCVAroYl4FY67WIKlFSmyofoJT9hXfqZLHsWQaxYIo6/QMT15hY/1U1vRF+duOxCGIX/L4nEYVdylSkwfwQhrBtd18mF2OMJbYY6e3bJzVG117Qu1PhuH0hed9QuWT4Y78ykrz6ib2+bJAEVC59DcT10qcFiMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9aKWmDP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9aKWmDP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso131275e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403656; x=1783008456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyxSXNZjt2zGM3OkK+9ft4Li7aIHJEaVpQSWnGw8toA=;
        b=B9aKWmDP4ufkcuDf3xFQHfVMt9H3ehrLiut7snjULzTw/snenis+a/C6Lf2eup7T/P
         YGnYANOgf4Xk/c7p7nPHUT+HiUr7BzXcLj3en7p9U6oZNGrk/Kl3TSQtD30/Q64baOh9
         qCyiPUTS8jj266ee5uAjpQM7WOERLWmEsKTKieZSev7tPITMD995tAGJ18sGmLXzxkaw
         IdozAbcz0hH07k+4WvFqtSdJaJUuqGrJGyG12A5igS0aqX5aWK/o/Gjzn5QkwqNY8YJR
         IKmxEnsWaE4Xf1Mwm9hEZgnbMlmP6vj5Z5SBWuRNwj7h1x3uXHJMcWbP9vTFBEbL1Rvz
         feqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403656; x=1783008456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyxSXNZjt2zGM3OkK+9ft4Li7aIHJEaVpQSWnGw8toA=;
        b=PV9elx6T4RhDLLMn7NvnMTlEd0e3CphidFPRiqBCCaN8fyFBMuGSm0rwmOO6l+X4R8
         t6TNO/yVgTHcHXXAfcR6D5Il40Nx6Nrb+N6N6UvBGHzlK30wMXT6ctmTIcAOiRweUwv6
         oUCjZaZqWk9m4KxlIw1ovYV/RSXsPWjfQ3AmWz/8YTDrRRIpHcjJI4FWfJbTmNmQrJpp
         pg8HojpjDOiwfu+06bV5b7aDdYSd4UDX9gNezKfnxJ4Ly8AL9ESMf81+S526ENcNI6/O
         Zg7/bfdpzLXyijSNUbqkL9mjZhDIWllLN8Z9HWzv7Vusf+TFxJTFJCc2BbNcOeTCizfP
         j23A==
X-Forwarded-Encrypted: i=1; AFNElJ9wgcBzHdcddKKgJryrP20qSHj8wbedl1eH2ZI8NYVMrao8IuHPsNgObZJU14oOUbCfZ1VaqdpRQV7wlwHx3dI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzepG7KZ/BRO77cNjBSmmT3yf496QTzh5mePGOyix3Hbpwbb68B
	gSRTSA+HOSOVa7+idKsXMkuKxjcBxRldld7BlFl3Eg77y5LAUVJeMOQX2KwRrkZ5ZR6cJw==
X-Gm-Gg: AfdE7clHx+plx0qdJLvT1BOBnZ/7OvFdZGlsMKNuNxYgUuWzxIMiTKG/x4XCsM1pXv7
	4JXjHLOvf4oyafrjnRbdbL6Q4l86SBpPNvarc1CvSawNg4Q45NhmGky57hZ4DidmmIxg0DaqqMe
	+Mri6WKUEE/ZLf8EKmKZ/kNuujKinMbYLJVMsCWGTokjqZwwm8P5HiIXsEP22CBOolkQGU+kEpI
	Kzz5roLvsdGtFeBs9JyXskbI6kuO+ahFrqdN/xqlXGkhK3mmkZZ79wvQ9p9DB18qWKZ8pMSLtjg
	VK38mNLw8NFe+9OhWXOiuGwqLXYlnxXkfbboyvzw2BnB4Ieo2bWec7Mt91pLA2Q7VWJ24USC/1N
	zPuftizH0BtQmHJzpPiZRgAOnn3sRTwUYotHLBIq7KsKuvxQMw8hIk6ECWRVdLxdJA625ZiTzBY
	OGwNwaiF2wU9TP
X-Received: by 2002:a05:600c:5296:b0:492:4a56:68fa with SMTP id 5b1f17b1804b1-4926688583amr44277695e9.24.1782403655390;
        Thu, 25 Jun 2026 09:07:35 -0700 (PDT)
Received: from beast.lan ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fef710sm12844515e9.7.2026.06.25.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:07:34 -0700 (PDT)
From: Boris Shtrasman <borissh1983@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Shtrasman <borissh1983@gmail.com>
Subject: [PATCH v2 0/2] selftests: helpers: handle multi line in test_sysfs_prop_optional_list
Date: Thu, 25 Jun 2026 19:05:53 +0300
Message-ID: <20260625160556.54830-1-borissh1983@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify test_sysfs_prop_optional_list to allow multi line parameters, in
order to comply with checkpatch output that limit line by 100 chars.

Allow use cases like:
       test_sysfs_prop_optional_list \
               usb_type "Unknown","SDP","DCP","CDP","ACA","C","PD"\
                       ,"PD_DRP","PD_PPS","BrickID", "PD_SPR_AVS" \
                       ,"PD_PPS_SPR_AVS"

--
Changes in v2:
- correctped typo IFS vs $IFS.
- Added the patch to treat usb_types

--

Boris Shtrasman (2):
  selftests: helpers: handle multi line in test_sysfs_prop_optional_list
  selftests: test possible usb type values from documentation

 tools/testing/selftests/power_supply/helpers.sh           | 8 ++++----
 .../power_supply/test_power_supply_properties.sh          | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.47.3

