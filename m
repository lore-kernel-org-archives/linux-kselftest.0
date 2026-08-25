Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFE4369A
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683211; cv=pass; b=nMQSBvaq/KkFL6Qg2FutLNFCQ5/LjRjfvJ33ZD1fKAVgd/oE08ogI/0DOmQQJPkcA2JQWdFesc+X+/BX9T8W3DGqorF7kCr21X447WEGwHjbmYp1bM6T2SRhKaOVd/AQ9tU8k6ZHZYMVSd9HUBrHSyADh0sAXT9ysMrDhbMhj6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683211; c=relaxed/simple;
	bh=3eO6w9Bp5ObcuqLzTmFiLRp+r+T/pTgWq8ud6+7x5xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNClnW5QvkqpRi6qCzAgt0WCLh+vy6Otnzflt+78WftDBPE6DhVJj9iZyKhrft0J0zvixeNGz0cuCRDzYIQcIOUJBGvyq/OAjMxdUfvzn3NXlaqgK7G4LH8jbCauSZchv7VszrEklfxjkRdPZ/yRfVuYVeTgpe9V/qAolpqQuXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuxHEkvS; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuxHEkvS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1b7e08adcso59541a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 11:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683209; cv=none;
        d=google.com; s=arc-20260327;
        b=XOk9lXqbAo3Wasvz0d/kgfbN6F2mkB8pfpCjvvGpJ4gNouWURj1o7x4AV35ax5g8+D
         yTuFQNJqXDI1i9vy4Ev8Gbii6b93DfCTkdXV6tp/dGIFTLlEPRiCJfmuyLTyi4va+Xk+
         7VN6Rk3lMyvtwkAno0f6kcZGn4Ta0y95QdlkMSaocoVWTAscAyDUoi1zTzrT+Dh7Ocvw
         5p0s5hoXvcy76DjY4ys2Lx3P8Hg7pa2jDJYcpPBxlxMbggzuCcnuXNU9m4mzkmIX9z99
         GfBOUJL7v0sFDq141XjVEekwkVV4iQej6ebP3I3v8D8VPyTS0/GkyJof8ftLASqQlG3H
         eD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQaiqPlt1mbgROpOCjaOHGFPcF+Em/O/8v9mBKdo3T4=;
        fh=SGNLteHHQ4QwLk7jY775fuW0v5LnFlusoxYuBdzILrE=;
        b=USFwwnCSbB4iqeb8sKIEivk2MtuC2FEOyuPE05ZQetdsF/Dcz6svtR626KXFfcyKgk
         Y3FNmXpKTsB7JWK881UQq0ggROM/Dxn7kp5/bea9wdzqgDN77nqBEQFuyCZHOZ+eIlhM
         +XfkrH0dE9VrnY+BFNeh92PPj+54Tw1YBp5ufM7SLyRQfXGfgg6GZ2iVgHzScfRv4oRT
         gtZQWuJg6TNXLt4G8ujiJ647YwMRMAModEvz5FgPnpnvsuxQ2HDl0ctHKZ5l6Ky+qnUl
         pf96mPebPs6ivp+yf/MtRk/lvZuhDpMfWqw+fqgGreefaVk6LW6bn7chwrsZAcwyDnuP
         6M3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683209; x=1788288009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQaiqPlt1mbgROpOCjaOHGFPcF+Em/O/8v9mBKdo3T4=;
        b=iuxHEkvSiB6EdcTJMypDgXuK5rvNe15pvJFB8vlBX3DJEJpi0rwmg3vBm/Opm0Udu0
         dFXOiCI2WMQQKxsgUuFTZ+cFAu6ohBijSvgREtvMc9zvmYu4lbpMxuBp/yB5efrR5kXf
         6vCcRDTt7wyhVcPyOrvb4HUyude0KkVPsQIw/0k7UCdeZt1RXXWFdDc3d9jsah+dcSvc
         7/Gm02O1nkParfhA5xECgh4XML2JO4lME+redU9dw2YZh8s8w5NE9ZHoqDw0Ol8YRfcx
         cFhwV1zVtzFBvAh46jie5Gj6PQqpaxMOncIJJp/B/EpollQ/oKCSMGYgfYQHlK9Ck9Na
         5grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683209; x=1788288009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQaiqPlt1mbgROpOCjaOHGFPcF+Em/O/8v9mBKdo3T4=;
        b=fMYj7px2fc5Gn2nM5QkDqJDJ6ikri/X9X22QdpzETAzDzaNXFvQLiYz78p+d/qbfGD
         DAhplbayhhwCJBfdsqdc11d8zrtuL+J9l4aWl4NXkSsRu/LbUQfuBuqbgwANZIQM8KfL
         /d4svk8SQsp+x11WsARh2cdVhldn/cJwV740/CfwXc0NsuiYwiBPLIiaaDu0Kn0pUa5j
         hKE+hYE5b78ThBf6RZ/foSQpMYoXbsCvQLHjOg6PKQtr1DuNaweKFpssGAbQKIVcSGYj
         LLsqSQ0rYpNmCn46IB82JbjYIl0odGUWTcdmF8CenBJHfEVSCBkt+qDCiKBCz1JpC5eF
         Mswg==
