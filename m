Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE4385D9B
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410342; cv=pass; b=UYvp75Xa3VNhq2vKFSPainQRifwevghirCx7SvEO/+D73/QZhOCdbHPYE0RTcUs11V+hBb4qgXUzvjWA7hjZrKZjbcvKEJ1FNyjomhpa/zJDc1Mu4xokL+sHSltAQC7i+ZFyuQXHXOKjo3o5bEcntAKciz24nDtbnO0Y7nUlf8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410342; c=relaxed/simple;
	bh=M05cKKzyMe6gEci7W/N5xN6B2lG87e4rRXDr2YH4Gn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syS0HJ2V4Gq8xTt7dO9hrXs3hFJ5UJh01eJQh62OC6WXkaQq+1nhMNRaQtFcT3glVcasmMg+E0CRWl098iK8CJwVdsOsc+yiZUJjanepUhPsBCSIG+Dm608VtZLeU0fO9Zr/pm9GbtiRpA1EiiT3Lf+YoLuxqnKyilNfQf+nhx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhRwOt5L; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhRwOt5L"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0c89e33so1649114a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 11:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789410340; cv=none;
        d=google.com; s=arc-20260327;
        b=CaWYHxhLo1lYMB6ciZgdMwGKAQtmLgWQwYBs3nimDvw4sRYe//4KEZ0gWXg9/5lgkS
         H0cQUzNARzVqbzvXWSercZBATlBYWcVpPjLVW8Pck9NzltVzeDiKoOMSn3Hoe5eVCccU
         0h7oKLs9JG8H7Jf5GledZAj9ANER1ROjGcs99wONWoUWRqtTi3zTYI2zUo/kCE4ZBWsz
         NnOnEkQ+f4XnkKlYJdvjdZrXgWA9KpUDYcnc2HQhEblHzvwr9vV7ZqO7O+NxWxXsWfNl
         EoSaozxISTwse4ypBKjr6LPNviUKN/V704mDwAqwZQeIuZ2f8sF6y5IHHafJL3dpcsHM
         aCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        fh=KJU5ScaII0HRuW1JIlxz46nAHt1TNIr6H5hUFp0DiaA=;
        b=qSxFKv6LofdH9c2oGy6A2c8GCWXLl0I3mlpc3R6R4R7lp+FrQ/1swB20nO1grvT0X6
         JDB6VumIF0t0EKWT9LXh1TMNNxVBOu4oksxxJySYk0R0SsRy0Zic8dSVCdtrOG7/Nkq6
         QLyn5zLZDCVRtgouLpGFcDMCB396S7lCLJvuUpv2HEzVJaTolvtQEq2yM2KQIABzAV7o
         EdHzl4YZGPBG37ulHE9RnNLnlj5HQ5PqGtfVzqr7SHC5+p+wMmQrAVv6do33CDvf/7Vd
         /+X01WaWm8h8PbIadm/8yGulwTHf8eRQrNF94W09n2TvAIWPlNKiQq/Yj688kCtuvWyb
         rRJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410340; x=1790015140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        b=lhRwOt5LcPQwCa23RxJjpcmFP5PNada84hRS1iRL67lMg7oGzS9VrD8XU+P5YhNfpN
         kVKGwa6dNvlSj4PxxZfhzG9IunzlkJ31g1C8og2Jxiw1o/dsKzZKe8tLqxIURssaZi0b
         uWl9mu6gAInzTgOJ80IUgCqsuY1TVBeBJMVTKmWnmfVPgPLYg8pFqU77nWy1jvwRPvs6
         EfN+bh/wZlT5W3C30hOHBIB1M/8whF5vf2V24xsVSgQgjkC3xPC1Nve1d+qn7J/C1eiO
         LIDt9qg8AUeHD7ojQ34+3TJK1W8gn/wHDafrq8RY3bjqpnro1DHFJ/nm6ENioRA1DaZk
         t9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789410340; x=1790015140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U651fx6dEYbgcs9HadXqwVgaBN2uUjOTpkPkaj2tUlo=;
        b=p6Yj8v8MDMGY+HG5NZQ4U3X+H+6HU/y9JecBok/traeLBNdAqGge95nz02jkMb8vTl
         yPu3p1IX2WnLRUgAiB2/jGND1CTRr/WwyYRXtuOPMjyW/4bx5zXkvo6ibKor8/pxINJ/
         MeIo6/bDo4FvzfUWYt3pvks8pizXtvBVUfEwQIklatEzwHkKN0zH8yVqlMP0adVEZzhF
         VeCnVL4qatGWNtgSSGxt8CRZq0jhCsfDR2C9KGuYY6koeETsleHphNvOqQ2W7lGq5Ipn
         E0j6rCEBpKlYMugfyQ55dGcdlAnHAhn5qD6+iY3EitRxrVOrKsAi+XKc8GsSWbbRTnv1
         jGYw==
