Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6E35E925
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765274; cv=pass; b=GQkqHdnFvz/LCEXC0r8zZaWw1aaEzA767WVoTYk6e/2YcE+DRBY5OR5jYWWz6sQUxftc+dB4oMTKLqZHafJjlkU7CAf9HYnQXDzOgVC59vKPz2/SAAWWnH5XnY4saYQhtlaXYpfkNOKRLwuG/f8Yxug3NP2d+cQ7k+IsSItheK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765274; c=relaxed/simple;
	bh=roDUwwN5trIGJXrQ+SzJRvohhN8jkqd5essBX8nFDGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qU+JNRlpaBbsge2+fxTNk/8RE+2C+EgXp7jIufcHFUblid8xCgyhG8t25DQKXOdHZKL7FGjQwJb53dmBLSTtmtqcKu8kl2TERWBWzBSjKxYfCayoeWNZcd2MoH6yG8NPjeSat6nQWBKKH5ELr7xcCucBjFg6CkPzCdVkSXdQuwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBQa1fx4; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBQa1fx4"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64cb577e79cso9276558d50.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 18:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765272; cv=none;
        d=google.com; s=arc-20240605;
        b=RxGwvMASZctAlVKAo2N1s+F0Kjz7CGFKktbGfOJAVdO2BJO3m9Kz7QFvNUSQmTd3Lt
         S4P6pDdIiqgjp64cPP4gZesttxW7S5osGE4nSCamzEYWA231aIGnnTOcodrcTdBf5hWz
         y+HKmlAxbXUGzTuxcUMQY7S0FYy9VuI2Lsg0BUMPtRvmyPAQ90ucytUtGVNcPA9Omd/S
         JNfanHA7CPaGlnXilDHODW/qn6lnQQDqAtMbOLRG+aEtk0lcT7IR0qRvD2kvJQBR705Y
         nlbrQjGMNNcF5WPWXC0Gus5GaDQkTmXvgSWlBpsMwMbpb7cF4QJGjlsgakwUuX6J1NgR
         YaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=roDUwwN5trIGJXrQ+SzJRvohhN8jkqd5essBX8nFDGU=;
        fh=WS9RcG97It9NnLnuHxUTK4t6f2igj6Uk5Rd76Cpv1OI=;
        b=Rqq3j9JI/DCqDnAoZlnU9pRZz6Ou1+BKu/Tqzr/UDEpbwf3i28mz+do3qfg3khHg0v
         JMqITOOTXzvdSODWXPKp+ZsJ0LDfpZ94H7uRDsfalX7frHOQYOL6JxGx4e5vdmnmxTCh
         ufKXYcgpSN1MTdqC64+ASVMzxc0kNhtSsUA1wU64qlM1Byeiasr7FASeaTKoShefM0X4
         q9i6ZaS73l9rt3F26/6wPMpFTj653Rvef6r1kfqbm3TehZPnCRhVuFWmvfr3n9Xcl2PM
         aIsFngdLOb68d4yvOPs2gjtRgdMePd27nV34p/dD1vaqql//F+/CYBcTIifcFevjIUy2
         D4rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772765272; x=1773370072; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=roDUwwN5trIGJXrQ+SzJRvohhN8jkqd5essBX8nFDGU=;
        b=ZBQa1fx4W8eO++a12Vhz4JvokE1661wG6tR7mvYmsJ8E+iBuHnC78lzHBXDhwuP+nO
         zMVGmR04Zmm4dEoMpoCB6Ym6Dg/MZafrBgqQYV9whO+5+ovwiQp5HIQmFEfLIkqzgRkb
         3ggs/LgWTrboxnuTpOEkwV0fnAd9Awsfur9rRzsVDf7W92ips1rhp2vnStOm3AzlbeCB
         e/FpOiycXD8sKh9vnkcNVWuC3NDkSsyhXobuvQM6WmjtUcCYUh1xn5nNd0lB/gxpcm62
         tHcRIAmCElR/EqnCMaWbd6qKFytluqtPFJ5QzDoRL2+sTi6Te3I45vTz2rXF0w28wH1Y
         BC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765272; x=1773370072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roDUwwN5trIGJXrQ+SzJRvohhN8jkqd5essBX8nFDGU=;
        b=Mziq0NImgKFybwzhxCSMJklHq/Sx1EHKQ0GwmcESnF3qdh3uWbcNzSw39BjkSoSKK8
         1Nx1W53c90KiTYBnV3mogtswit/VnUzN8h3YIWksT1av3Ch3x/xUjy2MvrGfN+9QXBv5
         XDBY1rLIU5/bHm8L4R83BtZ9zcMwwXuzjbi4R4sn0ejONpoiv4fgV8o6ZNgdBYihNzQf
         sgCfX3VEfbcaWBN923O8TJtMjnrbaappVpPC1s+D3hhoJgR0426fbsWSySKRD7mr+5Gw
         HYVDgpqY3xFZwyD6DNas/FqWlDh2qk1MzaSIbAT6zYKOsCXod1m9awM0thfreKNuU81y
         1cyw==
