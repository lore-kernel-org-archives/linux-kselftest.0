Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B893822BB
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633399; cv=none; b=QDTDrB7LUCihjflNRldn42rPOE097yDi33NrwyCb1objUhQXYSdrIffwfbnu6pTWIIQrsAL88VgVPdRAft14O/vptpVLnWyX9AvkwUUUqiipYdkpMlPiZ9tz8c4tDKSr890RihUKXKmqrYwmdraNb+byUrgLyILa88x/qbR24q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633399; c=relaxed/simple;
	bh=qDplgMgSB8GKiMH7AQ1XIe1zw8ZX4lnI0b0rHbUWBQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL6sqmRcVIDcj1YYWZeTTolPBH9yw67F//ya7wLvnfKmFDVEXQdOPMDEM8RafWDK/I8HyBJqNHPeoSPvkvXLNsWrXAdz4lHDLlQQW/NlX/6TcGq/c1buxkiMDxN3m+lhrzvCOZDsgegpscHPlnfsyoCS8bNoYQOmk/9VWtYSz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR4YZ/OX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR4YZ/OX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377871F00A3F
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784633398;
	bh=qDplgMgSB8GKiMH7AQ1XIe1zw8ZX4lnI0b0rHbUWBQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lR4YZ/OXGBlZez/KWPQj8+p5ZUM6HPdysUb55fWx+Y6UV+vB0k3fWtN8g1+VfMVqR
	 vrnPEpARseBNPvDLqQ68cGATQA0L3MUlJeZa5NdVmrn8CeeUOb0eTaYJpScfdd9E+E
	 kjfq52A/mAL2PcaSMCZUoHEA8CTlGi/iL/hkJKr/0IMOypjkDTA6nmGIsIUGB7+3uh
	 ViJ8eSJwtPoYZMs7XU2nduzV+SDWDm0ri1dhQgbM4sPkV/M7xblydQdDweJi24FjT0
	 tVseN7wn8BWqVazSo/Cq1JhPVvGfqKXuGW+4S5Ku4IkPeednb2hmCsoO3wPvK35WWR
	 MhZ80pVFU/QIA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c62764c7cso40198631fa.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 04:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoF0c7KzTTnbV2Q1Hjaeajietbryu/B49pui/zFA7hCf/8MFG4BEliKEq6vtbCvwTh7ztsziyjKKzNzhGVkCS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+PYVz2TOgCUvYMqK2/38v6QM454v03zTaFy8Uf8KhLOttTRj
	v1FfhdpfXg0Ar01KFLKobnK09GyrpNhOysaX4o2hzduQQ0jkKNmo+8dyKh1/EJGcDO16IngmBKG
	tBitt/USECHkG4eMoAU+CH2qN5/ZKbAs=
X-Received: by 2002:ac2:51c9:0:b0:5b0:1433:13bd with SMTP id
 2adb3069b0e04-5b28a16682fmr4547358e87.9.1784633396583; Tue, 21 Jul 2026
 04:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616034410.70675-1-kaihengf@nvidia.com> <DK39G70DVR3S.UUEE4333DB9W@nvidia.com>
In-Reply-To: <DK39G70DVR3S.UUEE4333DB9W@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 21 Jul 2026 13:29:36 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ggU82224fh1JRaNA6V6J9t=CiADCn0rmVqbPEezaY2hw@mail.gmail.com>
X-Gm-Features: AUfX_myMqh3lKgqdOz6-2SclBm6oZVrgJxTPLlDhRovHhsc1tkgFV35wFO5GYns
Message-ID: <CAJZ5v0ggU82224fh1JRaNA6V6J9t=CiADCn0rmVqbPEezaY2hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ACPI: APEI: GHES: Add NVIDIA Vera CPER decoder and tests
To: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: shuah@kernel.org, kees@kernel.org, julianbraha@gmail.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	csoto@nvidia.com, mochs@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 10:37=E2=80=AFAM Kai-Heng Feng <kaihengf@nvidia.com=
> wrote:
>
> On Tue Jun 16, 2026 at 11:44 AM CST, Kai-Heng Feng wrote:
>
> A gentle ping...

You need a tag from at least one of the APEI reviewers listed in
MAINTAINERS for this.

I'd suggest resending the series with CCs to those people.
