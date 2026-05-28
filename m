Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF62E2852
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977254; cv=none; b=Fk9IGEegOLGnDEPSJbYV6DvpaHHc63w+Q/0/NHrf5jK4bOBg6RA4G4lPd6Aq6CGNjGIigmjFXiEPF1bUzWfe3DdQ4IWuAt2Jhj6w1DTaPFTs/Fv39Blfkl22osaMWnb/iOyK49hVQ9+AmKFn5gxnxc5gsQXmOiLJnO+dT0RVGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977254; c=relaxed/simple;
	bh=2pkvGxgADbS7lN7SVev/d7FTofxmy+WcMJdhfAc2WkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DscL7Ua5dqoYwkp5qcCOaSjIiC2agp/T7FT/pB4GiV0WRLXeRjI6wtMD/UThb5ZmzmzHdlpBvdZAtusbYxjr+RQdfnPqf0jGBa/tHBqt5NPMkR7Sv1X8Wtvv3WIH9SNdPx7AkcNPGzsWdpdsZzYiVi3pFPam9fLsuVr/FipXqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0kmtYDF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0kmtYDF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68ad1e513d3so1568580a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779977251; x=1780582051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqwQ43i5UxZnypk4nLtxsv3svle94X+tfPaE030Lwh4=;
        b=S0kmtYDF+9wzUWTVK/IVqBoO49W9vx4z1IctqLO7EV1jYurGYHpEnFMeUZRgDHTZN8
         JOgY1gFpaM3YDPjg70hjOKMHFElGLkkJAziRdUbAJq9/5Qok20oWMBWb+RiIkM2sPVv6
         +4OxnKDlbpBILa4Af/LPPKXdRQdUDk6pfVcDVahqnq0rYyC685CeljImDjHYcM3cZwEa
         max0EUzsSgYfjjwaqraqfPWul1rwzji9zCGOlzvm7coZXptuPL34Je1qW6Yhs1/7Xgko
         5t8VJ8M7CZDy/mxBNwhpWpcsxWKBtLNqwa5YQ3gNKUkeDfNlj7NnLwdFQrAqU1uHKL8q
         +H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977251; x=1780582051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqwQ43i5UxZnypk4nLtxsv3svle94X+tfPaE030Lwh4=;
        b=QRWlHz4gRQcRA546caiq9iR/ljxHrJTDgItjAaeB9nqqwkigA2/5nrN2fDS5AkV6oQ
         evYhcGCpGZDoZDwmT4ZMqRcxTfrrMaD0Iw6e3h+R63NyNy9eA+VAKyePKuuU3nw1n08B
         IXYR7TTvcfu/Pf7WHGsVeKCKaizx2RG4286daV2JKYqcwIj9oGSqp6yiOAf1NPuU/gGz
         78F5vwxTG1fBs7CbQbty8tZuB5QJGsmVjSBh0Fie9bPhACx7UJ9P4F8UJGCVDRMMoAnK
         nyvygWp3D6n4PtMW3jRzevBUkolEFFporfTIM8T9JdgwfwoNXecXKFjhkqJLj2yM12T8
         RCLA==
X-Forwarded-Encrypted: i=1; AFNElJ9pAFUbLVF18Il3e+P76E6+ltBh4UebZ51IVhNPBoSqIJU+Gv2/0h76L9ed5mQ3Xdo9zet840Z2Xb+lrM0qnTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqhE6xeVOHX+hGxo36fKb0Zz+zVdWiiekzb2NfG49hdtQvkZP
	0vm5D3bt4ellM5OSIA0D8dVpzaRryAcZoCYG3hCkdtzmGOcVllTIbZnh
X-Gm-Gg: Acq92OHdvTUhH2iHmegA+fcrYat9LVX0kK+8KCCtUQW+N4EataeHN3vOj54sihD/v18
	8GAnCV2oWJUJu2zYwQrplntzA8qthAQX8tQ7BWE6YegclUNQnL5v04uCPSEiOW/TeZNdQ2GgB0U
	wD8A7laDkR/S4F/IpQUgzcFAqyJfo6vSGfXqoihtxCXYTre918iMWDX55x2SOdKxKxLjkBgGWqg
	EeCNS30Ef/f2FMbzQ21LZIRLU/bPKqkXDPEaDoJiTnDGYGHs0Z9z4WFKufAFS+frJpZH89pQCo2
	t0Ruj9Z8u4AgK9iXwe8XM4Og8JtmCgXZdwkv1d17pZfkQ7NqZjLbwx4OgDxrNjvpNM1hF98iNjO
	3BWXEWd6LfECai+WupH0HAKwc+nfCKd/e1lB6g7hiyqyhlYClL9U033tvealjHS4EPQtUdIpBgD
	b+ufWoWjNlWLYXNwBG+fRM9alTVq5ynGSMMPRAYKr0xQNrbrxOUFNppZZCcrrod2aU/IHsbOVVh
	sCZ4vDg/XGh
X-Received: by 2002:a17:907:75cd:b0:bd3:897c:7800 with SMTP id a640c23a62f3a-bdd25cee478mr1301782666b.15.1779977250862;
        Thu, 28 May 2026 07:07:30 -0700 (PDT)
Received: from localhost (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be8a8637bb1sm45031366b.39.2026.05.28.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:07:30 -0700 (PDT)
Date: Thu, 28 May 2026 16:07:37 +0200
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, shuah@kernel.org, dmatlack@google.com, 
	vkuznets@redhat.com, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: hyperv_tlb_flush: use swap() to swap PTEs
Message-ID: <ahhL42X1g76o5AXN@arch-piotr>
References: <20260528094542.2529735-1-piotr.zarycki@gmail.com>
 <ahg_bNoktd0XOKV8@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahg_bNoktd0XOKV8@google.com>

On Thu, May 28, 2026 at 06:13:16AM -0700, Sean Christopherson wrote:
> On Thu, May 28, 2026, Piotr Zarycki wrote:
> > Replace the open-coded swap with the swap() macro.
> > 
> > Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> > ---
> >  tools/testing/selftests/kvm/include/test_util.h    | 2 ++
> >  tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
> >  2 files changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> > index d9b433b834f1..a66bc9ccba65 100644
> > --- a/tools/testing/selftests/kvm/include/test_util.h
> > +++ b/tools/testing/selftests/kvm/include/test_util.h
> > @@ -26,6 +26,8 @@
> >  
> >  #define msecs_to_usecs(msec)    ((msec) * 1000ULL)
> >  
> > +#define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
> 
> This belongs in a common tools/ header, not in KVM's test_util.h.  I don't see
> an obvious place, maybe tools/include/linux/kernel.h?
Good point, v2 below.
