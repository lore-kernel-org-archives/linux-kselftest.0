Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4335F199
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 22:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305152; cv=pass; b=mmufV5tEu3dFnUTz0QKKnjbfgcAR4VxkawsGFjX7MoCPY8lkhHst4cIgPidJP0KwxE/3qc+7IMtApfujoEVPuGvPgDDslcn/sDNCusjZiWX9rJs1JMPzKh5KwqiIMHBlHDBo4XsLHv1905uHD3SrOGn7qsnpzOgbJAKC3bkAMzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305152; c=relaxed/simple;
	bh=+ST1k0pyym2NatbWfqX8fttcjv/E/nGS7iP8gVgJvTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WM3bekDj8KlokyryDpY/lAMKhT9cKiSS7ehEMl3iCRw7S9px0NnLaID6skDKFbG8k/n31dexFExKk/KV/MCIYIlri1wgIMWkUZSPNi0e01sboqlaBG0jt14zrS90Hw2JcwxTHYO0lZzo1d2j6vXl3ANA1qI7WzQski6H1a49fFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNTfwaTZ; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNTfwaTZ"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5175eab3a93so11192931cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 15:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781305150; cv=none;
        d=google.com; s=arc-20240605;
        b=FY1QjJ1F0Iptkux7ZWfu5FCIFM+UqwPaMGLlZdb1ltL33qar4XCYh+dM9TuJKst5QH
         7UKVNo95o4Xl/HC78oQ7Noi8K+8XT66OrJf97YTsNLzPxXC/tv0OxQLTdkDE3ze1mJnm
         KNQO4d5h+aVenJeo7Zivq4rPTh+52YDPZ+9J8eLh2U2XADn685pNVu4GlyXnhZjd51Zm
         Xt/yagBjQ7TbOJPeGdy88S0tcB1MvutgXWK4Va5+PlcVGY+YG02BtY7cffw2Kgjj2aEV
         3Kg8L0Fp6DvCmHAWKrc4SessKZpu3tU3HmB4eHIHs1/eAz0Dxu/U0dYRArXc+DuW8f42
         pLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+NFLecPAKu38rb3b3Li0gGWxRi2IeB04bipAEb4Brqc=;
        fh=sHV6dni+Ylt4KAfqFL3JxZ+1OZfH/cvgxOB55JJM3ic=;
        b=iOZlt3+uZfCYK6ET1ovin2+d+lvyMx63AXGAkC/2KSEIKpeJOB9lKz7uXKJTAV3PeX
         T0GZt+1JX6NWfRjx9PdmcHOpFyJB3SSSgHBXveOKBntT2C+6hyGnaYPflC9uPrLTGZjy
         LtJdIZa1kJEL7EIaAIVccarh9B8/tURsJ9Pqy2RSEHr9TfpwKnpt3Y9eNyse2kj3qkGt
         I8XiTgUCZWvJ5m4qSH9hc3PMpBbwSjf/ef0JfWS5+KTPhk+BmjcQ60IS6XbfcQASHuFV
         T2unqgW2LCJBHwaFxWPbtP6+9dLoQqFixTTJxuToZytwlKf72A9Sadz709e7bwOxdfyi
         ba7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781305150; x=1781909950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NFLecPAKu38rb3b3Li0gGWxRi2IeB04bipAEb4Brqc=;
        b=CNTfwaTZ6hPOVHTZoGZwsd2VJ2RKlPWAsgsARXorcHBVr0e3zh7DLnkOnB780G1Z8G
         jxdfX5L4JqDg/GqlaRma4mvTVidqAwQ5TDXoH0HAXTsQAAUQ921i9QfkvJGDjgfs32Pc
         bmODk5ZEC4B0sJYhZdCiUDrwjNhdQUEgTqu9fKBT4Ag5t+qlHYt/wuzmZtKUpDIXwpPm
         uNr/A+OqLwdfTCJO4UQGl/itvyyXkozhFquWukz9A00MidRp9DQ6ZCznsQjUfjB4vZ22
         2hiB4mqifi5jkJw2YxICl67RnuRNvhV2hS4rOU5sOwkwuuzsjcLCzBK7vkHkdn4IjZh/
         dXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305150; x=1781909950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+NFLecPAKu38rb3b3Li0gGWxRi2IeB04bipAEb4Brqc=;
        b=OU4haZkt3ukFRgIIbfn6fin4SABf3YCZoJz4qG+1mH0BJ2HMMwzbnCQa2POkvqHA70
         ZpmXDFt9LSHvTGy74B0eX1VvLuBOyGaUuXiwQljZufGm/QBKEU2cBgIYrgQwbXUe0hSx
         4VHlOEYkysE7MwCFgDmiBzxhl+CquKzOASUPpksx+8Hf6hJ7xxH0pZ+gTSUTpvsNP9D+
         T2/UPz+vG29oPQMPvk9zXQhxbEeuexkEP8aQ5zrLGUQWkEGGXrpvP3/22TGV1TuzcZHe
         YurmNfIoFLhn87M/azNG6Cq6lUk3bZbjWGZubhN6G2MZF+uezTvblbRgLBqh6l1wtx61
         00vA==
