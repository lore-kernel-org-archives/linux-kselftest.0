Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FCE22D792
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479727; cv=pass; b=szCpEx3+Pea78iFykt32bXMwyiaU121luMsuXRax5RzuT2oT+nEjE+8vDacpuRC+vraoeq9zmn6QFoGemWcbU92GSBi3GMRRmq2lYEQU1i/of0bggIq9KwvpEBvXH4Lqm2KF6LlKRqC5uFh1EwyQbDx54Y3YaR7N/b4HcJKcHEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479727; c=relaxed/simple;
	bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZu9Zlgg2Bfy+A3rQB0ikbX/9zyf8cdtm0mxI8miXJu5Lpd7d0PPq1/zC2fyHv0Ue0rlWLrmd0OUKUMZVK9ckk/7DoiJ9y6Lz6KiD5Ael93DRf1xQLJobbGb+CSOrX4fvOZmAUe7TqiWCA31gdNmnITwy9tzTD4jSmWfZgZUAG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQkj0U7W; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQkj0U7W"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3811f512167so177263a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786479726; cv=none;
        d=google.com; s=arc-20260327;
        b=D6d4V2pjEz8ZQNBBTXe38E2gizLxYpa/lHPWhDfrcRXZqmF3HBSgebf1ONIARuzjK0
         jXCsQuvrl1NBxY/2vAjU5ZrYYGDCt304Tld/lgVmy74dTTQ1fK4GehYQuBqZtoqyuSYt
         K2TaGfbPNAy7Zaj2NYqIGCmkibyWZoZjGzkAp1vJQKJgV5c3PgGNHB+sZsWy1hXVGkzw
         g1vAv3DGK03zDKEhvST8k6MmiF4qLlP0Lw2WRQXoUzi795HtPLd/4Xup6qUrpewAAWJP
         pW5hCCd+OODgbJbGAIBUpm6tOrxpkfGi3DMbgPaPMLodPkVhdN5lBG50tmZylfM1VZHn
         /apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        fh=OcLddaHvNJpd5xYdt4uJFQ/2zgwKTICtx6s7464l+Ew=;
        b=R2HBSZW83en/Gc4w5B3d+FUEptrsY2QSB3S6mp3hy2JEDZmapqiIq4LL+/x2WsIVJi
         PU1M5keIR9+MNdUKH/O9zh7UepVgQxmLWmcgymnWlahJQCC+854TDsgur93DNhPXUW+a
         APY1CcjVV2r3GhcBZVnbrtYMHFi49oQa94GnpknzpHY9NlBLH94uNRnxeKZ/VDdGyV8K
         4XBazUSNaYms1muRQdQWx5RhDvLiyZR7fwCgvC2jT8ZKBmiFbnJK7lLUm8tcH6wPMyzK
         exzz4Ok2U/qf1jSseItGfi9eadSxFLTWBx0hlW5dpy5cuwJIa1JtfRY1TgsjKhE6Xmj7
         HljQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786479726; x=1787084526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        b=wQkj0U7WAgRoDZDEIFtucXHVhNgZqhB3WyHT8XYRZsPeRubF91T9w69SY+dOg9e+CP
         hzdx8ECsdR2qEiBmX3jRyGFl0oIGavvoQNVn/KTzh54vg0XlbdDBdtHjCOnyQviGb+Ob
         HTsNgGB/a8ZH/c2vEy5P8Spz1Hb5EycAUPfjBujLBKafScuXiEh79W+3NJh5RK+fSWee
         xA+pSDlFcFwzPma6L4+1tY3DILUa/TcPHG3lXz0eOYBcgx48rEal50zSmO2gK+j/Y8e+
         Bj4Mi2w+qy6K0uZuhVC30+Qrkw9wqimH0sr7QPXtYC14Li3kVLiM2EKofBCrMTGbUuyb
         JJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479726; x=1787084526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwlZbfcpBG0k3WExAq1eKzEN2yqfaK1u31zlbPwH7vg=;
        b=N/iGy6jcN30DbFNPUCGpaXXmfQE5eH9RwcSsH16Y+SBgX9BSTYOD6gxB0IWTMsllj4
         4a8ThaRHgcw1KmRUF02Jj8aSMUR2V7HnjLMrHoghy/cBfNlrh8qXLtmFoYXYsOUH64uy
         dASQOgM55FG40bjiY/p16OGFr3uBlH65SsefsjI4CvOkjcui8R15iRBWspr3sYKcZQEn
         sOcNm17AyhJt6rI62JgywrPteY240g8vf37tyBn6nBlsnByrnOSYcrq+EAFWGTlN0FaA
         A2IHDLnNXjt1UPca687FbCEST8MNsCg1bkLj/wKyxRFZmyLzJNJPeMka47fIQhCP8okN
         7U7A==
