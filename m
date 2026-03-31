Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0A2C027C
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 01:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921753; cv=pass; b=V8hqWp/GdJQppAF50eN5FKUz4c62IiT7Cg2sUXVugb8/Z6RvPFSEUKCcJXGf6Bip40q6bZ4Lu/F7+PROl2LGrRL3p9KwCOn70hXio5MnGw+pT4V4r3HvK4x8GJn9+XCk3WMO0NXsEBycBPWye8Viur6FoTAspuKFcj8YmV3kESc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921753; c=relaxed/simple;
	bh=7mR/FEIdKpPoOSaAjFMxtsc2cy77evN8pkvL1lLQ1Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrSMOV6QMZaXIWIss8vUKHs4GJyHZdI6yVdcavVEpWY91Vihd7CZvupcgk8McHd5v7aWfqGSgjraFfO0Dh+dSI/RMuOyzFNTLBmSn+I13QlOr9AYGSOD1x3hGjpWtLnhVT68JXURpiItE8pz+pGKSMYVU2EvL4EPFgzutUe2n6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DfPphiYZ; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DfPphiYZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so49243221fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 18:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774921750; cv=none;
        d=google.com; s=arc-20240605;
        b=IAuHU1UYUSsipZ39Xb27dBp7Ql+NZBgXd9PPhqJ81xmq0sxaRuIxUqLCvi1RKI79Hp
         av1xM7fK/gDP2sVFS9UkxFxeNwekozUZJvCnAH30eqZ8u0PqhUnz3IcpYh4hrVhQR0u5
         AhpcMnBixaM9q0uKSj9x1FQBagEv1nltceGGHkmNTJKV61VpzII/BNdEAIYcAXJKq3i2
         1q8T/A43119yIVRs+SCtNj1p5tRehrCYYcPBMQ9duZBbPRy7GV0k9JHKhKF0ph1IwGjV
         wk9VgH4Zj6BDFPW+t/SzEqp3k0tnAPUhEbe+/CjdBkGKYloxmeOoYzsgG/doiWM47YBe
         QOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUGtOhZOkkF5yLpH0AKa3aJ1gvm9fmOUPIXTqcmi7t8=;
        fh=jIFpFq3VhPzK0yxogQIQa9r0mYM8GSYvoisUnbXu1N0=;
        b=RUL0/Fi6ebkLprOlRYNoDFtyOYpZl+q18R1kPe3vaEV3uXt4op/C8B8b/s4l/ZPcfx
         Bb8e7PsF2Js90znlIwj6P3eBfAD/sA1LPXLsBCEmBQ3B6lWRkl0UBnm5CqMDhhHDARUy
         o+Dt3gzzh36xh7WuWyrk6H05RrvWbmKqQITTtB8HEpSFAVlf+2vlUFR7mdBpoG0Ezs0N
         rYjID/4hs0EV0TRcwTa6FG7bV3HBF0oaBf86dLbUqzI/nOO5jAOpGS2vTb0LxWCMeur+
         VREPIxk9dFxppbxbeFCb30R4j7pTO7kckXgIUf72IaxS/xlSu/1EmXNESJnC0cmF6Kia
         7hyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774921750; x=1775526550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUGtOhZOkkF5yLpH0AKa3aJ1gvm9fmOUPIXTqcmi7t8=;
        b=DfPphiYZb/JwEcGivLxq3r1DPsB8Nlxp/PygkywQHzhGSxeU0dRdNyx5b90kpReTPI
         lIbCo+j0yQcPu3dv+/NZW5AzrY7JLPakmd2555HxFA6UuyiOiRNREtwqPg+855ZRFGYe
         NKoRFhsPj6PH3cPup9FnEeA7yJR6+LnZOJLGK10tbE+v0BZQ58IoxUurw04yt5+5chSV
         t7HHnLadzctnTkIYBdQ9DjR6E3UWfoZu/Z5WQTvdGgKS49DGAvMup9tVp0g4sNSZqU9X
         3UtAUVbszkyXlvHSdfBBulTR42GJO7E++qZM5uGYzL09U5fGjxHGWndKa+wiz7nQYnmR
         Z46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774921750; x=1775526550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUGtOhZOkkF5yLpH0AKa3aJ1gvm9fmOUPIXTqcmi7t8=;
        b=SrfruKdeSWYYST2ez2+GLe4mzZM4w+yjtlqA0WxAHN+5Qr1JgqQ/f3j+H3/9eYNWhB
         gf98yKEQBYtzHT0NbmBeI09wTFmmz7D14HwJtll3v+GVNLQs2H8+PazLLFoSBMojtzqH
         wvxfXzu6x69hY8+05emvEtEBNUxh/UF13R3qCkUtYEmkA/h4kPUswxrSGpxfPFZKcrbf
         GSDbYK1V4c6JshFEG107joS1pXZJSoz0SqZ5eH8Hpkb9+YFZPd58OdHf0CKZUdlUO5CB
         snOBFmXWjc42Yh2b1HhMgp2IKjs0hCZeCZ/NGpKXZ38NbDFeMZtP1y9hSFbq7367H+yu
         DQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNo4aL5uft1Tui1hMPFWKZk9xPnTH9n3gwbjIFTicm9/HAUHv1WE5uNJGDktHAkGO1OSqCGnVrR1nTfcSNwlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTP/WIdwCZ/F0P8aF8wOEcXi8N1ZYiDfd+ojkAsi0ejpkDuBW6
	UW58piZRtpvJBT+e84zyfkfWBjjWgCp+q8QKBSRVUTfwtAlW3xhhPx/WGpeQiyOwbPYbty7E6OU
	m1LXdpX0fVXoWFJVppW6T8HuluTMyhpy8ajUPYhr5pQ==
