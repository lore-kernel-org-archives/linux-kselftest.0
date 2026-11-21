Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220782;
	b=KD6Bvdi1ngVvemjCx14TCsZs97Pe21KDCaDsdtrVml4GLMn1qrIOZ44jcMsd1kIeeWte
	 iV3A0EN4HspGQgxJ28CFeEgTvA25i8yqfUxN1ICjApKMdWMTIB+PwWetTLXx7wHnwjeFf
	 KAzPYn6YoirXMq/bRoWGit+gQdXIqxWLk3aEE92duzO/UGPtBRAi+SVgqcBV7DXD5A9gd
	 ufkEQrfDB4pKMxqoqJHlS8v4joMVmLi8yfsQuPT7O8WVy85SO/FlzhOu6cKE4aRlri+rK
	 Dm6uLi1x4p8QBMF5l695xTzsTs8zJYJpsq6Cf7U/TPIRBoc5upqPWsPlGnZ21mMg5Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220782;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3HC6ty+tjA8BIhPRV98RHC2r4ZX+SRgywuPuvB+QX3k=;
	b=GN2nMwH3NyIuVQYeB4gvcUJjch7vdfwuRAJaPGjLSeuiAIBQTskwJHY4kizIMWgERX+I
	 lj3KosaZ9XdEl5oa6XWGdpALEzN0pNCVvpsUzpPjGrdC5oCLj+w8n0NtGE6zXXtPi/17d
	 zY5iSZwb6q9DCNYrPs9NARShye9RcrwiBSONTZLzG+rqif+7t2jb0QHnjkagmu5GhNWEE
	 6Nc45dqECGk+2yQR8PgYu+9PYBYiaAUpA5Sm8RuUUpTnKx6HYwO03PQWi9gyjhEn+kwPl
	 jNNi6pJKcRX0rohD9bL78dzogf+i53zpWCNrKAOEdNHgzqBYILA8O0eEVDit4FS7wgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDUVsdyl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA8606A6A4;
	Sat, 21 Nov 2026 00:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDUVsdyl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87F71F000CA;
	Sat, 21 Nov 2026 00:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220781;
	bh=3HC6ty+tjA8BIhPRV98RHC2r4ZX+SRgywuPuvB+QX3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TDUVsdyl0nTxYixXNyAnROq5YFCeyWmqweX5n4xqlxUgS0LJxGyyhG36x/s7j8w9z
	 lqUKINcUqDh52kVvudhCyjtKBraXEvSvdFbJedfmA+w59aL+YtsZrvRv1l/TBMYGp2
	 AYb+lH/QEWybEZWxUbbCOEPW4lmt9q/lh1FkMPw+NvxPMdXxwjUggd/lqtIy/mDRtH
	 b5bIED4dRQ6honWTZWG0wT3UYvsWIc8DlxycVpyBqOsA4DQZ+bB3Cn/CDf5Cfjqj+7
	 j9nXZ9YDt9e67yvwbrxggj6VVzjAC4bNc03OoVG67dEHJaMq2LEsbvmVdRKjILgr2Y
	 TvmfQF3TeNATw==
Date: Fri, 20 Nov 2026 16:26:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ali Firas <alishmery18@gmail.com>
Cc: netdev@vger.kernel.org, idosch@nvidia.com, pabeni@redhat.com,
 davem@davemloft.net, edumazet@kernel.org, andrew+netdev@lunn.ch,
 horms@kernel.org, razor@blackwall.org, roopa@nvidia.com, kuniyu@google.com,
 petrm@nvidia.com, aroulin@nvidia.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/8] vxlan: vnifilter: bound a single
 request and account per-VNI memory
Message-ID: <20261120162620.0b018d12@kernel.org>
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 01:14:04 +0300 Ali Firas wrote:
> The VNI filter interface accepts a VNI range with no bound on either
> endpoint or on how many VNIs one message may ask for, and the memory it
> allocates per VNI is not charged to the caller's cgroup. Charging it
> makes adding a VNI, or changing its remote, fail routinely at a cgroup
> limit, which exposes two error paths that leave configuration state
> inconsistent; patches 5 and 6 fix those first.

I will take patches 1 and 4, those are trivial. The rest of it - 
not sure, nobody seems to think this is worth reviewing..
