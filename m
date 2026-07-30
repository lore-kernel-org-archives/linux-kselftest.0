Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A745FFD7
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439302; cv=pass; b=dr8qajQ9Pj4WzOtLvTJCjZIIhUDmhBAtnBdP5TZHeHRHyfuCXyKfLqAVuxMY+kVzYifv9WwO6lHdJsMCVq7IOnM6/Ldbc8UPmh2LUy4ZAmUqpM3PY9WEbmz50PvSqe8KTD8IoQUn0zCw3IIqyIyC41sy8MC3h/2PoavVUCKsYKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439302; c=relaxed/simple;
	bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kK8nNkeHLTaaMhMxtXpz5J3+A7iKONc1od69z46Ke8YNJ4NeLt2m6HzqmSflvejzx2uX99zHesA3KyGMH+92hmT2hkFqFmy1BFAdSC1h6Jsjl1GEyqK3aKoOyb8JdgBma16tAO/rD8xMZ+fYV2W6C6peNvYUJT6RakT2QITrRlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IZL0/x0V; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IZL0/x0V"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb662575d3so103347a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 12:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439287; cv=none;
        d=google.com; s=arc-20260327;
        b=dK/BF4h8kt4S7ytjFrQ7u3KWjw244TT+j4ol47kM0oa9ZtLUxbJJuxzs78Nz3JnZGm
         TjtJJRVm8sGfM0GS4G3qDDlM8UjsamgGVBJgLbmz5BkGG9DeOLCoYddhL06Gvm1CrD0H
         tTC9B29bBeD/nvB/g573ki5x0iy4X/hQZ8o6vE1KQ7BLvr8yitLJyplzlOt0//MPTEPg
         knsc5Fj/Suwn9AzsaWbSa/E1902poQF3DvaexFgVq6uTFKp1C/PBnkiCNl3g6pi66jD3
         nZSx6tS7xWG4EpVmgkEU91KmJ+aW0zKpaG9I8a56v94a5009ty0cBAfbTfsQzpAEBiC3
         Bn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        fh=LgHjZBKrwoL1hc8eBqK4+sriSaM0ef7hPQuS7RGxb/w=;
        b=iisa3ZAVKGMPj48Ixfsp0mr0VZnYx5gf/lCCtGBBN6gOg7HjAvtOqrvQbMjJ8vm/0H
         siPf3PWqwLgspQHX6u8FhHN8m70pWtfklRgcz4vWpCJgkOl5eMFr/bWOGN8qzjioqb3e
         t/ENss3oGmfw0eIMIMvzcJTVnFEA287r5jO61zSBurp30rD4EE1H9kCAZevRCFZ0IVSL
         1sCNYbhuLOWRKMd/TfGHEAEJEeeMHTPcvgQBpiwkIRjr573BhvkL957eziMnIuEkO6Nd
         JzTjoLWv3GDk1MWhEvRg15AXPmZ5Iny4krwF0hvuZ4ymlvYJTyXucHN6i2brNfo5SfTM
         h89g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439287; x=1786044087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        b=IZL0/x0VSaKQk6CpNEuEnNyYw2D2dsV2HZf+ODTjk2jYsjOwAcADlxCFFrWAdyJSoH
         VTsMLewrgIR3HHq+vXEa03Ktx3euzzKkdsYFAKzfMd8bIFPSTT4LGEz9nGKRkLO/dZBV
         mfMIddikiA+LLfpe/i+DvaXyQ/muyZ3U2lnMj88noeHiuFHV0gBT3vPRtVr+Qs++z4nu
         zFpghyFVscJUUETOWiqUV17oFHuUZtEOUugjJhZpaRpm5RqwoyF8/rNYi4Z2RyzSbmLa
         b9i+nMaYgMTupt4hiTdACp8WgCziKKeIoDEt44y6F+dm1aUMWEdDUtmg8EY4WewBmuxR
         bD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439287; x=1786044087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZBD1SHqtJlcKiLC2CSiGiZMmgrFZSIydhySgUYciZs=;
        b=bM+/glDRkfcdvT+qUOzL//VDr3kOovCAkF8YmzmxnnyeeMSHKyEmFyv7GKKeFpIi+v
         GgNKs+x3YCt9p4lNIbYWH7ignXgN5O02iof6XYhucrD3HAWjRh0SpwLssbo1XsZU/4E+
         R25U+RjjSiYWHzdgV5Yx9Q9vYZducI+nB9CnMOjxsuGqLIh/ox4JKvKq6xHmHNaokreB
         yxh3zxjPWOIJhvdL0sJOMjIxMERsLRoj5nzov2odU9bHI+6sXMLrczupXl30J9K6RD81
         k8BphXijRC53ALVfrWf2nW35u4C/Ib0nbKXNkLsfAnoBL10+3gLS9mceayqUmfjo1OSj
         iLXA==
