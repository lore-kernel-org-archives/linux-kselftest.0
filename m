Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5DB53D9CA
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177937; cv=pass; b=qyPxIdDKvHviVegLNa0FApdsRHVvWBD3DsJVu7QNYR3wuy11Hxuefydwo0GT0ssLvwNj4pAdIQFRuuX8ZXxvT7K5EB0ny+d43ohfhmwAoWY9ABMqYrmN7+RO9sCZDn2nhci+Yu4xMN1Y385GqnM0V4YPJj/ZH52Ak3xVSyKT3T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177937; c=relaxed/simple;
	bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/r0dpUcZ9Lten4k57/x6tUix/Cv49bSjhXp2HV/QwyNZql2vpJTH9ZukTNi9qTUapUFSZCuCo103IWz9oWTIfGh+ppA6RTo4BDi8zFt07IZaU/qwXb+1WSUYIduMZ/cQ0hXfGT60qS8eqEJCzR0W/1Qx+knTinQSGH9QcXMELU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgc6ZLjx; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgc6ZLjx"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b34ee88df5so139596b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 08:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177935; cv=none;
        d=google.com; s=arc-20260327;
        b=Lk5+ROljEKarJAMKL6q2L+uxTlq0V4EPSfReKHLkEg4n0Eq48p9LdXyOi1qxHKEC9R
         nyoyuUf8F301qV2kp09DDQocFkctoBw4c27CQk/WVCMaBE8OoKcM7aZx6HYHkqSo4USI
         903xfHSGtGYTTO+aqAfLrAGZW2tz9xskddTLJv4BkRKd4GPXnJ+C8i9fKhg+AF5IsnOX
         GkMA73uXUdSjaCzkE5Z7gaQ9x79fRKRaPjKaZta6gcpddHNmXSAD6v6DnWep4Ht70QK2
         zWRewMDuOuSn8GkT/bCqda3VxV747c1PX0E0I569AaCOAC2D96d9jt66Ish5yPmhu8bl
         UPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        fh=vFHkvPwkrkRCe935aNMUxiUo1QeAhA3qaLngmVNzn50=;
        b=BeYkCBAEdmIM5QzP5Vj6H2alIl8q7p1jeUWyCFfOhfWpP16mqlfpDlAlx7VGCpJoB+
         +IFT5AVFVmUMXeWpOTy6NGPPdMBXj04p7JBBuUz/HZ0PpWb1JKYX/oRVk5JGIajxjbb1
         YPwEA9rfW7Xe9ckYZzFE9IlUoPvWsobg2zLcMEFwcCReLF0q+ZORxZo72xxXWAr1Wv4h
         DoXOlhJXV8VzosDUTy+x6Q8Plzi99rdOhwSLreustReFX2VDCpRKKNV9J02fxUFKfreo
         NRXnkppbXW+FGppB6rp01oQUkgxE1r6Nsl1oU06lEVj2Qpysenlbc1XH697R5BWsrZnd
         fvTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177935; x=1790782735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=Lgc6ZLjxJeusXyd3EEeus6/sE1JDLDujyZs57woMUdQtc2Kjio2LZn53PlqdWY8WXT
         PtgkzzQP0ToxpHa1URnU5QbndZxyzO+oZnEWwQiIH7zzmPej8xSjBY5aySX0ud77uqtt
         k9rmz/ElydeS5nBSjOulsFVjWPNvLgjX1Cpj4tv5z5AvUTjibJznUimFF6bGEt/JYnND
         b01MckU/15AP/p7Ymcf/t4FYQM12Q30GgWluxCKw1MRqCAsPtHZfc8WLKpFviDNUoyWO
         QacCIOol8e1qIYJ7gxQyiOX1TsL3hqvUcuzvxk+OPAhBo+QpHXjDLjn6JRZO+PlIBCsR
         vWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177935; x=1790782735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=471+xwzsHhix7zeMBIIU+C2QTB25AzHe0qndhZvonm0=;
        b=dVi/Nkpn4RwoLFCsqMUTmtJ4ZGqofpPsmoyUT1dheaOMGskizMEu9yf+K0zlVixVMG
         Q/GhnFcaFVz5b8VEee1tf6pfRLeg7a93XrqwnFyovZuXbiRFPLYm5XS1Bw3N7JEvpmS8
         XMi/Ff8Q7KrpX1HQP15LZ4BrfVxHYhx9CBIuDrCd/4baz+ND7WvmE+9VWqUGsPI+psgo
         PepZYq8qpuii9VV4Oqq2eTmT9E6kcwntBx1jCZ7AvPz5P6WZ3bSwAYHdlxdoaxBWAe8k
         W+xFhBtmLwYsG8u0xY9vo+lLlxXSchItyu1057nAN0tmj5z/c1p5ycUFC03zdXoKynJ/
         WYKg==
