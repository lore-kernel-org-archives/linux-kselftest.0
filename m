Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F5B357D02
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341880; cv=none; b=OlIP7KpAzLC01TXMG2eorNHcS8PzS2ROMwxxvtoZxThwrdAD/gEXlwoN8SkQ2wd2Mt1m5oC7jHbhso9iVjI9eLG+am5PJxjFbLWRci7wHxzbSR7h//XlvUxHSQ37ik0sOpWYGvx97wX8jU54t51i92egIV9a9qHv66sHmZAFcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341880; c=relaxed/simple;
	bh=vAdRkEFKDae2aMLrGZaTH2BMgHDgL57AkeWweCLFki4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NDkVTuS3c+iKuBRrOFbbAV9/l06EXBmA6sgywR3R7XTPZ8q5P1DLFUfY3NAlDY8+xePv7haWbGLCOOJProshf50LVW5yCpy+PBusDJA6NmXW0DakWFfwiA5tbvnaMcqYkCHluf8b2a2hRqz/zJWFNhed29MMvLTkMGkDaIieK1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVtb3QZI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVtb3QZI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-841882f8f4bso3611479b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341877; x=1780946677; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MCmyoZSECFIrOxC29z+xmAbGeR8WzWcA1U+w5LzaXY=;
        b=KVtb3QZIjmwDnd0c2OOdbHq+T8kb4gOc4OQ3FkCQQG4J9sT7d+ci7A0n3H8RuW0rBY
         e4UzJos2UK79FyF7RqUBP7oxm2pSqgB+HWYSQZRZOkan34Enpnz3OnS1ma4nIptT1d3m
         ZB9nVCQo21oEeLZqyLzIACJe+y2FHh5v7rqxVxDNo3fH7S2124R9vhEcDdNc38ghXS+f
         lzMjPT496TwoE2bVKIDEea4wHAeLVPHHcg1LcNKcOaACnc/+JR4377KTarY+qaEgg99y
         obxfjtzSjblCcQCPG05ZkasXpVf/HCtTq0d/r1XX3KViBWt9Gxl2Fv4gDkBSiYEXF8T4
         J2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341877; x=1780946677;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MCmyoZSECFIrOxC29z+xmAbGeR8WzWcA1U+w5LzaXY=;
        b=F5jgYblZk7CYNahNqSOPNGHgGr/0rGxPmITcXRHzv8b3QWdudYXi0uO2eAdedKRmqd
         7nJlfK0xSihRPcPZoLb0O88hZE+3mCOoE8fwWhUT8FiYrRYCHK1E1TNsPgobCwKbIbsq
         Ln88L0ONeqZN93BNdF5bhNQxW94qQsKYsVSk9O0hB1ifmpyHItbuuthSX1QYyjce0qMb
         Qe/waIvBE+Imh57h/3ZkaZdfbdctHahi4ckR8A3tIDGnPQiqk+Ogpwy0jTzY9zXqTeQ2
         U7K14xPKUvzIBE/ffnKkVc0RDPgDlw3RAzN5IfGaK2dRoRONJnH8PW9rtxZBbPvDJllQ
         GULg==
X-Forwarded-Encrypted: i=1; AFNElJ8Lwo8skLUvKZLSW5Fisymh6pWRBFTYCRbGCP5RHjTdM5uMLM+Dfm4hUI65VkaGSl9Lw+qDanVEfLqOslosUiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+v8ttqsehLZc8RvNZnfE/aL5tFDNuKaL5x+6eprs2mKdo+N5y
	ziXudAL7J9GrScG120yKANikM40KGieGelC1j4AAhm324XsUB7+FuQSa
X-Gm-Gg: Acq92OEQT1jVAeKyyGRd6ml4f3HjOjR5LVj48PG/Ji+1o4ngEq+/jVtjYUi+zJMCfhC
	IeGg7db1vN5n5mUcgtsfM3lf+UYKIiiPy6ASqf0ZQc2Hp/+TfyE2SUukBWBhhhW7rKiPPoam7IW
	wWsLvRDZa1AqD5A3/H9vlFvADIMTvLq8invXWa7wz7SkfkXH19HcXAVNEItrcdSg0QYbYFzCIvP
	gU9y4g+uhPYR0dcRVWjgxgFz4YNIfum+zzy0lwESbegL1U9B1grNw+q8810ArH2LpYs+JSJLJy2
	Hjhza6JON1DD+YFYVGABv/+6f2wL6+wyBxJGv3vnkXtc0vrqz+jgJiNi6fFErTpnhIqisGI+4jZ
	9V0aoDK+X316p2PSX5y+DfwE3GwDR6k64uWYdFalkedEcUGd4z7uLALwXTvv7KyxnWOqGjF6AQ3
	qSaL4380y5rGm5Ko4uyqK19PrOe3dzx+BilTekpeM=
X-Received: by 2002:a05:6a21:6e8e:b0:3b3:2703:123 with SMTP id adf61e73a8af0-3b427fe5105mr14193245637.45.1780341876971;
        Mon, 01 Jun 2026 12:24:36 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842487f60f9sm5022651b3a.8.2026.06.01.12.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:24:36 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next 0/2] net: devmem: allow bind-rx from non-init user
 namespaces
Date: Mon, 01 Jun 2026 12:24:26 -0700
Message-Id: <20260601-nl-prov-v1-0-9bc57d6ca3f3@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrcHWoC/x3MWwqDMBAF0K0M99uBMVSp2Urph4+xHSijJBIEy
 d4LngWcC1mTaUakC0mLZdsckdqGMH9H/yjbgkgIEnrpwsD+4z1thR9DOz67WYJMgoawJ13tvKc
 XXA92PQ+8a/0DbupmVGMAAAA=
X-Change-ID: 20260529-nl-prov-491a85c020b0
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Stanislav Fomichev <sdf@fomichev.me>, 
 Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

NETDEV_CMD_BIND_RX is GENL_ADMIN_PERM, which checks CAP_NET_ADMIN
against init_user_ns. With netkit and netns support for devmem, it is
now useful to let workloads holding CAP_NET_ADMIN only in their own
user_ns issue bind-rx for a netns owned by that user_ns.

The first patch switches the flag to GENL_UNS_ADMIN_PERM so the check uses
the target netns's owning user_ns. Init remains permitted.

The second patch just adds test cases. They are identical to
nk_devmem.py tests, but using a non-init userns.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Bobby Eshleman (2):
      net: devmem: allow bind-rx from non-init user namespaces
      selftests: drv-net: add userns devmem RX test

 Documentation/netlink/specs/netdev.yaml            |  2 +-
 net/core/netdev-genl-gen.c                         |  2 +-
 tools/testing/selftests/drivers/net/hw/Makefile    |  1 +
 tools/testing/selftests/drivers/net/hw/config      |  1 +
 .../selftests/drivers/net/hw/lib/py/__init__.py    |  4 +-
 .../selftests/drivers/net/hw/userns_devmem.py      | 48 +++++++++++++
 tools/testing/selftests/drivers/net/lib/py/env.py  |  8 ++-
 tools/testing/selftests/net/lib/py/__init__.py     |  4 +-
 tools/testing/selftests/net/lib/py/netns.py        | 79 ++++++++++++++++++++++
 tools/testing/selftests/net/lib/py/utils.py        |  7 +-
 10 files changed, 146 insertions(+), 10 deletions(-)
---
base-commit: 0906c117f81c2ae6e6dbfa82719f79c75e1c9325
change-id: 20260529-nl-prov-491a85c020b0

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

