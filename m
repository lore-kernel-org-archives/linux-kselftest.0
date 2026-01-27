Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408431AAAF;
	Tue, 27 Jan 2026 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533494; cv=none; b=mgV04G5rZGN/9nUD50X2zVyutyQIvcAMnWDVQABvxdhdBtCY/gol35MuSIbF1wrbTC0TKxZt8Fu/nLwqn/Mcc88ixvVtbOGUUxpH2TqqmeL6lQPeI/woIqEEdgLTL+PQKNiTiOdq3SwVtXC8XGERxZcbOkNl1tOoHKNiZq+8U9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533494; c=relaxed/simple;
	bh=Aq2ieBUB1YoKu95ymjZccktO28hLdWEofqN0qLTBdLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYIeOL4/QsxgH1YSZoVDtiwthCnzZZMbJlFSSspELNdQkqMXuaTgDsjNlPS5ixIBErasKHzpvtvwoR/++PFTcyvf1jbTQ2cdDNL+wmZNLG8bHhcXBJUGcPyd8OAgQhqipUKJzJ/l4+acAtgJBePMDH8t4geYxb7Ump48W1VSq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kuwf7OPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kuwf7OPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5744C116C6;
	Tue, 27 Jan 2026 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769533494;
	bh=Aq2ieBUB1YoKu95ymjZccktO28hLdWEofqN0qLTBdLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kuwf7OPnAnM/M8rz8mpmTum5eUbYopAyFIlqDtsOr3zViRudIJmcAO0mF08DVW76s
	 xuvSrZQMAPe52b4+kJF+IB6hZE1/lOXoZ5+KtDk7rYhClKjjho16jIQv2PvK3olnmV
	 WJCxdM1Iakgmuvm7DIv8Yg1mg+2BKdZD3202/qMbfLg34udEOedYukClhvhQHRgdYC
	 ErL1VJDzGnMU11WAiaeE8astuy4OKLuVFgQTkUgGpD049ouY6zEUeaYB3B+2uVjyZv
	 5XNtsWBrgQj2BSYK7uxOpf1MY7n5DWKHjiPEs1c+TC2kLXtgng8rftX1hfKGW4qfdj
	 DiowbMORxXVCQ==
Date: Tue, 27 Jan 2026 17:04:50 +0000
From: Simon Horman <horms@kernel.org>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests: ptp: use KSFT_SKIP exit code for skip
 scenarios
Message-ID: <aXjwMrXd2i2XI7ZV@horms.kernel.org>
References: <20260126061532.12532-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126061532.12532-1-junjie.cao@intel.com>

On Mon, Jan 26, 2026 at 02:15:31PM +0800, Junjie Cao wrote:
> The kselftest framework defines KSFT_SKIP=4 as the standard exit code
> for skipped tests. However, phc.sh currently uses a mix of 'exit 0' and
> 'exit 1' to indicate skip conditions, which can confuse test harnesses
> and CI systems.
> 
> This patch introduces ksft_skip=4 variable and unifies all skip exit
> paths to use 'exit $ksft_skip', consistent with other selftests like
> net/lib.sh and net/fib_nexthops.sh.
> 
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>

