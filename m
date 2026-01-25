Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116C215055
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769313843; cv=none; b=eKcR+d49V8Hu32sfJCL8ECPdrW92zm3hzLdH6Jkl0r9zw4XKjJgSjEjZsuJnN62FvK5K/Z84q+AlP8nnQealPrcx/B2VudUlFxcabnk155abWN8ucF451ymv4AF67Rqyr7PP58kbvWZDotgouzcC9M6XMY/w3pxv3815i3WuKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769313843; c=relaxed/simple;
	bh=1QP1PVbgfgapGdfxYG9jR9OdjDGN0laLbzVlm9bi+/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lrnHzHE+9xNH1kAXxjjkS0xIAuMV/3eMLRQpa5YxvCgacnKJl2pLIxw/CEi/CPMZoDjsltwuARI+t6o5sdpLmukrkI+OM091MY4rewdfgFbv5ixoy5S85ixeTKe70VECr3e7EqjVmbXKF5k6xoN79GfraSRrGLFoXT+YPflqkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaocTzgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaocTzgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5FCC2BC87
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769313842;
	bh=1QP1PVbgfgapGdfxYG9jR9OdjDGN0laLbzVlm9bi+/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XaocTzgqc0Es3j4/8T8G4uoAUd1mHKH8AtIbtaR4alhCqdNxI2igRM7p74pjxp9Zw
	 EbUuK8JheqrMq2x4ij0eRY/zLBKSaT1YhUqAYJc2/BgeVhsg1DjDUzseAe7n4vnIth
	 z/2zsYwWVwmv+J469OSN6ycJFOAxYUGOduEKh/tNSBz5fl9nDuUmlOQjaSVCpQFlvC
	 I84Ws91PfAh9Xd0qhFxUCaI6Xmh1He4hA0nVseGgoY0TqFkc520zg+x6bi1Ndr0L0g
	 MJOhp0QhEXmv9pfq2vAiH2j9uZP9ZfVCiV/qw8Giep843cZzl/3qK/yeHG1FdKT4j7
	 E6Kf0m/KYw9lQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8871718b00so259115866b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 20:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvQj20ZYIcrRoeOSjs/i3HqedbZAZqNpc0CquBFo9FK/74zZKbHNBzIhowq1yY2EZ+95Ee349UHzsj3e3Biqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUJQ1zAJEwc+IFR90RPhQlx1Wst+uWA1Ii4cSvJONGqOvqsIo
	oQICb+IOYkrlj2gG8BJZnzsc/vi3fYYW0QDIycPnH1oZWO7Xa1xixr/CQywx+hBSBp3OlWJhH9l
	ePRRDU+stevqWgQSz85cXHekvSd4Wm0A=
X-Received: by 2002:a17:906:f58c:b0:b88:60d2:11a2 with SMTP id
 a640c23a62f3a-b8d3fbba376mr29407566b.34.1769313841185; Sat, 24 Jan 2026
 20:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109051054.188030-1-fearyncess@aosc.io>
In-Reply-To: <20260109051054.188030-1-fearyncess@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:03:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Yk5OWWeH7p=h3JdtJHr6GFoq6wAfCHUbj_R0eoLre=Q@mail.gmail.com>
X-Gm-Features: AZwV_QjI7_MypoP-cFKhVGgow4YwRF06xAdcJWacmzKDSMsegChV4xgnK6Efe80
Message-ID: <CAAhV-H7Yk5OWWeH7p=h3JdtJHr6GFoq6wAfCHUbj_R0eoLre=Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
To: Lain Fearyncess Yang <fearyncess@aosc.io>
Cc: WANG Xuerui <kernel@xen0n.name>, Kexy Biscuit <kexybiscuit@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jan 9, 2026 at 1:11=E2=80=AFPM Lain Fearyncess Yang <fearyncess@aos=
c.io> wrote:
>
> From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>
>
> LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
> memfd_secret system call, which depends on it.
>
> Signed-off-by: Lain "Fearyncess" Yang <fearyncess@aosc.io>
> ---
>  arch/loongarch/include/asm/unistd.h     | 1 +
>  arch/loongarch/kernel/Makefile.syscalls | 6 +++---
>  tools/testing/selftests/mm/Makefile     | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include=
/asm/unistd.h
> index e2c0f3d86c7bd..e7649c1582482 100644
> --- a/arch/loongarch/include/asm/unistd.h
> +++ b/arch/loongarch/include/asm/unistd.h
> @@ -10,5 +10,6 @@
>
>  #define __ARCH_WANT_NEW_STAT
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_MEMFD_SECRET
>
>  #define NR_syscalls (__NR_syscalls)
> diff --git a/arch/loongarch/kernel/Makefile.syscalls b/arch/loongarch/ker=
nel/Makefile.syscalls
> index cd46c2b69c7fd..6360381baf931 100644
> --- a/arch/loongarch/kernel/Makefile.syscalls
> +++ b/arch/loongarch/kernel/Makefile.syscalls
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -# No special ABIs on loongarch so far
> -syscall_abis_32 +=3D
> -syscall_abis_64 +=3D
> +# Add memfd_secret explictly for la64 and la32
> +syscall_abis_32 +=3D memfd_secret
> +syscall_abis_64 +=3D memfd_secret
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftest=
s/mm/Makefile
> index eaf9312097f7b..79582438efc4d 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -72,7 +72,7 @@ TEST_GEN_FILES +=3D madv_populate
>  TEST_GEN_FILES +=3D map_fixed_noreplace
>  TEST_GEN_FILES +=3D map_hugetlb
>  TEST_GEN_FILES +=3D map_populate
> -ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64))
> +ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loon=
garch64))
>  TEST_GEN_FILES +=3D memfd_secret
>  endif
>  TEST_GEN_FILES +=3D migration
> --
> 2.52.0
>
