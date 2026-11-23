Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460302;
	b=ldqEElCx8HtgFu9bv6m96whZ7G8xcisWakeme0ZraP3c0qa35GwNdWlrNlVjjlMG9KTy
	 aiD/DyU/KSpDNtxfqHky2nfygcou1R2L5LnjBFf1CuWzMbEMO5pw/EIHRRHc7orXQCGBB
	 mBTbPpoWLinxZnvYAYKK3WbUbfPtcDAfz3avKMyoh1AH+rfPDKlCu/rU8haINDlIc04Rj
	 qkbl8DLfPcimKDb1yquE4/jd1WyXtcg5rBOml/iBDg390HUAK+6EwUKt88F5t/lvCvFut
	 tUqt+FWQsZQMWtnG+qlgKQppZ/6MOQV5LxlVs+fWJvufMqGF7xzkia5Q5PzUw/Je7XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
	b=0NR+p7+mZizAUal7H3JdnHqvKquo0PMfKxyy9hav/37scaVwTcdrZkxeMhbeggt+vib1
	 +DmmoAU6g9tQyd52uJ1pHevWJQos2zAVt2VGB18XeOlprQ2LaBOCEZDaLYP8K9MBkWN1S
	 IypUm8CS9pp8r0aW2gVr1e2fLKZPl7UD9Irxm8PExseNev/p909F9SNgy8heDFtzmkaBw
	 nwPVcWKD3PCM/LuRL6eZJuvXMSUOrhzxDb0N5IZ1atczR1OhsFz0JflWtNZlwCYP0H0SM
	 CaQy5zK8ztUtwKK746CV3BCuRoX0dXAx+8hirfww5/HPF0FSsvnrH6eEwKxbxpvDfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N8uQQ9zq;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D834606A338
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D834606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N8uQQ9zq
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f03eeda984so19384325ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795460301; x=1796065101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
        b=N8uQQ9zqCvLqVkvnyvnVbhu+6TV7nHRiuw+8iRBZfCP5sGACm3CbzXAMEwlnKlxL6c
         2sp8gle6z6Nvld8z9gE4YXYb7aPFYU+gEa1ohnkRRMAStkzIuy7V2r/y/K/0J6iB+waH
         mMLs6lZiTKTylnbAJcn6T2nfkY46Uf2w2gEuYFRe0wczJ0CNVU9UT9hISPgInUnORpg1
         2lOGA6HgNYht13HNxkqXa3S5zYgTxigIinQ5XUV//kWjYQuE+d72qZWdXL5sG2KRO18x
         qLggypraDEysFWmyspN1PjVMcw4fHM26RghWTseWkYClowQXphvD5Ag7nq8mdjn7iXhm
         6XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460301; x=1796065101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQMIxscI/2LNyHZOcxmAS+nacwY3kAAmlBeTIs6xu84=;
        b=BZL87T+Wm8my2bB90iYVHoCXJglF+2NlWf/D9GsgRp/cFiNMX3YBIryZGEl86SP6PA
         K6RH+XNjhCN7Wfo/SrUy3XB3a3QTN0x+9By7Gadwwg7OStOVgvZfHVM742j5/CWsF62O
         v3HEM1gJstCDaOMVLryxE/8oPPkOb5e4YCV65p6kQexeS7PoqfT9XedoCsyvjlebopWo
         PBcxUdeBtaRHkBxycinJbP9De3d91mpvDTXsrC9nbMycBsdSKAwkO4uLfFNX6ajBKWoC
         FLT/2PjPu5F59UAe27/DJFd6e82Wio8750/ZfLOkYWEaUqZ/mp0PzsOuzqQV9AmmgS3w
         AQ3w==
X-Forwarded-Encrypted: i=1; AL+hErGBIjax8WTtoT7WREbfUb5WL73hzUfPPc6gWAT/1xwMj76ZgAT8kFknPj7+DRSsteVw77DHnze3EDX3J5mNFmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S1/upuj7K3INkSkVtwID8YrmTp+AojCIv8ZqzBaVQTJvaBvV0
	dTeD4C48cbkBy9FntwVgHV2JIPjkgiOOQooSLjzfIR0GfCr3THbrG/Kb
X-Gm-Gg: AZFdTZfCsPg85YjiQKBmOYx3DAPubO4SpHmr/Oeh8erM2U8SOp+L6/AwrVOSNy7RJUh
	6N4Qtk16zEn2jZImnCfUUgEfH8WUgC5zdE2XOtXXtzVckFeSVjboQ8GDDGYpKjDmQ8J4iVMhgkX
	2zAgpkus5wF6W0INxx8Du2byWu5hxpHSOzYX+7NHwHAT75FdR1fiKLLPNqj/Ny3D+RiTn6ivg48
	NyD/Qp756/tAh+BqGk9arPr/zvqyi1MnCfdYfAcogBXxic0y7wmtdxAI/b00iCWZkBV9V4WCthD
	oieahprN5SKcS+gCvScswRnorPSYF007AOED/yAJDA8Wycr7z0iLxDIMyfKhyPa+g4a8I1cRRp/
	rXh57lxKToW9E1bF8gqFz3dmc+diT0p6DC1LLhL3dtbjgTZvd8rQKlLJdfYE9/9gd/juCoGigrQ
	WEXdoHS5UMtnadxsuFe2eXh5ood8QJ7M7fxYoCojqjUv93DaPvgmkTJPY44cZz1eK3+/ix0n5XO
	ZevtLqiaYiHhgEa2LGOfIuiwWNQp8Q8gYRf5igTz0JbuiFC03nmwkCyOw0MND77LlbdNWGWs5xZ
	bsDKP3WzQ5ZKB9mTabUWOmGtSnmWxJHGEFhSJop/0Yaoi8vN4wG1/BazVKKYhbUIqS0U3OIhLTG
	o8dan
X-Received: by 2002:a17:90b:2c84:b0:3b4:409:f173 with SMTP id 98e67ed59e1d1-3b41c7b6060mr11582462a91.5.1795460301096;
        Mon, 23 Nov 2026 10:58:21 -0800 (PST)
Received: from localhost.localdomain ([103.248.15.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b2156c2sm7758540a91.0.2026.11.23.10.58.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 10:58:20 -0800 (PST)
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
Subject: Re: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Tue, 24 Nov 2026 00:58:11 +0600
Message-ID: <20261123185811.53107-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179542917290.3135.7119976710700884013@kernel.org>
References: <20261119095256.42005-2-ilskdw@gmail.com> <179542917290.3135.7119976710700884013@kernel.org>
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

> [Severity: Low]
> Is this check order intended? The lockless path in vxlan_snoop() calls
> vxlan_snoop_same_remote() before the NUD_PERMANENT | NUD_NOARP test. Here
> the static-state test runs first.

No, it should match the fast path. I'll swap the two checks, keeping
the nexthop check first, if there is another revision.

> [Severity: Medium]
> Does this fully close the stale dst_cache window the patch is meant to
> fix?

No. This is the window discussed for v2 and v5:

https://lore.kernel.org/netdev/20261115040600.61033-1-ilskdw@gmail.com/
https://lore.kernel.org/netdev/20261119095246.41685-1-ilskdw@gmail.com/

A transmit that copied the old remote into its key before the reset
can refill the cache in a later jiffy. vxlan_fdb_replace() and the
other dst_cache_reset() users have the same window. Closing it needs a
generation check in the transmit path or replacing the remote through
RCU, which would change vxlan_fdb_replace() as well, so I would rather
propose it separately for net-next. This patch fixes the deterministic
case, where every move keeps the stale route.
