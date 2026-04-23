Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF43D413A
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927431; cv=pass; b=CKBMsKASqKfUkriZ6eZ11471I2+R28ZLKZYCUO/Rp0ExQz/u+6uTjAUv+nuYET4vdpJ4kpXEZYbZGgHhMGGJMB3P6kzXDiutHcHYXCBMi+tJMQ5dlTsDrJ2MCrzD4wUUtanyrm5FBlxWWHG0tNmATtOEkf9+urQRvFk5VwlVJ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927431; c=relaxed/simple;
	bh=FaMQxyMbm/MvssklYFNdPl+DM+5+46erElji7HAPf4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr/gH7kR2bV1B81RFu4rj9AaeS1TMJqiZo0UVj6f4gbi/jZ1T06CnguF0c/BJvGnCU/HJXGVPG7x6zkT/lBGANXloAVJ5MQ3i+f4L+speBSNo4F0i6O0dKLwnEkgu/Gdmd+Lp/24T5Q5K4Xv2hK/dUuQxefWqLH2uxv4MDR2Ots=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDnxWOoK; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDnxWOoK"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-42ff0576868so38565fac.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 23:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776927428; cv=none;
        d=google.com; s=arc-20240605;
        b=B28T8yiKsMKQX/ublkY2LGxMWXvecL9oT4nMAIv9AD8/UuveByce775dD6d4kvnwJv
         F9f7B2yalFlR+4qn9zpwutG33PRQX0ScvtmRZpWv97e99zPz4XfVYjErbpVAgnTtVZEg
         5PY4sAqeplJvcH2nKvl7eKFQwn+PGpqh84bEUrYjoG3RM8tCNBATcvQqIXAm3cZb9AnL
         tnPfzpZU2Vp1pebaLOlaNQA8ZlaixouGKZnK+H6u5HK68a2ohLsv3hRIas6ZGLfPHFeu
         f1V/kbnyFYZ5Fzwt6Zj4DB1IIJazFdwbXt0hislHCu6slAW792LhN/gkkd26Plkh/e74
         7v4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QB81J+kn3zUKSpeQ5Shly/8f+kNoagaKHjIgpIqova8=;
        fh=QBQESWzWrNV60ib9INMtHFDFzVMjhdyfBHYb/1Uc1A4=;
        b=XSl2r4lKrUxcXNLWa4y5N/sMJwge5nt4Lx2wwenfdPOznLS3+G6zV/OHtKwlNCE3an
         Wc1WVwnvF5FjSVp26QNcaLWSkQxkGISSC8spSJRSpDbAMNlg4EUdQbtFiFV3vmnMOK56
         fKvJiQ6WsS5CrlK5pdNbCdxAGeZ4HNREWIU4o5HeU5lkRIWE5rPcTf4/BMm/QywIkTht
         ILHuEu23T1MMIE+r2Z19veAbo4K10iZWYVk7MJ1UcyiYMtl3jQz70SRwIEZRavyGADlY
         p+bg2AifrUu1aaZaho9JvuWx1H/bMXVtX0GRbMjwyi1zynT7GHQWAJSp6RmUnhSZG6/K
         hbHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927428; x=1777532228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QB81J+kn3zUKSpeQ5Shly/8f+kNoagaKHjIgpIqova8=;
        b=aDnxWOoKVJAeiy+w1c9dhUM0ea2Ll9yoNW3Ap+jnC/MIoOsuLt3b2WFgqzbrWDO/E5
         jEAaP3bcSBvc1/hBbhw//9L9NbVQWxsjrJVrdFIYCCBl+vofnHezjMS7y4g67VYqgfWN
         FaFR2T46ZA/bYJiIeQqjEiS6055+H3bVD9GK8Ll3/bbOFClmVAPTi4MdqRdiGeChzmcj
         m6TzeQn2AzoV9uOXQxW5QL3rORPC2a1YxwNlma69uckaqi7f2/okhQuhdHHCtsROpGNy
         Qp0XnVg1KK+n3pTkFA1poNLu0kp8mF5DEL833cBCKX4kth1a81PG8+fveVeQoHTSEeEu
         /eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927428; x=1777532228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QB81J+kn3zUKSpeQ5Shly/8f+kNoagaKHjIgpIqova8=;
        b=KObBq5/SbxjOaUiIug3w6u4iBoEr/EnxLbm2vG8ulaZrxOk50vbUDCVxU5cj9E7quL
         A0klQOLp8npqZYbzTxIMerjIwSLOuOtdntHFpJzqezYPixWQ4MTsTyXINZbbULSQQU29
         OpHNZawvNAti/AY61662fVmnluJAJoP7xGqlPcErRDLfZt0wltBr9XY5OMAqoZtymm1R
         0A0sTQN10/y20K4G5t5H4qBPkt6lJc5yU1r5yBY93Z5HW9V+z8Sslg6pxlWGtDHi565L
         4FmIet6dD4LG42G1cYqKewEPAR9WKkXmNyIi7IcALeuljFNp42Et+UwWiwKkN7fZ6d3i
         wNbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/diUjXkfhLFNs2bRczGfYljwQZXBBF/64cpX6jHkMkris4k8s+tmYOOBzkyPXz4ALBRnAGX/vxhX4BHRfoMJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHDWIViBMPIc0Ivn3RNfZwRFXZPlJE+29uh1DnICXT36+xb+/n
	LacI8saqPdWYQI05zFgT3JdqabQGloztIx1tmZkbmmmaSnw1QOGk7wZZfGsQyOaiyujuzZboB/9
	GSen/hTpYejpXpWHwq+gFsL4/sjLsTxI=
