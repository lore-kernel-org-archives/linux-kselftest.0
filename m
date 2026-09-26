Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041CA33A9FE;
	Sat, 26 Sep 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437833; cv=none; b=ZLcaZUob+LYFNZ8wf5krDk7DoB7qqUN/rDSQTr5hGpHLwrwmaKACP9w3UKseAzUbF/W2oeOSBZ2azfODyTU73yk/qMT9Jyc/v2yFBED2AZPvpC7ggLh3HJ6ivq5Z3cklbOAy0cW/Fix7G1ctfBeokdt8xcD+NGV/+fEvoYzTGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437833; c=relaxed/simple;
	bh=aDePeQ5jDiPLtxGNFINes6Ibv/nbLJnieA5dfWPXkiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWUP/9TmKJRvl68ylyyCTu+cp3zhnG+zgFncTDQ9Fv6B5vbe5C+Amq6Jz1yr1VqFYfw4WtDc3Z1M881z9pB2An+tBhaqKfJPOYGOYDM6+DF1V89dV4wlpvcLKvWkK+lJaTW/1vFl34hIGDbh2qvCnrJUWJrcpmRBzQTWwDYjKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YJRQFLX5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YJRQFLX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790437829;
	bh=aDePeQ5jDiPLtxGNFINes6Ibv/nbLJnieA5dfWPXkiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJRQFLX5tGgw9sgivDBZI+kuFC0URFltNwkxeXbMFwxf8SOCszoltgZb0m72iIbM6
	 Pu97JKiYCpsm/InNPFEk6TNGSQl8PHEEU0GmpkiRv00ACwTukTl6uszLAvwXw9Ivgt
	 I25HOkOz5VKAgRQ6J3ePpHqpi9UJ42HhFqkvYs78=
Date: Sat, 26 Sep 2026 17:50:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: stop rounding malloc() sizes up to
 4096 bytes
Message-ID: <d64fa7c0-e853-42ba-be3d-11a236c5182b@t-8ch.de>
References: <20260926152414.251214-1-danishkhateeb03@gmail.com>
 <20260926152414.251214-2-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926152414.251214-2-danishkhateeb03@gmail.com>

On 2026-09-26 10:24:13-0500, Danish Khateeb wrote:
> malloc() rounds the size of each mapping up to a multiple of 4096,
> presumably to align it to a page boundary. But the page size is not 4096
> on all architectures, and mmap() and munmap() round the length up to the
> page size themselves.
> 
> Drop the rounding. As heap->len is no longer rounded up, growing a block
> with realloc() now always creates a new mapping.

The series looks good to me, but I want to hear from Willy before
applying it.

> Assisted-by: LLM
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

I'll add a Suggested-by here when applying.

> ---
>  tools/include/nolibc/stdlib.h | 2 --
>  1 file changed, 2 deletions(-)

(...)
