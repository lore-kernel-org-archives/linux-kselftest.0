Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C3393DCD
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139788; cv=pass; b=QohKAZvMSsUGCvcNtCwEuhZeNrCsfTEv8Rru4BkR3Ce4xCjLyO/whqWFG09myd+9gTUwonSue9PBYhqMO5PacLP/8AvDQ7mJnzrtp3VX6mCkUhQtVRNcz26uAOGuIKxjKqJ2oHaorfagREUm4UFOO5ORXlr6UHfO2QXzkHJKNUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139788; c=relaxed/simple;
	bh=SuhY8F+fm25ZqBW012AWqvqRGPFgtaMFS3cO7CL9vzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBAf8FqsvxD097VJV9Qw6T440/9Yia521ElxpB6TM7P80OOLWI2Bh4Q9q9ttFq482SLE7Et9eIH+AJqVtvJ7Qa4kh+uH4uezhZFyyl423gc37SPndvs702jhsfV2fPHMLM+vDzLYkUj7Glb1bRIrwEM56QfWFWJrgzJLoC+z+Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Wdf1HF9u; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Wdf1HF9u"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba928852a5so19166635ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139785; cv=none;
        d=google.com; s=arc-20240605;
        b=X+Nz03xcIQNkCokvvXs7oFAywai/FTWPwAiArdCFh9LysznRKReM30YinqOl4XwhfV
         /7Xg9PA/uxORx2zeySIdMZ4DWiI3QTqGvHOoG8/pZ5jOtt4xx3n8pF09MHyY/cBiJ3Gz
         n4OhmiEbyEv/Prsnr7orT0TazhGZ+G6PLo6xo/LFLJtJcOM/cN8Ur+Ms9lFj28nWfWWe
         So8p5QWuaFpXG6tQslzXJJmL5eOyq4oEGlzLzonsB6j/aUbwBUSJbhAVl3kIZhjob0rE
         pS3ud1ha5nILtWgJOx53j2qZrrGGTOCCtebugRhghvixgXiFcb5wSdjQv8NBMxjPZYwQ
         tctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        fh=CwvA5lFsbineY0tMiwH/O0QLwYDusEGHLihykOfWX00=;
        b=PFW+Ly4wh3zeT+zzmFwRJ9cEZNF2fT3toCemtuxhWdJZEXHm7GvTGqgWXo5YKb6zvm
         zR5nxlgjDT+CKkyr3Vb3nh05/2HOCd7bCvXgxOMWpjw2hpQ2JOH4E5Rw+i89y5h5SEef
         SZ5Rd2cm6Np5NGNJRQCRctNUVs4XT3bN7+kQzYuZCuBN0O5fOyYPNyjvlqF3mA88MvCu
         Htf5FwEVoDLp/n9shlIAKocpc3OFTIw0saHr8ptA6p4VHqGhk24SGUiXm18YtR5tEMlK
         7clkpQyv1bi783TiRadmCCSjo9ZIjNeZIzfKDxw67tPvjsB/dekmEGgQLL39kPnmB0T0
         JDlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779139785; x=1779744585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        b=Wdf1HF9uaUpeeWtWX0qrF/cU171FPDzR/MyivbB2hjo6hdJwxJW0fp/uVgqp/spmNt
         70l1D7tIvIGcIsXT4Y3KiwGo+SXJOHFK2zMWjEyzFYpNyCw36RhtBPHp8iI8F5GUupfR
         R2YUIwCfFpCkfxhAwJoallS/sAxqyfeXPbm8FvWHtokcjJaDFE0GF39pWNaOCS0H9ocy
         IUTPtI0203HnIOs7Xw5opm7ruFc4ElAi0dI0qHPcSEpA1IADmzJh005TGO+TQZL2q1k+
         /EMtTwN53kA2si6qGqxAB92Ro3GAYmNpBFYbtECQEaVCTPMLeUCrW1/eFL3kAEWN0bCW
         4Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139785; x=1779744585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ertihrDnJ6gG2i6Oxoibdwkml/c6igydo1vaudMBbBM=;
        b=DynQr0W4+ybw1CoCHYAafZZznPxlAET9wudWdu6I/ykgmlp/NSDzjLztU1ROfFfTlv
         LiomvwqKu27yDLxqhuY9aWIrPvpLIia/fYEPYHjXfV+/ofantlqP9Q1bDVBOR7T8FQUj
         ISoMJeRQvUm4MXyx75cfbSIhsoGUxgAH3x3oaS7FTsNvAVZk/yyrSb195G+UPmpWzbv6
         QeKSov1C2Thx32fmKSZujnXn/mhnQsXUw3CGEdfBr+ofd42GObFxNZ6Ao5fUykRmtjAc
         tftsl+mgNXMsvjcgt+H4enInaK0zpQzMuYZ+u24ukIggkGpBDBgau8Cwr6M4V0W1mHvL
         0vmA==
X-Forwarded-Encrypted: i=1; AFNElJ8RfeYFjHVFo8wBFZQZZD0SkpF6QIeoRfOG6v94JGZgNltR+6b+BABSGhO1j7llqFsBlLihQYDnYxSq9mF9Ah8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzML2BGeq4i4+QB//45aR7/w8Ox3JuzVcwN4XvJtENRy4VmU45T
	Nknkd7l6Qwk2nfjBNNhyhWQwndUspdtY/yBGzZvt/mv+TP9geu0wseAbMwmmqXttLccreg6nJvy
	E4yVzExE4iiRh8TIt/cm6AsonEKBksZlH83pP7tX0
