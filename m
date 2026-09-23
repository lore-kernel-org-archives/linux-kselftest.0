Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61613420889
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185778; cv=none; b=eR2YBHGeUEblqwdFQ9ZvE+FKmco5g3jNgmOU3Ym5eL32sAzSMKqCKkkiUEP4CjTwDD5A49KUVMHsPwX54GXbfbC35hm/Q8pPZPPNR97jFKib4ZA5yECe521sjMws/xsXo79bGvTgdaA5UBNfpXmGFzfidMmwA87BLJuJyfXkBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185778; c=relaxed/simple;
	bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fiuZlpLpVPjfGNOUgaHa9EuYPg4VnVNnk0b1GWVnOlWivOnIClYziF6HAmrsX2wlZS6492Tnv6RVCKJzQG4xz4qNha6rvk9vawJuZruT6K6ym9yhu1LYgIjeop1CHgSejv6jsQm+uSII7G8qjWbWRnoQTWAKXWVGiZuNmsxwNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWaan63S; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWaan63S"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc433d52421so615916a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 10:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790185775; x=1790790575; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
        b=RWaan63S3XBEf34onYxukqlDJ74B6rL/lbo4PsN/sDumTwMMfjCMq4PyeVSdY8PiN+
         OGeiCDbzWk8O/y0HJW2nF/AuxjwrCc2nrC1Ig03c2FMQi0BTq3RniXwuzREoFY1+mHlR
         CSlVKYeZwVo/zPSbfLBLgf8ubdiURu7aJTqVsVDHjdMLWqBCWmDtu2CrMBnQjjrmMM9f
         tc5TFAscc65Ndsgcq9k53aRY869HVBGU4g76GyOIxt86Dmx6Jk9l59oNNwUvb4gwZjN9
         Sy9QLGhWMyK6IkEgacSPsoRHjV0WEkg091LffqoLBRodv0z+y2K9g0AjvWh4g/i6jIeU
         tXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185775; x=1790790575;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0qrLZrXHcjxaMdguIqby07pC/TpQhegHwKy5tJHNHA=;
        b=sH4Ff0ri7am7TdNNu1dBchr73Qo9+0Q34/rR+sfcfdKg3ZPBexblKMYMHT/0n5R/d7
         jVrgUEhRWaOEEEQradQJKToBX24CrNMNEMu3f5LFmTWrk9mu50EyfDd4EwDjL9Kf2SfP
         P0bcaWNgJxCLe/Dr7chdqLeh5mYpfH8xaR47dyJR/CCDhy0Ot6QuNR1kwZgo5qvItz5R
         6gp1aGuqw6GadZRb2nht5/jiD13TSRnz2q7WkyFvEZ9OQW0vj/yc8lzSC5vfEMWTW9S5
         5l28J30xMnvPl2je6fHvD2nxYvL7/4OhVw1GW37yPBuS+tIMco/r2nMZymO4C9+Bdc63
         p9/A==
X-Forwarded-Encrypted: i=1; AKwUvBwqvyhxHiip2HoJioRUvQYEIIPG8QrO1bF2SDt8s30wLbvmpHglAUhRPbvyS/UFitQFgR7XPfQKzh3U/klfQxo=@vger.kernel.org
X-Gm-Message-State: AFuF++mFuLgBciH3Ay5DqI1YoHAWqN2ru1ssinQKX9aVvHRUhF5PmtGP
	/0tTtWFoynbUD17Vgt2hO1FNBHwIA7+gi3cwUG5uLMqRSAgW9l7tYLNt
X-Gm-Gg: AYBFou0lr0QJrLrPV1fdKzkzBJc7EVUC5Fvjx4yi53xmr5VfUMkpRfNTHU3f7rEeNQp
	ZvEs5gvPNAIqT9lfac6pPnCiAOEajoEmsNwe0Wa+bCBf61ON4bXwvpSegElMG7E648w3f1Fbg65
	cVOpEwKFvBuKQpMfMcB9/INWgRPe4/2d/V2uNKxBOJ/1eTRTIKWg9ZXVTG+lM9Vx2oJNGRvuc33
	/ooEZ+G9GJYr61xLQ7XnT6OsHjk0mI3mqmIvpa5I/pJq77+Rcgqyy1ob8xpwjMZG1T66ei+hhA9
	T1bSUPdTCQdpsGtHGxjvLjVh46/loslWmrSm0fkH0l4n8IVrFLGAwaTI2HWSQZP1jfPRVr1n1G8
	HV/YGuls3kYasEvsMdWTKKfwPFLUxmRCwusKZ9T3GARUvatcEvDI03yp+xTucxoGIOSrL7/6ZwT
	X2nhuyGvCFFDdjFDj+HN8HakR31xoWgtfcR2G4lb2WMNgPSKKKbUnK5LdlEzGSVtItko3ClrxGs
	wt5Y9phB6maOFvE/HUg0i2K15jZqt9FGDDa
X-Received: by 2002:a17:90b:1cc5:b0:3a0:9640:8036 with SMTP id 98e67ed59e1d1-3a09640858dmr258738a91.6.1790185775461;
        Wed, 23 Sep 2026 10:49:35 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a081274d7fsm2065754a91.2.2026.09.23.10.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 17:49:33 +0000
Message-Id: <DLMVW6Z8IU9P.31OHF60Q6YCWP@gmail.com>
Subject: Re: [PATCH net-next v4 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: "Ido Schimmel" <idosch@nvidia.com>
Cc: "David Ahern" <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 <netdev@vger.kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1790127207.git.lfqlee314@gmail.com>
 <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com> <20260923083633.GA2626135@shredder>
In-Reply-To: <20260923083633.GA2626135@shredder>

On Wed Sep 23, 2026 at 8:36 AM UTC, Ido Schimmel wrote:
> You shouldn't have added a Fixes tag. Backporting this patch to older
> kernels will make the test fail. Wait for feedback from Jakub / Paolo
> before posting v5. They might agree to strip it before applying.
>

That's my mistake, I added it in response to Sashiko review feedback on=20
v3 but thought it was just for documentation purposes, I didn't realize=20
the tag would cause it to get backported since I only submitted to=20
net-next. Sorry about that, will wait to hear from Jakub/Paolo before=20
sending any new versions.
