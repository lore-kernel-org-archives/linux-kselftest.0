Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE0136B905
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730426; cv=pass; b=kGuIhOD3uiOLMM6Y0TrUrDABi/0Dje2ae/6GjrxEUAUJEo8E1peEIqHH6z2SiCdl0BQtphabE+M2BEFOUsHRhhAJk8Znz64izw8ZkKPBzaNwY8ZxqzFmANAfvOB/rqfFqB6w69pQwnLiB6v1dW1F20lmtLVAlSTLw+UAmy+6mDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730426; c=relaxed/simple;
	bh=Xb4aFB2LdZ8BWA2fVdcEuUyW3MqSc8rqf8KYywODpB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLH9xVe+pjmIR6VqiDaSgh5vc9NEM7GBXTL/jp+D4ywc/9jzaXX/feThaau5THlTYgFuVT8bSLK7IAjdt4gzHZyEIVJ9V/9VrbcJPrNwP2Ea0aOwSrUb+G5d+4auCDTAOHd2zq3ANISnwR5blSNQlRp6wPYSQ8S5RJBqNPoZ4bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKPWKCXZ; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKPWKCXZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1103594a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 11:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786730424; cv=none;
        d=google.com; s=arc-20260327;
        b=a1vGkto9AYR4DSpgg6g9G61bOiC6HDz3E3LBSEaV5sHHUyMhV1PNCHD9oi5F1/EFkm
         y7gM97yy2pprX6xb+dKgno6AHSDOX4F47t1Md52PU6VTUFkEdFd93JLvI+zzulbLlKMl
         XVUGxw26KCpz+gcQkWl0vt2R6Wng6FvLFj+PEnGHjC2x8aEKqBYPXsLOU+m/lPfxADXT
         lbrhItkDtWdnXBL+6mIYTkiBX3osOQT8NgB5Dn0IhrXLAnkcI9CinrLkU96dLtk2W0Ca
         mbuhCPS8pIAiwC4Zcrgl+YE5gAO1ZCuEPz+5JEyT+H+mSm7Wl/XfVY7L9EXOx8u1np81
         IMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g2YaHSpSFt9Tz/WkTYNw8ZXaB2J7y5iSqhGJKx3QtZE=;
        fh=JDIwwSv2VHI64fn/Cq2HC9Iso8lVPtfXnpTAlZ4Vzk4=;
        b=gS0oXgcBbC6w9GXQp+fmWim6wxI+kU/4l/XbE/7AGrYSMWPHUgasoahR3WOeF2IkW5
         dZKpFsHpu0WiwZps/r53SYE/OI7QSOcRn+3xFUDguODN2aWFutadUPgWxmdtlX0hMiTP
         yJe4hHKvS0RNU8FKtM15DuClYJ0ozV3v9wh5zH66C8escdqTE4vB6B9njBvQ1NLAp7U9
         cGTl+PYPcL6Urwir8DHJGjBrawiX8eTV9Dv4HGWCaXF6n79Db9BlzwKJMkdosmnnFpCf
         H+eZ/rK6aJeCSEKh8Q/ll7wKserFQS+sl1NvBEm7UonutbKdkE+vglSWKmAesnyQhUjP
         vIrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730424; x=1787335224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2YaHSpSFt9Tz/WkTYNw8ZXaB2J7y5iSqhGJKx3QtZE=;
        b=cKPWKCXZa64MwdsVbKK7HXQcjoydsnifDYNIMlkXH+lK5o9SsTi+rW2tChPjn6TSHS
         jO7gEE5EjgKQIJfPtP/DJA98POncYZjfdN4VMThJwk9i1EymZ10g1xE0HsIpOVcWCwgg
         ILOAf917r/uFjMAc9iCiiIUm1p+6FTd2djVhebrOUFsemM/NRMzN+HyIH9DBpMJwhQre
         IPZdsGDxBUSnJVPS4EjeWAbTvret9gM2vAF082nXWegNWDL5u2xf5ujd5x413Cia7moN
         QPb+v3GlAlkAxBgcm+99fZRCNs3Ug0EvNbzqjdM/9HHDtoYMxjaj3qGqTVZdL7Ym+WzX
         LQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730424; x=1787335224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2YaHSpSFt9Tz/WkTYNw8ZXaB2J7y5iSqhGJKx3QtZE=;
        b=c+Gl4ELUBYvDgbp4jybcCFZiTXQs8roUR5OCXAUaL84rOYzjjaFYdlUXra9SEeUNVn
         2Hym7TAdE6nq9kv3x8ZAFuj+3H1MB1Ef18jpKm4+iG8JA0A2oyaZD5V032ATo7L2eVzG
         A9BAFO3gFnOpgN7InubAJuOerYL3hjypSiiAQyJdF5VAMGYirAh/amajMJjMefeOUpmN
         DOq6nRmfiI8qixEXK0ed2+5Aa2/T/j9DDe74dB3dPnCOz1Qn42E8L8c83HB7hDxA8FSD
         7ZPEMkwG/+WnT/sqrXOpP2aPzGgrSDy5ZN+sFXD+ZjsWsbh/bt9v4DZt/P0aL2jtwobR
         hVBA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Z8OMvphW4QdzDBabZXZRRkcE4xO+Op01grJCAN4/aTsRt7TyX+4h+ID9a91r2pyuYyI60Ci7BzcIE1a6pqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHnYn6luG0bvFHzMlXa8BAMAm1FYuiqGXTIzN6xlcZQIESRhLX
	PBZXbycpoZP+rgDrqv/f8+NIfw2MkHqKwjFNNekvRGbtxQnPcUZSDHMvyUWsmm4Kbme+9vFr+sb
	/XBYRMSjETk8raQm5G2rHbkt/OYlBNRw=
