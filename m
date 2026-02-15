Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1AB2E40B;
	Sun, 15 Feb 2026 17:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771176182; cv=none; b=OVTx7Utzzdz79DWg45BqsQo7LGcJOgjbOdZDH7V7g4ULkGJoVkhLUp1apEHvWrOuP9ewneMX6iCTNCxW1gKAY5/7looRe1+rdhf6ZzefJwXokRSrSAWcbY9NREJ+Coif1wGaS7JPj3xr8EV5End734QdhZ00ctI6ZFRRFBhGoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771176182; c=relaxed/simple;
	bh=fBqyl90zbGzRXf5U0Q5Zzm+S0Aj6ap8Szx79x0zwe1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5Q9IQqjJVgphCIKJherp18jLn6dXVT7SPSXlefjW+FZM8PSxetdotgMlnysEwOawMrRJeucG6KhCx2/UqDLPeLsQf3hjtVXFyvJH65pLdHoE3GXqLjNDRJndPh1Mxt5Pl9xHin+bz+9laT0KBhw7MLFJo/cd87hk2ueO0qpMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R07Jgb6n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R07Jgb6n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB24C4CEF7;
	Sun, 15 Feb 2026 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771176182;
	bh=fBqyl90zbGzRXf5U0Q5Zzm+S0Aj6ap8Szx79x0zwe1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R07Jgb6nIFfH3BtSd9y0ZJ9XieeILI3+eP4A5t0/jW7p5rAEZmUBEvYFna0CHHqwc
	 zBpNJAqWPAgEUQO4WjJnmofFdXp9gNWfxIW0OCxgdDTr4Wv4rtlpCoxChkFvVfCH+4
	 drIG/VV9dcS03xj5kU2Lyx4pq+bJlt9PWffSocqpYTn51V/XaoDwK0M6qj70K7dJ16
	 snKEiitTWoMcf8LoxKsgwCZZfP60E7j6961OS+7eVwf4ConxguCWlAMePNif72iUA9
	 vD6wdQBCo5x/7I/zYKf4a8P+AF73+b8lkikAHG6o+Kz8XcKDBlMhuDUcmnnqA2M+FF
	 EcKsODh41uEyg==
Date: Sun, 15 Feb 2026 09:23:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, David Wei
 <dw@davidwei.uk>, <linux-kselftest@vger.kernel.org>, Nimrod Oren
 <noren@nvidia.com>
Subject: Re: [PATCH net] selftests: net: fix timeout passed as positional
 argument to communicate()
Message-ID: <20260215092300.48ece07b@kernel.org>
In-Reply-To: <20260215125149.2106612-1-gal@nvidia.com>
References: <20260215125149.2106612-1-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Feb 2026 14:51:49 +0200 Gal Pressman wrote:
> The cited commit refactored the hardcoded timeout=5 into a parameter,
> but dropped the keyword from the communicate() call.
> Since Popen.communicate()'s first positional argument is 'input' (not
> 'timeout'), the timeout value is silently treated as stdin input and the
> call never enforces a timeout.
> 
> Pass timeout as a keyword argument to restore the intended behavior.

Makes sense, but looks like
tools/testing/selftests/drivers/net/netpoll_basic.py
fails now:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv/results/519460/3-netpoll-basic-py/stdout

I think bpftrace() needs to pass the timeout to cmd().
Probably something like the timeout param that it's passed + 5 sec?
-- 
pw-bot: cr
