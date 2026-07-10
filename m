Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9B4195BE
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682668; cv=none; b=ss3GHBfi3TOeDthH4n75T2K4anNW0Ks4qdvtthzSTH1P+iWvhEOcdNgKgO9BYoKzhUolpuj79HY81/592/hOjqtOssYF/9IwXSDCVrR9r67s0rEofvY2F1X7KcInqZ+iwK+44LgOixsExU9tqZ6BxIpyCmuat/YdLavc5pGyFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682668; c=relaxed/simple;
	bh=dDBt4FHRZdJL9ffdilgluXXJ+QmyubtcY3PKYDWBMCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O79jRUgT2c/sqxPu0JKIkur7bXVOW2AUDG9DMhi63eOqI9jyYRDcrikTQq/aGAfbrX8GdtsMqD20zUa9MytImZAsEAiR7HtaKIPPl3CGV270cD1AvIbEeCI+F1m8ayp0scVo6PTd8T3hKQfHAIC/m2YIQFSOvf/4wrqpctKsX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAwpHPNH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAwpHPNH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848643382fcso751867b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783682655; x=1784287455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDBt4FHRZdJL9ffdilgluXXJ+QmyubtcY3PKYDWBMCs=;
        b=sAwpHPNHXcrb9CIFGiXC+0tz7gpT6lI+L/fhMmTPo8zZl7VMYZ7iXDXrYKIHlDC5Iz
         +3T7r8UlDdWJeyGCrjtdMAufMyM6N3287omf53uHTqEEFvzCeYAItNe8qgvLWMd3kIJR
         oKTpvVXHW3hot4V15C7DGKOTLc6EHI/G5ehHPxq+5O2ZwTgTILp3NQnd3omTfy0sBlN8
         uIMYa7hrsr73TZUx29Sy8h1k+KPkUVkNn5VAcENaymoFgTexeA3EXXnLMsGNprFk9MNf
         K/6dQL/eOkYvjECiL3dIxLNrUNEhZfqpj4xhJN6QjXW25282pahMlkmnryJuCiPz5oyj
         TR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682655; x=1784287455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDBt4FHRZdJL9ffdilgluXXJ+QmyubtcY3PKYDWBMCs=;
        b=WiyB87D+93iNO2d9UKCiqieJHpA7JdQqNpYifHV6S+/OSgZ2r8YROOxwwWOai1IZI6
         D8Oo6rNLG+SQarb0yHtFAXPLlTexxiCrUVDwesC8wAUAcjB54eYDNx/RDpjd8a9UMOJX
         9Gjvbi/FHZsSGV7iOirFX/9A8WBSyh0BkOA4EInTR8dhMjQ+PM8OjDv3Hk4n85a7tqbY
         AZC+TMjAGCb6DEN9g74oilU6y37fbydpx+QTMOB1tuvUlLs1WI2ndDykaOCi/soRB4Hv
         F2H+Dg/kI/sb5IAoXw2kaacDygrJ+cwNJkU09DUDGica+MZqa3M1KpC7dCMpD2PS0zE4
         PRDA==
X-Forwarded-Encrypted: i=1; AHgh+RpckZ6kNcy9BayGz/F1AAxbuWXeERHriF+B6/3SfF/1StSGOvfv04D50UTaicqhdGps7BmLDUDbKMJczgXFn3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywie+sobK99FG5Yh8gYAhKSdz1DVSo20tAMcyVCM3mOgWTU10Fg
	HocM/rDvv8iMK2E8o1AHblXe2N3NmRtA9FBInLzDT4Hni1JJ8D/oOCZu
X-Gm-Gg: AfdE7cm/HHu3DPDvFJIu1mvFoqp3vNk+7NLyYQVSr1eMuDqvL3bs7T5+TWjpUeDeMBS
	fbcvkIYrg/CmwydWqxIXd9mz8wVqdZ79gEo1gqHfATobOhHodvwQcfXwlICf8iZ1n3nT5ivTBSj
	6UprJcxad0COKL/4zK4t3V2eUAoFAGr5DCgIDpHNdPlCfQCJXadRY04bGVxrj6t+nhFdlbhxm3L
	vCwHRO7bPZFuwjIFtHpEkckgns6UKWlqvCNb16patQvcHhfTdV6vxsQmIuNlHxuQF6P21qklqty
	0eD5tCoPCKxskg00Y2ya2fE5vAn7vb4cC4vOa12jHzfu6LZTHfv5nWqT7bga4rWHAcZrrIVqicM
	Baf7bayeAS349rpN2dQfXUJRtPh4OXv9LmXJ/ctmDI9/Wxl8vYJYvIzc4eX8Eu9s6o06Nbh6slv
	8yRbCJxw==
X-Received: by 2002:a05:6a00:a86:b0:847:8704:1c54 with SMTP id d2e1a72fcca58-8484301d996mr10203899b3a.22.1783682655418;
        Fri, 10 Jul 2026 04:24:15 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm8541404b3a.8.2026.07.10.04.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:24:14 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Justin Iurman <justin.iurman@gmail.com>
Subject: Re: [PATCH RFC net-next 0/2] seg6: add support for the SRv6 End.MAP behavior
Date: Fri, 10 Jul 2026 20:24:03 +0900
Message-ID: <20260710202326.cc-justin.end-map@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com>
References: <20260710-seg6-mobile-end-map-v1-0-99be02d68143@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+Cc Justin Iurman

Jakub added Justin to the Cc of the SRv6 Mobile User Plane v2 thread
[1], which I missed carrying over to this per-behavior posting.
Justin, the cover letter above has the context.

[1] https://lore.kernel.org/netdev/20260504182833.344d7b33@kernel.org/
