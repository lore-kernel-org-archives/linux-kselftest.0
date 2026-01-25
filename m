Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327713C918;
	Sun, 25 Jan 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769335153; cv=none; b=eGrMGfImjH9KHgsv9aujvUXefmEv91aGXQXDHSQWC4DNRh4nQQKNrvMCXghL57dTHdl4QZFObHYfmTgvTALrtkty46ssPKNKBuYG6fa9SP/8pEyMkQCQwFRx1pD9mxR1yiDqym/+9YGvTJNaExXOg0KKO5TApKaDWQv5k2dq36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769335153; c=relaxed/simple;
	bh=t90pzN2k6Whbca/34ndSIUtQ6ODauPo1RiRNlXzDNBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8Z6/tCTY/wSfEggKefyVYtm2V4CsQMqpaS/MsDMHMaJh1kqGeGhgqhCk4kLBZGAJ4EG8F1SjBn+Ui5f0GdPgOMu5I0Q1OQblPbNvf2Oy7ba2opNnqgh9EY3V+SfCMxpEA6wSnL5R6jw6z2gICfAGYwhopj+mYA8SG9erNTVSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXW3ae0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXW3ae0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4929EC4CEF1;
	Sun, 25 Jan 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769335152;
	bh=t90pzN2k6Whbca/34ndSIUtQ6ODauPo1RiRNlXzDNBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXW3ae0YU8z55SpbxpHPpo8QS9OjGqTcHsbiii51ODHCMOf6hliMbhrjJWn+728Be
	 TgZj79d5jvu5iItz6H9z2pmlrAqZUWh5ktcnp/oBBLBErOg264g+S0l93REVWuqUc7
	 9f1SvxnhTk/H3zWkQkzLti8BWy0U2XDnGrip1KUUg+j/NWfT1ToyfG8YMEEV0sxDWC
	 KglKM8yIWZ/13LlIhLbEqUClho2mOfcPaccYreX2EQEnOjI+jvuATB8GxADABVYNyK
	 Jh2oups9hDCMfNMF3wtxjcp2b1X8NBJWd29wiq4EXkdQUSJ2jgLnBg87nxA121pjwM
	 f05aOgFlDDr5w==
Date: Sun, 25 Jan 2026 11:58:58 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Lain Fearyncess Yang <fearyncess@aosc.io>,
	WANG Xuerui <kernel@xen0n.name>, Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
Message-ID: <aXXpYqDyTeftKV2c@kernel.org>
References: <20260109051054.188030-1-fearyncess@aosc.io>
 <aWC6bIEg6UqvX1DO@kernel.org>
 <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>

On Sun, Jan 25, 2026 at 12:03:25PM +0800, Huacai Chen wrote:
> On Fri, Jan 9, 2026 at 4:21 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Fri, Jan 09, 2026 at 01:10:51PM +0800, Lain Fearyncess Yang wrote:
> > > From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>
> > >
> > > LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
> > > memfd_secret system call, which depends on it.
> >
> > LoongArch version of set_memory* does not support splitting of leaf PMD
> > entries. Does LoongArch always use PTE-level mappings in the direct map?
> No PMD level mappings now.

Thanks for the clarification. You can add

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

if it's not too late :)

> Huacai

-- 
Sincerely yours,
Mike.