X-Forwarded-Encrypted: i=1; AJvYcCXV0xeRlRp818MwqYZ3zsfXm0y8Ev+2N8zetgje8gUkd7RlbLONk1qlfoIWW5pbaxlZTHUk1o2Cw7gGuw8y2Q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQ+ZJaTYuLtuH9pnHZbiPinsgkl/647HnYMivd1rNNQBcNamD
	xBfg7DDAHSfcisRkSv9g8ZUUq4ndrOJCOYpQ9+jIjKG/Pf/Zhf8MEJUvdDOJzH7RN+S+CPjhycz
	7ZDB2Lbq1CShvArcQvNQUmLpV2qlKYso4pQ4JdaLrXzqNQJg=
X-Gm-Gg: ATEYQzyWJoVoJCogLbP0pst3c429RGnmbWqztIKbChAP3+mD1YLMmH9cLvU1XqLaT2C
	Gy/6ssd7rnb0a4YuXekNrKQhgxOSihMzLddgc2xBiQO8VG2n+scUgr5V9lrexhHEwLi+6+BcezP
	qMt3ZmHHAYNFVg3EdGuYv7/mel/hvCGw4+kCB3O9mAnRQqhQVlmBnFDZyq8v8ZIQMCAllPi/+Vy
	JBUh3Q7Tq9ufWTc01e6aOo0VEkSeu2GwdyDmbLwCCX0Ra4P87OJcnjDdJGvDZBZ4f3fiCPqk48+
	yR4pCeUO
X-Received: by 2002:a05:690c:112:b0:798:207:9d4e with SMTP id
 00721157ae682-798dd69b1d1mr5036667b3.20.1772765271939; Thu, 05 Mar 2026
 18:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225111451.347923-1-sun.jian.kdev@gmail.com> <177272642704.3184289.3763404212538394213.git-patchwork-notify@kernel.org>
In-Reply-To: <177272642704.3184289.3763404212538394213.git-patchwork-notify@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 6 Mar 2026 10:47:41 +0800
X-Gm-Features: AaiRm51qq--B7Q2ndRqddJildAbFU0yoZwRVNq_kHTuc17z21jkjgAZSCDjm2XY
Message-ID: <CABFUUZGwaowzgLtMRbZMwKkv_TQkC4NXrVZctAspSB1QGL23XA@mail.gmail.com>
Subject: Re: [PATCH v3 v3 1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
To: patchwork-bot+netdevbpf@kernel.org
Cc: shuah@kernel.org, kuba@kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo, Thomas,
Thanks for the reviews.

Paolo: Agreed on the Fixes tag. I won't resend since the series has already
been applied to netdev/net.git.

Thomas: Will send a follow-up covering this XFAIL_ADD/TEST_F() ctor
ordering case.

Regards,
sun jian
