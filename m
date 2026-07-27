Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEB429814
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 16:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170483; cv=none; b=HwVezs/eqRsZyLjaO/AzT35Ka1UX5VzvtrIPcOVbBF6MuH/HRwsKvCSRSE0OSuv69MdgS25wrcKZ9AK05Di0YctOVfm8auKPlqooEPnWFI427yf353357Q2WQSXpPrrfm9q7ajznDHGoUE3T55EJQRm3TapDuGLjpWXmfNxYREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170483; c=relaxed/simple;
	bh=vp7w8YsoF0pZgEq2PM2CYLvSQSsrkXdmwudp69HLuak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OuIdd9vcRJ7wEwS1ZknwzeuWe4WagsIJZmN8wvg2n4KDVsdq0kgrJ6Puo8OcMoaovo0TGhNovlNuiIiW2bIOnO/lbEq9hQvUg3fqWmH0LNu1oxs9xxgZtNXVj2iKI8aUj2Iy5MYzGAX0rlSdroOO8gHEbUF3kgQ33Hz4tfrTA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCkW8lqn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCkW8lqn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2828755a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785170481; x=1785775281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAMIqKsMECjuh866za4d81qNl0b4qOpAK+fZ7nIiqyA=;
        b=TCkW8lqnONIyFNU6LoHRRKkAGNEGzLX1DIoGX1iBBI/LCnJOV+jvgwyFVZ8nzblva5
         C8c9nOlrdkuXF82mmGcig54ynCwoIauhxfoJfT5qrkyPHTkuV5BuMzRQ2NN3Hlv6ZSdu
         RAHBGUwymoXDtR294wI39srI5U5MtfnIQPH+ZhPKeOosPuZqJLAmRbptiaLnwPCR3HUB
         ti4GzQJGJnCkI3+NIDYpKWH61H2402XFZ2fWM3GUujE6aT0FXatp67Cd1gAbLDda4hkN
         T4pV7a8OBmd1nVpwebekx39p0ZeDImBmrgTBYnY7QcBVWzdFqNvkumhyKzmnm3KkD07i
         dtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170481; x=1785775281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAMIqKsMECjuh866za4d81qNl0b4qOpAK+fZ7nIiqyA=;
        b=SAMOBxmDjTGSuMfJeqPF/s8g94j6mF2oDDEI/nEwbW7o0ayn8rNjvMsUsQDURMPnnM
         dpFZpUyYa+Mb8SRyIC0XZYIVZD5FIO75ciCvQjFhmdAFtTlW/m5wznhwCekfuWVospQs
         4oi5oK9V+WcJi6typYr9Pzdm4TTpeDNJFEE7K4e2fLL+dm5P63sDS31hyp+FJ2rkzf62
         9nP2BW7Fqx74YntV3LiOzMrJxgbf1QggLBdMqgD/MkzNOeXQiSxOoepD2nTCFP1hjBqA
         Lyr8jv/vi651zSrSEtlwV0ghTFctIk+zfvMBMjDCIqIM/OYYSzjqq2SpfrOeCl1hZFXf
         Xs7w==
X-Forwarded-Encrypted: i=1; AHgh+RrWHVT6K5Gdke7iItx79fZ24ZTKkmtnUUG/BgSmg5hZrSskskPjgiHCK+pSsueLWaneAD1arxug/56f8htZOxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1x5L/1hx7BUlt+qbdOdzIqS4t3P1F9M4YKcE/zTocR9t04q6I
	VMKtYYP2ZSwFyKGy+V9/pibTrN6HyDl2+NmPMxQrXw1zLbPsjO9dTufp
X-Gm-Gg: AR+sD11pHuj81w3I95JQNlgFUFG/vLscFQ+06b6unS5ltak57zvhMF0gbvxbRz3htL+
	r3aTdfwNmV6q7/ZF0Ep9A48D6U05DwEmgwqu+JGQ8ntmXw8MgxW65/SchEgQuMUUNPo2DvjK6Qm
	eMeGQo1LXk2T7FjDNOOW7L46xgzBfMbZMmf7Sz+xXiHEp9XOgZ9a1YWWqGJFDuD3k2VjI7mLLzz
	pHcn0gbVkNYJ2RhGjcnsHJ4RkZO4gc8ABhSCz3Ydtky9mx60naJfoCMv7dsqZvvMwPsehr4Ni6e
	OiInab4xBwfzW5Ww7lT5S2lue1tR4tkT9ex0p3UL2hMDMgQ1gQ2KL4a+Foss7MITw90fOjBAIhB
	sYaQuBt0ul09TgGf9jBgZO9Tb1MwDLOnrv6CIEpFtHBR2dynf4nNGe3ArSDa9IDqoBXovF1ye97
	NYFw74f246y2e7lAMpkL6KDfTy3pn8UfQb9mJYtuybn4DcHknYhEcyWCQOf6uQ7NvjnFC4WyLSb
	Kv60h4=
X-Received: by 2002:a05:6a20:244b:b0:3b4:669c:ee32 with SMTP id adf61e73a8af0-3c6c7fe54f4mr290098637.37.1785170481199;
        Mon, 27 Jul 2026 09:41:21 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:8b84:a60e:2cad:e760])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm33227566eec.26.2026.07.27.09.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:41:20 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v4 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Mon, 27 Jul 2026 22:10:53 +0530
Message-Id: <20260727164056.106203-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate)
via 'tc -s class show', following a similar pattern as FQ-CoDel.
---
Changelog:

v4:
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h                |  29 ++++-
 net/sched/sch_fq_pie.c                        | 109 +++++++++++++++++-
 tools/include/uapi/linux/pkt_sched.h          |   4 +-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    |  22 ++++
 4 files changed, 159 insertions(+), 5 deletions(-)

--
2.34.1

