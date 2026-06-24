Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7461FECBA
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319530; cv=pass; b=IJ98OjZGgxutvk60TWpSKNMZz2rEGyzzO/5aG+lhAfrhdzoygYfPIRo+AloBNZUZil7CiuA+T2Yx3L78KOldtNVPwYFMsVEHdVIRhh5/veAY4DwNc2BkQPx6yunyEhgSSEu/SchYOnwDDZpfcuEj6rgafQiYZyvZ0vJd24rZKyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319530; c=relaxed/simple;
	bh=zrrYeWBHDDGWjTExsqEpofVdxdF0k85t4o5bFUXX2yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCU9btLMVqgqAY9/oGGPpgwW5EM90E4DaHhNO5nPxFiop5rifHYbJAqfSM3modHI+THfgRNUXWHAkdU4FU4GCWS4HFbqIJP9ln3AYCvid1w4VJYebeGnKEyCU4fLw9/QErNI9LgFPjKIBlJNovl8YTcFZ26dQpPDRpJ/7A6Pcq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhKLo4ZY; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhKLo4ZY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c7f1db3ad2so2140505ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 09:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319529; cv=none;
        d=google.com; s=arc-20240605;
        b=dh+/3rOgyUyYEEH3pgQEsX+WC0euh14S7BAfIWZuV/NOpRUJd41dJ53UtB5GC1N/EP
         vSLXADVctWe4rbgJtVGTMPUf6/vclUTox254q0Nz+zloZcVsSPJgDjPwXZ7wAph+jXkq
         iXpMnxhY7B3XnHKiYXOj0cB2rRmKXKw/jn7DFYSB6vkFjuimxsgr3ZIgbR5TNlVRM/c4
         Zp4WgeHjK+H8I5i8/MBqm5Yts1GjTySuNRaB0Oc/fn9pZrwui4AghSWDDseB1LP/jFVY
         QEs341o4Y5mjsUbOTmfwIa287lierLlO+CKo6SMvi6gEt4mRJEXf6BzL7v31TAXGF0CS
         HSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J6g8zlR3bX6SfriD41wvS0CpkSZcHdCCa8ZsLdTLE0Q=;
        fh=QJJ5HkDaanzxjMlkNonuA9PxiSUMN3TCt53XcsPFX+0=;
        b=Vnek5QJ3P9ifz5V+mIxZ2CtXkgbC3xcgwFff3jFiNnhrPZ0sG2MEFe7iKvltu5IC08
         2llRKeXSviz/plKyl0vmZLxslHuymRGMVPI8SM1B9LQUPEv63r0i309mdFI4Qzp8HSeN
         dWLihoB0ilDUVo6St6mlQpdM/+cqX7pwLbxFbdDNmdgAiIV2h02Aw6NRaTtS31ujPuqr
         2g6NzrvhMh740S2lAe/B4YBnVS6Xrb9/7wGN8y5NESMnTOHNl5iK4kKRkHga9bhdk6VG
         JTtLS2qwAgRWysMqSWlnsg7WhrO/U1u3P1by7u5ia2+AiZMkcGN7WhE0ymJrrvsPU2KE
         fBVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319529; x=1782924329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6g8zlR3bX6SfriD41wvS0CpkSZcHdCCa8ZsLdTLE0Q=;
        b=HhKLo4ZY3enLkbc9s2V0idXE4pAKCYEwdZ/IzkuTHZfhLk2hD8mgDAEm5DbesQlRNj
         Rvpaz3qUEclpipgpmauaul+RDKGgno5SekC9XIVPWN7Os2rUiSzyqB5AVRJFHGWix1Jh
         8CzJcqdWnxKl1qRDr9MogsP5Ex4vEG2lvpE/HxpX6F8qrhHyd3MoLXMDa7b5Mj5krI6R
         fv98tVEDbhgOQJhr+qCOrfG5UD4CymccVelifQxs74/9rvwSgIp9IugyWZmPAjSnusYO
         UVYGO3O3l1SZTznM/cn4DjQDDWGhfAwUkwSyrpQOidVg0T9/gf1Bs2SeWMtgusWdojac
         Cq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319529; x=1782924329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6g8zlR3bX6SfriD41wvS0CpkSZcHdCCa8ZsLdTLE0Q=;
        b=gcofcXs1Vdl7zTMtm3YgsbjU6sadJd9DW3oHNvsiCL+cBZiJWbiR4V84NJGEbM8/io
         5l6cZp61geHIwaejvOSvpRDXsv0xLqigxmycUI0ZIOdgrYDGLzjs4otfAjqQptSKFn3v
         eCxnDj+7vzkSYZXf/NedkwiNpqQHeBzM2EYal7wkgRMHo7F8a5RKjzGn1j3Tl8qIRcVJ
         /mvhc5I8abpUq9qpTBDxclLB2SC+NlF7iH6j3EqD3VU2X6Z2Xq10viL7D4eV6dFmzire
         euLP9g4Q8TlgH2hn9eGyhBluwH9OFCrBJiVc+hR4/kFtnW2/g9xO/w8gmu1PBoWPiNAG
         yVdw==
