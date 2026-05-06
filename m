Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050A1DDC35;
	Wed,  6 May 2026 02:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034743; cv=none; b=EAZK+wTDVQ6vwvcJVwVUQETSdO0yza/wpRzzwBuzvVmdAgwi4XQpA65/BW7re/I+ISQvpehjbDwQ3TthThYghF3bIjtwy6Q/nte2wwgIj+ZCa2Rh2j13cVVYPegkmRP67yoJ+CeQ+CSoe48r5JRlcJL6tmSHA7X8ZRprBnuLUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034743; c=relaxed/simple;
	bh=XAALec+F4V6oORieFTH2XbQUd3O3ztDg2MoeA6kyey0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+gMdeQ12ZxuN1IAXJJPuLmMevhHMY2JBiJaUVDX3GIGynyENqFx/XMtVKAEqgdOhAAVb2hnaaHGosCAqsR1s1xPLosUvQeGeWpNmuthfOUfLFztgINybTCqQitM/cwWlxF72Xg+J7BJACDyHgKw3xUMsse3c6bZG9qEDpCChiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYoCjKh+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYoCjKh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099E1C2BCB4;
	Wed,  6 May 2026 02:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778034743;
	bh=XAALec+F4V6oORieFTH2XbQUd3O3ztDg2MoeA6kyey0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jYoCjKh+yENrUeIcM548KfhXbSq03G353XXnRZ9OfisrRW1q0jFbfAIjXgiCgGWhI
	 f4hB2zGoHDEVQfJn65iLWRhL9f9aK33haeQ/fZjImo9XhH65Cm/0v1m7biTqdKhpBL
	 udepx0cSuCVzDRMpF3URovl6CPpWqo11IdHaHVpM9olZ1a3jVVIKqYVkC3+eHxd/4A
	 bp/Enq2/HtHOGQpmj95znown/gQE0dc34XNTEtXhJRV1V6DIG3qxPkNKuk1ZllRSeb
	 Mmt+jLB3SHR6ZuZQwzF4qmtCreT494D3KAnIxnqFuIB/RFNqNzut/7/9ZrHZALEZOM
	 zrpeSM59zjeTw==
Date: Tue, 5 May 2026 19:32:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, donald.hunter@gmail.com, ast@fiberby.net
Subject: Re: [PATCH net 09/12] tools: ynl: add scope qualifier for
 definitions
Message-ID: <20260505193222.429a3ad3@kernel.org>
In-Reply-To: <20260506000628.1501691-10-kuba@kernel.org>
References: <20260506000628.1501691-1-kuba@kernel.org>
	<20260506000628.1501691-10-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  5 May 2026 17:06:25 -0700 Jakub Kicinski wrote:
> +          description: |
> +            Visibility of this definition. "uapi" (default) renders into
> +            the uAPI header, "kernel" renders into the kernel-side
> +            generated header, "user" renders into the user-side
> +            generated header. When combined with `header:`, the
> +            definition is not rendered, and the named header is
> +            included only by code matching the scope.

Clashiko says I'm not implementing enum handling even tho 
the param is generic. True, but intentional. Since this is 
primarily for policies I don't think we'll need an enum. 
We tend not to implement things we don't use in the code gen. 
I implemented header handling here (even tho it's not used)
because I think that part is tricky (read: I would have forgotten 
the plan/thinking if I didn't just implement it right away).
