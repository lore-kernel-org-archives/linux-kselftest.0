Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284490;
	b=vfUSqEBEwSd6UqoKgVk7jWMYHtwKtLgC6c9jQ6PnwIhi2h73uKzdyqNys9uhy/dVSwKU
	 TQEJFfzG4u19QxqVnjBJAAKcPSow8W0gl92yWAs/1QM9dvrbiuOyBylhiOagU6Fwa+il+
	 qSQ5y6UMZcGzukucicAYEsXJtQR6/igqF5Ez0fhwsUZuU+nANE2UsBAFDwUCYfddnmW1z
	 QI65gBvfAQSGHiKt405jA2th7eoBXubKf3y1XgmenwgA0Let7lcJz3czLn6e4JLCROeWL
	 Ope0rSGzhqS2a8r8PY2DdOPgMe2qYiz7+Yw0bPM+2RpCyi/YyQAVAjB2WQbCuiWRrdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284490;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=RsqzZTXcYMDYwVoggfYDPtqvNd2tgjMCZqRA2hX75zm5+QlhModRoZ10uo2j7SdcGEsv
	 ZAz1JNBpoZpxdITXJTJOAjZk17ENHA74RtxVP6gI7Hatut1RPTY/v2s1BZAZT47tuUG+5
	 cV7sQMv00RdHlMhiBSxIwPEcCMGxtX6lDvE229ERF56Wh/9od0KbRKMvv24+9gjqxQgeX
	 zg5Jm/TaQHMM+zuDDdcq8sSNedRTq7fTW4XL7VLHR/56WLAKQ9gvqd5V04OVWeOxeJduo
	 OldigMPLJDsfKjZwjfsvrwiH8SmsV4ktvIotOtH4zkWvcYoUbsw34XDp6n+EkJCc7UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrUdwT+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66B606A31A;
	Thu, 29 Oct 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrUdwT+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1191F01825;
	Thu, 29 Oct 2026 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793284490;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JrUdwT+fQ+FiuS9C0tJRviDtwdzlfgxHDH8zyWazZyDYseMfaET4ClKbiMAFRn/0Q
	 NGcP0wM5b5oFMeI4YRQMvtC2feK90NfPqzG68AETX5S8CY+euhndE18JQ0q0QVBohQ
	 ZXsGpXD00C11bDCWB8UlJqs2IRjxsBcVzCHOh/fmRM7ciwnwRCdygL5tkdHj+HXR9d
	 8CcyPUgFFOPe/dsN7IGJ48Qi7igv36/SrTR1UVQ7SympFEqn7TvYGRFnZXY28fF2R2
	 WaA+VkEWYTlRprFfs+VG7H/L9QZkIHxFz41SHCi3S6P41LYGn5arNMkXHJkkamwxeB
	 rzW2UodHEdshg==
From: netdev-bot+sinfo@kernel.org
To: Yingjie Wang <x-professor@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "idosch@nvidia.com" <idosch@nvidia.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@kernel.org" <edumazet@kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: 
 Re: [PATCH net 0/2] ipv4: preserve devinet inheritance after unparsed writes
Date: Thu, 29 Oct 2026 14:34:49 +0000
Message-ID: <179328448925.3327.4759543539154555091@kernel.org>
In-Reply-To: <cover.1793283257.git.x-professor@outlook.com>
References: <cover.1793283257.git.x-professor@outlook.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
