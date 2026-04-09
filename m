Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85C1482E8
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 00:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693419; cv=pass; b=WnrDnouyQRQSHG16Hen/MrSUnUMUft2jPRGEO62uXe99Q7JuJy0R6zBu872NdMYKcAXZyu/XhCDtSmCa+rAqNMpF0jgIOLDbJ3CLUlKmyd58bZnU4jPL6OZStLq8GAz2/Nux6ErXSxKBwNCV/8ZvvZTfW5WD0GPyEygWkDNtbAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693419; c=relaxed/simple;
	bh=HYu8gdFcKMXVJvVw7I09J006LpciF6JI3kYsv0hyAr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPa7zMSGnCV2L8vAteCkylP0xxkeROF8DAI7jDk6fZwVphsP4ha6iovg6rCcbPvZaFzZVWVIvI4AOs5s3SeZxL5dxD0/NayrFBFpYoz00eASPpjKjrjJIrCaR5KfC1gBJU776ovtkvMiUoWRfhnPg7bq0ROj+RZT2oAu/qiDcEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vx+3caNq; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vx+3caNq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so2605a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 17:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775693416; cv=none;
        d=google.com; s=arc-20240605;
        b=gMdIjvMs4fewwOE0w8qoan39A/WOd5aif0f7useDi6gWaW75cZJz9n5aC4yymIFYol
         sgPGyzcnRj1BwyLRNXwa4che2rr2w/yFmy7Ak6HhGK3ric4AtkA7KLAACAVYqcrUsoRi
         I1m7dU88Z3YyGXWcBq0PoDQiDfimgm7l6e/TCZ8Ga0agNTFRnvIQiPGRkX1sU2bbWshh
         wk1AsxM4/kK660zuUxnyKIOu1beRQ8gmzlyOjZ40WiE6pJbJDE6049lkIN4JFpvQdEGo
         DxN+b8GuN7vJnXhc2IEBODlJ3f64cQ22wOOYKR1bJ5/NmKTLnl28ZNUU5S6v6SFwNn/N
         6l/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYu8gdFcKMXVJvVw7I09J006LpciF6JI3kYsv0hyAr0=;
        fh=n51VWi7mtl07LwCL5ovcdGImtQb0GLPPsO6kfN1Wr+Y=;
        b=AnIqrXZmE7mE1YCM4+FDJ37f4Xw3Pr2LCLY/gEjXpekvSK19Gtyfq518dxYep2eLyH
         naEevULEfB39l/CPuYC+xQXUQv1l5cQ1861SqkDvS8zz/d8jJCJWY0n66AkA/+jPJUCD
         cFj0IQOPFsaAz2ZH3VmszPrCc2otO0gW3r5K/z7bqWV/wS3BO98H4M9QAucZaLaivZLw
         EYYKo9QFHActysKZ8Dp5dkUpTHdCZUJZFSxCRjjFwh31qB3HcLPMSqyxvxvVgiqbGlpp
         nepwZfv0wDoaTlZ3EUpkiTQ6avk49KxEhztEto3AyJRvCwNHVgIHJIsAVWbpfkaq17w4
         4OkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775693416; x=1776298216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYu8gdFcKMXVJvVw7I09J006LpciF6JI3kYsv0hyAr0=;
        b=Vx+3caNq8zL2Pz4bqQJY/rU0ULYdmUeWPNLVcRZZ7W55IiRfIXU91UYesycx5I63ZE
         FRIKNDpxHK8IS9cIT3GHDAZ127j0cer5rnsyMxcemv2h20gwfcIf3uo5xdmQGQs9NZHp
         /6iKHyxivo7cIRGxS+GvTTUMQvBNmBkpWYvG9+xQ+mmQmnXImJyPl3zdkay5856XDCZn
         BW34pqlpvLZrc6TK3PaauWlXEm8ayqjskx4hJRqG6InQTJ/rqMIRawMd8o9CHCcxsC9E
         xHNxWXw642UFggX3gEw6w/9OcgHquPXI0v9JHduqjaqUjgbpYYc2ekFjYI+kPCVcRQws
         xVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775693416; x=1776298216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYu8gdFcKMXVJvVw7I09J006LpciF6JI3kYsv0hyAr0=;
        b=cqfa16RTYN+JKPqUwmT3DWPdnEd07v61FxFhXuTmDoVhVOAhKC0TDSlyFi/gbrIo/u
         9YEMVNIZQpPCX0yfQm445Py5jxPxOHDbhTA9O6s+f4lpcdWWzi0eIvr/quP7U3vwQ7bj
         VIEHXPOQXa+5dU72NUZ8IvVC/mgKWgP8if36CXF0OMgXeyjTzbSx4dm7UDqMvZyvy4dR
         wni9bskSzScjZ8HgmcbdzZoQ8NNzKtG0oGA7hYKOdUpHenAVlQ7v81MZ8+9C8rKppNx2
         UD0DfscVp+NWHNnvPaSJslA4q6s5MZ1eRPas/H7LmJbOCM0vhC+2ujboPRdhHGx4GlzQ
         a5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDRp97KGVeDXHMCQPk/yupDk2PAhT9xk6p6rg71OOqN5z8qZ6bq7fYf9u0b1tczTWQsnjiOzHtvJVoqyEGtx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuNxL0MekTGUR3/B3zPLmffiymqFCOyWqNHE+AtVeQEk1NMTYC
	GnUJBApBPzwP8oEeU2PPpqFBiSdiFbX4n2JlwqXpo0KCQCdLj5/LrlrcLjTeBtSo+Jqeg06Tg4h
	jwrkeJgegzZKSUdBfXblVfMOta4u92PCvzW8heH4Q
