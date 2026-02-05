Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD43A9DA7
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770291271; cv=pass; b=QkeZWoJwhwHCH6qrLfcSTmcVFUPos8CRUWfBmRwzQ07f8OgsAHUH9m1aNQ/K/IpvxYaQeRYkKL0ttrXOHlSdh2l6oBWT5zwpk6FGVL/1kUSk9gGAPkSqP+eb7wHNW5gVesS6XVVr3mkl+OI0UpIfgb8VgJeSOAmsv7fln/5Rgl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770291271; c=relaxed/simple;
	bh=Wllrb4WsKy79JRK0IRKHL+OD/vSc5rdMQLpSobXKH9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqEGrcc5azmKCu0V+fyqw5GniK5LCXnPOEXbZprGpS9hZSdUv2SwriNJWgDjrcACK+8TwqTN//poze3zrWtOFbTE71na9bvVG0w9YR7MR5hdgIDuATXj0l6EnkA+hnbAJb1gld6u+fKLqcOOSr2wSzPtlJS6CX4LpatUEQ78/Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d12Np2dW; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d12Np2dW"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso1683595a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 03:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770291270; cv=none;
        d=google.com; s=arc-20240605;
        b=W1Hfm2G6tp627Cl0SA+JdL8GTNN6gwrsho/saZij/bF8MsCHqFaV8eODuUAHMYyJ7q
         S2JKL/8IC3coLuD6iP5hnS2CFocush/1qgw6kDTLhDVMoJyWlzwqRmJK13s/Ygg+VRWC
         hn2MV1QxGvKuN53e4mV0azA3QRg36/2+N0SWlDSTUtWUN1abmmsXqRiRVAjreXDnc/k4
         ek/Pjk8AcQH3/gUw+/zAfdXXRTjoWocTDkX/J7cS8wv4+d1CxOXw9xZeS1q179xb2eNt
         pZyj1GRhtmIXThYjWWzIfEt3TAX/j3d9XEHz3i2nHiVr4MnBD2h6zR5iK8vXnnoAmlpV
         Y+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ny70VYSd1xmz+6UjM3gPopGsV2FlfYDUrotLR2sKK5A=;
        fh=rW3zKTv91+riM+1Kv3AG3wFALQTQbU4SA4Za/yeXQvw=;
        b=AOdrFHnLauEyo3LzZBS+QkeWhGxv0PnRzGrUauZTKW5R6QPbRfJBID2m1Ut2Uqg06R
         Lci8ot1SapzUpS2j0C35upP2IuXKiAknDt3MP6ROV/vb75HWUAbFJH9XHoiFUjko0A9s
         Aa3TypJyooAtyaGEVPzpFU8R/izzj/AOT+50mZ+ToKP3tK07hbba7zIyxysjx5m2wWZ0
         rkXrrvy86i9AE/wY+MwHolRxieKXZLPW/b7bZRTBykygSwz8wxlESkhS4CHwgLsLQfHt
         tR4XNoLKlRp2Usu7EsLvPOPSVRUkeImR8nEYSNzyrSqCk905arPdbaROWAEvFCCLnZwl
         pdsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770291270; x=1770896070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny70VYSd1xmz+6UjM3gPopGsV2FlfYDUrotLR2sKK5A=;
        b=d12Np2dWrxrrPfVW7VTgOLLvCxeDrSPXqWGIRLB29Yf4PCyVmWUZfJ+hfQhge2XRcN
         pWNTqfvUuYukLwgK44tomY77lHZONJtsrfwuGqsGl7dKwftvOkS7KIQr8gnnyIsFRoIy
         e/BiWowsDK0FxN0BQzhuMJ1QYPgl6gdVhjK3Uzl6wLkKT6Iry+m9ggqbSFmpO9l9w0pV
         XraW7IyVCEn93qySmzrSv6KteVr/Iz4pK4i1rTqLeqzE/ooRwacbTQyACHJsJ8DxkZGD
         Wp/N2w7z3gKD8VAiph1Q2ugpyZIyKiWZNxl8nOP6GuG48+NNCZB1fGjsuD/3ddXkWSJY
         NTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770291270; x=1770896070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ny70VYSd1xmz+6UjM3gPopGsV2FlfYDUrotLR2sKK5A=;
        b=X06gWD4EXRnVS1HFaPpdeGjYCSCOPWP08VEUx2NZWFAarTm//Cmetj96MKYXDysbb3
         XFfpUFrYPoWG2oE9rHCQiYtMzm+mb9C7y6SUxnNNSw4yFphUqhpA+0O+Db+wxQ1Q+W+E
         lY7Y3kotgRSH/rpx11nDpS0yrM16sOGOgBqfrMB6grrWQnp8e+RID8aeQKGEMuhXZGpP
         iaHr/vLPUKkKaj+/Z21nUWa7GDrgMs8UP/9LkVcwFnCiXewd1aiPCkP37Wppr96wHDBi
         /6zYRmdQaU++C8dis/jGbk4d+TNN8hIKKCShGalOddSrOUehhcyJzzIzBqBE68HHuGCL
         Gbuw==
