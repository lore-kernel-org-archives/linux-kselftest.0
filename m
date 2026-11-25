Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593845;
	b=wYi7z9QM8jftGpKyoTbxsM4x2PRXnIM+8wHonzwPNe3/NGzDKflXMEujpMKqN4pMArYD
	 7WnE4eTH5uy7N9MNa0t9MxcZKMU8JFZMoZzJEgaK7jFiTx+LVPjy78TeUWU+4T2zV2icg
	 /Z0HbvM9RQhW7lmBMFdQiwLOJa2A6Ulw9ZiPrAgcnozNBnQ37ZKQvyb6WEKKabEXz1gZz
	 8vHpvX3lC/eQB7TFdgW7m35d1/Gfw/tJxQ+mhOQuNT/paQE/vib/soB7B82iiR5/Bw/52
	 SaWBeOXFqUiU7chtuR9rJ4XFYa/4fnLLXJDuQumKd3CbFAaOD0MTQMFJxTCebjTkYMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593845;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=MF+BeYOYB/DDN2WqUgwsfUKlmP3/0fwiowwJ6a2JiFM=;
	b=F3h4zdyBdQ5unaoIjyaKqe3Ei3ldk9VgE2AWGx0NGFxVgAdF8wofA00rPkYLG4IxL3le
	 J6wJCIO7hlrPdJvizdVjJ1eIuybHhCPi5tZZXBsLMHjs/oUOtTP26siDOit7ns55mjOe8
	 rwci8frmvayUJH+cuS2s3atC9PlvQqpzqyAEvYzWSSemLJwL+BwHf7RV3bJ/n5xcKT0kI
	 Q1GPyttBcg4oXwvhQW9N39pzA7JZsahr7FlrVxMCjWS1/lrlqUHItcucj5jpm85r7zc1T
	 4OwJ1QtUpRFw4Lq4jW+SCpYlYudyYyc1OjeRVRZmO2/Mo7SmFHW20W973x6QHciWVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=vtf9RvK1;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFA606A31E;
	Wed, 25 Nov 2026 08:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FFA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=vtf9RvK1
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jZByd3kPvzv2;
	Wed, 25 Nov 2026 09:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795593837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MF+BeYOYB/DDN2WqUgwsfUKlmP3/0fwiowwJ6a2JiFM=;
	b=vtf9RvK1asx4ncEtiIjWTUSRYEpo+ytI2Va/SmnKkleHvokSqFLNTcmoOX5mpDQIbcxV0P
	rqGsBIw9mb5sZh+LbSdvwONhnExtYNRyUHWHQVfTBY7ZoXQcG9nyg+SKFptdBoW0tTNUkH
	oHAjl7383G92v4DcIJ7LPaJb2Q3k6EtdgHQVbNb6UDij7GR9xkmw4aG9b1/PTgxfm/Ucz7
	pBFO5amZLmMYhXK12UahyR60tNQ9C+KvEr884HzWSMliJKuMbiMhotcqENSzJZwkb1GF1K
	LmubKo+WnHos4+jIttgVcK64hu8Mv7m1fedsShtSZbYkcecxTWjPcWXGV4uvUw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dahern@nvidia.com>
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 00/11] ipv6: validate cached dsts against the netns route generation
Date: Wed, 25 Nov 2026 09:03:41 +0100
Message-ID: <20261125080341.57521-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125003554.54371-1-dahern@nvidia.com>
References: <20261125003554.54371-1-dahern@nvidia.com>
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
X-Rspamd-Queue-Id: 4jZByd3kPvzv2

I'm not sure what happened here but it seems like you've sent this
series with envelope sender dahern@KCJPDQ2QL4.localdomain. My server
took it with a spam score of 12.9; lore says the message-ids are
unknown, and patchwork doesn't have it (vger very likely rejected it).
So, only the people on Cc have it, and patch 02/11 never reached even my
mailbox.

On Tue, 24 Nov 2026 17:35:39 -0700, David Ahern <dahern@nvidia.com> wrote:
>    rebound under the global fnhe_lock (rt_bind_exception()). Narrowing
>    the invalidation back to subtrees would bring back the cookie race
>    the series removes. If the exception refresh shows up under churn, a

That's not the case: my v5 [1] keeps the per-node scope and closes the
race by sampling the node's serial during the lookup. Invalidating the
whole netns is a matter of preference, not a requirement.

[1] https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/

> David Ahern (11):
>   ipv6: allocate the exception entry before removing the one it replaces
>   ipv6: keep a superseded pcpu dst working until its holders notice
>   ipv6: don't insert a PMTU exception whose MTU could not be stored
>   ipv6: invalidate the failing dst in ip6_link_failure()
>   ipv6: tell route dumps about exception inserts with a table sequence
>   ipv6: validate dsts against the netns route generation
>   ipv6: make rt_genid_bump_ipv6() a plain counter increment
>   nexthop: factor out nh_has_f6i()
>   nexthop: bump the IPv6 route generation on group changes
>   ipv6: stamp dsts with the generation sampled before the FIB lookup
>   selftests: net: pmtu: check that a deleted cached exception stays
>     deleted
>

When you resend, please add Reported-by tags where the series fixes
issues I reported in this thread: the reuse of a rebuilt pcpu dst
(10/11), stale exceptions treated as misses (6/11), superseded pcpu dsts
released with dst_dev_put (2/11) and, if the series addresses it, the
bundle-child release.

-- 
Ralf Lici
Mandelbit Srl
