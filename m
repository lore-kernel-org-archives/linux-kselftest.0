Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A49C3DB65A;
	Thu,  6 Aug 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044277; cv=none; b=Wgz3EK3S1dqTSi5JHFVlVV37EBZF7hI0ZDVCsX+pZqCzZPnQqGqUYT24Nl6BMMW0c5yZ0fyjOQbEZON/BB7BMpOvtyHciuQsAgBLiqX5rZNBNKMVQgRNm32tjmT9MqzCPVTEM/jM43EDFqn7tu4H3LCOwH6M4E/nvnYSQQwD3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044277; c=relaxed/simple;
	bh=L9nnKKvzG2Un9kfY+954zDHaL9Xm2J96qt5yymYDuvE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AWFsdGv8O1F2g2shleqni8ORHatY1cZnMUZfLOOAW3JPAnytDpt1xTlXQVYuZSt/nmxTi1hH5Wr4obLN9g6Krv04K0yN4WrJ5dzOXBI/6VHKs9vXWFLksEQ7alu80qQKivm+PsDyW9N7Zj3YVb21IrLzCjHH9FnRuRvQ20e1KqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aeb8Dv5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aeb8Dv5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05491F000E9;
	Thu,  6 Aug 2026 19:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786044269;
	bh=LsIBvB51t9iA/FCIB/hk1znk1OldWwKr7A6TDwpRrno=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Aeb8Dv5mDlE5E4ywspbzuQhAammaice3kvpLiNCLWRY7y74nkvDOv6D44I0UYNftO
	 KD+7QoFGk1fAmEmSIqNj7tToIPR2982NsQSpfBi8dMK5mgBx/j8GrBeTEjWN4UnBbj
	 0odDGGa6K+wR4f/MUTg8iVNcOiy1tNObqmBWcPbzKambZf00BgfEXKJDuBC9C6/C5H
	 dLZQTrbcjo8/GwicaBVAl0Mpt3uZiL6/XyV4VQ1mBCmLDEbQCBOp1ZGMrB/4LaOxZf
	 pXWN2y0QNXFBR/TAEhNm/AuEv63ncvdsumQxkM6nYnulvsFvuXRvIHYfEbHrAY6i/6
	 UwIBtv9HhWjHA==
Date: Thu, 6 Aug 2026 12:24:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] selftests: net: test IPV6_FL_F_REFLECT
Message-ID: <20260806122428.2a71c491@kernel.org>
In-Reply-To: <20260804025910.50145-4-marcelomspessoto@gmail.com>
References: <20260804025910.50145-1-marcelomspessoto@gmail.com>
	<20260804025910.50145-4-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 23:59:09 -0300 Marcelo Mendes Spessoto Junior wrote:
>  echo "TEST management"
> -./in_netns.sh ./ipv6_flowlabel_mgr
> +./in_netns.sh \
> +  sh -c 'sysctl -q -w net.ipv6.flowlabel_consistency=0 && ./ipv6_flowlabel_mgr'

Would it be possible to make the netns prep part of the test itself? 
We can use the setup function in the harness to make each case run,
or do it once.

