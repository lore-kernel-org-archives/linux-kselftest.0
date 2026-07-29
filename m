Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E6417D7E
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357893; cv=pass; b=uPmTYb5rRgF0M6TcJNtaN+PiKp/g8+Vd4Nzc3idrVW004k4brzJ36KMD23LBpuyG5D7IrEiHE3Vsm1jzO5x6yiHYVg78fPKOUBoyv9uZevrC8lJXex1K7qGmKnLq5tSMvMJGv70NwXUfUlecsE9K51FXknIk2SPFHQ025+jZAss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357893; c=relaxed/simple;
	bh=mpdFxm3cH7x/QBy79PiEOUh91yFexqdYbtc2kig8VZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuAkXq979olRjZuDr1/FpZShQa1JCToOaT1Y/mnQMLnJt6kVqhdH5aiX5HBp5mCzXNiPbR8dUBMNHIkcSUwkSBmS4awkjUdrChKOkMO7KnatPNryxRbBnCNzfmBfub9n+BwMco9R47qSVetm/twktFYjO8bKFcNxi50lbUfZXzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=VznJ5mha; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="VznJ5mha"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1105718a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 13:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785357890; cv=none;
        d=google.com; s=arc-20260327;
        b=ZU7BP5znil1n26hE75luF4qecwAzINdP2m+UVBwoRB0kzkOxGLvYwJOzK6aQRF752e
         /DPjoO0LaR/Av3J0w5tFgazmw9OpWgObZfyJrHEjl5f8a5aF/o4M/s3dNbnXuSI4Xbgz
         uirSG1WciVP7KeDYdN5wJpIYgjqLTw22QZAPmVsUtEL3+iJPyra+myqqt1kea4fI/t88
         2ajQq0O+P+IuEtzn59b9pqxsIIGL28xKbQK1n/rnmcEZ3jr9Ts/GqVV81ueFB6FHWYmD
         JrUQa29WGes+4MAJGSv4YblippKHFGjHN3NwGJup/DQA2GOy4o/C56q5+ClwjxCjvcV8
         g1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mpdFxm3cH7x/QBy79PiEOUh91yFexqdYbtc2kig8VZ4=;
        fh=kDxSmXocuqB8A1LuLT1S//rhxuCYgU+4Rma1yVnCckc=;
        b=T1hnmQqxc6d1yuMZTiS7Uav2MnyALezNrqvpfh+18Bo7U0InwpbX5s9kq6fRxUdzVV
         33J2CDlE0/DLAuv5YNkmFQe90ZQAcRx+Ueom+Mz5LqYRX1c15B/1kQOmVKoqdcgacyUX
         LueYOShd11/c0QGteq7CnbgU9uGCPOlXsGxNh5VVjQCgAvZRSVfWYKmreb1Rm3a6f4YM
         f+UpzgtCwsN53pQXwqQKc2DKYqrcfl313acpp3PotKByQCsbsxAwMvyKJWUV6u4QZ/wl
         kzb+5I46jCKgUtvgep9wps7F0PYgvYx0CTM8HAUqLQ2vDWE7FIcqHB/up8oyCfIzfyK7
         jBgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1785357890; x=1785962690; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpdFxm3cH7x/QBy79PiEOUh91yFexqdYbtc2kig8VZ4=;
        b=VznJ5mhaOuVenHa0+vqUWserxUuKHJH1a4oHanag6byNJMex2WNKcDhRRP+VR6Pef0
         BiGgDZl8s5STfi3IOyNJLLGvRQXxtRTD3q/5BDaajGqKIC40M0KDp0OLLQQ6l7MKaQBg
         yhzkUkgzp7Q0zziN9tGhA69YWu5WaNGEzgf14FCoW7R3tu6eaqB0aoMNdESx6VeYekWW
         IkN6GE5Aea61/yRFG9DN3iB66pMLtdGYUxqZqNKRx0uLrOSBFqzg9I87Oa0VSOU1vTcG
         H1DhHUggt8WUs5p5+UhBCMnHQIPKmtaF5pNz4cglS2cjdnAk6ZHZCo2wOxeoMY3CYyN4
         bdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785357890; x=1785962690;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mpdFxm3cH7x/QBy79PiEOUh91yFexqdYbtc2kig8VZ4=;
        b=iBGM/NYvroDTmnLgBZBvzAqH/KCf5JdXJoOnf4ZshS+om95zJT2HWkqFf2xpktZdaD
         SIF3ftc0KrbKkFC/kov0AkNhWrnTVy17WZrcSwR32mCd6zgLaW+hAmlaJ2u+XovTMmEq
         8lXS8p/CpuL0KV6+BabiXvx18MfagF3QJI1fiph5gIb14aYkxj3KOx55WvY78B6VIpgU
         f7E0cP3OMFWH+0BxxFaz4lmg6POkfr9Ikl4xLEXfhMRXWGeCH7THNmqZjtGiBpoNEJWy
         knFzk8Il02/++m2fr+tMiP0tp00dZ+3plh9dc7HYihEMY2dx85rEpZj9Wg3ZJduNdMnF
         H/kA==
