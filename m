Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBD44D796C
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062739; cv=none; b=PsrO9R+kfty83XCXyp/X3XXbLgCjEa1S3ELAN2umU+UsMsN2odWQi8GLj+nek+Ek1a1c5YVbkWlfkh1XTHS84Ric1M9awRoK1qDQFg7ArmWGjI/tGChibO5fB+EKagpKsHv33Gxl0DNcknxnMJund82Y602pPQpLjX1Y9L4wwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062739; c=relaxed/simple;
	bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjFfaqJqREV54D7KiSQCQdOySyVbtWZ3mFzWsu+ae8We8BWaj8uMuK3+97KGc/mnDlMVsOOGPRJgqDhhJeIFHdHr4MSKhjUymCk75Cmj44KJLJdSS/zZdp8zqO3HC58mfU5P1fpTVojCUmVWqV0axvoLXQPQFr0z6cW0BlTgYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzUyr8ga; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzUyr8ga"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso9041360eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062737; x=1792667537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
        b=JzUyr8gazr1tTMu0P2xNsDtZ0ml0rpJkXqiSB8vP0bxeSSSM4HYIE0yWES6X3NoTVD
         UAfTLJ0LpL0CAc6iDiOp/JftX1cn6SL2B1KuPGSY1kvuIMM4HNAr9YwuVuUyswLhxFCW
         +5IyKykn8FSdtWQ4/nGo8fWAJK5CaavgolBAtu9gNM+Fa/lfkYJr4iJS0HANvV14tjfi
         6nGUeJYtRKzPgbojNV9XZixpQR+hRjKEF4Wh+0W3KBSxfNvg/0Ply/yCfIZMj6Rg2d2Z
         n4b7Zv8wP8kFBmLFwCmjf9NQLKou73+nsO0B1ReRcXi6ob23+I9iOxNDpHk5/7CtVNeV
         cPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062737; x=1792667537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
        b=Hwbk0Z+XYV9RyGI8PeV9LdFFpKgI75MvqqIPYtL4xmCNOe7ES3LZCdpsN5eJ7Idytl
         ajMRYywQF2gT3F5pMZqn2lP7U9OhIuYIMPKmBgSTy6F7RclkVBsg30dpAIWnWAl0VvQA
         E8Gz1cPeGEyUPN7hbzCb90IKX+fvp8Rbly1UdnN6v8/SGyGVuKf6JuJ2gNjqVgBFmOHS
         M43KEq43qby87Cexgx03OFkE6DLIQKr/GKa14jmgXiek6jrT2pUGkCkYTaB39quFfnCx
         IJ/J/1NuAndq+EHSwX1F4+MovZ2hzw7r3bbZCDVlB+/xZIgoejak/f8aRcbgfuxR+1NT
         5/JQ==
X-Forwarded-Encrypted: i=1; AKwUvBysHZAppAvBCjFuNQEL53oqCxnyVaD0U+VQiupBjGl6Kg9/F4tvyRVObZxuoha8kdiqH6XXGn/YIUK3Ut8G0vw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgo7It4A1yyJ5DPHAVsaAJEnu5YtxcaqrqeMacQknI7UWFZt8y
	YJFUk/zB5IncReiiwmtXfdDMnQxQuLQdMODpvUTtWdvu+1Kpi8INFFqV
X-Gm-Gg: AYBFou2H4Zn7PrKLUpvuBaSprn0oNRWPWkA5UgQV0KWVY9QJ3LN3+bx47CemIuLQydD
	1TAXwF5FKE/zIn288PE6s5Ys2uoJ+tQpY+1LH938ZnFrl2m91zRd2c0SeC2w8Ac/jtQX9T851ki
	C6+L2qWOd0/m5hfvTK6Oq0IOYVfTyQ1iKVgLRgz9+TyaCGyKGy9XZowzJvmsQqN6ma5gmyx0E5G
	rD3a0HP5fOEH6jVagAH7eSAb7R1P3ZsyceE46K0YC5H9/T6nP244K2/UcjUacWP7lvEESAWc1fF
	Drq4VY7alpC2cLt8C/qMp64YafqCvzGdA60GAnoxpsdYuAtUEK6RWzlHOJrLAHYUfT6ssnjl9tv
	1K4F6jCHBl4S2wbqsFrX/qtoss2s7ZSqwt4eLDdhOze2EZPcBMeAExyoNaZlc3jCWmvVPtvoXEo
	3YTnK6qKy+M28R5Im59FPUayxcIYx+xjgLJxb3kofUyO6erNmdRuFtSo4dVs6bcrM+yIAcqUVkD
	0+0RrU4mZL3IRwSOGa1dnpinFtWezZE
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr35858267eec.37.1792062737176;
        Thu, 15 Oct 2026 04:12:17 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm68338413eec.10.2026.10.15.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:16 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: Re: [PATCH v3] selftests/cgroup: test pids.events notification
Date: Thu, 15 Oct 2026 16:42:56 +0530
Message-ID: <20261015111256.1551933-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81a8a0d64d269851ce4b48a240aa673c@kernel.org>
References: <20261013064812.875787-1-sahaj123.sc@gmail.com> <81a8a0d64d269851ce4b48a240aa673c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Tejun,

Thanks for the review. All five points are addressed in v4:
https://lore.kernel.org/r/20261015111243.1551387-1-sahaj123.sc@gmail.com

The test is now test_pids_events_notify() in test_pids.c, runs on both
mount types, drops the skip and the duplicate counter check, and cites
1765a153d985. The v1 to v2 note moved to the changelog.

I tested it in QEMU on the cgroup for-7.4 branch. It passes on a default
mount and on a pids_localevents mount, and it fails on a
pids_localevents mount with 1765a153d985 reverted.

Separately, the existing test_pids_events fails on a pids_localevents
mount, with and without this patch. I have not looked into it further.
