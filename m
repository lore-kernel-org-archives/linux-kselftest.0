Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810837;
	b=UXrVO5MsLJJiI7Ydm55pgkNTJuBYc1zA7oMRIKd218XZNoYK+nugus3v8rTNPw/a8JjM
	 DvhAFhU/lutS9n0KuzMIJdtSjvV9DgyVWZ3CLs6B4mdiYW1y/K+D+MVQjfP9gCoqgXDvy
	 PEyLbU6PcdcPM3EIr/Wm++zhe//HLwYeJq8E4D60rHCa8yjDMF3HZYAMDFqCL781+hZ1Q
	 ABqh4IRjPpwksQFzQY4juiKghGZOX3Gdb8/1MWZJ1z6X4TzjVFhjJkMZNGi6YeGtBguBD
	 N2gFS0yIHZgR96kAuADW8mRIYr6gx+81QaPuWrzUFktl+ms42uQsUN30A39PY8o38zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810837;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=QR367D4+S6Tz9sFvEpzsZHwFmXlWgygr5WiSCAsJaM8=;
	b=d67Aa82VnhfWd2YjmzkRHrRhDQoywHQGeqQ5vV+EBqzScKDhFszk8Zhtxa19li5ws0UZ
	 8nB0Tm1NcXHKd+mw7uySZktCauP1kTPbO2niCmMqYQ8Qpu9wT8/pRnzbPXypq8JzWMRXl
	 hK5hS88V5UgpSHNKTg0GHmT0VLahgFAoQDo6iWRVaAX7pm9h1dhKmkRQEav/5gun+HFTZ
	 tVRnSp5yTguzHILwTA7S6L7MU9+ipYl0c+WEawUtxOqK/srpI1Dx4YxBrDQMcZ83UxcgI
	 X3qm03bcxSesXoAcWmIh85XYwXn2C2C9kNvqpW+PcS50Z6VO35Uvs2iVABCgQFFx2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=s8MR+wMB;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F8A606EE81;
	Wed,  4 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F8A606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=s8MR+wMB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QR367D4+S6Tz9sFvEpzsZHwFmXlWgygr5WiSCAsJaM8=; b=s8MR+wMB4+/qAlYqLrv3UF5N94
	4rNRp/P7rRoVc8AQWijkjsOghsgSpPm/RJ5IwLlG3BXBvyaTPLpeF47xNGe+MUK+uLpd8LE6tkM5y
	vYeW78zxD7cg3jVlLqBAkajZPF8ifwbIkyVUMgjDKNupPBk9VwWnSfaNxOYYnA6mpvAMig9ucOU4K
	6o3QdpmHAdy0l10ixwHZnYkcUeMtKVa+3/2Nms14n3I9i9VozvHE9kISTAZbbRGr43EG17p8DLxDL
	nq8zsMv14cL7pmJFr1KZIkZCUi6B0ZsTsg/raMFzEDLPtY3xeZGu8n425X6ctxBgXz3wlQ11Qzz38
	rOWvD2Ww==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOe8i-007rh1-2M;
	Wed, 04 Nov 2026 16:47:09 +0000
Date: Wed, 4 Nov 2026 08:47:01 -0800
From: Breno Leitao <leitao@debian.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	almasrymina@google.com, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	razor@blackwall.org, daniel@iogearbox.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] bnxt_en: let the stack segment GSO skbs
 with too many frags
Message-ID: <authfGAH67c-_ugm@gmail.com>
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-2-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103235152.1904727-2-sdf@fomichev.me>
X-Debian-User: leitao

On Tue, Nov 03, 2026 at 03:51:46PM -0800, Stanislav Fomichev wrote:
> With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
> more frags than a packet can have BDs. For GSO skbs, linearizing needs a
> large allocation, can produce a head which doesn't fit in a BD with BIG
> TCP, and always fails for unreadable skbs. Clear the GSO features of
> such skbs in ndo_features_check instead, so that the stack segments
> them. Non-GSO skbs are still linearized.
> 
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Breno Leitao <leitao@debian.org>
