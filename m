Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5F36C0B1
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727110; cv=pass; b=AnOO9oJYTyp7/hsTawwbqCZ4EUBDkbrS0N9au8ZbeiQc1rOxQDqUQ+hKHsZ6ZmW1auiYhktKH5GPDab+YLBWmtbrUJROsAKdNWU333fZlQhGG2sugZl7lmjKSuhPNjs8X6Z34p0IDP0RSwczI829rlp+GmpKZ7bfKLtsOVS/Yg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727110; c=relaxed/simple;
	bh=fTQuFu9kqguU1BpFjnexceve4Pa/LmHq77DAY0r4tYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvRDsK5uLHdVm3hc0WLqa2P4gW3EMKc6YshgarQO8BGR6DinT51w1ZTUSU9Zh/m4ERNQ/iSaRQ+lscwTUI5cuE2rgAg7WfezOpEK6v7oRijy8xJSCnhCLnMRB7k5B6o+11l9ou/wENx3BXqovbRiFYrNn8tQwkVNEN6KbKR6MWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9ByB/g9; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9ByB/g9"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56376c3e866so1062049e0c.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 14:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769727106; cv=none;
        d=google.com; s=arc-20240605;
        b=HZgQlk7cpkYhMhrUACHYjqTr33PcVb6iy7jsAPsJ6c/8twA9fQEjlPF6yi85tMsYIw
         ZJaH36+bWqf9zebNGBjqBT/0r2Su6qllrxQhrmp34ShqPnMJanSAeF7aqkN+p1H7XqY1
         1DrTKDVJstbOdq1XE/o9Wuwq2LXSZP0cT2BNKnBiycf8EG0z9aka20vohMdIsr5SFL47
         uDdY9N4mhJRsnvy2+F3P6SXVdKE5nw2dQCm4qRwWX3z5AzZScDXvVhrHbLfaXj7pmMOx
         CG0NhoWztKKi9GV8WYfpzqKxGkpgPbjAqpQCaK7ccKGnwhyAzQMoZND/fmaeswqC6nL2
         rpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lJvd+vGWuwhCxcK/MWhPFTZF+6vHFFgGrzqA34BGLTE=;
        fh=sTEHeUK4SRBCLnC+vla/Cq8wq0W7JB3RtrZRUUnARdM=;
        b=UScsifEmb8FWCgj1FgIWm1eE/gjvFAxyy+/EuViIQY0uPiTGH+OMHe+RL3+Le4fRtG
         yuYVnYahX6r1ziUxKjIUK30jC4+7ifBx98Gnvc29tyfRAYRexEiiTHxryK96FmcZSSmQ
         ujoL+/Cl4o7bmo7nSbBegeDv7WRb32XUGl9ShS3CptIclRAKYQHXlryn3AGjQfTa+cmk
         WzTGtxnf3l4beH3emi8XYb17drF/jYSdYYmT6o1vopyzsXdn2jduUsVy2u2t/r+7QfrE
         WU9bjDlKY+8fu9sY9dJpsGI/mmMNFjRE95SUn5+F5E6L+CWbVE8DeL4WEI9Iwo3SN6nb
         81gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769727106; x=1770331906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJvd+vGWuwhCxcK/MWhPFTZF+6vHFFgGrzqA34BGLTE=;
        b=g9ByB/g99kenXVaA9NLMWGiBhhLcxLDrVgDqARjZAPKUX4JyOjUsIFV7C4lQuoG4dS
         rKzndKoF9PNKV94fgKYRHgrr/hWmFD/2d4o+y4v4fKIh+7RdRmEcFnFx5nT4d2AU2w5+
         OdKE+19G4Nvhc+9G+adlG6A5KwYc7pSegwPCvApDwoEN1fvaVqZ+T9bCuP40bEjaJpZV
         zVrp9/XDy+weE20L4LLMY2kPtFJCF1OxJxV2oOYpRw+eHp6Ot1Mqn63/jZ1QQ5p89F/v
         m9OUnRQtJEVR7TTJmo4fsJbIiJmjeCL4mRT5bhftIIb0R/SIk3ecbaTQ/B3CJz6sd9Pn
         ZCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769727106; x=1770331906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJvd+vGWuwhCxcK/MWhPFTZF+6vHFFgGrzqA34BGLTE=;
        b=hSGTaVXsqJNVkXati5ixXzGJV1QttZV8Sc98J+7/423mOngNDSWPfGVePIbJpbHpjE
         cQTUYi7SEr/s/HkGpI+jCuicjhBLOb6PjmYh2hP9w1hcYDVQTEH+oeJbuaF7PwAgazUP
         YpCjTZlkIFNsesY87sLGVoHHDA/iVfM/8Dcy/tqYDfVJDleKgcch484EnkjiW1QO38cD
         h4kIeEleK1jZpaHtI76Sfx4M10yDG08t1KQ77uhXFi7+Vf2iW/z8ZsqtJ2Z/Zy//ezS1
         2ahqtsVxAC+7eYxE1i+NWRNSxLlwoUVKPYUbNRsVkLZaNId+Y+6lPSXh52dJL4ANaeqQ
         t+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaCN8DSKHXiW9rOTOva0G6IGMCl1h+ORLdKYMHItgYJb+eJp/zSU/dZngyYAAg17hNbncEpsw6ub+nHlacfp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHJjyAjjc+P5sLekzwS3LBbomOl76MkfY8u34KOMpyYXYs4sa
	bN1gXUvapXjEpIDc0ZpiX9mCCzirrV+IZCnCqDOlg1pc75g8Zrz9twZ8GoNnBcxbvji0HRqvlcQ
	/hDunbsa/Z+yMIzqEw8OT5lAZTOHYmmBJ8QXA490/
