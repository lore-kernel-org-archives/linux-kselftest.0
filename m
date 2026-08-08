Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A9392829
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187471; cv=pass; b=ku9T3c32zvjrbuQQ8uJ503NOuryGI/EXNaMwustIDyU1nNZQSsNTkmRMf8JO7+/k/8vSPt+Fo9oRQsLmKrMYg16dfvVYNvFRt6Az3yKCfsZC6VULSFu6MnkPWYusWJtf6xWT69tCIQvXG8ECv6SH5gZSNFmnE3O+FpteOQ7g/2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187471; c=relaxed/simple;
	bh=es5H1bEFfZbRzZp4+L+U+wwgRXzKlTd4uJa2FaBrG9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+A9uUd/USl2oD25jQmQhpJOz6IygGZKazRdxNgRPIFh47PjAugiSJ1z1ykjBXrtnEP0bvC3HXpKvgN2dTxw014ftyxBxFRGDnjPPEoswWNOCRB/03kw6iuIl0PMLJ+q9QT3HRMwPOJh5d+Ku4ngAx6b0U4iAF3UhR3g34k3Ymc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIcCk9yZ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIcCk9yZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so302286a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 04:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786187468; cv=none;
        d=google.com; s=arc-20260327;
        b=A7G2nUDe/UEJxO98A0ozHCyKZZRbe4rR078iUHVZoGVMreH6JNhvK/IDVm2Ozxng21
         lrFmcAV6M+fGlOqu/Wne1GIOA5xVW1FHTWQI8pTSqk0j8tPE99YPILbd4Xq09Db9EJsp
         tku+pcqnlGmkoisdM9YXe5khCcp7cIQTtkwTAvBMM0c0tWSWIgRodCu0w5c0tB+2nOZE
         BUgsF45O0abD4oF49q4OVwr6F88pJ8ieyKOu9J2c9BfoRnNbR7FSIiclOdVS5p8JrS+f
         EiW7sbTZgBfC7Xp3wKjfwhMJxPVoJ4LVDXGNmHkVXy/SB0KmF+wrnSzUqYUtmuqtVi1+
         +R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9NmdFAeTsQg4CtPClUPsiHvGEtBOt9fIz2/ykVtgMMg=;
        fh=s/DYnQSME/ZBqqHgdbJyqU5+TpmZkEcI043NYJVrLm0=;
        b=ZdTT4NDotdNRuevnC7YR95Hu8pPOAuaPKNkeMcriG/5C2LqUylZp9VnbLrDMUoMIgf
         K/cEa1MiPX4GHJEIZyQS0eMDUS4EDZRbMxB8wITt24kg1lkU0uWU/MXN/9IdJIgf3y5x
         Y97gHtQPh4qBtWaPiG3GvrvLs/J+8Iw+x9riaKP9A7623LEueYRQfMW2u9bLwifj7s1S
         4abzvsKYGEI11gAKi6+CkTnOUbEeGu5/fyd/oRC9cXnKV5N4ne60MREAdb5h0KPqoOs0
         WFaj+c2BCv9gKHRyiPFUXlhpZ0IKGJqnLZoFQ8Xzf3kKpa9qhv6842ymsmDBlDmfcK1n
         nBaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187468; x=1786792268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9NmdFAeTsQg4CtPClUPsiHvGEtBOt9fIz2/ykVtgMMg=;
        b=rIcCk9yZmjAANef812JSuA0BFQK9YTq+Xnk3t+sls9iiNmj/JANGMnk2FMktMM0smy
         +7vzq6jTw1jrlC+yWZ/dz8xEyeCgDkjKJJ0iyg6sryilsBthbmoliTvphZPnf3yZT2J7
         w/SBIssg1PJR2Pms2lJKp3DLMYE36adGNWTVnO8D5vhJ8N9oub62tiTpsWG/J9DYVGV4
         PBFJXoNb+k7tl3FsO13jN+TOPKGjNGfp6mfQWJM4g25kk5AJdbnRRgOVTAE5XVUjvh3T
         vaWwTswbATNUzahAHw9E8miEinXOpvkp0wKyx520JbxktlSX4ncIJg7c8y4P5IRFgNCD
         4ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187468; x=1786792268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NmdFAeTsQg4CtPClUPsiHvGEtBOt9fIz2/ykVtgMMg=;
        b=MGt/YTWg5QIw6EymPFrYkW7Z3hTQb6zjf6RNjNBEedwcBAOiWD++sN6vfFieoEWFHt
         tUsE+tJIZ4RIVsBrNACcv7AOaUFsMm3fWjQ6vnNvJ2NorQwY4w0M0Kw8a8A1k2yIav7A
         gEkxsQhcNTi69SpGDre5lsPG36ejun84uZs7j/FBKpA9g6xplsUN+3k68lWHb3AxVyXW
         8aUbzbml0+XG7c5FpqAahQ4czX7fNZhSEIkG+lqX3z1JPoQfrDOUQ8UmCetMN3N0s1Za
         TTyG5GAdttZLGEf9hKdbD4/Ky3jkEQdDeFC98GRZAkpXAiG/FWB4Xn43RC7LkXygr3+t
         OpIg==
