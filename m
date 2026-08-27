Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98847F78C;
	Thu, 27 Aug 2026 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848271; cv=none; b=sQ/AqUTZcjcFVfgtyTty/l3BUPq7b3VL8bDaotQ/Jge6rOnqikLrwqBIxCuUpytwjg0vfSITQCSYlAeUkipfrWMdhy8wU37RivgVb8KPlc9DUhenbHrblNhTzPFZlbO1t8IqyKrLwIiGohoWmBc9LjhlyUsv4nlQkuPwVy55Azk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848271; c=relaxed/simple;
	bh=MY2v7ct+Julxej+haFC8gYN1Ge8OstgGnBcoaF3VO1s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNFRbq7nc7/TtG8Y1BWmHnVY6phsWsflh4TgnsmM4XdTU1Jjk4dvtSfQQ9ONBbcCp8DcmKpTn1x8VozRRPsjsluzEr435uhtm2JiWp6yQGt/R9K+fIkG/Pyqntc9uN49Bl7njMye9yLfMryTxCN+oRbNcd1WSneqmU3I+x+KLyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy0cHJY6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy0cHJY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104651F000E9;
	Thu, 27 Aug 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787848270;
	bh=MY2v7ct+Julxej+haFC8gYN1Ge8OstgGnBcoaF3VO1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Cy0cHJY6Qy9kzFlS2JgmUBbUdDuCFzq4Tbhk52w6395njwipqUyQTglpF3h5cL2Ib
	 epiU0kszmcZ2/YFUXLWgJAISPU6tP7vP/MUAbEjUYhz5wnkWf1COzDpTmBcOmA4Avv
	 UGhdrtK4Tr3J46gaPtFKRwy8smckaQz0NFCwQ7O6RzMZZp8SJQAzsi7u1rUoCxBfNa
	 h+85fpgPlbGscxrU6ksD8hPQAdWFVZ4abKquGTsfe9IziAe0nEAjQN5tjlQZu3HBt7
	 zf2XRZ6yTqEz6Eg0WJJA5SEB8XE41gYz7rfctCSqkQWC9pJigw1rRoAfVytqVLYkeJ
	 NbFWcOWVgD4Mg==
Date: Thu, 27 Aug 2026 09:31:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Willem de
 Bruijn <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yael
 Chemla <ychemla@nvidia.com>, "Dragos Tatulea" <dtatulea@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: pp_alloc_fail: restore ring
 size after timeout
Message-ID: <20260827093109.5b26bac2@kernel.org>
In-Reply-To: <20260825090758.308167-1-noren@nvidia.com>
References: <20260825090758.308167-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 12:07:58 +0300 Nimrod Oren wrote:
> Would it be preferable for cmd() to terminate and wait for
> timed-out subprocesses?

Meaning send a kill signal and then wait? Does it help anything?

Regarding the patch - I'm not sure we should be complicating
tests for this. How about we make NIPA reboot the machine if
it sees subprocess.TimeoutExpired ? Adding defer()s before
seems like a bit of a whack-a-mole.
