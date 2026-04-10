Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374501A5B8A
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800614; cv=pass; b=RB54by0o/kmeSV3gWNPZLCR3izH3GY6+swQJ9AaJMUjLWR+3xZmc3Ab6cNGuvuobNerJV/ELyc0rp3kuacMv5/xD0qBcuycRwfSz+VRyJIM+kUKogD1EO8LMD5W4pd37YmD853/LlesGilAjVfu/FKVg27JEtJUBueMnElF9TBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800614; c=relaxed/simple;
	bh=N8ZQGQSvGQrjEPMf9J0UpDwts2ljGIdnanhBZ8Vl0UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8xA/kmEmupSqdIHyrFDDT0ywhj2Igi6onqpLIxbxrQ1nTZpn04KFMKVn5vFJd8lZpHrNh0ph8BvC9+lp5C1nlPSoSvEeYa+xAYJpuByWxme7HOuA1qFVmmxXKxlT8zpzDOuZeLCSWF5VjXmIhiGdc7rejXzkXC5IHykUEx6qgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kRois+do; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kRois+do"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso2296086c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 22:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775800612; cv=none;
        d=google.com; s=arc-20240605;
        b=IYHffeKPDHOcl1nOfZNgT3M8ZP3mFeYeMpdQO3/up+s0eEAglPnHYEOJhv4xtNeHuL
         AP0DqlcF+bdv2DXXjsfwh6WCxKbaf/gL03P0VSH6jggGLpQ9Jv0HZJGwCFlKm97svmjP
         dvUHszbP20/sJWwSfuv/VLh2wDtx3capb/h6EX1OVoTtiUOzor7ba10gCR/NJePBzxYg
         ZYgK9KYC10tbb5DDUfo3GwwZeYslYqtU8WyJ9RxonNs+yW+1PR22WTEMzOj1lkzWYCSn
         71z1IIhjbvsaYF5qjnv42QbsS7ly/ge5LCKnLjBj8ma0qxNY2gLbDZv33dv6qYhmoKt2
         3y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8ZQGQSvGQrjEPMf9J0UpDwts2ljGIdnanhBZ8Vl0UY=;
        fh=KQ2bFAy77Kdea2fmyqzqBIWye+TAKppC91yIk0nfydU=;
        b=UynLfLolU1bAwxE0TlOkmmhWnu1SgL+LlnSLiMh5VjKJbxkd7lQ/80acwZVSChTxY3
         u5fs8eO5AdnJWYXPxnKp91sFje/7QF8gwS3eSfxsQ11e99wtkzsyIefaA92oU0NKjY1C
         eXnMzvcNpUWXUk9oY09au6/ocOZavE1AN9MK4urMnyGoblvAdnhRK7bb0NKg74Ehiykc
         1QNWctiOvljzXWyUcXndlPC+k+HNpADdNIig5r1pYmf0sB+6kdOrjgiOhU1mgxubXWg/
         bdzyqN8GWyzrW1qnZvnu6uJj7UTDri8pXJfoY1XeSxffgZncAXFhvc88AumMaJak5SG5
         bfwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775800612; x=1776405412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8ZQGQSvGQrjEPMf9J0UpDwts2ljGIdnanhBZ8Vl0UY=;
        b=kRois+dow13h6grNzjkNw0OkGtnJdKvLWppqu9FUpJvQlvnQG0lvl4Da2wf1lH+SyW
         8FFOrEjaXmpBJECNW2MbnEmGjL3fJHAr6RZ1BRTLD6l5MJ9E7JLDMpyKxpq0puVwhFGD
         Typ9AEgsc4kLkTWyEJJr4mqVil8hyaVU9nRnoQh5reiUFASpCzehRB2UhWtG7DkqrM98
         G0l4skZ6edxchbkmm/m9qVi5ir/hBd2uYeHnyF+ed/VZ90qWKWQCUHxnMiFh30s23TFd
         ibceQnNwerTDU6waDZV3Jly25BpMP3yKg8JJklyxctuwDKqzEWvIB3udWy8mFzWc0/4Y
         gUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800612; x=1776405412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8ZQGQSvGQrjEPMf9J0UpDwts2ljGIdnanhBZ8Vl0UY=;
        b=IdoOAaCZFs/0TuNMSiE7zgXZxRycYHsU01Kt3TQjQzVSJOI0Sb+uS3bqfJvfDNP/Uf
         KazgeAkXg0KWBi/sio+1x4UpIrdaq9gCYi0jyUDUhtDjG7WBnL+HM7NZ5+jGUgvRoPeB
         DtlRTgbSXsmhcnMWce2r4E8kxkzggNDeapE28jbHKkoVv4EKNWZkOIfLQuZyD32BXHY0
         XtuD6PW3EaVagBvxlSioRWPOyMDA0du2Da1xzXLr7TV3CeCMQztY6Qx0tlfvGb/V9Jns
         7saNFyCKrf/FCF4axQFcVg1gT+2SSikScAIMPU290OHPeDEaPnuP604k6ZCQyNQXnfl5
         TKiw==
X-Forwarded-Encrypted: i=1; AJvYcCU6e6qyTl17Yxq3oVgxldPqvwc+ApafNb20aImp9y3gnTzVMwdwqixfpt3neFSU0313na5Qmty90OxoGaoYc00=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd6KYNv5Fd0L/NJFXnFpAojz1dfzHIaoXXbBOzDOQR0/l/UJQ5
	ywvCZLnMHmgooq2aGYKZTpKcf+yLQc8oG8VsK7UsSFg8ZOUv4c+1ueMqP2aw3FCQj3kt7aGxb8g
	twcXC72QUlUZYM7l+QJ9OSGPqSejsjArzzQ0jDIAA
X-Gm-Gg: AeBDies4qfGoAt5tFl1JD9CohwiQkNii3pWKqhaZXSz2jY6fvB2aJ10q5aItREK/vO+
	RV3tyVeLr1qhSqitrTp4APb4o2pySetBjtPGcSDLC0Bzri41oy4tTFDBaA7jPP3FJRXNFchWRuG
	n+bh8dPoQoZToIdnqvzEgxursb4J0YsstyHq52IbU7QeNlH5jPtK9T+YThzsEeR/KWrHSp+8c8D
	RyoB2VOL5g77aEj5EMfv9vEN2yqZBbLhUdKviDEVIWQwaR2qhxDQF2HQiAoPySEk3i6EuKC9NzJ
	7O9U3NVoyAPDNJmvuURy4Ncl7BjHVHdvCcxGqiFha7BYENQvdEBaAOHF8tbNrboAIY1ouErS0qJ
	tFvThLNE=
X-Received: by 2002:a05:7022:6ba0:b0:128:e693:b61c with SMTP id
 a92af1059eb24-12c34f06604mr901559c88.27.1775800611850; Thu, 09 Apr 2026
 22:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-3-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-3-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 22:56:40 -0700
X-Gm-Features: AQROBzADgclTMrnP8UXh9s8Qc1opwDYT_nhwmQ7HDtQpG_4hSS_Z9EkpQPy7DBI
Message-ID: <CAAVpQUAUtPGNLHpGG9f4sOq9BsgYr4j4xMYBA3FRaCR6BPGz=A@mail.gmail.com>
Subject: Re: [PATCH net-next v7 03/10] net: team: Rename port_disabled team
 mode op to port_tx_disabled
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> This team mode op is only used by the load balance mode, and it only
> uses it in the tx path.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
