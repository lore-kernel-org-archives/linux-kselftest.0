Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659636;
	b=QNt3bZgiYPkM1kmFjlaQdOQyMrfBjLjc4tsGrpjtfYxGSQ2rs1APiuvxA2JpMB0PFXdq
	 WhT1IWVs3r56nSNNQ1ZP22RhSYD90+i1aIga68TI0s8BzoC2cdHeO2e7YnRPqM1HN/C88
	 551cs0sgeaualhp5PdtmfdbxMbXSVX8gIb0TkKkeUCVB0mqy9VR0ezK+lrj5NDWO+6aOd
	 36SMmFvL25PbcvKJaiHylxfZvVEiwl1kNJEKt+aeAGKpcg039rymGtKyXuqlpobZ274Yi
	 c+EDBTUp6wkrHgjPQvjkmMSwvvvEx96BNxDeAHUXsLAw+ZCTLWMUoCf2xa+pTdH4G1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659636;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hhnYenLPchaIZ6Yph4cMhkOetysqy2rVFXLn4BDMBPk=;
	b=WusITR2qhDBi7hn4KdjRJwQ4QfYv+6KaUlWNSr4chzeBynqHrzpQfixNle0QqaW7UOaW
	 tzIPYjLxKEHmkspwmC33nqjXRY5AIS2dkOk0IrfFle0BQzzaZShCANLqP/Ny3evvEgQ2b
	 G+DmDjKtoVgKy6C1GZUVSEcdlEXntnld3wZVb2sjRTo7cSG0/spr7lgv8zjgku/Ktl5r5
	 oAJUDh5+43LMRpI+/at8Yorvi92v4daOFNbWUm61BoeaFsBAX8zjOtz9nCAIeoAH/RfK2
	 hKllCx8EcoSn1c1/BzWWGXt2ulGJ7m3DLHQzcVL5UDm0BrRiSmrZEhB7plbFUAY9Y5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=MRV2sBPE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B3606A326;
	Mon,  2 Nov 2026 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=MRV2sBPE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228DD1F00A17;
	Mon,  2 Nov 2026 22:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793659635;
	bh=hhnYenLPchaIZ6Yph4cMhkOetysqy2rVFXLn4BDMBPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MRV2sBPEspQQWDNjJ99bHpS62MisyPj7BJnLOAeDJ3P42iiVnwGuP4BT+RZ6z6oRC
	 q5mMLS4KFoYYgVug0Dc4v2IupABuRcM8KOkoxwciuMw2PtTi0L6aYUvhUklXVoKoqG
	 CDgO8mlCnVjm/hp6jQQ2gRFtN9VCr4VYjW8Hf+lA=
Date: Mon, 2 Nov 2026 14:47:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.com>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 0/2] mm/userfaultfd: recheck WP registration in the
 hugetlb UFFDIO_COPY retry
Message-Id: <20261102144714.5a6fc7817b11a5d9add8a5cc@linux-foundation.org>
In-Reply-To: <20261102081140.201987-1-azpijr@gmail.com>
References: <20261102081140.201987-1-azpijr@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  2 Nov 2026 09:11:29 +0100 "Jose A. Perez de Azpillaga" <azpijr@gmail.com> wrote:

> The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
> that are no longer registered for them, and asked for follow-ups that
> remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
> that has to fault in its source page doesn't recheck the WP registration
> before retrying, so re-registering the range without WP in that window
> leaves a uffd-wp PTE behind.
> 
> Patch 1 adds the missing check. Patch 2 adds a uffd-unit-tests case for
> it, which fails on hugetlb without patch 1.
> 
> The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
> with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
> VMA before waking waiters when unregistering" [3].

Thanks.

Sashiko isn't entirely happy:
	https://sashiko.dev/#/patchset/20261102081140.201987-1-azpijr@gmail.com

Also, for those who believe uffd is now defect free:

: Separately, mwriteprotect_range() checks the WP flag but not which
: userfaultfd owns the VMA. With two userfaultfds in one mm, unprotecting
: B's range through A can clear B's WP but wake A's queues, leaving B's
: writer asleep. mrwprotect_range() has the same ownership-check omission.
: This is older and deserves a separate fix.
