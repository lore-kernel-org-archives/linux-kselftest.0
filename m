Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832163;
	b=BSq78LNSGBDa20xwZm0iQetKjalhyzfOXsOnhvpe7FgDDrTh0z9Xc6QS3vMPdVrzt6p2
	 kkCekLQ26V+94V7JBFW6vnbJhoufQdYhkXgh51DeMR6REglg+LUYyz81KKymIzuBlq5Df
	 TH1hxdupy8Q1cPKsGiGt2dDIu4Flh5ns90PTRVpaHVitvdgkQk+/4DzEVqYOA0x4sqxl8
	 JwogptFJIMABDDEypTYSQvwQTL51usQ8uy3jpXm4blgEmdgEY/XLI/U4qvI+R8y0o65IG
	 auH4NpBJ01tmHxyRVGmipbdN5+g12tCzvSqcVhM10d+H6MjEaSGooZIP9lKvTh7XrdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
	b=Gc6P+5jlb1cnxo6Rg6Z3+MSaIfYiZvIc8pr/tjBjLSipq2oubGDqK5l422OYAkGdsg65
	 fVn1Y4wUh7b9ShzH7GOVybL1bSGM7sCGDYw148gmH11UWAX6Sy612pJHGIKtaUrFAtufg
	 qjE5OZt1DtR7UMzL+tVgV+uB/sV4oQm8z5kFQFDZ2xPiouduPJpEXi4+GQEu/EXWF9xM5
	 9qKfbeHM3+H1DHMCrS32NxAMraZFRZj8ZQFFPlibLSzLq1ywmABQUiCjRyCz2kCNHBVft
	 85IKe7xWFh2Rx8VB3B832Aw7MaDDPTyRh3xp/R4TxuJ11AlXqW27UnSC1HP4sgR4bLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516B606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 22:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D516B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so869313b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793832162; x=1794436962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=bc5gIK1rOiKNTqR/V1GB9jM18i60T1SwBhl4NZlMaTtld9M5yRZjVbNgJ/8+MuJ1Rb
         R+UGittyyjUWptyfq3fLhJGu9SrfDQnETn96wqGM94k8RieKsyWvw01K/CN4L4D+OQG3
         uTS1hAKLQrYdIf0uyXwqRxGXKTSwQFd154CH81ZeZj81l2trnkwT21X3EHognDxg4A/4
         ZsAjip1IRND8yVoiiAUXMGNxi2weotMDj7SpnTjV1OF5BGf+zG3NQYqHSp2rzaKjMwCS
         4qMmfVgchGfSMdZxR3/T+LknVr1db/rhVccT1Xz0P95cQr0wwhUoWgo8WXHpESeoVajc
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832162; x=1794436962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=xKJNB7dBSx2kNtSZRxogm/RxhO9f0bw7MELYkrCEkdAWT7HRUROpKPk/mTRKSIuSfa
         pShbx8/aKOgLnB3iwXDoJJv3bIbI7ynfsG3lcRo9jSm0Q66BK0GK/+3+ZjInzq2+UrTZ
         wYuryZuOUbQZaXagGgThncJwBFw+zD6RtAQRzvVZOUaP7eRzgxM1m26DDzYr2jJOVsE3
         /VzJEropgPkALfj+kZlxDt7Dqg/NWsZBMqAN339apBFBdSr1CjGWWq3yU/tS7pPJVUjl
         6v65UQ7DYMlUk5ZoyNEIhrXW9Y7EKLbdoucwTuiz0QEuP5eBcIG/qCh+udy9U/w6H/jo
         Y5IA==
X-Forwarded-Encrypted: i=1; AKwUvBxpNGg1jvx8O0396w9SMMMD8nZwHoPyK3deVSjiph5NlJ3SNQl6w2h4TYQkf7apwkTe9pYymmeouGN9AeT10no=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E7bNhRJp9wWNiV5eDv+HfPYTZzFVqgWdv6oG4dJFQvWTAVlSz
	z6+4yInfLmwECu1gK9SwlJIhOsI1bzLwHSlPMMbr0eJrezfdmU6aKqlse9X/s7t68w==
