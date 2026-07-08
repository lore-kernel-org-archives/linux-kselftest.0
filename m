Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC33271FD
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783482039; cv=pass; b=QGSMd3YNCvmEcso/yS/7s99ayWH1SfJwR3WPmjTZkeVd42M/Be74SWZ5/ERqS375FxvovNRNP/2DW8dFkwSUTEeoGwLWGODa9vwwIs4ObwOEae6QZPbR3ff+tuXCiLHJFmfaHXQekZT74zwogdihItGOmP+zA/MeEA3cQAn2LAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783482039; c=relaxed/simple;
	bh=vyejKawb6c81OKzUc/Dy5VVny4R59bH07JH+ZWAtYmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOodFtQVPyoHNExjpTlEgtGp/eOEkCiP91yYnT8ndlXiqLNWqe11UPrpRLWD1vduD1ME6GP3lHnwSEQOf1FEfkf4sdFZyp0PMXwswGsAhklpI950YpNTKk2MpqKY5P9AU2kHSGvR5LWYjFvTsq+iZoTGQpPLpb9Mf4TCsvShFHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIA/f1zE; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIA/f1zE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e5c92c389so8082885a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783482037; cv=none;
        d=google.com; s=arc-20260327;
        b=k5wWoO90qlGpfKCjbMexGdmB6VWPJAAVqth+5Dby8OAcIzyT7eYOVDUQ6GB74hgvN8
         Q8uUw74yvG5LUWKr5Ubzg/TnKQz7kRKgayKvsoqanZe5cCCBgoFE9DxbKpbrv6MyK5J8
         gD5P+LCGVe0PtNrvn974FaDVuY2jigvWZotiucPaHqJB1GxgEUOHYADmPXrxWRYizzHi
         OKWYb1MEG/nklxQETVUks4f9zI7yvVPkN/TBB4zZjqk4CFN6MGGIeU9GjV0WVU7bWIAI
         1jia0781isMeLk/wM4/7QzYboPMa0KBT7jn9vcscxWfOfMvUalOivPaG9pNiUFxz/PkJ
         XNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Qa+4EiSp2Mydw7M6P1zopsrBJak/NLQvEazW1nO0ks=;
        fh=IYpbHVNBMryKIX+pGKavxcEd7q2Z0If7HkHiZ8uA5uw=;
        b=o+ds9uvG6jDZVUQHBkpzfWRZftPdMv8xbzo0gcHcNdvKeG42RxItH0B5bzuuk+k1DD
         H4XRskn6NEVvwrltICfgknyh/k2HOHQvOFDNMy2NO8FvAJRDIfH6UsrnppcNt3jH4vYX
         G8dXo+hbc3IHPib9qjKQgxe929zQrTSjLiEIxZ5j4EHAzn64MYlxPqkYOyghLRjF5jh+
         1H5sr278H99kg/D2TaX6d2V63rZXCOCXEIR+n+CQ3u0F1hpOMt2AmlueR9q+AvQmMbhi
         9rb+HgF0aMnTNZOgveYjB4L6Nrwxc6DFi8LAjSwSFUE9FeN/gXrcnDiZF3/xQXtUoJDF
         GflQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783482037; x=1784086837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Qa+4EiSp2Mydw7M6P1zopsrBJak/NLQvEazW1nO0ks=;
        b=PIA/f1zEKPkjsbA4Wzh2/sJo8Hbo1i7/WqlfHYfPZNz0nrI1wuRvqcCMDI9YgC97Q6
         rgluiVYRbc/waOrqlgIFbPXTMeWbFwTlRVCOvLD/fBkwypIvGJLN32voAlVlC6isV/X0
         lGSi5+jKraBAtjdwdcBBzUEyLsaproyf/OwPHDCG0wc/EZBEJjYJ4gZR21M3QeO5i/DP
         5+6oNbMQTO5w3W28SPBLdIiQtDf6l0jD17RGpB1HTjnTa96Z2/zwnNkcEltVIOYc3ip4
         UAW3WLDIYfNCO7PD51E9s5a80lGGoE9LhceJpxTsN8qGI9jntdzGjlpJfdiddXfh6Qw/
         91tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783482037; x=1784086837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Qa+4EiSp2Mydw7M6P1zopsrBJak/NLQvEazW1nO0ks=;
        b=DM4oWVnaCn175knCI2DKNn9rRoX6CViG/+As9COMXUj4PcLABr8599nV1kCgf0SdTM
         GZtwxwVPn5EyylKRIsQVMs4Th7H4oO4xKuzHFf6cDg7x0bTLMXvMr7swtLfYW6JCEVpY
         A5S5/+9nE+gKkkvIDTrOCuizh9uCKPDpnugezETNcLmgVLqyL+rU0decsRNgk7abgvnd
         LeVaEvHkrSywNH7mPbKWC6KNyFPpKU1p1+gi28i+vkrtCCpIrVgOV5l0cSx57Awtlb8I
         08SxLHDko3/Ooeu15H2dgxL2sSl7crHLmIftm2mBg+kWheFI/OV7EM1mBBRTvFRA0f7X
         MU/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqmRUW2c5fesxFFXldEf1c638RUbfZ3g/p9b2y/DK3SMfH78ulpIUKGKCPJ9tBX431eymxmGrpnEfyrfUdGdIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjQawrMCYM7c9qlbLY7ezoWJkcmb29okMVw+68AAJgayZoFC1
	eDXMCUp57sRmKN6TZHkjYUOFI1L2SW8Qqk0yAMJo1jgojznfLcT+iOqnxkLbEZg/rH7ajebXEOA
	LDLIjDFEamg20CAmiTt2VvEodtr1USKE=
