Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623603EBF14
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 00:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856565; cv=pass; b=VFfqDs1hT6KkieAC+RrrQb90yGBXeC8pmYSaV1pKY3tVVTQlW/5c+OzhhaGyqeVvdw9DlJxg3+uyjmrDtnEqoUA3ZnB+GpPuPRKes0ODj4S6IPIU91bbRSTbLro5OeHl+MfOvGAnmTb0uaTMCGIrR96C1d30GHEjk6SdXHDiY60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856565; c=relaxed/simple;
	bh=XdAcy1RFVCA0eq2T/NMlU1dD9CXy+pSvKgYe0WCodyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcMlpimmO6zG9SF5FGjA4SswtfxuxRFd9Yi85XLqfC0PVJ6U/K9ShEQWC93565Pb6GlqiTIiK8ayLFeNDzx006aoNy5FGWtN39em/ly3o5+FseWRzqSnZIncQjtx63mCxicJRpNxuHmlMeagH2AOxLMxU8vE5TWbZi9nsGdV+Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WrusRRl0; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WrusRRl0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65a3fdeb7d9so1942898a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 16:36:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770856561; cv=none;
        d=google.com; s=arc-20240605;
        b=bJciaQwplBzJZE1VqsSK1AT2GGZFBSlp6GEyP9swCt5ZbfmphBTzScHTs/DkD7oFI0
         Xk0Pg0/28B+n8dZTYi51YYAdk0rGkJmIjNOEnGb2PDHFcGDTD+pKDhBqCeUi2EBM3l0D
         29PlYMgmeA6+HHXJy95khnqxLCzfayXXBa55G3vi1wJmJwHBUDquqL57ZRdjsPhf1KQw
         UpXxYNBJiw8/ER83qgn++xSW4nsRY6UfTRsbS8T1Ox3r6BSkGkw3WixV3z5VTMvu7gpa
         83E8jhVrw31f2eDyB9k64d/CghKzN758WEXKmkL6P/PDfLYE5lBCEuJE0kPFjLbVj5D0
         CgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/qABditqdorMY8GlszRCaOVFO4i9AqMmA5efRo8ZvMo=;
        fh=lvKawU40K2X5BqejNiaPiQzZfpTZd56Xitp64ujP0RA=;
        b=lmh6emjnOxKpwh730zf2AQPxVoUDBvKNoEQaQabdU6bxSPevg3hwUPxSc0K2ef856j
         e6DWV5cNltC5+uzj3K/6H6iSwoTYCxISme/yx8gWUBxwRXfU5ZoUcurVQA7ewUKk/X+T
         coKHOaZe5gZqMwbPVKXhWtjJRVVjr/700QxpGzcndp1e1EKo7hVAMoFJ9jlBAgel5nlA
         Qt+HzS5/O7BdXNpDDrlXe1dywXtpEsH6DA/XhI3bS+603Wtlf/p7ybuJ45iO0BlsqoE2
         7nFduwb2hQd3k5WgZIDbWpe28bAUDZP/HV2ksnxOVR4oYY4x01/BqspP5H2QMnhCs4/F
         r9Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770856561; x=1771461361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qABditqdorMY8GlszRCaOVFO4i9AqMmA5efRo8ZvMo=;
        b=WrusRRl08CltGucQ/i9uYwAQudsowEZGgNjcsyziBDI9hMZbwPyG1LshZ7ajSEnvvt
         Jg/BIuIKT4Hkx4J8plV+HPDfR8JATt+qHEqw+DXIKJrYrV6vB3SHnE5vCQOhaAD2MCNy
         HKK1kP+1s2Yl1+yjv7D15z2Ru6SK+V7XDE0OOOo8EQURH32AH9gKfKXQAJ8KGS/DNoFI
         Ig0mtNszbABjKY+oS5bsKKuncK0RUnqfk4P9o78hnNswyeilfud5nOEbPiZ7Wx6jXNea
         5e7GPGKgO7FmZuTw1+DHZoxFzJfwxid5nnzuOmwSb7Ki5EhP7S8Cxo9FrZC36IT8q4Mz
         5CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770856561; x=1771461361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qABditqdorMY8GlszRCaOVFO4i9AqMmA5efRo8ZvMo=;
        b=Bxwk0T9PH9fQ5F1e40G5BhNjbHY4RNzfIiSYfUFdqm98FoS7cYRybn5462KMF3utPg
         uCMbXbzssH5F13TeFNa/7ugicNFEB8LCkiEsWippUOcu/GVwQIT8oZYtPXHBz/1GZSBG
         bX7Eyku0g/a5SZUghfqz6qUxyEtgJMlE47WRM/YsAdK2aQzy23N7z89F232dBM2TT/AC
         vE9dUR1ki9aLxpfLy9uHBcu2SGhMqqa6olLGqral3RobbqdJqD91zU/+gSiR+2lQxYkN
         7+tLje8aXsj8yOAFTq49Ps3tvvHPpcBBWwkWi3Ge20nzLiiyDP7zJaQW9CVB5Kcl7OMY
         RMTw==
