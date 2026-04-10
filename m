Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD76335BA7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800555; cv=pass; b=cOZG0VrjpzXsOXMsStjMKFmW2UKUc3/cnSr9bwi3dlv6l0s55lEpd+b+6Dzuq9PQ49OuHqO62StdwdQ98ic90lkXM025SEgyR9qChaTg//MPW5fUXkpfp68bjGnUV54zgq+CCq0dzSSb+ZkcoW6KrATUChtEmxWnb1rVSOKSzKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800555; c=relaxed/simple;
	bh=zsFs8aJa1Rtk2clpV5GU9MWFWEtDSHAPJAs8ArTYXy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+AKnIEmVkJhoEjads1ZEVzVIa4KgSHYZBhAF8waCqBWkHHT7xdL5ACL4ms7x3JUEeKXeretHsG4xqEosik0v//vmGX78wUW0C3+beBWAMpmBgtecpQVZ7YoPk34EaLws0Ht0edgvLqZjLOGp3PJIEFQEG3IS1DUWO+G+CGSPtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wl4nAPfL; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wl4nAPfL"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-128e4d0cc48so8983801c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 22:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775800553; cv=none;
        d=google.com; s=arc-20240605;
        b=SkD6Cr7RvtRKEtOuc3UCzntOm8ngPn2UXweIDXg5TAX5Fzk/kCi+Z79N71oZ9PZQa7
         p+MAlzYoqN7ZVTXiErog02sNk8owlU1PEU6XvzDf2mzfl9N0ApSsTvU/SUkrY8SJl/qq
         XAJ7L21oTSC2S0VNm53pBAHjMNEpPpxU3ByP3Q7c5RRQamQ297siwQ3pGoQ/5ZnNaNH0
         3VaUcqehx/NTU6bwpa9tQZuIHrxfFI0C6MF+jM4k/l/wY5A/gw62xrBcz81xACrO+7F1
         Uf6G9WcBx+vaAzPuHX+8KZNuxX9ZTJa3nXCDmVfD1So264ebSZt1i1I0Z70Zl3D/beHr
         wgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zsFs8aJa1Rtk2clpV5GU9MWFWEtDSHAPJAs8ArTYXy4=;
        fh=v7Sqb1qFLBbTgmawirSUGKTraSCvImRjFTIwHkmDM1k=;
        b=hGQT6qFXAfGFbQFm5WGqdrNscm+f5sTDk1HzszREWgjbAO542xzXcEFWhmAYuFODCM
         xWfj9zLW5WUBE/2UBEPlCwToYKffkfGLkar9YoTpODOwmk2BpkM/B9snISWcui87tDUP
         8ojKpUI9AD/+iJ9xuKjYDqCrNGGchRFGRN18OZc/waNRW6uqAVx9e7u09R6+JH1NmYNP
         xavnCjoV7eQXlybckYKnY7z0CPBunJWvd5QnVv3OZLEdfmBE7oeDsyeg4PKHSFoNGVbC
         MO4srklfVtaZdWOMNK8dX4oPHBjsDv/apyhiLjNrT1xvH6z5x6ywYl/AOb6Hw5L2fZxk
         xhfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775800553; x=1776405353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsFs8aJa1Rtk2clpV5GU9MWFWEtDSHAPJAs8ArTYXy4=;
        b=Wl4nAPfLQr3/ney5qrERTfdWAvnl+GMlJ3Pn/CPOO/72F5P9uoa/YuisRqZ3+kDN7y
         E7v0PUZWI5LaRDs2ibVsSTpM87PiFtuJpk3NsRQSav9gFPWbD7Yse5uMisXNNLceWZix
         78xgFohJ2U6csys6sZ0y2RjBpAffkKq0DyMOWDYoXQqAEbjWNYn2qgXLs+ySf/bfJJLG
         GzIzvga3sHBEcHNs8W5ngsLazFxxqcGa0qxPuxN3Dk/ji1intyAP/kgw7cCPrtsn9qxt
         HudqqN59uxX3nBERtgZoS1wqdCrmB4u2ZfOFXHhj7BWzOUsp9/DkG28eOjs8R3Lsoo94
         h0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800553; x=1776405353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsFs8aJa1Rtk2clpV5GU9MWFWEtDSHAPJAs8ArTYXy4=;
        b=Z6+c057jGD/ROarlVIyFx7hYCdSd1Eq+bI/BBQSOvQEzRy9I0sd/1BmxzbpEQJ/vd9
         Hj7i5gnmemxHEeCLdBaYyJZaDb+W8KEm4l7vK3U8ZrJBchK30rUJBKT7mznsCveyLozu
         8pcvlKc1O8lzBZORWO6oYVJyqph52umzZ0i3ASaZH7kusd6l2bLWUs8e4vRI1okjrKC4
         FFGPH48t8XKjgU/gXdjIMzdJ8zvl/awVqzpjNu/JGO2fbQQSVm1MMeUm8EfqIqf0ztiz
         Ir2Q6O7zS1/v99YmqO77ColAIMM7QlYPwo69MbUC6J2dupntlV9ePg9XQ3h2kLz9m1em
         bq9w==
