Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E619E3E9F8D
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863912; cv=none; b=TsAly25pUvR1+O+4Tx9HiZtnS75a292LDRAeN5G/cQbvySQhypHDK5zr8zaRtJeQWo76LVNb5zQE8hYzgNs2L9/1hwbx26Q6MZo/IqOSegptLJXc7neuXEhB4/kdx3e6eLYIpZL7SR+t2lX6boc2DlAHubgW4SbWHoKFd1pxzmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863912; c=relaxed/simple;
	bh=5jbenMADlAqpYBWMxC7pJFvrPh4M8+gsA67VPoS2ODw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afkqcGUahyPHwd5UfEkc2876cO+V0EtcOT+RbuNLIgxRO5lsdoGq4URop5DM0+6ZJYaADxHMoMHJE/8SDwLXhyJH+lLnQ/7OYvDFq6G6NBwLQuE35+HkZlBbtA62d3zzKYFWd2zih6a9JxRYCgSRqQ/VItTXdGvivekmFFKaDNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+p42hpF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+p42hpF"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so5375679e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776863909; x=1777468709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zLC7MnuJc3YojYoySVhz+I76pvi3WrY2XKk1rhbujU=;
        b=N+p42hpFZtU/NXQ0gf+vNq/y+aPnx5Af45IQg8ZN/6MACHXOtkYYBCK/nqQTDumjEK
         OBcx4ykPrCQWyBXx/8tpaLPQTGxf4sRwBTVB4Jr/fexwJwTYgSSrnLKSV0WZdeEMco1l
         RQNLSrtUCgooWTvx+GNCcFpphb1960ViD8/WiqZOmNwrPLZmrNU/VUK6e/GZmxlZcEcS
         unOHTFLhAzkU67CmZJMJiLfn2FUyrpXW6kU8aDYj9tGWvaDxjLFfd5DZ8Q4Nh09sgSH4
         DUTzlsO8ylpSG+LE/YEvFs5AB3km+2TZGrZW9uW8fZBSAP0rDvkLYXKilyF07Qo0lFRh
         0yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863909; x=1777468709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zLC7MnuJc3YojYoySVhz+I76pvi3WrY2XKk1rhbujU=;
        b=sszObTGU+8787HToyRfRessh53qB4iK3mDy14T2awYHYMqYwGpbWKBTK96OXbS8gI7
         zlILstTngpmr9W/ZYRpd/D4gqXHG7Yy1sWB9j/RxjRqRp0z2CppDC4xbysVqAMYT2RZJ
         CBfLl6YU6trE1vLL/UwPwlwC5nN494PsXnacZnPMElEGyFUqckMGaVJZwxO8GRXNBBKi
         rosdy0IheF3SodGhhBn6rX6BBC5CKYkkdjDMEQiXy40sUOCe4j2i5ZlX8EQJgonkzKsR
         5VPHavdpxFD08TB9z9EGMM7JaFcWT08VNMXYhcI78z7Wi/Y/KU650AO5JHUJONA/W3fq
         qQgw==
X-Forwarded-Encrypted: i=1; AFNElJ982dAoofNOrL5Nrshe6mRoSxmAySmQfdxznJ+bif8YuDdMy7aLzWGVE1r5lYGgodidlRkko/Yt212dDIR1ihU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCNXLsGrbR9kRlwsvukOeiWOvjfezzTHxG+CiVDg2ODgKU5+Y
	opatWUuuzgP4ZuJVdGE6cEEurt8P+7EasKjnwzW2Jp1dnO3DgRNg127S
X-Gm-Gg: AeBDieupGr47XRWPJcRZi1tMx5GXJ8Bm3BdR4+y7Dlzx4wlX9NllhOh7NcaNIpCirqD
	Dlh+Cl5hWj0RQZ9gpUtCZQKyO3aJ8GDks9gMGS8WbfU0VKJ/S/7fwCI5XxJqBDlzBcSXRNXQfMG
	75kVHPPQixXQDZzdBjlg+GsA7z0kMdsipwvzsyT3YjZytCwTERqJprcx2LjSdpBD9tGvrDnmH43
	pZSQ5dttYQ8WNO+PRKHwjynr25UCot0VFpYmbSSZNPuQnQBRRUdgRBj9m0uGalongmfgbWNqdCP
	nIXA168pFD0c+KHGcsfssUwJmBuQt1XIo2NNqeT+jRxZ76HBozI9/9eprwlqt5mNtauN9vAX66s
	DK/iToVqO4Y3ZiF5uBCEIgbYWdblRnxOJ0SXYlfPqXIzIZOzdPfu9so92QU5de+sTsE8rTkpWVf
	NxQ00D+Y4daDPAWNPVmQaWfGX+cheh2umarPrPuHxPU7Qwk1Le+A/aEVRY4tcGkUX3cQNYf1HFU
	aEwkRYVzg==
X-Received: by 2002:a05:6512:2243:b0:5a3:fd47:aae6 with SMTP id 2adb3069b0e04-5a4172e2794mr7865623e87.32.1776863908248;
        Wed, 22 Apr 2026 06:18:28 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a418376d0asm4447656e87.0.2026.04.22.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:18:27 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: netfilter-devel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Vastargazing <vebohr@email.com>
Subject: [PATCH 0/1] selftests: netfilter: add regression test for nft_ct timeout UAF
Date: Wed, 22 Apr 2026 16:18:17 +0300
Message-ID: <20260422131818.106417-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vastargazing <vebohr@email.com>

Commit f8dca15a1b19 ("netfilter: nft_ct: fix use-after-free in timeout
object destroy") fixed a slab-use-after-free but no regression test was
added. This patch adds one to tools/testing/selftests/net/netfilter/.

Vastargazing (1):
  selftests: netfilter: add nft_ct timeout destroy race test

 .../testing/selftests/net/netfilter/Makefile  |   1 +
 .../netfilter/nft_ct_timeout_concurrency.sh   | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 tools/testing/selftests/net/netfilter/nft_ct_timeout_concurrency.sh

-- 
2.51.0

