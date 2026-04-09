Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146702A1BF
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 01:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699411; cv=none; b=hsxUdOtC3xmoE8byPKm8UVZLAQs9QAYDlp+LWxOyrxhBFwCwV1uyA4m0SZiCEv7HrzgFgYx4XkbXyX172GvyBmoppc1O9umlZILqTHt9QEg24WN7NC2MHEoPtt4uQL32/gZuw73vpUxzm5wXShIEj0ugqtfb+kTpvSJ6C+BXKmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699411; c=relaxed/simple;
	bh=GhfndPD4+OKCpF/SdEHNOJ9ZS7SHzh1F9MEHZdeuVuA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XQuts5Kzpn3RjFKBAN1hc6FJgHlMoz9Mrk+BNcf+stORJ/8YAbywGrJTikdV4+Ud8jCK2A/1MEw5XWIwGa3YAdR02xvKbwmTSyNTZ85vs9Na5ArRMcfjRLQVIzNFlgIb8LD54nQJ0I31b+gePYQwvNsOxrSK9ZUpdZ5TEWEzuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VY8M9GRs; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VY8M9GRs"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c741b950511so192847a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775699409; x=1776304209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjzeQXG7bo5x2g7969Mw9H4IWYa/nql9R5zj42Bkizk=;
        b=VY8M9GRs7Io5RZqFoYkZz+8toiH9N9GQswxQTsvSAF6gObNlV/5tyIghwj5rPMqHOO
         4REWq4ojnx0X7HHIrSGqVdeEJMvyKHJlO5ZMvCisReqVWCTBOM0zyr1nBC4or3HB8ElF
         Rs91UhvOIEPt9R3+DVRFbG/rxYTQqEc9qJUpuuICDwyd10C1J/wXSUozgG5/vujfFPHt
         OkMba0Yk7P/opfo8RYv8pEwz+IpdHKLImS0XhU8P/FlTc7ESYwoSZzGALXKb6YEkL/+z
         KwgFnOetIAetzY6n6eHOW2kL36LUGW9jdPhFGPdGinhvHquZ35PPUb3fFnLJk9q7mUsS
         776Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699409; x=1776304209;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IjzeQXG7bo5x2g7969Mw9H4IWYa/nql9R5zj42Bkizk=;
        b=R+48NCUnzdq8Y3p3wkOTS+2pNNfKZsCiVVCRjKfeFzgkBSaQrUMHATermIs/E365WZ
         URIZ9lXi89FB7qaktEMW0YUpHGyewRB0RFAnkfEQZmM0J+u33nid9QstbOZExxrGEuUd
         rLaezb2RFHSDUCvYeFm2Ns8VTC4bxQ4EboxVw9YTPe5fOZ1pFgP0e/29CtfUhP3PU7fd
         i3PVmZmrQ8b24xJRiLhb1P8v+YWHpiLUWwBy9zfKnl1E+owK3uJ+2ewPn+ZfHi9ibXOE
         wrgi7g5cN1KB42U3EVlFR0D2LknPc7iAOzfxMXFLy3gpDU3JFdfIg9MHw3rz3YrUdVJJ
         p+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/UlHzznzyh+dMRrDhyVdtJ9NCfYHqxWt9KhBn/bg8DtIqbGYkRfobZovcL8/54rr87PqWLiIrEb1PhMQqoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YymTA2NoCYko9Rj/eEeYtm9+4buxYFGwo5M2pUl05JYAB0ro2Fc
	YImYnWsV9XaBM6b8k98V60uqUhLqiU1cinARNYGSBG0vAmYrrrIRna8ts9vFuiK3oNNPN+UukK2
	J8I5klg==
X-Received: from pfop2.prod.google.com ([2002:a05:6a00:b42:b0:829:a228:6330])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3946:b0:398:8f38:441a
 with SMTP id adf61e73a8af0-39fc7ba75d7mr2248165637.0.1775699409147; Wed, 08
 Apr 2026 18:50:09 -0700 (PDT)
Date: Thu,  9 Apr 2026 01:48:59 +0000
In-Reply-To: <CANkEMgk16j2xzQ85JGQ4OWqeiwiVO5Gy-UfkN3omKkKizpLxiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANkEMgk16j2xzQ85JGQ4OWqeiwiVO5Gy-UfkN3omKkKizpLxiQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260409015007.3741559-1-kuniyu@google.com>
Subject: Re: [PATCH net-next v6 00/10] Decouple receive and transmit
 enablement in team driver
From: Kuniyuki Iwashima <kuniyu@google.com>
To: marcharvey@google.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Marc Harvey <marcharvey@google.com>
Date: Wed, 8 Apr 2026 17:10:05 -0700
> On Wed, Apr 8, 2026 at 9:40=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
> >
> > It pains me to report on non-debug kernels:
>=20
> I'm sorry to have pained you. Despite my best efforts to run with the
> exact same environment and conditions as your CI, my teamd can be
> killed with "teamd -k" but yours hangs (both are version 1.32 on
> Fedora with the same kernel config).

Considering the subsequent "kill" works on the dbg instance (thanks
to 2400s timeout), I guess teamd is somehow stuck at SIGTERM handling
removing team devices in teamd_port_remove_all().  (SIGTERM being masked
sounds unlikely)

https://netdev-ctrl.bots.linux.dev/logs/vmksft/bonding-dbg/results/593802/4=
-teamd-activebackup-sh/stdout
https://netdev-ctrl.bots.linux.dev/logs/vmksft/bonding-dbg/results/593802/4=
-teamd-activebackup-sh/stderr
---8<---
[  759.819815][T21724] test_team1: Port device eth1 removed
[  759.822323][T21724] test_team1: Port device eth0 removed
[  790.615687][T21728] test_team2: Port device eth1 removed
[  790.617445][T21728] test_team2: Port device eth0 removed
---8<---

Adding -N and letting "ip netns del" release the last netns refcnt
and defer device destruction to cleanup_net() may help.


> For v7, I=E2=80=99ll invoke "teamd -k"
> using the timeout utility, or just increase the test timeout.

+1 for the latter, maybe set timeout=3D300.

daemon_pid_file_kill_wait(SIGTERM, 30) * 2 =3D 120s, but just in case.

See these files for howto:

  $ find tools/testing/selftests/net/ -name settings