X-Forwarded-Encrypted: i=1; AHgh+RqYb5FTbPyGgV4+cH/Bw2u6S7zVCGZjwj+751QlVD8fGZN5xZUWEGx5A+wi/3Z80F95bW/806t/2bh13fz8Mlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YygmAi3myGGa65kh17NgHfUOs+CEswyXFOBVOZfgasIraLV/guL
	FUPusslWZx8je5EQ3wXh7ghFAlNcyexCxWw6o7tDnOaGX0r9Yk9IEZis92voDdUFsqV1WkJQmZY
	9nLvqa5RwNKMt2CbljQZAysEtfHpdUWL0CNIDRVZdPURb6Qa0rczILK8=
X-Gm-Gg: AR+sD11Hb3k+nGMhrHfJ2nMs/nVK5Sc6lMPogkwFMrB7qBD9cgfR9LNgGUm1Ua6MXZJ
	DCeswzOSSBTeqwy7ir3xnzzi9Mg+DRGtmtD82Ml9lCSQlG14M/BHTfqIGy9dc6xLz7clkLkNWoo
	OPnWV9nDvcbpYAywo6RqAvf6bQqATWx8uVxG6oXy4EaMbLoYRUjpLxptwRp5nO6Je+76rO3NJSu
	HtsYBe+7PdiNwH+ZrPCVGAN8aVUgxAWH96JtkmneeOgclv1w5qkFHlS0y5Ip9+ROLqvppQ/DQzn
	/AZlERdx1JRrsu5sHq6eoaCgKL2nbfY2KgMq43OvU9XWtg2yyCspRpOzMoDDazgJGHEWq0jOKaw
	WlZBA4Yuu/wM7K/6rj91StiKB7Cva78Nt+L6FQ7YGDBfTD/a+hYPGw3WZcZ18/KfH5C1M0kBF
X-Received: by 2002:a05:6a20:6a2c:b0:3c3:bee9:8eec with SMTP id
 adf61e73a8af0-3c9004c829emr3553383637.19.1785439286901; Thu, 30 Jul 2026
 12:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de> <20260730-auxclock-nanosleep-prep-v1-10-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-10-cd8b61229a7c@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 30 Jul 2026 12:21:14 -0700
X-Gm-Features: AUfX_mynuOlJ5_WNxT5uvUCrMzZ-UiWdhggzUU6DoJshjjJxAXl8d1BnDoH2scI
Message-ID: <CANDhNCq8vB+crFDrhwEx32M0s00VVh1wDsTbH4bFXWqtu2eT7g@mail.gmail.com>
Subject: Re: [PATCH 10/16] selftests: timers: nanosleep: Reuse kselftest error numbers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:47=E2=80=AFPM Thomas Wei=C3=9Fschuh (Schneider E=
lectric)
<thomas.weissschuh@linutronix.de> wrote:
>
> The test currently defines its own custom error numbers.
> These mirror the semantics from the standard KFST_* constants.
>
> To make the code easier to read, use the standard result constants.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weisssc=
huh@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
