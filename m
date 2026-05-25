Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90EE3E51D3
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699121; cv=none; b=gj/4snVgY7i6GH6NfywziuOxZtRlmj5Ymk0p3DGoX6MQiRK6bT9EsrWeNW/NsuAQRTBqo2M1efEyGtW+xhRs0ocn93YeyCVQb00wCoHcfmT6FPD/LBYnEgANZ3ax/42sE6CuMjTYn9iE94dJRxvtlFoaRAMDLwfDeGuDULli23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699121; c=relaxed/simple;
	bh=KSP9ghkSHvUp2PCGytYvBDkp55Rj/0JPKZodyzb8klM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEMUXqo6FwkYKQKaCwwUq+osQWm3AF4KEsRad1M/zJP2H6zlTMaL2TTSbGVBq52KnR59RyvHkKD8OsYF3Q4F/NMteR005qpBpCoqVnMZ+G7rvuMZDgmvJVuTo21rHUDuj2AkpLduEy80Feu431H6hghcqz5RFG9MBWjM3O/CnJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH/zaoKq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH/zaoKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9F41F000E9
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699117;
	bh=KSP9ghkSHvUp2PCGytYvBDkp55Rj/0JPKZodyzb8klM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RH/zaoKqPFg1kHJxLv7osW2qAgegDvDuTPbyBhjuwLHRX7kBifXM1xYIPjAfXFBc8
	 qVpWt5METORC290pdJ0H5Z504SsQhbKBj/P6kaISUfAoNrP0uUu5JMl483+etk/yS+
	 t1i6fqdknyWXH66fenwS03DgKLmUrkv+qZPX3QTTRzt/EiMxfAuncJOcZ9U5WJwJwa
	 7UfraiSLvg9zHnNd1dmAksmvDDxhp0UbLK6lM5zGiSjYgRk1cVrOuiWAaaRd3LVqNI
	 3DOutuBsagB30Ou2GNuWgyWb2eT1uGbbidogLsGnzixWqldmefe9iC4PetM5Nzhbcg
	 w30P/IjKBNxdQ==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4824b15c19eso7722011b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 01:51:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8u/N6cQTG1JTKnF9O95S6fnVr0DKMOf7DHxK5M7ddCdUrmnggVVDag0qjZkH9heoC5Y8AwSAL5Ufe9fjZ/fTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypqqArKqoOjihGPAyL0klnpOpYxF7zSrqThaokHh5ixNptD407
	Hxi/e1KTVOQyZECp6/KoG+Q23nIX/zOpM47Pvkl0oa2JmDIIY+60LEh45Z114Y6CBsq8BW1G+o7
	YVTXSyIRyMpmpyFxv9JGwpOQORgxE4+w=
X-Received: by 2002:a05:6808:4f53:b0:485:4396:91a3 with SMTP id
 5614622812f47-4854a3b9ed3mr7761797b6e.30.1779699116694; Mon, 25 May 2026
 01:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
In-Reply-To: <20260520-gpiolib-kunit-v2-0-cc9db39881da@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:51:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-ojs+-cb8ktp=-G-_KJFHapT-ShkDnoQpB6ECogQfQw@mail.gmail.com>
X-Gm-Features: AVHnY4K5_2zkPofWM9BEGLoSdLlr7XA1WZ0CFt3YNcp-WKDVPYF5rhteGOuoNrc
Message-ID: <CAD++jLm-ojs+-cb8ktp=-G-_KJFHapT-ShkDnoQpB6ECogQfQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: add kunit tests for GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 10:21=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
>
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Pretty cool stuff! I wish I had the energy and grit to do the same
for pin control...
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
