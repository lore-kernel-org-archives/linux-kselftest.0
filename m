Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7E45D91B
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798916; cv=none; b=P05IZ/Gu8b19xrY77Ck6qOpCi+USUuhnXNqrx7DrgRvYKRMXODjByBgWzfkyWR8wCt/PlvD4nMNb7n99CcmR4c1QzuUWeR6LqPiC+KFWTmOje9Qqf38EJbBvzfScaWw7+R/ekee+2H5ermq3OVG/7ABIPiTcfMZ5fgIvyCtCZ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798916; c=relaxed/simple;
	bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diGy98VT/7YC5gDeOJ8QvTw4yZPXO8YakZoG3O8qBuwhFUqieS1pQeRZ371u2uxDxSN0D6wTsgvkFS9TpU/zgF9CiDggUb0ToG+g8RFLWpWa0gyWDWFOgUMclmkgsqdZ00+GXRPg8xxJ0MEkjNmSwdXGP4IOUymQkx5FVtTRYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM6djyTI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM6djyTI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-887a58523e6so362041b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798911; x=1792403711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
        b=dM6djyTIKJumxg5kAD8dIppFOl4iMXiMudeys60d9q8CFZH8gTMNzO94E5iPh9qiwx
         +XHjaK74RIQ/hFyUUz0T1AA5hHfaMGc01hINQPOd7v/j2ODelG2f9UzWiiq/Em3CPHTX
         1uH1KqUoUhGji/ah1g9NPSq09Qymld4Jtt1gXO6RVWOPhvfSvEdk/9Nhmiet7p7wbclm
         4MPzs97WEXoTRLcTdJNTWuClfov8HvcqIj3QDAf146AidBwfFI4Kw/65BJsteyYifGBr
         XUAKRwa6kmPq1bMfgzCpzlXGFOCrvUT7PZlsqxEatmTG804gxy6NQWr+Noz2zmUXsSLD
         dpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798911; x=1792403711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
        b=KhQ/c5WIFLD+KHRfRBPnq8sh1sIzqsRDFcJN5uhqSx2R1L9y1ohcvgZhplcPfAxA3y
         /6tG2brnbxQFFCSSfoIZJrXAR30F6Wf0iUveq4uBvWsvRVSRlFlF9WFBQzojq/b78U04
         doc0JthCRdkwQ2Br7KeJEAkdsCZqVA8iD9nA+Wdcl988KrB3pqoWLpkLCFin0D5WRAWZ
         LjBMPS8DYZj/0gJW+nlAz7kyfmZ0583qh8gBSfRcgDN8Sim5tgvB7Yb383zBVbe7SaIh
         nmvkyLEFJDtE7YfLW/UWsCyaYg8PYGGMbqqN9XBpzluCQHbHQTEHapJRz2zGojHVpsh8
         uWYg==
X-Forwarded-Encrypted: i=1; AKwUvBwYzyVKSDBTK2RYo3IkXcbYXdqpsrVoVggyf4qAKYznIBhHHgUsxEwNLj/3BGLySZYuKD9MOnbikysj3S3Vjyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvRBl7oUO2/v0MFwnQBiuKOr3KxeRAIqnW72dBuIwnZWGS8EGF
	9TjEsCU0TKGWsAD+rRWkGP3yucCCOtrTdRW0abRqwwaH84qfyKFCCInY
X-Gm-Gg: AYBFou34vMX0LG1CZUinKSJhPzQb7niEIBv13CYkBfZ0E9GweYz/ijDx7g8qD35qEX1
	JY2082RzlJTUg9OOIb94ZMOjlUIgafRABhu08n08IyfKEwWc/d1WWsA50g/oLsEPHzpFAxTt6zV
	R1edQa9n32/xcXqWb2RYJTKEr/xHODaYsR06DtxvQZPzwbmjtmOdl7cu5dlRmuyY4FLnmSoiH+8
	oCvD1XvoLSooqiofMguXEXCxnvn+s128shhoF0s+RxT78+8hDmR5cxffMtqhJSdZr07fcOLPs+x
	3uSW5AUDNQyBGE5SvDyCMTsgVE6okmuxhNHxAjVXfdQx6Z0j/IkWlkj/T+dGe7utUEw0vC6rJpg
	Df9oCpCjR4A1mxFUf8tCiDVHM2dMCBANzSV/cZONe0KEI+UYkPv7SsssWWSEtRhhWUqa64Pzzan
	FrvtFwSWTwf/VWMNnAJsNYYSD9BjBj+SYpogzJO0vO+WsFTvufZMIFR7Cq57/FO+X+Lm/eHaXdQ
	1ZyBEwjPVSDwOl2wAdBAaWxPqBWI7/76GWQXfcgzjc=
X-Received: by 2002:a05:6a21:3296:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3e16bdf0facmr7208501637.18.1791798910939;
        Mon, 12 Oct 2026 02:55:10 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c42b07e4sm3573641b3a.43.2026.10.12.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:10 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: sashiko-bot@kernel.org
Cc: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sahaj123.sc@gmail.com
Subject: Re: [PATCH] selftests/cgroup: test pids.events notification
Date: Mon, 12 Oct 2026 15:25:48 +0530
Message-ID: <20261012095548.3199009-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007063516.1192279-1-sahaj123.sc@gmail.com>
References: <20261007063516.1192279-1-sahaj123.sc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The signedness finding is valid. The test previously compared the signed
ssize_t result from read() with the unsigned sizeof() result before checking
for errors. V2 checks n < 0 first, then compares the nonnegative length with
sizeof(struct inotify_event). I also exercised the read-error path with fault
injection.

V2 was sent as a fresh thread and links to the original submission:
https://lore.kernel.org/r/20261007063516.1192279-1-sahaj123.sc@gmail.com
V2 Message-ID: <20261012095011.3188830-1-sahaj123.sc@gmail.com>

pw-bot: cr