X-Forwarded-Encrypted: i=1; AHgh+RrT7gZ4UdkRyAm18B2UH69QvPUH+V3mTbqQbtnzdubmZUTK0DehesTnOWYBDzVKvTrAUjVFhVOLhxnInic0eYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+zO/fV29v3zgHOgQurhUjIPD1Hn4lZCE4Gk6/HMRDn46yvV6
	dlBAhG40W2b4+fA5yI3KMeKKwIDBpRF8R34qz9CKah/f8cOsJa6zjKyNhpzfUlt1YUH9/x9enfg
	uX3uVHm/U69WrSjK3A0/ZIyPtzViFBls=
X-Gm-Gg: AR+sD10kru/PKGg44gjucDhBT73Sqt12n2m/djVv2tmf3lXQOOfFKeQI7uBv/JTaZSS
	DH8aXdm1eaLLi+vd+TMU2h+He/U0ttO48qoTEeHNJ7CuI8HwEURbEyXiRtTpKH/c9AkMjO2wQda
	crRQSk/x7ed95gBTukrZ1n08EXXDlL2QYXMS1dpzy/LDOdeexDKYt5WJEVy6V58a0KfI3AtvqZ7
	UDVv/beRApNG6HP1Wgb1kk/ST5Dw1Sxx2lBJQz5Xi5oYTgdE/fJyXV+w2Qo3Htth1kGVTTZafBo
	rQYV7DoBLrNYNk7OwwwmLrP9KoB9i6d8Vhr3HtVr/UXTtxyazpga3x7jRGGFHL3IxVHK2C2rLuy
	Qhg==
X-Received: by 2002:a17:907:6b07:b0:c1c:5aa1:de57 with SMTP id
 a640c23a62f3a-c2039b7e997mr1550154966b.13.1786187467198; Sat, 08 Aug 2026
 04:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in> <20260805-b4-mappingless-swapcache-v1-2-b1d78ba257ca@zohomail.in>
In-Reply-To: <20260805-b4-mappingless-swapcache-v1-2-b1d78ba257ca@zohomail.in>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 8 Aug 2026 19:10:30 +0800
X-Gm-Features: AUfX_myclkXQm0J9pgU-SRUEwwOPsam-5qTNU3TDb54eeVu4YhzblVp-LJ_uYWA
Message-ID: <CAMgjq7BW_n3HpM=mCGn=q90=4+oXcBLWwZewxvEcwqfzjuewOw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm: add KUnit coverage for mappingless swapcache folios
To: shivamkalra98@zohomail.in
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Nico Pache <nico.pache@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:24=E2=80=AFPM Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> wrote:
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> Add focused coverage for the folio_check_splittable() eligibility checks.
> Verify that an ordinary mappingless folio is rejected, a mappingless
> swapcache folio is accepted, and unsupported target orders and split type=
s
> remain rejected.
>
> Build the test only when KUnit is built in because
> folio_check_splittable() is intentionally not exported.
>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

Hello, thanks for the patch. A few concerns on this...

> ---
>  mm/Kconfig                   | 14 ++++++++++++
>  mm/Makefile                  |  1 +
>  mm/tests/folio_split_kunit.c | 52 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 67 insertions(+)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 331daf7fcfab..164dc1438900 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1503,6 +1503,20 @@ config LAZY_MMU_MODE_KUNIT_TEST
>
>           If unsure, say N.
>
> +config FOLIO_SPLIT_KUNIT_TEST
> +       bool "KUnit tests for folio splitting" if !KUNIT_ALL_TESTS
> +       depends on KUNIT=3Dy
> +       depends on TRANSPARENT_HUGEPAGE
> +       depends on SWAP

Just BTW, we already have a tools/testing/selftests/mm/split_huge_page_test=
.c.

> +       help
> +         Enable this option to test folio split eligibility checks. The =
tests
> +         verify support for mappingless folios in the swap cache and ens=
ure

FOLIO_SPLIT_KUNIT_TEST seems a generic test and not limited to SWAP,
but it relys on SWAP, looks a bit strange to me.

...

> +static void folio_check_splittable_mappingless_swapcache(struct kunit *t=
est)
> +{
> +       struct folio *folio;
> +       int ret;
> +
> +       folio =3D folio_alloc(GFP_KERNEL, 2);
> +       KUNIT_ASSERT_NOT_NULL(test, folio);
> +       folio_lock(folio);
> +
> +       KUNIT_EXPECT_PTR_EQ(test, folio->mapping, NULL);
> +       ret =3D folio_check_splittable(folio, 0, SPLIT_TYPE_UNIFORM);
> +       KUNIT_EXPECT_EQ(test, ret, -EBUSY);
> +
> +       /* Only the eligibility check is exercised here. */
> +       folio_set_swapbacked(folio);
> +       folio_set_swapcache(folio);

Faking a swapcache with folio->swap =3D=3D 0 looks hacky, could go very
wrong if you do any actual work on it.

> +
> +       ret =3D folio_check_splittable(folio, 0, SPLIT_TYPE_UNIFORM);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +       ret =3D folio_check_splittable(folio, 1, SPLIT_TYPE_UNIFORM);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +       ret =3D folio_check_splittable(folio, 0, SPLIT_TYPE_NON_UNIFORM);
> +       KUNIT_EXPECT_EQ(test, ret, -EINVAL);

Hmm... you are just testing the gating, not the actual split, that
makes the test not very meaningful I think. And we should not block
non-uniform or high order split for swap cache after sorting things
out, then this test will be doing nothing :)