X-Gm-Gg: AZuq6aK+xxcC+GdGyJoHnvpiIi5irtQaBtDF8VekAQC5gMkdU0wohbPy15eQ8D51nit
	odDuTO0WphyEo980VzGsHruOldIvfCur1PFx2RPAHxwqjGdD08y7fUcugOtBI9LCAMIch+qDTRI
	GnEgVUTpOqFbLgZ7fFpDIGJNtE7WXxdeeRL8d59J+ooWuz0N6CxfPVoMAE4a7WAPMmo13nWy9Ri
	qvmgZNvFdSaHRy42CXdngi6XywNeybMiWbvPyQgfjOLjm6ulH3Bip51ogtNhTxNji4nLQ==
X-Received: by 2002:a05:6122:d9d:b0:563:618f:b7e1 with SMTP id
 71dfb90a1353d-5669ffee717mr403168e0c.4.1769727105743; Thu, 29 Jan 2026
 14:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122214427.3568647-1-jordanrichards@google.com> <aXj28ZAsPhp7s5sm@kernel.org>
In-Reply-To: <aXj28ZAsPhp7s5sm@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 29 Jan 2026 14:51:17 -0800
X-Gm-Features: AZwV_Qih4YdJjcwykk3W2XKzoofUT-6bqXeXJt_PMZh-8Z6t0rpgREgUbxIftt0
Message-ID: <CALzav=dKzsuZe=ZLfVg+ENVS0RbfN2jBcHEn+N5Jic=ykHLmWA@mail.gmail.com>
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
To: Mike Rapoport <rppt@kernel.org>
Cc: Jordan Richards <jordanrichards@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>, Jason Miu <jasonmiu@google.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:33=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
> On Thu, Jan 22, 2026 at 09:44:27PM +0000, Jordan Richards wrote:

> > diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/test=
ing/selftests/liveupdate/.gitignore
> > index 661827083ab6..7dc1e8aec44c 100644
> > --- a/tools/testing/selftests/liveupdate/.gitignore
> > +++ b/tools/testing/selftests/liveupdate/.gitignore
> > @@ -6,4 +6,6 @@
> >  !*.sh
> >  !.gitignore
> >  !config
> > +!config.aarch64
> > +!config.x86_64

This could be:

  !config.*

> >  !Makefile
>
> Hmm, I missed it when tools/testing/selftests/liveupdate/ was posted.
> I'm not a huge fun of negative logic in .gitignore.
> Why can't we just exclude the patterns we don't want to track?

I'm pretty sure this came from me. It's the pattern we use for VFIO
and KVM selftests .gitignore.

Positive logic requires updating .gitignore for every new executable
(every new selftest). Negative logic requires updating .gitignore for
every new one-off files that don't match the existing negative logic.
In my experience with selftests, the former happens more frequently
than the latter, so the negative logic is easier to maintain.
