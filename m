Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E02D5412;
	Wed,  2 Sep 2026 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309280; cv=none; b=sgRJccIj0g2Y5yCRQA4pbYzS2kn8brLrgTKMSpqppvR0Hu37k92yFCvjGHSSfMYXeZgBbgKN7/VODp13rcau1ThwTV1Xnj36NbEFaj8mZQ6LkffHHloh4ud4gtHi9pzV3Hfw+qBxhiSIjBpFFL8eqKEtdPfmbHWcrPNyj8NaJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309280; c=relaxed/simple;
	bh=TiBt7VWtVf+bVkZULx3CDVz0141hmAUW3eqRvZ3dF1M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PFgAM5A0q/L6Ktwr2769OtQnQuH9mAxq5Gy2M8joqbPTYgX6RM2uWbeVI2suaLuteWezJVx0bw+6KgAtzAr+7LFxmdKgpQEOOR/o/YJCvyCE9qKtM3ihDM3qPxDDsLe4XZviyVsmeE7spDsnbL1wPTvHQ9XYR8eL+JJV6NNTEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+86Z2NM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+86Z2NM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0361F000E9;
	Wed,  2 Sep 2026 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788309278;
	bh=OdJylGa78WF2doU9FXC8lzmhghGNL2Y5XclAhve2yqY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=F+86Z2NMUvxCho1lNmTfOYrl7CDzh/k0LLIca39sFZCvi4pnrf4P6b5jpV9bcOhGG
	 heDkjqkj9SH+JnsZTlDT1JES7DWQcOpZ5sle+yrlPkWCdzBRvjfi37pNH44u3tN7Xq
	 UrJubsKos2Mct70Ip5SlWmXdonwRyNM4Gg615N14Ud14I9rLLVOdYCLJaJwLoAxVgU
	 qFx/3N4274mvIWUqokbZ7lzSIwiKWDna+ov6SwAnLC6cRuVukvtRRORRKIqQXrigKm
	 1rkOIcWTbCYmj4TGlkKXjTzfsmz3Dc6K7d6ix4k0PmS9l2LcbSa6i8xKq3uo+uw2eZ
	 NSRf8OsrFd4Vg==
Date: Tue, 1 Sep 2026 18:34:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thomas Huth <thuth@redhat.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Nathan Chancellor <nathan@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with
 __ASSEMBLER__
In-Reply-To: <20260813075304.75988-1-thuth@redhat.com>
Message-ID: <93f5f872-5d81-cab1-7231-a9da03dccc7c@kernel.org>
References: <20260813075304.75988-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Aug 2026, Thomas Huth wrote:

> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, queued for v7.3-rc.  Have you considered patching checkpatch.pl to 
catch this problem?  Might save a lot of time.


- Paul