X-Forwarded-Encrypted: i=1; AHgh+RqvlxC5vBivDPTZ/7X0PXJ2gvz5WQ8MbO8zXDBkIW0YNB42bp/U4GR/rPMMCeR54gpcE/pP9CYIzjMT+X393hY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OJWDLo0qNKhUcoUgJFD/W+ugYSUHKYnf0QudiRq/8LOZYOpk
	v3ik4Bz9bA7wFQe6GSe7FQzbOACcIBXNubDnHCNV5NasySk2hKah+ranfYGfU5fnK2V2gwzrzhf
	D8ICnT9q15kjLDlIk3ioFD/xpOBLVfIw=
X-Gm-Gg: AfdE7cnEi53PHDuAdFAOcPBnpe5gEpsV2qJSyjI/avRDtiIgMNxHNM+Z3gXiFvc4+vH
	mYMoUaF1lFddiK4rPeAEalHFQGIb3rArowuO6lHGMIKx4lan4frmC+ve4vpFoLlS+o3KWjS0vHg
	yrrAlYwJJerZJLg7Y8FkFtmhdsdlJCP0kbGz3quKY+/3/dBKHEOkdMr+m9A+Uemzu9XkG8XdoII
	uKd+CM+SMuPyYAzxpUiqG81ML+3paKDX0qvBEnOetLVKixSGJTto3vPgeFDgWirJPJ/ISORnumH
	jxyRCJXcMK2gJJ/Cfu624x7gBrEYkXRgOVqghoet1Eg71gB5mxA0hdAwCRAMBhsEiNg=
X-Received: by 2002:a17:902:dace:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2c7e13bb1f5mr44272285ad.5.1782319528887; Wed, 24 Jun 2026
 09:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622143557.22955-1-leon.hwang@linux.dev> <20260622143557.22955-7-leon.hwang@linux.dev>
 <CAEf4BzZSeMSMnuYdLvEfb7-pmbthjU3J7W3QB4q9-WN_4+QrbA@mail.gmail.com> <8f06ad4d-d003-4671-9dd4-24b5c7e4b806@linux.dev>
In-Reply-To: <8f06ad4d-d003-4671-9dd4-24b5c7e4b806@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 24 Jun 2026 09:45:15 -0700
X-Gm-Features: AVVi8Cdf78ZgoYKESUy8YUCIw2YTyUohkT4mFfY3GqXDnAEYhtmPxYu-66MKFQU
Message-ID: <CAEf4BzYc5n9GQEBoSs3kqzM7DuPaYuZ5q+BzXNMbrF6sV1DLmA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 06/11] libbpf: Add support for global percpu data
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