X-Gm-Gg: Acq92OEIsfuqQxJUiaMWSgwzf8a5as6SodKtCPOC96xqV5Tx786CChEKJERuKMkwWGv
	3gqyDBwp0GR2anIED0jLuBN5t+mTUEHPR5JP4queoGdf0yS6oDORXy7bWsR09/DrbPC7qk0m6ck
	RwRIZpzP8CYLLu6ptfo1grTI31bnOz8oZ50aaYnp8uG2ZBCsc6slhfnnAamXq2Ee3Tnr6xZRHqk
	ZZxWejkt+KtFitLD5bPWPmVRNiRKfaE1WxYLIzlQYZFw8oZekk/TTsbIbvpd0dgEYf2FVpCvxED
	NQAHpi4=
X-Received: by 2002:a17:903:440c:b0:2bd:9a27:70f1 with SMTP id
 d9443c01a7336-2bd9a277240mr137696455ad.30.1779139785139; Mon, 18 May 2026
 14:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
 <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
In-Reply-To: <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 18 May 2026 17:29:32 -0400
X-Gm-Features: AVHnY4K9QZ4YPNWpLLMqPoTdx466aeLFSTrB50F9KkmmJTYtgqutlvfudC_975s
Message-ID: <CAHC9VhS1DJNs9gDB6gD9WKhL08giSVajBskZ+=mY0AWRCAsw7Q@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Song Liu <song@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:31=E2=80=AFAM Song Liu <song@kernel.org> wrote:
> On Thu, May 14, 2026 at 8:48=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, May 7, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> =
wrote:
> > >
> > > When a (security) issue goes public, fleets stay exposed until a patc=
hed kernel
> > > is built, distributed, and rebooted into.
> > >
> > > For many such issues the simplest mitigation is to stop calling the b=
uggy
> > > function. Killswitch provides that. An admin writes:
> > >
> > >     echo "engage af_alg_sendmsg -1" \
> > >         > /sys/kernel/security/killswitch/control
> > >
> > > After this, af_alg_sendmsg() returns -EPERM on every call without
> > > running its body. The mitigation takes effect immediately, and is dro=
pped on
> > > the next reboot.
> > >
> > > A lot of recent kernel issues sit in code paths most installs only ha=
ve enabled
> > > to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vs=
ock, ax25,
> > > and friends.
> > >
> > > For most users, the cost of "this socket family stops working for the=
 day" is
> > > much smaller than the cost of running a known vulnerable kernel until=
 the fix
> > > land.
> > >
> > > Assisted-by: Claude:claude-opus-4-7
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  Documentation/admin-guide/index.rst           |   1 +
> > >  Documentation/admin-guide/killswitch.rst      | 159 ++++
> > >  Documentation/admin-guide/tainted-kernels.rst |   8 +
> > >  MAINTAINERS                                   |  11 +
> > >  include/linux/killswitch.h                    |  19 +
> > >  include/linux/panic.h                         |   3 +-
> > >  init/Kconfig                                  |   2 +
> > >  kernel/Kconfig.killswitch                     |  31 +
> > >  kernel/Makefile                               |   1 +
> > >  kernel/killswitch.c                           | 798 ++++++++++++++++=
++
> > >  kernel/panic.c                                |   1 +
> > >  lib/Kconfig.debug                             |  13 +
> > >  lib/Makefile                                  |   1 +
> > >  lib/test_killswitch.c                         |  85 ++
> > >  tools/testing/selftests/Makefile              |   1 +
> > >  tools/testing/selftests/killswitch/.gitignore |   1 +
> > >  tools/testing/selftests/killswitch/Makefile   |   8 +
> > >  .../selftests/killswitch/cve_31431_test.c     | 162 ++++
> > >  .../selftests/killswitch/killswitch_test.sh   | 147 ++++
> > >  19 files changed, 1451 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/admin-guide/killswitch.rst
> > >  create mode 100644 include/linux/killswitch.h
> > >  create mode 100644 kernel/Kconfig.killswitch
> > >  create mode 100644 kernel/killswitch.c
> > >  create mode 100644 lib/test_killswitch.c
> > >  create mode 100644 tools/testing/selftests/killswitch/.gitignore
> > >  create mode 100644 tools/testing/selftests/killswitch/Makefile
> > >  create mode 100644 tools/testing/selftests/killswitch/cve_31431_test=
.c
> > >  create mode 100755 tools/testing/selftests/killswitch/killswitch_tes=
t.sh
> >
> > If we made Lockdown an LSM, we should probably also make killswitch an =
LSM.
>
> I don't think killswitch can stack with other LSMs. In fact, killswitch
> can be used to bypass other LSMs, for example:
>
> echo engage security_file_open 0 > /sys/kernel/security/killswitch/contro=
l
>
> will bypass all hooks on security_file_open.

From my perspective there are two different issues here: should
killswitch be a LSM, and should killswitch leverage kprobes to be able
to "kill" security related symbols.  After all, are we okay with
killswitch killing capable() and friends?

In my opinion, making killswitch an LSM is more of a procedural item
that deals with how we view a capability like killswitch.  I
personally view killswitch as somewhat similar to Lockdown, which is
why I made the suggestion.

The use of kprobes, while an interesting idea, presents problems as
allowing any kernel symbol to be killed introduces the potential for
security regressions.  As a reminder, some LSMs, as well as other
kernel subsystems, have mechanisms in place to restrict root and/or
enforce one-way configuration locks; while many people equate "root"
with full control, in many cases today that is not strictly correct.

Yes, kprobes have been around for some time, this is not a new
problem, but killswitch makes it far more convenient and accessible to
do dangerous things with kprobes.  If killswitch makes it past the RFC
stage without any significant changes to its kill mechanism, we may
need to start considering more liberal usage of NOKPROBE_SYMBOL()
which I think would be an unfortunate casualty.

--=20
paul-moore.com
