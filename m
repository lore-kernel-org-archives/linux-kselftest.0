Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBED24E4B4
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980920; cv=pass; b=M1LgcIY3aJC9apc3SHFvw5ikdeahFkX3J8/8FaSBS7Eh5E7+2qkm0bvANpq/AUlZMTDy5IQOS7Yro5Lw5tXdmoaVRykwSkh1VgUFyoAbzG0Vo71VPpgdRDXqoCXQ+Vwiy7syu16yD4wwgSeIfEUxpW0OZQZX+FVwsLuqHWZq/0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980920; c=relaxed/simple;
	bh=4WZ4iIUPajl4NJp75JywruKIPXJf+O+1EbtTSz98TYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZcwKs5hoRyth8Xc71S1SgHtxJGmuUUXzHMMl1n501biyKVlixh1/EnQkPW96GsdNkF8yf8GI2ZnI056vJIPjP1MbWEFju2O9dmlbQ81Rb4ufkGHXqkKCt94c90IHyr0Y4vKYeFlvXXbk6Aess4h8m8e0efCLjmSEx5MPl3sK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waiMAjKM; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waiMAjKM"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-575124e716fso4517223e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 08:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779980910; cv=none;
        d=google.com; s=arc-20240605;
        b=d+MrJKy6AtBuKVINolniv5z4L6aaHkOOUaw4Qmesp8uxLWXAp3VwQxk0JPOWefXdt6
         qUUK4ouJso2b6nlb7A1D0g2s9OyILM6cf1iHTE2dbOdqGqRpBQCBV0p041g1VMUCMz+7
         ir48UL9nabA+g4wNovfy5VKNc2Y6skbkWaf8No2fJoZvSCaxx8mgus+sbw6sDBVjbrya
         8Jy9TblVYuIpo6P6BgkTgURekHJre1rf8/x14RLMY6ajPg7ZQv5ZLh4NzdDlzeAP4gI2
         lFu2JlNUn/f+C8DsNcI46outJ7SGD12rs3ZheEXT2rZev/rkXteekjCM3sfRhcIbZNFE
         QOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WZ4iIUPajl4NJp75JywruKIPXJf+O+1EbtTSz98TYI=;
        fh=7Dly0BwzTp8xL/sQO63E/p23C+YMYsS7nlIHDyedaeM=;
        b=QQKJ9KxAfUsRIiUy/2IkPJwsLmr4nn9W7UKY+rFn6LnxY63itRed5aipya7jjnR8Pp
         hKOSZlmsbdzomPTL+F2qyWgSY2R2rOv4uBlJVass3CZHkOnkrIm1Ln/G1W9p5i7y80tW
         6YM8Qxwrc9rxmYlkwmBCaXltM1TMUTAwgUYfc2qUsHbZmgZDDnxZRmGck/NqQnMyFM45
         il8BIqTLwKAaC/3c69K6lETjPU9xnasV7S7n/oFm4vn9P9nYwruEi+54SftVNC2s8n4U
         rrLnXh0sUgVqvwjvLvPDeIhTi1Q6eEzSm18Iu4SzwCsIZpH49Cw+PwnJBCGgb6en9JJz
         L33w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779980910; x=1780585710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WZ4iIUPajl4NJp75JywruKIPXJf+O+1EbtTSz98TYI=;
        b=waiMAjKMyMQ/F0gq/JN3nYu8tMGRuRr2b2omRFKXVPVlZOV+k27aBAO3KDzxkW8GlI
         1X14PJjsWyBR89t95KvIr9gQeWtgfvecUZxFDrsHDnJTSH73ZN8XuMcy47nwygk8vKHA
         gvxxJn/9DKWCbbdk5dFYw7I/o5azwQtBdbtm8unAgOEon42OYez3fgyN2/aQTpJJk3eM
         IfO7nD8z9ytSM5z+Dv4FmDdOwekmrwksMGS49DIyC9vJ8496+SNA1QrxRAhrWpL4TNEG
         1JrqrTw7lZnrWa39U3vXcUW49+WXT4+tUURREVVyvsBW6nSY71TYu/oMkiXWfjDBNtLB
         19dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980910; x=1780585710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WZ4iIUPajl4NJp75JywruKIPXJf+O+1EbtTSz98TYI=;
        b=lwwo1nFbFGXTk5OO0px7MiMAqRXDmn2oTuRifLZlwfN09aYsJ+Rwg8XRFifwFysdgF
         BRW1YoqHWsFSQoYL4xINXD2MKuv3Cj2E2U0BpxU7xORzRCZEYVWGKB/YOc7+j4MRdvuR
         yFl7MoHVp14ZlUuLffi+QQdhKPRWP7p7smIIYVBQmSIJWNVI69YMZhXAF1d9WSGPldX1
         zrOv311ODwXvchUX3rhi0xezBStX/0AEngupb1VK8+qZV8rz1o2Uk3+yB9UrnCTTqkLC
         wdi5edMHJjXqVceJxq8hxisNFpzjbHS22T4X4cUDCl08aRTJaK+rdZ058xuxIHahdZfn
         cOXw==
