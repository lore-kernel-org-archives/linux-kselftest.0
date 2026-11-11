Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794382539;
	b=c2gVaQMACMn3rlUIQlIdaORllXDFgwLrn4JG8cWpDX0kixw8DFBeCz7+N8VbqhkZlMzF
	 7qQOHMNmoxOlT/c3PR6wa5McBMcNHPQumCp8UYNbhCUSrIZDg4v2yUyULQ/EzzaRR4SyP
	 376pQey/PzgLkej5GIP6wNUdz/H1ZIUQov3b5jq1WEemEw1Ptsvv0+XFux9WRL9m/xvwP
	 Ra0j0TmuqahSMZnjDbVuxjv9fwFq9uV/RNw4JpPVqdi7AoiqXgr+PSYGaCdsJ4xYgNRR+
	 0kyaF2l4U3gK7lFCzjuKZf7L2zoGZAikiUQduJ5qz1O/CxMYaGvANcbU+vDHRLiK2Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
	b=YvwjuqQnbVEwvtSHsqd3c4WUapifLiwH7a3H3cz/V8PuRpfXib/IAntyiM9tXdfHMS/s
	 l8kRSWQzxaKQcqm6AbN0oT4AuWmpyI9K2Hx9duX4RLQflyJXTcwBEV+OkgfjaATsJGu4H
	 WRYX4QK0hkI1ElZpnaPtvWWZYOnA9eptefAdgX7zojGWTwVxM4ABXEufhuk9UMyLmnmb4
	 gF2V5IY9L82Db9nDs5BeNQsxv1DfT4atsKDxm5Dg2P+biY3c3XplfWS6XXoc4v5/bgB5q
	 wmVVNtM+C2V22iIhxboN2S0pZl/K6yR02xJ7x8lA6USARmtAgaXiXaY8vgwKhCn99Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs9eM0U7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F64606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F64606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs9eM0U7
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b335ef6441so25826367b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382538; cv=none;
        d=google.com; s=arc-20260327;
        b=g8XTRHqLnHI5wv9xRkMvuTE4MWZUpd69BcpdbW8FVPUn/3Hw19xO158fEoVIHoS8y5
         IEO8Om16ci4MHMls5beNDlJwm1vwdRR3nGKtw9zIlrRv8n5RNzUhhItn+6ekexvsrbau
         EzaOhQN114wyk/DnsQOVPBUTZTOCTt0xkJGKuufQa5RvQnsDxGDNoU8fqMzB3CZdQWho
         1DlaAfRPYY+zfxrF2WBVuG1rqVYdPSBmFTj3p2ZbB9pPQC1sRzrm+xHnCGVoXg6d2Stn
         ie0xjROS5Kfxvhg7/caAaU3S5MyZxmhqhqDW360slYXrPp+N/rHUYhIvwHFXxSjHlRUZ
         SPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        fh=xyQPASGFE8gtNI16DwCn/zRFMMmoTu/xjxUPN5bJp+s=;
        b=nG5zFy6LMoEGfYopQeo95Q3gDncGPVTiKRToqullrW7ojywKpv1VGSzid5Qy37OUkq
         izM5FXqXAJ7CnsybnH5gNjGZjaNSEKwDGaYhKZbINEGN27/iV3HmrcO7bx4D+FcogwbY
         SUM2j85HO/IrSqKkOarGuYms/hqmQTQZJYqRALuaaz/SvLQXdEmTtWv1VFnojGl3uHCC
         klaisEWInfkXTeufZpZNbHQySF7vZOolDShP2utUb3eTQ/8TKQiO2C5Z7U0FR6Ttp3Al
         7wL200WNGYCdrzO/Xf3C+t6lvdoxA3n992u22d1fYZ7qxg0MSJz61Un5+x50eaiysmE2
         cgjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794382538; x=1794987338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        b=Bs9eM0U7T9Dcv5j/5o6EYk57qJQ9YereO3VjDhNRI7o0jefiQBCYSZvkDuzs5EwpBN
         blRufjR4fCW8K+7KZdBTktL1Oysu96mn3f33wyPmfUtrTyjJovE4HraeAPJacqdqXOpf
         c+UMmNoEWg6tqorJMjC//jzZDfGvuXeJCVKCwGtXLIPNIp6sEN3Xw28diurSQC6zziIy
         +vZrkBN1glEIUn+b+JGhdsLZewUBhUhy4GOrq2OAiXlhw6oR3XJWl3EcyCQn0thlZwvU
         MM3TgPBc/rYX70fGGbaYOt3JF+YcjSCUi+iJtenLk966aIlfbcD7Cb27P626B9thBRBE
         o9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382538; x=1794987338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgL3StqkmoZikoXpv80FJYJalx8ySs4tPeli0UX+OHY=;
        b=MSXXpti4IRH3kg5ro0yLFGqxvrnt5wRjsUP52kScxM8qjbML2yeBTKL+9oZvAyyrRH
         ZCRZCDZv1osCY2oPyC+XK6B2kCAZI7vFgLonAtKtmmoksE3nAuYXfyrd5gENgVDrm2HX
         bd+AEG4mZQNyoS+yNwCodYAvY47EX/H0qFMmZAFksP7f+Upjrcg760+3XI5e1DP6c0I4
         aGKhobHxjLHCkVctPt6PUiCpeTpRaVjuhGpiLBrvEgM4C113tsyxWKG0QVjHuxUBIjbO
         N2edqbI89OflxE2MDQpMlH3eUdC32Y3BxYQYrVKqjZXFeLPAfYIgi8Ud4xyZiWenn01j
         JT9A==
