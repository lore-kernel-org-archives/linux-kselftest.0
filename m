Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6213E330D25
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591165; cv=pass; b=Y8QxBcaNAmUPDFBzs7eEB69z8n4EYkUDS50m7hz5571WJJ1POBxtlHSu9015svR0S+fVtxRhFJbYaVx61DKsnWKZ0vM1FMW8A+s1FfQM6zkmKUt988885CpPwf5coEND4kokfJRoMPUWD1ml/4Y1i+/BBC+7Hm+8Qo8mCc839mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591165; c=relaxed/simple;
	bh=rZrOapVhh7bAQfoXj2OXroZMrCCdA2fZ7ZeRVhUp7Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDnXE2jqlS9vMvVXKpfQVvU36HDS7bgyF49q3uw5yd2ANd6arStSsB6TIMP2H1t8tcPV85KuY85WsZUPbL3rhFIP5FeWADECRUyEj4wCGFwaaULqDinG8Y0UeqPRMmMLWNbBM3q17CSkoIc6XBK8QQrtLDE+gxF8eAAkNUcQr70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXUl7smz; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXUl7smz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4602e2a0372so397208f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 09:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780591163; cv=none;
        d=google.com; s=arc-20240605;
        b=BWqXPG5Rp7YflQAb8j9wBOlez6oTBU349x1QUjI6B7AgMY4Uq5zTNH9j50tPlaUe6M
         UzUsYBGXbjsl9HsSBi2Mz+gaSoszBKkdy+QJNMiKtRzRPhT5h9K5sq3oPg9K1Sf9TT5r
         hTkCak/22FRsuCewRlCSetfMKGuFxhDoDf6gFO9AwaKaWJSWyecr2wuFuKTihKdkXTnJ
         MA182P5b+FiCqR3ujhI53zoX/hY79MXvXmwW0fWM1jZ1gAvvRn1Yc2ANmqU8d2riw/aF
         Ho0kh/nNO7bS9MeZ5+8thUgmU68LqVbdLRsLS+e1UkR1+jPXgZAWFb1ZqUMwHIfw9wIr
         prDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8LMcduT/17PMqU1lFdgOWZo3/kRhoF2Flu1HFP3MqQ=;
        fh=0BBXxET2KPdaIlRAswPq14MI2uLdhbOZSYXqlU852nI=;
        b=LFmhPbyU3kTi/dkSUE6Wt7j4uLTZ3BfPAQGlXGZgG/Zs65K+uKhl39ZgX5iLT1VTlA
         7fxUw6+Nsxaqv3EABF9Nusynoa1SFfnMnWDT8t+7Sc3dCYjHGzwz+xhhQShaYVDkkP97
         j+3r0srPEB1qs7I3hC9uBJHlFA5qSgtxaALMMkRgdYmQi1v8/OQOP4ARJtiFkdFn7T4Q
         tvpYm5ZBAIcviJfCzYL6bNimkkF9wQeaFpicdL3T1F+6CwiLLSH3PUXPzLe3YQnkt5yL
         QsckQh/ltyci0ozK2/cHLlU9cbaXOrEYpHtrVpgKVTn2mU2EPV49GQOPiZ/7G6sEVE+e
         4s5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780591163; x=1781195963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8LMcduT/17PMqU1lFdgOWZo3/kRhoF2Flu1HFP3MqQ=;
        b=DXUl7smzUJXc+LyZ+byXgEwwBM+PnGwKEhFBjerWx0CZ6yMBCjB8nbHeSrf3bST1LJ
         vGzZxclCqoRZ40RItUHqC1KsApSbTvo01ZnPzdFsVCaUed5tFbI+uSY/FU6J1Nfnd9/p
         90ll8IEu/c0IqSQp7tsVBtwTvt55oHLg6jSgkkJIT9i/fa9aTXB9MjQkB/qAnF6XDrQV
         bvhVhzkc7JSWoIEKphtEM/Q1y7EenZUVIT+XnwmORdqD8dea+ZP23kRafF03Jld9angn
         Ywd/f68FmdED9+ET2x4cZUCBGewDX87bxiBoeMYfsNtOGLrFt5mWuhjTLodQk0BGbDDT
         uc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780591163; x=1781195963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8LMcduT/17PMqU1lFdgOWZo3/kRhoF2Flu1HFP3MqQ=;
        b=gU3+s2vIPHKx7RwkxRvaF1LRDovnYvpNnqR+kefo5/D2oUjjKW49jXq32UeVMnV1Dy
         +US5e1xwZ5nZF7tCUBlS0mevHbk+gJDWVwH3zu0gbW2PvIb8i8cYrBxu9rNbywdZ9AxZ
         LbS/v/s4xuJo+XxHusbsa6ykGMDbwQUc7i6/4AXGR88Jx+QmdY4do3SuzTS/qI6FTlm2
         TWDVhd8BLXRuJ8UYIzXJVQyzEU6+XPFyn4MUzDNN2PmbEZCIi5qn7OknlCDQEx1mKFcx
         jkUxBz1koP7YXlyol0ZRaXZCmvA8ftvURbX8k0rUfcwgYK5+gAqn8GEYn1qFkZBRGEZf
         rV7Q==
