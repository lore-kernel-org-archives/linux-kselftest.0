Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC6175A86;
	Sun,  1 Mar 2026 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772381370; cv=none; b=ZtjjDOuDnFlWrjcB3oo7J7026iPSxaemwjcqcHm5BMEPYBnpQ/cvRfb/AWfFNJ8eGbksuDmJwvsLTWIwGH/qgbkvBRuR35d5BawsVC3BIZow97EKWuBF58eOshZbrLHBAakcAjy2NK4tZJfy9AgrBrWZhsPWvyRf6QLraBubPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772381370; c=relaxed/simple;
	bh=6aMzHQyDM4i4JKgvY1pq+wKEZ/2ebFUDNOaZdIxhcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyrFuNJePP+7aIVhl0QrM6RU3x8MG1FztH/mdNNl3otaaljjqPH4LswLq4MmqyAlaW9nndq4YRZEmdq4sEadHy6rZw9hn/kgK9a9G3DCqwI4qkfFsO5EFbRdCrBhGVCGcvHPVPs8iSx2eu0Z9jhalAWJ0JvQHpNSbi7hToVwmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKPdMTwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKPdMTwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA42C116C6;
	Sun,  1 Mar 2026 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772381369;
	bh=6aMzHQyDM4i4JKgvY1pq+wKEZ/2ebFUDNOaZdIxhcRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKPdMTwee2Icp4UmhsyWygY/4cVOLOgs1xyxTKsKhN1L68H27LTC1siA6LDuiwf+C
	 DE6GOUntmc1JlkD4Ei6KQrmBABUZ+95J3scMacAnEQoQWYGCR8f+d/hz9V/0UkSFzI
	 Xkl1MPzs2Qs3axgzOPQOU3XbudbKMSL/DJdVRlLV/RxoEz6f0Q+QYEDv+j9gBaySNl
	 JOc7mQFpigTW0LhCINTC3qHvTX/JID/Ydknc7g06S8MoG8mQsxYM4rBmwMxcOk5G24
	 LM8IwRW+pEgLukY13C3WvfTKoHbSm0j5kUzq9ibCUPS3MMs2YKpaRWroIOosmGFWZc
	 BTWad0MXcFDoQ==
Date: Sun, 1 Mar 2026 16:09:25 +0000
From: Simon Horman <horms@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/5] net: dpaa2-mac: retrieve MAC statistics in
 one firmware command
Message-ID: <aaRktVdeVUubxBLc@horms.kernel.org>
References: <20260225150648.1542206-1-ioana.ciornei@nxp.com>
 <20260225150648.1542206-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225150648.1542206-3-ioana.ciornei@nxp.com>

On Wed, Feb 25, 2026 at 05:06:45PM +0200, Ioana Ciornei wrote:

...

> diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c

...

> +static void dpaa2_mac_setup_stats(struct dpaa2_mac *mac, struct dpaa2_mac_stats *stats,
> +				  size_t num_stats, const struct dpmac_counter *counters)
> +{
> +	struct device *dev = mac->net_dev->dev.parent;
> +	u32 *cnt_idx;

Hi Ioana,

The type of cnt_idx is u32.

> +
> +	stats->idx_dma_mem = kcalloc(num_stats, sizeof(u32), GFP_KERNEL);
> +	if (!stats->idx_dma_mem)
> +		goto out;
> +
> +	stats->values_dma_mem = kcalloc(num_stats, sizeof(u64), GFP_KERNEL);
> +	if (!stats->values_dma_mem)
> +		goto err_alloc_values;
> +
> +	cnt_idx = stats->idx_dma_mem;

As is that of idx_dma_mem. So the types match here.

> +	for (size_t i = 0; i < num_stats; i++)
> +		*cnt_idx++ = cpu_to_le32((u32)(counters[i].id));

But here __le32 values are assigned to elements of cnt_idx.

I think that the type of both cnt_idx and stats->idx_dma_mem
should probably be __le32 * rather than u32 *.

Flagged by Sparse v0.6.5-rc1.


...

>  void dpaa2_mac_get_ethtool_stats(struct dpaa2_mac *mac, u64 *data)
>  {
> +	struct device *dev = mac->net_dev->dev.parent;
>  	struct fsl_mc_device *dpmac_dev = mac->mc_dev;
> +	u64 *cnt_values;
>  	int i, err;
>  	u64 value;

...

> +	cnt_values = mac->ethtool_stats.values_dma_mem;
> +	for (i = 0; i < DPAA2_MAC_NUM_ETHTOOL_STATS; i++)
> +		*(data + i) = le64_to_cpu(*cnt_values++);

Likewise, I think the type of both cnt_values and
mac->ethtool_stats.values_dma_mem should be __le64 8 rather than u64 *.

And there is a similar problem in patch 3/5 centering on the use of
le64_to_cpu() in dpaa2_mac_transfer_stats().

Also flagged by Sparse.

...
