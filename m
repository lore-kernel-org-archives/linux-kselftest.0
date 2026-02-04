Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C773DA7E4
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234535; cv=pass; b=WIA1whrje/Ceq1/OGgqeHBjVOyaq2nBdcbOHas1TlijRZMmEmPuLWLrhgKmTnG2L87GjZSfU1ZZQjBtFT1x/yusUxhe4ArcEBABUPRmTk59utyVP+zyLJuD2iNT0zeoWkgi3CxEf0VsUXbUj7fJVigadqNn80gAyMMDSDnEGMak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234535; c=relaxed/simple;
	bh=bSIrMjvVryS3QuF3cPDJgDoly4qpEwj7FUTfJRKsTHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5YtRnT0v9KfWjI8RTvtt14ijsItqJCXWbl9WTd9INDzuGz+UgdJhpdX2PfHYfx/XxvNmPNvnOAmuuogzgkj+RaE6AoS5ATgJY3mRQuwQ+1S3a6nuQNfl8d+g5wr9dc9QJYXb8AeVXTia4nDVeJ+xB3IuoVltypyXtUyhWadxLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnHVWCsR; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnHVWCsR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so55601a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 11:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770234535; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfrH2NSos09+qEhlUB2VXEo6xw5OVUH5H/u8WrNgkCMeKILvmQNtz6v9qT/gTM6YKi
         lLfONy6JgwvOrEGW7D2GmHyZ1z173XPOA0q8IOpmFniL7XRsXBpc9vLFrxmcGsF+oFHR
         JtEw2vKqHdpvMS5DnRuUw4JShFRnQh99fPtUoiPQ1/Nx5fK95cyDJQjM0lGncDh91Tdc
         aC/l4Ccjnm2K55ZKYzu0osA1Yle0XaSj+PzEWjvNcYLMhAyNEbcIwPxHVo3RGWOkaeY6
         TnKnunrkjdmpH8Y/ZntKwXmd06iF6x219req2FePKqSQzHLb+Hfu7JoQVTTUjGh6m3+2
         wxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhxIQ4idA8yZgMj8bntXp33AUjuSpj6i0GkwuCvW47c=;
        fh=v2L76k77CreziOeWZg6FhQxevssVAAkaNLLD5n35QNE=;
        b=lhahgwWzyPV+6DhH+p2zzsnqtV86gH4NhCW6X10bVQFUWodrke2PoT9WJGgA8toMiX
         08gjpO37Z2nyn2evLqnokrzfELeYaXrjtttwOyIMC+SYO5vYjvav6YmbhPDkqPwRFYlA
         ouHNSdVi4ZxdlidH9QfXYCY/maUa8VBo8IwoTSuHdmMGpeQvgv2LiKxPjfPlaUXQqYIs
         khKgBLCtKs6xh5ex8WXUsR1ZwJUvYL8XGX7Qv9VfEw/iNF/5X2lcIKJUJZbaPAK5Du89
         cIBP47a4aa0SHGcXfDvpM13yTS0PqDoBTlaZ1hFsSrxFfNv0kpO5j6NYEvQGdXSWnK7L
         ktvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770234535; x=1770839335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhxIQ4idA8yZgMj8bntXp33AUjuSpj6i0GkwuCvW47c=;
        b=TnHVWCsRX5CuO4JStAQwX9v1LRMLvYS4IZ0izbBLMbh08SU0RpvFQ30w4lAnaiS04H
         gpWmHtyvk2ZSPTKJV5k0FWbOZwbL2aEWRWMWRrdKbJw/WvtVMxunDgQ184sqPyeVAfqF
         NpYlL41FpyFwtnFq2HIADB7oYkA0iLNEBEbNmgNEm9II6NH0nMSMzOuXy0ifosmoUoQs
         0OZAaCKfD4F/XY1dTLgGtoP7nlZtjnEYjsJEkNDlpHB37DAK8Hok+zdZK+CX4DVNWWNw
         zkNXLw/VLiHk3i+Qx6Ysd1raLdeR1kQr6eQ0D0C+zwoqm/i48nQ3hYou1Px5f63qdrnx
         bWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234535; x=1770839335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhxIQ4idA8yZgMj8bntXp33AUjuSpj6i0GkwuCvW47c=;
        b=ETeE2+JwNer2WfMnCTpfGneANWCV/XwO/9ZNKgAV/K5HjlkOpyYb4Hdnl3rh6vqC4p
         sYiMuzvgue9LMeEryvnDqOfIK0qdPuw/c4P49i5/ruazKko2dLoz5W3bBmLsXrukU8bh
         E29E0R8jQ8aeia2R8teSo4fs+E8cE0qmlU0JtXJJtb6V+VV1FpTzjtZ45RxJQPiMMUXN
         rLtkqUKjiNaKTyPzPBtQOluO9JqbbAqylMbify4Aof7kXjxtCYnCk175W3KQn64eIYXf
         QisZ0B4A8x82tBBEiJTJbnhQ/Hu9ycb3JThF5uP5HsILsnSPMAg8pGW16JdXLXgNu5yM
         98TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu7JXi/530WUkSHc7K9x5Y7WPVoJXVC39bzMfTChwGpthpBsqLFxRI3eOqnjVY7KXuw50DUadub+XGvhmepI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72My47EQI7FmXdAcZxBLQydrUSvJR9dQr70K8X8acOIpk1auV
	myQdq/kkPppE9S6XshClX4Ordd10IZhrBHt510s19uzDMIGWSAbOnULt4HBTDeAUsTOgSQTR9/V
	/MdtbZV21ut/tsNpUQQINcbti0/I4u8M=