X-Gm-Gg: AYBFou3tZPpdp5KbxAlMrf9p1HA1+BE9Z+KzMstEeRhjrH9W/AQe1SL+fxCN2I9GgaD
	sWfeIBO9OZ31GLjzGZ99TicYpXrunbZGJCOL1g1B/+NZPDh3dIfVuf8itf8cznQBtPD1bCRg2VZ
	LT0qvFVbR/zJ5y2SPYzumK4ozhg8EM+LSeA+3Ieln8FDo8THWspvpjIoU7F/dCoD6G5HFUtatxs
	giYprTlYPOoXriZ2O0QAtpN2Ulb28qv9VDEvL5rcXCUdoJWJwr8Mhurwmd2J/5k+CvmkNPtlU/w
	Pv18R3Ukdt4lEqe8NQWMxbxSepvja4rAYYnTianhcj8gfEIxjQ2m2KXWjx29pwe0t49bG8A0Xnb
	uPxhWjD2vdHlY2EHNVkjOSo751FjacELpVZRnHgQdcTExftf7BGjJFNm7t3lmVzZi8CNOS6yNbk
	9BFxUYcg9c58snRKfvoxBj92eukjyS6GAblJUtHRbFEn4cEFDVWDjRy5w2Uhq4jh/At4m+0E+xI
	m5aTzSd4sb23jlazbb39thuHSVqH+Jwchb9CPZZx/gRkj+wkeLk4zivM5T6XXBBv1FDtyTs+CZU
	7541CebLqZ/IvmSQSWO9dq9PHk2NF/jEei+iFP3i4alCpNLccVFA6etPPgjcju8/
X-Received: by 2002:a05:6a00:32c5:b0:878:34d7:697c with SMTP id d2e1a72fcca58-8a9bf811624mr14694461b3a.42.1793832161677;
        Wed, 04 Nov 2026 14:42:41 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b1209b473dsm1079338b3a.36.2026.11.04.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:42:39 -0800 (PST)
Date: Wed, 4 Nov 2026 22:42:35 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auu02-iDbVaEL-4v@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
 <auuJM8c-bE43NP54@google.com>
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
In-Reply-To: <auuJM8c-bE43NP54@google.com>

On 2026-11-04 02:37 PM, Pasha Tatashin wrote:
> On 11-04 17:59, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Umm, no way I am reading all this...
> > 
> > LLMs are great at generating tests, and I'm not saying there is no value
> > in this. It is just that this massive code dump is unreviewable by
> > humans. It is also unfair to the human reviewer because it took many
> > orders of magnitude less effort to _write_ them with an LLM.
> > 
> > What do you all reckon we should do about this? Trust the LLM to get the
> > testing right? Do we give up human maintenance of tests entirely? Do we
> > do fault injection to test the tests themselves?
> > 
> > Or do we make the tests smaller and more human reviewable?
> 
> We need good test coverage, but I believe we can break this patch down 
> into smaller changes where tested features are incrementally added.

Agreed that it needs to be easier to review, but I'd like to keep the
coverage. Here's what I have in mind for v4:

 - Move the preserve-side checks that don't need a kexec into
   liveupdate.c, like Pasha suggested in his earlier reply: which files
   can be preserved (permissions, read-only and append-only files), the
   frozen size while preserved, and unpreserve. Those then run with the
   regular kselftests instead of only in vmtest.sh.

 - Split the rest of luo_tmpfs into several smaller commits that add the
   tested features incrementally, e.g. one for the test infrastructure
   and basic retrieve, one for the open() flags and creation checks, and
   one for block accounting. That makes the series longer, but each
   commit is a few hundred lines and can be reviewed on its own.

It will still be long, but I think having the test coverage is worth it.

Does that sound reasonable?
