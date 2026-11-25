Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630260;
	b=efhHOS9mknDDh7g3OO3Hv0MxUsmy93ySr5JQYkkoTASZu66O34jKOTux9ota4njc3qfP
	 2zPUeYZtDc2FYItK6N7A6j90CyxDuYDpaU2Q/JxXTuDhXyKX+jbi8x6O6BPlEk5VHl61+
	 92ynYffmdVi2PdGEia+rEMmKyE1czVjwCnDR/Ns9EM50gLXRJfo7j5y/kmwLm9vWVWCXb
	 o5/SJPPk6HGaT1rzSTsgnudIf/yv04eStcw8Yb7X0y6kw9Zt0c7Olzb/uD0yqctIbabrW
	 gy+XZLlspm0kDtjZZNRquFWoI4FGazWiWQogPZIk+pxsFJnbltsW/WPoPMGJUBulR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630260;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=;
	b=FuVs3a3mGmwDnreuttt6sXOOtbO9Lp22oSDH9mTV9QiT7fgkMJOekMEnz5RtvcVCgwvm
	 rTmgGHKGAawKyrVNpGWoNJIN8o+qApqgebr2flrzSIBmJ4ygYTPFvktVhFN6uAsDY38x0
	 lXpl9867pnlcNmQ6sX+SwXe7qNNcyZXEHFO8Rjo2kqRBXEa61tnQnO9mdqZ5mZgz/MMg5
	 RwJqYyYqXMZBB3CBEoW/rnKtvkFD+9SWCavD+/AVD7h3fdEfqVBhs/o1klq1Dfpaum656
	 02QCbBCv5WmbuGU8p4KGYsKYlNjtCQ1wyUyv5CLRe+/blXyVbHxJI8HqaWO/M1dV2AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cryOxmxh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7F606A33A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cryOxmxh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8554B1F00A00
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630259;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cryOxmxhtxlO1KGB/8E7JN8u0pgaKXd3JfHXEiXiM3jywuj6bBaW4BgKUhlY0vOn5
	 IRXgAVvaQEst61cU10Xf9IbAPGIF63V0ngPxRuWlorWxW/PXrORyW7RMkd+6gnIj4I
	 sNBHuTav0OQ+N1FYkaYGb6y+HMWlbi09hcM/yHFxVfOF1O8AAyvTQl74HE86bBvMe1
	 nAPONnqT8P7FU65MTtfMdc5sgAR86zMi9+zJCrcug0m1cp3GT9Qme9gYiu/dp8nm1Z
	 jvxQ/mOzqfZLn2XIk9nSCZlxNvF77m00LYYlD1MzR/STyzH+FDQA1zPn3MUzFUAuCj
	 YmL0d19DIxg0g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5829643e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:10:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhA9zT/XBg9ITqvsJ1Q8e/H2znvGS2O+NgXnXNm72cGVqxuhNkLoxh1qdGSGMJ0hit34fkcn/+QVRIOSkRvuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OjRo24ONL2gfS1ETh4z86qUytb2ZXl6cZpDq3mi7iWUGcVy4/
	COIqm7Qxew790uJJwvoa1S/EfvFliQN1MeVx5hFauVeBQYbkmOttGTYDCaMCPQ7UhW2mxLsLEeS
	718MPxrU4Ym15MytMXuA2OkRWIs0oyhI=
X-Received: by 2002:a05:6512:4018:b0:5c1:56f5:da02 with SMTP id
 2adb3069b0e04-5c1b79fc73emr5241671e87.1.1795630258316; Wed, 25 Nov 2026
 10:10:58 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111114225.3977243-1-ruanjinjie@huawei.com> <20261111114225.3977243-16-ruanjinjie@huawei.com>
In-Reply-To: <20261111114225.3977243-16-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:10:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
X-Gm-Features: Aa3M54oIDRMFXP1RpUMFXoUcM7tXj2uiaN-FyRQN7L3lknX3zpF2wKbegX-ttpU
Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
Subject: Re: [PATCH v21 15/15] selftests/arm64: Add ptrace single-step and
 rseq syscall-exit tests
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	oleg@redhat.com, shuah@kernel.org, kees@kernel.org, luto@amacapital.net, 
	wad@chromium.org, peterz@infradead.org, ada.coupriediaz@arm.com, 
	kevin.brodsky@arm.com, anshuman.khandual@arm.com, thuth@redhat.com, 
	james.morse@arm.com, yeoreum.yun@arm.com, vladimir.murzin@arm.com, 
	broonie@kernel.org, ryan.roberts@arm.com, liqiang01@kylinos.cn, 
	mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:43=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> Add tests for the arm64 syscall-exit and single-step behaviour fixed by
> the following commits. Each test fails on a kernel without the fix it
> covers and passes with it.
(...)
> Link: https://lore.kernel.org/all/20200710130702.30658-1-will@kernel.org/
> Link: https://lore.kernel.org/all/20200524043827.GA33001@juliacomputing.c=
om/
> Link: https://lore.kernel.org/all/1eed6d69-d53d-9657-1fc9-c089be07f98c@li=
naro.org/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This patch also looks like it should be sent in tandem with the other
fix, patch 1/15.

Yours,
Linus Walleij