X-Gm-Gg: AeBDietswFadFhFb3Os9oi0/4YghtXZIWE93cJ8T8zlsyNIIWVACC3GpC2GpKlipag1
	RpF/whi6A1we3Qb4J9rZsy+WEbUsrHdQZFRvnFVhR+We8ISCY97fqR+Th5dsm9n6NtkpFVZ3HCR
	vDWIMIgwevtQhQtPQfLcFKLep5LViZm6+WkcLFn3IFe+VYjeCfVYU+vWK7b0Hmfd3028fpqZdqF
	41IamE5hIrGZLCho6DDTNVtaSUvFSax9zZKQcUrVICcNZa+escS5/3/daVWCUdA4/aNalHfxWMl
	e1/HOTQipI18VtiTz2MuSWcTsBA+Nw==
X-Received: by 2002:a05:6871:c005:b0:42c:7f89:2916 with SMTP id
 586e51a60fabf-42c7f892ceamr7133923fac.20.1776927428557; Wed, 22 Apr 2026
 23:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422183757.15069-1-suchitkarunakaran@gmail.com> <CAADnVQ+=iEmyf-=T=V0oW2aK+dgx4S0CbAAPi4pSg=DnaHNFoA@mail.gmail.com>
In-Reply-To: <CAADnVQ+=iEmyf-=T=V0oW2aK+dgx4S0CbAAPi4pSg=DnaHNFoA@mail.gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 23 Apr 2026 12:26:57 +0530
X-Gm-Features: AQROBzCmP_tTpa9MPR2n3mcSyZk76MbSm-jGeLSvbrvMhcfw5ZdsgAHyHU-UZm4
Message-ID: <CAO9wTFi8wrhP07YikinU283Z_JVyttNrzwwgdVWz=gUvuWjzGw@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: replace bpf_probe_read_kernel with direct access
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2026 at 02:51, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Apr 22, 2026 at 11:38=E2=80=AFAM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > Use direct field access instead of bpf_probe_read_kernel() for
> > nlk->groups[0] and inode->i_ino, and clean up related code.
> >
> > Removes obsolete FIXME comments and unused variable.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  .../testing/selftests/bpf/progs/bpf_iter_netlink.c  | 13 ++-----------
> >  1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c b/too=
ls/testing/selftests/bpf/progs/bpf_iter_netlink.c
> > index 00b2ceae81fb..5930bf8899d2 100644
> > --- a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
> > +++ b/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
> > @@ -17,7 +17,6 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
> >         struct seq_file *seq =3D ctx->meta->seq;
> >         struct netlink_sock *nlk =3D ctx->sk;
> >         unsigned long group, ino;
> > -       struct inode *inode;
> >         struct socket *sk;
> >         struct sock *s;
> >
> > @@ -35,10 +34,7 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
> >         if (!nlk->groups)  {
> >                 group =3D 0;
> >         } else {
> > -               /* FIXME: temporary use bpf_probe_read_kernel here, nee=
ds
> > -                * verifier support to do direct access.
> > -                */
> > -               bpf_probe_read_kernel(&group, sizeof(group), &nlk->grou=
ps[0]);
>
> Please stop sending patches to remove TODO and FIXME.
>
> pw-bot: cr

Sorry about that. I'll test it more rigorously next time and ensure
the patch is sensible.