X-Gm-Gg: AeBDieus5XrFg+vPqVF95gFAuWQXUa5qTGyD6hk4n+D0WHEgDk5aenzi5D7RcoDVH6A
	8nDZabLxAdvDbEhO03BqFDnCas5yhuA3mI5OGPZA7fphKBEtDyjbXleiASEi/i9C0wFGrdug0+T
	YfBd46C48WvtojiMXvC8qzYLUgr/y2K9CmqZJGBMRoO/FkRpW8HvzOMKwvgt8+Cq5FOOSUXL6EE
	4sxWW4L7LnJtOGgkrxBFBRdR+1rUs0WWk3ChXqswp3uSQZbg+hZpXjOzBhSLWoPixA6L8tGRcoi
	PkghkL5ra3muIe5sVSo2ZDE4XDbK+gLWtaCUvYpIXxGRn+55i3A0rqYC8FQrYlmRYu+CZQ==
X-Received: by 2002:a05:6402:534d:20b0:66f:a171:b9c0 with SMTP id
 4fb4d7f45d1cf-6700fe9740fmr19945a12.2.1775693416087; Wed, 08 Apr 2026
 17:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com> <20260408094015.3b8359c1@kernel.org>
In-Reply-To: <20260408094015.3b8359c1@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Wed, 8 Apr 2026 17:10:05 -0700
X-Gm-Features: AQROBzBATnnO5hyX42b-C14QXLjQxO4SDa3or_hh7MHL1ydBQmMoa0JtF8_8ksk
Message-ID: <CANkEMgk16j2xzQ85JGQ4OWqeiwiVO5Gy-UfkN3omKkKizpLxiQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 00/10] Decouple receive and transmit
 enablement in team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 9:40=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> It pains me to report on non-debug kernels:

I'm sorry to have pained you. Despite my best efforts to run with the
exact same environment and conditions as your CI, my teamd can be
killed with "teamd -k" but yours hangs (both are version 1.32 on
Fedora with the same kernel config). For v7, I=E2=80=99ll invoke "teamd -k"
using the timeout utility, or just increase the test timeout.
