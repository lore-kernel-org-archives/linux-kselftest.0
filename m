Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155121;
	b=S5fvlT9ARH9lc1n0q83jhnrU+RzgUjfQGCwz58BV6/YswmuENuA0tBoWGE2UcOYG/4iM
	 vvmYwCxjvtKGQKidHq47EkEtmkeUPjWGnIrMjPVTLgGRuc4MReZKlbSR/nsO4k8jV1Irc
	 Q3/QhUzOVc4JaaSq/CyoFdzA4vMZCRe6WUSe5b7D7dZ24A68WLYaGrOuHFWGSBKyeCyGE
	 lMDpWV1tFd/bEdJ+j4oOL2OzrOq81qiepAV4X16vOVmYddEEPIORi8wOfkIdK8QBL7MTR
	 NMZQmtZNVelZ0kiRufhh+9kCynQmMjt2arKGe1JKzAvkJiu/tBcZanxO8MZPLHquRbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
	b=YOozX6MeHm/FAkGA/poCwkQyb7xEda0xt3vAPI06K54PzUax38vuX/vKksa8r8knOe08
	 21T9sJxzvX3mdIBrIDr/iR3vGVyZxT4OThePjO7/a5LRK9C2TyaEsfIx/CrRnYpWBp/S+
	 haINvLMP7cnvT9TfhMSfuafWNqiAA/VgQ8iW18CiIhK0LEMeNun0HEGXdP0R556e+dF8e
	 1zcB9/DX2qVgi8ocQ2Z6A6neGafMGVE/jeOtMoYEpXkSaJtzwYn781J9l3eRWV2+mHnKb
	 L/JYlgDz1AJbqe9K5MD5C452fV6Pe2V/qqY/6hAHddrweR0gSac0Stc70wx5usyg9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQE83O7l;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCDB606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCDB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQE83O7l
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-745497ac8fcso154928137.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 19:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155120; x=1793759920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
        b=mQE83O7lN8QiKB4YFOlMv4fGZKFIXikVyTQ1nRMcjsRrDZj0iZPt2NIjzaiBVW3f9i
         MM6wCtffv91D9M+fjhK4rUrcdn2u7DlYtW2oHEyzXSsgwMvJvEjnXv3o2uSfS3J7wAWi
         VvtpTzHDP+Fq6fMs8CB8lHmr7SPlB8ayjN+Pyyi5To5Fh8egEez/YGgWyjUxzpDBF6m1
         MPvvc7M8XSb9JodH36OFNHuM2TtPUp+Zw2Jw8BbS5rJxg62ASGRBXf+G4PzwtC8CBteJ
         gCEmHByKpWiiBHo3ftcelFcoVY0kC6T9x89IsrulJi/yu1drIA9u2cdG/OUOtZuO43YD
         8msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155120; x=1793759920;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz4u3HpKUz23LFhmma/JLWrak4UGChsbULg05R22p2A=;
        b=wkHPxdRzD0tscGvJob7ZrNwtRB4OZrGeMez3E5jga5hCAfNxinyjhoer4825OmaSm6
         Uua/XTmaJUerClHUnHCAMRn0jWRhKti8sDy0ueWbX0o/X66WANkSaOCSpNF0yEP7TFRh
         hBugCjFVnVJy8Kb1Hc2WrvVEMSN7T6L/3ki5V1O9upAPyzdbWN/nXmGMiaq5NWBbqAdh
         DPf63r0BZVnDf9zcsh52lbMfhTnfDonzmP1TbrpAxxKalf0lC5C81iylgHiilbhI/h69
         hXrlc58w41FKxkOrrGUyxYfRQB3M22CrSRlfnese9yf/pq6AIfVk6rvC98H3yg8Z4BIg
         srCA==
