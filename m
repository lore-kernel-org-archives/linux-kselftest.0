Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E2547064
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 00:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467408; cv=none; b=HQc4C+AcLCIIHaw5G6PXjIY0mAWaf9R/fgvhIwph0c1O0oh8gF/hWSl6t9HHCeLKqwRqkzYsd8qYcvrLiItDlPGgWI28uOlqlbGoK3nLF3m6rWKdKoxaQOvia1MMGFIEwSbEc61SyRVTsrbgIDH16mcUEPO5QvvpzlwNPKz3Kx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467408; c=relaxed/simple;
	bh=dM60/lQJZNJbWoteFqu6uPH785ljbJ4v68GljKAZeM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEwoGQODFAQ17mp1fbH/TVTj9y+X7GpuVA4iWflhc52TMifpnfkZaxawZ4b4lZ9W2N4xRz03LkMg3NCZAO21qu4NiJLw3DX4Nm98kwB3YKgeui2q/crsgcBdUADZ5uqGxGfZcHYmbf3LpeS8djCeEgGSr5loPbDJKyOG7I8d4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E091F0089E
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 00:03:27 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso202769666b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 17:03:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTVwolEHPQuoE4Hh8kSFARvlClJyQEzlTkYtgmiWfsuAAM9Lm5bm1fBT0pgRKRM5W12RdWruxvxMjFGhkd7G4=@vger.kernel.org
X-Gm-Message-State: AFuF++nO0uK7jD6ccP/Loq5wW5fVNsPE/fyVbnW6Juwaenf+UJxoXoRr
	Fa3LlPUH7ZjoJWqViRTYS/mpuBWwwY9aq2t19KFlxAXWi37nyq7ha86HY/f0n+WmkeR/CuTevEr
	bkPi8KujcIzmz9FchpMmgtd0iaC3XZSVgjME4K/XXFA==
X-Received: by 2002:a17:907:970f:b0:c28:e01d:1d08 with SMTP id
 a640c23a62f3a-c2ac268a3b6mr767904866b.49.1790467402757; Sat, 26 Sep 2026
 17:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
In-Reply-To: <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 26 Sep 2026 14:03:11 -1000
X-Gmail-Original-Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZyMX3KOF420HwXlAK4cpZeFQwMK0gQ_EG8K18s67LKRQ8CucrkEWbQU8
Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-api@vger.kernel.org, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>, 
	util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 1:32=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 6:55=E2=80=AFPM Matthias Goergens
> <matthias.goergens@gmail.com> wrote:
> > The series fixes zram selftest device tracking and error reporting, add=
s
> > the swap policy with DRM eligibility checks, and tests routing, working=
set
> > activation and retained-entry write refusal. It is based on mm-new at
> > 995829088503.
>
> Hi Matthias,
>
> I can't find mm-new 995829088503 anymore.
>
> Your patch does not apply cleanly to the current tip of mm-new
> mm-unstable, or mm-stable branches.
> Do you have a git repo with your patch applied?

Never mind, I have the conflict resolved on mm-unstable.

Sorry I usually need to have the patch appliable to use my own review scrip=
ts.

Chris
