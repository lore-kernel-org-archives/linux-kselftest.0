Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBD2FD1B6
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779222794; cv=pass; b=cvqj7XiFExTDJLEfAEWJnC2DIXQCKXZjojckaJIv8HsA9SJns2h/bQ6Rd8LrKoH2+mN4PoqcAKVhifuLG8EzwA0zjJ+lYqj06WPHMOLYSVG2HzeG7UmAKtLts02CRx4C6BJVe1OrMZ1F/BJe/Y+UWL+PdEekv6qcxhjse8Plv3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779222794; c=relaxed/simple;
	bh=xDYLrGydvdDUag342oQXfooXnJpQsQ+DkeB1khpduxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXw84idCsSrMNdKSqwsemr0B+rJM0bAlSOFQjQfYCV3s7/3NVaNCcb5VaYIlwquVQNyhcLi1Z5GqGPUOFnSw5LgLKWMIez76pG2LtTaAhJn5/FJfvPAKQ7PhJdTFaioQxixNhJKjSwHyINjAnAg0xmPGrIbeSu9w/5KKyGpr6go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GbCk6K2w; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GbCk6K2w"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c828daf83e2so1872936a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:33:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779222793; cv=none;
        d=google.com; s=arc-20240605;
        b=gq4ciz43moS0GRIZhXnPbCwcjmqc7A1cs72nXmvIgxR3Hg0hM+yoiImFzDl6RamcWs
         ciEL3pJbiG9VU7KfH1EZyj9Cc6d+m1vc2OF2lE0OKVcE9L5BgoAo5fOJalvsKVvSAs0e
         MxROVUAA7vav9mKJBTETHtmJcbuyIYnOt7Mv69agHS4tbsGn3AsKCDzhvOJcoeenJyGK
         W2owGFC7jIOOhrYgcEDCmVNn55N6lzmNnfnBUEKI9EWPC/NFdc5IfnX7fABQoDS7iPgt
         nMhFFEX1Mrz9cYC1b2P5vBroKkZd3AUh/h5+rHUJMCFd2GlpxiP/A/9cRRuqevugcVhe
         9CSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        fh=JyvUX3ZWJiyNIpDGv26W/CBKIipoooSW3yMEBxTyoA8=;
        b=DFpUkU216Vae6TOgQTUJ9kef+zKNnvpdr/x1nu2/gi/5+hvebaHWB6FvkB86bga5qe
         RmNlBr7p9boO1fc/6LCbsukoje8lEjvxvytvOMIpNURv1VWAPXiMhDoGm+WhoH2oU5jU
         V/uccERz6pfzvVztwoNvuTu74cx4p6Jrsi0AIGbXiOIgLCEWMnX77SSQZpM/oQCBo55E
         k6fYlhpnLgbQazkJ2rHVXYSgP3do/1YVd4x0fjYdbqqm+kVQ3TPY7dyhPnENhFWHzI+o
         EqKR3EuwSiLOVwjP1ycP4Df+spv3O7k8lBTa1xZHNVi4vfVvQ6sC1KZkRLAgax7FQrm8
         +hdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779222793; x=1779827593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        b=GbCk6K2wIXg28uwwXxFQ/qGMVCX6ONXIoZCiPgQbjF4kvcixxOK0TugCvISaRwVBn8
         XEaKbnr7nusCRAE0zxw3ejto6KlIg6puTJYHKc9jZ0KmelYXVhAXtbSm+xBKvLUTxgCA
         59oI7dztEPYmpU3AwvoCw22C5BWIj8BD3mr1SiUwS6uAUVuvCbyWQdSLurPP2Hmz817d
         tZU8D2rhpf0itdZ64YZa6My80jT5E0RHusnp9UL1jWIKWN6KZs4L3AnSu0H/7eFRDmu0
         HwqkqP5ECrzpr0MaPdNeULttZppkploMdhjs7bOf12vhIpxrDFUdi6fvRxal2UZJe1ra
         ZAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222793; x=1779827593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYPyOA3Rtu9ZHZqq3A5dveESFOwy6WeEsdfBtKhsDgk=;
        b=eGtfu86vHzo6HNX+HqPGOb/mgBjG4J4C9TZX5oiEPIOxlTDBHfj775zYp00N4DE9PL
         2DhCjp6xOftnQVSnTkJ4p0oP9wIqnEC72bH+GSa0jhxTP3ceheVh2Lymr7bl8YkUlUYy
         JVAQbTL2dSW0J5KKAzNuH9WqydWOvC5GSsVQ6i/uOZvYQbxGNj8ndSueh5CcKzr0IM8V
         JgWTw9zgUoWiiLwlPhygY5QmyQQqYI9tZdbSZKY+1D0UEbvpGpjzCxp1iirDyUDnZmFK
         MwX3B+oDP74nDU7QR3bA9NBSGMaMPeY08j8A0e9q/Bg1V2Xn9iQJCz2DIV+Fnd7DSrPy
         KrDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/W4anjRiBLfzETlwwaKmbOkQkzZLgKlNh5p2J/8T4X4qvtNAdK/bUrEuLx1NAQrs7PdtPsyL9dcRnG9/gY5rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYSGqBM8/SUFOc0G9MZAdjIilAE6oVnNTsNC9Yb1WBuPQaJmu
	ee1Gssv+kutDRPRQSYUGpMt9dQhDIrEqZPMg2cKchVsqXsjgvUeXIxmah9hxoy1KNL8sJcFmmbm
	a2Stu5oEOfB83Dof6Mt3mYSu537ugB09v+F8D8qpo
