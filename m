Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2C42A9D;
	Mon, 11 May 2026 00:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778460140; cv=none; b=JuUkGS4pzIuW9EunkVeNBUEVOgVkJRYHG7HZtAJEW6Evc+nfjb/OzB2KIT++kXrQN+JopgJk3uzlsFyMgVf6Y9h+HBAPjuVcy2iEbxii26QRMP7c08Jws1VstE5aJX0e75XGtj3a69dD3OJHDk4hnNTEC+cJEsYxsDZmJ8c/buQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778460140; c=relaxed/simple;
	bh=9rUKkR0erbor0suC4kFXyAGwRJCbVzfR/ii5ArlAwVk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLviE9uV3qHqepe0RTqEpCchMJUSfThUKANj4K0zb+3MWtF6usclvzPSC52caXBW9qEMBDAH4HtNDgm/ecdno18ota3lKFRNL9qKaSdw3CQbOQN8O1/8umZJFLspOaqiT6YY35V9MHf33BdNGV5EPkbLjvMc5u3XuLamvI+gKTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blszMWad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blszMWad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D79C2BCB8;
	Mon, 11 May 2026 00:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778460140;
	bh=9rUKkR0erbor0suC4kFXyAGwRJCbVzfR/ii5ArlAwVk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=blszMWaddQSHfrqiSHb6kWo+Ge/hRAeDAOSf0DbFp2Sy1FDnL5ZYQOuiznI8xkp+j
	 nF+EcyYo3gxMTaYSUnvGvGE2vR2BuOmLH75g2qJhzvpl47S8PVo+XYsm6IBi5dLZ02
	 +VuIDUHdk+KvcsNnoSqJwOXt9ik3PQlfTygOlGtldXv9CQ5srx5wiCwGkZuSD+5rDL
	 B2TTcoqk503lOgoaUOVnPcb7Dbf0iNnsBywx3WC6M9yJK0IMA0GSFQbvZpodnemAWP
	 EQdTReHB9MLMherDhUMfng1s362vw73thH7hohvXOT8b9INymTLX1V0hjG5t7uMnUg
	 d9DPfygT4VeQA==
Date: Sun, 10 May 2026 17:42:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v7 0/3] selftests: drv-net: convert so_txtime
 to drv-net
Message-ID: <20260510174219.74aeee6d@kernel.org>
In-Reply-To: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
References: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  4 May 2026 13:38:31 -0400 Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> In preparation for extending to pacing hardware offload, convert the
> so_txtime.sh test to a drv-net test that can be run against netdevsim
> and real hardware.
> 
> Two preparatory patches
> 1. support negative tests, where tests are expected to fail
> 2. add a tc helper 
> 
> See individual patches for details and detailed changelog

Hi Willem! Looks like we have some flakiness here:

https://netdev.bots.linux.dev/contest.html?executor=vmksft-net-drv-dbg&test=so-txtime-py
