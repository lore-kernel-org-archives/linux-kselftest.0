Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F941F3BAC
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232083; cv=none; b=c08lzmDw/aTHuNRonUL6eJfZQ3mMKZvy3WCjiMR6CyuIK4nQvx0BxLuwJHYreRzkd/dtdyG0wLJqgnpF/q1YQz6VyUJypaOEz9CiEt6vXqNhLd06hc2p5PKwFz1/C6XZYRB645cAYuMM5y2IpuSApSkM5lSY7/yqn4ZWaQAZcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232083; c=relaxed/simple;
	bh=91dAAKwKNToHslYj0nEZb0ypxjDjiWcPAE0+mi0F7l0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SEjg6GHDOU7HVknlk+Z0TmDyfJqOx2UOncJiSxv+cv1+vg6NEvmN5IkeNCAYyQNx1O4hE471zoR1QIIU7+i4T6L1l/lBzdTdI1rFG/YIEWBH1h30R9AjYjoJCHoQPW3wlRz4Qkp2tGUyZNDA7/7JwyMsXhM9imbxgtmut2j+6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efJ8OV15; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efJ8OV15"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso909804a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780232081; x=1780836881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7PC0ftFSwZs0M7V53XHcTVYt3t+DFZQ2Iz/r+Z4hRs=;
        b=efJ8OV15IEhXMpMYP/P7pjtvasj6jVDfMrYE+mZxed9d0zq5AmzmsBjX5fKTwY+ZG8
         /WMmJ5A8/NDn6315MnmYioC7Tp61ZrlXKPvDLngKXW0YhobhCghzJp0qOLO3XeElONCa
         ly1jRWCWG6Gl9v2PUvM32vmH/e05bfWn+pZjGwyVvQiz312rddwmBmhwRCuSeT95suzo
         aaAW0adqX0eXZKUgAv7CMvG7BfVba9uQb+Xy88mpxeiISu2jT8EZ7CJObMisPB01tsjb
         tibSgMEKytAMujkCjKCC1dHfInVP3nOd3eZbe0mwxHbs+3rmUKOn0Z01SrL6uchP8LjM
         vPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780232081; x=1780836881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7PC0ftFSwZs0M7V53XHcTVYt3t+DFZQ2Iz/r+Z4hRs=;
        b=tNLOULMYM6cxObq2e62BUiRpMIY8+NkhEzDF5BwiB2qnxQevB1ctzq7mRQsC0uWoIx
         bRyjmAMSFYZr+Vs03XRzsJEoN3dNTGdQtw89JGRiertmJVUv77MXlCXELqWSNTPcbJR9
         7b+Rua6VRxc+yW00BlHnaWTdAxPn8LlkzQlVGfEU4ouTTIhTpESwohy8Ss/l8t9dacWy
         9aErNPdENlRstD2zn686uzkHkYeX2drgYUQCQh/yklHujIh3LouPX36oqMIpBhf9ka2V
         H5oYfTZ3XyccTQ1UvmQYzNk3JSOmyPu7h8qBzaKsXb3l5i3raACkGK5Wzhd+PuDFlzyY
         i/vg==
X-Forwarded-Encrypted: i=1; AFNElJ8moSVdtxxk/ZokBJJ9/0Zma7nSLQA6J58W/0kxaK7qw4UQtO+HkDCMxj6FTblNFWfiTwJ59Ywv8l1vgvgy2P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGqRpZAenZCSc2S8be7hcXRqttxR8KTxzAotZdmRKnac4ZN68
	MWqnCcTFw5xJ9Utl4AhS+5x5A9h5+MZw8RN6Ng0Kq+Wse1nS0+csMq+n
X-Gm-Gg: Acq92OHm88lr9waEXi+zuOBlDl2GQPyIl2PYzXQfrbq4e48EdibuiYtx69ASogSpV7j
	c4HmrqtvWbQ/MWgw5qQ+DayDLlNBPbgqzBzGTdN40AS9A0a+2YJVPC4a2tfDJx7teue3lVxdkmR
	m+KOo2mBc1pmtTy0ackLc77wg+3BigeQD37oMToKwftHmLpAtcShUMpDow3Qgf6npgefdNwbKJz
	6RpCKsA3I0P+KgPT1XKES7wzPGwGFT42enQ+wL4hq1qZM/iBoL1AMi7tXveX9cbuxCiaycx2mLA
	zwqhDTUu2mTRHfQlIgRKurBKbDND4NMd3V3ZLazHiDgyVk7NqCLMh1YVJ+1o3yCCLiR4e8KkjjJ
	EkeE2FdS5N4VlEcTdZWWHyJaVFHJSqC9+0VaLEKhkCJTv/nx387NlQ4gkCPLTWzZX3jEHYHNBYR
	lZO6ZZNEPeb4uBCnwpXjeNXpiuxkbk1091RPzvJWCeiIiTst1axg==
X-Received: by 2002:a17:90b:5184:b0:369:971:4888 with SMTP id 98e67ed59e1d1-36c501c74edmr5952856a91.15.1780232081284;
        Sun, 31 May 2026 05:54:41 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:7f12:602a:a4c6:2b38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfec391bsm7766670a91.2.2026.05.31.05.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 05:54:40 -0700 (PDT)
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
Subject: [PATCH net-next 0/2] net/sched: sch_fq_pie: add per-flow class statistics
Date: Sun, 31 May 2026 18:23:12 +0530
Message-Id: <20260531125314.22492-1-hemendranaik@gmail.com>
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
 via 'tc -s class show', following the same pattern as FQ-CoDel.

Hemendra M. Naik (2):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test

 include/uapi/linux/pkt_sched.h                |  29 +++-
 net/sched/sch_fq_pie.c                        | 131 ++++++++++++++++--
 tools/include/uapi/linux/pkt_sched.h          |   4 +-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    |  22 +++
 4 files changed, 168 insertions(+), 18 deletions(-)

-- 
2.34.1

