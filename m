Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0763A785F;
	Tue, 10 Mar 2026 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110470; cv=none; b=t7Ramq9ubrZ2jSkaprOurk7RA1FD0cgZMmXmr7fjD/mzbAHFTsgGp1nIBLyrtaa5oK+DAeW5qHtxDH+LxnKNM5grxTLABXKYeySRxZFKoj87SMk6hblrsqLvfqOJ9z4LQMZfvX9moqc1a1PYH2Y0eIh2Upnz+8oLYfVKNt2bJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110470; c=relaxed/simple;
	bh=mu3jBwBhAk5wdev5PzR7bEy90VipLrF5foFl30DR+xo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jls6aj51dP/mkgcwJ/rHGcXBZNDPJGHIT+q4k1imWuNoqn5YKYGrvFDt1UlTbw2hgSAqHo3E0t4eTKQ+58TdVjl81Q67ujxev8UHk1VWbgtjMF6AOwyb40+jDkfHZq6xSTLP+ws1snjNN7k3OVz1vbIDbXRk0/uqQQmTDT8CqHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3ibQcpE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3ibQcpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB69C19423;
	Tue, 10 Mar 2026 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110469;
	bh=mu3jBwBhAk5wdev5PzR7bEy90VipLrF5foFl30DR+xo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U3ibQcpEF0wFRStcziot6pzdMT5DT4wFQwgrfGqcyOQ1D7fDhZMvCk2B3NXUVFSje
	 lG3xUI4DEWpMC6DiHe0Vnnzk8TaTIWZlHY0TkhGpspr1xa+Dj8s0qK+aK63CyIU0JW
	 ujTzBLAt0vcUhr0a9u5F5IbXTOYLSP0+sWwBY6yxmYmG4YqWhmqQKiygmR0VU4hVeE
	 NeONZ4JPgGZTUBSpm8bf/kpIPKz1ytTAiKau6mPhvz2h/SK0Xs20jBQ5t8SojbZX2E
	 jXwCk0Oc6EHbA19dLC5673TVl8I1lBMTRSgwz1tB+RGX6OBQ8sOMnow9mjtp8qFEuH
	 zEPs4dxneF82g==
Date: Mon, 9 Mar 2026 19:41:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, "Breno Leitao"
 <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 <linux-kselftest@vger.kernel.org>, Nimrod Oren <noren@nvidia.com>
Subject: Re: [PATCH net v2 1/2] selftests: net: pass bpftrace timeout to
 cmd()
Message-ID: <20260309194108.4a68fec9@kernel.org>
In-Reply-To: <20260308192126.2490631-2-gal@nvidia.com>
References: <20260308192126.2490631-1-gal@nvidia.com>
	<20260308192126.2490631-2-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 8 Mar 2026 21:21:25 +0200 Gal Pressman wrote:
> @@ -240,8 +240,9 @@ def bpftrace(expr, json=None, ns=None, host=None, timeout=None):
>          cmd_arr += ['-f', 'json', '-q']
>      if timeout:
>          expr += ' interval:s:' + str(timeout) + ' { exit(); }'
> +        timeout += 5

it may be easy to miss that input arg is modified so..

>      cmd_arr += ['-e', expr]
> -    cmd_obj = cmd(cmd_arr, ns=ns, host=host, shell=False)
> +    cmd_obj = cmd(cmd_arr, ns=ns, host=host, shell=False, timeout=timeout)

timeout=(timeout + 5)

here instead could potentially be cleaner, but up to you.
