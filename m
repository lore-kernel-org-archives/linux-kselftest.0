Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA434A3AB
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540490; cv=none; b=C3irWc4qHbUwP+SR9Ro8uao45MUeNF98IXLKSoYZiMQ44qNXn2Mok5w+l3r12PTRtJ1pppfI6/RS5Fh3WPuL3ZnBWvzcfC2SNuJgHVwgVX7ebLGPVeT7MbOTU0yyl6UYAtfi797IQcKK3UsfkrJduQLAGXqLFJxO9lIN1XUJNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540490; c=relaxed/simple;
	bh=DXpupB38s8rYIfqpywvuLMoOemBuRPH1ZKJ/GnBLssg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eoc7RcscrvTflvCq6cXa9scj50bSYdP4zot53vZ/v/EUu6hjpP4l1oWWS2R6d45wMBnPJpxBHlpU7wLJ1XyUxNjKvFCj9PJFFR6IbZruEZWroymsXtEDKWgLP1R9nd/xsm4ieaRuadgguBomHvpjJt4/34KjjGWZwyw3LWl5xvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rb2OmWHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rb2OmWHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FC0C2BCFA
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 23:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540490;
	bh=DXpupB38s8rYIfqpywvuLMoOemBuRPH1ZKJ/GnBLssg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rb2OmWHDj9SAVGkP+qQPWRIS5gERO67XAaT7nKJyb1GSaDF7Rhz3bkkKZcnynFN2O
	 BpESD5DULHm1WABkQktZbaj1Xxl0T2Hh/JLoudPpRfOVr8lwvbtsIltKRZzf4zc/8P
	 RDcPfK+ONsysVkx20hQmchwWN1c/1MdUjEjyE18LZLY5NXbQhkm4WzP+M8+d95af+I
	 +bE9dqM3T2496fLAcZTRdVUwOOK/t7h3wP5vaHdg3S+ABfUxF/wrTSUXB2y06+oNJG
	 etmd2i99gveuKTYWERQ3m5+zS404phapSqWg45zSgy2au9SWzJds1tWazOL49X+xno
	 I8T+1gcefTmMA==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8f984bddf4eso468352385a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8V68/WqSHbJKFlPCOv8J38CSGtWZC685uI7UImfMJQjOPwBGAEVBRyGIXsRbwEM5TUooQUTJOiY+XXNzH51Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWVCGx1SEQLUl1KwK7cFyzb+jQJEf+wpCfcZYn3wWq22aTCGwz
	CQ7YeDrCqLa9gWQ/iY65DcCUc+4izhvd/NEvAtWpVdULPCmUH/B6aPSBNqNy1HJBVjDYCDiR7iX
	TLj7aqWDZ0R69KYAVmIE/mcrFLgtRzqU=
X-Received: by 2002:a05:6214:428a:b0:8bd:4bc7:e19 with SMTP id
 6a1803df08f44-8c664729988mr12314026d6.47.1778540489517; Mon, 11 May 2026
 16:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps> <agG_PZ3qcl6TwLnL@gmail.com> <agHUp8ulaWJ75WU5@tiehlicka>
 <20260511153158.bad58633e2c8d247322ebb4b@linux-foundation.org>
In-Reply-To: <20260511153158.bad58633e2c8d247322ebb4b@linux-foundation.org>
From: Song Liu <song@kernel.org>
Date: Mon, 11 May 2026 16:01:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6u-CfDx57V_zdcHVJz44WZiRmOEJkgmLyLW+YXFX+3Cg@mail.gmail.com>
X-Gm-Features: AVHnY4L8RY7B827_Xq4DgRCtr71u_nXflg9xzhpHiseLEZLbF5KQq_ceoLBicF4
Message-ID: <CAPhsuW6u-CfDx57V_zdcHVJz44WZiRmOEJkgmLyLW+YXFX+3Cg@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:32=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 11 May 2026 15:07:51 +0200 Michal Hocko <mhocko@suse.com> wrote:
>
> > > 2) It's common to run hundreds of different kernel versions across a
> > >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
> > >    requires building and deploying hundreds of individual livepatches=
=E2=80=94
> > >    far less practical than a simple sysfs write.
> >
> > LP is certainly a more laborous solution.
>
> <another please-educate-akpm email>
>
> Does a livepatch *have* to be distributed as a ready-to-load kernel
> module?

As of today, livepatch is loaded to the kernel as a module. It requires
kernel config CONFIG_LIVEPATCH. If CONFIG_LIVEPATCH is not
set in the running kernel, livepatch module won't work.

> Is it not possible to distribute a "livepatch" to the fleet as a single
> string?  Send out "make function some_bad_function() return -EINVAL"
> and let scripting on each machine figure out how to locally write,
> build, sign and install such a livepatch?

With CONFIG_LIVEPATCH, and with proper toolchain and keys,
this is surely possible. But I guess this comes with some security
concerns (sharing the keys, etc.).

> That would require that each machine locally contains enough data for
> it to be able to build a kernel for the currently-running kernel, and
> that each machine contains a build environment.
>
> I *think* this is feasible on distro-based machines?  But perhaps not
> on stripped-down hyperscalar boxen?

Do most distro machines have CONFIG_LIVEPATCH enabled?
AFAICT, Ubuntu 26.04 does have it enabled.

Thanks,
Song
