Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844311;
	b=CEnOMo1SNhoLyIWkt30PhbRqFzzPeqf+twuMHK1vG9WyUeJdqEyveG7nnw81prJ587ED
	 oRUgOkXjiod+T+XpHdZGbriiPNlxGt19s61rJM+/lu7ilm6Rax+kAvu1t7AEJO+TqiwNy
	 SXaSAn6Z2cfFnZJ3gZ6HYBGYUbeYVge17p2K6xOdoPOHabVDFNYoeAlpIycndndR7skJE
	 rSV1VRW54BUTinmODEK16UrLHyYrvAuUWbpJyoSnrTYroIgw7IjJPgV1DIm8Bc+5OfpE1
	 ubpICBX7GHS8TD+YrZ2/d8lsm6pro1dMiyPk72cUtPZXB2TAa9NSL1JPkIUqus1hCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844311;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SDROaneVs0bqzVQFI7ZEOO+7eA3EYyxEu0hiFdloBHw=;
	b=2jxBkaqW/Qqhfuxoaqa7urGnLv4qf5JWOJvf7P1gTTr3Oy7cCr6QZsGElMzSTviZwYpp
	 U6Ar1G67dBOPtM+DkAbnvgO53lltabdbRJrWlUhCcKbguH/bXIrbi9aBvNaL5wYeHUVgQ
	 8Z1sEfQl4YyCuoy2htbQBSnVgkvUF80neNxFjXIoKloj/SfmdnHQXFSGddWmOTlsjpe1P
	 Loy2dkxzzPScQhbzLoKdrEMypxEpkGkHX5tPsUQshvY1em4MKoudYtz7CI1u1Zk0KkI3g
	 9IEcw4j6s27u8OQ914D/O5NzOKvcegGyUW2Y2WdEnvUYzHqsBC9td9AQ7vbw5MiPxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBLvVdi3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA089606A322;
	Mon, 16 Nov 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBLvVdi3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848C11F000C4;
	Mon, 16 Nov 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844311;
	bh=SDROaneVs0bqzVQFI7ZEOO+7eA3EYyxEu0hiFdloBHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dBLvVdi3aK3o7HGHTBzZvD31d0wXCw8T5/B4x6dqbU/2DUnfW7uB9wPitrgQ0TQ+6
	 ngL6yGGcoWBrAvs3WtYNPyBCAweWsVQ99H1TDCSoF6Sxj+cAeKLqqEJM6RER8SYfc6
	 YNLrb+V2FPDKF2Y/P1t9Svf/T1YtfY4LgmyCBn89sbcOurBg6QZgJj7Z+JZmBJ/cjM
	 o2uTqnkBqr0B58sswgcpheqPpW4vCZ2O48hi+lElOE9acHWu5r7/2CIdbQ2u/9Clm/
	 tjdPvssX9/0ifrVp1YOXImQ5881CBIyy1BFfIlwoR212HhjP095QQ9O7Ist5oTex4s
	 YCX0b9h4S6NfA==
Date: Mon, 16 Nov 2026 15:51:44 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun <ts930@dgu.ac.kr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 00/12] improve mremap_test
Message-ID: <avsmKAf4MRwGdpGI@gremlin>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>

Hi Sarthak,

Sorry we're being slow on this one, right now mm is really inundated with stuff
so we're in firefighting mode (see [0]), so I'm not sure if we'll have time to
get back to this this cycle, will try to if I'm able to! :)

--
Cheers, Lorenzo

[0]: https://lore.kernel.org/linux-mm/a2f584f6-e382-4876-aa6d-d5a34de6ee59@kernel.org/