X-Forwarded-Encrypted: i=1; AJvYcCUNDcU/bSJkAUJ66bpzyOrpxRlPSvCWFspIe/Mgmd1lh9jmEl8+3l8yJqJ0LjfDPxCafvhp/Xc5pffkPB/GQRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6AM6qx413Basv9MOFZFYaMONT7k38ezxo4HnV60AZ+cxdhU2
	toPOsPl+t76HaWfWiPiaSQHgVuW3QvCtD6uDB9m+3xAIIfwr6NQE7Fdfo2DBQnt3YNJM/prGvvV
	N0QXQQw8a/WAfdbIVSBA9ZPhRHAiU1/8=
X-Gm-Gg: AZuq6aI4dQVapk90bc1gJU2t23vqTP/QmOa11xwp4aoyfZqPsJsg3/65v3WzqindCj8
	nYFBDNJPE6K9yQ6sZ7u//9ip2LxbmYEaSUmacOkHTNfum+WaUU0KEErQhkqByO5dW27AVowkii+
	qo5mkLXg5xt03IO7o26SjmmSwfNgFzyC/5IGbL7U5bC8lOH4ngZrZlfbNvM+wEMRyAuU3Ri5JCw
	TedM/aOSyF6Hl0CRd7vslV1DbBipbqY+90cnZDK31yaSIa0S8nJLUAtNArVdPb/p+gDME5U8V0F
	NmBxSlQyCOZLJzu73lUgrFAMsHK68Q==
X-Received: by 2002:a05:6402:f29:b0:64b:5562:c8f4 with SMTP id
 4fb4d7f45d1cf-65949bb6cfcmr2908607a12.7.1770291269875; Thu, 05 Feb 2026
 03:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dnncglg3x26gdsshcniw5yb4l2zlxz6qcwjqyekkpngb6v26q4@ftqnoe5eeapy> <20260205100437.1834-1-always.starving0@gmail.com>
In-Reply-To: <20260205100437.1834-1-always.starving0@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Feb 2026 12:34:18 +0100
X-Gm-Features: AZwV_QgE8wjfM8FlpFwp8a5QJSoz0VKfXZCzKeg29kODXXrJs5HemCJ7Q7cL1Ok
Message-ID: <CAOQ4uxiax3v03XeSP-MRHUqx5WTa67qOjtusSw=M-Tk0zARv6w@mail.gmail.com>
Subject: Re: [RFC PATCH] selftests: fanotify: Add basic create/modify/delete event
To: Jinseok Kim <always.starving0@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, repnop@google.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 11:05=E2=80=AFAM Jinseok Kim <always.starving0@gmail=
.com> wrote:
>
> Thanks for the feedback!
>
> I agree LTP has very comprehensive fanotify/inotify tests.
>
> However, the motivation for adding basic tests to kernel selftests is:
>     - Quick and lightweight regression checking during kernel
>     development/boot (no external LTP install needed)
>     - Non-root basic cases (many LTP tests require root or complex setup)
>
> Similar to how selftests/mm or selftests/net have basic syscall wrappers
> even though LTP covers them deeply.
>

If you just want to add some basic sanity tests, maybe this is ok, but...

> Do you think a different approach (LTP improvement instead)
> would be better?
>

Using the word "improvement" here suggest that you want more than
basic sanity and if you want more than basic sanity then by all means,
we do not want to duplicate all of the test LTP test coverage here
so please invest your time in improving LTP tests coverage.

mount-notify was written as selftest because there was no good infrastructu=
re
to test user namespaces in LTP.

If anything, I would recommend trying to move those selftests to LTP.

Thanks,
Amir.
