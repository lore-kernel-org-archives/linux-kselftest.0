Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530A27CCE0
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890569; cv=pass; b=OfxvCLr/zXhvIvPkjcExwA71Bwc7k3+TacTYdxRPNfpYktfWBh51+5ej4y3BUgTC+9/eqMeLOuXmhi4e9sBt6PSf+fw0ogHQQJJ8nnuHfQc3x0/NsnXpE2y1m6PIAerHM7r3EEIp7nagpius1Xd3iw7gkRPboj+XJU/AewqV1Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890569; c=relaxed/simple;
	bh=BFemXMudycvhy7VKBn3rfxUxF9xbuD2nUdXBvRpTrK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wua4aoFQhzDSRj52Z3CQ0p6uoPEvgHRIYw1F2CzJsg7fYYgIf+pCO05JldGzehkTkmh6uL6/xFUCtDrDmWQJjRXofFgeT97Xb3HfyY4HZ758dDT9nRAumxH2ZWsiCOeJL790kRlB9ffXdXh8HniwKZ6v4C+txQ1VSXDmOhlTch8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRgTeNjs; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRgTeNjs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b96760easo52138955e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 10:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774890567; cv=none;
        d=google.com; s=arc-20240605;
        b=K9iK0+9xLX0m9ZZnIWzDjRtmZLE9emDw+SSDA3XB8kC3AAwFTPsXdfaGwST2V/4/SI
         PDpcT6VVBQsOIGJJUfwUiA7f5vS+L/Zbf2YP2QyIwdWx6/e6mm/G07gjh8IUpax0aKKX
         3QWkdxKQO9GxGCys+wp8Rin7ZHMGJw6swPwTYhjTrssN8NuUNsWh5PqSX4zu9UfmaWvw
         doLU98EsGtxD10XyBQs7JBAeVBf/iBER0S3AHvpDgbBAu5APZIM5SlX8614DBh+pOShE
         Xb2UBwnv7/Sv3ZJKG8wTPwx71v31cPKwg7DyvTNeBJfr1gmSXA0qA+FrtlMV0Gt+vx+g
         mEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TwE8KztaklZBq9sKK33xBCWN9vot3XXFqQoYamj0MHI=;
        fh=KJbr5iMuEvp5GGPSEyjXCVBuYlWNpIceSNJQSoVOLwA=;
        b=gwTUwauH/pKm9OqR4TUp/tBqdyPfUhvNVPyEWE2rZJXrmWA+RHEQBDKylMsC0W3lB6
         2TSlqzqhmUTF2WK7+MjVKDaujmYDeetMT2Ge3+xsJth1DroxR+YwQnUD889H6BAKs3dk
         QJryW3EEpXfGzR58aAyzE+zR21aZR7S9rhzUuZyfckdJOZechOBfjeJBssL/AoEWHfjD
         amrw3+56mbR0RUdK49fMeNc0Ex6LCkTvjX/xiYFPYIwNOLYpX5TGC2Eha3fkoqRH3Dp3
         8wJcpFPzwx0BEASgiVTwNvRU4671hcId/NiiJ0XfiDa362sWlmwY0DjfzdP5IwU08QtC
         CQNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774890567; x=1775495367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwE8KztaklZBq9sKK33xBCWN9vot3XXFqQoYamj0MHI=;
        b=WRgTeNjsAHA+8MVJfnLv+cHjD4elhOZdP8PrYIQUniLEdhi5H8TFpOcfTs3RD+32SG
         Bdnh1GGQdw160WSaSOtctRfUYm0SpiEykLHBEcAdR+4H19TxYp0VTvh+2ypiGVNSqmNY
         vX+XDoAnKFl2OVugaTYTkc6R221xn5asfqa6UQisFVtW4iyS3P2lZBEln2mrnoUmuBay
         fsQnRRKALyfbPDDcepxNf7t+HuJTJpc+Whsf879Jy8LdzoyUKLA9RWpnRNh15mQVN3zW
         XcoMhT97zSwIa2oe0bTTgjsuzliGsOQG4ovH24dNYo6tTkIiYO8J9VCAyH4bysGY3MrV
         2AxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774890567; x=1775495367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TwE8KztaklZBq9sKK33xBCWN9vot3XXFqQoYamj0MHI=;
        b=bZVJfignXS9QLXX00I5qWBAvKOlE9h7dkS59JJJha0n76iT9gIkClIFe9jI4Hj91Hk
         fFY5nVYe+dF1bYV2FA2uN4xO15NvxXOY+rnMukqqS0AzR+DDcMcPmZkUYL8J+joT8kCY
         M3444fTY3XhnmN6SQxh3ASesolNNySAlNHSrwFPzSq3dklRRrvkzREGckLOzsdh+OwPK
         iKH+PDnHIcxqknpO20OrlCyWuG8eUswEd1d8zQwTnPkaA+YJTDIzJAqRGn6f0aE9mbEH
         graF+AofgDEgxj1U24e+7fZnuWvQ0O5RB03I0/2uckvdxE5xSvjqely9BtQnLK49mfz6
         rJoA==
