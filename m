Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D080333F360
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441440; cv=none; b=Tz/Ca2/tl7nXI1o1weck1loR/LlzvZdZXMEqmni3s88yAAvwzeEe12tAQZ2f/2QiJme1R2W00DtfXv311cPISkGJefOwTvbkqMZY2i894svTU9nlWvTJG/9btUr0gsT2zEoo51z3L8iUd/6ssYun8TiqUekO6b382PWG7XtfQ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441440; c=relaxed/simple;
	bh=O4ZQftSfdzDvQBw4QDT5W/g58Ju49uaSr9GgemzTkh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rOsTZ0MZo9eZM+sXTn7U8Hs1/izqCb8l5Ex2TPcAiHUIDlclitKkQH5XzjPah09ow0TFoZbrH0ROqSHYTzXJcc1Zv6Gu2ZF3UNy/wtBrkl6+7sWV7XiZrN7e6WxTkjg89nMMJsXX2ToFg7oy+8ws5ORocW7YYue7fFK5e/atweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+RvWZLm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+RvWZLm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2a68d01so16128185ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781441438; x=1782046238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BUkD9fnh6nUhU2UKLYYekm+TZegtL0faOVIIvIfCto=;
        b=Y+RvWZLmGycBtbPps+p6jClbfZp3HddRukSYDtJHy/zYoEOrvFNnifznGjGatM9QgQ
         /9h/EC4EUS2b1OXpXjqEsQjC4vVpdazQHM0mCTYyhe+31gwsd0Fjwge7QqL/ZuqsUOpB
         JiOzIZk7BgesqysCA6vrW+QBZDDdqh/vkIj31HEMExDCtjOon+Ae+a5xUpUt8TkuVNb1
         qUYvZ4Hb59LhKEiTVjfJbFeRjpCZIfazBWBgYi5FyiGjYUQMlOSNQPqR1iKNbpCclib+
         szL9smRVuvVXnDXEqXFcAfDZtaltJAlPAGXXmIF4yTxK8tNzGleJS3Sazlfp7MEaOwuK
         wl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441438; x=1782046238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BUkD9fnh6nUhU2UKLYYekm+TZegtL0faOVIIvIfCto=;
        b=GNSh1nRjHWRv5bF3FC9epFsuJMJDDpmWwUw2H38WDPu5L4hSGUcLvS+hR+8pX0MfvS
         LgP5mZpQAriEEMn3xf2b5iT+shpasLhzUy31VyVHI5c6YfP9HO9rvTaxI82dw30hnqIT
         S8OiE97z2mzUbjF5PZj7LJKELtgiVL18SwB/hNqlkkieWXTC/JM8XZPnKgEVRP2w4Kof
         ac1omM4/A1TARDYHtPFve6imZKZrqXJKzwS3zgs9yN+w2E4EUwnTKEj8rzssY1mhxMTR
         VHlhfbTMCUlKhOLUbqfATAJuPa20ngx9o0C79oAwiq75sCH5IUJhByTSIMe9cEKj80eL
         9qtg==
X-Forwarded-Encrypted: i=1; AFNElJ+kcVDC8TQY3hEmf1IDaTP3MMxuCvhBKEJhbcNu0T6M9weMtGqbG2FKdBKwsjuf0WM/hFQE2CBUwBlTJbrhwME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiXOTLw+hW0Gt5fWgjgnr145LD9aqvkc5Aks3Uxp51B7a8h73H
	la9zUGCynhYg8lT4m1q2iVGjbdCU2ip3pFsr+hOxwdohhlQvjxcQcTjj
X-Gm-Gg: Acq92OHHmAhfM6flbwObBMSCNX0i8agdqSz1iSLGWOMnm1o6Pfp3h1wW2jsNtgLHIqk
	YtipyAu2dSky859AZRShIvmBmpJ3n2NOy2lpK7PMapX6pbW1d8+EJHSnSQ0f+f6oy28gWMN76w0
	ztKqUZfnIAa4HxWX0Tgf9q9Vdj6KDGzGt23gp+IV7qdf+wqeWYRA5Bkhva2xi9nV2R5aHAvcjaw
	DiTY/QAgOumi2JYBUSPMiy00O0ai0P7Zl14eXORN0dNHdQcbppoXSBdNp+mXXES6RO4oW/hW3B6
	H85ryk1RLimj+MOcw7TTihBJK8BrHZcq9JCAE4+mxKvHE2vldKhjzk/oc+3xN7w1TEV//1dNDTF
	UZqhATvBcIqj32YbYjn/PYjSmpYjxNK899zmrXDHuLMCOCcMML2qsi9I9LUFRRXpdXJeLNrejwD
	dkgZkZDzG5Q1P5p5QSD0eHMNurpacehEOrCjhziVs=
X-Received: by 2002:a17:902:da84:b0:2c0:d9b7:b7b0 with SMTP id d9443c01a7336-2c41216fae7mr121815405ad.31.1781441438112;
        Sun, 14 Jun 2026 05:50:38 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:90b2:9957:66e9:8cb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm66426825ad.45.2026.06.14.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:50:37 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/2] net/sched: sch_fq_pie: add per-flow class statistics
Date: Sun, 14 Jun 2026 18:19:58 +0530
Message-Id: <20260614125000.6058-1-hemendranaik@gmail.com>
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
 v2: Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

 v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/

---
Hemendra M. Naik (2):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test

 include/uapi/linux/pkt_sched.h                |  29 ++++-
 net/sched/sch_fq_pie.c                        | 118 +++++++++++++++++-
 tools/include/uapi/linux/pkt_sched.h          |   4 +-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    |  22 ++++
 4 files changed, 163 insertions(+), 10 deletions(-)

-- 
2.34.1

