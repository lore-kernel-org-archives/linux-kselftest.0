Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD42EEE84;
	Fri, 14 Aug 2026 01:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670866; cv=none; b=FsP4SXV0BHzzxhgLqO8n6PvkpXrqhcBtoRE3vB7Bse1k3e2Dwz+xzg1oKdl0X/+bl31y1pxEWzf7jGHYrBqhpk2EfdPdstSRQojAvDSKEczVsif4paGQajyQJfCpZ9T3LCYg5MfjFSBGJwoXq2uQaVVOZs0LcyebjtZxkmAo1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670866; c=relaxed/simple;
	bh=bTrY53xmDU/m68zrX8h4ihP8/74jSNSEuu254deFRYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSgCzItbSD6vi6N2GAgRurPoEKNNS+Zfn8e5ut9nETAR6TqmzHHfHsUmXxB7pFjQwjBmLr6ONq0PTv6iqOgL5eGql7vCSMg6sOdEskRNjDAIBlcv3LCky/OfmrkMNy79B7AQQYDaqPNYHZabfIou7Z7pLZ7IqjNH0fJ7EyXhZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRnmkH/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRnmkH/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1431F000E9;
	Fri, 14 Aug 2026 01:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670865;
	bh=IY33QpInoKWY6iHHAuzKwNM0KrzwB5d8UOXp1QCwtAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bRnmkH/DsYJ5fEIPC30YDz/wMXm3XhJOU5nYDMR01n+67LTRsK3wfxOJlENpK0+xK
	 oPSkeVpWP+z6ZaojawXuKXA9PuR69n35LAICkaJ/bne1BdEWFrqaSE0Z3AxnkSnWF9
	 GokAop5+J7f7jeQmHk+Hd5fTHosiNdOpiVlbWYzz2DDshskOomYWKzd2kgfl1PO0dr
	 7okBSe40vX/ZcRlC932Fg+M31bDX5mjE64r7eXHrXwSlQ/D/s2vxknhtHyLV4pCZA6
	 2GOTeJXLseAdbt+o5khMu5E7re8mkUHbvD3HODRv1W+jyVaWkOsR79bxDor6TieDNi
	 5Pi5XOZ1WUvWA==
Date: Thu, 13 Aug 2026 18:27:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Xin Xie <xiexinet@gmail.com>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, shuah@kernel.org, lukma@denx.de, m-karicheri2@ti.com,
 fmaurer@redhat.com, luka.gejak@linux.dev, bigeasy@linutronix.de,
 ali@iusegentoo.com, qingfang.deng@linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] net: hsr: privatize interlink-bound skbs
 before address mutation
Message-ID: <20260813182744.4bd0002f@kernel.org>
In-Reply-To: <20260808004525.1551-2-xiexinet@gmail.com>
References: <20260808004525.1551-1-xiexinet@gmail.com>
	<20260808004525.1551-2-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  8 Aug 2026 02:45:22 +0200 Xin Xie wrote:
> +	if (port->type == HSR_PT_INTERLINK &&
> +	    (frame->port_rcv->type == HSR_PT_MASTER ||
> +	     (frame->is_local_dest && !frame->is_local_exclusive)) &&
> +	    skb_cow(skb, 0)) {

Would skb_cow_head() be sufficient? It's much cheaper, at least for TCP.
