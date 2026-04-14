Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09593E6DDB
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179424; cv=pass; b=OAL3E34NziZK9Ju508uW0owWBDQ5Kbeszv3U02vJXObYwhlMCdT8iGh6OUeSq7MX7Ymy6QtBL7z3gZIjQVLh1QHtJaVl3v3lnQF0ejZwMe1jfRycDgDnrvBzZB+pG1iNU0c9Wn43lFXpm/Q6X3pT1CUwwcjIN2sKLpPijKKjqng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179424; c=relaxed/simple;
	bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVuDQ7CD1lUaLOClnp4ERb2rHTgVcM/EpNvBuJJrFnOkzGgfue7p/lsR4rxW2n2ikxHJjmbbUZlCfB9pZ8kpQeJsGfNVPAtovtcqjYmiBTBEbBlRr2+v3mkRkiiX8WonncpqFWPEeZhZvns0dcqRzoMIsYCrTc10wiSiMy/rMq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUKFA+2A; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUKFA+2A"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so1360521f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 08:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776179421; cv=none;
        d=google.com; s=arc-20240605;
        b=KtY4AHqjNQhlTExNVlZ+m1SmjCILy+jGP/SW5t8MQwREEJnsEv4YjxqcEUN+ewcsz0
         9MtybFCslbaPAwGhNw1u6AEH7PVsOiOGV6VOO0adMbq6tF5bye40fIaCxHT6lvhWX3HH
         mRMf11AIw+YTx474v4tmUyBzItllmREaGk25wquO6MZrE4OXRO0oXr2MXwN0n6S5pzWb
         hc14gZ5c+oZq8tGduGb0R2XL897so4ZePM2nzkWiW6vm4Xa7ZAijpKcUmqPlwhTeZ+Ga
         FcHjFxuHzgK/kZIZyNstmatnQjpcgrDcccmTpPG7gGgrelIdbjTk1hC9XLXensEiwAU1
         e5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        fh=pnVPd8/jj41V1y8tyWgZr6HzTWI1w7Cx9QJN8ch1GnM=;
        b=AYErkuUpcz2Ym8WT92bPOj1xo7s7L5JdA2FRAA7OZ+hh2ELmsWFvWYXk0+63UeBCGO
         jzeD80mkSzCfJEM2cHJrV8xKOGEl86ayHwE+chAcsTlUvh4y4TchDjyFYhK0WMFFnt77
         oca9me8db/uEZDDJPBS/xLP2IvC6gWRPBhQS0XpTsKyxdHBtkoZY403XZ6WMS/eie8I2
         isoKYC1Zax0NWTMvPDckULD/n96Y9naEG/W0yFbP4Hawoa8N7tx+5faFDJk4q0AOIO1C
         9HkeAl8MUcRUx5S74v3fq2roWyIRhF+HOCZaHBWKD+aPdqU2u6oZRFZA7G2g+u9gwkxw
         8xzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776179421; x=1776784221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        b=eUKFA+2AoQREtn0iyQraI6Pd872uELauer8EVJrgJNhwKAL5DDkqWPhcB/7eDyozrx
         qbp9AJD0LHtNW1OtDScOl8AJVcbQOTNhU6w3VpD4FhCfMk0lNNP/jQ+LJwQ0drfIq1wI
         0oNyhdBZv/fo7rrKJ1W5X9KGjMvlW7rSLEGpsjo/XfKYyglsnire53d/4PbfQJEqNXDL
         3lOmas2U6pCwaTfM++sGZBaeyn5QXX/V/ErK0tawok/bWwzgOHtquIHAdxnsqGJhX+u4
         ocUpxh0rqMDOtK4blQIOE61GbogTPRhfyYmworZTWngPik83hC1PFpMdJF4kTzTTk8wX
         ZgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179421; x=1776784221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        b=czzv8sftEp5lT92JlduoNrBHszUQ4KIZnETXCY5MSgTixUWal/c9YH7i17LPXOs96x
         phTtfZ37SMW8WNM+dXJL/sE7TmfVQmhIHHGQ3UBjz1lstQ6UIFnjgCOpsb6Mv2NAH3to
         266MxGKQMjur9LKvgHXtZMkecplXgeyKdgfHi7KWJr26jixr3jKW3lsAIlYZ+/KEF+gV
         i7xNxtBUr2ADQPww/5crzwkTcFFeRV2JBx0N91M1g8Mm0V3GK3fDnBTStUj29DE7L7Ul
         eG3GprQVuyM4Mqmf8gH77BL6Fq0wmX6lq2oShLn02KVobq0jBbvOPoqWNO0tKzjWhV7D
         svdA==
