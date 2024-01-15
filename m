Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563117568;
	Mon, 15 Jan 2024 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp1FDR+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32566C43390;
	Mon, 15 Jan 2024 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705326939;
	bh=djgWwem4qCxarg6wDj2p3wTiuP0C+g8jXSsSziIr+a0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yp1FDR+UnquRFpzt0RTGmA37Y2AuMezzh98SbZnyiVZAJpWXZ7b+D8EDBGZYGo34R
	 HPdCrQ+QS2Mh6wCm3UBK41nPtlr2pGzIelvhaeaLngCDMLb9RW5bAjEpGaRscxAlrr
	 QcSpBh5d8W3Vsqpe8VaYZWLChEP07+9/vdrXkpN1MLJZM8+3PY+Ihy9R4FedK6EB5T
	 iui9Eb/PIdPvmnF9jrAHsPBB1xd92D/4z+KRI5F0LzMeObaNRTD14F+O7DW0sJ56/J
	 GLgek2VNufgBu8rUDSBfgYNysdPIynAeuj4Vhszcn6G19g4+tN/Ca4kTE1Dh13cnV4
	 LB8/qCZHMKsKg==
Date: Mon, 15 Jan 2024 13:55:35 +0000
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, shuah@kernel.org, saeedm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: netdevsim: sprinkle more udevadm settle
Message-ID: <20240115135535.GA432474@kernel.org>
References: <20240114224726.1210532-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114224726.1210532-1-kuba@kernel.org>

On Sun, Jan 14, 2024 at 02:47:26PM -0800, Jakub Kicinski wrote:
> Number of tests are failing when netdev renaming is active
> on the system. Add udevadm settle in logic determining
> the names.
> 
> Fixes: 242aaf03dc9b ("selftests: add a test for ethtool pause stats")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

