Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AD314D2D
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663866; cv=pass; b=Pv/0OTp+Zcf+nqh396saKheshAWo4/QxPYVuCyuoI+Y0iZZgyeBcLeTooqJeTWKXImq9u8XDWOOwXsXXxN2juNjH+YVnWkgFUrwjjYWDhEyIu6OnAYUwenjeUpHPaksmwD2cMZjFQ8qNB8r5pBP9TcDlqYevBrreayIVGNmRSAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663866; c=relaxed/simple;
	bh=aq/BY+Jwl0ArxIyMnB+97m5Maj1U782i3CsVD4IDVaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chSulq74yt9qzoU2FQVjN+CrkxssVCvxbV9svz/kDNWr1JrQb1Gbyt5KQXedL71wEJMLqlhSNKUWsDuY68FGPdjOCXdHzhY4x/CilJ3kJs81QCdXpVIqaok4/zf8hGB5a4MVC9z4t8pRC5rtEIL1ufIku+6AWy5xK5CdefJX0I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2FoeZsW; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2FoeZsW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf906b007so3393139f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 08:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775663861; cv=none;
        d=google.com; s=arc-20240605;
        b=GDdwr/tE1evNjyFqzlpqvq8XP8gTSqBv/riZz6yfx7zVFwAy7HhRL2EjrK5Y6hA9yb
         40h9r41Itb5oVUw/Lfz41x21jiML2cXexX3GizsEeHqxoTJGUkjf8AXREyWVfWWcRmN2
         uvezLiD33ISH3R2bIxyduhVnYT+Taicw/JbK3tE5aLtPUSWKCATCf2tC9PrktxzcPmd8
         QfQ+/bkwyyEhUCIx2C4opp7KP2fzodM2q++KwF/C0f9a3aK5B3A9snLZaBzGNK4+UkrE
         2EcSpFEEJ73ZjDufK9tZZj8uQRJal21bbyUTAY1PVs3jqCVS4sD827I7T0UWub+TN6IZ
         +Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WT22eQe8O3onS7OBK6mPA/rdypgU3bQWjCQkWTzFw9g=;
        fh=Y3rac7vYY+RY19ZD+ndjDEHUkICPEOt3n74eRLZndco=;
        b=iF0e9ibc3+iQD0cDOyegc6SQfnfxRHLjxmo4We2ENTLysB2SQTHF2UCM0jojzIJrPt
         Mx4aAEEfBwCyW8CM+1N95KbSge23lON/Ug9eEkoLZBbkXeWsZCPwaKhWprvq+QKCRFiv
         9C9AT9ON7rJz5vIlj1HUp/Y6lWF/L3np0rO4z34RyDugevtXruh+9llm/c6RFmrYBtpK
         G6wokp1kmfQfqzHF01GCJGehZ93HLOdOAI5HSIFH4Yu13xQazjbcprXz8rdkpWcQFONt
         DPGpfZUNOQ6UJH5T1z3nGgppMuIPFV7ULw2iB/nWzZ4PlohHklu8CNvdlA3tspjl6ESg
         DlFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775663861; x=1776268661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT22eQe8O3onS7OBK6mPA/rdypgU3bQWjCQkWTzFw9g=;
        b=Q2FoeZsWuUqS/CubaEc/LktTsULm1Qz7ZAfNScgzSskUoRlSBW9LiZKV/B7Ezdkp+9
         n0TJDPCas025u7dINDnEdie/1jdxaI1dKFhS8h3rKMkomXpqF8WruD/UhqlYKdIXaW4+
         2YX048E0YZZl1BZwJErf2Ql3R1BBA3qPuNBDbPgeY6K39koA2VsuVtojkKZ1KExkPFFL
         X4FQnSnYmtVUaDfFE0GArEonXuvcVPc+N/XKwPBu1DaCNHt6tktjmz8kOc+shXXIkKlS
         Dg6pZE5TAgZhZDI++3Yi6vheMsQeWSNG6oH5yQpFd0g5pQtfufbIc+dJGwS1pbgTWZPI
         xG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663861; x=1776268661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WT22eQe8O3onS7OBK6mPA/rdypgU3bQWjCQkWTzFw9g=;
        b=RRGYL7SuvWtRPUdXwJZDpQLvDNx2782Px97JQkWYEN3efBb1wYtDjDggW6FO1Kopma
         0WehvdOBxl7dQiqUB9yqexDiNITRdHPIu8Dvc5SgeA2ruT/zVzcI/0KIWwT079UvAmiN
         89xekj1IYNt2GoNyBqwdFiz1GI4vwwKFtmwZeIfwL1wPRAEqrqoX7pFkS73Lp81nhnty
         +V6duzKEXf+BrP/57sbzbvDIxJVHf0ULCcQQEoAEuAKVM6Y9WAhMivwKslhnYlNX12ks
         oUjGNkFJc/vOK3yZsy8kOIW6sM/M6KZTq/P5+D5g85fk2SUn2Sn/yl0HRmmgYaRBOzrb
         VQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDHN+S/ER5x1KNR0F8Hh3uPwZZucjEZbPyrhlo8rwpge1kawi4BAokmNcpuyIL1L02ZkPjV0QnvXjQYU75bC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzfpSSFplibDu+xNrLgycebi+46kwHTrnPc6aifmZ9PCyNUPJ7
	k/TUkncVD0I1uQMQZmKZGIP4MZo9QgcnddovFVOeRDgM/oMXxgP9Low6/R5OMzsg3zBjnGAgNBI
	aap0FXiq1K/2R3DYiTpMxiUCZYVrKSuA=