X-Gm-Gg: Acq92OECeaqukOov5YEQDgH9pcfjPFaagb+zFiDoycnv/RpodIXwVeGSh1EdcixRs8J
	AcnCZtmydSU6DPgfx9p09Rayo8yDreA9rm1ipIpLP/T7nGYJZcNqvC/Z8Ll8o79rOC+ZO9M/DD6
	cgzItCrfGrkQLNLukxh8Ll/QM8vUeTBXSLjw1sQQ1rQpeU7ackiq1kysiTX5Y12PwLglhWltZS4
	+YJP/7vG0d3W5btfZBfdEwJuJIEFUr9PjXtCSvY5tvK0wzKtsvCabYHa11kZMXlDFbjwZb5gsne
	BQK46Jz2Sbl6P80hdA==
X-Received: by 2002:a05:6a20:939d:b0:3aa:c99b:5c64 with SMTP id
 adf61e73a8af0-3b22ec58a69mr25040640637.42.1779222792589; Tue, 19 May 2026
 13:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
 <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
 <aguvV8QCxK28ZHct@laps> <CAPhsuW7Rhdh62AoceQpsfm0+kVsvz8zq97fupm4mtBEyVTkkcg@mail.gmail.com>
In-Reply-To: <CAPhsuW7Rhdh62AoceQpsfm0+kVsvz8zq97fupm4mtBEyVTkkcg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 19 May 2026 16:33:00 -0400
X-Gm-Features: AVHnY4JRRQcTVbhrcqMWkMq0TNU3br2FjZXs2xDjkFMyXvEps6l2ylKGgBsI8Eg
Message-ID: <CAHC9VhTv8sAgpP9Bd-_tZftemSVEQC5R5jkJ2mVGqiYnLj1KxQ@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:29=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> On Mon, May 18, 2026 at 5:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> w=
rote:
> >
> > On Mon, May 18, 2026 at 05:29:32PM -0400, Paul Moore wrote:
> > >From my perspective there are two different issues here: should
> > >killswitch be a LSM, and should killswitch leverage kprobes to be able
> > >to "kill" security related symbols.  After all, are we okay with
> > >killswitch killing capable() and friends?
> >
> > killswitch doesn't do it on it's own. It may be instructed by root to d=
o that,
> > at which point that is root's problem.
> >
> > >In my opinion, making killswitch an LSM is more of a procedural item
> > >that deals with how we view a capability like killswitch.  I
> > >personally view killswitch as somewhat similar to Lockdown, which is
> > >why I made the suggestion.
> >
> > Maybe I'm not all that familiar with LSMs, but we would need to be able=
 to stop
> > "random" code paths from executing, and I don't think we can create LSM=
 hooks
> > at that granularity, no?
>
> There are much fewer LSM hooks than ftrace-able (killswitch-able)
> functions. In this sense, killswitch is more granular.

I don't know if I would say it is necessarily more granular as its
ability to filter access is limited to a breakpoint set on a symbol,
but killswitch definitely has a larger quantity of control points.

> However, LSM
> hooks allow LSM policies to make different decisions for different
> arguments. In this sense, LSM hooks are more granular than
> killswitch, as killswitch can only set a fixed return value for each
> engaged function.

Yes, I think we agree here.

> With current LSM solutions, we can mitigate issues like Copy Fail
> without breaking other features of the system. In [1], Cloudflare
> shared how they mitigate Copy Fail with BPF LSM.

... and Android has been shown to not be vulnerable in the first place
due to their use of SELinux and a well crafted SELinux policy.

--=20
paul-moore.com
