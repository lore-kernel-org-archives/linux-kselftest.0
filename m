Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F823E0241;
	Tue, 15 Sep 2026 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489193; cv=none; b=NXrwgvG2aOjM3rAeYkYKbAootzkLEP0+5EC2HGh5HYLHczFiN5mIlx+bFTcq99tOjgNLoZOe8Kh2awaAfHiUOvtFiJ/RosI5vwbwBBxRhmTlyVW39j4qBtomB+EHCVXtkQwHlcaRjJPzBP5FEvDkWgFkEv9aFxPOLhZDV2xPDYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489193; c=relaxed/simple;
	bh=LG3AHBUkxXta7iMioSPYx+Wv/dAvKJEcfQO1si2uq/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSZICIrVS17tyvdnKezEVYyUWK83z+WbrULJd4fLboU3OkBBySYHbnzAGFIyWr55plTGQ5z4hsv0eDFit52I1ESdYGdELVt9rlO//Z0q5CPlg4DTiPBdFDiyh7oNiVTsrHUybGOp5NKPZnwJz6rCNqnN1hRAr9PQcahiUSCh/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+OT1S+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+OT1S+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72DF1F000FF;
	Tue, 15 Sep 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489192;
	bh=0W9GkyoRNPxgn5jl7gLJyXFPHqbh2S8h7IAjHgNCKTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H+OT1S+bdVOlxckCBBL03yONmT5APZ/6oJFfFh6yW9aF3sOJBSsU7zDUGc23yUxog
	 5oWsWSx60XxZok70tUGi0kzjkR03Lb+9KQd9YHoTc2z4PmmwoJxJQGpeasnbHohAXx
	 3YzWOchNj6W2zCLC2nwJeOEgo3T2bv4roNFLyF62iJt9+gNsqsNud2R47dMYdKxOaf
	 XP8XDLke65GaZLClw+s1cYjaawzDEL3qStu5wLiahZoM5VBsADvQH3HVyWAZqOuI2b
	 2E8NaNGw5Xz1NKhBb89HjU0xAgTyBCogAuTAGkRMItHouGs0Jc29mPQnBu4L5WpYCX
	 LuDA1w/qqHHTA==
Date: Tue, 15 Sep 2026 09:19:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 daniel.zahka@gmail.com, willemdebruijn.kernel@gmail.com,
 donald.hunter@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 6/6] selftests: drv-net: psp: check the PSP
 disassociation notifications
Message-ID: <20260915091951.5b440d9c@kernel.org>
In-Reply-To: <178945226574.22033.964225107132506366@kernel.org>
References: <20260912200426.121025-7-kuba@kernel.org>
	<178945226574.22033.964225107132506366@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 06:04:25 +0000 netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> 
> Does this block actually check the property the commit message describes,
> that "a namespace which still has another association is only told about
> the change"?
> 
> _get_dev_ntf() returns as soon as it sees one message for the device, so
> only the first guest notification is inspected.  If the kernel also sent a
> dev-del-ntf to the guest here (i.e. still_visible in
> psp_nl_notify_disassoc() were computed wrongly), nothing in this phase
> would notice it.

shrug, we can write inf number of tests here
I think it's good enough as is
