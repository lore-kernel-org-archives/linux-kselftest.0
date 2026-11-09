Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248959;
	b=NwWDpaKRUPr1QSPJE114CT5K2aUkxaGHPxb5ATFb0f/wur3ohjRB71ACTWov39pD4dIE
	 xKe6Moqzi1XZ9MqKfKE9eXITgNz4Kr+NVDqYKsO23T8zIU8OThG/eLzE8UO3AwQi5OP80
	 zTiqJ+GlQrsIeRgpWv2699UVEhfMPn7bc6d1yi8dEfoPamfgoTRnOGw2su0YUuRyZQfMg
	 u5nuKWe4Hafu26c+sDHHm38+13eOZS4PiCnG5GCdtqVpCePp1V+B8Vpx2oDlsCe8dwB3U
	 3uKfS4yAgKfxHaBdWVrYZNE5GkYT0SiaNnxAuOZ2+fGXTHBteHR851NiSYLkGk1WGfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
	b=QS/Y2iyApoerPbYXKTsLjgiR0BwZl+49G7Sq65/pMdlo3BbyA7pfbQ+hZBK+tvLGPmUl
	 GrLkEFRDAynpKsModmNe1HmKvrA+s0ZHVMrneABjJHasy0/CkfRps/h8jdOstLFE1oyAo
	 ClW6br4aKrb9GcAq+u+Lx/T1rIpKR5ZPS4RGYVvG8VR+p7zGItFxyUbDqnJO/0dROMEdK
	 w9PiopYThNgWLfjwnaSbYu4WJi3tCFJeBJcmm0Lc0WUQDzuOLT/Yt6/SXfUMwHlaVl4dG
	 ctKl4chajsU23OGc70fLv0e5BUi+Df5s4mPN5FeVisNiIX+cdzJj9VsitAv7IEWQf9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA665606A5C1
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA665606A5C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLFcnmT1
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so550151eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248958; x=1794853758; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=jLFcnmT1udEkBHH8ARZmBU+AHoffdfpm15WgGjDE73KYjuYejVwNQNw4vhBCFbzzSZ
         3HdPMNTl/3sOA+nmNz9n9I3cN0gI1TLo2PuQhNV9jjJ2mdGIaLXQuSR9lEXNTqJtiEGT
         b0ali9Y0D/2oBxr5WuI6PYyCSKic/EPQHdL40/bxKAyTduon4WIMOaG8Czke1mc5FuAn
         7NXD3qXGcob7VykrCwbrZOpUZfPsRvMEcatTaNLvZ4DB/VrDCPWBmccSqLSG4klLZ3zF
         cOKVFzgLV1jlFqnSNxPQQiCRxZa/1qLNeXnSMrUteziGLz6fVM/kBOjY5Xi1sgYAs/5P
         UlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248958; x=1794853758;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ABICdwqhmlXu+0O9sYf0hzD9JleqZBucAewgH7hCEo=;
        b=jn9FQsu/EkQf/ozwcpQCTlCKlpJ9G8T6Si3DMvl/mwiysklXCyQ85M5Pk9LL264PO1
         nq0XocAtS8sVEpOOp44/xS4NuIGFKysn+Uwj9IGg8hKHFggybqUMtLKU/ofTByJyen2l
         DQS4/ZRdt8PqpmM/T7+KISdd7n+xHh8WpO1JoHrsFOmfPN99T2CNnEjIVU4HD/p2YED9
         kh6auMa48LuhpMFDQ8nLbfN1sed1AZmKg+NAchlAHbwqhqdONLKYmDkusmugc9tahwpu
         pOuRmtOc4lzdJz3eVQn9kMM03/fMb69Bfw6EQKH6ORmHsey0HjbhfRCnSjUtSzI4eF2m
         Q+oQ==
X-Forwarded-Encrypted: i=1; AL+hErHVxnH9tMZCxSVLxYaSaQQaHVUuUUHMg8319NJqCCuZ8MrcX1gbStBmZMP5J9KjpqN4DtOr/A562055HNPqt5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/bA4hMSLFJk+KnGgOFGiQDKxHJhfq26g06EGhR67S31xkRPhG
	JIr2qB6S3g8YIMQDhigKNNtY2c7JlLmifQJCeIq0RP02N7q8nEoyDo6V
X-Gm-Gg: AYBFou116YpVEeBM0O8NF3Y9cEVgadW7x4qjXJ3RaWN4+OTrEbGEhAsHcLaQiQT/Rx8
	q/edVrklrizk2mY7bgD2c/g96/Ryp9UgBMvFVOdIGciDTyFwVA4CsvoUSJh/pO62r8VJz2V+Gsg
	DSlun/UnFHZpCP6qVuRvOY/3GEklvZja8U48GTdEuKrnAUJ4lfG1EnGsLxighqoTi/SgaOfEkBu
	cHv9PlNGUzgktCLlWgq+7NfJXm/qkJQUv0mzf4IR78+IytK2Y6ugqVrg7kRZT5HGll8KAPTzlf/
	eBb6NASZ9cp29pwZ8ZUHhQjBosT2YCKqy0qC67SXimEm3nGVqx7HWa7Wmb6BN1iuK3qOB6DCYHb
	emN6ZLJqbwzSb5vth7q30i0Q8XvQbVDiEaefQohpujvSq1Abuy91uBk2+DkX4/jeHQnbOAJvceC
	8q6uA6QSqgOlaLxGka4KUssJmhPnF6leZfIHG5/82ZOI7JqtbHwjy77FQxFXzrNHZcQ7V4VNfuK
	6g/sW+Bjkt8aj6W8aF/otXL2y731fv3edyLNP+17s6ZID8LG+2+NuC1vgHp80vg1SMLMeeT3Wlh
	J+p2PXwgiOF1x7IAH4bSALOeCSjddRzEVA4vUE7004tj
X-Received: by 2002:a05:7022:b90c:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3b5fd4344mr353755c88.15.1794248957752;
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm722817c88.2.2026.11.09.10.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:17 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:16 -0800
Message-ID: <3d2b8463b7ea74cde9327a3b8678f1e5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418738408.994134.12387400537759262351@kernel.org>
Subject: Re: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the
 dmabuf sg table
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

> [Severity: Medium]
> netdev_nl_bind_tx_doit() now passes niov_shift == 0, so a hugepage-backed
> dmabuf gets 2MB TX net_iovs. Can a devmem TX frag then end up larger than
> dev->netmem_tx_max_frag_size?

[..]

> Is a cap applied only at build time enough to keep that contract?

It's not, same as reported for patch 4. In v4 tcp_clone_payload()
won't merge net_iov frags, which keeps the cap with large net_iovs.

> There is also a related issue in the same code. It is pre-existing and
> was not introduced by this patch.

[..]

> Would either of these fix both problems:
> 
>   - compare skb_frag_netmem() and apply binding->tx_max_frag_size in
>     tcp_clone_payload()
>   - don't coalesce unreadable skbs when building MTU probes

Not merging net_iov frags in tcp_clone_payload() fixes both. Mina's
series also compares skb_frag_netmem() there:
https://lore.kernel.org/netdev/20261108013838.1454450-3-almasrymina@google.com/