X-Forwarded-Encrypted: i=1; AKwUvBwn3JyTGgoFGiCejjp6f26kzl/ols1/SOIrn+ybZMPgFqxUBieMLifvtoBKp/Ers01kaI32qhK/797+lOKV/FM=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Rr7aZ2jdRhEX+MdH4OlgeNhVQLp6GCEg4RAmbYIuu6wdSt6B
	vAYyXpsTo1SxAlTKPo1rlyqGiuptNhPHfybgrwEIEQo7uSTInOTCwOAmDbFUSDfzrsZYyzk8J3W
	74Y+XgacGRh0A2D68CTJcxZuRuaMMpgE=
X-Gm-Gg: AYBFou3ijnUtM+80Q/aQHVW6y/hTvNtrP75RHuNhB/CnBVR2w/3RxrbmttWLCqnM8m4
	tJeRNxeLOFGX5ckM0SKt63FDThltRs1qsaGxPoNMz2RZHFIRm7wwOBfFfz7AmrregSa5R6sVoZk
	61KONOMwrbq8EZC3GvuAiFkdY51AL+vyrXw3TKzlAwlKgvzdxXJRBeroXp3TL3+erSplQyefHeT
	Ih6oxaNA4Z4rPmb+t00Y1qJcmC8HbMyuTSVqmTGaW+22XbJ6V/2WgMWSWcGyvnUoHfq2rAmQBZp
	1DLKRBmafH7Y554Qo414rK4FX+SYcLLW/QupzFWqwjxPn78Vexxd0URL0kKu0Tg6gkwpbow=
X-Received: by 2002:a05:6808:148a:b0:496:9bf:c837 with SMTP id
 5614622812f47-4d5b3bf7584mr4092874b6e.0.1790177934516; Wed, 23 Sep 2026
 08:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-2-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:43 +0100
X-Gm-Features: AclHuK_jZZFxO2Dh2JWJerZTiWPe1oDb0kLQ1Sj5dw4U8L9ub-MiIvvivGhqr7E
Message-ID: <CAGSyskWZFfuCvvg8y+Re3VKhHWZiWrAxRkXXoFp9pgCrqxi=1g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/5] netconsole: add a per-target message rate limit
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Give each target a token bucket and consult it once per message in
> netconsole_write().
>
> The bucket is created with a zero interval, which struct ratelimit_state
> treats as unlimited, and nothing can set a nonzero one yet, so no target
> changes behaviour.
>
> Skip the bucket while the kernel is dying, reusing the helper the
> oops_only fix added, so a limit configured for steady-state logging
> never truncates an oops, BUG() or panic().
>
> The configfs files that expose it come next.
>
> ___ratelimit() only trylocks its own raw spinlock, so it is safe with
> target_list_lock held and interrupts disabled, and safe from NMI. Set
> RATELIMIT_MSG_ON_RELEASE so it does not report the suppressed count
> itself, which would printk() from inside the console being serviced.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
