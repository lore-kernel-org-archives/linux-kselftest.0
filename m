Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7E409613
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197023; cv=none; b=JFn9GLjiAH0wJpH93YzmIfOm2rhfRsKizLZ1wRygdu5LiHk3URghOtE77y35Bee1g5+MJ9Q46q2Kx3cGlCdSFLS27k+qrZ08cfE0d7lPffZJOaJstKOXQBg4o0EKqEm3FAK5BBbt07KSkmKAw3tOtja0bt+cJT04hmR7z4PI57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197023; c=relaxed/simple;
	bh=RNKponLr+7oFI5r2peWA7/613K51+/87gsatuoOMb94=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oESGq39bUgdWmXxbCxyaEeC0Lj3HkHCFecldN2Hvdb1ZcDxuUdeaFRQNOCHPRqMp8dKsF5ulyF/QXC9h498vaWqxx7n+8OmgG7xFA5jf5Ch1QN72b8x6XdlKtYrSo+ULMu+GbsqyHgbe2dmijnN2ADbIP6opPLrVtKg1Tb7t0t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=usZgai1H; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="usZgai1H"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bd68244c455so234359266b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779197020; x=1779801820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8nXtYmq7sgbDVzYqMJ+NbrcF6LTVSVOYs3ODjXCkjmg=;
        b=usZgai1H8n63uc3QNHG2QhVC6o9skYkyZGswhuQzE8Nc1kYPq71dkERMwbe3ICmPaE
         FJr7SFxamlUm2h131hWwJLtTLW31zBSjeuK7pEiNEfIt0LHMnJw2kYS8Yp64Ozo+0Od7
         rR5gf59HfMis+/ur9WpCSYTRDWxSZQCU6JVQefHAglsbQuLkkGYTKFtgq0oGsjSw1XCi
         QakDBTuL7CY9+197r/5IlQ8XxESIiAsAV9sm5gIW2pt+1uklvreC48rLa6KbjxbfihEE
         u1+MmqT9pwa09ent1xuywDH39Tw9VXXxlNPnAhOi35aT2VCFSwPD5uKuDAZZkRnZkZbG
         IHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197020; x=1779801820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nXtYmq7sgbDVzYqMJ+NbrcF6LTVSVOYs3ODjXCkjmg=;
        b=Yez3sfjOSvjquQrUXo/D458lKAcLdIGBzJFaQ+r19EikaU0H9EizXo0O85F7Stl3DJ
         C+3yAOBPU2rZlRcoE3dTFfJFKgg98ytgEJYrcTB3dLyjrGkSUpmMsExMojn4z368miYo
         sAukOdhEYqoe52QS+4jqHuFm3EJhsM8igdt+XZg6JxDKkgF2WBndJaZdQHOQ807qYPD8
         CEOMXc3Dy/D+Hju+1gljDVL+0T01scmO6omSlIHwzLGlLKEXaQQIHs1mXiDnbqmnLr+r
         q8WRBV38WVYXjWKRKOS453dXBOj56Un7nL5xUxcXFXYRutdQRtKzHQHHVZcbSYZVGEzF
         0GOQ==
X-Forwarded-Encrypted: i=1; AFNElJ816MU8LH9pO/FeO1KP0FV8S7dNUFoHbhvg+qmpEcZd4MWqjiEarjPUkWHdkCOFvjUorqye6JLuYO0wGgE1DZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mHl19IAuk0MvWF/GSwOGn5wpyQWH6q7fD7iH3h5//iDrnEBl
	CWnZDewX+NjZJWhXmIGp9Oz6dvWw9dXc4GEuptrEzViwtnjFYioxUIZUT9XZ3ZOKKew1BV3Yye5
	TNvAX28dxAMbTOexFaQ==
X-Received: from ejcqa42.prod.google.com ([2002:a17:907:86aa:b0:bd9:6099:79bd])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:a18d:b0:bd4:a839:9065 with SMTP id a640c23a62f3a-bd517976444mr756668166b.37.1779197019808;
 Tue, 19 May 2026 06:23:39 -0700 (PDT)
Date: Tue, 19 May 2026 13:23:38 +0000
In-Reply-To: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
Message-ID: <9huzse7nfs85.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH RFC 0/5] Test readback from fd on hugetlbfs mount
From: tarunsahu@google.com
To: Ackerley Tng <ackerleytng@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	muchun.song@linux.dev, osalvador@suse.de
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"


If you are planning to port all the libhugetlbfs tests to kselftests
I had similar efforts done in past for LTP here:
https://github.com/linux-test-project/ltp/commits/master/?author=tar-unix

These tests were migrated to LTP from libhugetlbfs.

Just want to make sure if we completely want to itegrate in kselftests
or LTP fulfil that purpose.

OR Only tests that are not part of LTP should be ported to kselftests.

Thanks

Ackerley Tng <ackerleytng@google.com> writes:

> Hi,
>
> I'm thinking of consolidating the tests for libhugetlbfs as kernel
> selftests, and to start that off, I picked the simplest test:
> tests/readback.c
>
> I refactored hugepage-mmap.c to use the kselftest harness, and then used
> FIXTURE_VARIANT from the harness to port in testing readback from an fd on
> a hugetlbfs mount.
>
> This output shows that the original test behavior was retained for the
> memfd part:
>
>   # ./hugepage-mmap
>   TAP version 13
>   1..1
>   # Returned address is 0x7f312f200000
>   # First hex is 0
>   # First hex is 3020100
>   ok 1 Read same data
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>
>   # ./hugepage-mmap
>   TAP version 13
>   1..1
>   # Starting 1 tests from 1 test cases.
>   #  RUN           hugepage_mmap.read_write ...
>   # hugepage-mmap.c:41:read_write:Returned address is 0x7f19f3a00000
>   # hugepage-mmap.c:54:read_write:First hex is 0
>   # hugepage-mmap.c:59:read_write:First hex is 3020100
>   #            OK  hugepage_mmap.read_write
>   ok 1 hugepage_mmap.read_write
>   # PASSED: 1 / 1 tests passed.
>   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> Let me know what you think before I genericize the 2M hugepage size to
> other sizes!
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
> Ackerley Tng (5):
>       mm: selftests: Inline check_bytes() function into caller
>       mm: selftests: Inline {read,write}_bytes functions
>       mm: selftests: Refactor hugepage-mmap to use kselftest harness
>       mm: selftests: Update hugepage-mmap to support hugetlbfs mount
>       mm: selftests: Port readback test logic from libhugetlbfs
>
>  tools/testing/selftests/mm/hugepage-mmap.c | 143 +++++++++++++++++++++--------
>  1 file changed, 105 insertions(+), 38 deletions(-)
> ---
> base-commit: 66edb901bf874d9e0787326ba12d3548b2da8700
> change-id: 20260503-port-hugetlb-selftests-9bc63bde5116
>
> Best regards,
> --
> Ackerley Tng <ackerleytng@google.com>
