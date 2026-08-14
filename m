Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7D33B6CC
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739541; cv=pass; b=W9VxQXggYgKRxZ7EXdwQHea9ij6dJRZI+Jc87/h+q1IPMN5StFRTTrFgALOQnvAH9dE7PZFDmkY9UiLUcongqMjpGbLTTtGXNN0qvKAOdh49k1JOKzb9X9cQHjVjVBEEELLQymstH8ds9lK8tFdIr579WHFLQ7OX/t+DLsayYyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739541; c=relaxed/simple;
	bh=fDtmrf85ZQe/ITC6s/lLzWWob18EB0B4ixC3+NydqBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6NYIYRsx2QAYci7kFbYJ6bhRDkHpSaRPd/qWOVVv78cInTTylIpMwUcS6N9YwifaTE7iydjRxh/Ht1URZqJ/yUMiZvXmLB7ix3WkyS0fNk9U+eQskoF4jHi6J0zO6wReSHC+aWOV1/Ax6727jTI3yBEJuc309oOw8iQd6oNSrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/0d0e6T; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/0d0e6T"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1487461b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 13:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786739539; cv=none;
        d=google.com; s=arc-20260327;
        b=p93GOvm/L0sv74aORz85sTp6h6gkj6ZZbEe8B9TBfxarkwLD7YU9nODxL93vGFMDMb
         ACyUeAlShK+7EsYp0IBCB/8NgDD+SrrgCi+cAcM3BZH2a9Yy2EYlaNGA3D9l5w2AM1Wo
         rP0UScPbPVzKXWczrPp1XoJ4pBUvYsB52ihGBAsTrOtkIidCs/8nKSqJ0U4oQDHpzHgd
         NGGKHl/1H2YG9RNZGKFwrjOUWyok169kc0qDdzMmbRXMZb8EsdS6QcivhCHQ0NWRXdLY
         Vg5hjqeNLKtJREpIDuiinMIRmJkskUlcn06Iq8j6CaANfTX9tazp+3WdyNXHBTIRAiwJ
         c1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfUaJhOj0W7UMR24l1krIbEd3jzyohfQdD0zU2FJI3c=;
        fh=aMfjFW1ieq2eqEmKwrfHBTAU04gZKmKxiRay5Vs3iMw=;
        b=ZtqOgXyBLGm2wUueKxThRGShM2/GunJhA8YjbD+UvdEPpPTnTFvFYlZm6lDbWWlyIW
         dJdgpz2RNb3CPFOPNB3QIly2x+b+7Cdl8s6ZjBXhCfk4r3OISIn6QkTPj1eu9ygED3vQ
         WUry4y52z5YhB7znUON6e5EOXH1wYPjocEKeF4Gv84T0Au7HBLLNF4B4zNCytZOFtZyd
         51YaDT48pnT6OKWT+WDo3y8x5X05PSTvU148N9zh1uU7xVTi/WTsPspAgCJTb2vGMMeK
         y0ii1jSTpKbWJHnIsQDmlVhZOaBEsuFQHS7fq1wgcI/XBBgrl+57mw6cRLh0Kv1J9Zwo
         AuhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786739539; x=1787344339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfUaJhOj0W7UMR24l1krIbEd3jzyohfQdD0zU2FJI3c=;
        b=m/0d0e6T906rYpeV0v+IyjhC+RftzpuIyW3LvLfsQhqLmEmEg8vIUdZfGpskD+q+vQ
         0d6xMMrMjD6mkVMAAy+gGHyF6exTZ1t97hGyN+9K1hOpoEUCSxVib9QRe7v/ZIjWIfp8
         cGf6mKVLMQKk2KRWWn8aervzTwalhvfOtklClSGT+1jNhCxxQorxUiMlOgcdNN4cQOes
         ILPSMpna/U8AC/4eDUs4vXU9iECForP/kfv+53A5OXvp+b903jA/f4IRhXEWbPwB+36W
         F8SQRphxBXLwsU+AvvlS5/dNqNacMv8tIOGmrKnDYCdOcedNGB6TEWG/O2H0rcw4rqra
         THfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739539; x=1787344339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfUaJhOj0W7UMR24l1krIbEd3jzyohfQdD0zU2FJI3c=;
        b=JhbeLUoy7dHpakbGM7O4dWtA3TaOJItf/i1CyBLhiDZmNoNp8trhq6p6yxkZUTeqDc
         TMxd8HdDRtXqeSStRCLAh2FywaLa0/A6r2wAs0DQkxHOl7IvseH/2NfExHLBQQu8kxll
         i1AbqQHAN9UC+TppCYlH578qLCt+IpIdoYi0jvS1zh9eK/olhfB2iS+Klho6aiCvzA9R
         QOXuGvHkOs6ETB7J50hMgerdVeXrffnVNmUjU33mes+rPpNUSO+8QYB3QuxtvLwqz1fp
         fKiW+KkQwiI4GVmnKesU0ePfW9NCYgS0X9IQYyBBQ8XkfxcFPdWsPT5eEo9Iks28njHe
         zy4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9kVTJ5XPwOJW5GQOVh+sf0GRuwyId6Np00zQvu5to2H5lYTpBGlKUChfUnZSdy42L7/RmfstZ2066s9AGP4o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ioK59BOKFrx1RWxYakF+nGsd6NDQ9jx2QjZonwh5hxPjIFss
	Et3Up2uWCv5L5lfE1T6JdRlNA/wx8ojYvVfPZ9+RiHxJH/qFFFKT2ji3hJQu0MwiLxPUzOjB+fu
	THNHB2H3jV7R1/qgoLcTqZ8RuxL58jSY=
