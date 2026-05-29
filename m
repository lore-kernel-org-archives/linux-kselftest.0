Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBD3546F6
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780098192; cv=pass; b=SWcNwDeKXgl7zeF8EL/eHGiF9KjmTrrJ0dPBIXQI1aJ2Egtssd5We9/aC/jMtO4nT9CCVCRZGMEmfv9SYMfYVZ+9IGOk8Z6E8B0ll0iAdbx377SxejzElyfq0hLTL7Qx/KIuziUZ689pqUI2sxfn/QXN7McNbKP6tu8r46znqsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780098192; c=relaxed/simple;
	bh=s24YjcNDlm5RkCq/PpxAqixsoAF1LSfQA7DLLpd5Rvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZawBL0tpYoGo9PSnKVZnJ63smN+oDVpC6bTOW0pDnFi87T15w/rAdLPVPm6E26xYm4u8gjcRiZKd1YIEhJ4hWTng4kjZ5tEbv+ACEACz9IoqQMAVy0n0E1DnzzA6d6YXt/Q4bjaIcMvg6Pd2/5UteisdNO3oDjTQ4CExqudEd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sLJ5ZqyL; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sLJ5ZqyL"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-516d6009380so2551cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 16:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780098190; cv=none;
        d=google.com; s=arc-20240605;
        b=I2RPfzjxQr/SdKHpoi9pUcHap5UyUWi4nhBEmNUHosXd57X46QnQoir9m5GBt9306U
         ws5H6Xt1RiEtauSxVB5R0M4wxuTd6ZFBP7q3RE3VNLmppNwWWQ8bA9EdSILuH0ZLOIS9
         wSsp2J06pYo/FcC5AIUmMeJ+LQ6w1JgT7pg6D6MnePF8bbuDpcJV68y5SaNQ6OytCVNf
         3m4gIWkLwSFcqkWK6iwHRkkvMGmIOoFsxBkbWfDll0g60Qm1+G1QsMDcg2rHbeIDLCNx
         uraOuef8JSvr2vqjDw5Y9pDtHyXwDbBiztDi5yIPkDFw1ybb4XiMHt+7TzN3/IKq7PiK
         EA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKzq7IfcEZUd3hgNxILmg8jMvNqPdQHBBOhGY2G7POA=;
        fh=uEyeuxpHZWYSpbKZH1M0/3gl9buX3AzdPwZOAbxAySM=;
        b=imp8nUrhUxhLPMe3QUHVDGrWIOOibK+QPyC/uo+hyJRyqeW6e+Hz203kgcfabLUmPh
         yjZ56tXfE0skPEcHBpBcxq2346qCZDbzqncm5ASAMgeeIPpd3vnyo6Vtntd2X8IEFm2g
         ZEY96a8PLJHosU0v8YBbjnEApCW6V1NXECk1qVO9iNrCWorOQwWAKy3yHz2VGwEsCTSQ
         cERxQP6aLtmkKVtEuEDPuI0wFL/j6CMDo8DSY/P09ulRDoJZcQbgK4PgnthOfAc6B58L
         jS3dEVEbUiJoBmCF0jlau5FAyi1tdpeC9Yu+qYb899eXYymIf+2Nog3l6q5Q8no4CL7x
         +IdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780098190; x=1780702990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKzq7IfcEZUd3hgNxILmg8jMvNqPdQHBBOhGY2G7POA=;
        b=sLJ5ZqyLgFGzRytaxjXwrF5SYHqWFCPB2mwACUvWOzeMFUEFPCkNjiJ+TgVHLhJ4jI
         3b4M4aN3SA+ZdQWcu95JNMjfaODQ4pJnAMnIeyW9/IIdDl16J6B+8kJ9csCHYoV1zE8V
         IVQ+n3QP1YBOsxxsvCyUvB2fQOoW2v15on/yO7hc5NCZHUwKxwq1aY2JypIxeSqyquir
         AXf13tGp3razthQCOpqSbHxYdw6ZHiPU0bAOs02C33jzygv6wZYL3ggBDpOxl2GH7Alh
         8t50zhGJ63P0vM24YFh0sVn4al2/1dkiUfxENoa4pSbFqpUDFKrIU5a7UsKt2tNKHVRx
         09hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780098190; x=1780702990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tKzq7IfcEZUd3hgNxILmg8jMvNqPdQHBBOhGY2G7POA=;
        b=HinHhCPlvFacTyvAekanhU4egvaGAIJ2aUZtehoC07k/1Rmy0dGK96x/1CleqbNxb+
         BvyxIuuk2/ELaL1klGcQOhe1I6m/VoMEKMzzCqqsUFrPyVQrMU+olZ2oWyyGJQeUXtPH
         bFoc9M0ZCD3qeewHQ0SgVWIgtgsZA0WmUP4Cly6rdakSHlrvf+ug/7h5X61cbSBdINO2
         WM6u+tgdmEhln+jmsM6MMrhAwocK31GiVLLB8l9E81BuPCH1YjM79DxxLT+aEQ+inMBp
         Zv3pr5CG8JQwTE1Sb/9Q7yjVUML+s8jD9nApyu248iX8kCxDQXLZINExO0VaKJPYsNT/
         04bg==
