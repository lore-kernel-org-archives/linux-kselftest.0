Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944272;
	b=fLbfv5oHdqu0b7M1sT2v9WEDXS6FiewuvHfZhV0l0RpSHtTFD7KSv6sVOLHx/Ym3nij3
	 Og0M9vDumHPWh0+iRZU3mQYhNE2JjryrYYSeE9hTPOtxx6+ikj1EQvcrGMhHYQFsDUxad
	 SUg4GO9ZWH02+hunsNJOTHQqM9smiyLPoZqrIC4Cw2FVOE8fBkfeFYI/7aRaJ3QRXg+2v
	 aQTYB3UblSNIKoV77az89xsUbCbyzCywcgSrFtQMgE0vkgTD37lZG6Szok5Q9zcvYPSCy
	 5+Grkzk2uJb8pWJxFeEF4EJ8kBDg9xNjUW8b7wKXAe1MbmdCejYA3UBhd5/wD4hdQcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944272;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=A3mxCvjd5pvvAJwcXU70YpNRPRv797FzYEXVB7l7x/Ckpl4wKpRP559XL/etHdmRem1h
	 aVtshfGvoTf4FHwxgHHyULdMGaGVNjpy6wVR7uRRedftiVcWIhvfE1tKhdy2YmBP70uoe
	 y15oIVTCsfIstWL1a3ZbO2pFS51bKXtbvji5YmHkAIzrIuCw6+cmH8SJdWzaImTN3tqJ6
	 sjXPIIBtjL4Ei25tHn6F3o1797eXtIFFjgyoqZJ1hvIPFroXuRTrCVYalfGHPeEhSDUPl
	 +iqvgnT5QJFgdu/THUH5AR+QgUUqchx39RhfhYQlQR131UNZZ6qzz4sisgcrezV0ybw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hS9/k7ub";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8CF606A32F;
	Tue, 17 Nov 2026 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hS9/k7ub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130C91F000C4;
	Tue, 17 Nov 2026 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944272;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hS9/k7ubWlfsx6SughAzMgnLGcWl6kQDnzIehOBrbhJaRjbW2PR5pPYCCnmLXS/RP
	 3BECAhQEPFhgZpe5r405fP5Bbyf2teysidVY1Zpe928uwzSoDjShoEo7lExAB0Iu91
	 vap2ce0sJW9pGG9NjRU6jOX4E8J/GZjyxKkc7WFdiCQGcu4wfg/nNpHvVQJExw85o3
	 srbMjpxklrLleu8P7mvMDDVb9U72LLNRML697us4a3xyConpFPuNWCrzYwQrGyti1O
	 ZwCHXtzEokaU9BttyIBJ2HKBVZlaG32bi7nCUzYP8Fa9tOqxj3/bxQAvdY0E3bDAFz
	 rQ7z7j8GPHuEA==
From: netdev-bot+sinfo@kernel.org
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/3] ipv4/ipv6: Cache pmtu on all paths of a
 multipath route
Date: Tue, 17 Nov 2026 19:37:51 +0000
Message-ID: <179494427164.3291.6413261457824057937@kernel.org>
In-Reply-To: <20261117193141.27004-1-deliran@verdict.gg>
References: <20261117193141.27004-1-deliran@verdict.gg>
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
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