X-Forwarded-Encrypted: i=1; AFNElJ/B71+xxjfVJiefccXbxHRMM7R090hFC9AmSZhmosS2zMmfjXOmbh8BeUURRi0Hefm1bhhn20p/sT+1uDx2Wpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsSdSXdLe865w4kqA3Gqx3XezRmN1x48drYplNnUoJYWuZlaW
	baMEzr7uDJc7ZrgEOdWStmjJDysnOsENFlMrfw+WSvy4s+/++YGyaQaX8HysPwOkxrtCSAgDtkx
	uj/d6jb+W0k32BaYqnttxGI46HpkBuvMV2HGl8TO/
X-Gm-Gg: Acq92OFsX6s9Nk58FEhLEWRtLl4vKROBQFcqNmjgLH17J4O/0W5w8+PZyGyuNmEROYc
	2A8GwNsh43V2tLYg1PD0atIEizdAU+tvq416n4okvDcPdxjvMNK314VdEMavqnDyx6VO9HOdaq8
	wTQqh8Il62DfVOXAYI/SvX0SmnvdhmipjI1RLA5lhQlpyzDzyXu+QdvYaM+NQlBBgRsBoyiSFGG
	9u6lAVEbk4rWU510nCwzh8/IPYJ1XNfImAjXWjIrWMzXgk5Wg0HKE42RG7vlVQUH1AyEHOqXpgl
	YNw6KF4F6AKGjFr1TGowOUgHROzNHeqBHXAIwSSva3pdHbf4wqI+
X-Received: by 2002:a05:6122:4d89:b0:572:36f3:e792 with SMTP id
 71dfb90a1353d-5866403bae1mr13660976e0c.14.1779980909356; Thu, 28 May 2026
 08:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-2-yuyanghuang@google.com>
 <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
 <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com>
 <CAADnVQ+42+Th6OFGq2KawzvyKUAykazb4fXh2_uqss-T+R8VCg@mail.gmail.com>
 <CADXeF1F=7RcxAsW38w_mpFeKCLxTAh5p_XYHd=x2Ru+oajoN3Q@mail.gmail.com>
 <34b18a3e-50c0-4b0c-8ee6-d7a291619231@linux.dev> <CADXeF1HRe=U7aWx2yx6RFZ_uH-mMbdsxMheofr2tMD9wae46oQ@mail.gmail.com>
 <6083831a-dc6d-42e4-a1c8-8b7f6b966650@linux.dev>
In-Reply-To: <6083831a-dc6d-42e4-a1c8-8b7f6b966650@linux.dev>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Fri, 29 May 2026 00:08:18 +0900
X-Gm-Features: AVHnY4LmMjMha3LiIe968snQ7eRPeJFvP-knCBaHuX3iqopfu6QUUqbxOHtspnA
Message-ID: <CAKD1Yr32VMefwq7Bo6_hmhFrDVsttNFwZJZcaXS4P-ACOwWobw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Yuyang Huang <yuyanghuang@google.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	bot+bpf-ci@kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:37=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
> To avoid such stack corruption, you should reserve enough space for the
> query, e.g., by extracting union bpf_attr from kernel BTF vmlinux.

That seems unreasonable. There's already a size in the bpf syscall,
why can't the kernel respect that?

Also, the length of bpf_attr has increased over time as the kernel
adds more elements. Doesn't that mean that even if the userspace
program passes a sufficient size, a future kernel could start writing
more bytes and start overwriting memory? Breaking userspace on kernel
upgrades should never happen.