X-Gm-Gg: AeBDieuluqoH3bR8ua992B9t5iESW3VYnbpqNGFtHst+nXCQ9EQOhYYBpv1wlrHlu78
	0+IroAmGzgRmD3DolWhIEalOUCbMTexdh5SAGn0IsSmBT+0jc4jzvkyMrk3PbHuEUXPUOMa2DK8
	k4fK+Dgl+s9RPUwJs279OYQOzwtUiClxAUrJROCtZLv18ecbtvs9OTDYx3mbwgjmXDQb7dMI9Gp
	zvG1tgkjEVmMWN+yqtR5pR5SY/pzPzltnm/2Enj/uuI+HbEpnO8+GbBki0ynjaxz8ka3ZlDETGq
	L2Eccbg1uAzEmBT+kTcSlLqhB/cAbtgWHEsvOmD0QyvrO13aoz5MyuvEl9yI9nWOMhCFupy4ff7
	xF5aJ0grayk2li+wl6yLQwt07lw==
X-Received: by 2002:a05:6000:1869:b0:43d:dd:8cad with SMTP id
 ffacd0b85a97d-43d292cbccdmr30811808f8f.32.1775663861058; Wed, 08 Apr 2026
 08:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408062109.386083-1-dongml2@chinatelecom.cn>
 <20260408062109.386083-2-dongml2@chinatelecom.cn> <adZWStMinOeunjSH@krava>
In-Reply-To: <adZWStMinOeunjSH@krava>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 8 Apr 2026 08:57:29 -0700
X-Gm-Features: AQROBzARpGaxDLz1UDfH6Eu7LwXGA7jnp4IgmMy08jJSkUqOPBF6lbIjtU-iI2I
Message-ID: <CAADnVQLq3ZJOV49-EfsX+5-KRLaU0fRmaXo=G-TgTCb-efQ9dQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: add missing fsession to the verifier log
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Menglong Dong <menglong8.dong@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 6:21=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> On Wed, Apr 08, 2026 at 02:21:07PM +0800, Menglong Dong wrote:
> > The fsession attach type is missed in the verifier log in
> > check_get_func_ip(), bpf_check_attach_target() and check_attach_btf_id(=
).
> > Update them to make the verifier log proper. Meanwhile, update the
> > corresponding selftests.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > Acked-by: Leon Hwang <leon.hwang@linux.dev>
> > ---
> > v2:
> > - add a missing FSESSION in bpf_check_attach_target()
> > ---
> >  kernel/bpf/verifier.c                               | 10 +++++-----
> >  tools/testing/selftests/bpf/prog_tests/exceptions.c |  8 ++++----
> >  tools/testing/selftests/bpf/verifier/sleepable.c    |  2 +-
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 594260c1f382..beb660b4c3ec 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -11757,7 +11757,7 @@ static int check_get_func_ip(struct bpf_verifie=
r_env *env)
> >
> >       if (type =3D=3D BPF_PROG_TYPE_TRACING) {
> >               if (!bpf_prog_has_trampoline(env->prog)) {
> > -                     verbose(env, "func %s#%d supported only for fentr=
y/fexit/fmod_ret programs\n",
> > +                     verbose(env, "func %s#%d supported only for fentr=
y/fexit/fsession/fmod_ret programs\n",
> >                               func_id_name(func_id), func_id);
> >                       return -ENOTSUPP;
> >               }
> > @@ -25561,7 +25561,7 @@ int bpf_check_attach_target(struct bpf_verifier=
_log *log,
> >       btf =3D tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
> >       if (!btf) {
> >               bpf_log(log,
> > -                     "FENTRY/FEXIT program can only be attached to ano=
ther program annotated with BTF\n");
> > +                     "FENTRY/FEXIT/FSESSION program can only be attach=
ed to another program annotated with BTF\n");
>
> I wonder this should say 'Tracing program...' instead,
> we have other tracing types not covered in this error

+1

pw-bot: cr
