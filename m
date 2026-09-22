Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C92413791
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109049; cv=none; b=c6wHGaUQ9Af5Z8l6xI+hSpXRNZJ/02bCNOdKBk3bbYWMg5HiWsrsU2Tu/QL83pDmszBAjNfPSA5ZxdTwjfpfQYnpdpoWzD+t4lWOZPgF1oClhgyBw36XT5H3wCKU5Nm70BSdKaS4lY7s5G06vMi1PNnUdZ85hExtSvyVr2mxFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109049; c=relaxed/simple;
	bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opxdTmLuDtKjRr9TBQdSr5DOOy4BrRMvxAHj+6cps9pVEgBV03gmK/GO+gxZ/9n/xwiGEVmZLRnKPIjBU62Dx58L4nkZgWasbZnwysVD7HmOz95+K0+QD/779jDrxNUwvLoTmCB3xFzNCapLZ+WYcCJzL0yiou5rUzFBtSAqXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkRISFFi; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkRISFFi"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so150134a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109041; x=1790713841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
        b=ZkRISFFisvHM4Y8fMfyPRZdt+bu4x0Uy0DTV3VakD8p4It9qPmejlYBxBECvqNjmLg
         tZug0tqDLq/Q+hyjv9hCmEimnv0wV7UWah76YAIi/MzSpeWjJRUxgL/hIetNwFRrPl5S
         SfALGyc5XhZwwpK95rI+g0OEZ91UGAvuBYtBObF6kTicFJk0Jyq6pkuYwmQVte4917Rf
         9jfKZblDbUQ0Q1ZXkC4wVCHBA/v5K48Cah2Mn7MAVvaBJ7m8ud7/IvIQY0TTeoI/zmVx
         SmE2gOK+66uZqHpaYerp4yJ4SWbtKj1REuYUBaS9AoLWjQ+YM3U4yLDt3PNqP/S8YSz1
         Ni6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109041; x=1790713841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXHr06+m8fKcBbVdqgzfwCvwksgvw1yhgxhdVlQe4EI=;
        b=eY7QeinqMylFBM42t4sOxaEMYoKGFmhQfMJJYqd6rAvMaMA0FLZBXxWDxbZMASj0Gs
         tl9jB4fG7vBDXkGcE/8xhcQOU8Iic3PriWcQBTketxJV0gkAAZO6TYT6+V3HXp76FsH8
         LZ4is6ya84dz9z5G5kiLJ04uK8kKBsP0C4nUMT+Ko0jWYIHIuinzPs2MlWmIRC/waq19
         DWIbcv/p80A9OvfBFWHc9jiVY85PenOmyU0F8oKjXD+EmrPtR2DNPQw9biE+MUazklBK
         S3qmvFNmvohNcwZL4DcqN4mnm7spHO6IoOMCYxiXuUSymRwGwdk5mFAP1MnAHBCYj8qx
         R7fg==
X-Forwarded-Encrypted: i=1; AKwUvBwcvABmg8cHmmFc9y9lj51oKdPmrVFOPKroN40j+VGTxEu2wLj0k+MKGyzodDUmTa4j0dFUUIIsUu2jYyDsgso=@vger.kernel.org
X-Gm-Message-State: AFuF++nJy/OUbBYW2DUt+yufWB5RCJ6iTxYZAlLKQL0bGBudgCM0q5Ws
	2rPAuXGaDold6dzlKNlEsg1NcgIGUuIdGkuwCz6wmNCtoQS25mDiy1t1
X-Gm-Gg: AYBFou36QfKWvE/9oXuMLeJng9uzPmcoeTiIaS7kxTUZYe6WgVPQhZT+5hM+OdJiJjN
	a11SSyaxxzm5crIpuU672G7alnCVa3HlM7KSIxOwXvizNEdU+9UmDkOyEP0H5y9KOagIChaqgu/
	CC9DJFgILgpar9AlA/xjDaJmKQgtLG/2sU6mj/FI7JC8W6AsM9wZjgo0SWGL2ItMSpdpd2I3BcG
	OUt0yGnYkWBkB3wtf5T78C4bbvhGDWrfVmcBgHY+Oorw6dJ8gsp/3d0WgeoZ9iEKvAGbJQFh9dS
	xT8Qoz1zKB4jhIP3p97j0rUY5ofNmd0BPSCHpasxkf1fsQuP7GDLAnKir3BeWXb7mGtXIweWz3b
	8jgtqB9Yr/SsWx/veHmkzYxOkzS1jJhzaDOEKWvhqNt1kIuJXMiJydNmrw0phaQjxhMnLRgkd2R
	64zpiRlh7hXrTZ95P6Xwur9jL8lDjtHxYkyE+UOUEU20fhQwmrGTAVHEZpIZr9CPAB2S5HpKEM5
	6/igMhxcwLscjp0Ei6uECcutu2TxQ9Y5k6p2FnBgEDeqqeuTaeMWEzsGqXGuhozb/TcmjZjTc0H
X-Received: by 2002:a17:90b:164c:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-3a07e4f35d7mr512229a91.7.1790109041020;
        Tue, 22 Sep 2026 13:30:41 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc5f3d7sm1046121a91.16.2026.09.22.13.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:30:40 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Wed, 23 Sep 2026 02:00:32 +0530
Message-Id: <20260922203032.26774-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002341024.2160803.17066887333412185241@kernel.org>
References: <179002341024.2160803.17066887333412185241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Is the microsecond description accurate for all values the kernel can
> report here? pie_dump_stats() [...] truncates the nanosecond value to
> u32 before dividing [...] a qdelay above roughly 4.295 s wraps modulo
> 2^32 ns [...] Would it make sense to convert sch_pie.c to div_u64() in
> the same series so the two ABI producers agree with the comment being
> added here?

Agreed, this wrap is real, and microseconds is the correct unit
pie_dump_stats() is supposed to produce. But this patch is meant to be
comment-only. We'd rather fix pie_dump_stats() with div_u64() in its own
separate series right after this series, instead of mixing such a fix into
this series on fq_pie.

> Does the bytes/second wording hold on 32-bit kernels? pie_dump_stats()
> does the scaling without widening [...] On ILP32 both operands stay
> 32-bit, so the product wraps once avg_dq_rate exceeds [...] roughly
> 16.8 MB/s. [...] Could the same (u64) cast be added to
> pie_dump_stats()?

Same answer as above: this is a real bug too, and we'll fix it in a
separate follow-up series.

