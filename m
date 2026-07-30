Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020939936E
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405637; cv=none; b=R0yOaKM1G5Q08ZcPXvhG8BUvYE/BiOK9KQ48toZ1oy9sRiSMc7FgZVzbumc52OSJRvjxTdkELyZI9pS/36RmSaeAJaTopd2MWlmuVwY5m5bgsexSbGldzDREWfqXQlihDS5+J7HPmKSlZTJtqy2yj4ix3KLBQfeIy9AiHm6DR20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405637; c=relaxed/simple;
	bh=zK36PrpFkfhmCHFEeJMjXOMCIM0dGnWGnY7l47xxgt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JoHDO9EabviW0Xkie40xPG9pf4d+byd/b+pyV2J+sIQ2u1qXj/g/Cw8KoIJvoya54JiDZKMIdd/vwBzC37fmYFIvKs462b5egp52CMILhq0ZJvaueXo/swOvrzuFND4+BwAMALkx4XrfTgLFU3+Ql8qpegcCrRl1DjoopwT3v+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbwMeK8B; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbwMeK8B"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954dff6536so11518715e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405634; x=1786010434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APzEGW6pwTYOv019V8m90qHkwClK0q1OMWnbES6kegY=;
        b=gbwMeK8B99h4WDOZKtyviw0AH7I11KV1DCQPRXT7mZVfcXj3rHwQSFZKPzKd5Ke1SK
         j5Th7+h8m+t99Gpe5fYIyuXgM5vzAx5JuwgLB+z29P/CVGuE13bQQLCXxNSJkXn7IFjr
         TPMGXVv8e7p+2UOWioprB0vWtf8V10w+guWE60l4xL3hiDbTQSs9crbIfkglfauFasJx
         /VqLrdVrjm4WdAKrOHLza3Ub4DYfOG20pLWVCL2H9tz5IDsQJdIjtj1IEN+do3LEOuSZ
         9qv8ljzSLTE4j5F9yFlzg+A+yYlC0BBVGQTyUWWFTaSfUqNmv369nU8Mgsn3/6qAjlEL
         3udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405634; x=1786010434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APzEGW6pwTYOv019V8m90qHkwClK0q1OMWnbES6kegY=;
        b=ALW3arq35cgGlJbd1m1pVImYM+n07ucMdyfQSZdBax9wdV7ZO9A13E0vzkP2weE4OW
         tBTX7f3Vi2QlZmcFQYCTIZY7dDlQz4MUOB9J5kFJexjj/IKXv5ykHIBZ7zVx1Yn1pUk3
         mnzcgmT7/SXZbx+KDI3t1/ilvisp3pyZCtYWIS9uJT41tkkaDkI4WnSilGVay0gmbSze
         HjRT1bNpbomWJFTUaeGC1OcYqHEZ02xHTbVpo4tPbQu/btvmXYV7QB38Z1bJaSBUowMx
         f5vfngzXQ1lKPIzz4azKdAwplbM42u4dcdhCClqPcHOuQ/aY6U+EhVwz7JreUlKmCO1O
         Ehdg==
X-Forwarded-Encrypted: i=1; AHgh+Rry7z8ZGLMtnBnrlNTFM67Be7eS6BlckQqAzlwnYlFxKAP/8hoJRB/LM0zfIHHdvx5/Z5HHJzRR9uW+rIvdFNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRRpeZ0BreFAdgS4eoGaD47PuKfnB3TH6ZBLrEJ2YCifnZvJC
	iUgM2d+CR0UQrzOHp6DdTNPXY2fj6cF1FUsaaWVoJwvwmN9x3Kxh52/j
X-Gm-Gg: AR+sD10zeRDclMjGnZjJio4e2Yqj6eyzXnKURzGgCtUkuYbW0uEVek1KbZDWc7lrjs3
	qpPDHX869551iSoNthbHUHdb4ELVxrLKew72K+qXDHsRwIiTiXmc1IjSZDiXbUbN3HImvGyeBfm
	WgemqwK6+NeYsGSaR1g/Y+wkntmYVIJuqW3wSgHWnOjqOa8DaxVg3aaXPcEDILJo9/6VDvxjQUm
	+In0T3Vx3sdUYzyFfU1YZBHBqGkfa3/NUrEf3oaXRu+BbtuFGEdpaq+nZnGepibJpJqyO9wp+F8
	8xyCb6bVBdRabzX1tQEwEWLLeh4nQa2SptLrfnRwV+6EkzKRIwyLcbA3x3hNQqBLWgrjEaEGS/D
	wEOzN2BB+/Lc9F1lgRSS7VHCLyBE2WRPcicjcumVQQOg4BYo15lRDYjfABccQRAYrMeeMcYS2lb
	7aGjnH+2GwXnG1lKs45tRhZD8ocsCshs+B4DuBGSMIQnbishohGO0BEKjmF7noP5Qi6/462636U
	hIFMVed6ITC
X-Received: by 2002:a05:600c:1f93:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-49800e7a711mr24299645e9.15.1785405633946;
        Thu, 30 Jul 2026 03:00:33 -0700 (PDT)
Received: from pf-5j7x25.fkb.profitbricks.net ([2001:9e8:482:5000:a5d:311:98af:bd1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4721sm3984728f8f.16.2026.07.30.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:00:33 -0700 (PDT)
From: Reshma Sreekumar <reshmaisat@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reshma Sreekumar <reshmaisat@gmail.com>
Subject: [PATCH net 0/2] net/sched: flag inconsistent qdisc dumps
Date: Thu, 30 Jul 2026 12:00:04 +0200
Message-ID: <20260730100006.3547944-1-reshmaisat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tc_dump_qdisc() walks every netdev in the netns and spans many netlink
batches on any busy host.  RTNL is only held while a single batch is filled,
so the device list can change in between and the reply can miss entries --
but nothing under net/sched sets cb->seq, so NLM_F_DUMP_INTR is never raised
and userspace cannot tell a partial listing from a complete one.
rtnl_dump_ifinfo() already pairs for_each_netdev_dump() with
cb->seq = dev_base_seq and nl_dump_check_consistent(); patch 1 does the same
for the qdisc dump.

Patch 2 adds a selftest.  Netlink dumps are driven by the reader, so it
unregisters a device at a known point between two batches instead of racing
against one, and a second case requires the flag to stay clear on an
undisturbed dump.  It fails on net/main and passes with patch 1.

Build coverage: allmodconfig builds clean with W=1 -- vmlinux and all
modules link, no new warnings, none in net/sched.  allyesconfig compiles
clean with W=1, including net/sched/sch_api.o with no diagnostics in
net/sched, but the final LD of vmlinux.o exceeds the memory of the machine
used here, so that link was not completed.

Reshma Sreekumar (2):
  net/sched: flag inconsistent qdisc dumps
  selftests: net: check that a disturbed qdisc dump is flagged

 net/sched/sch_api.c                           |  16 ++-
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/qdisc_dump_intr.py  | 123 ++++++++++++++++++
 3 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/qdisc_dump_intr.py


base-commit: 51b093a7ba27476e1f639455f005e8d2e75390e4
-- 
2.43.0

