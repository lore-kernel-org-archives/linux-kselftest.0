Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC039A4BA
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471315; cv=none; b=c6qGwzsT+YKBUJlRagEKgBcXejRE1pvX41gu9jh67tsFIsXC4cWeuwnOb1MJnrFMhNEpX0iCElJx2UXpGAfip0NZl//puuAhuTkE1bWobHp9CESQO6s34NxxAA7zqYvq6M1HHLWlK1g7Jk0MRUjM3KC7ImmOXcA4qw1t3oleHPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471315; c=relaxed/simple;
	bh=gKkizs+f68UKcuJTGDD7IBI8qWtBY0VHFMDqy27eA5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f20Cf+5y4gEiShEBLMM7JohQfbQXZOX2uJmu2wP87NCDAXvQDqba4N0iq35b5OAlwOOP9Q7hBC+XHuW5TPwvAVHmxg/k6uxlOIDhizOVQAGJXenUDNzoN5092LhpY6tKL3w0pUL5iqVW6mly5cCC1TTLgXwFEhb3I8vlRzmDLpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZU1NwxED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZU1NwxED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A58B1F008A1
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471313;
	bh=gKkizs+f68UKcuJTGDD7IBI8qWtBY0VHFMDqy27eA5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZU1NwxED194mLKHYU8sGvVDm7lBEdNNqlJs/t9l8GR1Z3kctzLil3hYCsRHD/zA45
	 /GOjY0NkzhJRpAXtiwBTQkRJA80+umbuCdGBzGUf5WJHuBehjTV7EdimnSlR1vJ2PX
	 OEeJmiZQnirLX5eaQWmn7SFKagaOem4ccP+EGLjOfRIbrAbGc+E50+AG5kRc3DjSMt
	 /yOWrUlnZmVKwBPrnWXtxM9axON1/+R8z6K0K6feI9Gu3hjMKc9qU4GmOf14/HOgr9
	 WlLPpWUHE2Gn6+fm0KEEKBmXIeVU+p6VKYICKxOUlstf22nJ43lEftDhpMFSqvPgMc
	 DQylgcdaLdczQ==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5175b6c4e19so26556591cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 00:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+MUpruoEJTHI5cr34bofT6pw30i/HxbtjdFrBzXhi5mCryWItk/DMD1Yi/vHUOH585nneVsw/cIW68z1b69OU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8RdnoJy4VOkA50pwmihwmp54Vl0DiqjG0AHe7V/B4ZMxdPV3r
	cuGaAQtc1SoTlMLm85QFEgwxJM+cPXUzWi9zCh/DT5VcRcHZFVchkRD6JsjqW5Qy5t7TXnKC2Hf
	UuR3IaR0Cp7aP1WeBTf6GKrl00WN4Ffs=
X-Received: by 2002:a05:622a:8c16:b0:516:e189:3482 with SMTP id
 d75a77b69052e-51778705ae1mr32469561cf.29.1780471312590; Wed, 03 Jun 2026
 00:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602205847.102825-1-varunrmallya@gmail.com> <20260602205847.102825-2-varunrmallya@gmail.com>
In-Reply-To: <20260602205847.102825-2-varunrmallya@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Wed, 3 Jun 2026 09:21:41 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNjWsEDUaEX0aqMMYhXFJDLqEVkhRw00eT3c453OR_FE3g@mail.gmail.com>
X-Gm-Features: AVHnY4IrrqIAKdlwh3i7VOvIUnpe1Vfg8EEQv7q2bfleL5garBpk7i54WjKiuvo
Message-ID: <CAJ+HfNjWsEDUaEX0aqMMYhXFJDLqEVkhRw00eT3c453OR_FE3g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: use host CPU features in JIT disassembler
To: Varun R Mallya <varunrmallya@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	puranjay@kernel.org, menglong8.dong@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	pulehui@huawei.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jun 2026 at 22:59, Varun R Mallya <varunrmallya@gmail.com> wrote:
>
> Pass the host CPU name and feature string to
> LLVMCreateDisasmCPUFeatures() instead of using LLVMCreateDisasm(), so
> the disassembler correctly decodes CPU-specific instructions and
> extensions such as RISC-V compressed and vector instructions.
>
> Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
