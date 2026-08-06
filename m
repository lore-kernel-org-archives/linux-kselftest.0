Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673334FF45;
	Thu,  6 Aug 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023056; cv=none; b=qI1WWLoNkDbyC8tF/q9R0689Q9YmuC5W6OJi8WqNyekaPKubk1QRO/qxT+dAhA1CXfp5zaeTimkqzA4KzNZeP64kqUWARPXU3r7XnqgS/JNVc9AUbB6TgYDRYjAwZDI86iPCQkbdb/GmxDXbw0aF1tvv8Ci8n1bRSz2p6zPqHgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023056; c=relaxed/simple;
	bh=VYjcayaf82EBVxfRHw3MteePSy6opawI00D+czBJciw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFCeS5AyBtUF9h4rpgbnmUT5qw9NKmTUm485N4Ca/ZiC1LI3wPBjoqA7+NwW4klIymgFcUs4SVIeNpr2E/TAiSpiNxn0goBIbfBarHReAx9dbrTH19eLW6M2/vjEEDDPjBFPyjM6yENiwftpNCeQWFtDJK+LOWft8O1TgXAON5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iur2PHd2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iur2PHd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1B11F000E9;
	Thu,  6 Aug 2026 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786023055;
	bh=zglVeMhrEKOt949oNFETtc4fXXH+uifvKhCSItLdg9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iur2PHd2CxUniGa/c/u3g+WFZowNrkR/n1cWzow4XiotABGIz/CyLvybYbDGV+/E/
	 ZMWxv8Q7u5IE786JV2/7w5ghbfckToCUwXaxFXKW7zGFazkSKsXDScSVPR7jy1yDai
	 PbYtau+UeZ2mT4VcHXgFpaz4npPLDX/gdupYm4/l8JQd8ACbX67cy/F9NE5IXXuk6F
	 wqZOlC6t/nz1UIEUTRh/+hOUtH/xC54D73S025ADjS8gwxisuUqXk8DHsgyUzjQUx1
	 5xolGzL783P9cVHvYPh+wk70hADSfHgy2wvSoaW4LPmGwy3Da5wHUX57G8fqGP9UHX
	 lLWQHV93Ao6wA==
Date: Thu, 6 Aug 2026 14:30:51 +0100
From: Simon Horman <horms@kernel.org>
To: Brian Grech <bgrech@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	shuah@kernel.org, edumazet@google.com, pabeni@redhat.com,
	kuba@kernel.org
Subject: Re: [PATCH] selftests/net: fin_ack_lat: fix latency threshold typo
Message-ID: <20260806133051.GD51943@horms.kernel.org>
References: <20260731145914.4014912-1-bgrech@redhat.com>
 <20260804220108.1630366-1-bgrech@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804220108.1630366-1-bgrech@redhat.com>

On Tue, Aug 04, 2026 at 05:01:08PM -0500, Brian Grech wrote:
> The FIN-ACK latency threshold was written as 100000 (100ms) instead
> of the intended 1000000 (1 second). Connections completing between
> 100ms and 1 second were incorrectly flagged as high-latency outliers
> and printed as failures on loaded systems.
> 
> Add the missing zero to restore the intended 1 second threshold.
> 
> Signed-off-by: Brian Grech <bgrech@redhat.com>
> ---
> v2: Added missing maintainer CCs

Hi Brian,

It might be nice to include some information on why 1s is intended.
But I don't think that is strictly necessary.

Also, if this is a fix to be backported (I am unsure) then
it should have a Fixes tag and be targeted at the net branch.

The above notwithstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

