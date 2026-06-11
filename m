Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F9E555
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140678; cv=pass; b=sr8ayId4OmEptZBfJgeCWkhSYymgkUbQA6xoejqo/A770tAW/wE0GrK4Jb1vAlgthBVQ3eZMtpGl80FNhBl1VOXx8U44WMxp3/G57d0K+DnSsXGxtNv2rYVKKy9fiWeOZHDda83LlYAGitzFsUEN+GcMC4X4u7sDRUEH1zZ0hSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140678; c=relaxed/simple;
	bh=y6kzzG3ct0h6IoHvAD4R7WtfG1tsXtsc+74I95kF+5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQn7HllgEOvMqa/OIY41lOttuhvSAuLufz5nmEPz9zcTlBdXeY0sm3RtCFt5NHisdtiWeoFYiq2tqReiIdWt2uhfhxVu6hpugNXA6A9F5q1LZhA57dKZSgmfKIUSXg4YoujSM4xL2Nhgo+nA5bfvnQNkFVO11C95dyRQ5R3s6NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1DPFvIV; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1DPFvIV"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7e16f05fd79so79936477b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 18:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781140675; cv=none;
        d=google.com; s=arc-20240605;
        b=Wn1J08yYGgU72hHMoMiSdod934XvDGZJDagR0GE+rtlvqB2eWJLDhXLnNxrMOi9CSL
         CNPERp4rvrFO8wERTLD70YcVGxHEofKUKVZpMzxr09lclLOPVkTqfjTtoXiv1+oNrXjP
         +J+4TDkrKPF/GqAsboBDqjNUmDVAA6gAkTUH/enoash245gPMUCkr5fbAzFIUPIWvtpE
         Wkmnbr4QPzPnmSO5pODElP3ZNXEIjKNoWBEOujexagAbDTlY8nmgS1F+oT1GWvPWk+6V
         bW1VlL8T+R5OAxI8QmQ9rZVrV5HweCObFZPjQICde1PreETOc/lP97hSvG6NIi9T+4kt
         QsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwpdyNCQVE9Z0vBjg+vKg/1VB56zfLGyeI5CigKesGI=;
        fh=F+fyiIXrFMxFynneJ22J1pkfpdLoMMc1Q03/YdW/G7A=;
        b=XS0eYuQvDMq6c2h/L4z86cJu7KSOufQQVWaVfVpkw1mquNRC//gHFOSL2XP6k/jJOm
         W8VvRUSZ29af90oKesREenOiYC2yuzIxtN2G8oim9gw15O7fnj0IMtn7vEg+njGNCOt/
         vclNm4YJ834b/CEN5NYnh9VBhOe8+9Jl/7HmHYe2R9TybmdD7ViwjDpap+djHQYd8qjH
         m9FUzNXmWFJo5AOYsbTBuJFxuTrietekbytXuuOry5hOmIfKY/Spbg8ObvZyK/WM/J7z
         KhSXaUiQACK8qkdOG9vF93pGo8t31GU0IssX3m0VP9TWVYfRb99QUoEsLMnXG4F7Vxa7
         oT2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781140675; x=1781745475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwpdyNCQVE9Z0vBjg+vKg/1VB56zfLGyeI5CigKesGI=;
        b=k1DPFvIVaJUG0nOCozFMPM7VTT1VRTdz6b/erSM0D6FJdFyzsu8I9bkzXbRDvldUVR
         o7EmWMu/u1ZqsrsPzmr4oj1slHt0VURPq5WDlsGMJbk6rXhKkp7ATlxhpoNenKZGEsGl
         Cx7hgBJQ5sYtzvmRZAPUMwwSCnu8mU6dqFr4hmaqswcRdT1fj9EqNohlAyGcOUYg16EB
         T4qUyin8OQ6elJ9d9MZnNWkslxZXl3d5eanQ5StrgGbMvOsjHr/R+ZdtkMt7dVDk/0NN
         3MD/jFHPy0Q0UbLbLBGX2b9K6qZ5Ad2N025qBEhBuS72QN4QG9hbyzNLvTHdXb5jiE+t
         LNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781140675; x=1781745475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwpdyNCQVE9Z0vBjg+vKg/1VB56zfLGyeI5CigKesGI=;
        b=BrNCvdYkuUJFMJzi+kz1zs5MuwLgjZyC76qDZddMcffjx67hEn77Wwo3TJXgKeThCk
         15+i0PScCGQtv8mQAewsJYnKSbc3KslS/OujWfGlCzBVKUQxPuLTxrI19/PXcfFeVlXL
         wFbUc+2IPHD0GtzTu0fvFVvYzj3d2XffS6+4ckg6XaLlJwsp/TjZbbiUd0D8je7eCrY4
         Gdy+gvnaK3kLao+1Vu/T+AJPXB0P0TtlWaRb05WWM36P0hNL4eZhtPv/v1AeP75HNqXU
         1/IXZ77RzvOxsegR6f0pg11pOhkrMiuJTrAcVLWSivPkhM4bhxoA/iu9u+LQArgbf0dH
         whdA==
