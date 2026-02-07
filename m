Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC5817C77;
	Sat,  7 Feb 2026 04:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770438628; cv=none; b=pddrQ/aa5faWYFrw09R2+96Ys+9swPquMSxormtl2qi5m8COg3dra323CICHcnILPnH5VD30aecWnPij/pgpPXkZfQqLHBMp5dSPJK/1gwOCKqyZGcTFf+9tdupnwZkOAC7WVvYLt/iDrvfbdUJ/S5b3sVnx101lwsITkFfSazA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770438628; c=relaxed/simple;
	bh=yc1QvtSmrzihVgBJi8fSvWwj0z6hSGeFt2ybPbzQi2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQKpRsDYXf/HdqYEtK70kReKq2672qIdy/uLCK6W9oqm3x0w5MoluU3N4N+RwYyJffKOffj4Hn1pQYlZuvhwqBarPpGuh1IqbDFk9dzJRIL6BGbvAZxjSzJwMdiQW0LEkEU0I9lw9JL4+paK0ZUcFixHkj3RoDdYqfsYjw2cXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyydyThB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyydyThB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3B9C116D0;
	Sat,  7 Feb 2026 04:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770438627;
	bh=yc1QvtSmrzihVgBJi8fSvWwj0z6hSGeFt2ybPbzQi2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dyydyThBsi/9eUcex1HssHeDJUdjJEQW4yYhLUZGT6yUk3BOt1/8TEzuLecKzQN4Z
	 ha22SSBRERfiSGe7WI5rWpLyx5ey5Yk2ESWjDVFl+Yt8xWOd+nYIEficD9zZcnPT5O
	 zM8wlwWK/KOaxDiIoVXtaqNulNiiKEJ2l8vos+jhkXIiPCVwuAsXBlOQKwgRwndMro
	 FRB259JjcKw78+uPDhi70QglLi0rG64UT18JFDAwWywS040j+AIEgn4FpomZtDw3oZ
	 /9qD6oYEk+lZoBvHMO3Hj4+jyixo3MqAjEZ8C33UtaaSFxC3MPZD/W3GyQQ8HbHKF2
	 bVxf1Ia0BCGIA==
Date: Fri, 6 Feb 2026 20:30:26 -0800
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
Subject: Re: [PATCH net-next 7/9] mlx5: psp: implement deferred tx key
 deletion
Message-ID: <20260206203026.2bb64661@kernel.org>
In-Reply-To: <20260204-psp-v1-7-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
	<20260204-psp-v1-7-5f034e2dfa36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Feb 2026 07:20:11 -0800 Daniel Zahka wrote:
> Implement the deferred tx key deletion api. In the case of mlx5,
> mlx5e_psp_tx_grace_begin() records the number of wqes retired on each
> tx queue, and then mlx5e_psp_tx_grace_end() returns 0 only if
> all tx queues have advanced a full ring cycle past the point where
> they were snapshotted.

Either Friday night enlightenment or I'm very tired -- but I wonder if
we can do with BQL, without touching the driver at all?

struct dql {
	/* Fields accessed in enqueue path (dql_queued) */
	unsigned int	num_queued;		/* Total ever queued */

...

	/* Fields accessed only by completion path (dql_completed) */
	unsigned int	num_completed;		/* Total ever completed */
...
};

These are free running counters of how many bytes were queued to 
the driver and how many driver finished xmit'ing.
