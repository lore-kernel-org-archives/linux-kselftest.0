Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D103361DD3
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924246; cv=pass; b=lPwWRkI5d86gVU8OxtfZ1pbw7+pdVsZYwXotw+cAu1yKRN/1caiT39U6tDwJmcnh6WGL1iINFuHhXhhoJqnJ+048auVdt9rHpgPEEy87u7z9LF/7Z5q1m44oQtIVc4gqFGB4HR0JlELlCC6gnXAyHt6nfbjrAzkSNJNYZDZsD0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924246; c=relaxed/simple;
	bh=QFvN1zhy7bpLhmK5D0/NfLFH7PAkqmZZAZ0hZeSoKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXq9L7awUesdaDOrvTEhEJNiC3XQFMdAd0VTvVWCM+kc+aQe28fEdCRfoKjfFF02ZhhT/15G/DaZi5aR4Pskccmq6lE516g9yNrqoPW1DfdphduvYDlIsFBfSzmvahf6UKuKvY7ypcZuzHXceOBWcWZbnXeqpJ8e2bYBtiuBm/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INZiwwAx; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INZiwwAx"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89a0ecbc713so10296826d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 05:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773924244; cv=none;
        d=google.com; s=arc-20240605;
        b=HWlmvadfIKQ7mDJCENPEN2hbx/2yXSJvyLnExN7w7zN/OO1x+OVhnk7dClHeuJalh5
         6n80g9fldmZ8I/XJKxdfneF2x6FlbZlr4VTLMmVYVQ6aYiEXWzs9rmfMl0M2uggzrW5K
         +TDREtABdH6kVh5zIJZfr9OjV+eIafMZg6sW/6EEKtAZEibAgCgLwnPYjruT9jvlEMKR
         WqUJ1Ed0piRxwQzKdfY3zBDvmRBtjGV1n1MeUV12aWixm1+3eiVJkypPKlVB+i4wMNU2
         +TCpksVVIPvTYHfAA2Of6gRQlPBY2hs7kcYfIwhVrqF3hnnha930PWhs2TsRlJnV16EZ
         I2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        fh=P1x+xcKgfx4CklFmx2QARz+xNKsrN55pMusrhNnxhUQ=;
        b=LK6T4cdv+L/ekQDkGIqLNQYs/tKKAlIM2k5yJqgqxrDnzTNvD2QGKl8qROCNI5ZAji
         Nuj5/GU+l1czZGp3qLZKXim/F1iRriR9Atw/xoajn/p6VNd0HdbdZWDA2WBcX6PqBHqt
         gOE3i3LOUo1o+n+2OwBmpL6LizLiceu+Jaf9vfqSf4qI7eoID8CSOMbxlsQBFlOaCDvY
         SoR57hsNYta/iGzuoR4yYvIYozyjgoskTMGJmj8XVnfQObbVuyd/ngc2ZAPjyrJhY+t7
         1qOJKWwxQHjow8pP+vmhV/eAk/crXm+JkXiLKmMRWMXhuLd3xC8PW76sZWSzV/1tvizY
         oZgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773924244; x=1774529044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        b=INZiwwAx4GtUiX50W5yQWq33wa4+1yGB62DzNcuFsn+d+a7KNT3pCHE290eojGF60/
         8y5BmHJlLnzcpavZK4PqGsx7IhTKwW2hsAir14WJIb8bMZYRzV5KGmtz/wmaXgRyj7WI
         hPvzZSR5n66LqnNLEvSHNxXrSSG7w28KoOSt9zuABG6ReyteyXKoavXtO0pWW4PYeBuo
         MPkTOC8yDrD3oc7oPwVrSkmcyGgxFlmNfONBfFEJbRPTPMoWyGdgGJrklzkEnrmsvUSa
         JokcLHMzXVGWyim3ZtVtGtvvt+gT5DDu4ZOOJdhLXnAPm0X6lt7lYnjHPLf9/DZcx6U3
         Svbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924244; x=1774529044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mt+dE12LnYJMRrLwh3oqUH4MbsvAbhInAHwP12r7KCc=;
        b=Gs36IFofgbLNcsuPhbfseaXjm2cCfUzrAqsTy63+qNeuHyziwnia5sN1eLUdm2A/H7
         LoiD9XRG8YfEJeZdtT7nb31T7f7FliiIotssQ/gY/LFNaLZCyOQ56ZPalsWbJDWkjRYA
         4SEQTKGjHDiE7lpfm11s+QDsI2+fpOAMCo73p3XixfdBLFWy73u/0CWaBgo3Of1+D2xP
         uhU6FCcjuI2sWCFqvO3umj0bimcXtY/6C94m/vhxNLygqeu9SaZX1uaSwUMdbQ1kNM6K
         Q40V272kh09pnbKlWblLsYkMMaGV7j10z4mE/1v0vZQZcu9a9OUZQAL1uvK7hWn8Gr8/
         jxsw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4HaQRaHI4VMtldC8mE7gbEvzgqGLTEKepoP5J/tqj2dh7PgJFA+M+Zpn/+j6aKDG6VliY+YzflmL0Hz+LgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrc/YFlf06KXQmuZMtmMU6lq2c37Q/LDPu0UyP+hdkn/7gNE+
	Pg3bjSULVQ97R/xrvB3XgifJKKfZfEnZiy8ELeg3jAMmfPoh+Gv7iplbt8ZLlT+owdHE6J+TkI3
	YNBCrPwMaBT13+9hpl3XaAUzcyaK3hqzxaV4wGxnC
