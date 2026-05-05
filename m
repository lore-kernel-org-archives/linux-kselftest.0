Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2727FD4F;
	Tue,  5 May 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973499; cv=none; b=BVgfBVcAad3StMHBZK0CTxK1aaDeSiYtCE3urZZ4IAUAwITDTZo++TzvbFQFD5vTSZc1+pxDNemky3w9LZh5fhPoVzSO9+KZfD/Y/UK0oCQZA1LUNfWAK49H0SImVLnAzp7KjVcguAEzLY7ruwzBfpmT6nAl7SDiDKd4D8uFfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973499; c=relaxed/simple;
	bh=BaT4wew/GYzPuyRT/BHauu7Z5/EkUapFRHz/6ort5eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuomTsd03sd6bIr9tO83C2EFzeFEfxHWAh1a5urEWf35Mm6W6pveo6OebHtN1V7hw1Y7whczddv9eVG+koFqAfLdp4Ebc9w+gXszgcPrWekEneeUHlrcOqB1o3i1gW8t6CMmF+3mnnwrlq3RXybGMFbHolWJzUDYLWnXjEMmu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4am4wje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4am4wje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1997FC2BCB4;
	Tue,  5 May 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973498;
	bh=BaT4wew/GYzPuyRT/BHauu7Z5/EkUapFRHz/6ort5eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4am4wjewkpqguyhCFlj8YXHAF9VM7A853X9g6J9cL3hMtDZjkiamdwxThdgSOR6u
	 XuRy5fDzC8d2qKCXgqtAZxrelf9zFH2EaPHcWyo+yJfXT7h2+0IN+cLSxZiGagvhma
	 cg8G4hcg030qUazjmDZp6yCKyhLS8Focvr5FoIgLIzRCUieuQ7XUp0sEOpknRrE19i
	 OqeY03EP1ytQdZnRixM0rrrbZzKPpT1d8MkIctxm8Qy1VxHy5fon99Hp6D3fanTNf1
	 X2HKV2RYT/I9h2935e8mcyPHQBardOm+3/Q7dK+F6WVqvKQ9y+6ueeP+D5qCUO+TUD
	 59m1QzC7h432Q==
Date: Tue, 5 May 2026 10:31:30 +0100
From: Simon Horman <horms@kernel.org>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, shuah@kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v2 net-next 5/8] net: ena: PHC: Check return code before
 setting timestamp output
Message-ID: <20260505093130.GP15617@horms.kernel.org>
References: <20260430032507.11586-1-akiyano@amazon.com>
 <20260430032507.11586-6-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430032507.11586-6-akiyano@amazon.com>

On Thu, Apr 30, 2026 at 03:25:02AM +0000, Arthur Kiyanovski wrote:
> ena_phc_gettimex64() is setting the output parameter regardless
> of whether ena_com_phc_get_timestamp() succeeded or failed.
> 
> When ena_com_phc_get_timestamp() returns an error, the timestamp
> parameter may contain uninitialized stack memory (e.g., when PHC is
> disabled or in blocked state) or invalid hardware values. Passing
> these to userspace via the PTP ioctl is both a security issue
> (information leak) and a correctness bug.
> 
> Fix by checking the return code after releasing the lock and only
> setting the output timestamp on success.
> 
> Fixes: e0ea34158ee8 ("net: ena: Add PHC support in the ENA driver")
> Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>

Hi Arthur,

Perhaps I am missing a dependency, but it seems to me that
it would be best to separate this patch from the rest of
this patch-set and post it a fix targeted at net, CCed to stable.
