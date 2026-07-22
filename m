Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AF3D565F
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 03:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784690915; cv=none; b=hCnpiGYF2XbrDXO/OtS9eEQBlsGJurNZZDDF43nQ/mpYw8fiCAivlURkik4kJa9Zn5ZoyIWsBx7+ySqs3+deAW5hxJZlcjza/vXUc8CxJuBf6GZdYVcBTtJ7JCjxlKOgpurE0ngfkPpFp+tvpwMXVclQS8RADRgVmZdjL9/I8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784690915; c=relaxed/simple;
	bh=U24iLOn5ceW/2lhbjmUxhZCsfbLS5rY8hugeyKJcx5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGkEArZ3RN2xhmZL9FmsO0X/L/l04+t6m9EcPXTbJNno+c5BWFqo+CdU45PN4LNabAEJ20LKbjv9frXANbpU7qQP36wBoejcWf7bj2jazfdQpkHdRBrMDM2LvBSOZ5tYNSUQYxRfvn2ycAtD53wqQthxOQgVs0fC6JgrHDXVZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fchduj1y; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fchduj1y"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so4095156a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784690914; x=1785295714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lqR1pQ6AMxguaF3FILwkKo0jVgND2IUORkim80828fE=;
        b=fchduj1yGMDp4aPP3Za3+IcQiHKN23+1owRMB1OtNvjOJ8fnf37p+v3ZUjpEW/fucW
         4UMdcg5k7CKStvGoe0WAZ6z0CBwBfUkCu8Prp1OqEdiUcUx1CHqGwQH5uCKpqAtMehs4
         So+ILBoYO0m5/MK7vjrbUX8Rnp4WENxyOfcP4AVrbaWsqMBbcSHhqTwaibe0p8rWbrLG
         K1w2x7plyP9grlqm/7/zBZOOd3bNDCOILIk9hIuCd4k0w6i1NOpbkmx5L+7BHzq5ul3D
         PEePd1stkvJF7FaDCrsce+paH2PSCt8AfJpBzTs+IP6EdX1GPEythUKb5PWub+P57LdV
         GvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784690914; x=1785295714;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqR1pQ6AMxguaF3FILwkKo0jVgND2IUORkim80828fE=;
        b=QIV7kKsIZY/eM4a5Ui5yuH57wiVeff9HM3QvMibKIPDng1g7irbedyb/LQywC+pajF
         pysXgAScWn/FPbZjLEsOGvCU5dw2tI2F6jBJ009Um/mYymuMXMp+1M4pHTjXPEsteVTT
         qVfg0AFnfhfTFP/+YeEUEoi1uHEgtbb1ZEb2OSmXeNuYf/eFnvy5OoZw0BGWEmHf/f6k
         zzsCN+xlVDqFZUNGnJ3ea7YWplquErAF586ConW92HGEBqjKm8dn4sBtQjOEWB3dsTBu
         GDh6FG/NiFhDJqDweN7tqxrfGWSNSBvsS0vnVWzDz7YjF/D/LvT1zrKd2kzEBNGHwYAj
         OFxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzha/z/qiR2CJWsb2bVl80YvqmlKKzkd4Z+LxYN0ejqlRXkiHl64ojvw9e/e43KU4aE5j3JcAaPMwglT6LoIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGif6jLQEI4TweaJHH1W57k8yllC8x0GZyPR+dRsl7sYqs4w+V
	RYocPypuppQL5ZgNFknFJL/bry5KAk2QKjCew5Su4OiVokSw8ExoD1Ag
X-Gm-Gg: AR+sD11rsywbUJOvyAMDhBYHf93B0dU3wxqHrLeizJujIhiuBFiWVzxiLsdpcAjxB0L
	sceHb6m0AUSUSCnupG3aDCjNk6FJasDD/0ZwngFP3sRkQoDzWLP1xjNxFVIdi6gC79ZcgC2CwqH
	avwjKlkexIip+dYII8R/C6+Rhyk/Pw2RGWuTEta9Y87b/7v9gv4iuoYq4jTMJcCvsoPCUWCSxNH
	QJVgmIG86z8vQnk0DK4DPD1zVVg9rOHEIkVWGD0OQYM4R46/btKdsCWKwqC4gsQ5Hot3wpP+9ze
	qjEAye6jKNz2MVSDyHifgf/S7v+B4BKWaPtbhRWn0pJwwtWa9OhS8dHIqUYpROUFQ2ZuTPT9ZYZ
	ICEHTybjKzyag/oTrUFbkBzaXhruCM/SSuytjEgo/0WhiKkK86Px9sCQOXLFupb24NWlh2+ow+K
	+I6NmbzjXzHl1z0rjAQs0e7MW89rTHDc4tDQWXEvhqJuvH4Q==
X-Received: by 2002:a17:90b:2805:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-38ea33d3ebcmr1920262a91.3.1784690913704;
        Tue, 21 Jul 2026 20:28:33 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b43214sm284134a91.16.2026.07.21.20.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:28:33 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: Re: [PATCH net-next v3 0/3] net: nexthop: per-nexthop UDP dst port for fdb (VXLAN) nexthops
Date: Wed, 22 Jul 2026 03:28:21 +0000
Message-ID: <20260722032821.30166-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721180525.197d9a47@kernel.org>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com> <20260721180525.197d9a47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 21 Jul 2026 18:05:25 -0700 Jakub Kicinski wrote:
> On Tue, 21 Jul 2026 22:29:49 +0000 Jack Ma wrote:
> > A matching iproute2 change (the `ip nexthop ... fdb port N` keyword) is posted
> > separately to the iproute2 list.
>
> Where is that?

Apologies -- that was premature wording in the cover letter; the iproute2
patch had not actually gone out yet.  It is posted now:

  [PATCH iproute2-next] ip nexthop: support fdb destination port
  https://lore.kernel.org/netdev/20260722-b4-vxlan-fdb-port-iproute2-v1-1-45199b1ee240@gmail.com/

Thanks,
Jack
