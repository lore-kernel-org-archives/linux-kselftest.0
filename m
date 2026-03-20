Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F9283FC5;
	Fri, 20 Mar 2026 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023921; cv=none; b=AhtwnkDokOguHguFi0ecluBsfZdZvrPYKgFU4bdcGsqoC1ai02CAV0FQ3/C9uLjgl9aSWfth2MD+cVcWcvKofHc9Xn5gxSwrIwh0SnWf+qT1qgXUoqGaqmr3ewk5CEn7a2F20llPbq36t51a6DsWpxkrf2YUCRW1H2SV1xZg+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023921; c=relaxed/simple;
	bh=bHuwbjp9kelCEbT0gkJHOd0xzgAlzKyk7+5laXZTv6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGB5Ev+TN1Tbl5pB+QSh8MDpZp+Ux4nRYFK3XYNI0y+sg77evy895GssVI+EKAwZQXUYz6Ufn0soToNn0RpZf0gXdY4WurBd61Dy/48AT6jA66zzZVxrthMUC6Vn7yz20T+Ratk9eT/+KkMASrBc6+AeYolw/5PfAOGQVfunO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeK8UzL5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeK8UzL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6876DC4CEF7;
	Fri, 20 Mar 2026 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774023921;
	bh=bHuwbjp9kelCEbT0gkJHOd0xzgAlzKyk7+5laXZTv6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeK8UzL5ZNpNIE48WyOyaG5S5PR7+0YrrFehVbdRFS5KId3UN7yhELaUNw2AqOWXy
	 tnP31yd6ReYYCRwB0KEKvDQV7C6HYzCPyZvaXc5beY0/uHmHWYvE3Nr2aa00qk0IIX
	 ikq2s2J53mh55JE1kjbEVYueRk3336JnBXaZoYxLPa39dR4Wk8a5sMu37H/HNsmsSI
	 bWUiA+MEnKIL498LYcpj0XwMtTP4UGyEATG5W1zXM1SuVbgGZpl6A19UFvJI3LlaEM
	 p0gEXL5cmuF4fHwkjTeqYhZiFPzf4HX5gzc5wcHcszvoTyW+Z1yHCNlxdrxyRzD+U+
	 LYNA3qQB1Ze5g==
Date: Fri, 20 Mar 2026 16:25:15 +0000
From: Simon Horman <horms@kernel.org>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>,
	Ilya Maximets <imaximet@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Stefano Brivio <sbrivio@redhat.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	dev@openvswitch.org
Subject: Re: [PATCH net-next v5 0/4] selftests: net: fix false failures due
 to missing features and host interference
Message-ID: <20260320162515.GA74886@horms.kernel.org>
References: <20260319103123.146112-1-aleksey.oladko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319103123.146112-1-aleksey.oladko@virtuozzo.com>

On Thu, Mar 19, 2026 at 10:31:19AM +0000, Aleksei Oladko wrote:
> Hi,
> 
> This series addresses several issues in the networking kselftests
> that cause false-positive failures depending on the host environment,
> kernel configuration, or library versions.
> 
> The main focus of these changes is to isolate tests from the host
> environment (using namespaces) and to ensure proper fallback or
> skipping when dependencies are missing.
> 
> Summary of changes:
> 1. Fixes ovs-dpctl.py to return a non-zero exit code when pyroute2
>    is too old. This allows pmtu.sh to correctly fall back to ovs-vsctl
>    instead of assuming the configuration was successful.
> 2-4. Move reuseport test into dedicated network namespaces. This prevents
>    failures caused by port conflicts with host processes or interference
>    from host firewall rules.
> 5. Ensures io_uring is enabled via sysctl before running io_uring_zerocopy
>    test, preventing failures on systems where kernel.io_uring_disabled
>    is set.
> 
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>

Hi,

Unfortunately this series does not apply cleanly to net-next,
which breaks out CI.

Please rebase and repost.

Thanks!

-- 
pw-bot: changes-requested