X-Forwarded-Encrypted: i=1; AFNElJ9+c84WgdD+7apsnTStpCm8PwVG0XByzxik852JeI7ponrn4VV7YDz4sG+KxuWH703cvjUT4R+z0YKt3+6lf/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqizSH2/GFzlXDCsUaHvo+33ZuukPKsSK1kNA7FNk3d/2HbCYu
	7uf2YqH097QwBF4K0YD/1KDO3eMEJnLlxaDnPNW96QpLKbuj51wnqt07PhhGkSQYXzbf/ZU3WlQ
	sILRxQajunGm2balISgZ/zN7Trr7hUy8=
X-Gm-Gg: Acq92OGCs4nDrWKnBhdDO7vDNrnwJFf+SW5hC96+qlgVU0/DZj4wQ1sEZrPh3yNdeFJ
	jEjM1kOpsM4+sEiBwAD/44+XtJ1RucknHsH70N+PcIMzNRgv+Nr5zhto6Q+yPMfnHoJCUqAyCRe
	nqPS1aDpIYtWPqTHcaNLiRwaUnPgsi+4S0jG+qGxnaquGu+IyDVsrKgL1fl9lRmeBN2MPvrpRYI
	QW0ldVI18FjhSN81elbprort0K7ume2SBVRmxgOfe+sseUWkClFzjXLNJoibXLY4Ikes9MvQsXo
	kf6c2pai4uAIH8744dMnQu8bQCEXGYXMJR01tf6xZR9t8dyhlwaKcv47Mls7AeAc9gf+PQ==
X-Received: by 2002:a05:690c:3392:b0:7f4:fad5:2084 with SMTP id
 00721157ae682-7f6559e6bf8mr8454907b3.13.1781140675216; Wed, 10 Jun 2026
 18:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610102850.483291-1-sun.jian.kdev@gmail.com>
 <871peeacre.fsf@toke.dk> <20260610075018.6162cec7@kernel.org>
In-Reply-To: <20260610075018.6162cec7@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 11 Jun 2026 09:17:45 +0800
X-Gm-Features: AVVi8CfDR3TXqyYOHmrrylWsHkJhrNSrybKrnHMejG_1zq7GSb6GOaAcLezoD7U
Message-ID: <CABFUUZEKS9P8=hsboyBj_f_9W8ycZHVG3GwqmtcnUoiRgh8iVw@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf: Run generic devmap egress prog on private skb
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	bpf@vger.kernel.org, Menglong Dong <menglong.dong@linux.dev>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:50=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Wed, 10 Jun 2026 12:52:21 +0200 Toke H=C3=B8iland-J=C3=B8rgensen wrote=
:
> > > @@ -700,12 +700,22 @@ int dev_map_enqueue_multi(struct xdp_frame *xdp=
f, struct net_device *dev_rx,
> > >  int dev_map_generic_redirect(struct bpf_dtab_netdev *dst, struct sk_=
buff *skb,
> > >                          const struct bpf_prog *xdp_prog)
> > >  {
> > > +   struct sk_buff *nskb;
> >
> > nit: this definition could go inside the if statement block below, to
> > make it obvious that nskb is not used outside that branch.
>
> Or maybe move the copy inside dev_map_bpf_prog_run_skb() since it only
> has one caller and already checks if prog is NULL?

Hi Toke, Jakub, Jiayuan,

Thanks for the reviews and suggestions.

I'll prepare a v3 that splits the selftest into a separate patch, makes the
DEVMAP_HASH keys deterministic in the last-destination test, and fixes the
Fixes tag to point at the generic devmap egress-program support commit.

I'll also look at moving the private-copy step closer to
dev_map_bpf_prog_run_skb(), as Jakub suggested.

Thanks,
Sun Jian
