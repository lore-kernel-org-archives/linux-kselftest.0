Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266E29B79B
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684108; cv=pass; b=rmy7xYKKLoWw5zf0R1DOHSKocyS43I4cx9jaJsdOtSZzNvNzQCfGnJgTlX8bunTF01OLkZ0CdgaKevOcWoV3zQEQZwKcs7kPx541aG+qjZAsEgsxaPlwlc02WiysPCtInWXj3L+s1+eORT51PgWQO2A8i67XxgwkmgJ2Ek0/gLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684108; c=relaxed/simple;
	bh=HFq2LoxBVj4fckpeZUc4HGnlttc2e083r4DQV3Ut4DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Shb3Ua1yhfXtPUfhIcFuT3eASZ0TdBn8RUpPokPm9G2jQGpkwr87ddwt05TAiGR0E8OyoP3aMA4x7sUSNMBLlVMDJ9TfuWgMv1lrywm1f8ULCzmkPvJRFBSDF9XwOHj7hvzZqg204g7aGV9uGv0AgHyT0/TtRGr3QI5d0SLs134=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzFEWp8j; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzFEWp8j"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so1777a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 14:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775684106; cv=none;
        d=google.com; s=arc-20240605;
        b=NsjIj+QOfaA/jubF3czxggQ9hKZyuf/64ixwFAxX6icC+Y2NtpbV/Ah1CrpVu7SAN8
         AWvwb1cTRaP0fOX3SnlTbFv+8zXPxSyOik6p7M8iTrmUpQRtgigrxvQ0Zh9MgMf/okBB
         9wuDp8em8ymLB/cxSAJ7BjouifD0UFEcRb/3HvlhoYx7Cs9j1DMofc82zfakGGAog3ul
         FWAquS+i+Gi5zjP1DkV8c5Ejje1SjimFO830vih6v4sh83zvEqzcm9qdNGtGpXurhXea
         nu8+MwhegT6FRBb/ABq8gs57b9HNBW1yfMo0lF18xbX7zr9GJpdUKVL3DWb0VAQrRbjG
         pgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HFq2LoxBVj4fckpeZUc4HGnlttc2e083r4DQV3Ut4DI=;
        fh=lm1ht2+SxTZO3d1r0cbeweC0tdVrTdxioI0OsWEvGoI=;
        b=QgjMZirTZfuqnupvOKQMnfiOWHYiIQJZvtjMgn19X6tvkJnQPRId+mAdiCoQg2oKTB
         9jFhwt9myRljKRo/zmMo8GW1N/QxU4/ZDTkawD7VR6JSAZAbUs0jKZNkUIFN7ebf5o82
         4vehWngwwcBZzZO+zS2K/fUpTliRv4SYoNLFOYJTXdPWoAYg8tXmsrmjo5WYmEu4Eamx
         uQJOtNi+BbXf7Ld/MZHs/suydGu06SqtN/hOD8o18kaH+6fU/luDtxe6OuOojIVYx7Sg
         lsNXnpL7eV1uRWXqIl86Ahi2Irf9VaX0+2NEd/ANSggrJPX+4fRe4+x/1wsyE7n9fJ5E
         iL1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775684106; x=1776288906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFq2LoxBVj4fckpeZUc4HGnlttc2e083r4DQV3Ut4DI=;
        b=lzFEWp8jO1N++zFtfzyvee59gdgavzp7u/E73QKnHdJEhELkeAW4jAmAg1T+Zac7bn
         3mc01W9T9TidyFKHnzVEe7G6A2+OPwNQ9fdEcSdzOjpNuK3XQ9fdJKNY9N8LBUHTRT7M
         29BVzz0iBLkwM15m02I9ZlyuhCmuRWrLCG9a8knHBBBid1M12lxU71Bg65cKxgsYfGE/
         IvOnRfr6a4MXY85vy/avl55Ulfu9Ufu3ulxXX+DqXAJWc5k2maPsgwFt6Z+h0c6ZfK9a
         MLQU7ll0bNGLT9L6fKEjf7r12UMG/qzdYfK5KQ7K7s82FNa5puoH+9rinrojKUMP9O4y
         Ls+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684106; x=1776288906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HFq2LoxBVj4fckpeZUc4HGnlttc2e083r4DQV3Ut4DI=;
        b=rCjaLKZdo+Udr9/yGMs3WMOr2Lt33iZWjqd8Olo0pz2mEgkFwmvGt23Odqs3FWCqir
         Fvxbwu+RfOnTwLWNBavsskWhuapXOrHN6+TNEKTZ6twZGngJeJANxaU3J87QEH2H6DyY
         UaNMdaWmBqu3/FkYHZCjh7cEpOF02O+6+UQoLSk5GjKg8/5zkrfhbMId19UPAupdw5Vm
         6RGwxZc+6A2/5DiDCA8bA899SOMsIa9OIek0N1uBrooiP84BiXsFJgcGiB+ENkV8H9EH
         93F4V2st7UU4TRGbyVglhZVMNskfGEZA7V3EpHuB/XDNLXcbkzEU1heBAMRStjoTTqTk
         R58g==
