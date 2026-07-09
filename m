Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB83409614
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592021; cv=none; b=ncBYFzInjTD/P4p+TR6dIpKoBOPCuVU0D7xCSQwWhv2jCBqTLwdTgjHKS3xyGPTBFXpZrqxsNopFis4BaT68H5LKDCodQ5EioOmzUhQdAx8EMgyMGGrSSv9TPutSY84WS5yr7zERwXdMBGGRCJSCcOkeUHNIqDzEZwahGM4fivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592021; c=relaxed/simple;
	bh=xQmBxphDa1xFrmI6W+JXkKRcOnX9uJkuJ+MRhIqYj0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GUzwwkhm78xmq+l6/sdIg9JVYWrgOdjaohRdXZU+bfuZPOsQsa4cK0AuXY+GY4tW9AxABAA31YNoN9aNEqbXWxltgCpdnUh7HmBdED0qr8f0QKnC2rQGPcI128698hPanKoSXIyESCQ1yxecFZ08Q6KaN5h+c26rOHJYtN6Ltt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1tQ9V74; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1tQ9V74"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1103810a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783592019; x=1784196819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQmBxphDa1xFrmI6W+JXkKRcOnX9uJkuJ+MRhIqYj0o=;
        b=a1tQ9V74DAsM5NBDHGa2IFBd6HkM2fDLdkXmM1gSeVz7Pd3B7GPOvmIuPzneR4R70I
         1vkjaGVHGrUpho4k840zDoL5UKT1F6CQn3ztONvHaKoBGmqoq8zV0RFLoLJgdhj74sBH
         iLF2PfOdMKEoKrfOigOWORRhaZqxORbcO/AwaQwBEU+ZTtMo8wl9Im6pt86qBkFfnnvG
         jnQkYwqEozQ8D8iZ7Fc7AQVhD4PO/G7sIAEyj7MU9+hVkal1AJQ1zBIy3bpcaz3QbFx3
         woJ2D5ndDgOwcIDnrlHYUeQIMCr/96eXoFbnqYkCR62Tkw8FT8GMmJr2Lbq+DG9LuIO8
         V52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592019; x=1784196819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQmBxphDa1xFrmI6W+JXkKRcOnX9uJkuJ+MRhIqYj0o=;
        b=cZE6iN7d9tT0RLT0SCNb83b8KK9zQkSha6YVpiMDuJRQ+1wtDnKgM/tPIMs8jKfVT1
         4rCW+Fh0eaIkwLUsZ+ceO3R7fwzrH0MnNTCeFh67nT8D5ZRP/ekBGX/Sj55f1D2/SCFU
         UUCQIcrP0WkLLso95A6KDXpLmLf2r6ba0q/WpZ5LkMJqbA2m4MFTjUxmFq+5XypXCRi2
         t/+LTxu1XVHrDRuky9rHQE7sLVEuGqjs94hYwtjy0VaE41iGqy4igpeQE+Kc68zBXkFs
         IRVgT/ao5IWBuZCxm63OlDDoNRkKD5w8sgrWZs6ctu0IcRGZ33MX50irhi6VqMzVfXOd
         4uwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/SrWVoYnr4br3UjgPs1lt6FqNBBXtJZN1loTDVOHF+QHqLIl2z+b8MLGW9adk9/0sILWVp0yvS0dCKymM9+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwxGYgP1RpjHXtNqaThjQPXYX5BihBpaNMsMpY65QDg22sTWE
	xHmQDg8N2o24w4HYdk5ff8as9MOgBxyFXwu6xIZ0AHRRmeJUv99N+LZt
X-Gm-Gg: AfdE7clgYdv4BYIEHbenyvD2OQvyuBAW8WLOopzeU9qCo2QWJdqNnLnoIA7g45z/UYI
	LbsNGg8iz14Cx69HJsVgoKtaAb6L9ql7C0wvbCpUi2pVBX6kimdAs+vXDrqI75A+aTrhaZJxzl7
	NMe4h2xLHVVvrOBfHahv4R8v5iIkMg0qarGzHKmJRKtA3dsoYjhnliMxveQVjezoLvWIuJtd44K
	tAV7ycTxIGFKoXyR6biVx6idvZjipuNsYU2Yz9Ek1fRCG6iv2JxAlw1k2b489Fjs+8Jaylnu5ql
	TPd+9GfiekeAcIuH68zz8WHAtlSPKtjiWn/YBBUOfCqEBF4t7dDYENIrX3IqhN/PODb+dGr7ECB
	WodlTXYYd3thrKEAp4U2SeWQI921ebDknqygHRPF46mqGTCH2DOyGKSIaRGJ0YVSbwfKZrAN9ze
	sD78jR3MDPLDwPOCCKaSQ/6HiljIHtQZp2Nib+8w==
X-Received: by 2002:a17:90b:3849:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-389402490c1mr6834337a91.10.1783592018896;
        Thu, 09 Jul 2026 03:13:38 -0700 (PDT)
Received: from DESKTOP-82PPU4A.www.groyaloy.local ([202.8.116.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm32071423eec.31.2026.07.09.03.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:13:38 -0700 (PDT)
From: Ujjal Roy <royujjal@gmail.com>
To: Linux Stable <stable@vger.kernel.org>,
	Greg KH <greg@kroah.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Yong Wang <yongwang@nvidia.com>,
	Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Please backport bridge multicast exponential field encoding fix series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
Date: Thu,  9 Jul 2026 10:13:27 +0000
Message-ID: <20260709101327.9508-1-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Please consider backporting the following bridge multicast fix series to 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.0.y.

726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation")
12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()")
95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields")
e51560f4220a ("ipv6: mld: encode multicast exponential fields")
529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field encoding tests")

This series was merged via: db314398f618 ("net: bridge: mcast: support
exponential field encoding")

I checked that the above upstream commits cherry-picked cleanly onto the following stable branches:

linux-7.0.y
linux-6.18.y
linux-6.12.y
linux-6.6.y
linux-6.1.y

Thanks,
Ujjal
