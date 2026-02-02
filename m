Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB75226165
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064455; cv=pass; b=u6tu0i4Gcw+FkcOl39K7nvvPImyzaGwvwcUVk4djDXuoGLWi4JWTk4HHI7eygn/zfi6asZSVkTsJ5VAHMKP+Tl76QJTVWLfNJwaenjduE0UUNujIKUhK8HHaa0oX8GEI7jhcOAvdmkGshXwmsgpkhywB+8LZTcZEeiVigsFuMGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064455; c=relaxed/simple;
	bh=EjTrHJGCKhR5boXRYUI+Jfk/dvUeA0NTVO3B5HxvjZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW4ZAvKg1NsO1UVO0TK1882MxC0Bd1916GOoEO9DN4T73DjK5P6APmxNcKQODwum6N8IKGtMccuW8eNEgu1FdI0RSbcSxHvkqrR+BLMNTmSq5MFrZztrH/znSCUAPTOWEIb0hhwhl0xIwPWwMqjBG3/yjcvbP0eH/LGhMG1gRpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3elRbe2; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3elRbe2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b88593aa4dcso664739966b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770064451; cv=none;
        d=google.com; s=arc-20240605;
        b=MIY+nezkP12VLtWBCW9eZwc4N5xqxoVdxCW8tv0u3wpHPmbHEQEJQpfSaDV1Eoh5jH
         2UJm3NwdWZI48k6F08qYAZqv1J6YwijMyhvRuhJyIosKDP63nS2UVYz6WaYeJt811MP/
         oT8AZD8rwUAVBlAaRA+a5PAzW1KG/kf4Gi4XQfHHhuB/MMd9bMHTZPSYp25tBTZZIy+v
         w/aaVZ7xOvCmMV7bnIF84Kk/8pn+LYPoQjrB22G6IqfYA0Nmg/nVf8tdULzFPCbNvN8h
         ZXbjidF/wfRF/O4zU2vN0y7sXZoKDhn4RqE4lvf0VTyBqDDs8p1uRsd1SyNeFLznLWFO
         T4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbUqeYjip+fDu2694PTri+FtAQxkD6UXiSLsVh9cQ8I=;
        fh=hP/QyPEkEs4UM3QNM8F9OpAN4nEhInxzVzAaqxBbF9w=;
        b=KtdZsp3SeouyBLNoPPpSxk9OQKukNBg2mG4z0g3bRNxWM+HaU+nfSP2xkIEngg5GoM
         wMdgaQ3EHsGGLkig6WfDVhaKhEK0x98xRXZtGuvAFEU4bUj1v4XMwGuh0blrrPT9ZDKD
         fTBPpED9OnnlgjUMkbi/n+x9Wf/CCr5typOn+wOaYnWtW/BiD3EM4VhtdWl3gYyemE7H
         xLoX3Iks019++zfYvRGrO6iEbb/1AwnmBbPETQhli3yDWEyDi44dshkXQtcfk8pUYMm3
         4ekOeZntcf5fkHme0pogjnUbe3DKIT+r+8ND91z54BpEzUWbocxL+s0CG9/gHRNXgpg+
         zyuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770064451; x=1770669251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbUqeYjip+fDu2694PTri+FtAQxkD6UXiSLsVh9cQ8I=;
        b=p3elRbe2EDd1D2oRb06vHZgZGTMcmwQskgU1EpGm/oAB2gLoLEGe5p/7VrymgkOW0o
         HXRDCXq1iUwgFkYl5TJhkYsksO2TAi/HUFDfvN9zY4skS8dp6mhzMPX7g84CSGqDNbH6
         5q+D0K522ehaQ1VNHGoR+tMy7oC/1485cRPBMLWjHch2LAxo0lLAYambiKY1KSNnLl7H
         kYUYHsty14rIQaLGxOK5pcR54C/xIPEAFgrt3Ph2/ZuOsRr8p+LL/uu0infH3Xa5wU7V
         9SgEtY5putD/vCXtpb+9kbSlYW5yLLXb/ML6vGuT91gD2QylJQ2cILM15ZcJ3dVNH0+w
         z4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064451; x=1770669251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbUqeYjip+fDu2694PTri+FtAQxkD6UXiSLsVh9cQ8I=;
        b=R2r39iVt+3SKZMt6hhWXI/nSJPPOpGTA4eRhao9GBHzDypspk+AMeXgF7F4r/QByRq
         0m//uiS26NiShEm4idk4jLAvnnsMbnX5RhBO7aUFYSCYTUE7drMFAA8UAkgbyrtucJFo
         mEMO8hCkvBewP91R808Oybt4PCkl8TkQ60xOEFYTy2Nu4smyfP3ZEocRuOUgxnNVZiZw
         LX248ZETBKQDYx2KJzT4ZWZ1RXQ5F9Hv1uIp3/8Yb/0azTHEo37mdwkrH7mkBMVA1b7W
         EYlZWDYyUABkH8fOswWlscFEaXEHqstHi8CROo8xOaesYSgz6om9SB3aRA2BOByvv62o
         9/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPMjml0wA4WT1f/dOw7kTUhbA+20uT4VWn1LrQlq2t2Y1bPujUTQurXddzptpLI7MacfP2VVRuOAG5mJAU7gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzDrV1ssXcKcI7TZlKOefuAMuP/hj5eLHuzfCoJb1f3aDexqmp
	UfWeF724Y9tf4yXvDA3NQLx+SzqYUD8dr5ySZ3QCoTOk3QbVuEb27kXgHmF5VYZQFfhC4tAU4c/
	wAyKA2dwnjwEVwoEkskw6VG4TqJaEACBQVpz/mqAv