X-Forwarded-Encrypted: i=1; AFNElJ8mu0/vVAXZzOHMEoKTC61i2Dge0aURYsteq+jnsteB45feOudRRar99TH8lHgID8RiCYk3eDGc3ZMkE1RBKC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOvskPVeaYCZGVW0xCga36ksWq22XnOusoItpDSlVOkdMOjvO
	+Bfx5Sf18SOigKDlGxKtM9MqBj3AIqDl6LrXGRTwWor0houvv+9PRmYSoO3kapcYkB8aZz1uNSH
	OzcCsJxBhPa5OyURGyU5ZBsZFzKqj0EOLcm55PoAL
X-Gm-Gg: Acq92OE/sJUHHN4/vlZnFCMYbjExkHRhuMvLqZlWq1bWtaBDO3fVhaRneqfOBMpSizl
	wg3mTWT7TXHnQ9bsHXpwJ8UGxzBNH32vWzRgflGhEQFsxm7J3hfV3bN2A4cfhwDmcHgl5X6Uuwa
	xPJgmS+d1I206rns2A1QN+i0aHBf9SXAf8XLf4S3YP1XDIUBXfdLBPr0FgMovob2kc80HfxBnoa
	zQq3LUKUOEkYHTeIfsLLaJFtIr+zg64ZCEgJKAKVs0t3fON3ib896K774OZhD0ppgKI+AVIgcEC
	6WSQnrEUQOelD0lxQvGOapoJ9gH6UPZvR4Ew+kZbWsy4XysHl37IRpSnLQy3fWksmuQG9N4qDz0
	=
X-Received: by 2002:ac8:520a:0:b0:516:cc18:4760 with SMTP id
 d75a77b69052e-5173c7f8e90mr2205181cf.21.1780098189444; Fri, 29 May 2026
 16:43:09 -0700 (PDT)
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
 <DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com> <CADXeF1E-QpKj-37T5ghiycXrVR_YN72fOc3M4OQg-Arz7JNjsQ@mail.gmail.com>
 <DIVG6ANND95G.2MC7WWJG1P01A@gmail.com>
In-Reply-To: <DIVG6ANND95G.2MC7WWJG1P01A@gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sat, 30 May 2026 07:42:33 +0800
X-Gm-Features: AVHnY4J1Ig3EmZdh4uvcsIMLiW1cS4wpj2bYrs1Iukydy3ntReQaRHUXULNuSBg
Message-ID: <CADXeF1HQ-Ep-DVGfDs7u7YB9prjAuotS9qRBg2xWP980a27t_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bot+bpf-ci@kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
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
	Lorenzo Colitti <lorenzo@google.com>, Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Todd Kjos <tkjos@google.com>, 
	Carlos Llamas <cmllamas@google.com>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 4:36=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> I bet you fixed your android setup long ago,
> so all of these "but what about backward compat" is getting annoying.
> Whatever kernel patch get merged android won't even backport, so enough o=
f it.

That=E2=80=99s partially correct,  Android GKI does stick closely to upstre=
am
and mandates an upstream-first policy by default. However, we merged
this specific kernel patch into the Android GKI 6.18 branch as an
emergency fix, because internally we determined this is a kernel
regression (introduced in commit 120933984460) rather than a userspace
issue. So only kernel fix is merged, all the userspace program is
untouched.

We want to avoid carrying out-of-tree patches forward into
next-generation Android kernel releases. That is why we are raising
this here: we want to align on an upstream acceptable strategy to fix
this issue so we don't carry a permanent fork or risk regression on
future rebases.

> Replied earlier that I don't like random checks like this through the cod=
e.

Acked, I will raise a v2 patch to add theck in bpf_prog_query.
