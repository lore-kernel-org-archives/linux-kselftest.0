Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F63BC68D
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536172; cv=none; b=gweKHQ0E+EcBe3SwBucFdkQfi6HFz1drDbQWwd9izRSM6/cBErWOgHIvASLcGw4Ol0dw35QDWLY0bENrdkRPwhZ6fFE53rONLEIwDR/kkqcViLvBCsoQeySqRT1e9RBFsonmX4kWPpPdQCPr9gFzwyQbpQD7VLQbWcpI+bqmNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536172; c=relaxed/simple;
	bh=/Ncv4pmHB2k5k4a6mo3lzenG6x84qqCfM0wTLNgXudw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n7W/MTEGZAFr4kELm5UFvH0g6hTA7G+2AQwY5QNLPLPNb3ObW46hZ77ltz9/UihZek/HRqHO6vuB8Cn7EZNFW/A3xVDAAc/TbAocyQot7gGFA7JgxT90wuZNsBdGtLklEXYx5McWXYy0SVztVyPDsN9VRGObS7PI41iaQrtLpvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7WKBKll; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7WKBKll"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8805988a200so1389466b3a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536171; x=1791140971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPb2gJjQHkq+JlwtbOznBiTNAc1qQBhHXizpCBFuJII=;
        b=N7WKBKll8PWhnGQ1FyXM1gC3akstDhXuQvYgtpMaF1ek2oO1W1j0eSc9bEi4miPqa8
         VSUsm97a3IZLk8yS2LoHAA7TRKip3Zn8kvwHFYVZucb46fYp7+PPIGL4AGgpF9ek2E3O
         oAAYh93be1C8yuOqHPDBYnjzkRj2KmmVA1VXkCByWjwJ3vqJ7oxPIx6UoIJGjlh7seP9
         7UKb0fH1/zYaKWK4PHUDiw1L3Tg8Xvrg2/y3069ttozpaF0Q43EnexupM4tvYJ/Ig4b8
         xHE6U03/kLQWaM6z9vPGew6OXTHrDIvpum86R46o2DbbDcO+3b35xibdQ0q4kuDr/87/
         uMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536171; x=1791140971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPb2gJjQHkq+JlwtbOznBiTNAc1qQBhHXizpCBFuJII=;
        b=kDqiZjAGwb8xvqGH+G7MvaHP6sntvJPP25cPtrbmRKykfRjElHWT3TvABu81mg04hS
         G92thI5+xczp7QWnHLjE6k1hMP6ev1XtHsLd1cbHHoep8Z2TBLoynBhOp6ysgXmhJiiW
         ID3Ml1tMdHirdsNGlmWCZYKTzWeo6jAlWzbqu68a4zVBLntfsUljj99eTIOSINyMSp6d
         DMAuPo0XMQu9VOdrKGKL/GSAh3SxAq6/QsGAOKf0uZ8lPDJ3433ILByJSSL4ArPufoC3
         46WZRlugTDMGGxckRywqnDz6DR8YSyEpTivTEm+FUwX5l1/bJ7mI5WxfFBVwybQfyGRv
         uimw==
X-Forwarded-Encrypted: i=1; AKwUvBwkaT0i68Ep0AEcQ054BhMfDVee3Ed1Pu0qCpyXTvHRTxrEDhZ+jtJlcx3GtvVbNL4fYv0yALyLmTLbFsP4tmY=@vger.kernel.org
X-Gm-Message-State: AFuF++n19l+ZTiDjUC4Y5C3hHb1ja6tj3R/NiZKLdny9Dv5dLeDajrj9
	sgILjIkYGwAYwOB4L0Hb9TUR0/lgvyVMP8vB4LEgelwvDbmdQvGLtarc
X-Gm-Gg: AYBFou2viwb9nS9EMCttIY+1rLBhGM/m/6TLEO2FpqE0cTLyhsH1+EpJ6RRh9DGgLcf
	dSJE85U5NF/cJm/PpwWUkN8CyxzAHS8HoBGMBRnTsbgGR1HzbtxmcjIVwY3yI3c/hBl8D6rRrwi
	iYIBf3XCYXy3xrY+XEDCgzuBioiWa4bFodBdMaNBAu5bymirTBlxNsBYMMzgtqagwzPL7VnP+Lo
	POB0Wn9/Du+I3FEnxvyfEy6yNh5lcWSkaddnKpL9XmnyqWvI/Obwu5JIH+S64XKW6pFtz54mWPC
	939ZhKCCdtDj0mXuO0jwTD+n1ixrLAQzX5bWfnhjXJbcuo7aLJLh2Ibnjk87agFQ3EwAApsJCyA
	NG3qHwwFSkfxdhlZuwl9WQBa563745bRYf9yYUz1PklPkb32coClyFD/GTyl9A1nuyfR9pxP62h
	4Jx3hns7OYNIsdm/h2YpwI1wqrPPT4UGARb5xyjBCejYAZKahaT/RHLTYP1lUqzDSjAtm9dY3lv
	9rsc0DcOsrKgAUc5EJeQK25uUcv0zULbx2HKUwTdZqdaMy7YtT1whCurMQQVQuYcZU/42xjUw==
X-Received: by 2002:a05:6a00:2347:b0:881:e266:c3f1 with SMTP id d2e1a72fcca58-881e266c8fdmr2589039b3a.21.1790536170813;
        Sun, 27 Sep 2026 12:09:30 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6651:2efb:bfb:bd73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb385ed8sm3204478b3a.45.2026.09.27.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:09:29 -0700 (PDT)
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
Subject: Re: [PATCH net-next v8 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Mon, 28 Sep 2026 00:39:15 +0530
Message-Id: <20260927190915.12527-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179028364138.2160803.8521628163584007831@kernel.org>
References: <179028364138.2160803.8521628163584007831@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Our response to the low-severity comment is inline below.

> [Severity: Low]
> This is a robustness point, not a bug. fq_pie_walk() in
> net/sched/sch_fq_pie.c only dumps flows that have a non-empty flowchain:
>
>     if (list_empty(&q->flows[i].flowchain)) {
>         arg->count++;
>         continue;
>     }
>
> That makes this ping the only thing that gets class 2:1 into the output.
>
> In the standard tdc setup this works. nsPlugin runs the command inside
> the namespace, dummy is NOARP, and the 98-byte frame fits under tbf's
> max_size of 100.
>
> If ping is missing, or doesn't accept -i 0.001 / -W 0.01, the "|| true"
> and the redirect hide the error. The test then fails as a regex mismatch
> in the verify stage, not as a setup error.
>
> Should this step be allowed to fail visibly? The same pattern is already
> used elsewhere in tc-testing (infra/qdiscs.json), so it may be fine as is.

Keeping it as is. tc-tests/infra/qdiscs.json (test ca5e, "Check class
delete notification for ffff:") already uses the identical pattern:

    "ping -c1 -W0.01 -I $DUMMY 10.10.10.1 || true",

as a setup step whose only job is to push a packet through the qdisc,
with the same silent-failure trade-off described above. 83c0 follows
existing practice here rather than introducing a new one.


Regards,
Hemendra