X-Gm-Gg: AZuq6aLm2nBCervMqsZUz7Et2ny5CE6kfYy1IJcEtfippOmlffFirb2Jf22MrmvCcbT
	oIAtOT2t2apzGHdIlqTdOIVh1uyVFM8w8VbPpglrnEckOQolVsArNx4/4qvGXffE9kgTPxZTuZj
	1BsDJmyWq/M18zycbNBje0SUcyt1/88fWT5F2Ud085fK4qBWYDO8qpsLBBUA/wXn8VaIu1sClgn
	DZpgFC3rDmzwto6j2tyCfsdQxi2u5WyTECTwOsBenw6DWypLayJ1BkSjP5eHLuIHx4BZSmQFyHU
	aM7mXX9V/TXPlfq9pQkoT+oC9A==
X-Received: by 2002:a17:907:968c:b0:b7a:1be1:983 with SMTP id
 a640c23a62f3a-b8dff8071femr749742866b.63.1770064450976; Mon, 02 Feb 2026
 12:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124012133.2451708-3-wusamuel@google.com> <baead0e0a77a98f1f54703a05fcc861f40d8f9eec0a24f96cf26df249dd1cd1f@mail.kernel.org>
In-Reply-To: <baead0e0a77a98f1f54703a05fcc861f40d8f9eec0a24f96cf26df249dd1cd1f@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 2 Feb 2026 12:33:58 -0800
X-Gm-Features: AZwV_Qg9DXmMmV2h_Maz_0xWq2nHkrts0cRt9nDGe687Gic8SPCzSfFDm2mNxs0
Message-ID: <CAG2KctpZB2EnBHccEYqGMjWiAoE3+HzV-0vpu5J8tejg5opNUg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpf: Add wakeup_source iterator
To: bot+bpf-ci@kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 5:50=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/kernel/bpf/wakeup_source_iter.c b/kernel/bpf/wakeup_source=
_iter.c
> > new file mode 100644
> > index 000000000000..ab83d212a1f9
> > --- /dev/null
> > +++ b/kernel/bpf/wakeup_source_iter.c
>
> [ ... ]
>
> > +static void wakeup_source_iter_seq_stop(struct seq_file *seq, void *v)
> > +{
> > +     int *srcuidx =3D seq->private;
> > +
> > +     if (*srcuidx >=3D 0)
> > +             wakeup_sources_read_unlock(*srcuidx);
> > +     *srcuidx =3D -1;
> > +}
>
> Should this function call __wakeup_source_seq_show(seq, v, true) when v i=
s
> NULL to notify the BPF program that iteration has completed?

My understanding is that above code is invoked as a N+1 case after
iterating through a list of size N. If desired behavior is to do
additional cleanup not already covered by _seq_stop() (e.g. printing
closing footers), then v =3D=3D NULL should be handled. However, there is
no such need for wakeup_source_iter at the moment.

>
> Looking at other BPF iterators like map_iter, prog_iter, link_iter,
> task_iter, and kmem_cache_iter, they all invoke the BPF program with
> in_stop=3Dtrue when the stop callback receives a NULL pointer. For exampl=
e,
> map_iter does:
>
>     static void bpf_map_seq_stop(struct seq_file *seq, void *v)
>     {
>         if (!v)
>             (void)__bpf_map_seq_show(seq, v, true);
>         ...
>     }
>
> The bpf_seq_read() function in kernel/bpf/bpf_iter.c has this comment at
> the stop label: "/* bpf program called if !p */", which suggests this
> callback is expected.
>
> The __wakeup_source_seq_show() function already accepts an in_stop
> parameter but is never called with true. Without this callback, BPF
> programs using this iterator cannot detect when iteration has finished.
>

If I understand correctly, this is not mandatory. For a
straightforward iterator like this one, I'd like to keep it simple and
not unnecessarily handle this case.

>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/213068=
80863
