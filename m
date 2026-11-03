Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710904;
	b=ICyWNAuALe5sz413lhLIVUfMqBW62m4KjPaAIHF76ifz5noGQ+px0AffHFKQR4YcCJkw
	 id2udw6jGL7DZiSzZW3wZ6yN0V5TcmcHBNSrhpvUsUs5ZVKUQbGl93Nb3edi+bsflX3MX
	 QqCR7kFla0IbClTtHLHxvf34QAaOdz/DMppKnvjVYHHzxhna/cW4Q0MdkT85R1puM+GTE
	 gPduISngSDsuF7N1Llx5utHP2hXNmpuvSu0bbZd2Lg9H4Iy52Bn3gFt59YxCERe+rDiWe
	 ITcyRey/Zo+h24duNz66KUf+Wwx4XUh31YA1mtq3nEN9L7Dg8mA3SvynDzfyXVxFGwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710904;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CM1sHdFY9XeKp8SyPiofbXJvq/Pp2zuA6NY4f40oVL0=;
	b=KYk565KiLsCFCqs48OsiuiuF9SoMteQicrS9oRTyO6QBjwPXKMAKoxv4Y3ldHMwX7Tc4
	 W0DfVfmBM7JGCfEZHn4BuM7pAxur7UTRT9PjHIrEKka05JhsCOReB2/EcT8bvLC4eSA0F
	 DjfZfaBpLwIqALhh6u+4g8maVncLQRz0Jxi6iINRw3y2HuIawGR69nUPVmJDGWl5GrOdr
	 MFp9eYH4ST0wWxDGGnAyEfip1b+yqJkVsy6seZ1ATGhCgOeHzpuOLtWdUvlizl0/CECFn
	 X7D4Z00CHLp76jkNpzHVjoU/XmwK2vsJSazuygOiiJ6J0CIqcygI4EsdGjtHqSSAXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gu7j3C9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8489E606D828;
	Tue,  3 Nov 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gu7j3C9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166A81F00919;
	Tue,  3 Nov 2026 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793710904;
	bh=CM1sHdFY9XeKp8SyPiofbXJvq/Pp2zuA6NY4f40oVL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gu7j3C9nge11nrKHIyt2s335jtyd60bB98+u93DZ1xaM76HFgJ5osT30x+erpcVcS
	 bS9xaYm1kEu4a+g+YxPAwADB+ugBA9U0EClIqnLn3KnIOBH2oCrJTyONQ1sym+CjV8
	 oG1U+4gfnwrPhzFsqr7YzKnbiwUHL8QczROJAA7lo0V0z2/hMUp3/OI4O76FeLR2Vt
	 Af45joD858QkFP7+sNrOAw+nx1WxuXQZn8YIum6AgJMCjsNHaFTm8h8C4nrWsFyZvQ
	 hv+u88ZBBVZgQamNg4QWR/LWAPp2uZ06WVVyemx8mRnG5gFrYxeYoRvT2YsM7I+wP6
	 nEWltcVNiHaEg==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/futex: load atomic values before harness comparisons
Date: Tue,  3 Nov 2026 08:01:29 -0500
Message-ID: <20261103130131.4069212-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200147.1364987-1-sashal@kernel.org>
References: <20261014200147.1364987-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping, this still applies on 7.4-rc1. The clang jobs in KernelCI still
fail to build futex/functional/robust_list.c with the three
invalid-operands errors.

-- 
Thanks,
Sasha
