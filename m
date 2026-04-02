Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6423559F5;
	Thu,  2 Apr 2026 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098497; cv=none; b=jBgYyK39p7ZqL5XA0Bx8BMAKcCX09DxcEowHQivnFB7kKIEox5SWKfInQOxrDgtkQS3y5HWwQhHDBytEpP1FW/AitPgL2kf6VitNmG7YFVn4RvuNjf1vSSAOXwDxWq+ISmWSFqPdklHKP7im3MWCHQJfev1Lh9WCtMTmtYK+bQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098497; c=relaxed/simple;
	bh=6y8m9lKrIl5oqGsP2iAAVKka5afAWJWZxkBTDRHd1Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=th4ji2dvtydBs8BcIpBshTq8OU4/4U5OFkVeEdDso8oDvffxjolN2WRcGLEye9ZoL9ueZIDZ6RDLQUGigALe49qhGT70g/havAuMNmgjAQIJsZf48pOZpD+zctfydXhKnj2dBRdGaAroaXrLDO2XWo7yxrbXYuXqjBKnkrMOhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJ9eLlfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJ9eLlfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C47EC2BCAF;
	Thu,  2 Apr 2026 02:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775098497;
	bh=6y8m9lKrIl5oqGsP2iAAVKka5afAWJWZxkBTDRHd1Z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tJ9eLlfTajYGCPQcAsEInjeUCf5cS9tbvNNfcgBJY4GVbjFsVZTUCcNwXi1Ky4/Jq
	 4N3i6NXG6RmVUdKs3yLa54LtCWq0F1yCfXkzAMCFGsabbWT5EaY+ys6JWdlvXL8mo+
	 jLaqml9Sqqy9k6SSu6H8jpUkNKj4Jc4A2bG71+cIZttkbh1pPzV3rK8Hi3Qly5pIlO
	 sOtglWv1iy+UWzHZG92tm1xADknKFqVOtwkUwTHL52Ik1IdXIQaUWNwzm8hnyc8YxX
	 qjGXKVL1CMMqgUZ9k6lIIpywzVTcZ19LBP4Dfb+LYl+IW13t37KGFDDKzDnQ/b6feC
	 m4PO6/8Ws7JWA==
Date: Wed, 1 Apr 2026 19:54:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, <netdev@vger.kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Shuah
 Khan <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>, Dragos Tatulea
 <dtatulea@nvidia.com>
Subject: Re: [PATCH net v6 0/4] macsec: Add support for VLAN filtering in
 offload mode
Message-ID: <20260401195456.6158e9cb@kernel.org>
In-Reply-To: <20260330130130.989236-1-cratiu@nvidia.com>
References: <20260330130130.989236-1-cratiu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Mar 2026 16:01:26 +0300 Cosmin Ratiu wrote:
> This short series adds support for VLANs in MACsec devices when offload
> mode is enabled. This allows VLAN netdevs on top of MACsec netdevs to
> function, which accidentally used to be the case in the past, but was
> broken. This series adds back proper support.
> 
> As part of this, the existing nsim-only MACsec offload tests were
> translated to Python so they can run against real HW and new
> traffic-based tests were added for VLAN filter propagation, since
> there's currently no uAPI to check VLAN filters.

Hi Sabrina, how does this look to you?
