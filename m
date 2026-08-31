Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD337C0E6;
	Mon, 31 Aug 2026 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214005; cv=none; b=Nyk5gQwVkPSmAfzF7kHnLvLePZNfx0OGbZe5cJJbiGJYCv6dzHc0clJO1DCmyDRRkc6SNaiPc/dkb3ZJTtWwbycjZcfcrJXbaUsZUgnFLTwSE0tcWAlTAha5fahBjUUQUd4bH0/LGNhqtVrdrNHQgHDiDO2g8PCOZMCplraTkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214005; c=relaxed/simple;
	bh=IaqMGbPmGisOKXskmdmuAHCaJE7Ee8mVtk+annvvKBc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlFZM2tPzLROe10XDnSrcQ3x1DKkUyVifRIFhBCYIJe7a9G3w3DkscvDI/JbctVehjcDD9DG12y1btMZK/Qz2uHTZcw2p1/bvpLDd3MviEI8hBAu7c2aNOl366N6c2FQScIyMk2nhx911rDrybCmVtvFjax4/Phf1eI/ZvjC0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T67JG4M1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T67JG4M1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873721F000E9;
	Mon, 31 Aug 2026 22:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788214003;
	bh=IaqMGbPmGisOKXskmdmuAHCaJE7Ee8mVtk+annvvKBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T67JG4M17TXT8LPMN/fYV0nlBZTsxivLP6naMwzZvVYlN+6t01ISaREfxDwCo2ucP
	 N1t2v/6A8PmSkJhE46onfuCu3PguAo8nLeOFwiNWUB9fCrL9R5xBdf1ucbaxXUOPiA
	 j4lTn4Tff0Ca775uFowkTxQJ4+tujrMQpaJ+tP7cHW1ykMms8vtXXAhIJLW1Fpn8Lh
	 E0I09U/4ndGPFRp/YBecGY2q8XAmnV/DPcuvy9VsdzoPmyh8Pls97OYHCv61QoU4BK
	 rIQlUoaJEPBtdA8uRCEUvIIg6906MK5u5f0w6XgZZsFuUFfEb3oi+ApyCYnYRT3tRy
	 mtypapqfF7Hxg==
Date: Mon, 31 Aug 2026 15:06:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next 2/2] selftests: netdevsim: add speed testing
Message-ID: <20260831150642.68f28691@kernel.org>
In-Reply-To: <20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
References: <20260831-nsim_speed-v1-0-7a651ee65738@kylinos.cn>
	<20260831-nsim_speed-v1-2-7a651ee65738@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 11:28:11 +0800 Hangbin Liu wrote:
> Add a script for netdevsim speed test. Make sure the speed and duplex
> could be changed. And the speed can't be larger than the max speed.

nak, this is not a meaningful test
