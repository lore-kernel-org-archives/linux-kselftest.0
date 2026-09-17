Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED831A9F87;
	Thu, 17 Sep 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634737; cv=none; b=DBaw2kvwazo/e6I9hQvj0caF2JN4jCS5Kw3IGFt4JrnT4sSs3W8AFvt52AZ8ljtOgBI1lN3Y+/ekbtYzY1AaU7XC+ewXbUxidyBlLVGuoA7SrfGG8JGPKSHqLw7DX9ulqp3gVwggCNC7LH+caKTfkGarnB/QLQggCa0gL5CYsAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634737; c=relaxed/simple;
	bh=/YxHcR7zN5gHYIpkoz2YiXe4KtW2XdGZpXTkpQiNz6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtJypO952SIkUQOZKZdD4CkzWi12S/aX5i2ogOR4tC+RMhBtHhDa6FbX9LWTqs737juUK3GCxtrnG/JmGAQU5hCORrlVDieFhMePTC88Rp7xpa9erLasnbKM/waV7bYIIJNWhHq0pc6rAadL+Xd++A7QVjVkOgebfpqOCXTu+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tEy+qVyH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tEy+qVyH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=/orWYEYjJ/XUN6vi4dr/RnNj0Upv0OXsBN+4WrpgRzw=; b=tEy+qVyHRddSlKGnFScqu6JlF1
	tWmlmRkiQQRO7IAbfoh+ynN2dcrwMcoPE4+LU6zbUiE85Kr40dO52WuyyYLPbBLvSHtRsPjZAoE4b
	mdWnSmTn0qgUN7z3szeEQreXQMjHMFKnT4Q76cqAB9KIR8Ft8PeL9Di8YwcSwWoSzstL3JU9VvNd8
	N1kz9nSUJhDjYNW2tj7Mi59B0ixSLsUgkCFsWt/Zm0EqXDDPlAUD5hV5p30e/Aj2mCIrjNGeEA2ay
	z6bI8Q6jXYcBWiK+/ZFQErkN2/OHSShNZ1oEgVOLFsPs3Qd7MHmadvGljtn2lbYVXQFW1C+X7VYJn
	HC3Y3tmA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x77jw-005p3q-1V;
	Thu, 17 Sep 2026 08:45:08 +0000
Date: Thu, 17 Sep 2026 01:45:02 -0700
From: Breno Leitao <leitao@debian.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, 
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
	Mohsin Bashir <mohsin.bashr@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Dimitri Daskalakis <daskald@meta.com>, 
	Weiming Shi <bestswngs@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Tao Cui <cuitao@kylinos.cn>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v3 5/5] selftests: drv-net: Request larger zcrx
 buffers
Message-ID: <aquog1N_Br-ghrgP@gmail.com>
References: <20260915182105.4162425-1-bjorn@kernel.org>
 <20260915182105.4162425-6-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915182105.4162425-6-bjorn@kernel.org>
X-Debian-User: leitao

On Tue, Sep 15, 2026 at 08:21:03PM +0200, Björn Töpel wrote:
> The large-chunk test always requests two base pages. On interfaces with
> a large MTU, that may not exceed two maximum-sized frames.
> 
> Request a power-of-two buffer larger than twice the MTU. This makes the
> existing rx_buf_len check and data-integrity traffic exercise the larger
> layout.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>
