Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7691DF273;
	Sat,  7 Feb 2026 04:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770438259; cv=none; b=njb0ezCkLbwmOKekKkfgov2UK42czfDyuse+4cDqSzO9UBOQ5d85viub01SH3b5wpwNQhJ4lo3lWKum+C4uwtRx1a4B9zekYT4xhpLuVl3kp7p809Q9eEDTDZAjdRywdoYd5FiNnw1Ymvf3fKnZh/lZOZKfIL00EcZ+lgWTvP8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770438259; c=relaxed/simple;
	bh=VqrxlTtl2oh2vT8sllo0Q5eg2Aasg80utLw+mVh/gp0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OP/fswOjDKuncHLFLCu16n70hyKA12UD4n0Br+qmVgN94xWuQCZ45Tlmb22Nk0R2YIp6hSNH1qcWGM7gO/IRbS6rdmMyTiUO3dRnn8r11OmfukLDpxCpz+KBkNtIkTBdSFmkgl3PgnN7ul/pTXc7TTHG9KkVrRF6noOHIsJPf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM8Pi+k6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM8Pi+k6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D9EC116D0;
	Sat,  7 Feb 2026 04:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770438259;
	bh=VqrxlTtl2oh2vT8sllo0Q5eg2Aasg80utLw+mVh/gp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QM8Pi+k680yMWUC4Qm7nTww7qTpzSyOGUqJx0qNQPdSda7LagoPiKJ1q9qWq3u4mJ
	 tVBH+pTsIYDWaiIXHSohdvKgWUvS6k1mqEmRiR6248vS7zachktxgvv4Nqm8esVAke
	 risPRnmvjZ4AOJLntl/yxP+K2QOxKcsQ8jEn0jc6gMn6OLmb43z/BxiAf0JT6tBKzU
	 qA5VA1HWp+ebWG1SvCIMbe3JGB7pI+AHvkDa0y+s/v+WhCbvUh/Yx8OOHLW8lLGfJd
	 WNRWY/0D3Z6mmp4xAIPqm3cnooHBnayFGJXsTcSl4OX57vubmHls90xEyoZLfNeON/
	 Rgpv6GNmB1kzQ==
Date: Fri, 6 Feb 2026 20:24:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny
 <borisp@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan
 <shuah@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/9] psp: support rx rekey operation
Message-ID: <20260206202417.67b1c48b@kernel.org>
In-Reply-To: <20260204-psp-v1-1-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
	<20260204-psp-v1-1-5f034e2dfa36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Feb 2026 07:20:05 -0800 Daniel Zahka wrote:
> --- a/include/net/psp/types.h
> +++ b/include/net/psp/types.h
> @@ -139,6 +139,9 @@ struct psp_assoc {
>  
>  	u32 upgrade_seq;
>  
> +	struct psp_assoc *prev;
> +
> +	bool tx_moved;
>  	struct psp_key_parsed tx;
>  	struct psp_key_parsed rx;

IIUC think tx_moved is going away in v2, but please double check 
the layout here with pahole -C psp_assoc. We the fastpath fields
in the first cacheline (or two?) The tx_moved the way it's placed
would create a hole, and hopefully for success path we don't have
to check prev at all.
