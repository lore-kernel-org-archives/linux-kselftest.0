Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF7B72612
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 04:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769313811; cv=none; b=GZ+HTbsb8UzFFtWyafzjdO1TdpuEeGmxgzZseppKNf1jiI5W0l/XgCp0kwOiK/M4bPrrHn9QOYKwjgrgT0hZODDEqOUzmVWBcpLLp6OwBTisCrTUAcyTsz6H5D2tl+3tngbAg+I3bQ0Gg/Lk/iqDrIe3msfGvEZEzjiBuAwZGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769313811; c=relaxed/simple;
	bh=TQaDh7lsKY8tFsjMYD7BTGjXonEHzONpf6q4U3MFS74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXClGBc2TVnEXu1fxwFmVbFmrx7QYxpMe57G/QB1HFITm7fpALsfx1jnouCkKTIGH83QehcbvbMf0oaE7s5cJMUj3W3fe5UhpEvIZQjcAfzYE765kUnCMf2kL3QkPpg9e//hE5lOLZlYq1CqgZO8nKX3a1ouf46IYJhYQCCVF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJslFK39; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJslFK39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A05C2BCC6
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769313810;
	bh=TQaDh7lsKY8tFsjMYD7BTGjXonEHzONpf6q4U3MFS74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OJslFK39224RKhla6bB5iSfRIwZLSwK0zH/qXmWbtyo7Rwl2geQRVpyApYumbBS6h
	 sjhFr3mnhaoAmtdJHFax59GRvvrchLOL5zShuJryRKCL7ySkkObMDssmrKVgXJ0myG
	 9+KPTkbQ+zbVxLp6U1PgZ4cIlPbpwYskoj24pHd0BCmt+XFOCGK4zvewGliNDbYFks
	 sRbjZITxoIwueQUFws89pfQSLNAOzlD1hFTDp2qOUxBfy/3/15PDeqQUPdqVY6xM1G
	 rqZFUV4MyTyaDUC9aaqickqMdGQrSNN7a8oRGSKbNsHFXNjkhd1URPdcrbjIDYYNsL
	 ivsA9SUzUuKCw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b88455e6663so504205066b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 20:03:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLhPlmwI74K5ISv5uHigCBzfCM+6Tm9RCWpILUyGg5CEbFYHIph8bB74LdLeyJzEh5aRbsv0Ae8OdkHp6nbuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrqq/AGTsTxwoVhMS84bCDQfbX+aJnE8qtPQM0qhq3zJ2n29VI
	vydex/NhOciPe30J4dzHsOr3bSaYT7EcUsWzqs0M08lfBKEIm6CmrEqrmOHbbeLv6PgRzBj9fYG
	2xWeLZncgtRWAirj03r482Q64tna7IrM=
X-Received: by 2002:a17:907:2d09:b0:b73:6f8c:6127 with SMTP id
 a640c23a62f3a-b8d3fa14150mr40755666b.12.1769313809089; Sat, 24 Jan 2026
 20:03:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109051054.188030-1-fearyncess@aosc.io> <aWC6bIEg6UqvX1DO@kernel.org>
In-Reply-To: <aWC6bIEg6UqvX1DO@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:03:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
X-Gm-Features: AZwV_QgZtJU-wwFoOJ5ofNX243-l4sQGf8pk1EIiYklzuhdRgtqAyAoGEoSGyHo
Message-ID: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
To: Mike Rapoport <rppt@kernel.org>
Cc: Lain Fearyncess Yang <fearyncess@aosc.io>, WANG Xuerui <kernel@xen0n.name>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 4:21=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Fri, Jan 09, 2026 at 01:10:51PM +0800, Lain Fearyncess Yang wrote:
> > From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>
> >
> > LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
> > memfd_secret system call, which depends on it.
>
> LoongArch version of set_memory* does not support splitting of leaf PMD
> entries. Does LoongArch always use PTE-level mappings in the direct map?
No PMD level mappings now.

Huacai
>
> > Signed-off-by: Lain "Fearyncess" Yang <fearyncess@aosc.io>
> > ---
> >  arch/loongarch/include/asm/unistd.h     | 1 +
> >  arch/loongarch/kernel/Makefile.syscalls | 6 +++---
> >  tools/testing/selftests/mm/Makefile     | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
>
> --
> Sincerely yours,
> Mike.
