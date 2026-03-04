Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481AF513;
	Wed,  4 Mar 2026 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582856; cv=none; b=NN/rpq2VnnVjuFMbqxkI6F2b+BDc5yDsxQnFhI0r3DItPaNdCuY6PLQKDcpqgReVNuhxHpiEgrACoK16knytyOlASx3ZnZa0PuOKXaHBlif/rGu/uGZ4IIyaJJG6khB4J7zmeIrpBnvCfeDcsqGsxLqPJULDxvCxFZjC76fVcOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582856; c=relaxed/simple;
	bh=PH/bBb9YuapmtJ5CDJ4GuQpwu++vN76bDAchAeNUtx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKrNtQWTp/ZUwD+5vHwJmAnhq/7dvRsrjLtnpqdEnrTOU7n44DW6Cznq+BNStCqpwLYTnOtS4OiB/+G6uZtIFgJs4uensN0LLIrIiacC/Q64+TK/fUBp8uarUM1k+Ng2xeFmy4s0aE0T8FRbUz5N7nfcZ3XUEUL6HA/i46Ch5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obiVGJyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obiVGJyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5646C116C6;
	Wed,  4 Mar 2026 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772582855;
	bh=PH/bBb9YuapmtJ5CDJ4GuQpwu++vN76bDAchAeNUtx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=obiVGJygzjQJUQfowtzziDiq7mbpWNIJTS189cBFiXD17e5cciSoxwSoJ4ZlDClDm
	 zvbRsmVP0KRXq+/se93mr849ieVaHxAdOlvEv28uYZxs2kmzD3Rabj2+tkvVq2Wl7Q
	 ODTAJKslAPMUVLsxyxQ7Fv49kQaRRsTpCMbyHHk6nIl5EKI535A091A77UWFw49nUN
	 CHWx2u+51vxkoa/Huk0doTZ63Ikwdg6ES6huhfjMGolDo8EPw9yO8ye3nGdCt56cxG
	 03CqF/Sk1ye72HBWxUul/pyLCMgw2VoukUTmPyBBHYswh6/ndV5/90NCvmP4gYhwM6
	 Ipfzp3OCWlYqw==
Date: Tue, 3 Mar 2026 16:07:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi
 <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next 4/5] selftests: netdevsim: Add RSS indirection
 table resize test
Message-ID: <20260303160734.2cbe3c90@kernel.org>
In-Reply-To: <20260303181535.2671734-5-bjorn@kernel.org>
References: <20260303181535.2671734-1-bjorn@kernel.org>
	<20260303181535.2671734-5-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue,  3 Mar 2026 19:15:32 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> Test fold/unfold of RSS indirection tables on channel changes
> using netdevsim:
>=20
>  - default table regenerates on channel change
>  - periodic table folds on shrink and unfolds on grow
>  - non-periodic table blocks channel reduction
>  - non-default RSS context resizes on channel change
>  - non-periodic non-default context blocks fold
>  - table and channel count unchanged after failed reduction

netdevsim-only tests are a thing of the past.
I should probably update our documentation to reflect that..
