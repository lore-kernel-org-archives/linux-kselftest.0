Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37313B8958
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309541; cv=none; b=cqTuHaf5iK+Lw5wnY2PybCVEW86neQUI1DZAxq0MRGUZYKIf14DBdeEyfLhMc58UMJb8+cRr2lSmoB0R0xybeFZEgUl6Ksmo93LCnKT48DcKcqdJjtb3mQY3ASWLdeF8as2Skg5SlcD1ZgVBKl/NBvZXivhW90kohvcW7AyNuN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309541; c=relaxed/simple;
	bh=rZoy75d1F530K2+ThODvbmPdZCic8tHOaNMPkK37BVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ntMEk7xnEqpyNey+uqA4c2/ZvMgW5IAumltaNx70WGbzpqU1g5tXv+SL3LLINobuVaLEnWS49GhO2RD1CL1iN79svwTmi1vKBNI1jI8jgxG9pYVOBs1ejfeSJrhgv8GZVlQY9Ux1ptWfN+qwUBJ5kiENaVMLPx182DebbDiiacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mV+//V+B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mV+//V+B"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49261a64cf4so3856115e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309538; x=1782914338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy3H6Mm52Vr1FVRw8xaYMztW/ew2mK+cmZQhwwKNUmw=;
        b=mV+//V+BxCtvsA8WDrD8kQNm0frliGCNwyyCYDV8hBontCw8/MfgOGQFuCVQ0SzZ0v
         CxwjOGpJaudlo/is3ejefrTocpsOJUeMmX2gEob60MBFOVvZrqaesYM4VQ0Qglv+caa3
         CneBhX5rJzNtT1AWlUqi5qH73vLpAhrdpSJftBpbm4fR4JZO0pFo5G1V1pSlGp7iREAr
         XYMSppk/b+f7lJ3FBPJor1mZ+3vyctxKtCOAXzvZuMN/Rp47/Orzg49uXLWOvDSoNyKe
         fjafct5mrzdJLLFk4wCzkLS591BcnRuXuxXtoNcHo7qudWkXewbkTbcRK1GfDIVFRbk0
         0hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309538; x=1782914338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy3H6Mm52Vr1FVRw8xaYMztW/ew2mK+cmZQhwwKNUmw=;
        b=pJloORj8VdkycC53CaBlQMJ1QUpTLj+XCbrVHK6Nr9BYrbEQvXbq2Y1/wdvUPXTsAA
         tmjTkeGIlhkMXIA+wrfLRGpcHqbVlkNDTFssbguNVdIGqG85eVhLEVQm0X1sYK1g9rtG
         5tFiBf0A1AsmODNIexL8RJiOU9vzKqWSvEtz+GYsbCcStlYrzPk4Lyugx8CdjrTsKtRS
         xAA3eVMovhgEiy86P0ARiqbaKjQQ/t5rA2d1ol3EfUfSQFy9F6MJzk/v4XthwigGVh0M
         9t3u6SEEQSEsesa5WcDqNe4buQ9AZE/RotL8rDkA74JmriCS/W8PjJzNTLc6rUSlhnVu
         kXcA==
X-Forwarded-Encrypted: i=1; AFNElJ8vuGm2WJSm9Icm0ixV2O0rUOH2ePkBRW8QOgNJ4IrzC3PmrM3xfwZgCwweWDBUFjdo7+MepVCFY603aroOPqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsxQyxR5S3K+U9GkTTz/k3rspuDpeyrXO7LVHJYp0rfGhpbo58
	aSslYImsJozkqbtK8UT/YZe645tQzrawjy7+U3+nWYMoH+dwsAjDymej
X-Gm-Gg: AfdE7cnayBPaUBd3BBSUjtuSi7p5nAY0a7H/GpOypOmPK4XIUNO/mjjGPupGau349Po
	7a/u1CsZYWHLHjhn7meHv9QmrMFaGUnAkbdYsAlutL7gWo3CZGSL0BCrYNjlf8K64XQq3LPg/at
	whG/vl8EinUx9VeN3x77Mi857HSEHP/PwIV5TtvMD5WG2Id6qeR8hpSFKX62JFZj1XonZb1Vgwf
	FUwj57UmasE14+6R4Gb/tfrNlKPMIlghEgLacd8uTs6P4/MRUpup2sKIyuSKJqAyQHjDo3yys4n
	Xo4AmWz/PvwrbP8dJ2rmYpBzpn6hebGrld7GgPnXx+/nDFIfK02JGJBhF/wfZP/+s9BWTupVNDY
	/bfF507eXj27l8cFXoB+9YgbWOjvbBBKBHGXDTjdCvrakIGdvYlfPhCozzzVjZtNBYyjN8+Dc32
	F691Mld5AMeXjd
X-Received: by 2002:a05:600c:3489:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-4926086e5edmr52079765e9.21.1782309538140;
        Wed, 24 Jun 2026 06:58:58 -0700 (PDT)
Received: from beast.lan ([2a00:c281:1461:c400:bf16:e4f3:7fa:c2dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93eesm6734311f8f.20.2026.06.24.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:58:57 -0700 (PDT)
From: Boris Shtrasman <borissh1983@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-api@vger.kernel.org,
	Boris Shtrasman <borissh1983@gmail.com>
Subject: PATCH v2 0/2] Power: supply: Add PbAc, NiZn, RAM, and ZnAr support
Date: Wed, 24 Jun 2026 16:57:16 +0300
Message-ID: <20260624135718.286771-1-borissh1983@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These series adds support for PbAc, NiZn, RAM, and ZnAr chemistries as 
defined in the Smart Battery Data Specification v1.1 (Section 5.1.30 
DeviceChemistry).

Currently, the sbs-battery driver only handles LION, LiP, NiCd and NiMH.
The Smart Battery specification defines 8 possible values:
 - Lead Acid (PbAc)
 - Lithium Ion (LION)
 - Nickel Cadmium (NiCd)
 - Nickel Metal Hydride (NiMH)
 - Nickel Zinc (NiZn)
 - Rechargeable Alkaline-Manganese (RAM)
 - Zinc Air (ZnAr)
 - Lithium Polymer (LiP)

Map the missing specification values to their respective core kernel
POWER_SUPPLY_TECHNOLOGY definitions and documenation, declare these
values into selftest. 

In selftest LiMn is moved to the next line to comply with
checkpatch warning after adding said types.

It is an update for 
https://lore.kernel.org/linux-pm/ajmc_naB7zYv0SPY@venus.

Link: https://sbs-forum.org/specs/sbdat110.pdf
Signed-off-by: Boris Shtrasman <borissh1983@gmail.com>
--
Changes in V2:

1. Seperate into two patches.
2. Modify Documenation, self test and sysfs interface. self test is
updated as the documeation is now mentioning them.
--

Boris Shtrasman (2):
  power: supply: Add PbAc, NiZn, RAM, and ZnAr support
  power: supply: sbs-battery: Add PbAc, NiZn, RAM, and ZnAr support

 Documentation/ABI/testing/sysfs-class-power               | 2 +-
 drivers/power/supply/power_supply_sysfs.c                 | 4 ++++
 drivers/power/supply/sbs-battery.c                        | 8 ++++++++
 include/linux/power_supply.h                              | 4 ++++
 .../power_supply/test_power_supply_properties.sh          | 3 ++-
 5 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.47.3

