Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843238E5D6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770074993; cv=pass; b=pW3XsuBlwWWnHkL7DNooZbrLTbyxy/4Iqn4b+BeTHuVzhlSBXHBKFCpPkpSvArNeXvFUC3sDaQiv0Kzc7FNzZUvz7xjgqz3eyK7CJoooUf0L4jZpI5MbMpYMpOzEt/H4GrDvIJqNEacKGxltR44GdWqvHJfRLaTcZHdnTUxhAp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770074993; c=relaxed/simple;
	bh=9xU1ELIOPsspxRS0xVlva7nIQQ424SgRs/Lk+thb9jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsTySs8rvlz4GQrQPDZ5QciHkfJB4OXXCoHYOb7SiPP+VQFO1Osg2kbfy3XsGWnh423ReRAAPDySMY7iwFG36glfLZbl5SG62IvezRZ7Krpr6OqfNkfbZAQGjz1oGTGuf61XqY86mqRbhMMYHJATWh62BfuJEhryg1BBDMg5rQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xw9aWkla; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xw9aWkla"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so37960131fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 15:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770074990; cv=none;
        d=google.com; s=arc-20240605;
        b=icR5DzZbRtpCPVaM/D+gTuBd3fHiAoc6rq6XJcIBJCnTFnXcusgodXXP1DmVcFj7nj
         WNdB88tW0buLkEarMWvjT0RoSPHJ2o1dcr3PeGe7kIgCWqswlzODCdGLk/zn4VvNqKEn
         daF2ttyDmgVxY6forF958WRFI9N9VH6n5FNTtk7+DrIR5YfK4x3w/1dhuvzejc9n/Uge
         ELU0yryzGxd87Oy1PTegiFpPPpww5/XcObA1aRpST8UoBgDS05X61tevOEhv0qk+nndp
         K0GwD8JRCCf46D2jgcM64ap3k4MHdtOKKq6yyaZe943TaKloECM3Ns9PuNQYPg2aI450
         fl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xyS4gwVx0BMn3Qhvfk8Yq9Cz8TK3HsqiXevlJlXLDpE=;
        fh=FxA2E/tQWScOLxo/m4wLWXHCX+L4wtQsv4Cq/ezKyqI=;
        b=COXTRqfq4zrLJKdWPwDa+gqWpeD+3NYrOSzKV5F80xnYIuNr7Su5WHk75EZgxcgzE2
         YCgoS2lgx8OO2H7Ei4uWk1lsUb3EiykFg//jHgjD8n6SLqYT4dct9wkF54ggjc8cULnk
         DBFOajkOpmAqBDLn2L29+Pb+BrKwr6W/qoPm47hXNp71sNbMqgy9g7ZQI9Vi8FuJSOnx
         Eq3gQLFooZU6FqHvlN9BGcGnnHZBXWqT/jaWXEIwBr2iuiki9lCVFquhd7iFQ3Pm07We
         A7b/W51OOs8MmchFQE3fXnTeg4DxqNnzB3DH3wV0BNIlCtaOrutfshCFQO4kQukY/5tb
         v8vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770074990; x=1770679790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyS4gwVx0BMn3Qhvfk8Yq9Cz8TK3HsqiXevlJlXLDpE=;
        b=Xw9aWklaRp8xbMQxMaZ0KEbStqFxqWtYgVdP4zuzT1y1gcNPiKVNXvGxlsfR8QGQKC
         oI8IBNozxfX1tvUDZuTvBJstzIHD/7N9ag+bJI96fhNJJmz2q9tK5Qke8AZw7DlOZI5f
         7NicmcCaXiT3UODZJ8KXX3NqX7eZzj0lbGjtJK/7j+SzkS9jrN7OmUN5e0IG7KLBdZru
         /ldrH6gv9KOXAII9kAx0CkGUTUkFbgp9Wh+N+E+oTMm54Ex02SFTDyKkfilMRRHJWiwX
         gpMh72ndkwRzN6VT8/C/VwBN/R41t0eLDCqlkf4/cnNrpaHEVe8GiEZtc20R4Q47a42+
         Cqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770074990; x=1770679790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xyS4gwVx0BMn3Qhvfk8Yq9Cz8TK3HsqiXevlJlXLDpE=;
        b=Wg/wMr/sIhzcBhHJixpasqAiOIvPS8G4C4fpbiUVWV5pTN5Gpkn2mrmNidsJ3zKs57
         ss0kFC26HraXaaBNpJmUEEUcR3OaeD8dpG99jCU3/WANOCpjhuv4mqrCPJwK85ICA3Ev
         1fqC/DFs/XTSuUKFRKFFpND/V26jBpD38cHJTe7ZMKciu6iY7jjOFzJDukL8CrHd23fx
         pKeOhA82i8qjgr79TVnDBSa64/odJz1fFioOoJeNKm6EaOMYMH4LuhMcK86MJCHYxau7
         aXzAp08CfK02xT/lhwsxvYmMq8/OkG7zknFEKy3m4v9w7l0pQk7Umom9jfOf2pP3hPt+
         X9tg==
