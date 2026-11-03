Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709122;
	b=fTJTiGlqO1oBq7zVbylv2x0IoCdYC5SyyUlVnraaVtXYUgr8YlmqXwB00RFzMJH0RMt2
	 BeLBeHzPcRFpsOcI4r1KOIuiD3UIheU0QfrhJPVP3kH4lctHQGNNdcuNts1Nj68tOpEIk
	 95K+y4bK1U44p5Mem15XgtYCseY01B2lNLNbfKOObdjY5JSMus2OzlxbANdAPmhlyy/6G
	 DElw0xCZAnhB8Pf7vQc36tc3V8jBANI5TR+IA6yVyw++JOCsWsFIe5ampLzf07Djoyef7
	 qDsu1ws7MOOZas4xurvsMhZeXulPewYTiYYjCSQia312Uw32nwV4GAJFVVIUqjKuiZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
	b=KO3dY4wS7zpFkzk3rEPOqqTerGXrUnr9RXzUwBeZybJmdHV/x+rZ++1y1E372TIKCGrY
	 bUFHRE1e8gXIHqT7kD17sbOsB9jRZBcXixkhcnXPHAu9123Vk8YZKxK0qWaxGxTaRcMFx
	 3omIEii6QQCAXUfcuJn9uL8urhtZQ4dxICFOGGaQiC+lLUvR5l352KWJ54jy3Jcic0PRW
	 ILWFkuXsrlEYrF1ZeXO25NQXNXCvh7x1MI6Rucxzp370EOQBnN1EgyjO0oIyR12BgpOe+
	 ZN0oG8I840wDkLUkA7GKgfobEacth5xzdY36Rq4QQSfgUjA7E1zVfzvSIuxsTai2klQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E04606D807
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 12:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E04606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso5752331e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793709119; x=1794313919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
        b=wW5Sb8Bh1tOSyGxMONymW2Vgt9LtgwvewWE3HdVh0cNKhUCkJ/YCPaEPxV9Ihr422L
         HyjMb5JsoDLbqcJSqhfZO34LE8WMGK70+JC/vz0DFTgNW5faDqqJczrOPqhedMpvy/7f
         mvt6q07q+UtCxxElc7JUCoCImPQ7uE3q3emliaxs3+TkpL83NAhzBTaV+hpVrRvA5OB7
         2fxj1g+zKHunZsWpo/2qWrqrD+x9xwKugBRhCk+DsP/HsdZR1btPOzjItqnSuAAU/utq
         eS0r5SYLcARtF49KqRWddUtulh6agloHpu+759V5ENZdj4Sojbl4mOsew/qSbyiez4Ep
         1J+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709119; x=1794313919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIfayYr3RFxyM2EsZlquLXo5wwHb0/isaRrVtj+Bh6Q=;
        b=gf5oj1DDscAIsh9pMZnVCAvS6DOYnOzqxoeAaFIO25J2O2h5goF3/nVfohHkHKeVhJ
         gW/1+64VtQgwSLsnsya7Q0mEC5knekm+BeY546B23zBxpWUeO+xLFXNqNU8z6CwAGcFO
         3ARx2zsMucEKw+35bl7igJRP4T3zIpOePwjIZYHSSIxYBQV4d2kCuAoVxjgPFkis0MhG
         eG1W1n0y8ShCnWdaMbeAJ0/iS8bkUyakLNiXi0eMGE2h0KA+I5emyjiRfzs1AkvwJVhx
         tXgvTX3ukBz+wiibv3lzvjZd6YT9ZBMrgMKDuE2jCVthHUrlca7EQXDa64qVQKO+7av7
         CIOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8suCSHjq2ixPUuhyPJPAN/3nN3XV4u+T25VROmfEJ+j3FGKqrDIVheRZ8Ri9zOj+/uaV8kYreI3CoNhvzFC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9557TUfl9rc+NzPA8GvJBOPovH4IV3ajXJf4jsDn3zrCFxk1ii
	b+ePkULeMB+k++gelKRwjn6ZYTELCFYTJcUM4Btqd3soUeqSN8Cd9ofCgBplY6rmXog=
X-Gm-Gg: AYBFou0os1/8kbr8NOOjcMLokPxenECBtCVKP0JgkbPYLFY+00HThTBcMiJb4Tna59h
	siaRJtmHXFjtTG+nTc6yaIn3ji8RNpbT/KTiO14XGg0MSwPzXeHbfWKViu55kqvM20HfnkckM5w
	Hop400Jfn3sSbP71r64Np92F7NvI6KUDyU7cS/d+huls8dCgqHcQ5gWq2nyM+YgYGdsJvnQfiBL
	5R7ZmjcFjPEHGBLSAduYVut5BNJJLJMVGSP4uNHltXTySROa1GsJUqGrplOB5rHVcC7dlG4emqR
	4AGiEDXM0HmTp65JFN6jU5q682U87w7CCQGh4oahP2iQrMtm42XdeO4Bhx/OR3cT/FEo3mvzGro
	Y+loNE6rtbGRjE9kVeSRdCmR57NKvTPxzvfV7DQ5OBs0mWIYQngheqX7ZoRgZywmTNdRxz9UuPl
	+hpA+CEYYfwIbmYqZjE35S4yfIrOeAcgchcpoRduRGSmGltqqccg3TwKtzUy3stchnBhHDwdyAA
	1P/OHdfkHi3WEr+pXl4T00ndf9N3AQLeXv4FjTdrjQyd16PTMQKg7UVqB1nBglrC0SKIilwtpSd
	nR8D36Xju6XpeQbuN5lnxraRqvLZuW0ZAyBm
X-Received: by 2002:a05:6512:31c7:b0:5bf:cfcc:5440 with SMTP id 2adb3069b0e04-5bfd951d842mr4004970e87.8.1793709118568;
        Tue, 03 Nov 2026 04:31:58 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfea410206sm964002e87.10.2026.11.03.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:31:57 -0800 (PST)
Date: Tue, 3 Nov 2026 13:31:53 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Oros <poros@redhat.com>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 00/14] dpll: add a simulated DPLL device driver
Message-ID: <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
References: <20261103093910.596225-1-poros@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>

Tue, Nov 03, 2026 at 10:38:56AM +0100, poros@redhat.com wrote:
>The DPLL subsystem has no in-tree driver that can run without real
>hardware, so core changes and userspace tooling are hard to exercise in
>CI, and the pin-on-pin and reference sync paths see almost no coverage
>outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>device driver, together with selftests that run against it.
>
>The driver is controlled through configfs, following gpio-sim. Writing a

Why not debugfs? Works good for netdevsim.

[..]
