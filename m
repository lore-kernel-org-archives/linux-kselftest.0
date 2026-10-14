Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7B40756E
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997290; cv=none; b=MPRJp61iUxp5i5Fqu5+g8c1MTI2GdoscnFj4KdSvDWEhGqufKWfh+qObuqi7tVVjmNj2Xir71gE2qeIDkAQuWj/ElEY02jenEDlTI9nQqEAomxJNaTuJk/4zQ/58YybC2oCLiusIfZNuIcMKxSvFvAuoRtFs2FUZjja7mKx8uSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997290; c=relaxed/simple;
	bh=Kdc6yC4xRjvpZvivtkFQl4egG4a2TmHEsEe5UY+hyoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cx0zjG/hFPUdeJVXf8FP1oZ1WZjzzMyCAjXYmQtHbRxut3XzNul0AL4jpTBJ0Vubryg+jf2KN/QwWQsiPKmDBvT4O+CcuCVphfaOvG1L0DZNBMULLkneqK53MVLouSOcWbE7Wk2T1PHRh5Wvici6MfYjzJ/C2VoYJsT4hIj8/2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h6q7gb0G; arc=none smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h6q7gb0G"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c3ee4419e92so1263866b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791997286; x=1792602086; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/J2ax6te+1JRzLcB5oiAyce7s6PHnNfpG49L6qJGy4=;
        b=h6q7gb0G4wssLqfk6dE+m6Z/SPXkJjl+2UQS9uiksU+/kBK1ch4j+i0UdtWBBVWL8w
         FeTqf2CqVIMNLGu4n1OjE5ArvKp2csLPtiZXWlUBeMJFJ/r1o12NgH06hBknXoev31mq
         C/tLfb8AyKW6HIKQi5TA1qfHw9n5tOoO1hpVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997286; x=1792602086;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/J2ax6te+1JRzLcB5oiAyce7s6PHnNfpG49L6qJGy4=;
        b=wvrLZWHmXvf0NtuLCuOEGFB33/IirSAXtg2y2gk/MSrtUI7iegoRn0/aFT8J0cJsVL
         Bph2UvPXQpKXN2q2VZgezW73GjAvo7Z3rViDoBxlF6XdPvI4+7oPh3XTjsCgWswnKlKg
         +C7bLeb7kdbtXd5xLd8nvt5WzlcymX47rRqSDzOj8QYnMyCVsT+C0gvkJEcZUQ65Z7S2
         hrSe4Zi61YObOr8x0bgRhAtUU1NP1f3/PigdMg/BaGfcdhnknBPSu/bXo0ZYuT6Ej1fe
         ruHJ0MPCGNnWCBlLj8O6EwG0nK9cC0ESQwXkSdvCkXkQSaYPiX1v5Gr8k92Q6mLhmseb
         xdoA==
X-Forwarded-Encrypted: i=1; AKwUvBy7YCy3Ac3fxxaGqwlnPhZ/py7DEj/QbEcLJ5p5vz9I6VdWmK0OIAyrPOlPrGthDghbeh1nMDIzBT0Eu1fz3QA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSCkDz+QzGo8oys9HBWrCKyIFsc3jRtHTC0EopuZVJhImeNk6v
	jQZIV14k0PiWiflwlMBMiu95wilGHlgJuQnrA1JDgJzdAP2XF7xZsBqe32Hj6flA648BC2zxH5j
	Om6klDaH1kA==
X-Gm-Gg: AYBFou3bWZMGo6U4DVQVTcUl1B737Qi0ecdlxTFaBfzQpjlgyETdRZgQdh9MneKD+yt
	LJIN27AJK1BxSfXvenoSrWozBzCm4VPvo/TU/Hkz28tL8bTDnwqX0mh8xEG40OWdsf3UtRhRgDg
	1rG0hUziN5OLRWZ0E9xbnGoicRdNAYNKf1pBntkXaDX5AZdl60YZEZQVBbLwClD+GyRJj7fhWiu
	WbeU0egz0MB3Ih1BW7rxYGweAZCRATdor4EereZTjOivtpk65OPFhTh4wxnO9ho0DIALlB3dcQI
	oeGDEmcy+a/GpQVHtzbsz1fFIQmg2mS3CwDKBnptH10GdcI8lQ6NkEt58nNIC1jMr0qqssXNQn3
	lVfyro/KCVZXrCpUb1vhVld+9HvPD4Rfu7LYn9aBVm867vwMiGmH1NzNuURRx1MPZHjPGsGTJzA
	Rh+y6TPnWn6fgoIEG3trgnfgmDky1oHg3DmXM5ylILPKo0HI8nssZMOJZkNNJUMOhfx3xhDlZL5
	UY3XPOVPlyPve+35vxdX0EFxPYsezj6BuaeaDDGInx1uE5goFtS073GYGg=
X-Received: by 2002:a17:907:d89:b0:c2e:2fb6:ff37 with SMTP id a640c23a62f3a-c31a9d0eb16mr1498859966b.21.1791997286585;
        Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed2e822f6sm8650766b.0.2026.10.14.10.01.26
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so774752966b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:01:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPVzzqPG8dAfJTBhgS6wTPYytfogzWaAgJO24ssUtVP9ftYyVK8sTFzfswe5CTHTfKkB05Xkf4FcTuV/ezSk4=@vger.kernel.org
X-Received: by 2002:a17:907:968f:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c31a9afb3b6mr1614699966b.14.1791997286294; Wed, 14 Oct 2026
 10:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014160144.1835860-1-jarkko@kernel.org> <20261014163550.GA327771@quark>
In-Reply-To: <20261014163550.GA327771@quark>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 10:01:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7cq3pdpGV4mnErRqxTmUm2UA87+v4N-nni2tQNw6Bkg@mail.gmail.com>
X-Gm-Features: AclHuK9QDUgl4J1rJvqvCYjnkQ4RS2QijjPUkASw7HMcAk5l4Pr5JiIIEojmQ2Q
Message-ID: <CAHk-=wi7cq3pdpGV4mnErRqxTmUm2UA87+v4N-nni2tQNw6Bkg@mail.gmail.com>
Subject: Re: [PATCH] lib/tests: kunit for associative array
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Rae Moar <raemoar63@gmail.com>, 
	Ryota Sakamoto <sakamo.ryota@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Kir Chou <note351@hotmail.com>, 
	Petr Mladek <pmladek@suse.com>, Dmitry Antipov <dmantipov@yandex.ru>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)" <linux-kselftest@vger.kernel.org>, 
	"open list:KERNEL UNIT TESTING FRAMEWORK (KUnit)" <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 09:36, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Would this effort (and Linus's effort) be better spent on converting
> keyrings to use an rhashtable?

I agree that it would be lovely to just get rid of assoc_array, since
this is the only use for it, and no other use has grown in the (many)
years it's been around.

                Linus