X-Forwarded-Encrypted: i=1; AJvYcCUTF1fVtM4yS9mFVhvjO4A+8cYyXu/RMq7ODsxVnXCcFcWcKdsfrVtM126UuNJ9SC1nX6bPhjl9rWeFTdyDdUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhu6iMZoB11+0z/JpqG/nlTVSgYbpNeBG/NKxXd+Tm+2jBN7rU
	A2WBNsAPZ36bVhcZCE6y3cBYN0Kwp+Fag++GB4GGAXceaqqoggnOe0cwJkLLEcdr3/2BjLf8woP
	X0YmSeCtlZQc3gXqMAHa9DmbiwbNCX0j3N9rLj/+t
X-Gm-Gg: AZuq6aL1TDGsMl8QQ+r2RLhGsX2EoiWrmDmLfg7Iy6SKwzn2bPoZIRRs+dTdrjq3EAy
	dYu8cp1iLYOtbclJTef4FMGsSD+vYTl6QB9uSsKDxZzcjZ0TaB4RyNE4oT1SmikCyo++eYolnN5
	rPX4ZSx19aIIvB8j/OSPzMrsgdm5M1hekL6U7aBG0Joemzvkvb765HNtwMyZkgsK7D0VcdL9Q1J
	7Sy25xVdTLZ0y/x0ZMD/GkPmA4i+/aBn7Aw33IYkbjhsAcrVhZPEHj/iSEE2ijDLMm7OGpz1yNT
	iNmz
X-Received: by 2002:a2e:bc82:0:b0:37b:9b58:dd0e with SMTP id
 38308e7fff4ca-38646558980mr44483011fa.10.1770074989357; Mon, 02 Feb 2026
 15:29:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-vfio-selftest-only-64bit-v1-1-d89ac0944c01@fb.com> <20260202144618.32bde071@shazbot.org>
In-Reply-To: <20260202144618.32bde071@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 2 Feb 2026 15:29:21 -0800
X-Gm-Features: AZwV_QhScOtwfjmTMtLq8iYIDxDbkhhsR0KMkhQVUu2jAUHPbaRWrFkGYxFoz1Q
Message-ID: <CALzav=fYNmy48T0qWOujvaM93iEUyO2PuG5FCeG4WnjkEDaj0w@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: only build tests on arm64 and x86_64
To: Alex Williamson <alex@shazbot.org>
Cc: Ted Logan <tedlogan@fb.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 1:46=E2=80=AFPM Alex Williamson <alex@shazbot.org> w=
rote:
>
> On Fri, 30 Jan 2026 16:02:16 -0800
> Ted Logan <tedlogan@fb.com> wrote:
>
> > Only build vfio self-tests on arm64 and x86_64; these are the only
> > architectures where the vfio self-tests are run. Addresses compiler
> > warnings for format and conversions on i386.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lkp=
@intel.com/
> > Signed-off-by: Ted Logan <tedlogan@fb.com>
> > ---
> > Do not build vfio self-tests for 32-bit architectures, where they're
> > untested and unmaintained. Only build these tests for arm64 and x86_64,
> > where they're regularly tested.
> >
> > Compiler warning fixed by patch:
> >
> >    In file included from tools/testing/selftests/vfio/lib/include/libvf=
io.h:6:
> >    tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:49:2: warni=
ng: format specifies type 'unsigned long' but the argument has type 'u64' (=
aka 'unsigned long long') [-Wformat]
> >       49 |         VFIO_ASSERT_EQ(__iommu_unmap(iommu, region, NULL), 0=
);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> >    tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: not=
e: expanded from macro 'VFIO_ASSERT_EQ'
> >       32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, =
=3D=3D, ##__VA_ARGS__)
> >          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
> >    tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: not=
e: expanded from macro 'VFIO_ASSERT_OP'
> >       26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",       =
                    \
> >          |                                              ~~~~
> >       27 |                         (u64)__lhs, #_op, (u64)__rhs);      =
                    \
> >          |                                           ^~~~~~~~~~
> > ---
> >  tools/testing/selftests/vfio/Makefile | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/self=
tests/vfio/Makefile
> > index ead27892ab65..eeb63ea2b4da 100644
> > --- a/tools/testing/selftests/vfio/Makefile
> > +++ b/tools/testing/selftests/vfio/Makefile
> > @@ -1,3 +1,10 @@
> > +ARCH ?=3D $(shell uname -m 2>/dev/null || echo not)
> > +
> > +ifeq (,$(filter $(ARCH),arm64 x86_64))
> > +nothing:
> > +.PHONY: all clean run_tests install
> > +.SILENT:
> > +else
> >  CFLAGS =3D $(KHDR_INCLUDES)
> >  TEST_GEN_PROGS +=3D vfio_dma_mapping_test
> >  TEST_GEN_PROGS +=3D vfio_dma_mapping_mmio_test
> > @@ -28,3 +35,4 @@ TEST_DEP_FILES =3D $(patsubst %.o, %.d, $(TEST_GEN_PR=
OGS_O) $(LIBVFIO_O))
> >  -include $(TEST_DEP_FILES)
> >
> >  EXTRA_CLEAN +=3D $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
> > +endif
>
> I see other Makefiles include tools/scripts/Makefile.arch which would
> then just let us test for 'ifeq (${IS_64_BIT}, 1)'.  Would that more
> directly address what we're trying to solve here?  Thanks,

I gave this a try but it seems like it results in a tricky situation.
We must include tools/testing/selftests/lib.mk before
tools/scripts/Makefile.arch so that $(CC) and $(CFLAGS) is set
correctly. But TEST_GEN_* variables have to be defined before the
include of tools/testing/selftests/lib.mk, which is what Ted is trying
to avoid :(.
