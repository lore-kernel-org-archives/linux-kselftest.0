Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017A2EF653;
	Tue,  6 Oct 2026 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270289; cv=none; b=KdgDwawQKM7xeqAiw2t4Y4ECOeGIeE/b8yxlwF1/70dB4pZU/HYaRLJ6Bz+vrBYhCGHDYCW0iTaG8ACC/nAC5FBP/Cz5UMRU0OG3hBP1G3YNd9zHdtYGUtbbbPLZWTjOersezwPCbggvP2MTvndIhO4aEQauXHTuKXqXVx1RTy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270289; c=relaxed/simple;
	bh=kaByYc/U+5tu8/jtpkw60yZal7zKeAXTBbuq/8jk5Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCQIVgwPF1MVxb6xGOx0TwO4+ck6mRnxvK3Dde8N8v9QYXI2F9UXOilOSnAFFn0viOOEGGTQqjcBnaJ6RBFOP1qzBpP5XVgYzjsSSH5YEXEjbcWnfAvh2r+XYPOE8Zflg+/mudtICkB1qn+i/5tISqtO/5c3r2S7ylo0hhFMcHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ7Hz3Lx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ7Hz3Lx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5211F000FF;
	Tue,  6 Oct 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791270287;
	bh=RUjKVtdBjLrI1ETUgbz/NG6YLKPD9i8so5/lvVS1KGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cQ7Hz3LxWsdH5JhGe8XrxnqREH8hJKRxvc+04/JEAla3rBTrBZ6utUBrnufu4BDfy
	 7t+5iZOHvAzh1AuBtrKXLkr6zxP7mgG4wwaQmg0kNgq4uaXeBWWelLGpimA29IUkYE
	 1lWzORtbjYaj127F/uYSKmQXRhaMnpM9ieF5v11upQVdWDvtXiY0dfAmGoKBECDkFd
	 utGfchqxc8upLRWgrFHsan5MJX4yToZrwwwGV/FEXDtzlSWWYQGD9EkIiUeIBK0QUK
	 G/8WXvJ6WKJYeoh4aPpK55ltDLm5Mm3L7yqR4sHC5lsKnnWf6eDBCua/AD9ekbdG6g
	 MPNoeJuZ3Y1xg==
Message-ID: <7a977ccc-b6e5-4430-8ffa-fbde5ed9f4f9@kernel.org>
Date: Tue, 6 Oct 2026 09:04:41 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: test RACK after
 partial undo
To: nramaswamy@openai.com, netdev@vger.kernel.org
Cc: Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Yuchung Cheng <ycheng@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1791248202.git.nramaswamy@openai.com>
 <79f83ccbd303db0a3d7c7afa5c94c7817549bd9c.1791248202.git.nramaswamy@openai.com>
Content-Language: en-US
From: Eric Dumazet <edumazet@kernel.org>
In-Reply-To: <79f83ccbd303db0a3d7c7afa5c94c7817549bd9c.1791248202.git.nramaswamy@openai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/6/26 07:15, nramaswamy@openai.com wrote:
> From: Neil Ramaswamy <nramaswamy@openai.com>
> 
> Reproduces a partial undo bug where a segment is unmarked as lost but is
> never returned to RACK's timestamp sorted list, which makes it ineligible
> for future fast retransmission.
> 
> Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
> Assisted-by: LLM sparse
> ---

Thanks for this test!

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