On Tue, Jun 23, 2026 at 9:14=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 24/6/26 06:45, Andrii Nakryiko wrote:
> > On Mon, Jun 22, 2026 at 7:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> [...]
> >> @@ -5353,6 +5387,13 @@ bpf_object__populate_internal_map(struct bpf_ob=
ject *obj, struct bpf_map *map)
> >>                         return err;
> >>                 }
> >>                 map->mmaped =3D mmaped;
> >> +       } else if (is_percpu) {
> >> +               if (mprotect(map->mmaped, mmap_sz, PROT_READ)) {
> >> +                       err =3D -errno;
> >> +                       pr_warn("map '%s': failed to mprotect() conten=
ts: %s\n",
> >> +                               bpf_map__name(map), errstr(err));
> >> +                       return err;
> >> +               }
> >
> > hm... do we need to do this? what happens for LIBBPF_MAP_KCONFIG, do
> > we just null out the initial image? should we just do that here?
> > Basically what I am asking is how important it is to access initial
> > per-CPU image after load? What's the realistic use case for that?
> >
>
> This was suggested by you in v3:
> https://lore.kernel.org/bpf/CAEf4BzY9KeVeo2+6Ht1v3rL6UdwNxABZCSK1OZ_sD8qh=
pYZaeQ@mail.gmail.com/
>

ah, the dangling pointer in skeleton that needs clearing, I forgot
already :) ok, I don't mind mprotect(), it just was a new case that no
other map followed, so I was curious if we can avoid deviations. But
that brings back the KCONFIG map question, can you please check what's
happening for it? Maybe we should do the same mprotect instead of
dangling pointer (if we have dangling pointer, of course).

> >>         } else if (map->mmaped) {
> >>                 munmap(map->mmaped, mmap_sz);
> >>                 map->mmaped =3D NULL;
> >> @@ -10806,16 +10847,19 @@ int bpf_map__fd(const struct bpf_map *map)
> >>
> >>  static bool map_uses_real_name(const struct bpf_map *map)
> >>  {
> >> -       /* Since libbpf started to support custom .data.* and .rodata.=
* maps,
> >> -        * their user-visible name differs from kernel-visible name. U=
sers see
> >> -        * such map's corresponding ELF section name as a map name.
> >> -        * This check distinguishes .data/.rodata from .data.* and .ro=
data.*
> >> -        * maps to know which name has to be returned to the user.
> >> +       /*
> >> +        * Since libbpf started to support custom .data.*, .rodata.* a=
nd
> >> +        * .percpu.* maps, their user-visible name differs from
> >> +        * kernel-visible name. Users see such map's corresponding ELF=
 section
> >> +        * name as a map name. This check distinguishes plain .data/.r=
odata/.percpu
> >> +        * from .data.*, .rodata.* and .percpu.* to choose which name =
to return.
> >>          */
> >>         if (map->libbpf_type =3D=3D LIBBPF_MAP_DATA && strcmp(map->rea=
l_name, DATA_SEC) !=3D 0)
> >>                 return true;
> >>         if (map->libbpf_type =3D=3D LIBBPF_MAP_RODATA && strcmp(map->r=
eal_name, RODATA_SEC) !=3D 0)
> >>                 return true;
> >> +       if (map->libbpf_type =3D=3D LIBBPF_MAP_PERCPU && strcmp(map->r=
eal_name, PERCPU_SEC) !=3D 0)
> >> +               return true;
> >
> > um... this is extra logic for DATA/RODATA is supposed to be backwards
> > compatible legacy stuff. We shouldn't need this for PERCPU_SEC. It
> > should actually be called just ".percpu", not "<object_name>.percpu".
> >
> Understand the backwards compatibility after reading the comment in
> internal_map_name().
>
> Will drop this hunk, and set "map->name" as ".percpu" in
> bpf_object__init_internal_map().
>
> Thanks,
> Leon
>
