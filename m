Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9BC31F9AB;
	Sat, 21 Mar 2026 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054394; cv=none; b=qNfWR/jxd6Zg7BFNQkTczaM9Eoa3hZH9UQdpth7rFEaHDBMUfXxQK7hUlWvWcQTiugsaQOmHN7hl91tWqiW59yvRH7rabbSgR3hFYf7NZLEFLE0MliR+Uy9ExL1fI5ROMrtiZS/TzAt8186DSXoOUEGsATNiFCIy7y6sNYhsitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054394; c=relaxed/simple;
	bh=wljedl7NPNOFHFaJgkzavMegTDnNmk/QehJ0RtoHe/A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L3aCYtKELhNmzgsHtGrK4jkbSgcIGmweVsMgQQ022MGgXQ1Y1PJSkCgF8YmApJApkDMmDgotkC1faD4jk1Zs7b4bHRTHYtvFeCEYdsQyugtkLpFYrJglHVH0HtsUjqFir/jH9v3EOWZfsvOWgBTH4oQ48dyFsG/xKJJKjV8YY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8BBy+Ao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8BBy+Ao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD81C4CEF7;
	Sat, 21 Mar 2026 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054393;
	bh=wljedl7NPNOFHFaJgkzavMegTDnNmk/QehJ0RtoHe/A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z8BBy+AorNRqOunF1aXWuTn2/QbY3cSnips50vfX5Pevj7rpoYZj3tfnqmH2WDT2D
	 xFEMTPd7bIiAPOkur6svMhEYSHMgKSVMCu/580VXFJnx2UmkBm//Z0Env6CNH9aRZu
	 Rbit92Z7T3o2trfadOL5qhNjPrsfp99NuE8+dsemoht+efxu3F+eMYqXfLQaXq8A0a
	 RLWHzRxIoU2QfI5/eQPN1XJBbofOcMO+Zk14sQRZOa75ChqZijbJpS+BQ/mwM6zFfe
	 MsWJ8lBbXQTgC2gq05jSWA2K5YuHpRm1v72+hnlGymy7EyMPGgt7CZU4JzJ5phYEC7
	 YMgZzPblqLX9w==
Date: Fri, 20 Mar 2026 18:53:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
In-Reply-To: <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
Message-ID: <a22c784e-73db-ce16-fc45-222ccef0aa6f@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The BIT() macros is used by the validate_v_ptrace() test case, but not
> defined. Include linux/bits.h to pull in this definition. To ensure that
> the header in the kernel source is used, add tools/include to the header
> search path.
> 
> Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.


- Paul
