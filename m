Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799537;
	b=DWn1rUtAVWpHos87xyzZfVIZCUv1EcspIamJBvQ0MYVJMYFF/xmk2ClXdrpHNR1Gf5Jn
	 vJcqoOPE5uQQfHIt6Uq0sS+pVgckgH2SnlQ9LpjipZjLf7RVWMYCAP/LjW0VcTfTeVvMS
	 10V5N5Efh0S6vhndjM3pXioxJLb/O9BOCG7O5IHEQGcnDvwmBhZPRcb1c95EHD9JCfe4D
	 45c0BeWbqxTG7pNVXA1C8UyQD1Php7n953nQ/SN9xVByTTNWbEHwp/xe2JiwbuS62ic4Z
	 3em2fPVCTYviKtK/eGzBb8I3I4nm/IWwCfU/Cp8/8+et+yDLd5OD8Phs6980/4W2Miw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799537;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vZywcU4Tpyl7Imqa/19fq644l3VIzOmHxylUZc8gS5I=;
	b=pn7kA2857Rour8JyeHSdF18GWZiV8KeRAzEvnpZ48M8gx7evJDmBjMtmDMGbvKoPrSaB
	 gMK5lIyD8qS67ll/O2d0BnmOQzR3FxrHPqb4dIU4SV1FoNnG6JqUy+VVXA5n6SBkB53dK
	 Bl56+4mpPtW7CPaxXScBbhzXRWrb29OLEur86mQIe4XRKYq583wUBEtQzBwbpCwijD/2r
	 3flRF+o/cP4kif8gTf5Ve7qYmcfHGOZc5OQUeluLnZC7DWdRXWBu7bJbt624Nkw0SiSp0
	 FrGqPnebbo9bIVz8kDwDxlahRAjXXsR+aU+N8ivV/0UMbtXJKOC71BernrppD9ZNIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSDLIn9Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400E606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSDLIn9Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAE31F00A20
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799536;
	bh=vZywcU4Tpyl7Imqa/19fq644l3VIzOmHxylUZc8gS5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dSDLIn9ZQZ9r/Ses78hycRTDZjPy44GtLGx0BLvIIIihhZ2v3cSg4ajqnbxJ2XMns
	 m725cFVSdYbSo0Ze/Juyhar/+eliRZLAVJIeAenD0eB3D5LJhbC99N47HVyaarlYlJ
	 VNSZklNuu7e43QS8YFctJcLMPBeA+UDGEjWW8c2eRxuWgLeoVH84FRMfEwq0oY+Pqd
	 wSTlITpTnueDpg98YnCWwNNGzHir8f1dccdsSkV1J7lAwiuITgFSizLF+xW98g43e1
	 POYpFpZHSFoWEP8fxQQMApxCmEDLLVH600aEEVl5cGtMiLiO//tBRgL+BvpK3nKSmK
	 ez7/JSnv2Tgtg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso573885e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 05:38:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxyWk0YVA2BzObkY/XSNKmWAJn4f5vqu+KDmv5ztei7Y/UYtGOBrGgRZHDTc8qXu8UnNEhjDtDFtV7SpWm73MQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B8zFGPs7B0VbR9rUIe2SVVyxMhKmUW+S2iXPlWvGYZar/KiLX
	+BDadJSu2NBbLYfo+dKMOQ3Kt0hSACvLz80zcu5V3cPX+3W1/Xs+4z/NKQcKtL8tnZFv7TXkLm3
	np8Xn1xV42UUIUsvwmjXvijBp31R5M3M=
X-Received: by 2002:a05:6512:131e:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5bfd9569866mr5529745e87.33.1793799535620; Wed, 04 Nov 2026
 05:38:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930101805.1770358-1-ruanjinjie@huawei.com> <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
In-Reply-To: <88c40977-28f1-4f01-aa5c-6dedac822d21@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:38:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
X-Gm-Features: AclHuK9kvG8D0e3y0XT-oNPCO0nKfvGSwXLhxydNpJZTD7bCAeF6aTcpo_tZU_k
Message-ID: <CAD++jLnX2ptZnOHWvU6QR+4VKeM+kPfjShkB0DQZpr3hnG0DOQ@mail.gmail.com>
Subject: Re: [PATCH v20 00/15] arm64: entry: Convert to Generic Entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	oleg@redhat.com, shuah@kernel.org, kees@kernel.org, luto@amacapital.net, 
	wad@chromium.org, peterz@infradead.org, ada.coupriediaz@arm.com, 
	kevin.brodsky@arm.com, yeoreum.yun@arm.com, james.morse@arm.com, 
	thuth@redhat.com, tglx@kernel.org, vladimir.murzin@arm.com, 
	broonie@kernel.org, ryan.roberts@arm.com, liqiang01@kylinos.cn, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 9:52=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> Hi Mark and all,
>
> Ping.
>
> Are there any further review comments or new suggestions for changes?
> I=E2=80=99m happy to address anything that comes up.

You're pinging in the middle of the merge window, people are busy!

Now that v7.4-rc1 is out, rebase on v7.4-rc1 and resend please.

Sorry that this requires constant rebasing and resending, generic
entry is so intrusive that we need to take baby steps... maybe we
can merge some of the patches and not yet all? I.e. a trickle-in
method?

Yours,
Linus Walleij
