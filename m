Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0F2DEA89
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289512; cv=none; b=iM6kOKYzP0imjlY2gCnSLnUGa0e7MJ3c3IMjMTw2gTxj3i83EQiGII9UFEq+GrUiihYFhoHnD64R5fxJtJFy6ZhYLh9jjdafx5mCMcmwtgodPrRTH+FIzRqyuLWiUcimFmrmasH25mfCdfuPsFw4eIhYMzKrZ1uqfWzlnWGoeik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289512; c=relaxed/simple;
	bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPljZHcZGU8dYUAt7utcMewQYMtJHGWqbH7BclyinzkK9KG7T+yhTIdg8uinIfbcYtPeawpUIa/TdrSelEKhXLf1LoP0gRAwIAi30fnenqj2wXuNSDrp81zj2VXSAZle41hUcfuL/x993HshG1S0mBZXHqJ4LZjFX3KuXM+oqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=QQIw8NTp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="QQIw8NTp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso1771728a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289510; x=1792894310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=QQIw8NTpx0NQVnPaElOZevzSeEGsEd1HNJUlehuDS2MEursrdpPIEapiL/nlrwPAE/
         vq1GtTOJLBBFzsy2D0eKUgVaMXkXNnlc9hM9pcp+OFhy1Qqea/tzUdKQb4PA1t6akFN/
         cHtMznWJFCw4lQ27SP+Fn0vLmmQnDzceYS703/4CVpDi+IOwlQpwy+l/6eu2+UseMIPO
         ag5rkYqKZqUJYwHjnvtlCMlqbB16c80fXFZqqfGFY+Fc8LCAzS1UAKU7KONBsC0sLibl
         4CEkkS5xkd1WiCOa1QExUiKXoKCDozL1d7rLPQHNqv3/HHW6ctYc2n7SAyJEMueDqmDm
         DxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289510; x=1792894310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=f2uVKkjcq5FK7iFA+N8AhIgydz0wlQNxe1bnMs3+46TtOsUGuk/RaeBua8KA/0GFri
         ln+CGoVRdc4Z/knM7te5IdGBpKOB6SGXOY4bBJsxcSZDyFbTv3JtnIuZR158Wwjh5s+T
         2U1pRVR8J/bZNKfV7weOlXWPmVYzYRwy5G4Y0hPpnJAl9kcmTFz1M8GXmtqwzQoJcjJG
         6FCBiQuZNipCe6eQ8LoEvV49N/tu6vFLrdTA8GEjq1ekPART+alkyq8lyFPACy+5H9RQ
         I+I+4HZxVKvNHU/sRpGoJ+EPKG4Bpnlvhd4Y1j5d7KENMnrSMyWDU+I2SHIlK+ocjRyh
         kBfg==
X-Forwarded-Encrypted: i=1; AKwUvBz6oRL9a4wh+Z4j1EZSBc5sZBqoMhZyjqVwNQzQ5CEOdB+sdJSXTi7adIaw2TgG8JYyHLX4Q61gYgDjnJDb+/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt73t9XkwDL/6Jch1cZGHACVCVh+290f/+5SQrota1w6KRI4Mv
	zIHM0UupydviUnniTyqNeg/MBwkfP7Dw6lRBz9aWnmch8ZiopdJ87I2sRoc45qhv8w==
X-Gm-Gg: AYBFou28Br1SjjZclsw0lqgpXTLkEE1IOG7TGigiBX6cK47eUpOmJdH4bCPg5r1katB
	QA7onuztoceCkSTMTd85zkavU7p9xh5DYdkWRCoVt4+SJNraP05SpsOWWrV4La86So+1jIJ0+z8
	YTwtr1SFuCiBxQfgC5icR5b3IU1UNLS5611wy7QlHVb5jJkl+uQiTmugkIRLbm+l0Q7KaOFVnla
	EEgtUDDeBOerE+mEJ5ox4dwmqf9wRaZfXmt8SxP4qWVpj5QQVnfFe/wttNARyAIqr9DhxO4sHV6
	WYVSYoY7mBsQ+7fF9LaBzFuCAKHoFVr5imUbiYq59OUDh7KrjPVWYeVQbb8cHCzDObfMFFaJ0w/
	t5mI2djkVj0eWsHoH56JYvkq1CTw3/lH3f1+WDAtCBkUCYm/KZKBITmB+KI4c3DAPD/WpzZtkJ/
	dVFIgwYiUYMOSkeLBcMeGTjU5prueIqN4Ur4utls7VZ5h4a9kG1BebomBYrEvEVkouB4SrkZdEH
	E2zP0tf0kP7rP/wVjFfDUcXH+3JoU/VezHXBmsWH/FKs3tTFeC8qdtzN35i/CzNiztrtXP1MtkI
	Zs2GvRVLmPBj4xIWaIeZX50gi+PStDN+ZvON6mTGG/1c3OJymxoDwMONQ5AmYySLfAI8zTbUKOf
	YTh9KyBbPp2zsqd6TyvNPul1NDNZOVVDAxyhdIoc84jpHNnEUUl28GaaThxP/Jh/6w2oOxMeK2V
	9tIR5GOVCD1jdk62O0qhwLS7TsraFxc2HpxYLLfuH1M7u9Za+TRIRCshd98pcGc1t2Lul3TqACI
	f6er5ot
X-Received: by 2002:a17:907:c48b:b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c41a08dc5fcmr283934966b.42.1792289509761;
        Sat, 17 Oct 2026 19:11:49 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1835sm224698366b.79.2026.10.17.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:11:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:11:45 +0200
Message-ID: <20261018021145.3769432-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQkUoH3aa-J5-vf@chamomile>
References: <atQkUoH3aa-J5-vf@chamomile>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:43:46AM +0200, Pablo Neira Ayuso wrote:
> I think we already mentioned this only works for hardware, this is a
> no-go.

It works in software too. nf_flow_offload_forward() and
nf_flow_offload_ipv6_forward() set skb->priority from the flow, see the
nf_flow_table_ip.c hunks. The selftest checks it on veth, without
hardware offload.

Julius
