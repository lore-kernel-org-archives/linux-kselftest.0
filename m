Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710903;
	b=LsEnr1hfISM5P3pmULOYC31UzYHTi6yhvBBdbVF6TgbqD2saEaXufzi5dVxRMy2dXeGF
	 so8EHOzNQDDMev6g89RC/NdrYrv5P+VtfVIZ+K1HvEqNo3dZLrh69MGXy/+/HM87cIxwC
	 8rx5fRe0jU35JHhlByo2lyHxiCGCRE8QKGHbKcAuF9pCh2d3lldJIvOUcKcSpjlydlxkR
	 QVf/YCU1MKmv+0qVAxVVawEQ5oWkyydnDUYAVaeOz4fWvuVFb/VSeqUKy2SbcljrcPSsz
	 NWJSeiy/8sMIVuaT9vwnJ9K79sKpOF/KJFEJkdELDv3MTTElfocf4g+HxS8m1a7hW+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710903;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gqsV0uJuq2lIz/eE5B85zVWATKlsvdjlm5ldY7/1EIs=;
	b=0WvyWthWPtd+twkIZL1fhOuCHdEcBXJSbv/5oQTZ4OdLqKcgvIVYBcehY9adXwl/dvW9
	 aqzBaWrkXTKYEWk9lMq/1VnmAJnx2ylY4dLeWdJ/05dRXYSEf6P8yyl5Rt9SvL5UNP6UB
	 pKd2+OavjCdEm3YEfZWMAT5rgW77unjree5s6jUxXytl6FxM6RDpcOBvGJOVmjZJQGarf
	 SZkRhSDKDcJjlVMPpCv8LC1bImkIT/V7mVrRVp26YpKQD2fAPMMxOQdm5T/Fhcg6wmuuT
	 hvS8fEbienxlENrJitlhydNYTWOGq+sni/Zh9AmIwJJ1E5tqA4Pd4IG1qDM1B/IevRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN8Qmf73;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81D606A32E;
	Tue,  3 Nov 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN8Qmf73
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B36E1F00A1C;
	Tue,  3 Nov 2026 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793710902;
	bh=gqsV0uJuq2lIz/eE5B85zVWATKlsvdjlm5ldY7/1EIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PN8Qmf73Ebuwl+v/IopjKWhS3SQOyjY1YFdjb5y+ngxrOEWq3lXItacWp9MHKsWWi
	 dEesVPAgjZp0XkI0fZTXwjEXsZKIZQsNgXbk72Cc7JdhxVljmVF7U9RXyU+DSH1/j+
	 7UbhrA9T/3FoyTVlMSkecYRHQU8hvgMiyAyu7Yp7IqIoYGUrq5RDH1zHgUN1jybVHY
	 gwTC399qXAyrGqSpdKMQzRkmTrODsuXAyEpIDRuGqwgJP02CLPLLh5Psdq6ZdgJgVf
	 mcBmNOI7n3q3yE3T/FbX4tGxE/rGQJZTbfXHLJP8taQByW80yooiVgB7yiokmNstrv
	 FcEAKcSMAUMlw==
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/rseq: select only implemented architecture variants
Date: Tue,  3 Nov 2026 08:01:28 -0500
Message-ID: <20261103130131.4069212-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200157.1365258-1-sashal@kernel.org>
References: <20261014200157.1365258-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping, this still applies on 7.4-rc1. KernelCI still fails to build
the rseq suite on loongarch (RSEQ_SIG undeclared), since rseq.h has no
loongarch support.

-- 
Thanks,
Sasha
