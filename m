Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895171;
	b=LyJiLwP8UnUhBU0LvOO9YThKqI8hxynxUqrxJUQRppMdnLyNgCa0V/q6pG0SKCvpFJiW
	 ebcYcexCG3axQs5ODcRxYkFl4NGZ8VwMq5uUVY6MHwL0AqpYCwYGueXPq4QEEgvqWN6Lt
	 m1q6IPTfE8IhLNwhTwGrZ4O60dICbQUVuDIdQ1kEGaaEXZwPRQv4t1kQ3iw1mgEytYAKY
	 DlNpDqBuFhJ+h0D/cNxUSkNPotZlC2Pix1u2ZXZRsxH7UEA0Q8+q1WR76MPaV9UHilO/y
	 tkOQGP26CudRT8SpymsRLlok3J6ZuMjxL/O9CvtwKZ6g3Kw+W3Qag6w7THPV4O01mQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895171;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P5ds16V7HJoVCC6BTho835T+M7m7js7wzvD07D0ZXls=;
	b=RwW85h0XJ0opEU5U85xi6JRFtcMxkj/bNNHOVJh7AxSkOmlk3aTj6+5iQY8admxVNEX4
	 v4Fa7fWuGDuMe5sI14I5Zi1crh36NnVk12t4dE8mdVjhmuHZAUmZVfpQj62th+3mOvw8L
	 btajqGaCLc+W0naaVC6+irnX1e0ScdOKZPyxJLil+EyQlR36iqGiSCASw2IJmeiAc75L/
	 EfZ+7U+6i/EPzRuAx4DuORk2TuwCqexfn9aIIx5u5xPXcCatOrsqCyRk9/sScN5kDNeL2
	 3v3NV7AWZj1ztd9ESncI4oXkFEu9cW7pnRm38oDK6MKeNFuAkh3Z6qq7Y2auRDCYOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XXI+cwHr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193FF606A31C;
	Tue, 17 Nov 2026 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XXI+cwHr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E161F000C4;
	Tue, 17 Nov 2026 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794895170;
	bh=P5ds16V7HJoVCC6BTho835T+M7m7js7wzvD07D0ZXls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XXI+cwHram8ZPzedqsb/euzHsl5kiqz+fssZSraePwGYIRAA/D1nWXwlXhCgVDRwH
	 Bqpl/3jkaXKh48w27I0moNPJDykWuWTRS5IApq0ghJoKTcl6/YOKSiU3FEld91TeZf
	 EaJFNROcTljpKL7ptXpCd/u6yw/vsGkDaRIMFzH4=
Date: Mon, 16 Nov 2026 21:59:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: cxg <evers_chen@163.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenxionggui@lanxincomputing.com
Subject: Re: [PATCH] selftests/mm: Handle implicit read permissions in
 madv_populate
Message-Id: <20261116215930.f257ed2f010b4a4e9fdca410@linux-foundation.org>
In-Reply-To: <206b5151-c527-4b7b-8694-dd9c6cfd916f@163.com>
References: <20261112031811.56500-1-evers_chen@163.com>
	<64e1c24f-08fb-437e-80c1-e5b486d15200@kernel.org>
	<206b5151-c527-4b7b-8694-dd9c6cfd916f@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 15:00:56 +0800 cxg <evers_chen@163.com> wrote:

> Thanks for the suggestion.
> 
> Agreed. Since this behavior is specific to RISC-V, a simple 
> architecture-specific check is sufficient.
> 
> I've simplified the patch to use |#ifdef __riscv|in |test_prot_write()|, 
> removing the |/proc/self/maps|parsing and the additional PROT_NONE test.
> 
> The updated test passes all 16 tests on RISC-V with Linux 7.2.0.
> 
> Since the original patch is already in Andrew's mm tree, would you 
> prefer a v2 or an incremental fix?

A v2, please.