X-Gm-Gg: AR+sD10juVxy1E6MntZSaZAdkOSw8R03wCDIAIEoyi+SUWwxyI0FxtuBqK70wA8ol8P
	rWCNr7dLE79jfncpGPhxQGVKOLqZ0v5d8rJHu9WHhm5cKtr/m5rcCDLd/hdnxcsyr3l91l8v5OB
	CVDEeDHqBjWfK9LpKE5YWswxCPMU4YWH+98lS9RcnxAMVJ75U+l8vjpY5y3/sgGN58jzl6U6nLE
	6vCVE/SzOSO10fRnamNeTayuMJEOmyzUxnb7aqiyM6EHkcfum0EWx0CuMbDPLyEk8Au9YWfYxAN
	kXonqShJARswQhUv0er5YuNlU+NU37sVWb6BrHAQHEYJMgO9RGET9Rwu1cED9ZMXfODS1kWNx3s
	IlgkZiuSGPuErmC21DF+TUy1+rQ==
X-Received: by 2002:a05:6a20:6a10:b0:3c3:ac5d:b6de with SMTP id
 adf61e73a8af0-3cc71d55406mr7493598637.22.1786730423943; Fri, 14 Aug 2026
 11:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813152324.97937-1-leon.hwang@linux.dev> <20260813152324.97937-7-leon.hwang@linux.dev>
 <CAEf4BzYRqZ--=5d2LBWA=mOL72CYe4y4iCGS3c5Dw8PEd9BOiA@mail.gmail.com> <965e536c-bd5c-4f63-8021-8b07e0aee231@linux.dev>
In-Reply-To: <965e536c-bd5c-4f63-8021-8b07e0aee231@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 11:00:11 -0700
X-Gm-Features: AUfX_my9sVqn2htAb5x5-1TwdbZGaJswG7gE3Qs2A7WUT8EFQqLsOttnr2Ax94Q
Message-ID: <CAEf4BzaeKxZKgF-QeJ0RdGGwxSjKcH8uzgUnA8bBVgAX++phog@mail.gmail.com>
Subject: Re: [PATCH bpf-next v12 06/10] bpftool: Generate skeleton for global
 percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:03=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 14/8/26 01:56, Andrii Nakryiko wrote:
> > On Thu, Aug 13, 2026 at 8:24=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> [...]
> >> @@ -263,13 +269,24 @@ static bool is_mmapable_map(const struct bpf_map=
 *map, char *buf, size_t sz)
> >>                 return true;
> >>         }
> >>
> >> -       if (!bpf_map__is_internal(map) || !(bpf_map__map_flags(map) & =
BPF_F_MMAPABLE))
> >> +       if (!bpf_map__is_internal(map))
> >>                 return false;
> >>
> >>         if (!get_map_ident(map, buf, sz))
> >>                 return false;
> >>
> >> -       return true;
> >> +       if (bpf_map__map_flags(map) & BPF_F_MMAPABLE)
> >> +               return true;
> >> +
> >> +       if (bpf_map__type(map) =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY)
> >> +               return bpf_map__btf_value_type_id(map) !=3D 0;
> >
> > why do we need this btf_value_type_id() check? in what case it's
> > expected that there will be no BTF info set?
>
> Add this check by referencing btf_value_type_id check in libbpf's
> map_is_mmapable(). That said, if btf_value_type_id is 0 for
> global/percpu data, is_mmapable_map() should return false for them.
>
> And, if the bpf obj is compiled without -g, this check helps to avoid
> generating struct for percpu data explicitly.
>

I don't think skeleton can be generated if BPF object was compiled
without -g, so let's just drop that btf_value_type_id() check, it
causes more questions than it's actually useful

> Thanks,
> Leon
>
> >
> >> +
> >> +       return false;
> >> +}
> >> +
> >> +static bool is_mmapable_map(const struct bpf_map *map, char *buf, siz=
e_t sz)
> >> +{
> >> +       return is_skel_data(map, buf, sz) && bpf_map__type(map) !=3D B=
PF_MAP_TYPE_PERCPU_ARRAY;
> >>  }
> >>
> >
> > [...]
>