X-Forwarded-Encrypted: i=1; AKwUvByu2LHnZ42gm6d3Cgn6LObPJk/kyoTQ6ETYsdn2KeM4X7xXAhw0Id+MpNv7MCEtWZrgLxCS6QcLIDi4cLCTbEs=@vger.kernel.org
X-Gm-Message-State: AFuF++kMqXvYgqIRybHGNd4KnG9UM6LLbfP+F29pv5RK60wRzV7D4vAl
	fiHnYbck7LKNetAmGSeZHAs/OzPlQvTyZPAkWW355DzVZocr6FYvLoQ/v5R2Ezh093qon2O5Gh6
	SBmFv1nhW5/PuHoLJ5/z5mOms70zuBBc=
X-Gm-Gg: AYBFou3OPYCftUvcbjwiYQ8HqVfWOgCeJJ1ULDqv2AkIvHISZhz+zCOYn1TeIqSe8K2
	6yzDKZ6ctSBQBSBSNI+r1kUnCSp1kz00ralBsD9DrKnRiwwXWRgvEklk0hWXJRl/4HYaiMdYG7L
	FpphKOJNXmxfQ6O/9E8Oo/SEXj7zv6A4p5TQL9RjDBIUWuE5Ac2mJrFCnl9cMjKgSrGFBU8V9x1
	7dh7UOVI11xzgiSLbPpoTLy964pcaeNw8qhaZTs8KQyZgW9CuT8kOqiH7r4kS9F/uRhMJi9cSTa
	cbYhYczOBOLgbMico0EBfWppPBcXVgwQtver/HapPfoUDJOvDkZehrlrZQ==
X-Received: by 2002:a05:6820:2213:b0:6b7:46fa:16aa with SMTP id
 006d021491bc7-6c54292a26fmr2212816eaf.63.1789410340130; Mon, 14 Sep 2026
 11:25:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-libbpf-log-buf-fix-v1-1-f592caffcc71@gmail.com> <05221557-59b5-4d93-ac55-d9e372d0862b@gmail.com>
In-Reply-To: <05221557-59b5-4d93-ac55-d9e372d0862b@gmail.com>
From: =?UTF-8?B?THXDrXMgVmllaXJh?= <luisflavieira@gmail.com>
Date: Mon, 14 Sep 2026 15:25:27 -0300
X-Gm-Features: AcwNN1WpiCNo8BkMZsFY2qQC5nwNASs0EdBNHmV87IALQDdz9LKh29qKxXvtpoQ
Message-ID: <CAFTBxmixD6bHH0Rn+Tr432tbgfzbKcrMd98s7_NTTF-Mibqh2Q@mail.gmail.com>
Subject: Re: [PATCH bpf] libbpf: Fix program log buffer size validation
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:22=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
> The change looks correct, few questions:
>  * Do we really need a unit test for this? We are not testing those error
> conditions now.

Agreed. I'll drop the selftest in v2.

>  * While here should we rewrite the first check as (!!log_buf !=3D !!log_=
size), to
> cover the case when log_size =3D=3D 0 but log_buf is nonnull (we check it=
 later in
> bpf_prog_load()) (AI)

Makes sense. I'll update the setter to validate the buffer/size pair
consistently with bpf_prog_load().

>  * Fixes tag is probably not needed, because this is libbpf, target bpf-n=
ext.

Agreed. I'll retarget v2 to bpf-next and drop the Fixes tag.

Thanks for the review.
