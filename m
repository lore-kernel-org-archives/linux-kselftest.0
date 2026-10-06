Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0437C91E;
	Tue,  6 Oct 2026 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280962; cv=none; b=u/7dBbLM0+HDPPYIEPyc8yxzoOF9w1GpNYuLROm82XRRn5Am8hplzGcXmUwmCctvRi2DufNmhbvDerAFii4V9MD9ArL+yURo/QHeJ0HQnJwxYhBnBClJZPlDlS13Fc6pwafXxdc/wXXbKEGNBHAvOocLmQ9FWImy9ipshNlMtAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280962; c=relaxed/simple;
	bh=p6gRWtjnRPzPjNw8RSNwUNSWz76qRbtQ2rI5k+dKUns=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eNwgfo+DPrU+NEA9LVP2aoDN0QtIjqctlTsTWRVtM2oq8LzkWL+d9aGXgtdkqgx41QJFLvYcns1vUvx5iehGZ3tWTrntk9+lMdZpzjQpiHaqLwKcMpXnGaoYcrvR2gSCICRhTzV0h9yKfSJyiGabg6SJm9/oIiLj95HtTOJ8ahY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MecrNhTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MecrNhTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6591F000FF;
	Tue,  6 Oct 2026 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280961;
	bh=A39VzXRsHbS34EkJ/psmhi1766KD2XKbN2N/lEv/6Zg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MecrNhTwQ0vEq0Gx4TT6x1lr/4yWnp3c4V8ZSjQdIxq/aRSUw/6fXcgghBozZMpyP
	 rki8Ep7g6eSlIgJd37W8jBUArT2kPhZG+h1rJ3vPHhQ6PGbtxCi/z5haMa6Cf2Wuhz
	 +0f/jvRKbUJMCJQGW2+wUefAaPCpYGYMD0Dtr+gXHWQS+nkMlBpaMq01B4G/Ucx4QH
	 ZqFVAINmjRLh0QcySjjtLIxEtl7spmcHHFFEaAXKoRr7SynwYCklyDj/tSjAccBH7w
	 rpruu2B0gMHiwAsQnQw9mWYcRwgc6g97hvzuwNvd4ZiWfcW6nDIXdWFOrAcDEqcEsr
	 2h3C+nVRX2gMg==
Date: Tue, 6 Oct 2026 04:02:35 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    llvm@lists.linux.dev, andybnac@gmail.com, dfustini@oss.tenstorrent.com, 
    greentime.hu@sifive.com, Sergey Matyukevich <geomatsi@gmail.com>, 
    Zong Li <zong.li@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v6 3/8] selftest: riscv: test vectorized user copy
In-Reply-To: <20260918215154.2481482-4-tchiu@tenstorrent.com>
Message-ID: <a4044f84-5b45-f58d-caba-ef0223b9581e@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <20260918215154.2481482-4-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Sep 2026, Andy Chiu wrote:

> Add a test that pushes a 1KiB pseudo-random stream through a pipe, so
> write() and read() copy it in and out of the kernel on the vectorized
> uaccess path, and compares the result against the original. Both buffers
> shift every iteration to sweep all relative alignments, and 16 processes
> per online CPU keep the vector unit contended. The compare is a byte at a
> time loop through volatile pointers rather than memcmp(), keeping it scalar
> and independent of the user vector state.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks, queued for v7.4.


- Paul