X-Forwarded-Encrypted: i=1; AJvYcCWCUg2dmMzcb1yGlQuasxft7uP3TXCYlHay4tX7pqeBEZ+nhhcgFsu9mX7/A9S/LXhygB1D7pq1IJa/LXCt4bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2y6e9EmE6V7xBTfxDzawMkrsHchjOBKNhoY9wXz/vP4YInwd
	TJ9KHZWHhYKuoHReQrHmmk1g2pRHEAyRURMo+3p33OEykzYYRZUB1DnUaKzH5zB3tZGls56HDO5
	A5WmbasIMEhso4Ahu9VdEtHcljl64oBI=
X-Gm-Gg: ATEYQzz59HLaeqTFohe2QVSga/aBZaJjXaZmKQecIn/pUdaSZS8GXqcQbQoB1S3DAIP
	Aj7tTgppOhBKmx1XcivFBJXYqHS3mR9OiiBX2XQd3NHns6OCyS5pKv1lSCFOLuRO3jUb0Z2drcv
	BnYCggFVx7dXXHSzMRy+AbrbCwEo947wKgyaXasj1R0c5cMcokVrd3ixTabSaJ326thtJoRrdHc
	26klooQgzJZBb0xP6Fl4LgE2pg3YCBvEN1JZMwbFWqOlHYP3fsuzo0dqEQMeQUNVsT8NcFcZIiv
	t6wkAtHoP8zcZYeRBXkm//dwWLP0vBO+GJ64RhkPHtNmO4mx52n3lS6SlDKSvm1Kq18QYHHzZdc
	nTlCRpa75rDE4LVkdxr3mNhnXTw==
X-Received: by 2002:a05:600c:64c3:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-48727d59bb9mr221663405e9.7.1774890566910; Mon, 30 Mar 2026
 10:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326141718.17731-1-leon.hwang@linux.dev> <20260326141718.17731-2-leon.hwang@linux.dev>
 <CAPhsuW7vwp6pW5RntKC+Gbn5gTcVg3vsm6LVc-y2ssTeauZayA@mail.gmail.com>
 <d19336f5-5373-483e-81e4-326aa9c7801a@linux.dev> <CAPhsuW5LKnuZ=wReS+_VtGOs2sefd73a=WUCdaZPho99JBaqJw@mail.gmail.com>
In-Reply-To: <CAPhsuW5LKnuZ=wReS+_VtGOs2sefd73a=WUCdaZPho99JBaqJw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Mar 2026 10:09:16 -0700
X-Gm-Features: AQROBzDRpUwtx2yU1MijSbP7LENp4KbHkTJu9H9iib-WKuc4m0vP_JzIrbkUgx8
Message-ID: <CAADnVQLVEoytOJT4kVAcnzKqEJk0AhGxPCK+tMTKwpK_DJ32sQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Fix abuse of kprobe_write_ctx via freplace
To: Song Liu <song@kernel.org>
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, 
	Toke Hoiland-Jorgensen <toke@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:44=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> On Sun, Mar 29, 2026 at 10:38=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> >
> > On 28/3/26 05:39, Song Liu wrote:
> > > On Thu, Mar 26, 2026 at 7:17=E2=80=AFAM Leon Hwang <leon.hwang@linux.=
dev> wrote:
> > [...]
> > >> @@ -3733,6 +3733,11 @@ static int bpf_tracing_prog_attach(struct bpf=
_prog *prog,
> > >>                 tr =3D prog->aux->dst_trampoline;
> > >>                 tgt_prog =3D prog->aux->dst_prog;
> > >>         }
> > >> +       if (prog->type =3D=3D BPF_PROG_TYPE_EXT &&
> > >> +           prog->aux->kprobe_write_ctx !=3D tgt_prog->aux->kprobe_w=
rite_ctx) {
> > >> +               err =3D -EINVAL;
> > >> +               goto out_unlock;
> > >> +       }
> > >
> > > This also blocks uprobe+freplace when prog and tgt_prog have differen=
t
> > > kprobe_write_ctx, right? Is this the expected behavior?
> > >
> >
> > Intuitively, yes, this also blocks uprobe+freplace.
> >
> > However, how can we distinguish uprobe/kprobe here?
> >
> > At attach time, uprobe/kprobe is recognized by the target perf event
> > flags instead of BPF prog's expected_attach_type. Thus, we cannot infer
> > the use of prog by prog itself.
>
> Maybe we should introduce an attach type BPF_TRACE_UPROBE in a
> backward compatible way:
> - expected_attach_type =3D 0, it could be either kprobe or uprobe.
> - expected_attach_type =3D BPF_TRACE_UPROBE, it must be an uprobe.
>
> With this flag, we can allow uprobe+freplace when the user space sets
> BPF_TRACE_UPROBE properly. WDYT?

New uapi just to fix a narrow bug? Not a good tradeoff.
