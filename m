Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B832142B
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910518; cv=none; b=Tem/V/wp3r3fDBP5GNxePhZwE2xkmvjw0ntehFOgQeJjcRJZAfxR9bDyMnyZYTIkiy6MO2DrhdIr7ncr8PKUGL8dgDfouktyjNdLdCOsY3LTYlc/r4/tsazSWbitK1nrCEdFVYuwNPAd9G/f9Izg3ltnCNsLW03L87jMNcZQDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910518; c=relaxed/simple;
	bh=1DFTVj3pJY1s6gMw7gzZwqZ0RQ4l6j3fHS2dBB5xI0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grOz5BGonCQIvcyAc78GreUbs0MSZ8J4h/1dpEAniky1m7Jchbv4KmT2TIArUs5/Kqk3hUF3gHq0ma1sGrRVqR8gY0d6vuaB7MSe+HrmvAtDkvyj8JJxYlh6jhyjyakhKVLHPsC8ukQ7qOYtm6Nr9IUCBjxANAUPEHx+rj2BJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRmEGAaG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRmEGAaG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cae1a3a744so4980335ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910515; x=1785515315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9vR2aGNsACSZcu5zSecY2lRBl9pUsU1K/NomQNXicc0=;
        b=YRmEGAaGizaYMuAXGB7NFih/7svluRwB5gPKPlyiB7cv7bLcsow0dX3abpQDbm8KrM
         xNPhU6Riyz5gmXPu6LFqs6n6mxm45wDod328ERz8NB8xi27FotGBqR8Cu0MZYDIXhwv/
         vtZqXFl+hnxX+y3+eTDMi4e+qFNe6dzxnqCNJvcEMY9XSLJ2rAesCArzRocf3C+OzBC+
         jgaKRpYRWcPGT0fPYzNVmVfaB3KpXLCUNymHBQgq8mrBhNJw3qeFVsIpP4FbDCxPtyev
         /F8/d4YTEUpRFrxZ9PfO/owLrqkDbwe3v8FBZ4GHlrfVvA1TiQdEEAH2AcRDBwvHXWZE
         GjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910515; x=1785515315;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vR2aGNsACSZcu5zSecY2lRBl9pUsU1K/NomQNXicc0=;
        b=n6+Deq4IHywuuFO+PAQeQhC8/6CcdlM4aqWJBui0ZbVP8Snu4XjFESp4r/Npj1N1LM
         /GYbx0OCOujvgDFwngPeDU7sqp9BMqjHvN7Bc/S6upclDpOKAm84V3jePd6eWiWL6+K+
         TvNC4UJhv91eNsXi4+VEEdfxeZFxw5qmSXBGTkQTBTcOU9eWCrHCpz8yJMHoiGyUIhdj
         2rY736FEZ48REJYejKc7ixmX3AeROZOqes7buafoFCeO98+qpOE5KEbk/DTIuDIdpRZx
         StLcKAU3ft0C0PIGY9oho3TbN4ETnHLPku5c5Z5wjbD5070tPIY0hGJZN31gdxomWfhj
         mEvA==
X-Forwarded-Encrypted: i=1; AHgh+RqZ+/ig0QT9uRd8XPNGYgvJVv8f8sNfbvHcnH+b960mvg7RDnwprK7/t52qyeZzguK6jxjq/beVQWge8ZVU6rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQ3oBkNJps4Y4HNWrbGS9uvm5+SSF4nlVaIbPEd2jslOYQcSu
	M1B6H15wDNL/QklwbbFSEe7ZEeKJN6wkBcQzNwW1lhRUsCXAPC37G5WH
X-Gm-Gg: AR+sD13aceXHnRlDmNhnuw6FRBxOS4h1L0AGG88NTJFR8y41YZ2MOpjnKwVje5vwuwX
	mF/4z3kvf2cZM+naUF7i4fyeeT5QH5NjrfvbNH9cTA9zn/P5fBvmV9zkCppHvxr9rdW/F4l28SP
	LLpRPzHCmYf55Ow37E+WmuviJHFDCCR8pQaQshw+UQUkpDD0FuUzpctel485TTiBM6LH0Tusl1Y
	tYsL/EtKKqG/1n0u0UZXf5czgNQbgPeyLZQZH88F026WT7FhuhBN/FYK3mF+5S/iYI1P1zHCYv+
	ywWRoTOHUh1nsoEdt4msbrmup+SMDCEb3bX2KKa01npnc4SV7QzDjBY7ryuUJdzUulE+nEPDJSs
	DFbh4e18V2SnWNSL5eYM+fS80rCKZCFvAtiCNMzLqnX0bZXyT878cBZFx1DBZvODI780aEC4P0r
	aWxdD17Vr6+EUu1DYBHJv4w1+iNo+2FWgUUslJQJaSa3zKZQ==
X-Received: by 2002:a17:903:b10:b0:2cf:bf3e:4812 with SMTP id d9443c01a7336-2cfbf3e49edmr46291485ad.2.1784910515543;
        Fri, 24 Jul 2026 09:28:35 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd849asm54371185ad.28.2026.07.24.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:28:34 -0700 (PDT)
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
Subject: Re: [PATCH net-next v5 0/3] net: nexthop: per-nexthop UDP dst port for fdb (VXLAN) nexthops
Date: Fri, 24 Jul 2026 16:28:16 +0000
Message-ID: <20260724162816.10207-1-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724064143.09de074e@kernel.org>
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com> <20260724064143.09de074e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 24 Jul 2026 06:41:43 -0700 Jakub Kicinski wrote:
> Please push the latest patches out to GH so that we can point our CI
> at them and validate the selftest.

Done.  The iproute2 companion -- which is what the selftests need to
exercise the new port -- is on GitHub here:

  https://github.com/jack4it/iproute2-next/tree/vxlan-fdb-port

That branch is the posted v2 series on top of iproute2-next: the
NHA_DST_PORT uapi sync plus the `ip nexthop ... dst_port N` keyword.
Both test_vxlan_nh.sh and the fdb cases in fib_nexthops.sh gate on
"ip nexthop help | grep dst_port", so once that ip is installed they
run the port path instead of taking the SKIP.

The kernel side is the v5 series already in patchwork (series 1133589);
I can push it to a branch as well if that's easier for the runner to
pick up.

Thanks,
Jack
