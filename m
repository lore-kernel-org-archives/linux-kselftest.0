Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D72FFFB5
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577120; cv=none; b=jyxlblF3McklbedtqRuCpx7cMWJ+TkyqTVo9cQD2p/8nTwrEnIOdRws3LUWWT7rP+urrWEBICjzoJledKds6m3jrDb/8b3dang65uXdda6c2vx9n723t2iCTPPDxm5ZGJ4dytEA1rrUySXj36r4aQjCkOZOgAN44iwpHL5rrHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577120; c=relaxed/simple;
	bh=LQmV9uVJSWzpuYBMYE06KO6QJNQTVUYYsn2DywraVFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpXWzza306MCVRZjjKQBSkOZcDF5KuAcQWSn4RTWVnWvKVcnnvHvYugzmFGhaWKKSSAvNFfjY2ixPNeMFqh1gi9BviwZRoYrVrzXhkPYPvuLyWijxfmiKIWRdyS8tsg9ct/g2mXuCEEs8l3zYXNYDPBtk9miWRkQuc2XzRBRSSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkbWAEQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkbWAEQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222731F000E9;
	Mon, 20 Jul 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784577119;
	bh=mjX6FltVkNFu9OuhHkg7pgKk+Ej8tQeh9WxgwQwelLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fkbWAEQwNh9ZbPhykz+1GMPYBBAEYPLjDs7LXldgmrm/9trunRW+x3R8hWSX5r3e2
	 ZMXHv1FHYfWhDhe7AjHoPwmC3OdoFXByYRJNpqFbRIPz61uyL9z/i0xkh6c7RvZuSV
	 3ISVPV2gBx0/wcAlDSjKU4ZfBSkvtGn5C/WGkMA3EqIE5o4DQADhyX41/ufmvVcv6q
	 VoLy09qUP4xgUsh9zOt1DF50WOaSvEom8zyAvAueWwVxVhWojhimMcspvcwXQrfzJw
	 zkOH7Wbxx7rk8P+J0bquxwZCqpgTP7SAOqEsXoV9MA+z6FJWtG3ykNyWQiiGY9WzIN
	 Xs5KLRPpo/KiA==
Date: Mon, 20 Jul 2026 12:51:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH 2/2] selftests: drv-net: Fix TSO test doc
Message-ID: <20260720125158.75c982ed@kernel.org>
In-Reply-To: <20260702212248.358977-2-pvorel@suse.cz>
References: <20260702212248.358977-1-pvorel@suse.cz>
	<20260702212248.358977-2-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Jul 2026 23:22:48 +0200 Petr Vorel wrote:
> Fixes: 0d0f4174f6c87 ("selftests: drv-net: add a simple TSO test")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Trivial doc fix - feel free to remove Fixes: tag before merge.

Networking tests needs to be sent to netdev.
Please remove Fixes tags.
