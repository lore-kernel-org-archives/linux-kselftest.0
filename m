Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E291391820
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355462; cv=none; b=PSWri66BLc2cpORA0IxQ9NsqscarR6bWCSW7WcsuIspRYUWaLtx8m0xpe0d/aYydEFOpYCBPgK/gAARSLMEchP+DehBOfi8AfiHFp9o7ubWj26MZ72JZtvkAMjP24Sbor7WiOvphCU6kjX+L1NOxd7cKvRJi6ZY6IV5HD0TJ3Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355462; c=relaxed/simple;
	bh=MagPqVsbkz0mIL5nlBd9cVPZ7LxdFHiUc+nKZ0NPEYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEk+dsHrAh1i2q1vuIch094d+uJ2rfuB5jEngfc+r1M8++jXeY/WSmZe65V4wM5Exur3sTPPvU7GA42ZnIxgobfZAEFdimKd/abN9LGYhRsZEIS3VqiAFMpz9mawOoyeBktxFWcE+b/ii0Y7yRbVkjMUnR6TlELDXFF+c3DCjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEs5j9oS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEs5j9oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DB6C19425
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773355462;
	bh=MagPqVsbkz0mIL5nlBd9cVPZ7LxdFHiUc+nKZ0NPEYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FEs5j9oSSv9qmxXAP7HGJxCzg9zFwU/bpRr0BDh7y+IlVktt/8vxoHm9F8SWod3yb
	 xN/huMkckl9svPCk8pfPZ9MpKEuQ6M0sclA5uYSzmrbEKf6TIvVdSqpj14nwTiqU37
	 GnZsIrcyB5aWUa6EWJ9USMzFzEfkn32KfJGneuxxHhsjfAPW4Ail4Sq/04Rmb89xip
	 XImI8Np9mUufFLG0oFAE4mnYpgGveztlp003GPJwJsGYhAxcqPBldnzD4pIe5jXun8
	 F1/Y2XVE8r4zI8jK/iMOc0jCbBbNoak02rFAvRxWDLEXWry2y4TZv2A+8cbcJFxEaA
	 Ut+LA8AHuA/ww==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b941ec6a368so210702966b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 15:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCE5DwU9BZKTQW+r2ojUICqxaNbckgY18zqbtMuW/bus7BiSEWCCVuOrdzws/HSVhfYnDQ3j6phLU1BNxGqOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXC2wPgFS/XC6lpnJB9QiTa0n0DgjahCbGfxkiasCBdtqP6GiG
	nu2dOGXRFZnLYUDI5EaPVF+sTbcu0/SxH37IwQZh4WLnFIizXdAjuuEDAYFnfj5+NkoNo86toXs
	B5GSPPylXoHXE4NLCH5mj6FIjdqZqbY8=
X-Received: by 2002:a17:907:3cd2:b0:b97:3bbe:e42e with SMTP id
 a640c23a62f3a-b976514cb8amr58819066b.33.1773355460946; Thu, 12 Mar 2026
 15:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312040627.55257-1-liwang@redhat.com> <20260312040627.55257-6-liwang@redhat.com>
In-Reply-To: <20260312040627.55257-6-liwang@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Mar 2026 15:44:09 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNfR5Z3g=SkU9-eEeA-DDY=rp0Tcw8sXKYDpkZtJtQ0sQ@mail.gmail.com>
X-Gm-Features: AaiRm50vDEtOUq0fV0iULrsrYBSyRiSP_BhVBXrE0buJ28vyLlqKpO06m_wmxQg
Message-ID: <CAO9r8zNfR5Z3g=SkU9-eEeA-DDY=rp0Tcw8sXKYDpkZtJtQ0sQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] selftests/cgroup: replace hardcoded page size
 values in test_zswap
To: Li Wang <liwang@redhat.com>
Cc: mkoutny@suse.com, yosryahmed@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:07=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_zswap uses hardcoded values of 4095 and 4096 throughout as page
> stride and page size, which are only correct on systems with a 4K page
> size. On architectures with larger pages (e.g., 64K on arm64 or ppc64),
> these constants cause memory to be touched at sub-page granularity,
> leading to inefficient access patterns and incorrect page count
> calculations, which can cause test failures.
>
> Replace all hardcoded 4095 and 4096 values with a global pagesize
> variable initialized from sysconf(_SC_PAGESIZE) at startup, and remove
> the redundant local sysconf() calls scattered across individual
> functions. No functional change on 4K page size systems.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Yosry Ahmed <yosryahmed@google.com>

It makes more sense to have this patch first, replacing all hardcoded
values, then patch 5 doing the necessary changes on top.
