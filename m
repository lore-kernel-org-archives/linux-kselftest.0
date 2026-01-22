Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15C30FF2E;
	Thu, 22 Jan 2026 00:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043377; cv=none; b=LCYCOH4AHkC71uOmeohEv+scWa3wmuCl9XWWjv79o+zbteXO/K7Rt4kF+/YFBCgKjbn2yqZaF/Q+/mDe7BONp9Z1pTiQJiT1Bd3N8VniYg0MB0iKotqPnuqGZL5+rot7tVvuu7AWQbBheUMQn0dSqF2DsO3kaCL4LzUOU6HhovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043377; c=relaxed/simple;
	bh=WN1M+wuGxXKqX24TOyzbGQn3LWi6zcwDEOyl/o8L1EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sDRgu+8UePnTa0RzUr4DEWzED47FXGyNBwZcD74VAXSJ1T9vnvbMA0tFrIoyoqRR46OuuNNLpqOoEPxHTu9kkAH/GCwkQ52PtHepaqujCDb7NF08piIjUJx0adhep1eRNsn8WFRSc38JKRXoCfydRmLEDKdk8XBYKv9EANAHyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjLDUAUK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjLDUAUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EF1C4CEF1;
	Thu, 22 Jan 2026 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769043375;
	bh=WN1M+wuGxXKqX24TOyzbGQn3LWi6zcwDEOyl/o8L1EQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NjLDUAUK4UCp/GQeyVfO/uYCA1SlWkWrGj9nqCU9E5N2pz8nc7XsziOQOZu7gbg1v
	 Bzfn4Vfmx7d4xibXNl+ZPcsFT9ROaRBiX7TjKvcCdePVfgu+jrB14O5EBZoCaY6R5y
	 3KXBgx5a16xq438ULSF4Ni+zXqlWVxTtof6MayDUMTGIlS10tHY0OjW7HLyq6H0vwQ
	 /iG1ezGWbr62l0V2nCvVroLBPLaGa7r81cjAJkNTAsMqwL9qLqRrXuX8p7NrZZGWRm
	 LvvuSjeoU2jvtOm4jJ3GTh53g4tPjnNRL9OmoZhVyjcbCQ0L+kAWFACl9Z9RkYJei7
	 2V0oWP6zVHgoQ==
Date: Wed, 21 Jan 2026 16:56:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Konstantin
 Khorenko <khorenko@virtuozzo.com>
Subject: Re: [PATCH 3/5] selftests: net: run reuseport tests in netns to
 avoid port conflicts
Message-ID: <20260121165614.71b56b07@kernel.org>
In-Reply-To: <20260120230558.328423-4-aleksey.oladko@virtuozzo.com>
References: <20260120230558.328423-1-aleksey.oladko@virtuozzo.com>
	<20260120230558.328423-4-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Jan 2026 23:05:56 +0000 Aleksei Oladko wrote:
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index b66ba04f19d9..a160e0d816d9 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -64,6 +64,10 @@ TEST_PROGS := \
>  	psock_snd.sh \
>  	reuseaddr_ports_exhausted.sh \
>  	reuseport_addr_any.sh \
> +	reuseport_bpf.sh \
> +	reuseport_bpf_cpu.sh \
> +	reuseport_bpf_numa.sh \
> +	reuseport_dualstack.sh

missing trailing \ here, which breaks the build :(

>  	route_hint.sh \
>  	route_localnet.sh \
>  	rps_default_mask.sh \
-- 
pw-bot: cr
