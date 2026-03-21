Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044BE2E63C;
	Sat, 21 Mar 2026 00:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054104; cv=none; b=NsCRhveoALF89SOnGhhRliLc0TsdY7gftzEk3yzb4PXYxoLrN+4UwqPq6t7eXy4CF21Vgxh+CGAd7AF3seXAelxS3G6rtxdE3P9V/4McUYDaSV+lIV5x9ohLV0oTdO8gE1hSRUPqmZHlzw/GHHRfWned2P8P+LCjxiRYChFS7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054104; c=relaxed/simple;
	bh=lyiNmQ1nmfSsERwQpaon3tU6nzQcQ+tqsZc3Ole8Wvk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jhrzHtjb9liG36aL7tvG1nPZGE5mZshLYCX09A4ssr+BQLq/MwM/xO6dPdRDJMJw0/sf74rQjuC9FKOxC9o7BgoDpv+l/7efFWyTMoL3kdwtwLt9DYDH9MApSYUVU4tVYYgMwcZAkwZEKqV3dZ8z8D6WyLSOZ6sHk2TNVtCbp78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WeFA9TXe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WeFA9TXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA342C4CEF7;
	Sat, 21 Mar 2026 00:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054103;
	bh=lyiNmQ1nmfSsERwQpaon3tU6nzQcQ+tqsZc3Ole8Wvk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WeFA9TXeJTyvLwYeqoaThnp8I77vttkpGEH6ts5AJeNgvlV6zPnXa1BDO9CiexMIP
	 I9Tfn/8ydYamt9bTxsHhryErTUk+NP9PlduQoWGwaO5e5Ghzg2IZy7GA5A0y6H1tL7
	 6DY8Zx73pNQBITUdyhZEbiwNJAh4O0g7pgd9EmFa20cn8+H/j6Ha/uCj6HPWnkFDGQ
	 7rtXLPT1hYPzCQzb089iQ1QmpAW7Zb0zn+yPwDWekGLgXyBIMLJXZA3+QWpVH9c8zE
	 OWfgUqvqs1TZMbMvMnlnwOUuWTjKdl1i+NBgXosg6r8bkvLnrPl39gcnlnaN5eBJwj
	 961DVVEFo7PSQ==
Date: Fri, 20 Mar 2026 18:48:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Sergey Matyukevich <geomatsi@gmail.com>
cc: thecharlesjenkins@gmail.com, Shuah Khan <shuah@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Andy Chiu <andybnac@gmail.com>, Deepak Gupta <debug@rivosinc.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
In-Reply-To: <aa_T3_IySAj4_Xwo@curiosity>
Message-ID: <b1f21899-ab47-6380-a320-770c3089cd7e@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com> <aa_T3_IySAj4_Xwo@curiosity>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Mar 2026, Sergey Matyukevich wrote:

> On Mon, Mar 09, 2026 at 06:52:10PM -0700, Charlie Jenkins via B4 Relay wrote:
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > 
> > The BIT() macros is used by the validate_v_ptrace() test case, but not
> > defined. Include linux/bits.h to pull in this definition. To ensure that
> > the header in the kernel source is used, add tools/include to the header
> > search path.
> > 
> > Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> >  tools/testing/selftests/riscv/vector/Makefile            | 7 +++++--
> >  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
> >  2 files changed, 6 insertions(+), 2 deletions(-)
>  
> Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks for reviewing and testing but please use "Reviewed-and-tested-by" 
next time so I don't have to fix it up by hand.


- Paul


$ scripts/checkpatch.pl --strict 0001-selftests-riscv-Add-definition-of-BIT-macro.patch
WARNING: 'Reviewed-and-tested-by:' is the preferred signature form
#13: 
Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>