X-Gm-Gg: AfdE7cn+HJfkHneqQzi0KGh2ju1wrjHiyTw0bGl76ZHkAhTZF7V00mPNI7w1vmggWEx
	7sfzFTpOUdau82Fa19rbzl7GDxLO0IAVhaIp9qmzHxDYrOYQ19xNO5Fl+oW3NMJJy38x2Vc8SAv
	QakG3rYeJnZ55HtqLJ9FTktuoM5ojpB8q9IzB3y52SH4n/Ygkxwur1YFL6lR272p7L4PkSpXpYh
	jHvE1yqvWeMiPU6JsOTGbjqWwESQ+8D19x2DwJg85DN7dzVa6p0na9neGtCQZXz2QAMY7DcUz4i
	fO1NlPLLtv//ur0mSQCOHxPBndz5N/TDDmafwQ==
X-Received: by 2002:a05:620a:2913:b0:92b:67e6:8ac0 with SMTP id
 af79cd13be357-92ecf6965ebmr59211785a.74.1783482036798; Tue, 07 Jul 2026
 20:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5a6bff16c0885d3ec756a1cdfb623636d0bdb4a.1783479101.git.dwindsor@gmail.com>
 <6702d2f1-dcd4-4b68-b1ac-daa8661235a0@linux.dev>
In-Reply-To: <6702d2f1-dcd4-4b68-b1ac-daa8661235a0@linux.dev>
From: David Windsor <dwindsor@gmail.com>
Date: Tue, 7 Jul 2026 23:40:25 -0400
X-Gm-Features: AVVi8Cephjp7dZrQ7HVqOogT0cobirvdNaVw4_nk_zdryglSi4jSG3SZ13lnB_Y
Message-ID: <CAEXv5_gC_ze_CURdJMHBQ0aLS=uA8GyisSwnwo1YFTd_++4phA@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf, x86: Fix FineIBT #CP in BPF dispatcher's
 indirect-jump fallback
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 11:30=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Comment style: /* should stay at its own line.
>
> > +             if (cfi_mode =3D=3D CFI_FINEIBT) {
> > +                     EMIT1_off32(0xb8, cfi_bpf_hash);        /* mov $c=
fi_bpf_hash, %eax */
> > +                     EMIT1(add_1mod(0x48, BPF_REG_3));       /* sub rd=
x, cfi_get_offset() */
> > +                     EMIT2_off32(0x81, add_1reg(0xE8, BPF_REG_3), cfi_=
get_offset());
> > +             }
>
>
> Better to emit_cfi()?
>

Yes, thanks. Will do this for v2.