X-Gm-Gg: ATEYQzw0c+VccGNpF68H2ihAD7mz4hFRo0G8ONqrN46JgtmkFXIozV8v7FMN0/f/ql9
	LbG/+ChlFhhQwAj/Evi5HH87wxjgoYbq/tie6ZjnwpYZ7O4z6zYdHA1sl8GmOdJuNto/dk4a1ZF
	ckZ1HIi5iA3Hg5kFc7JRjc23ajuw9MAfXlOUBHDvlJm1AUjMgQukIY2ygyaZSyzyICEx4f6115U
	YBHPDS9ADtQ0AjasDmdYS2jmtqoexaxq6DpqSuqbKC61AyjWVKbheqllXlBnFf20Qb7SW7tiWDm
	6CIJqjhs3K1j1SIqv8U4IYTiHVZfBNDTErKgj1KHI867ALlOe3dEVOhL4r/KFemC1qjtFYI=
X-Received: by 2002:a05:6214:8118:b0:89c:4ce5:cc8b with SMTP id
 6a1803df08f44-89c7745da13mr39022736d6.26.1773924244308; Thu, 19 Mar 2026
 05:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319084347.134744-1-ben.copeland@linaro.org> <0abf3675-886e-44f9-a9f7-d9198b66086e@sirena.org.uk>
In-Reply-To: <0abf3675-886e-44f9-a9f7-d9198b66086e@sirena.org.uk>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 19 Mar 2026 12:43:52 +0000
X-Gm-Features: AaiRm52V4vyDSwCyt-sJoovR3NCZFDFql26Vy3ZgOOAZMOI-O5HJSCFk-flmp0w
Message-ID: <CAL0q8a5A9Mj4O4DKu1BRbo+JjvprZWO=XHmi71qk1n5GMvvyBg@mail.gmail.com>
Subject: Re: [PATCH] selftests: alsa: add config for required kernel options
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Mark,

On Thu, 19 Mar 2026 at 11:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 08:43:47AM +0000, Ben Copeland wrote:
> > The alsa kselftests are missing a config file to declare their required
> > kernel configuration options. This causes the utimer-test (timer_f.utimer)
> > to fail on kernels without CONFIG_SND_UTIMER enabled, as the
> > SNDRV_TIMER_IOCTL_CREATE ioctl returns -1.
> >
> > Add the config file with the necessary sound configs so that
> > 'make kselftest-merge' can enable them automatically.
>
> These tests fit awkwardly into the config fragment stuff, since pcm-test
> and mixer-test are mostly testing drivers we should in theory have every
> single audio driver enabled as part of the fragment, but that is
> annoying to maintain and bloaty.  Fortunately people usually put these
> in their defconfigs so we actually do the right thing in practice most
> of the time without the need to build a custom kernel.  On the other
> hand the test-pcmtest-driver test requires a test module which *does*
> need a config option so it requires a cutom config.
>
> Separately to what we're doing here utimer-test ought to skip rather
> than fail if the driver it needs isn't present just as a general
> kselftest style thing, I see it's not doing that now.

Good point. I'll create a patch for this, as it should be handled
better, rather than failing.

>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thank you for fixing that up. I have noted that for next time.

Regards


Ben
