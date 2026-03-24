Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6131A3164
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311367; cv=none; b=kFICwo3kmHXdM4Luw8kBmS03dZVuVZm9lmAWARI4B58luwhBbw5jAe0gCfjcK75TDhjMexLlMpvYRSy+llOveYXAn0BoCE/F2fmfdin4BADR8TxDjsCVAN68ADIBXW+Unhf2L5bzJcOaF/5G2u9vn5AZrSEcAlRC1NomkVJqzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311367; c=relaxed/simple;
	bh=6Gx75jnNvcaM6576W+SZe+dNyLWeLhW4qqMK58nkH+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QO2zx5i1TncMyZ0+JbiNKXiwP4VRatPvl7z6bfsIDHp4WgC6h6a92W9IZfq7BC1hc+9HqVzWfAzmvGq7GVJxuY1qkW8P+GjPsmKnSFGCIZcOigHqsOTJF/6sLeKYb5b6ryTMzr2vuNY5DMQOY+mJqSbTnKgTB03smyhcTD8SzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIKAbPpH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIKAbPpH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F81C2BCB7
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311367;
	bh=6Gx75jnNvcaM6576W+SZe+dNyLWeLhW4qqMK58nkH+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JIKAbPpHGROjBGv7IHh0X1W9lMdaGkdvyWXfU11Lw25fujx26kPAob5bNPyMATsEF
	 DTtOUenelJ2eiNiwIHPn+jC/39bU8ZgRHyBZkqraTHfy+vl09GXfNJ1JErR80MbYQO
	 bmZBniu1Qejnvlu41IsUPEv+3HI0xdWCi0prOOnUwKOzREL1pfMyPl0j5U1zCSuXAv
	 O1ghQeGthh+UtOQUiDjgj1uKXloR4VM/vovM0DqlUlU0BDUUF0i9cnpALxpaqXgZEN
	 hjl00wFRbPaV/l0ZgoHdgyqplYLk6NnokTR5Y0DVf/+0Nn66J3AMT4Ump/RooUJmU0
	 u75XN3cSAWRUA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-668d9dba217so1481661a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAbKWMp3yUariPeGg8SfWwUl8w02DoHtPCuZ3oh5AB7Pr3Hd5Le/Xi5ue2sB6wzUQy5EQNzVxms1rCix2PB/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/OxCQNQ67VqOpFSEQhZQ55g+43mi9M+ZIfGy6DsaSOUII6yb
	STBsvZ5XHqafxDBuvgL7hatzfe91xqBdv7W6wDpKxUqMZpDvYGBAYBQ7SHCxV+PR5abzlh7pEMT
	n3+sgMRgjq3to7Y5VkZMCSMZ948d8q8E=
X-Received: by 2002:a17:906:1d09:b0:b97:87e4:7f40 with SMTP id
 a640c23a62f3a-b982f37d43dmr878599966b.27.1774311365588; Mon, 23 Mar 2026
 17:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320204241.1613861-1-longman@redhat.com> <20260320204241.1613861-2-longman@redhat.com>
 <acE2MoIZ0pl7U7PX@redhat.com>
In-Reply-To: <acE2MoIZ0pl7U7PX@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 23 Mar 2026 17:15:53 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOTYPgqc_7TVWjQ=adn=pH1TLLX2cBNfa1Y-x=TOFJT1Q@mail.gmail.com>
X-Gm-Features: AaiRm52fV4nUPr8f7ewBjl2IN6lomvXA8YiY3qcPBfQuorYLYyMi7pBpBc1tcdg
Message-ID: <CAO9r8zOTYPgqc_7TVWjQ=adn=pH1TLLX2cBNfa1Y-x=TOFJT1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] memcg: Scale up vmstats flush threshold with int_sqrt(nr_cpus+2)
To: Li Wang <liwang@redhat.com>
Cc: Waiman Long <longman@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, James Houghton <jthoughton@google.com>, 
	Sebastian Chlad <sebastianchlad@gmail.com>, Guopeng Zhang <zhangguopeng@kylinos.cn>, 
	Li Wang <liwan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 5:46=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> On Fri, Mar 20, 2026 at 04:42:35PM -0400, Waiman Long wrote:
> > The vmstats flush threshold currently increases linearly with the
> > number of online CPUs. As the number of CPUs increases over time, it
> > will become increasingly difficult to meet the threshold and update the
> > vmstats data in a timely manner. These days, systems with hundreds of
> > CPUs or even thousands of them are becoming more common.
> >
> > For example, the test_memcg_sock test of test_memcontrol always fails
> > when running on an arm64 system with 128 CPUs. It is because the
> > threshold is now 64*128 =3D 8192. With 4k page size, it needs changes i=
n
> > 32 MB of memory. It will be even worse with larger page size like 64k.
> >
> > To make the output of memory.stat more correct, it is better to scale
> > up the threshold slower than linearly with the number of CPUs. The
> > int_sqrt() function is a good compromise as suggested by Li Wang [1].
> > An extra 2 is added to make sure that we will double the threshold for
> > a 2-core system. The increase will be slower after that.
> >
> > With the int_sqrt() scale, we can use the possibly larger
> > num_possible_cpus() instead of num_online_cpus() which may change at
> > run time.
> >
> > Although there is supposed to be a periodic and asynchronous flush of
> > vmstats every 2 seconds, the actual time lag between succesive runs
> > can actually vary quite a bit. In fact, I have seen time lags of up
> > to 10s of seconds in some cases. So we couldn't too rely on the hope
> > that there will be an asynchronous vmstats flush every 2 seconds. This
> > may be something we need to look into.
> >
> > [1] https://lore.kernel.org/lkml/ab0kAE7mJkEL9kWb@redhat.com/
> >
> > Suggested-by: Li Wang <liwang@redhat.com>
> > Signed-off-by: Waiman Long <longman@redhat.com>

What's the motivation for this fix? Is it purely to make tests more
reliable on systems with larger page sizes?

We need some performance tests to make sure we're not flushing too
eagerly with the sqrt scale imo. We need to make sure that when we
have a lot of cgroups and a lot of flushers we don't end up performing
worse.