X-Forwarded-Encrypted: i=1; AJvYcCUSb7nPeqP5H2EDvPteWi/ZE7ZseDXCscPuqk+oMfyrqru1VxDUS+pVjHzVK+b0iPYw7FTAuwFnuHw5BXwfmhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYHBTWehEa1117nopsKYrBwGIpmHTmFQnyBOnNEFB67LwXktFR
	0yn7nuOvLbVCaK78mTRlUnyEfrPtEboVmkuHGUQrinAtUjKfiV04S6oHyLZRSiIqItuUzgurI1M
	6GP+wyYZ8KCoDY7uZCqvmYTVYH41MevTtSUzoM9pN
X-Gm-Gg: AeBDiesIL9HPjR6egZXYFkTJ8Za0NGE8mvbvPKyfzgRB6EI0SWPbyTdrH2tOdnwfWly
	z84FSzBuaeiaJ1vCMP3y/MOeah7vaZW1YWix3L7wjqroeyjsPUMUD9MsmXnv5Kwn3oK1x5jKFRr
	rNLzMkKPazkbAesO+kJr9PLhukhavBpndzAc3UANC2lV0sq9DrpwqjCkQWS0x1mhHnLFaOhOANG
	3wd520O+g1pWaugOHvOg2AGBZrUMj0yAx+AHeGJd05mTLWURDH2fh0G7eYphwagoT/9A5oZ+WhS
	A/uOOY9jMj5squUCjd0YI8E5/U5riVg1TjvJxG3522GmxnsX7nMVnCgxgMFZpc0hG++A2x2+VNO
	/c7yzN20=
X-Received: by 2002:a05:7022:fb04:b0:128:cf70:9042 with SMTP id
 a92af1059eb24-12c34edf629mr1103279c88.18.1775800552143; Thu, 09 Apr 2026
 22:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-1-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-1-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 22:55:40 -0700
X-Gm-Features: AQROBzCzBsO5UytFkgNpaNB1wf3i3tkTQw_2DlCMSHnBaWMLUNQ--w7P3T44UD4
Message-ID: <CAAVpQUBykySBCZ-d0oGzKoNAA+NmkHgDzFwy37ON=dYpXEryoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 01/10] net: team: Annotate reads and writes
 for mixed lock accessed values
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
> The team_port's "index" and the team's "en_port_count" are read in
> the hot transmit path, but are only written to when holding the rtnl
> lock.
>
> Use READ_ONCE() for all lockless reads of these values, and use
> WRITE_ONCE() for all writes.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

fwiw, Sashiko's review is orthogonal to this patch;
the comments are for the existing code before this patch.
