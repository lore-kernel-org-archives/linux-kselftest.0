Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974793;
	b=a0kPcuS8YxYlqfyYmVi7ymA3uGJMbXEvDXa6KhsgEuuLU+0/SAq5V9XcsP2c/BQCCFUY
	 5mhb0ZWTmxyxzKMUWtv19QrG7kqIAierU+AV5muu1S1KTnJvaqU9dKm+lpzq3J1Ff4Kud
	 gds/wfrd76MFn/nbGoh6OGkvUEXKX7qU+VbnWwfzOzcPPUZYc2ouTYfAakeNL7gviXH2Q
	 Bdxhzv88m4EjzIzpYfSDxTAtQy9Sp0CDGqXJOu5X43jweYBKdnzMYGnVjzf8E6Iu7vbzX
	 Ndd8Il8cGjyyaB76h1ihKa2apHANRFvWPha7Y9Yv0EQxELjtV5UwHzSEkMdmtAGUwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974793;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=nGx2NwMDbqtPHMPNsh9EPN5476lLpafXJ5wg9iLlkU0=;
	b=vyGnzG7W/woAWsnJwoQ/l7z7D3NVWiEcL1TFzFsEwMkx1barQhe2txK9CrAcgg23EiT5
	 cF5yJWqw+duMWvFZTkdb+8ZnquRToqxS5Sh6yCHf6lBG9CX2e6eMfaNgHqOCL6NA7t/wN
	 0mu93qBZPNMH6J/8+4Fn+PEGVlAIqWlyiqdTDgL7OG5tGVtRnaFSSs3eXHuxcdVhCXwqE
	 Uae+P9Z7LEuOeHN65nA4n/FFB30xDgy2gOLakGMa7oQOu6gSFmKcBxBNfQBRDGKEyfGyK
	 WpJojhLVT/I7ZVZPxhTVi5b+VclLfY4UHFZEIyH61Is8LgawUHG+Y3XMH9ixsenldHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g/HGem5K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D7606A32F;
	Fri,  6 Nov 2026 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g/HGem5K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6B71F0089F;
	Fri,  6 Nov 2026 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974792;
	bh=nGx2NwMDbqtPHMPNsh9EPN5476lLpafXJ5wg9iLlkU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=g/HGem5KtJgc9W8TdrJwmhR17aQrSNJ/3WiUgE8cbYrwLqR+8CiOTS2uxScKtbGx1
	 2c6ZPsrzgjJk6QeVkM7SksMsqAMVHzIPtrjoCThNVLRzZkyXLs3fRlcuk/1ieJf6uA
	 XgkSZqPTiFHZAjJQx4O1D77vN3Kr4sy7gUnO1Av7IfWWeiZWgd+rsuGRaN35Jjvajm
	 JYPtGJ+oHjIv/8muL9XlSFCGAMWWSEVdAtfBIdf1rN+YqwnOkIcKs80n6KttGgm/cr
	 w8WDikVb8t/E8NiEJJ8ZwKg2/Bo1m50TCIzF1c/Frj+iJVc2sPClcjdQanVGjc44Nj
	 04wzD72CKNRcw==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org,  Alexander Graf
 <graf@amazon.com>,  Andrew Morton <akpm@linux-foundation.org>,  Baolin
 Wang <baolin.wang@linux.alibaba.com>,  Christian Brauner
 <brauner@kernel.org>,  David Hildenbrand <david@kernel.org>,  Hugh Dickins
 <hughd@google.com>,  Jonathan Corbet <corbet@lwn.net>,  "Liam R. Howlett"
 <liam@infradead.org>,  Lorenzo Stoakes <ljs@kernel.org>,  Michal Hocko
 <mhocko@suse.com>,  Mike Rapoport <rppt@kernel.org>,  Randy Dunlap
 <rdunlap@infradead.org>,  Samiullah Khawaja <skhawaja@google.com>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Suren Baghdasaryan <surenb@google.com>,
  Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for
 preserving tmpfs files
In-Reply-To: <auu02-iDbVaEL-4v@google.com> (David Matlack's message of "Wed, 4
	Nov 2026 22:42:35 +0000")
References: <20261103010216.3447716-1-dmatlack@google.com>
	<20261103010216.3447716-11-dmatlack@google.com>
	<2vxz1p90jzx4.fsf@kernel.org> <auuJM8c-bE43NP54@google.com>
	<auu02-iDbVaEL-4v@google.com>
Date: Fri, 06 Nov 2026 15:19:47 +0100
Message-ID: <2vxzjymqhwjg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026, David Matlack wrote:

> On 2026-11-04 02:37 PM, Pasha Tatashin wrote:
>> On 11-04 17:59, Pratyush Yadav wrote:
>> > On Tue, Nov 03 2026, David Matlack wrote:
>> > [...]
>> > 
>> > Umm, no way I am reading all this...
>> > 
>> > LLMs are great at generating tests, and I'm not saying there is no value
>> > in this. It is just that this massive code dump is unreviewable by
>> > humans. It is also unfair to the human reviewer because it took many
>> > orders of magnitude less effort to _write_ them with an LLM.
>> > 
>> > What do you all reckon we should do about this? Trust the LLM to get the
>> > testing right? Do we give up human maintenance of tests entirely? Do we
>> > do fault injection to test the tests themselves?
>> > 
>> > Or do we make the tests smaller and more human reviewable?
>> 
>> We need good test coverage, but I believe we can break this patch down 
>> into smaller changes where tested features are incrementally added.
>
> Agreed that it needs to be easier to review, but I'd like to keep the
> coverage. Here's what I have in mind for v4:
>
>  - Move the preserve-side checks that don't need a kexec into
>    liveupdate.c, like Pasha suggested in his earlier reply: which files
>    can be preserved (permissions, read-only and append-only files), the
>    frozen size while preserved, and unpreserve. Those then run with the
>    regular kselftests instead of only in vmtest.sh.
>
>  - Split the rest of luo_tmpfs into several smaller commits that add the
>    tested features incrementally, e.g. one for the test infrastructure
>    and basic retrieve, one for the open() flags and creation checks, and
>    one for block accounting. That makes the series longer, but each
>    commit is a few hundred lines and can be reviewed on its own.
>
> It will still be long, but I think having the test coverage is worth it.

Agreed.

>
> Does that sound reasonable?

Sounds good. But I think practically speaking, it is not possible to
review the tests as carefully as the main changes. I think I'll rely
more on my LLM for those.

-- 
Regards,
Pratyush Yadav