X-Gm-Gg: AZuq6aJ9cLZZltMBUmePPuIsjySfHDPwi3bcBJBqqHBB0aJf9SbfA3IzxnRgyR/NR+6
	9ssvDyB7OQnra9C409RPrxZJkZnRen1GKHoQOK0/AeH/ZcAdGOZJAacVLNkzZDoeGNXTCileW4t
	SQkigOY4bciBMXdKIHrgdmoj0UL+EHkY1+stk6cLXjajco+qKzQTxs7EexozDE7r8xc6rDLo9wj
	EHHoI+//eK6GyWUfzM12A60K73QINcerXvg8GUNJ/qxz5ko5/TawZk0OkcgSbVkO0DoNjmHCkcv
	pj4yb5AtjV4=
X-Received: by 2002:a17:90b:3f45:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-354871f13dfmr3876158a91.35.1770234535011; Wed, 04 Feb 2026
 11:48:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-3-leon.hwang@linux.dev>
In-Reply-To: <20260202144046.30651-3-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Feb 2026 11:48:39 -0800
X-Gm-Features: AZwV_QidYTjvoEYC0f1oARTkbpeV2p90PM7rVpmH2nsmMkKOPAJuwbUzYyRsbSk
Message-ID: <CAEf4BzZ7Sa2dAUyw5kjaLiwtr7q4_H97uTpb2bsbqFuiy153fg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 2/9] libbpf: Add support for extended bpf syscall
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:41=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> To support the extended BPF syscall introduced in the previous commit,
> introduce the following internal APIs:
>
> * 'sys_bpf_ext()'
> * 'sys_bpf_ext_fd()'
>   They wrap the raw 'syscall()' interface to support passing extended
>   attributes.
> * 'probe_sys_bpf_ext()'
>   Check whether current kernel supports the BPF syscall common attributes=
.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c             | 36 +++++++++++++++++++++++++++++++++
>  tools/lib/bpf/features.c        |  8 ++++++++
>  tools/lib/bpf/libbpf_internal.h |  3 +++
>  3 files changed, 47 insertions(+)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

[...]