X-Forwarded-Encrypted: i=1; AFNElJ8RM2jvaVC6FIZ+yEN7y9CTjqlM6tm6lNCbt3VUB5FatbDw/8o71ctmkYXqY2PjyGI5RB5yLWH7gEe4aaXa/iM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxdNsbTOdyr2Mn7DdHIMGbyy1nWl5UUE+OD/dyjKG2QJULhbPS
	uQeOrkFQqgOsoQ0wak9Ll6Oy9xSJ5wfPZPkLcC7HtN8E99G8XoLdGxS9ghThGs5mCzMzijYl8rj
	xuaySNn1cVqNkco8WthirYAwl6sq4Nz0=
X-Gm-Gg: Acq92OH4cTZ4koBqwsvbRaqSGQ1cu9uoZ/hRcJlilkaiyr9dwYcEPrbZUK70oTi4qDl
	jYq4FdPXLB3tBwkJcsj+EO6UUftsfFiYHVVI/jQx15N+BEa8NhblfGOC2Fy+lenLogycPNit3bc
	2dnBIw+shed9xzjkthpOyhxQLdMGOEbzC2PbYzQd65ZFeNrFM+mo4zSWw059wTho5jyhW9EQsUV
	ij4EL1CR6epsGFwaxiCwSeYPFYajpNE1ny9q9uzX28y5bSyyucZcbS1QjRt/YcBkXcHoee8rTqS
	Fz2zGbNmxZJ0bGaOwu5lWjFMDF06D/xF2Jb+EAcV8sAgZmdUN0LWqOCrRvqWWkvs7fnK4bSAkt/
	mGg3LLUAC
X-Received: by 2002:ac8:5750:0:b0:517:9e57:c681 with SMTP id
 d75a77b69052e-5195358292emr27403981cf.53.1781305150238; Fri, 12 Jun 2026
 15:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
 <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com>
 <CALCETrUArQBzUS2mAhYxDS-unze_gnQ7efv1qeBke-ux=2KdkQ@mail.gmail.com>
 <CAO1UbGcJEhwtHcxy5zcc8cH=YjfSDiDa2o-o8o+LMbkmL7WFcQ@mail.gmail.com> <CALCETrXrAs5R_u-Y=1qCg2PvW=xx=hMZovBBv9UmKPkVCedv9Q@mail.gmail.com>
In-Reply-To: <CALCETrXrAs5R_u-Y=1qCg2PvW=xx=hMZovBBv9UmKPkVCedv9Q@mail.gmail.com>
From: clubby789 <clubby789@gmail.com>
Date: Fri, 12 Jun 2026 23:58:57 +0100
X-Gm-Features: AVVi8CdJPu5BwJxrQwePbiiuyEBsOn_03DZWSuhQlpjvZo8ZrOMDgD5d495Itt4
Message-ID: <CAO1UbGcO_mNvLO8gMzGMWsKaW2qytnVit1DSFFnO7d35CpWQCw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 11:37=E2=80=AFPM Andy Lutomirski <luto@amacapital.n=
et> wrote:
> > The filter
> > itself is also rather complex (mostly due to needing to account for
> > BPF jump sizes, which differ
> > as different configs (uprobe, uretprobe, SECCOMP_ARCH_COMPAT) have
> > different logic., and I'd worry about
> > keeping logic synced.
>
> Perhaps you and your AI could elaborate?  What are these jump sizes?
>
> In any case, I think the actual issue is that the STRICT filter's
> failure case doesn't quite correspond to any of the FILTER actions.
> So maybe it's too complex to be worthwhile.
>
> --Andy

The filter as implemented looks approximately like

load arch
#ifdef SECCOMP_ARCH_COMPAT
    if arch =3D=3D compat: goto check_compat
#endif
if arch !=3D native arch: goto kill
load syscall nr
if syscall =3D=3D {read/write/exit/sigreturn}: goto allow
#ifdef URETPROBE
    if syscall =3D=3D uretprobe: goto allow
#endif
#ifdef UPROBE
    if syscall =3D=3D uprobe: goto allow
#endif
ret kill
#ifdef SECCOMP_ARCH_COMPAT
    check_compat:
    if syscall =3D=3D {read/write/exit/sigreturn}: goto allow
    ret kill
#endif
allow:
ret allow

The offsets from each instruction to 'allow' will differ based on the
presence of various options.
I came up with an approach using an enum for numbering each step like so:
> enum {
>   SF_LD_ARCH =3D 0,
> #ifdef SECCOMP_ARCH_COMPAT
>   SF_JEQ_COMPAT_ARCH,
> #endif
>   SF_JEQ_NATIVE_ARCH,
>  /* ... */
> }
> #define SF_REL(from, to) ((__u8)((to) - (from) - 1))
> static const struct sock_filter seccomp_strict_filter[] =3D {
>     [SF_LD_ARCH] =3D BPF_STMT(...),
> #ifdef SECCOMP_ARCH_COMPAT
>     [SF_JEQ_COMPAT_ARCH] =3D BPF_JUMP(..., SF_REL(SF_JEQ_COMPAT_ARCH, SF_=
LD_NR_COMPAT))
> #endif
>     /* ... */
> };

But I'm not convinced it's entirely readable/maintainable.

And just to be clear, I'm not using an AI personally; I was referring
to the Sashiko review bot, which I've now realised does not reply-all
with its reviews.
