Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D728F40;
	Mon,  9 Jun 2025 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508918; cv=none; b=UKBr2iEli3sGX96MeSaWFMyg84yn1bKUbulf/cB7SaD7Kw6D6mzNJJ9yEjL82DOh46zEpUTTfw/RbXRZmfN1osfZGTnOXj6yJUfbFK9SuObR2G0nbW8biLLKOG8kaUbQxelQiG9+RaCiQweDDuJ/mLm+6xs0ZW72GtPzC3Brq1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508918; c=relaxed/simple;
	bh=A9RkGYnenM/e644E5tyORy3XNXJtCVB7yAqNOdiH7j4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RVXWPVhF/78MJJF8yPd3pw9St30li6j1sverXNl67wR41GesNX+vyj85fyL7qKcmxlL0cYzro4vjXRqzYI+Ei1H6rgubLwu2IH81W5m5D+f16wpVvuJLy4kHMkiJPACgFoYDHkoYdiX7BhbwPeyLqoCqcsMWAS7LM85xDynlu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3IioYBX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3IioYBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E58C4CEEB;
	Mon,  9 Jun 2025 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749508917;
	bh=A9RkGYnenM/e644E5tyORy3XNXJtCVB7yAqNOdiH7j4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k3IioYBXk7v/JFQx4MCV6rP/F9BMwPuEnwCS7vxLtFhkyTVFFP6BKjlk7nOK2QUju
	 wzZ8jt7zOJbea2fHgvE9gCqbppMn0fhZdjFBE46dQRXUGlTpY6Oc+xdB6Am413bewL
	 r5FC0KTOmgedMdbhZc1/575bHwxzsjCSXYeDWDiGvDr8XLlLiJuAPlKPPnVL5kgXIF
	 RVJkPyBHPTbVB7GyYlszxYfp55sTGMENc8sR/mEtdKVLYxJWtnR7UGWVqSPXS+Kj/F
	 SAv6p1DwHS6ZpakH/DNpGvbeFjnZYRar84goTXAK5L39Afi2zJnIv8saHob7BTaOki
	 QbwFfsl0RHgKw==
Date: Mon, 9 Jun 2025 15:41:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Joe Damato <jdamato@fastly.com>,
 <linux-kselftest@vger.kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>,
 Nimrod Oren <noren@nvidia.com>
Subject: Re: [PATCH net v2 1/2] net: ethtool: Don't check if RSS context
 exists in case of context 0
Message-ID: <20250609154156.76be9902@kernel.org>
In-Reply-To: <20250609120250.1630125-2-gal@nvidia.com>
References: <20250609120250.1630125-1-gal@nvidia.com>
	<20250609120250.1630125-2-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Jun 2025 15:02:49 +0300 Gal Pressman wrote:
> Cc: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
> Reviewed-by: Nimrod Oren <noren@nvidia.com>
> Signed-off-by: Gal Pressman <gal@nvidia.com>
> Reviewed-by: Joe Damato <jdamato@fastly.com>

Did you receive a user report for this change in behavior?
