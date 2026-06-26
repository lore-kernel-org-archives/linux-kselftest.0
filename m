Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3137F007
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477602; cv=pass; b=i7PMyg9g/0yZyso+fTNVHqg91f9FN9HaKX8qdNazExo4DjlbEmCSaEq5cn1OHMbdVToXQhv2BrJBfZ6gkuCp6qy7wFgfIJvkmugi+y8axxPq+huFzIqlAuTT8TgIR7pHnxpJdDAXHSJSpeFx62uPaMKyEsW+1e5OT2pQTENE6tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477602; c=relaxed/simple;
	bh=WFzHWsxxps29eFxk98eNsgT5ZujxfpUziVilaS7bN2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uosxN1zEh4SjMFT74PvFREpfUNe/xicipdEJc7QQHDlwNKU3rF+UgsBVyE5GZ4SpbqN50wpb2f+CrExbRGBK0HkOgYujy1+kJkw4JudIi6IFTgznDslM3PM/oyDkcNs9F2yrqGZvwzy95ji29ax8YAMUtKA44hZaz/8g/TXJ6uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SXutTs9/; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SXutTs9/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69565156c06so11268a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 05:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782477599; cv=none;
        d=google.com; s=arc-20260327;
        b=jQ102HmkixE41wniwEyBXn7+dfqHvJMJQe+czxaookamcnS2xLF9m7nQHNl/0siow/
         XUu4EkT/rBp/yLMGHwpfMUwA/10kJX5cnh4Raln7Gs+8aXzbe2OCDHT6BQ96xYTLX9gY
         zh7PMV/w6Hb+UpJqETN8h44q8fFb/zYVTXnjWHl+SSmtZJehU9SrIuv70bCxWivk5yte
         ws4FSd6hyaYi2cBgFWIP0ljGOjS52wkf07N6eVvec6syNExdy4XD1U8lhQnODasX/7C4
         GTVwWL/tvOkmurlq6f2ttcOlTA+GqCzJRQIYOyyMrrQMV8Ve6aqCfnGe5Jdq7vgyhCWz
         e/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9E/powVa2kz95H4iGUwNMkUp/TwMZFDOhnjzy0yvsRc=;
        fh=cx+/VSWNWANDCezSTt/5iDLeZq1Ci88+hFc8bx0CJAE=;
        b=IBNfdMrWjYHWWhxEXBtJNSAY+qgP3EsJrPaRn54Wcmt4mhJ6uHxCvdztcCyFkivPQk
         Xj76i5Yt9aviJzYugryO1fzt3KSOLJiCnpB1WFDjeuHQJvX4PO1bO9pNJMDQMXCpHj+6
         4TMmIjNMF7vj7h18pYRLL5K9f6TcqG+DqpHAWHbV+m87g0z0zq6z7EB8KCyylqofu097
         O0bpyQjSUH+bOy2zgqgWtN53RFhKJK4iWAeJJZYGlBLuZRSEtS0p3gZlOfyU7VBqq9cI
         9Z8FRjC6ztsbfD74IsI/OtXmOCRxlKEgdS5LWjpYsoskxRkjaJJSet/ENE8qeGdIO/zJ
         AyEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782477599; x=1783082399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9E/powVa2kz95H4iGUwNMkUp/TwMZFDOhnjzy0yvsRc=;
        b=SXutTs9/AHROsLxmto9qHL8Mst2GZewYCuEmliEblTQ0TIRW5/ekBMPuG3koSdDeEs
         AA8e83einkekx9noEwjVLhIp6T/9g+HodLitXdthevHDoYV5tvw9K+yclONQJNfTm8sg
         Kc7e7Xy7LuTtrcRplmFbrQtWeL5CqJIHVArfEIqTwIKROzCb6i2We+S2x5nAYLgZB3dL
         3+DaU9ocASXh2hZ733ZMSyi5FMlChftddRcbwpS5cqGXZEJ14fZqDHvZuIXaWhju18zx
         HdSOlhIxXiV3qM3mL6AoKR17V2dWmcTqsQ/mxDVRNVMEMZed/tyIDRtN0bAOlQ9u0XZG
         mcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477599; x=1783082399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9E/powVa2kz95H4iGUwNMkUp/TwMZFDOhnjzy0yvsRc=;
        b=BO3oXhi0E3v2IsAXnUUUwUb9D+zwYLA6IQjKFUQFu91YnJBaN7S1xgZvs1b40seODE
         F/ppSsu6URYVAiZX9mS014hzXIBAIBNTBBsli6nhTYcFlqXTIf8MIyXQwq40ZQL6omH1
         /ozpqgM2hw8C/QTT79CH5y8HBtghCQjkqAbb8NuirLRziBHSV9z7OtUts59K1O+jnr9e
         3nlS47XcNruqm0mDt4O4ReeIj43IZ2LjuivpK/xg94zoaujIuej4o6csZk4n13u+Nw8O
         2eVy+Cslp3oue4BJaruKoPva1tuo+p2fO1PIkbsb2fFHL8N9vKY5NBGDSy2zCrnR1s60
         65xQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAj/Tl+dG/zRMDD2nLqbYwFvMj2iHkUFBx5zXW4+fB7GOBoS4x4tQO5g85gXzuB9Ft+71nfE8LArWPo9xm8ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDm6KGPEYW7cgPnX4Q+knE6rBSl4cF0lnjbVaV5ICEKeqBIgA
	oI5VqzWGqT7cRKUKWmS17NGy8wXpAqH+sTSlL6z5ojpDBDnvNaVu3GZMWVyBips4D7e2okXyBsC
	yUBl6ZrZJCbKEXJtZJV5u3HhI4hGFhinFlXyNQU2z