X-Forwarded-Encrypted: i=1; AFNElJ98nWjSteXqi1Jz1CZu553vCkIMJr+NWZRxQUAh4WL9jUTfOlvVwCEfKV83ksy+v+1lpacM5z20tFamzg49/zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDwWO3OqG28Nw86G5hz9KOJIrGMk7mzeo3ZOioxAGabLAk/rI
	EguXN7AKiTBlp4tuXKpYL+3IqX2oe1N9rQVQHL6E1Nsq9l2OsTRlZ5yjZhGAV01bbd82kzrGsr1
	rN9VMoDlIax/4GjnRnzfT3gvEqED4rqc=
X-Gm-Gg: Acq92OFb64hl7Znwa18ZgVY54jtljpHiU2dsR22/kGSLjjzch3nFpBBA8L57Vi7jdm7
	C0d88XyG1kJDAOo/qnlGrHndjQcFNvXzATsNDB3UfL8uf7Mbn5F/Y5otkX2acCV6zGRe2QzSc2C
	5dy484QVQiAPRdGBiE//8UOULaIQdRE5Biz0vM9gnTUNT4KBSn2asEnwTqZ19Tpe/cZbvfeJ1sJ
	9DEXqKmH4OMxhkgxkCbieID/WvokqIA4/X4OtigNxv8lI4q7WTdptIV8hmE4mCLGaGnuE/nkn6G
	O4Bsrhn8qEfV4//6SKR1LgyKUv6gs/Wxwuorc0sQRp66161/X+3qdqmSecgtCU9VSxH+N2YD7Om
	VWNNyXzYmroPbJOv4nDXkaWcCzuiC926blA==
X-Received: by 2002:a05:6000:e51:b0:44f:da08:18f2 with SMTP id
 ffacd0b85a97d-460216d7f47mr9949704f8f.12.1780591162684; Thu, 04 Jun 2026
 09:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604150505.99129-2-leon.hwang@linux.dev> <3e8f405c266d6f15cc2ffeb3ffbe3674b19633c43048c1942e9a33db86c4c811@mail.kernel.org>
In-Reply-To: <3e8f405c266d6f15cc2ffeb3ffbe3674b19633c43048c1942e9a33db86c4c811@mail.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 4 Jun 2026 09:39:11 -0700
X-Gm-Features: AVVi8CeenQuWNrFsEls0PJ0cpVkjHQwRByowXv2QXRwXwDAMZKQvQDuBYwWHtB8
Message-ID: <CAADnVQJHCwcFQG5FiejiyTHEFBRGrKqaGAfwVZJXANWuP9rJww@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Check tail zero of bpf_map_info
To: bot+bpf-ci@kernel.org
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yuyang Huang <yuyanghuang@google.com>, KP Singh <kpsingh@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com, 
	Mykyta Yatsenko <yatsenko@meta.com>, Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 8:45=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index 625a4366fe6d..1007fb7c87e9 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -5400,10 +5400,11 @@ static int bpf_map_get_info_by_fd(struct file *=
file,
> >  {
> >       struct bpf_map_info __user *uinfo =3D u64_to_user_ptr(attr->info.=
info);
> >       struct bpf_map_info info;
> > -     u32 info_len =3D attr->info.info_len;
> > +     u32 info_len =3D attr->info.info_len, len;
> >       int err;
> >
> > -     err =3D bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), sizeof(info)=
, info_len);
> > +     len =3D offsetofend(struct bpf_map_info, hash_size);
> > +     err =3D bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), len, info_le=
n);
>
> Does this change break the ABI for existing deployed binaries? Previously=
,
> expected_size was 104 (sizeof(info)). If an existing binary passes info_l=
en
> =3D 104 with uninitialized stack garbage in the 4-byte padding,
> bpf_check_uarg_tail_zero() would see actual_size <=3D expected_size (104 =
<=3D
> 104) and immediately return 0.
>
> By reducing expected_size to 100, actual_size > expected_size (104 > 100)=
,
> so bpf_check_uarg_tail_zero() will actively check the 4 padding bytes and
> return -E2BIG if they contain garbage. This rejects previously working
> applications.
>
> Additionally, does this actually protect against the stated future issue?
> If a future kernel adds a new 4-byte field, the struct size stays 104, an=
d
> the new kernel's expected_size will be 104. At that point, those old bugg=
y
> binaries passing info_len =3D 104 will once again hit the fast path
> (actual_size <=3D expected_size), skipping the check and allowing the
> uninitialized padding to be consumed as the new field.

bot's concerns are valid.
Let's add __u32 :32 to bpf_map_info at the same time.

pw-bot: cr
