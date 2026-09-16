Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94503438A8;
	Wed, 16 Sep 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570692; cv=none; b=bMz+Pc04aF4nNmDt4aAtDUH2uuS+ZENIsB7nELQZlIRmZnRosPMYuWrYupWnuBwSF2kTALq48N8KOj+g6ZHGC6nZA3h+qx5WIqT10PZIBSVuUNuwVtEDAJLtxF1st1x7tXLhfUrvXA9TVP780O34mdoo1oEyJVp2kEriQcM9w9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570692; c=relaxed/simple;
	bh=kBbz/1QiuJGNcnEAr/B924HNmHCIr8y68uIu/h47y3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF5TgbgkujyPPv8BzXnuO1UqK7ClrRKCEi4/+5fy5P4IRMSgoA4fHNuLUUz9Yro/1aTx771ja7k7wR95Ih9lTKh/dTCezGa8ykD4G3e1Br0puXUHnuLvneY4Xqueru2409vAQ8QFa5AJTLzBUT+P8y2XGBWqq2B5HuZTDAJY+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=jkUM4wwF; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="jkUM4wwF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=COLNcUPhaHuPoajOa2w4xGx9z5aHzLkyXlfhaui+CKs=; b=jkUM4wwF4qX9VYbmbmn9giecw6
	zdWLghQUxeH9Qvy4NpoMdKWVeMNd51R6TH4iqTPESpQy//eqxP9r5jWLO4ZEpmMLX7PJlzAR93hcd
	3vprsdzTd/QkBycGhsxSi8V9j/4nH3OfiXtxVPEmvTR6Aq1aZL8cqC950fJXDh2TNvVt8ZrmevHZH
	arqQHmhkNvrNmnW7CKE8NZmGOoDh0SzJ2eMoo5qx6EfpdqbVIkS9x/hJy+jZ74nZO0KX50kind+Hw
	T7/1TwoCgQTLcDz9IPmfUBvv8gqHsoNOiJ6U0UvGisNBn69VEJMmhmua6zs3dANQaDwI3Tn7AuVGY
	qFPeetmQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6r59-005FPv-1N;
	Wed, 16 Sep 2026 14:57:55 +0000
Date: Wed, 16 Sep 2026 07:57:49 -0700
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
Subject: Re: [PATCH net-next v3 2/5] fbnic: Track BDQ device-page geometry
 per ring
Message-ID: <aqqr78J1hvl39stV@gmail.com>
References: <20260915182105.4162425-1-bjorn@kernel.org>
 <20260915182105.4162425-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915182105.4162425-3-bjorn@kernel.org>
X-Debian-User: leitao

On Tue, Sep 15, 2026 at 08:21:00PM +0200, Björn Töpel wrote:
> fbnic derives the BDQ buffer layout from PAGE_SIZE. That decides at
> build time how a posted page is split into 4 KiB device pages, and
> uses the same completion decoding for HPQ and PPQ. That is wrong once
> the queues use different posted-page sizes; completions must be
> decoded with the geometry of the queue that produced them.
> 
> Keep PAGE_SIZE as the posted-page size for both queues in this change,
> so the descriptor format and runtime behavior stay unchanged.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