X-Forwarded-Encrypted: i=1; AJvYcCWZWWAd+wQTUcyiFs9B0arMwDOrGYiQF5E30HgN6Bx2RwmoaojmMT+8bUkYS49dmyeSbgHwrP9Jxz1Qel0/CKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaf8A6cuMCXd7XE4b8Q/hvRD6lzCT1j86q65YWgmBjzszgCWiG
	Rs7tS7ZccTfyS9MpxWn3ptKI2ybukrpVRT720WdS4IpCKCgp7Cym9C1qZemIJYpCvk4pqGn0xxz
	y1Afg1DxDK3b5CkW3+s34QaFOa6A/gwB8pr41GofO
X-Gm-Gg: AZuq6aKpS2V/6j+Xdg4+RHELRZ7CzKmk0aZQsb1+FFS1bkEaTmaZ7JFTI/ikLhw9ZbS
	Nk2kH/Hk+g6Clt1AASzXCDv8ncRaXJP6tC1Hp8hkjdda8ZpQ6qxJK/22a1VMSD6Tp52/TMzwI0T
	U3slbX/uHGRQcCkTyfYDP31dEzwk3g6swrnrx5nOwe0gLU2btd/T/zyCJI1AOwj+Cpilln+WrcW
	IuAjPmepQIBl/2r2bd0dCz9elhTs6pf27BpooTnLmI7I8XQaGEZc6WiKmMIE3bsmCZlLNVwa1qp
	s0W0M6eRU5SeMYKXpGFt0bNMCaj6bFuEIP77KkPPGw==
X-Received: by 2002:a17:906:4fca:b0:b8e:15cf:78e3 with SMTP id
 a640c23a62f3a-b8f8f8531a7mr45691766b.62.1770856560501; Wed, 11 Feb 2026
 16:36:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211235055.239024-2-wusamuel@google.com> <957536c0c710b7277d3fbc374ff4299bb38542e54de680aaa16d46e72c503e10@mail.kernel.org>
In-Reply-To: <957536c0c710b7277d3fbc374ff4299bb38542e54de680aaa16d46e72c503e10@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 11 Feb 2026 16:35:48 -0800
X-Gm-Features: AZwV_QhoQjc3qfgFkcvMcmU0GlRusAKXgy3l4Am8cmehf0eiZaDBQu0iu37yTrw
Message-ID: <CAG2KctqkkNF0aB3f0BmY-7us2DgHvGOpHvKUL9g8af0usz+Nuw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Add wakeup_source iterator
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 4:19=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
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
> Should seq_stop invoke the BPF program with a NULL wakeup_source when
> iteration completes? Other BPF iterators follow this pattern:
>
> kernel/bpf/map_iter.c:bpf_map_seq_stop():
>     if (!v)
>         (void)__bpf_map_seq_show(seq, v, true);
>
> kernel/bpf/prog_iter.c:bpf_prog_seq_stop():
>     if (!v)
>         (void)__bpf_prog_seq_show(seq, v, true);
>
> kernel/bpf/link_iter.c:bpf_link_seq_stop():
>     if (!v)
>         (void)__bpf_link_seq_show(seq, v, true);
>
> The __wakeup_source_seq_show() function already accepts the in_stop
> parameter but is never called with in_stop=3Dtrue from seq_stop. This wou=
ld
> allow BPF programs to know when iteration is complete and perform any
> finalization (e.g., outputting summary statistics).

As noted in the v3 email thread, I don't see a current need for
additional handling at the end of the wakeup_sources iterator.

> > +static int __wakeup_source_seq_show(struct seq_file *seq, void *v, boo=
l in_stop)
> > +{
> > +     struct bpf_iter_meta meta =3D {
> > +             .seq =3D seq,
> > +     };
> > +     struct bpf_iter__wakeup_source ctx =3D {
> > +             .meta =3D &meta,
> > +             .wakeup_source =3D v,
> > +     };
> > +     struct bpf_prog *prog =3D bpf_iter_get_info(&meta, in_stop);
> > +
> > +     if (prog)
> > +             return bpf_iter_run_prog(prog, &ctx);
> > +
> > +     return 0;
> > +}
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/219279=
83378
>
> AI-authorship-score: low
> AI-authorship-explanation: The code follows standard kernel BPF iterator =
patterns with no unusual characteristics suggesting AI generation.
> issues-found: 1
> issue-severity-score: low
> issue-severity-explanation: Missing end-of-iteration callback is an API c=
onsistency issue, not a crash or security problem.