X-Gm-Gg: AfdE7cmNkjvfABqa5GLMylUlerBCXbdyQYbG1G+vR7f9QPVR85By1TO7bx3ErI625nm
	eyaF+SeC0pNmQpIKHZAFCBkXet1Y4NJ5LqrClhIylyJ+bpWMiIbzrUiaYuGhB4gXY+rO7lnEnMa
	akiZR2oLgsaXx0ULMqZTw0nicKPuJo2dGol0uYAUOMKAga12ZeolkUt5s1jezwfd4lyPbOCpQ1S
	YZZYXkDBfJKxirtVsMSZk3HnqP4xkYarqO5uuusG4qGsT8g/mHcYjHHGCoK8P2r+CC348/0OMt0
	Il9z/pvWiGZBR5RlhJbU5cWBF69V+eF2PAFs6taeOx1yRxHowYPGPe07Wmw=
X-Received: by 2002:aa7:d3c1:0:b0:697:9254:a66b with SMTP id
 4fb4d7f45d1cf-6983795482bmr2913a12.6.1782477598491; Fri, 26 Jun 2026 05:39:58
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
 <sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
 <CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
 <24420045-a6eb-4999-ab19-1e344eaba8a4@app.fastmail.com> <20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
In-Reply-To: <20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
From: Jann Horn <jannh@google.com>
Date: Fri, 26 Jun 2026 14:39:22 +0200
X-Gm-Features: AVVi8Cfh5sgf8WRo60ET7C02KjqU2lxAfQoevMPof67z3PBX1H-BhFeEjrTW-GA
Message-ID: <CAG48ez2X1p5Nm2_sU=SK9wUusUO8c3_T-=FGrrOhkm7Kn9Y_7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
To: Christian Brauner <brauner@kernel.org>
Cc: John Ericson <mail@johnericson.me>, Farid Zakaria <farid.m.zakaria@gmail.com>, 
	Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	shuah@kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, linux-kselftest <linux-kselftest@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 10:50=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> The arguments I have heard from various people so far are:
>
> (1) Userspace would be able to clone a random chroot to /woot and run a
>     binary from it without having to set up a complicated sandbox
>     effectively making dynamically linked binaries more like static
>     binaries in a sense.
>
> (2) Quote:
>     "If you debootstrap/dnf a chroot to some location in your
>     home dir and try to run a binary from it, that it tries to load the
>     libraries from your /usr is a pretty unintuitive and not at all
>     useful behavior."
>
> (3) Quote:
>     "[Various remote execution things run in locked down containers that
>     disable userns, which makes the sandbox impossible and hence our
>     builds wouldn't work there."

FWIW I think someone also mentioned to me that it would make things
easier for them if they could build a piece of software in one
environment and then bundle it up with all required libraries and such
and run it in a very different environment, without
container/sandboxing stuff and without static linking. But I guess
that's kinda niche.

> I'm discounting "Oh, userspace already allows this so why not the
> kernel.". I think that's generally a bad argument. Kernel and userspace
> aren't really alike in that regard.
>
> The userspace ORIGIN concept is guarded behind AT_SECURE. The kernel has

(To be pedantic: The userspace $ORIGIN concept is only partially gated
on AT_SECURE - glibc has an allowlist of acceptable library
directories, listed in "/lib64/ld-linux-x86-64.so.2 --list-diagnostics
| grep ^path.system_dirs". But clearly we wouldn't want to mirror that
in the kernel.)

> to enforce the same rule. That means the loader now depends on the type
> of binary. I think this is a rather serious issue.

And annoyingly, the bprm->secureexec flag can change in
security_bprm_creds_from_file(), which is currently reached from
begin_new_exec(), which is called after we've already opened the
interpreter, so accessing ->secureexec state during the interpreter
lookup would require some refactoring. So I think this is a doable
change, but would require more work.

Or we could take the easy way out and say "the kernel always rejects
this unless LSM_UNSAFE_NO_NEW_PRIVS is set", which would make it clear
that this can't lead to privilege escalation and would serve as an
incentive for people to stop doing stuff that relies on setuid
binaries or privileged apparmor/selinux transitions. :P

> First, it creates confusion in userspace what loader is used. Second, it
> means anything that any build/chroot that uses AT_SECURE binaries now
> has to use the sandboxing solution anyway or risk that some binaries use
> the system loader and others the chroot loader.

I think we would probably just fail the execve() attempt if we see
$ORIGIN in the interpreter in an AT_SECURE execution? Since the
interpreter field does not allow listing multiple alternatives.

> Ignoring AT_SECURE, LSMs likely will need a say in whether that ORIGIN
> thing gets honored or not introducing yet another vector where this can
> be overriden or ignored.
>
> Also, we change long-standing kernel behavior which will be very
> surprising for any userspace that might implicitly rely on the fact that
> the system loader is used. So even if we were to do something like this
> it would very likely have to be configurable in some way.

I think the proposed patch will only change behavior if the
interpreter path starts with "$ORIGIN"? That wouldn't work on existing
kernels unless you have a directory literally named "$ORIGIN" in the
cwd, because "$ORIGIN/..." would be interpreted as a normal relative
path.

> This makes this all ripe for malicious loader injection attacks. And we
> need to consider this possibility.
>
> So I'm not enthusiastic about this. I want this to be consistent.
