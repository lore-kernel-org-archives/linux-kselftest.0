Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5D346A14;
	Mon,  3 Aug 2026 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797231; cv=none; b=nkZg7Ng7VqOOSmYZlOUUDsGGSB3YGXKvzbBs1tVjgtCfiBXslJvUI/cAZLTWH5efL188aUG2fOxx9iXa/0ngI4MoeW7XZedhHxF0ncpAKauVd0qI/Ni9oDjtKyTjavtLbBADO92z/DbmGBDnhpNPe8boQ0JR+UA7oGSdTStqxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797231; c=relaxed/simple;
	bh=6uq0XjCoKYWHBXRg0OAG5t8zks6jbW5gu3lzCHMsKRY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ddRzTHijA/ITh7cS0bB22J8lLty8kWTUt9/urnMfIvq2JAq4O5hJOc5B2FY+WJyOD1AD4DPvU/cWI65d+IxB2fUWniRZn6i6b2qrA45qb7NYOcFHiMFyFg60RcK2qv+AuV/9ZEEBfLSEafV1xfKPUKMtlYQpk6F8U6raJLGLmEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkR5+ED4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkR5+ED4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942141F000E9;
	Mon,  3 Aug 2026 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785797227;
	bh=vDjqRM9qhKEVmzTZtdAk2U10hpdPMllWx0PYXjxdp0s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QkR5+ED4gegbtsjxmaTaCKEtlAH8n59RxXr+M5+Sow+yzza8B/k9lUMl69tx3ij6G
	 DjQByqkNAc++fC7An0vvLF0yFUir2suvRCNoQDqRZezLOF/3w5bh7FNJKLVCGmf5ES
	 3HEBc+SJe1+DPn+1KNTiZ23+uaxYMdwNZFQM0McUKXiUADGij0g2b50nt8vdhiAcKy
	 jNLePUBwI0hs8n9npY06flmPPKIxrLwuRp8vArJX0NIC46w4GPg+9YUOKSNorse4c3
	 GT1oqY4BzXYy7m0coP2W0kDeKd+K7dgWTy97Fuq6iZeiMkQ6ZrdnU9xpqQdPZDo/Uw
	 OwkU7fHgYXLRg==
Date: Mon, 3 Aug 2026 15:47:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Dave Watson <davejwatson@fb.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 5/9] net/tls: Consume empty data records in
 tls_sw_recvmsg()
Message-ID: <20260803154707.6dc9171f@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
	<20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 20:33:33 -0400 Chuck Lever wrote:
> -		/* Do not use async mode if record is non-data */
> +		/* Do not use async mode if record is non-data, or if it
> +		 * is empty: the receive loop frees an empty record's skb,
> +		 * so its decryption must have completed.
> +		 */
>  		if (tlm->control == TLS_RECORD_TYPE_DATA)
> -			darg.async = ctx->async_capable;
> +			darg.async = ctx->async_capable && to_decrypt;

I vaguely recall that we depend on all records being async
uniformly within a single recvmsg call