X-Gm-Gg: ATEYQzyGqyONeFbD/6NLgcdK/J96rea9B8oauj0fHvVL48JxPXMO1TQefGi7yQLcSL3
	wK+0eSC+MjHkxnQix9vtTH16x3+o9jKzNwDyzjf5XfgVM1C58jlJgzUUHfNwjrwvDtj4TxBbl4l
	xETnA8GbHBCPx+cbvH7UB0tWMORjt/ZUarw3Qtx9KhSxMgyzakvnNIVkynr49mFi6BzClvRAshh
	78quZ/K7O6Hlf64HmkK+9E2qdbedDmmtmaMs0MFytoBdwJpn/dUpvE2hDxyKtkZWmWGM7+BPpFh
	82C7qMSdTCCgOkpzAyQTnpXjvzlp0sa1e5C/u6lypg==
X-Received: by 2002:a05:6512:39c3:b0:5a1:3308:2a16 with SMTP id
 2adb3069b0e04-5a2baacc22dmr568745e87.1.1774921750496; Mon, 30 Mar 2026
 18:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124429.689912-1-hoyeon.lee@suse.com> <20260329124429.689912-2-hoyeon.lee@suse.com>
 <CAEf4BzbA=drhPq9tsD1Dj1wt_P0q4LNtuNSM96CWVuAVBrKrvg@mail.gmail.com>
In-Reply-To: <CAEf4BzbA=drhPq9tsD1Dj1wt_P0q4LNtuNSM96CWVuAVBrKrvg@mail.gmail.com>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Tue, 31 Mar 2026 10:48:54 +0900
X-Gm-Features: AQROBzDigsL7IRQLglmAi0nGJYVWiLB_I2NXsLdUS9C4uuHL8iG0rgEEhOuBIgA
Message-ID: <CAK7-dKZMjW0t=CSkRYuUudnAY--BviwVBJCGH11g6csTKBwRNw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: allow address-based single kprobe attach
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:33=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Sun, Mar 29, 2026 at 5:44=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com> =
wrote:
> >
> > bpf_program__attach_kprobe_opts() currently attaches a single kprobe on=
ly
> > by func_name, with an optional offset. This covers only the symbol-
>
> have you tried passing NULL for func_name and specifying absolute
> address in opts.offset? Looking at the code I don't see why that won't
> work, we don't enforce func_name to be non-NULL
>
> This NULL will turn into config1 =3D 0, and offset will be config 2,
> which I think is what you want to attach by address, according to
> perf_event_open documentation
>
>                union {
>                    __u64 bp_addr;          /* breakpoint address */
>                    __u64 kprobe_func;      /* for perf_kprobe */
>                    __u64 uprobe_path;      /* for perf_uprobe */
>                    __u64 config1;          /* extension of config */
>                };
>
>                union {
>                    __u64 bp_len;           /* breakpoint size */
>                    __u64 kprobe_addr;      /* with kprobe_func =3D=3D NUL=
L */
>                    __u64 probe_offset;     /* for perf_[k,u]probe */
>                    __u64 config2;          /* extension of config1 */
>                };
>
> This is the same approach as with uprobes, btw.
>
>

I tested this after your comment, and you are right. For PMU-based
non-legacy attach, func_name =3D NULL with opts.offset =3D <raw-address>
already works today.

However, this does not work for legacy tracefs/debugfs kprobes, because
the tracefs event string formatting still expects symbol-based input.

So for v3, instead of adding new field to bpf_kprobe_opts(), I'll document
that offset can be treated as an absolute address when func_name =3D NULL,
and make legacy path support the same raw-address form as well.

> > based form, not the raw-address form that the kernel already supports
> > for both kprobe PMU events and legacy tracefs/debugfs kprobes. Callers
> > that already have a target IP still have to drop down to
> > perf_event_open() or direct tracefs writes.
> >
> > libbpf already exposes address-based attach for kprobe_multi through
> > bpf_kprobe_multi_opts.addrs. This commit adds bpf_kprobe_opts.addr so
> > that single kprobes can be attached either by func_name + offset or by
> > raw address.
> >
> > Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 88 +++++++++++++++++++++++++++++-------------
> >  tools/lib/bpf/libbpf.h |  5 ++-
> >  2 files changed, 65 insertions(+), 28 deletions(-)
> >
>
> [...]