X-Forwarded-Encrypted: i=1; AHgh+RpsdU+GIkP9OcwhKkZf9y7Kq8eX30YNhVY51brSYU7tjZ2ihEttjJADTx72c2dzcHa27kfyiPe/Gq56jMBjsyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySvvZp/ANDXC3EAI5VqPGNw9bg2D/cDw17Krp6004shNldk6md
	NlFQJ5LIbMXPccny8BvV8UGtAPRXgsbc+ch5z+4oW64MCU8u30XihvHSL1ZTMMDltQi4h9VDjOQ
	1pYp/FlYt2bJELxzQxr9iKlEToZgcYYA3bUfQc4xSQA==
X-Gm-Gg: AR+sD102atPvyQIyNapSpJTjy7nzYT9Wp+zxSg6NXjJpGDVPNZNaGMiyxwPfA5vNcpF
	jt/w5NXzGYiIzd2Cb0CaCj9rE+cbWQEq2AiovX3//qFz3HoRk0namPlNbd5UrO6FP7WU4MgRo9w
	Y9kNGIQ7u7ZWsdlBDrb1KAr4+fwEn8glOqjv8diSYgHepVN1rKUqqqNoMGdbqR/hM1kaew8lA+c
	ekK6sq3ADeQ/Kc6zD5ET7LREJgg/EhxDFU0iwmozpk4zEmuHWkO200mgh6HOnR0OqySyn+lrIJ4
	DqfH7hxyjmtvZeEEizC3PmcnuDC7t6QTpqpPw05wKzV/inhCRliLSzCBoF8uJJMWdXAYSxhkcPg
	BIQ9GvcWG8L3n8xEMyyWfA0LRObwlHBs=
X-Received: by 2002:a05:6a20:1d98:b0:3c0:e6c3:224a with SMTP id
 adf61e73a8af0-3c8ba5d8f88mr9255047637.37.1785357890204; Wed, 29 Jul 2026
 13:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723140241.132120-1-alice.kernel@fastmail.im> <47b580de-9d11-46c9-91c5-55eb13c00bc4@kernel.org>
In-Reply-To: <47b580de-9d11-46c9-91c5-55eb13c00bc4@kernel.org>
From: Alice Mikityanska <alice@isovalent.com>
Date: Wed, 29 Jul 2026 23:44:32 +0300
X-Gm-Features: AUfX_mzxMWpvdxAVyL3h3UH1AGjypdIO4iLrwwXAqUSW4Oe4-FmUj8hDWjnsjy4
Message-ID: <CAD0BsJVqmQRz1yNKMMWH1MT+kgVEh=wY=LOTy_ObeTDCsrhHFg@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: Add a missing config option
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Alice Mikityanska <alice.kernel@fastmail.im>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2026 at 12:09, Matthieu Baerts <matttbe@kernel.org> wrote:
>
> Hi Alice,
>
> On 23/07/2026 16:02, Alice Mikityanska wrote:
> > From: Alice Mikityanska <alice@isovalent.com>
> >
> > Commit 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP
> > tunnels") used iptables match comment, which was missed from the CI
> > kernel config. Add the missing config option.
>
> It helps, the CI can now run this test!
>
> Reviewed-by: Matthieu Baerts <matttbe@kernel.org>
>
>
> But I think another follow-up patch is required, because this test is
> flaky when using a debug kernel config:
>
>
> https://netdev.bots.linux.dev/flakes.html?min-flip=0&tn-needle=big-tcp-tunnels-sh
>
> Maybe because wait_local_port_listen() is required after having called
> netserver?

The issue is hard to reproduce on my machine, but I could reproduce it
in ~12 hours of non-stop testing in a loop. It reproduces even with
wait_local_port_listen, so it must be something else. The log above
(and my repro attempts) shows that it fails in a non-first test, but
netserver starts only once, before the first test. If the failure was
due to netserver not being ready, it would fail in the first test.
I'll keep investigating.

> Cheers,
> Matt
> --
> Sponsored by the NGI0 Core fund.
>
