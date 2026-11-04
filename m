Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787359;
	b=pJvkjSM8TT+GPMqtg5g5GjEudtTVanc06d+9rtnPu5cwjdG9c9jV1YfDsRor6UnUC79b
	 5plX6xSgqWgsqctqcvKUIlTbeKK0S7kF86XuXqiDXpuAxhWhmmx2SO87Yd4Ve+bgRZZgx
	 taaFrYB+2O2e3gM839qCNANYd4GTis8K5FtmaGqp6nSMtHcH0y9pqi7f2D6w0s6PJvyyL
	 KTeghqwnP5AeA5w9CcOtDzwpKsbd8hxvOf++pt0ECrNraobtnOk3Ixm5BxOxb657qOeQG
	 Aka1EJcImt0j5dsX1iKVmJr08iJtgO8JrcJ4LyISw9231gk0tULwipe99nJNcmYNJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787359;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=oixWenz93zfV/gRziOoH9F4/V3oGM3o5imt+x14+EmI=;
	b=zCFVqRh2EvyUq9cAZP7qf2JgMW4AKKM+bgl1UsJgSiOp+iAn53Dx7c35ZkKyOoJnZrkA
	 vMYgL8KzhrM1gbLzZ1VJnu4qEbgcQ9SmY3q+RqkJCgRFYWsuCz0HV/k5NBY4XAngoeOAc
	 ap2Nn2VuxKWl8iHK7Yg6xmo6HVoXT/EnzGOm1CkMq3Say8dcFGw6F2FFxqiz2z57Ti9/i
	 MmwYoN4SiyyWyfnzYM77OQL81rEE9nJn4FZRam4nw9WjU01/X5udjc6D3RkU4Qft6w3aE
	 mchHlaWqmKksRunhWZjL8iuq/1S+gL55PK9654bs/ntT2SuYuXxJYsoGF28an0r9cwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TMTQlLLc;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A0606A31B;
	Wed,  4 Nov 2026 10:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=TMTQlLLc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oixWenz93zfV/gRziOoH9F4/V3oGM3o5imt+x14+EmI=; b=TMTQlLLcaLI8BZ5ZCUxe0wBqxF
	v0z4uOU1v2x+wom1dHvCtOP2eKIQeHxhbF+0Ocjco+trkl9qquBXGrlsWsAI6CvwDXPwA7a+SdsfX
	Tu3/szCFmCy5MYsKODsBN2OI+KNx/K/Gto4wWX4K7Y8PqHPSHeBa9Ax1FUkWfUIEatulY71zLm0PZ
	A/YnQpQ6s75l95Qhz1BKVPx4Hmp2JZ3JlfEyMjzmlkBKTglCC7mq4zpLJ21yo8QwG5EX6QXxNN5vg
	lscswH0A7kesS43ZagS0Aex+ll+37EtKwy6RTATlNr1fETS2T9FIwst2Pe8sJL3bY6g3pvfeHsPlj
	QF/onkIw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOY27-007dhM-1p;
	Wed, 04 Nov 2026 10:15:55 +0000
Date: Wed, 4 Nov 2026 02:15:49 -0800
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	io-uring@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/io_uring: cast optval through uintptr_t in
 mini_liburing.h
Message-ID: <ausFj54fk-_oP5i5@gmail.com>
References: <20261103163926.641431-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103163926.641431-1-sashal@kernel.org>
X-Debian-User: leitao

On Tue, Nov 03, 2026 at 11:39:26AM -0500, Sasha Levin wrote:
> io_uring_prep_cmd() puts the optval pointer into the 64-bit optval field
> of the SQE with a plain cast, which warns on 32-bit architectures:
> 
>   mini_liburing.h:272:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t.

Thanks for the fix.
I see the same warning with gcc -m32, and it is gone with this patch.

> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>

> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  tools/include/io_uring/mini_liburing.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/io_uring/mini_liburing.h b/tools/include/io_uring/mini_liburing.h
> index 44be4446feda5..1f5b0cfc1e5b6 100644
> --- a/tools/include/io_uring/mini_liburing.h
> +++ b/tools/include/io_uring/mini_liburing.h
> @@ -269,7 +269,7 @@ static inline void io_uring_prep_cmd(struct io_uring_sqe *sqe, int op,
>  
>  	sqe->level = level;
>  	sqe->optname = optname;
> -	sqe->optval = (unsigned long long)optval;
> +	sqe->optval = (unsigned long long)(uintptr_t)optval;

mini_liburing.h doesn't include <stdint.h>, so uintptr_t only resolves
because both users include it first: io_uring_zerocopy_tx.c directly,
and prog_tests/sockopt.c through bpf/bpf.h and bpf/libbpf.h from
test_progs.h.

Since this adds the first uintptr_t in the file, should it
also add #include <stdint.h> next to the other includes?
