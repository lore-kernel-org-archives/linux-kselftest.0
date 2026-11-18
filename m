Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964725;
	b=njuy0UGNintPybujQb6sm0Ct9P5HoYSFwXae+FoV3LERCtuJF9Jpz+4BzDBcxgDxtoTG
	 Z/qWm5rgUezQF0KsRlr5eZXyV++CsfkUkWStAejfUhuUMslClQctEbt1EuPMtfTPOb91K
	 ME0QWakuyCDcyjop5mU4P8qfhhpH6y8rBF2XLs8B2A1gyONEtcGfekFCEKHHZHxwPo8xA
	 qj/DsK56TLii5iufiSG8KXK8JXS2+ngeAwtz77TilP36a0kdj/jct4i+NmlnAHkYQATHQ
	 /BuWNDbJBUhyGLM/19tsHHBzqm85yXyhVuVgk4PQyqwyTj3gQqPDB0i4KIVeo4lxBfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964725;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R3b3I3bn6BGVlcMf/oj+9JPdJkBGWxeSwci+c6eckLA=;
	b=a9Jr7cTXYL10wl+JqqRu8LqfGyhWu2JWm4oklCVTJeIRuOI1X/beD4efrp0ZeRhM0WZy
	 Uai3J7FJzaPpw7QZ9CdW4MhBy3vw+D011deUMxnqaiUXmgVs0WNfQpVgRwGa77QxlYtlE
	 f/+gbmiVEp7MiBzOvqPSOANFf1sawbWv30y2vsFWcbFoG5D+5O6xdgo48au4QnvUE+vf7
	 3hYF8anJOsQUGG7IxJHI3kbMhEImQmeMeiRQGCQn2G4tN84/5TNoXzXTDnDafwJKiNeMl
	 XhTyARrarye/Zg4l4mp2XdZ6pPbfbqpiHHWDJTX9PpkNd5QkYo66BI8AcFTShWB47RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FhZD/p2Q";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FF606A31C;
	Wed, 18 Nov 2026 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhZD/p2Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172691F000C4;
	Wed, 18 Nov 2026 01:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964724;
	bh=R3b3I3bn6BGVlcMf/oj+9JPdJkBGWxeSwci+c6eckLA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FhZD/p2QATgPrOm1I+bHYDRsk0yw5eluQdYSMEg/N0UPx/vH2pcxN2KsXQ4tfp7vM
	 UFNGnuvc2sOfEa6UI0qBHgKsK+jwgoHKZk6bccZlrsyIBaXguA72T+RVvMJBiiCnHc
	 vBrTD7lln2Sc1RWUDToFcJTie98TFGjV1g2fuAPWGGB+Y8d+Hlfh2fH9snMZdwqaju
	 x1QSyTJ1HFZ9Z/DUe1SegxG5l+pfhv36HyusT7BisBy0Qv5MhK3NdeWAEHlAq7YvyR
	 8BAWG2fmfrTH7hqT1aeM8vdAlsg6TMZsJdeEa/riWDUjdPmq9/rjF4UC38q6azgQ6F
	 B7oI+m2Cvx5Sw==
Date: Tue, 17 Nov 2026 17:18:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com,
 sdf@fomichev.me, leitao@debian.org, dtatulea@nvidia.com,
 asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net,
 razor@blackwall.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
Message-ID: <20261117171843.0b7a8858@kernel.org>
In-Reply-To: <09156786-c9c6-47e3-8674-816b80300a3f@redhat.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
	<1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
	<avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
	<avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
	<09156786-c9c6-47e3-8674-816b80300a3f@redhat.com>
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

On Tue, 17 Nov 2026 11:23:25 +0100 Paolo Abeni wrote:
> FTR, my understanding is that Jakub wants to say his last word here

Thanks:) FTR I dropped patch 1 when applying, it's orthogonal and 
the bug needs to be fixed in net.