X-Forwarded-Encrypted: i=1; AL+hErE+y1BrFrWgmHYLJdwgjKeFhGP/rJtse1oDpUq/tDwKkSqHpG4d5cka/bPF9dauYUPkNeinBLq14VWddXZd1Ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gv0cSboBt5dbM1A76ZV3deWODMbPY1GjKhytL2f9gNAcjmHdY
	pdpQgkW3C23LfXeYjI+mJi3F7iuI9bTgxYD9mBGA6hV8WklzMrGtWgK75KJSiY9PMUrm47/d7rr
	HscC49fhh5BZIaQ8WpShZrAmQAJItCPKxLve1w1JF
X-Gm-Gg: AYBFou1S09E1amQWKRaH3hezIQCfyEJIgn2GVuy0glD4p0DiTlml/pouNJzpHFXprAZ
	b37YnM5+OPkNuZnMWvumAWC7IdL7Kpz3MxJ0X2YpC9Ekyy5IAW6amwsqymlwNA0+BchpTeTsiC2
	MSgtsx+BaQY/HYb2sQaXmCSbxksJOArCJ3cdIjycaMpC62WAWRuV8BH+uFAB9jyPEDXpUMBzphS
	JIu0k86WOxpw5SDVJQt623EB1MDVPR7T8sOBeRwQNdK+HyMR9VsE5rAmbvZ9zhyIk2hf5p2Jj6N
	hBHbyeWTxzmWuW7ap+buXHUliamKmHlAcrqinpMIfSfyBw1wNchDJGzx9kxGSqeTmD6cWDLsqDY
	L6RXahwf0D1A0bNfpeuFptCSVWcKzZVe1p0Wk
X-Received: by 2002:a05:690e:4504:10b0:67c:7c1:bdac with SMTP id
 956f58d0204a3-67c6801c387mr697001d50.58.1794382537762; Tue, 10 Nov 2026
 23:35:37 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
 <f5a22a46-0fd8-4739-bf11-a20e0b3a443b@linux.dev> <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
 <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
In-Reply-To: <CAGn_ityW5Z+JEcTL9wKnQOgLXhjXxC357Q=h95AgR9xP+pcmjA@mail.gmail.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Wed, 11 Nov 2026 13:05:25 +0530
X-Gm-Features: AclHuK-gFbPnqlWbdZN8aht-FIvpFP1KgQo9SMmyTpNb0jJxnVbTrvwFSqbrNnA
Message-ID: <CA+OvW8ZADPDZJYURT+a2kwvWcsgdJvzP5Q9sJuvXnnL2kgZ2dQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light skeletons
To: Anton Protopopov <aspsk2@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:43=E2=80=AFPM Anton Protopopov <aspsk2@gmail.com>=
 wrote:
>
> On Mon, Nov 9, 2026 at 10:40=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Nov 09, 2026 at 11:46 AM Ihor Solodrai <ihor.solodrai@linux.dev=
> wrote:
> >
> > > Andrii, Alexei, wdyt? Any other ideas?
> >
> > The loader asks the kernel for ids, sizes and offsets only to pass them
> > back in the next three commands:
> >
> >   the loader asks                   and passes it back in
> >   --------------------------------  -----------------------------------=
-
> >   id, size of bpf_struct_ops_<t>    BPF_MAP_CREATE
> >   id of <t>, index of the member    BPF_PROG_LOAD
> >   offset of data, of every member   BPF_MAP_UPDATE_ELEM
> >
> > the kernel can match by name instead.
> >
> > The kernel has both BTFs. BPF_MAP_CREATE of a struct_ops map demands
> > btf_fd of the object already, and bpf_struct_ops.c doesn't use it.
> > The kernel can find its struct_ops and the members by name,
> > like btf_parse_kptr() finds the type of a kptr.
> > Then the loader passes what bpftool knows when it generates
> > the skeleton:
> >
> >   command              the loader passes
> >   -------------------  ------------------------------------------------=
---
> >   BPF_MAP_CREATE       btf_fd, btf_value_type_id and value_size of the
> >                        struct in the BTF of the object
> >   BPF_PROG_LOAD        attach_btf_obj_fd =3D btf_fd, attach_btf_id =3D =
that
> >                        struct, expected_attach_type =3D index of its me=
mber
> >   BPF_MAP_UPDATE_ELEM  that struct with the prog fds in it
> >
> > The kernel rejects such BPF_MAP_CREATE and BPF_PROG_LOAD today.
> > Nothing changes for existing users.
> > The BTF of the object is in the blob, so the signature covers the names=
.
> >
> > Then no need for a helper or a kfunc. The 4k buffer, the fds of module
> > BTF and the offsets at run time go away.
> > map->def.value_size, prog->attach_btf_id and prog->expected_attach_type
> > don't hold offsets into the blob.
> >
> > The diff below replaces patches 1-5. Patches 6 and 7 stay.
>
> I like Alexei's approach here, it fits with shirudo. I also have tested i=
t.
> (Patches 6,7 weren't tested, shirudo uses libbpf without bpftool.)
>

Thank you Alexei, Ihor and Anton for the reviews.

I agree that the loader's efforts to find out ids, sizes and offsets
for STRUCT_OPS maps and its members is wasteful since it only passes
those values back to the kernel. I will redo my patch series using
Alexei's proposed approach and send it out for review as soon as
possible.

Regards,
Siddharth

> >
> > [...]
> >