X-Gm-Gg: AR+sD10PiTICzUZ+ld/FgZtyg8U+PxSWcZXY1ElsEYIQb0gpotQ2A8TEAxi3+7mWych
	VM8+1Cj4BkvKOkai784L5PfHYwqZvNEDU3lyhW91FOav+6f7eO2VKnoURoYl7ITmxmIh9j3xuNE
	0jKXYaFXN4cAITGiWbdVkaYHH9IFq151zJft3fdQv+bzj72I5UYAvE6ul4A0Qg38P7lYaCO65ZF
	n0s4cCGqLQBzBKtb2DzHttKtOlMRRh4JRi3340gyf6WzyvB5y60QMrp4j3nr3H/E0LXbw+JABtq
	tJnL0eJRHukh4wkRjMirTsSBYG6xpkNygDlXVZxhe2yzT0o2lY0sNzI1SkpGY3Xv5LtjO8LCWm6
	p7QbyNZ6e5l6ezf25VMJBeaeuc9bng+K8rmn2
X-Received: by 2002:a05:6a21:3a48:b0:3c3:704d:57c4 with SMTP id
 adf61e73a8af0-3cc71b122bemr11130921637.12.1786739538897; Fri, 14 Aug 2026
 13:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814173206.93082-1-leon.hwang@linux.dev> <20260814173206.93082-2-leon.hwang@linux.dev>
In-Reply-To: <20260814173206.93082-2-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 13:32:06 -0700
X-Gm-Features: AUfX_mwYlaWdU9szLoemEjEdcBeqvThVLjHorsYcgxr_XMe5uBLfK7uw4V91CdE
Message-ID: <CAEf4BzZvEHCFaPuBDuxCF7-_TLPsJdyZV4WQid2N0RPrPv8NYw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf: Drop duplicate blank line in verifier
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:32=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> Drop a duplicate blank line in verifier for cleanup.
>
> No functional change intended.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/verifier.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 6ac1afced20b..81eae8f70acd 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12113,7 +12113,6 @@ static int check_kfunc_args(struct bpf_verifier_e=
nv *env, struct bpf_call_arg_me
>                         ref_tname =3D btf_name_by_offset(btf, ref_t->name=
_off);
>                 }
>
> -

seriously... just because AI tells you to do something, doesn't mean
you have to do it. I'm not applying a patch that's removing a single
empty line.


>                 if (bpf_register_is_null(reg) && type_may_be_null(kf_arg_=
type))
>                         continue;
>
> --
> 2.55.0
>