X-Forwarded-Encrypted: i=1; AHgh+Rri5bU0H8eLcJZzoYrDIomEzglj1g+0m+wqMITnYWih0mux/FzP9yfMJSpM2CKg2RSZ84JCn4I/8SAyrkK9TUg=@vger.kernel.org
X-Gm-Message-State: AFuF++mxiqFkVpAWsoCS/d07f3DEaYWFLQSnIXQVwsMNnuX3Dr6h5dyV
	grSUybfWleE27CBox50HnaT6w4BI7T6x2ykYFjBn7Ezqcb47zz6ynZhp9rClMGDMr66FKeFwVVN
	aiIpc9dRq6yfc3iDuvBbz4DGjQ5Yo27Q=
X-Gm-Gg: AR+sD133UTLOlUBwknrDGfEgHZPEBGN+LEQF4NZWpLjQIVmgnLtr4sEQp0jMT1VjDmJ
	xzt/XRdygF5GvtHSpzIQx0jUfiTk909N0F0hUgeQvhKP3Xg86OmpCx+7tSu6L3EedDP3joKaGZk
	na8IT7HerhpiRyO8mqaebh530bSvlkx6XB1z8zlh6SEq2M2L6+HR9EPCiUWBScBlzgKfhMjK9U/
	97A0tbnio7uE5No6X5HMlTW+rqimQDblR8j3g7LkjJw2MYdl9vVT+UUpCiwKFvPwNtm61OnE3ax
	KTsFGZRNYlS/g7Q5nNQ/T8My9KoM42CYCW61y4DfP2A2lkuuRcZLJdTMlFaNTwP/9NaT3DiDVGk
	5Np0/63ufi8MMPyPRj1Y8Up5v383mBZeq9Ps0zgEwoQ==
X-Received: by 2002:a05:6a21:a95:b0:3c1:657:4c95 with SMTP id
 adf61e73a8af0-3cf84459271mr851171637.15.1787683209224; Tue, 25 Aug 2026
 11:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825150444.31603-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260825150444.31603-1-jiayuan.chen@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 25 Aug 2026 11:39:54 -0700
X-Gm-Features: AcwNN1VK5DUH4dTy-rnq5LsKwTmVH-bvp0xFbY5kQSIl5JV7Y6BEETHTTuVfCmE
Message-ID: <CAEf4BzZ_b3=MM2Fh0dEMv0N2TXD31DXdsJaAiDc64HcDoFYvxg@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/2] libbpf: Fix usdt attach failure when nop10
 crosses page boundary
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, jolsa@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Ingo Molnar <mingo@kernel.org>, 
	Jiawei Zhao <phoenix500526@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 8:05=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> The kernel refuses to attach to a nop10 that crosses a page boundary,
> since it can't be atomically rewritten:
>
>         /* can_optimize(), arch/x86/kernel/uprobes.c */
>         /* We can't do cross page atomic writes yet. */
>         return PAGE_SIZE - (vaddr & ~PAGE_MASK) >=3D OPT_INSN_SIZE;
>
> Whether the nop10 crosses a page is purely up to the binary layout, so
> this does happen in practice. libbpf doesn't check for it and blindly
> shifts the uprobe onto the nop10, and the attach then fails with
> -ENOTSUPP. Just keep the uprobe on the preceding 1-byte nop in that
> case, it works everywhere as a regular int3 uprobe.
>
> Fixes: ee2862439e5c ("libbpf: Change has_nop_combo to work on top of nop1=
0")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> ---
> v1 -> v2: move check into has_nop_combo.
> v1: https://lore.kernel.org/bpf/20260824092847.361683-1-jiayuan.chen@linu=
x.dev/
> ---
>  tools/lib/bpf/usdt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
> index 2e56e3ab5b6c..ee9d1b614883 100644
> --- a/tools/lib/bpf/usdt.c
> +++ b/tools/lib/bpf/usdt.c
> @@ -608,8 +608,12 @@ static bool has_nop_combo(int fd, long off)
>         unsigned char nop_combo[11] =3D {
>                 0x90, 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x0=
0, 0x00,
>         };
> +       long page_sz =3D getpagesize();
>         unsigned char buf[11];
>
> +       /* the kernel can't attach to a nop10 that crosses a page boundar=
y */
> +       if ((off + 1) % page_sz + 10 > page_sz)
> +               return false;

yeah, this works ok, applied this version, disregard request to unify
has_nop_combo() with man->has_uprobe_syscall check

>         if (pread(fd, buf, 11, off) !=3D 11)
>                 return false;
>         return memcmp(buf, nop_combo, 11) =3D=3D 0;
> --
> 2.43.0
>
