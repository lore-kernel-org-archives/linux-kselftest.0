Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5238C364926
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787112436; cv=none; b=j2DbMHa1exFtX9h7Y8pOtGpLDU+3c3GwaEzcoWYpQdc6ulsWXy/77Reog1yjtAfbTLjV3GCjhgrDJaUrv5X6OZlmln0Un3smc6yJQZob/KiJwFb5vtECQWfTe1GzZ6nH4PAYWkJ4/eA5P3lj0/fUOUnachd3ZtOT2EYtfp8O410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787112436; c=relaxed/simple;
	bh=OaLue05Oo/WlRFNgYwj+AENc6fATkJKTEEra5eECPGs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XruLDwy25kc2t1tDik9ZxyVIQP+7C5qSlDidAs6U0b/oiFgwrFzy11BcugFnc/ixfumGQAlh82O2Jpg6KIxTqykX9swLtCK3VScq1IXsAl3xU1l5Rip5zW/GcQgIgu8P2Dfn0TyLz3GNi2hCer0LEijCA0ZKV8g3t1PQu1Zkuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qi6BQL/e; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qi6BQL/e"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc149372c14so331719a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 21:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787112435; x=1787717235; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OaLue05Oo/WlRFNgYwj+AENc6fATkJKTEEra5eECPGs=;
        b=qi6BQL/epslOOoRCHlIlt4AdPQFzHG2QmL0wKF9+GTgKl0CPweGGBbvuc921jtaLbA
         OBxwVhAbOzJZ39aDQn/wH2BXf8Z25w2WeFswu8BJiMk6SxUGn5HjiKmcWTnDTXpxES82
         wt2uzal27SP+aSzfHSdSmgRH6FPHyXG1NiHzfvgOXPPJsSog8lMjkGk9dtBVqMpMJQKs
         Q/e1BSuyKIwfrZ3w8j+1HQkOtXamjHCoXq4R+UcYmWWrKQxrGB7aiSj0Wc0qJvNiLAIN
         DDgX65JHOJM+UXaHZhzC7GciyJMF/kFek7vEPOFaF17twEGSUSmwZI3wvJDwCZFCqm70
         Kheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787112435; x=1787717235;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaLue05Oo/WlRFNgYwj+AENc6fATkJKTEEra5eECPGs=;
        b=UbI9grMKJvCKuB8rNXTedImOFhh2v2rpY/ynBuvUsqg8YBicFx5WXvC0OxKBG/Um4c
         K4n8ycUgJHVefOnlkwUbaO5r2y89ztoXvq2K8EZOwPzUSCZxA8WEw7ntBZ4ZuRUmraL8
         YJNrWLAd93tO5vww62n2SMmzUwlWakYIiArPJiM4NOy58SMv0hTZ4wVTYl/hCwsMQfxy
         OchM2o5JD8yrmXHE04DHLinyWOhhdiFDcZS2MkRWb7LqWIPuayeRTz8RVmuHpAN5PabU
         XZZTpGD1EP2Pny6tEBaMIlDz6UPlE6vrfICvWgQPMqaOh/YBHdd4DtgbSJrNKhlY+8M0
         gx4A==
X-Forwarded-Encrypted: i=1; AHgh+Rphb9ZGnUY8opqY1nyoGEL6jdIK5Ea6DogzASiQLIhhwUf9ZkLvQAzpuBHzZVtx7WMkvVxlI/osUy+LXOIZbvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92XLmQnIrYdNnVGCpmczxISIfRHDmhTOm9MuqRq/N47DgiKXN
	Xhu75lnyTS57GW8uNDjm9trweIRin88YEV4j2khRdUTQdYx8zpu+wgx0
X-Gm-Gg: AR+sD10RM9Nkz7tfnBhN0tU6VMHI8RZ9XEmy/pY1BRkzzfL+jARNGrrjY/EDIEVmshs
	aDom18Q/LRv/UiXuanbgnAwronjgpAG4YFlo1zDG/A+WSi3ldHgsKXAh2dWEXryqdnVNOlnynhm
	kg267AIgbwjUidB+IzilrR5300ReWbJClSZARKgHrN4UwE2j0DWWV/mRWacO+tKEP1jkFXaz7bm
	plYPYnQ7af/yAjSqju1EkBUhYpI3OGU2Do3McJV6dJEIWkAzx68ky8UWHAbTRaYXAnetmyksXH5
	Y4XFjornqBRaDtQJrC8XotdGlSH8rshO+zR57OnyOlt/Y0yVwkuuWYno07+UtJ50sJc3DJ1ykn5
	zEBWjq1t+crdEV5wbY0Ev6xKngxyvaoewV5WVCZYnnZhwPJ1+AcP3tpc9wAFNgpTxtvHIrgPQgW
	WalvwfeSTwzDNj96pT5pt+YhNrDauY8whjBaG5X2FqqZtxx8mAdVrscsLa3nZ72k+4o/SM5ly2c
	KmjKiALQ5EAZli+
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr3217929a91.13.1787112434469;
        Tue, 18 Aug 2026 21:07:14 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cb76sm1061851a91.1.2026.08.18.21.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 21:07:14 -0700 (PDT)
Message-ID: <3409369bebc67b512257583556b02104710fcd1c.camel@gmail.com>
Subject: Re: [RFC bpf-next 3/6] bpf: support low-32 subreg scalar linking
 for zero-extending movs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 18 Aug 2026 21:07:11 -0700
In-Reply-To: <20260814231945.3884596-4-vineet.gupta@linux.dev>
References: <20260814231945.3884596-1-vineet.gupta@linux.dev>
	 <20260814231945.3884596-4-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-08-14 at 16:19 -0700, Vineet Gupta wrote:

...

> =C2=A0include/linux/bpf_verifier.h | 10 ++++
> =C2=A0kernel/bpf/states.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 23 ++++++++-
> =C2=A0kernel/bpf/verifier.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9=
1 ++++++++++++++++++++++++++++++++----
> =C2=A03 files changed, 114 insertions(+), 10 deletions(-)

Also, would be nice to reflect ZEXT flag when printing the register in log.=
c.
