Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081974;
	b=4Goq9lVS/mapBE4zIqUbT6rE4inqin/A51tGGZKU0nWVzCQxKEpUZEgwGqo1quCJHqo+
	 VyvfPvG5PR+XDhfytrasbM4BqmLjf4Ls9FyquypYL/CP/zyP27EX/Y4c6Ob1KohzIc7AY
	 DTY/wCECRLTzX8bY033xDLRCYLM9cscrgGnpMR48Sc+OMdPpKVf8j+qhNmnI3DGjGKoF7
	 SDI4eeEpmv9cCXyxMNigcm1FQIpHKF/5XpSY3Wg9y+jt8tgjqvrqb03dP9ZR9XTqPszGt
	 R4CerLQ3CT/il56F2IiK1VMv24264W8Q3WTmnaZPiOSDnkPYoHsIn0OnmDorUw6I9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
	b=RUqjzw7OxAayxcZcPjis/Da2sZ7mQpb90vPjRGbWqy8ao+Dqv77SjUdjdWdWmOXSTpjF
	 4MHdQvYLE+OCW06zLl9tloIhWc2Z91Br1dec7D4/QXvp+tOyXRljJVO/DFCm+Zgrg6RHO
	 EtYZYWdfcChdflt86O3/HymrkZF6GO2Qr6WeJJ7p7al1TFm283Txll16HD4VIylM4hDjs
	 JOpuUlutFVcb8zgrCCsilZae1lTQ4joEqxGc19pw1w+dfLZ1GpqB+Q+FRet/pGUFAS+Bq
	 gVbkHGsWnEMuodYq0ASRYNOngVEbUITKU+84M6T5Bnnoelg4Hl5t3IdZo9wE9ij8GIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxOobXst;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B724606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 09:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B724606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxOobXst
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so5590372eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081973; x=1795686773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
        b=SxOobXstPLOetOzrZfs0cbK3qgMbmcl0OnIm5FrIaxdDbGhQbGBiGGmDrTeSsgPDTX
         XcCEPHWGikF+tGU49/Uh8EA1OgV32UX4YtDtxMFyhSlTAr87wbDIgpGdv/gPryYy5nEQ
         zm+xgVpuLpUeFJ7TUSk5G2u+uIZSwyGTH+5GgUMls8mOkVMwoFF5zT9xvY2NkKoCyLQN
         wKQ8ktNP4Vk/kHn3SXpi3Emq04CX5ScEOfHCHJF5js2BekOYIm9tkO9n0DWYo/8dOzCk
         bojiTnFU/AnKJwuukPCEsn+glmB1VmX72RUlKo4Ocn9dc2kN1qxGR+j2sF4+0nDPLSmX
         Fmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081973; x=1795686773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRr62zld4whCPvLg2c/dz1yTNce2KVNaPHpn280STKA=;
        b=O9OeBIM7Lho70gnZhOICNF+emxh0fQHl5ljYSKp3JO2C7RpYhehqGuLf2Fe1/kySF2
         nf3rQQ1Y0B6t04Go9xEvfE016/wp4WwdTtzcU3zH/9fstk/FDKxfg4Af9qR8SjLjwPAP
         9roiXPAQowLEFIqKLAx0ZZ/yCNllqUSGJTo2zPxI6hGoeFVJAFEhtoCSQPqH94OubGbh
         pxHBaRaZRF9YuRkoxdBloVi2K04rwc+VmXXSGwOzEXqZ+bBqXeEoprpDpvz+zjGtyK4F
         9KSxD3wXsSzIZtOFtyn73ra4XU2TteOXmyIvcKMYmwsTKuLLYiCrqLhTH5FQu+0XwuQa
         cv4Q==
X-Forwarded-Encrypted: i=1; AL+hErGQcMbkRm8yCp63vShDCOexMfEDK4hLHfrnY3KTDjXhkjEgEEYCIxGO9+dqTxYfRyz6GOZ1MmR3KnSd2jsv6xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C61yV1dOmBsYfR4iKMSyxsXWWybWvouERYIh4wQmuOzWBv5TZ
	drFeZwZt6Akl6nl3h5AgGu4uUOmTlLiYToQZR/2vMsFEVmo5iTtQIAde
X-Gm-Gg: AZFdTZeDSP8BuvzRfnBxJzainLyob213v2TAhWgvbANDwxuNq6ZW0Y6Ms1g8P1JiAQ1
	7n/qeZ0xNBxId1lyJojnCWs3YlDZjkaT9l/IJ7qjVqhgqDrVQCdJC9r5E1uEbm5S1SoUI4DYlcW
	2+zbJSUW6qi4UPfRRid4L1pJgyeCuycG0wMw3ec2ywiF/HoS70f6xMAQvBUjpeQ6CLtK6mZFBmN
	7YRkKGzq8TLd5hq7QY8UcXYHhQtJAr2Kqvd2OwpUn9f93wgQTdg0nMWXQE2MwmEui2TBKBVfuxo
	LL1bp+H0SuZofBLO8Z3EmYbQcNAbqcTRAycF5F6DjJcCWiyysE2XlJBBTg/AaElhPWz6FIF5JgM
	GiE9TCRAHyXnN6bWGfcMIfYBvOh5FD2F18pfEqoCpiFLr661NoikMduce0p1Ukovrf3Qlm07EG0
	BcA2FvAI7FlxY3lBo/DXG04aOynoHvU9DfUdEVuCi0it+jWDG4Z7bEpUjXXrpJ/vFbTOv8YpmIM
	qnlIAM85+S49AENZF1T+3LEPnVpsM91zPvwhPUx9gxEeuXoFmg9GdSvWMBlgRiPy8u9RrDsSwAO
	h0t+k+rbLUHUNSnsIURCxEqKPKA9lQae+r+3cVgmzMAjifQRcDeveAlgf/j9dCJvmK9TGI6RB9i
	rFU122ZOHbq+EcylCKvIPSHxc
X-Received: by 2002:a05:7300:7487:b0:384:6575:afec with SMTP id 5a478bee46e88-3846575cd77mr1637330eec.12.1795081973354;
        Thu, 19 Nov 2026 01:52:53 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm16101464eec.29.2026.11.19.01.52.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:52:52 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v5 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Thu, 19 Nov 2026 17:52:46 +0800
Message-ID: <20261119095246.41685-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179480495432.3136.17109064150958616332@kernel.org>
References: <20261115040609.61134-2-ilskdw@gmail.com> <179480495432.3136.17109064150958616332@kernel.org>
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

> [Severity: Medium]
> Can a transmitter on another CPU still cache the route to the old remote
> after this reset?

Yes, as answered for v2: dst_cache tracks freshness in jiffies, so a
transmit that built its key before the reset can refill the cache in a
later jiffy. vxlan_fdb_replace() has the same window. Closing it means
replacing the remote, or its dst_cache, through RCU instead of updating
it in place, which would also change vxlan_fdb_replace(). I would
rather do that, if wanted, as a separate net-next change. Without this
patch every move uses the stale route; with it only this race does.

> [Severity: Medium]
> Can concurrent snoops of the same MAC leave remote_ip and remote_ifindex
> inconsistent?

Yes. v6 updates the remote under vxlan->hash_lock and checks the entry
again once the lock is held, so concurrent snoops are serialized with
each other and with vxlan_fdb_replace(). v6 also addresses the three
notes on patch 2.

pw-bot: cr