X-Forwarded-Encrypted: i=1; AHgh+RqX3o9ygrpy7Op/AmQM0YIhSZvbqUngXtFXaRz07o40680nphC7+0XOKzR/xSCyhfVwwrad5Rfd8zZYKy6AXeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDDWICAQQymHJNcdYFVP0NcC2Ff2JTGTKUmFYI6kYYg0yPfjG
	IqvJQiU1LaeTujOZ97SEf874pn28DYvAULdb++I0ZbY6Np9fHIkJWgnB+u3bxd0ooQpXqaornJq
	zQI5B99IOAyiv9qf0SOsMmF/IpGaVKJUxrR8IebWQnsMRrouR/IRjet+W
X-Gm-Gg: AR+sD10rKTqex7ChfOIVFxmRb8jYoMBcLD/0mtkAnjavpbqV79MtbngSmkn1ZbeDeYq
	XFSXGeh9K2wlCYg+NEJSQi1go7WOCdY0NDVEi8bo4lV8lA2RLZjQPfgC0SSExtxd6m61lxl0DYf
	FVwUQsatz1hVGSERoJWW/PY5FEk6X3fLuwQxrqXbmOao9zqOIyJoHxiXe90g+HzD4qq1jnuVHYl
	lHilSQKrwMj5yMF2pbgNQFUWA/SmmgdG/a1N8obH7Enx4JAqpQlYTuPVEb+PJkW89bdI2jEWXwv
	FgQwaXR8MvrvsLNrEOfUmEQ7rnziLHo40c8FKwu1P4XC
X-Received: by 2002:a17:90b:5483:b0:38e:8300:af51 with SMTP id
 98e67ed59e1d1-392ec3a9001mr7606224a91.8.1786479725107; Tue, 11 Aug 2026
 13:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706183154.2660394-1-dmatlack@google.com> <CALzav=f3KaNQd2NgCTxU=VSXWujV+qjyQuNJp_hy1-U36RMPpg@mail.gmail.com>
 <202607150902.F17F8DE5@keescook>
In-Reply-To: <202607150902.F17F8DE5@keescook>
From: David Matlack <dmatlack@google.com>
Date: Tue, 11 Aug 2026 13:21:37 -0700
X-Gm-Features: AUfX_mxVBsjnbB1DrMel3A258ig-TIae0_jrT2t6gBnEIP59zFKlPTNtWimYS90
Message-ID: <CALzav=eV_VBDqwko0Qp3kALK0fW5Ad_SHOdn+Gune8Nps0Opyg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests: harness: Mark test fixture objects __maybe_unused
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Andy Lutomirski <luto@amacapital.net>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:03=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Jul 14, 2026 at 09:24:36AM -0700, David Matlack wrote:
> > On Mon, Jul 6, 2026 at 11:32=E2=80=AFAM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > Mark _##fixture_name##_##test_name##_object __maybe_unused since it m=
ay
> > > not ever be read. This pointer is only read in XFAIL_ADD(), which tes=
ts
> > > are not required to use.
> > >
> > > clang made a change to -Wunused-but-set-variable (split out into its =
own
> > > subwarning, -Wunused-but-set-global) that causes this warning to be
> > > emitted for various selftests and can be upgraded to an error in
> > > selftest that set -Werror.
> > >
> > > VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> > > selftests: Add -Wall and -Werror to the Makefile"), and the net
> > > selftests builds have been noisy due to -Wall.
> > >
> > > Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between fork=
ed processes")
> > > Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Reported-by: Aaron Lewis <aaronlewis@google.com>
> > > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> >
> > Kees and Shuah, is it ok if Alex takes this through the VFIO tree? [1]
> > This fixes a bug exposed by recent VFIO selftests commit ff556bd98348
> > ("vfio: selftests: Add -Wall and -Werror to the Makefile").
> >
> > [1] https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@sha=
zbot.org/
>
> Yeah, please do. This has ample review. :)

Thanks. Alex, can you pick this one up for 7.2 if there's still time,
or for 7.3 otherwise?
