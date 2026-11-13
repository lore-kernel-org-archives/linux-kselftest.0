Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572438;
	b=kakD4lTse4haDD3Nf72OuWMLeVHPqw0bcP6mTkibyKYBpIPjjmwyj2Or/gFyqj9sS4oL
	 8wXGyrqhlQIqgDOLUW8c1MdACVUOi4pUbtw8j6dQsZLbHEK1MepSg7UPTYOP0NP3zqhv2
	 GdfWMtrcAnSaFhIHAO+w5I9a0N88BjKfYOuMxUUq/hJSoA4Fz4Z4BLmIysqk6qqbZpZ+W
	 /nKn0K2SxqOFWlBhdO80q0IKIYSCXLt0iRpi2jga9p8joAMa3KjAGrzx885kJnQRmm5PS
	 UIxCyLgRCUuFhqFeZb1NAcrhKMWTjuYqAe7oScleJcSNJJ1dz3ExdL92HwBsYHgvqbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572438;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=04zbQXN/fHm4yeapTB6+tJQ1+SULWzSbJ0NuXZMwrbc=;
	b=cvEBxqHqs5eoMJV6qCnRmtPw9dYxhyxM3x0h6xyRxq9vax0XCtbqNvGUu3hfdD3sCbNY
	 H6YMk8uTlfIRBXG+sKmTCIuk+Gg6++yjeuHPyGYjNohn+1WMjbQY/Sui9sIQD1m9Za5RN
	 7L2kObkX1pe8gq+tG/QauZdjCGggx+dNOQ5nIdXMLrHYA6yYxEUWLmt51Y2o1xeuJFGlE
	 Aiu33EqVXCC1oX/7umSDgnp+S58CbmgCeJkp06hdCPfAsi2FQYphpiy7r9uldqk6qvpRG
	 bT1k5A+KgnEFdvlwoACJB2q9NzFb9ONTsUPzT4+9kTC6hGMHht1j5TaVwqxiQcDQ6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=LV76iNPN;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FB606A321;
	Fri, 13 Nov 2026 12:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=LV76iNPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=04zbQXN/fHm4yeapTB6+tJQ1+SULWzSbJ0NuXZMwrbc=; b=LV76iNPNBMcd0qJJRkYRcfwVCz
	tIm4KhERPVogG0EAGaPQyOot5Y0RAGojYX/2zOr0KNQVR09wsh3Jw6p8dwzoJkil4BhRMm9bhd0Re
	AqsjB635Z+H1ebDqM0WSkvL5TTiAhIYEdwxKOhNo+Lu5V9Ia+uL+PpQGYPmHgy0d+SSTZfqIswEdX
	aZMzMWvAwFk9zUjUj7uaTO6LeQ+W7UKa7pkoA/B3nWhhaMavU/s77VuBM6PUfhlY2uKYsBPoN5ajo
	Hsdz76wj3syeTF/nTpd8BiOLxHghUAbs1/9mmUM9aGLPkIZ3o5haaWZxjvgUfRYiy4JLImg6UfoWZ
	ksmLHmxw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRqGg-00EkJu-1f;
	Fri, 13 Nov 2026 12:20:34 +0000
Date: Fri, 13 Nov 2026 04:20:28 -0800
From: Breno Leitao <leitao@debian.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 4/5] net: devmem: size TX net_iovs from the
 dmabuf sg table
Message-ID: <avcAe3FIG0Jcd6SG@gmail.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <20261111224740.2744522-5-sdf@fomichev.me>
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
In-Reply-To: <20261111224740.2744522-5-sdf@fomichev.me>
X-Debian-User: leitao

On Wed, Nov 11, 2026 at 02:47:39PM -0800, Stanislav Fomichev wrote:
> PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> which makes BIG TCP ineffective.
> 
> TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> from PAGE_SIZE up to 2MB, which aligns every DMA segment of the dmabuf:
> - 2MB hugepage-backed udmabufs get 2MB net_iovs
> - no UAPI change, TX addresses are dmabuf offsets
> - skbs keep their size, only the frags get larger
> 
> The net_iov size doesn't depend on the device. A frag is never larger
> than its skb, and the skb is never larger than the device's
> gso_max_size. TCP sizes skbs to fit, and validate_xmit_skb() segments
> bigger ones. gso_max_size is 64KB unless BIG TCP is enabled. With BIG
> TCP, page frags can already be 64KB or larger, for example with
> MSG_ZEROCOPY from huge pages or with 64KB pages. So drivers that
> enable BIG TCP already have to handle them. bnxt doesn't handle them
> yet. It has a 16-bit BD length and needs a separate fix.
> 
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
