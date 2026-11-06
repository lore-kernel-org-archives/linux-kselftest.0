Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964781;
	b=fnidIV4bRjId7Cez10PVg2hqG+yO81krxdHfOZALYocwSfskdy3d3OvZBHcRwHSC8CQd
	 Ef4y+epLoNqZYCWrd7Ko4SQkReeeuDA1xdl8SuwY2j5T+MkiMC1oqdJZmIZ6YXJ8pFDRd
	 agfRUrmnlMB2MuSQrDzmpO9tvQB+E2ANODRGiv7TjqeobU9/nXcyNidxI+8p+Dh6QrJuH
	 29NZefM80zqZvsEcqLRK0PahRpyL5cE6dHN5AH20OUyajnGDGjqUw77Yp+aJaNFZf486Z
	 YNuz3XRXNevo0uBmY51omzfESlcjSMtUryipV/3CDSzTiTurtkx9enrJxOgwyNj5Tvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
	b=1upzh3/F0dMGgr5mEaS5zqZ1d2rpe7Y1o7GzQl2NqcsODoEaEvP0EHm8JhJVabRkJvzx
	 mZYS5hmTeXGkqio9gGnq8DIt3cMHMIcfGmdChoSUQI5MGmLwt6vjLh+ibDgaNWcXvtnHv
	 CNoX05dUlJL+KgTWxAemwa0DQVyXkDLtFyVL+vL/dqwwPvT4aUjj5faEDzERkv0+Ck+04
	 Ew62FcBmFx3YZyyYRbO7LsPcbxqoF2zpepcQ0i/JMg84+cuKTjzgIXtT16+8PnepXxrbb
	 vYJImaGnbI3M7zdPoP5z6/vZHwfwxdT6Ipjqz7lDn4103WQawRooLoLN441RglK4GFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oGw8bPug;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2360A381F
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA2360A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oGw8bPug
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso2441455e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964779; x=1794569579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
        b=oGw8bPugmHcN6mPqHq+3d9Rsb9MiQM+ozHzT9oATnAygZWmszkg/mWNy7tTKqjgQpe
         Z90Efh6jtFUl/LAMuvCsWHB+CltQB3R6JRQ1cYD3it7URk6DraxQ3xnglzLnakg+fVip
         oHJ7evIRXtHRKSO+mn4xyvmHoVce7xN8BncEqxHFZtDZL93sWsUXLJ0FUizGeDjG4yZ7
         oG0TckvSYVUxBJZsygecbrNU96ujNWTcot24IrNErdc//dLTHPSVewvDv4f4cYrGGji3
         4oA7qjTUtkslo5j37SJJvxQRJY99VKjDzD66ku6VeEQFYBYwsBp7tdZQ7zbiAFtCnKBo
         6vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964779; x=1794569579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nzh7sCzVLU1Vb7ZGY6Ft72lyczAGmFqvjOfkg3Fwk8k=;
        b=n9DSuEUk6q3WUdJUx0pp/6wOo1zguHWutBFQKfnu9qhmv4wTeuGqxyW9b3hRUqJLgb
         vKYOUeTZs0xLpYchUm9UmyM7u4MtTOnw/rlJ0hdY8KkHgf/da3K3FZfxMQrbmcuOqdky
         k2k+c/0UIQSG3GbEMf1GWaVEu2ooKwjzxjF1c7ddyNrIP3bpSWW/smZasRkbRCrVPlsI
         X7aetxd7hGhXCqxXbxMS2CYlvsxTON6VEMXoHd/Zri4UUWj12kdfV0P9aBLWsTnvKCKJ
         Y92vIM8XTc8cCBlCiYyDBsCgvYSDWbtTe4SOwxJfIJOyOXbxhz3pDy1yueHNxSVt2VTW
         g5/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzev4Z1vQdVKQ4npJbXJd2rRs/U9oFcLuYlidUN2KmztL6cQ31nxQKQda2/MZBGbhTuAXRKd704vghAhOc5Esw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RFKze/CABBcRN3dBv8SzYQ/yJbY3bSJXNL+56vUU9ATVcuwJx
	iyRwor5Wu+T+fdzPCoW5tdgnHw9akGKZNEu9Q/whAknLTVsoQiIJcNMmDAKCCCuS
X-Gm-Gg: AYBFou3Kp3SJTKMx7v6Jp7pbnBQHpgHsKYSLdU05o6aeemsakCt3l8s4ATGSqV58ToF
	Rvb1A3BvHFM/rQk/ATPFdQkZOcRj/yh068VTtQ2Wcn7GN5BTA7ktu5pG5dkKx0STUtwa83zq33a
	CKyC0eNwLJTNV9qJHljEDgTdylDVgLwr+2FGkQj6JzRgkDvcqaIeA1i2ehs8N3tbyZ212glsW66
	ljsCmcY/rfLjVdokz2rdcKHjbYhdi02Isrhx+FxsMkb81+YbYeGTWLswh9uAEvwNR6dobX4Gg9C
	Ekc85sgxUd7VzXV4TaAZYRas+nV/a0vl6uRNXiENSrpO53n5kSbXxUhVUmEYlow5LNApEwF+IxL
	IfPtDSbFRPGtDGC7uq6F5hwHA8VC2EMMDvpSNMzix3C3dtCUK0VYEfCwXM0WjXUAhA2/rwfDhhb
	whrk42HqDzayXq6JIePIXgOhfq+lYUhkJHqAGW6CPL+X1sWDjULShKqA3jJxszGDIrD/rvNaVGF
	ybawDe9NgtY9CF4r0+jGleEI2a0qTUIRypg9RCyrfBnq/VzNsaGQxvxzNQS+S18FzKjcXCcXERD
	fL9oJM1ub6i9DrN9s3qCkTY+LlFmNqS9C9CvA4tfgEDGAQrvzBzvrzyoHt9bXFQUW/ojtnwQ9gu
	7aX5eYjhIxS4nq6WfyEksePCyFfpY
X-Received: by 2002:a05:600c:1d05:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b6dc6deb82mr34411495e9.1.1793964779207;
        Fri, 06 Nov 2026 03:32:59 -0800 (PST)
Received: from andreayoga.localdomain ([151.37.255.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d5511sm3825805e9.4.2026.11.06.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:58 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>,
	Cong Wang <cwang@multikernel.io>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/4] seccomp: fix user-notification state transitions
Date: Fri,  6 Nov 2026 12:32:49 +0100
Message-ID: <20261106113253.78866-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've reconsidered my earlier plan to send patch 4 on its own, and I'm
dropping this series.  Patches 1-3 go as discussed with Tycho.  For
patch 4, it looks possible for a signal during a RECV whose copy then
fails to make the target return EINTR even with RESTART_BEFORE_RECV
alone.  I don't plan to pursue this further.  If anyone wants to pick it
up, the fix could be limited to RESTART_BEFORE_RECV filters, leaving the
others unchanged.

Thanks,
  Andrea
