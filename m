Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B43630BA;
	Wed,  5 Aug 2026 13:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934863; cv=none; b=DYtF8J4iq1Rqn/SheY8cOi/8dlxDIAbXC203rbBDDnzGyIlz2bXdqnTfxj1rpfl30MvoDJ/jy7FpxekIWW6p7Sk7wW/a6gT8taBwWIu3EYqSAYs7lJSmF/yA2pn/yEJPGPoz7bs0ydWQS6XQ9dS5QPV+NWhcvpoZg/quKmASyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934863; c=relaxed/simple;
	bh=6797O8UsSKfdiClm/nJAofvUkK03lUBj0ZZOnQ7J9lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeCzZJXyEEarXM3rcVDvZexpMBaISH7vp3WvcZCT3Fr/lKmtACBUncDFcoVtRfT5tpdBOoQJcohDxbqvWzsmU99uU4mx3/LGaQjjhzu2tK+65ZwKDX644w+Ri9eACwAUa100GfghO1tMeIyue/DpoIxZj/riUCeFsYvNw4RFtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cakbcGte; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cakbcGte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536041F000E9;
	Wed,  5 Aug 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934862;
	bh=Ct2K7CjxRHwzwAT9YlsGpjJ4XovutUH2Zu47WlBGjIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cakbcGtexVEpJZAEU/aL6SeW1kYHr8a25veIcXoWDSYimqhamrcms0Aqc8PrVGQ+Z
	 0jmfnE72j9U/yK8kGoGIeFNYquioXng+GepCHRGZGJZ1/QzsQf6zCx5ZIgzMutg9Ll
	 VcjfGBr2yViprkNmtv8d7UtPpKZT7FG1IMMFl3TqV7ky8AU41n84rB/FbqFu6egdZN
	 6ueugtfcl7OR2qSZSKd7crevqJGOWGEjWWPxME5SYuD2QJUf/i5nFlnrdOYb+MDffh
	 NFZrNvgaJFmx4YJuqUHRzbemZTesds+4SCkJQi0z2pf3PWkepMfM4DGQgT0Zu7UXhL
	 XLI1njJfDG0/A==
Date: Wed, 5 Aug 2026 14:00:58 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shuah@kernel.org,
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
	bobbyeshleman@meta.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: hw: reset HDS mode after
 netkit devmem tests
Message-ID: <20260805130058.GU51943@horms.kernel.org>
References: <20260804151040.2755153-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804151040.2755153-1-kuba@kernel.org>

On Tue, Aug 04, 2026 at 08:10:40AM -0700, Jakub Kicinski wrote:
> HDS mode has confusing semantics. On GET kernel reports
> effective mode. On SET kernel expects explicit config.
> Effective mode on GET means that we know the current
> state, but we don't know if it's a driver default
> or user setting. This matter because driver default
> can change automatically when e.g. XDP is attached.
> Explicit user setting must not be lost.
> 
> With that in mind, we can't restore the HDS setting
> like we restore other NIC config. We should always
> reset to default ("unknown").
> 
> This fixes an issue with tests running after the devmem
> test not being able to attach XDP, e.g.
> 
>    Exception|   File "./xdp_metadata.py", line 105, in test_xdp_rss_hash
>    [...]
>    Exception| net.lib.py.utils.CmdExitFailure: Command failed
>    Exception| CMD: ip link set dev ens9np0 xdpdrv pinned /sys/fs/bpf/xdp_metadata_test/xdp_rss_hash
>    Exception|   EXIT: 2
>    Exception|   STDERR: Error: unable to install XDP to device using tcp-data-split.
>    not ok 1 xdp_metadata.test_xdp_rss_hash.tcp
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