X-Forwarded-Encrypted: i=1; AFNElJ//gndlCCDzLzmzGYNVOAXx0ah0o3SfKS0rPkNymiAA9Z55OKVKdHE0TO2kwGdSEZLPuLHfanzM0NJ7ztFN7fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGl2YkQ9aJmwhUthhzJnAEy8fgkWgCPJyLphSBYZ+V3PeDj1ss
	KsE0ixGFPbPhxO60lGkAsy8gEFqpDONWAX8IkzxwiIRiLJp49UVfKGgfg9GD2xf4mZCjVka2A3O
	5/Ze+t08cC7Pq3RCvdE/gwVg99rwkCLA=
X-Gm-Gg: AeBDietmoTLtY6o34p1RIIl5toRTTZbS3v1kaM2Q3Sk2aoDKpK3fkzQRuZvnI/93UuM
	0wOOXzgd0a3tQipQaOGEcOJfM7+OOktnybz9YybgTwkKuSXPINRJ4fRW/nvS7dxllje2SjOksHy
	KBBJsDayekkDMR0/V5k5VQnBGlvIWSjhBzwFilUprzcIeLkjgAvPqu14yyoMuGl2wgtsw5G/T2t
	ln3TOz3r+iGUWSAfP1gvSSYX1NMBy/w5fB1DQ7e6VvzZMBEIAkVUWnQs+MEgpHlXJNvUbVLDr+t
	fNzm3W079m83XztIDBUEaKNnFULgmOD59ZZJtJY8
X-Received: by 2002:a05:6000:4110:b0:43e:a8cc:89b7 with SMTP id
 ffacd0b85a97d-43ea8cc8c24mr1517128f8f.3.1776179420992; Tue, 14 Apr 2026
 08:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
In-Reply-To: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 17:10:08 +0200
X-Gm-Features: AQROBzAtXSFwPeCMpZ2dGca-DBLsSXREgEyBZSQFf7Waht1WxQ2QIbb8WTtAIYs
Message-ID: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:36=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> > ACK, I'll try to use those kasan_check_read and kasan_check_write rathe=
r
> > than __asan_{load,store}X.
>
> No. The performance penalty will be too high.

With using __asan_load/storeX(), it will be one function call to get
to check_region_inline(): __asan_load/storeX->check_region_inline.

With kasan_check_read/write(), right now, it would be two function
calls: __kasan_check_read->kasan_check_range->check_region_inline.

I doubt an extra function call would make a difference in terms of
performance: the shadow checking itself is also expensive.

But if the second call is a concern, we can move kasan_check_range()
and lower-level functions into mm/kasan/generic.h and include it into
shadow.c, and then it will be just one function call.

To improve performance further, the JIT compiler could emit inlined
shadow checking instructions, same as the C compiler does with
KASAN_INLINE=3Dy.

> hw_tags won't work without corresponding JIT work.

You probably meant SW_TAGS here.

HW_TAGS will likely just work without any JIT changes (even the
kasan_check_byte() thing I mentioned should not be required), assuming
JIT'ed BPF code just accesses kernel-returned pointers as is.

> I see no point sacrificing performance for aesthetics.

With the change I suggested above, there would be no performance
difference. And the code stays cleaner.

> __asan_load/storeX is what compilers emit.

For Generic mode. For SW_TAGS, the function names are different.
Keeping this detail within the KASAN code is cleaner.


> In that sense JIT is a compiler it should emit exactly the same.
