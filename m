Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6B3DB314;
	Thu, 10 Sep 2026 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036111; cv=none; b=qJ911sI1zeXuNFXBkL8OLuPIDIJmDd7EOcXZIK9yyTNs+FokhUHEgwztpxsuJ/emqEbWqjD8DEErx1O5sLHmV6XeDIqy/pKF5oxom4Gzl22W8h7hfKsdO364w6/spV6Jz/th6Hqbv3qVK3JOVIv7ssTpI45PqSxr3sNnqNoV4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036111; c=relaxed/simple;
	bh=n1rn5UIdp0sIJc3aMPmwtn1sRSeosj2Amu6cyL1HsHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToYusmL7z5npuwqe3CvJREP3hVsQX71DbIuPCuTC2tX1m0Jm7nRufvxDFvul8UmXZpAsPooyI3an5IDTl3LEwAOohP7hAVa0RiYzbWZ9dWc4Fw+CgRRu4VTiSnem7NOaXJHxAST/3lh+4WifeZ+QfJ9lz6PmDMBITQ2AGjr9FwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFNyVKhI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFNyVKhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A3F1F000FF;
	Thu, 10 Sep 2026 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036109;
	bh=42m/xcb4QGdzKXp4MOeAQAu8xnLeUjVel5+q/FCL39A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFNyVKhIhYeAP2D+ACMAAF/PssJCJjppnjWQpPJsJSi6MlZR7quI1xC0K5/bPazqJ
	 0T30N6IEh7mM0HiWihFfer0m3Tc7BTuCOu2tQtVB1LRruB6WR4yKqPPE5SmYbdwdsD
	 BfkGsZBpzuPDdO3RUUEjlcViyG7uYm7rjsCZ9TSBJFCbU+boV34kg0SysEUC2SrO6H
	 kRCJ6zuMZcoc1bbSd++p6YeVFWqE/rMXF6FhUBmdwP0UU98rbTGHOIPN4E03hF1//v
	 Bc+MqsKpvlnxb+YsrCJgEe/jLnmpR2mUfZYm1fhQ1pj59qXQgfax5UZS7+Nu2L9zQ1
	 4NrJkVksvtWRQ==
Date: Thu, 10 Sep 2026 11:28:22 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 03/10] net: broadcom: fix typos in comments
Message-ID: <20260910102822.GV40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-4-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-4-hemanth.selam@gmail.com>

On Tue, Sep 08, 2026 at 10:55:55AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

...

> diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> index 9580ab83d387..28ea4a33f245 100644
> --- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> +++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
> @@ -280,7 +280,7 @@ enum {
>   * (db_msg_sz 1 << 7 * cid + 0x40 DPM offset) it can come up with a valid number
>   * We must avoid coming up with cid 8 for iscsi since according to this method
>   * the designated UIO cid will come out 0 and it has a special handling for that
> - * case which doesn't suit us. Therefore will will cieling to closes cid which
> + * case which doesn't suit us. Therefore will cieling to closes cid which

I'm struggling a little with cieling being used as a verb.
But that aside, I think the correct spelling is ceiling.

And perhaps closes should be closest?

Maybe we can fix these while we are here?

>   * has least signigifcant nibble 8 and if it is 8 we will move forward to 0x18.
>   */
>  

...

I don't mind if you don't want to re-spin the entire series just because
of this. Either way:

Reviewed-by: Simon Horman <horms@kernel.org>

