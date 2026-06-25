Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D581A9F87
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412365; cv=none; b=UOJgOYpVfq2ovfN0AbQ/X++iphCDNQ+lzH1jp8i6kK+FdYxMD9OHP+pLFu+W8h1SH8l2Q3eGOLG0ld/rOtwFIezIjs67v0pMk0TLvW0X+gDjHUkNx/fsr4NGq+IgFKP3Hr4XEYaXEYIzf9EPax8aYH6+FgY5+Rfu15AkE1HtsPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412365; c=relaxed/simple;
	bh=GSBvzHimrtPTHyFZYnFlxss5tjoakS2FIABKN+BFO4U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlSuq6ob0WpvcVU79IDzHLqdsjRvCbGmY5JaEZARl+D/8nkOzIRyCTwR/62UrPfWiKM+stJt558+tMHzHPtBaN1rd12fhYxmv5KocnUcxmmhFadhhxkcPsat2023lfB0KdrzBnYOUNsMp/FrLbA2jmlmmqcMdZX6QWhAo2wuZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdnxM3IT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdnxM3IT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c8007ce809so1574095ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782412363; x=1783017163; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lByFWkdr8AqsD6eHmvZL45Q1tDRFoc5Hf59UJo9Xm3k=;
        b=KdnxM3ITK8b1OwcVHF2CrNUDLpPeQy0KnFyhnWejpkobOvD2+vng2VyLc0vTIw1MsC
         xz5C4UY9AS7x1huLHAUeOG3bIFQGDx5Iaj+IKmVb4bD0+uJOD2nxMuTVuzCabxF7b2ww
         TpYnHcqa2Q7BjXMzCA/SGI7L3M0d3TwAMt9d44GqyphqCbPRED8SaBdg+d69UBWUCBY/
         s6LxP/0GsouUoL3qZPmWTSTVIxJNOMwotTyUr9NUCYoUn6EYCOhEDtfmafmZal93yI5i
         pFpfDNUta+CsLW/KfNBB54NZnlePHIB+F6YinN1Mmoab2Z8+xXyOIiO3lGxWYwcxGX4P
         5nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412363; x=1783017163;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lByFWkdr8AqsD6eHmvZL45Q1tDRFoc5Hf59UJo9Xm3k=;
        b=U4sQZrHOWLcnTe+N9qIyLTGoriCWp1Alsz0fk1vtMIlcIU6FQDr/WFL9Kr04Uf/2T/
         tykP11VpMW6APIbjBPvLnzAiL63Wc5Ha1Vx3psR4tXoSZCwe7AWZSheim6K2vbnGXKqD
         e1/LifiK9zlWf5EzEFmh7pnwyzhgzR6ZZFjIgJm6MhIbFHWwpICc1QcROb6wFNtfN8Ay
         LCrq6jhKhcOtiarggGCXJPd8uklMEogd90AFtj/xbApnFU+z9bOdtlEO3IeJqlJy3j/H
         LwbHVnK9BLsnB+9NJDrDx48+eS23E2FTYjAvEEkDCmUgL8USeH3APHqCS+hDAobhX1BP
         uceQ==
X-Forwarded-Encrypted: i=1; AHgh+RoF3BYOMXrdqLlW+A7j7UV+DrQJXie5lko+iQ/yqD29WvSpWupzTEHKA62zu/0X9I3dJQBkSiVw/cBJ953RlyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9cDyNhCkVVBFIMyXpeIPlV44L/9RATEYtZmlrlSmpx+xeSjY
	DiPSK3jXeT2MiPQRW4zOK+PMM4qFPVVZwOe0EWp6mhq6DgMUmccYSzsW
X-Gm-Gg: AfdE7cm08GGulzaE7o9bSNHM1GIddYDmRZTahje+M6Ucgg2urVyc1BlBxX8QBKQxStN
	L4F9osNDqmz5tv20OGeRsV01D4J2Vw8R2apGkRpTuZAKnP2acAaXMKdTrz/Rpkz09yUXBUfOunk
	OpHEk0FWzsxHk2mmdvgg6qXKx5clB8Db1C5HMBDJBiJJDuuBH+g/ivF4dq+tzgh5c7Xrr1A8hI1
	eRd9WARnADQ5NSi3DUFT2NUb5NFJfLJONZhrFfOku7NgdSQgaYGf9tWzbloo1TGEvY3JgvMpP8N
	5BBXR6zi5Pyeb/kZK5THvNIYbnGH1hWrd9Mg0UphtTLcOdP6eKu9bOJVc/v8MW+zAfE1TGGEqRj
	BFNkXmdpmfSFxwbYGOu3bhtJiYFZfte4nznnmwMr2WEh+jTQWS71caKqs+2u6u2pHcnK1GR60sI
	sHEF8lKAnJOesVaLVzbsG79mLJR7tyMXPMqF+GmLbKSg==
X-Received: by 2002:a17:902:f690:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c7fc6ad9bcmr39674465ad.16.1782412363176;
        Thu, 25 Jun 2026 11:32:43 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm25757935ad.41.2026.06.25.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:32:42 -0700 (PDT)
Message-ID: <860e915356c571791712be02c636405aadfc6467.camel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Keep fastcall spills for helper stack reads
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 25 Jun 2026 11:32:32 -0700
In-Reply-To: <20260624-f01-12-fastcall-helper-stack-read-v1-1-e0a86085ef77@mails.tsinghua.edu.cn>
References: 
	<20260624-f01-12-fastcall-helper-stack-read-v1-0-e0a86085ef77@mails.tsinghua.edu.cn>
	 <20260624-f01-12-fastcall-helper-stack-read-v1-1-e0a86085ef77@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-24 at 16:39 +0800, Nuoqi Gui wrote:
> The fastcall spill/fill rewrite is only sound while the stack slots used =
by
> the pattern are not accessed outside the pattern. Direct stack loads and
> stores already call check_fastcall_stack_contract() to enforce this.
>=20
> Helper and kfunc memory-argument checks can validate PTR_TO_STACK reads
> through check_stack_range_initialized() without applying the same contrac=
t.
> When such a read overlaps a fastcall spill slot,
> bpf_remove_fastcall_spills_fills() can still remove the spill/fill pair.
> It can then shrink the subprogram stack depth even though a helper or kfu=
nc
> reads that stack address.
>=20
> Apply check_fastcall_stack_contract() from check_stack_range_initialized(=
)
> after the concrete stack range is known. Zero-sized accesses do not read =
or
> write memory, so leave the fastcall optimization unchanged for those.
>=20
> Fixes: 5b5f51bff1b66 ("bpf: no_caller_saved_registers attribute for helpe=
r calls")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index ff9b1f68ceca4..d77332eeab359 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -6873,6 +6873,10 @@ static int check_stack_range_initialized(
>  		max_off =3D reg->smax_value + off;
>  	}
> =20
> +	if (access_size)
> +		check_fastcall_stack_contract(env, state, env->insn_idx,
> +					      min_off);
> +

Thank you for finding this bug.
I think that placing the check_fastcall_stack_contract() call here
makes the same call unnecessary in the check_stack_read_var_off(),
as it calls to check_stack_range_initialized() with zero_size_allowed=3D=3D=
false.

>  	if (meta && meta->raw_mode) {
>  		/* Ensure we won't be overwriting dynptrs when simulating byte
>  		 * by byte access in check_helper_call using meta.access_size.
