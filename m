Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860FE29BDA5;
	Wed, 11 Feb 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774683; cv=none; b=LBE/cHM9uzIF7YirL/6aWQDFUORbObDQ4xCM5/IA9D7IbChd20Yx57RMNgk94k+uXLpOWJupCBE16+JLMWYdyyXwLdLAeNWm/vXNF/KNbrH4SMgF02AlhdB+HE7SwJIKW/Ijwm7ulAsCr4VCrK6bo0Gv3QhNl8AWYFQ9Br9gV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774683; c=relaxed/simple;
	bh=h8C9VD+IRSSM7yo0G0lTxSTIvniyCWQVHaaMz8OKIhg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLGRLvz1JMwb6qi/XJWPc2K813TYna5+Jo14od0oBK84MxFcmOeiCrvAjTdKRYWOJAvlNXwATPDzazX0+TQqEMiXW3LSsoGjQ5DGSgyCbn8OZ0+m4gGZ0rUfByutyVWFTli4mWNAdma0toWlPMDRX3J26ZFCuypTX1cuEOhSiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJrP44hG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJrP44hG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1E8C116C6;
	Wed, 11 Feb 2026 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770774683;
	bh=h8C9VD+IRSSM7yo0G0lTxSTIvniyCWQVHaaMz8OKIhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uJrP44hGfmqlpvasWX+aUwyO525f7NiWyLA75pJc/IJ5lPPiv9cSM2TwM8nO7tY+w
	 QFVO/09Y5Cto+lF7Joair/0ksy2lZCsWxjMns+czaWb3IA3LL4Jpk49GwYjpcWnJhY
	 EKNosc3Dwhl1BPMdLJhHNnsLYDjbKteS0cGRmIh9mXwT4HoBO4msITAHzzJhAjBEzx
	 Aucb0EpkVU9cbubNtQcYKmADlV2shrrzLDOsLKXXPHE/eHDMbv/aJ249653yoZiXMY
	 v0qQvPBrh5N0LpExu0C+w6FoxESgIMSYs3j7e6JItH0wGrrlY9mPv6FWQdozD/+JXu
	 VqbtxHrqnXGlg==
Date: Tue, 10 Feb 2026 17:51:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Chan <michael.chan@broadcom.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
 donald.hunter@gmail.com, pavan.chebbi@broadcom.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/9] eth: bnxt: gather and report HW-GRO
 stats
Message-ID: <20260210175121.174bd1e5@kernel.org>
In-Reply-To: <CACKFLimgibJ0qkM1AacZVh8MKKy-pE_AAc4KPKZ7GUqebmXW9A@mail.gmail.com>
References: <20260207003509.3927744-1-kuba@kernel.org>
	<20260207003509.3927744-2-kuba@kernel.org>
	<CACKFLimgibJ0qkM1AacZVh8MKKy-pE_AAc4KPKZ7GUqebmXW9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Feb 2026 16:09:13 -0800 Michael Chan wrote:
> > @@ -13492,6 +13497,8 @@ static void bnxt_get_one_ring_err_stats(struct bnxt *bp,  
> 
> With the new GRO counters, this function is no longer limited to error
> stats.  So maybe rename it to something like
> bnxt_get_one_ring_misc_stats()?

Ack, I'll queue up a cleanup after the merge window.