X-Forwarded-Encrypted: i=1; AKwUvBzZAqMp7lvsQqDDQzPQOAvih5e+xSQ8bOkvIDuzYj+EpVuBgxDz+SMpHtRklzTJP+sPyB5/xRY1t469orc+q58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAT50gKpsJnOorejea5BZvSJ5DKO/66wC7mQq33ngcbAjFaYi2
	PPbWYMcjTLHfHdhvZpj95HTtw8vHvM0rhrCZOxsuTlwyAONq9qb75Jxe
X-Gm-Gg: AYBFou1mtUr3oFcPk50+PGBnS1wbVpkzNl+76HThCE4kfeKypz/Pi1HSd9aERzFuUEE
	XjTDQ3jS1R4iPvC4zgjJQpchjY9W3jI1eutkoE7Wmq1cJgkYY1TPSqXZ+O/vULT37c6PnTroBb0
	zWwbVXoRzPXVJyQ+dzn63qow47aBGgcPun6QwuGSM+qxnR0bk+844wxac+6jnzlHuKH9hUSbt6B
	duOST+xSHAxeU9m0rXkLeEYu/e9dznMAA6bM9clJsyDHDTeH8PSJ1LvEROR+7o3zq3b7iwLpT8+
	RTxn08zj8GhlfzWVZSUVLRUCrV7HKSdNQa8JZk73z51/PnHWDbTlM/yCgQ9wM/ZhBQeyFPV0ElH
	S/ff4y3xPg6cowMConEsIYpPKpSMwMi/aEhoDQpvqS5pesFU3+Q4VIVWPXpXaQ1aGP1FpTnZiHa
	U1KQnYJrDOTWAP6e4vKAwMt4tOxgRwwVyPBkrGYNcQx5NVjGYQ7InOr/FHKIrO4tMXmZSspjCeH
	hX5el56B8LrH7ZyPOBYhC0bsna09CuoD+DomQ3ppr2v1noeM0UnR+4LZF7sxnU+1zGlR0UX2opf
	MOHWn8Bzuz30Q6ej234LI74Tr2+bnHxvZ481I9hBCzV6CNO3LnNLM7NBE9HOqWx5+FMi49FT6N/
	UMx2lqGG27wuB9YhwyzYoC8qh7ptVLAlWEqxHZbTKl7/EA7Hs6DLNVqSNK8DlTZ/FJtrB
X-Received: by 2002:a05:6102:1499:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d03a289d03mr511256137.4.1793155119764;
        Tue, 27 Oct 2026 19:38:39 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259eb01asm4585892241.8.2026.10.27.19.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:38:38 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:38:38 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jamie Nguyen <jamien@nvidia.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 netdev@vger.kernel.org
Cc: kerneljasonxing@gmail.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.21cdd31ffbfbd@gmail.com>
In-Reply-To: <20261027162945.2122306-1-jamien@nvidia.com>
References: <20261027162945.2122306-1-jamien@nvidia.com>
Subject: Re: [PATCH net] selftests: net: txtimestamp: fix out-of-bounds read
 in raw UDP checksum
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jamie Nguyen wrote:
> With -r (SOCK_RAW, IPPROTO_UDP) the test writes only the UDP header and
> payload, and the kernel adds the IP header. get_udp_csum() still expects
> the IP source and destination addresses to directly precede the UDP
> header, and reads 2 * alen bytes before the start of the buffer: 8 bytes
> for IPv4, 32 bytes for IPv6.
> 
> ASan reports a heap-buffer-overflow for both -4 -r and -6 -r. Without
> ASan the read usually goes unnoticed, but it faults when the buffer is
> the first chunk in the heap. That happens on Ubuntu 26.04, where the
> kselftest runner wraps the test in uutils stdbuf, and txtimestamp.sh
> fails with SIGSEGV on every run.
> 
> Even without a crash, -r packets were sent with a checksum computed
> over unrelated heap memory, so their UDP checksum was invalid.
> 
> Build the pseudo-header from the destination address and checksum only
> the UDP header and payload. -R and -P already write daddr as both the
> source and destination address, so their checksums are unchanged. With
> -r the kernel selects the source address, which equals daddr for the
> loopback addresses used by txtimestamp.sh.
> 
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
