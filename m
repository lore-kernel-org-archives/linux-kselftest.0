Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B830E827;
	Mon, 14 Sep 2026 23:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427031; cv=none; b=J9/5I4xoEkueETuf7xHhKl4xe19epyLKqNvi5Z1IHErlj4sh89z3ZkQ3y5Tumcoa63KZJoz66nv86ukmck9D3V7xCpU4wCB1JpS0R7iN7ncaxSB0rbNEdZqk6vXqfNUh4U/e1UBvcWEBUXelYz/rprBaRGqxYbTbYnzHRyT7R7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427031; c=relaxed/simple;
	bh=NhsH7Z6mp9K4O+fRt7ERo8OiwnfMMCA8urm4XhfoZg4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mT/HrK4xdSPDtaN9s0XvDmATvbvNUXLcRVgJBmSJa36lIQMuHnbWB1qP7GUnB3jJpvDzDeHJrExu0GxohFuVx7FJSHm/GGz3yQFmb4IqBF6dS+6eDqvyNOu8CZf0z78qocn4QTuoVE7YZele+W5x3I0le9qr8CkbNPYR5huwYKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAnaLc1z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAnaLc1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DE81F000FF;
	Mon, 14 Sep 2026 23:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427030;
	bh=zoC+M7HPIBgkThUxFf5WWv7d04RGuD1nZSAbiAkwWwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gAnaLc1zUWHoGfPL7z02PShzfuguibCxBm0yCMxUoHczWXJ3r+wdWUjspmXo63TwU
	 TpGt7Bn2dHJfs+f7Xw0YzUsyZWMqkwRWtpEUkdX3gdBsV8vo3qrCrhYY+rRjpx41Ke
	 t3J2zMB8AzgYKMtEyiRHbcDhg7gqq0M2AokmvkoUZCyUwTSL6ZHaXIcpYja+xOXFB6
	 wcWES7qAu8in4inMCuE5J/V9y1t08FWvusI35AQYMQ3lZMANRgEX/51sBULvrr71R3
	 cCx6H9xAOcOK/hNAlOOHVL2S1m/gDkWXvpwmqo5VZJwZMn6N0zoM6d919EHMOVzhsM
	 U+yXLufE7MZog==
Date: Mon, 14 Sep 2026 16:03:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Ahern
 <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 03/11] selftests: net: add a test for the
 tunnel RX drop reasons
Message-ID: <20260914160349.7c8bd818@kernel.org>
In-Reply-To: <20260913033213.873609-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
	<20260831215137.549324-4-littlesmilingcloud@gmail.com>
	<20260902184549.63f37d04@kernel.org>
	<20260913033213.873609-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 06:31:51 +0300 Anton Danilov wrote:
> If such a test is wanted at all, I would rather come back to it
> separately, once the conversion has landed, and in a smaller form:
> 
>  - perf record -e skb:kfree_skb and perf script, the way
>    openvswitch.sh already does it, instead of driving a trace instance
>    by hand;

IIRC, FWIW the perf invocations are quite painful for the CI.
They require a lot of DRAM and IO with debug kernels for some reason.

>  - only the cases that are not evident from reading the code: a peer
>    that reboots and restarts its sequence number, two ends configured
>    with different options, plus a control case where nothing is
>    dropped;
>  - every case tied to the function the drop has to come from, so that
>    the same reason reported by unrelated code cannot make it pass.
> 
> Is that worth having, or do you consider drop reason coverage out of
> scope for selftests/net?

I personally have never seen a production issue related to this stuff
at Meta. So I don't see a point adding selftests. Maybe someone else
had seen regressions and can guide on what shape the solution should
take.
