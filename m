Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080239B972
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 18:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782932008; cv=none; b=ZblyrZSUETyKrMHyJDNIl6k5MdpCMHbyHFrVStNX816pRNsKsI8fIGDkSYCgABXboTCx2VpTF4OWYDTzemBbp5N+FSz0+GI4yOasF4K8EzDaKpn2qTcYprbW9bjf/8R+Nf2WgIFNTh1nFYJOZqIYYz+8wfqCcnKM2GeK6Zw18Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782932008; c=relaxed/simple;
	bh=zpZx/8GKHBXgDfwh+pwBktW/ySFc9U22KLT7noierXA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Lt2JuiUAvUIJYc5DB0OhGoElPej3C3bAodWz+DUKtI+veKgHDu9XAwoPkYvoWKHmb/NMFNXXSfY3WNqf7SllgucZfgp+5QrQLItxP8+E14fAehtM7YEp13ZiZuUvR16O7/MwRoAhEonFDvYetJzEib1PMoblfpOu+M4ZGnVJi6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk+5JXqu; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk+5JXqu"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a3110f34d1so90427eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782932006; x=1783536806; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpZx/8GKHBXgDfwh+pwBktW/ySFc9U22KLT7noierXA=;
        b=Gk+5JXquQ6SVEb/naOIAnJ5/7tCBaMvlp7ke8fR7pl08Vhl9PlK4yk9LWS78WAKawD
         eu+T0fXLFZ/IItR+f28tKvEXhDobK/dOtP4LJrjwnXMpD1vDUoDFP1ssHGp6ALzlena3
         Sf5s/5wD7yBDi/hjsrt2GgRLZ1E7MuS6DQSn4/curbmLWDpt+Vs8t0TxA85+3kJm9Vjn
         23YLHRbyQGPVrrNMfGFW8ht7Cij44nDXRxJUBvEKPqmDcEVn4AAWALIwGjdzQZXD+VHg
         hqi1IJSIQlaWuXCQ/+TZ3pOblQrFUy2OTVe8yt4Ggw0tL5uWbEKke3T6x3f5QAQl1Q4x
         tQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782932006; x=1783536806;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpZx/8GKHBXgDfwh+pwBktW/ySFc9U22KLT7noierXA=;
        b=nG4vcp3eDK2CRwq/OLiEdWw8GppOld9X8t0+HOaDPQuA+Wpg9gHvIy/lI7eA/BvUFM
         GduyBY1reBxrD6TotPs56YJAUqpalHcTc3pHc7wubzjefJsPcSRLgIqi129C8SSRE4za
         grY5r5lraDbiPlJJJ6I3j1g4S1x4YEk5Vp13iLR0YtbLFBT3hBxMpgTRyYkuEr/9eh4y
         40SkiEq58QbyZ8YL0krQBwioXwXolPr9UbNOlAWz4UwndLjm5FpbI8WsROOnWNXSeWmE
         sajtDxz0i5pK3H1GjPEHYC23H4vpchGcHqfczMe2Ncly0yTdh0Ejd+bsyboetncwO+Y+
         8q2w==
X-Forwarded-Encrypted: i=1; AFNElJ94o2Muj1mKW//VcgjXwSb5gSxRiyO38RT7mPCD6128AM1AtGTOUfCw/OwmRv3YtrSYuvKOBphxrFswGxPJdto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4LvbpXXvIIKkmHOcAqmEXi16ixR/peLQHt+CNpqdXo4N28gN
	nYt7zjl9JPgvj+svQ28tHbdEmBxMEZ+IE1Tk9zUjozPLBdWYMZ3De3Vt8ZzijA==
X-Gm-Gg: AfdE7clYuNyQ+EwApN9jkB3bDm1QlRrDh1lXwaKaGw5Gqyjf0QDyeV1ED+iIR/GuJQ8
	WE4l7BGaYIVKlMWQZFM7CRFHx3CvWf5LT8arkGcg7nd/rgTN4HHMGMyHFAznQ+5SGhiKeJVs9+K
	/PvxK+bhC48X4IIioAZMVFPNO+Cv6yv30HpoxaO73n+ftf1IDiBXGIL99pvBKj0T68qFnjPc2Tf
	5DwU0xw6UBQF5EmjXLfd/8EANrH8Hb6Y4HXrwySrn0rJLyNmz/CG3pmtKDlwre4PxOwEHl4ohTl
	zJCrAPb6SCCG+pgvsJOBKdfsgFHM03V256KzoPNw2COpiksVsKQ6JOg+fOxnM3agBk6bV5vUWfJ
	/vr4OKGs6OCmfVoBmZULgBYy7EzCnsBccGPDRE/QmAjfaKhuSE1pc8OrLcZDaS9sw3dam4ssKOs
	ieW8YQUX3LsVJH7772GIlCmmEz+lQY0GhVPvfEaiKySIPdow2S6+Ju0BjMdUK1xi2d063rHGs/A
	ZbMdo0=
X-Received: by 2002:a4a:ee0a:0:b0:6a1:57aa:289d with SMTP id 006d021491bc7-6a309a031e0mr1581503eaf.30.1782932006353;
        Wed, 01 Jul 2026 11:53:26 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbe841573sm582006fac.4.2026.07.01.11.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 11:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 11:53:25 -0700
Message-Id: <DJNGNBR6I841.3Q0PGODYNDSFK@gmail.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>, "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 2/4] tracing/probes: Compile all fetchargs into a
 single BPF program per event
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Steven Rostedt" <rostedt@goodmis.org>
X-Mailer: aerc
References: <178291352217.1566898.14481561093843379745.stgit@devnote2>
 <178291354144.1566898.14374948740441958770.stgit@devnote2>
 <DJNGE5JG5ZY4.FEO5DZ21TL7Z@gmail.com>
 <20260701144726.0a5f2204@gandalf.local.home>
In-Reply-To: <20260701144726.0a5f2204@gandalf.local.home>

On Wed Jul 1, 2026 at 11:47 AM PDT, Steven Rostedt wrote:
> On Wed, 01 Jul 2026 11:41:26 -0700
> "Alexei Starovoitov" <alexei.starovoitov@gmail.com> wrote:
>
>> Nack.
>> I really don't like it.
>
> So the nack is mostly your opinion and not technical?
>
>> There were days in the past when the kernel generating bpf directly was =
appealing.
>> These days are gone. Performance improvements for fetchargs is not a goo=
d reason
>
> Why is performance *not* a good reason?
>
>> to add all this complexity and bypass verifier checks.
>
> The code lives in the kernel. What reason is there to add verification
> checks? The point of verification is because we don't trust user space. W=
hy
> do we not trust the kernel?
>
>> bpf insns should come from user space.
>
> Why?

because I see this patchset as pointless kernel bloat with the "help" of bp=
f.
Hence the nack to avoid dragging bpf into this.

Call it philosophical disagreement if you like.
