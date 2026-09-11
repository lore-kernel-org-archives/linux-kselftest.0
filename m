Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98649E5F4;
	Fri, 11 Sep 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141859; cv=none; b=PzNxJ9VxI0yY3didXh96FF8ixxD4pAdKrn+bHgtOr0ClmOnilBm8jTfHZucGj2Tf+qPS8S6Pcscoo92kgUHGXulBCTtIO2P2GUWzE3ldyEhdLcVRM+PY9FM5JOPMfWv3qS5CLdZntXOb+6l4fzMf3NPjeq3ZzwHXfo+Au0sYznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141859; c=relaxed/simple;
	bh=8eJpAwvsYiQ3lxwz7Gq50yCGzdzF++CZt+dIjUAsovg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1cAX4CbMRjZX0kyrJwo6ocG0WMdWd6V8nRlGKPMd/v+KJEvqFAO0iOOR+T96soUkfONs3XnyMj1tpV5dmdXzJCP6gOGuT1OkuX6xt0ibp/8NioDcmdjDtN5TCKkLYRnP/VkCGqpm8MyYMQ0/CTqQaSagE1nOEiE6W/yUL0qLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhFnQR98; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhFnQR98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542EC1F000FF;
	Fri, 11 Sep 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141857;
	bh=9feugFNVEQD71QBQu25PDlZDuMKbLoHRAi3hgn3EbbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UhFnQR98fjHhsZShlx/REhzY8SzPxoQOisT1qr66AVRIvZJQBEtcHMYkXgqcnqz2B
	 K8b+fbOnl7rBLsCMYzOR65OvsXkCCurOG4TPh5LifgKmvPRnyA50YEc98cVIJDB6Q4
	 swokjB4fN+k0qmZubnhTb9/AyYGokduqAmw23FvpRXfI/1tUUE72lBYdQ2Y/idSakM
	 9w+y2LiOeflFw9c5T1FlUVAR1xfecXxQ0gJjfd9p/lUno4prxgxpjvP8mC8VJX5DR2
	 nckbyZKV2vTAsPJfTxWAhDkVspnMq7pIpBsjVF/fZjVryUDOp6r6JAmtDWqr+OFYG5
	 Q0BIATU9xHdiA==
Date: Fri, 11 Sep 2026 08:50:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon
 Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast
 addresses
Message-ID: <20260911085056.10dbc3e0@kernel.org>
In-Reply-To: <20260911105103.7771-1-sigefriedhyy@gmail.com>
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 19:50:59 +0900 Yuyang Huang wrote:
> Subject: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast addresses

The new test seems to be failing:

# 0.14 [+0.05] # Check| At /srv/vmksft/testing/wt-1/tools/testing/selftests/net/./rtnetlink.py, line 171, in dump_mcaddr_l2_check:
# 0.15 [+0.01] # Check|     ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
# 0.15 [+0.00] # Check failed {(9, 5), (8, 5), (11, 5)} != {(11, 5)} target-netnsid did not dump the peer netns
# 0.17 [+0.01] not ok 3 rtnetlink.dump_mcaddr_l2_check

Please wait a couple of days with the repost.