X-Forwarded-Encrypted: i=1; AJvYcCWCod2/mM5K64PkgiC2sOqw9w0XKc84cKTGw9bRQg/yF3CnQwJ0IskE1gGz9tapdjs/CAnPJDanxF0Rh0q+QfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41KK5Om/1uVKH2mu30/LyxTEA++Rqs8O2uPF/jf2f9PiSfaVl
	eh4yPaeN+hyrBCe2qTEndDuGuRcQM9gdi+kELy/6+z1xrmIylRIARNSXav5CntbGFgj10FwWG4g
	kskWk5OnGXcMHi9banGyZhzPRLDllP+D2oVKmGOukWrquoxnSkvjZ2mOiRdc=
X-Gm-Gg: AeBDieuyYNXNkFCFREfEnDgw5T1Y/p9lImMvhofPOdmrwscLxYo4RCftC02Yqx1kXPX
	HuetubtePWaVDUS+zuAxcTMqDG0gxDxxzWqCEwkShug+u7IpygGiCPWQU11XNj9FtXS5IE4XYIC
	I6XBceIMAV6otl8xeAB+zgLJ55LH1ietlTCUnOcI0jylYimwAl3YFS+9Y3olEXNTZCd+ScA/hjQ
	KfQKNQPlcr2En7fSL/o5em2V1Tyaanh3zPCWCeTTWGSRJWjAiI94NHDgr6grKt8hsHrAXV9+nb4
	jeBqMKm/VZ2o77nI8bDKBHllYe6c4mjVXLS5K/zYo3R8sIAHcqS93a4obvF3ncsQ2H82
X-Received: by 2002:aa7:da52:0:b0:66b:d36f:f83e with SMTP id
 4fb4d7f45d1cf-67010c6751cmr14364a12.8.1775684105411; Wed, 08 Apr 2026
 14:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <utlz3oebjyd4lqp5pd4qdbth2kywxo4hrlrnwcxsx3br76fwfg@vy3tx5f3lv32>
 <CANkEMgn80UM7+mymVm21Q8yszgVeh029tvO+kHqmLGmf-2MU5g@mail.gmail.com> <iuhx4kkkftjx52y5qo7w7p6rbxqakq2eu74r66xaepd2p2khjh@kdhljd2c2bpm>
In-Reply-To: <iuhx4kkkftjx52y5qo7w7p6rbxqakq2eu74r66xaepd2p2khjh@kdhljd2c2bpm>
From: Marc Harvey <marcharvey@google.com>
Date: Wed, 8 Apr 2026 14:34:53 -0700
X-Gm-Features: AQROBzBxW_aF-2JywzqnQs0o_tGwjHDgVWPLHOtNwUoj9mMSKYAB7APUMV3drE0
Message-ID: <CANkEMgmEsYvx8OqCMc2BEdz_UuiJ7EE=hurV7whpN61nNGq8_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
To: Jiri Pirko <jiri@resnulli.us>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 2:00=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
> Wed, Apr 08, 2026 at 02:12:35AM +0200, marcharvey@google.com wrote:
> >On Tue, Apr 7, 2026 at 4:55=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wro=
te:
> >>
> >> Looks fine to me now. Do you have libteam/teamd counterpart?
> >
> >I don't see a need for this to be used in any of the teamd runners.
>
> Why do you need this then?

Initially, we plan to use a non-teamd userspace component for teaming
control due to several non-standard requirements, such as
synchronization with unrelated software. It is probably worth
converting the teamd lacp runner to independent control at some point,
because according to the spec: "It is recommended that the independent
control state diagram be implemented in preference to the coupled
control state diagram."
