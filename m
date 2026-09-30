Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B275332614
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 15:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781792; cv=none; b=bPc9YZumJeUHoWNGeZJDYLW8Ou8RI9ywUXEfTEKX/OkGqWGkw1Mi2dFYfzmO5+lrjTCI/XMbvTSd6rDmMafxU0vQM2hQuEgfl0rP/CRFeMhi+13qrk509YWkMdmhL5rCl1Ng2MRs8+YTnHu7hahcj1Z1YnK5MzpTllvHfQMDf5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781792; c=relaxed/simple;
	bh=9YozpNhCB6RxQb3vSIk33QuUlNnJvEgYENRshldeQTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5DydN1b3GLR1SCoZlFR+5fDVCVSM2lHySYAC6WUO+KEytZtfYquK4iK5YZ2J1sTQ+ZH5J3Y+KNjqXG6CnLSSZEkV+db2oAsYrwUcD8FW0m7/kNbYl3OgtAo+7Hk6SKl/MW0dU47i87y8H7NOsAM8QkxK5YF7YKAo2JQNdz4Cis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=nJ5hOyqa; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="nJ5hOyqa"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so7810449a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790781783; x=1791386583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6cn97a2VxefS6h6oEWU5CpS/OstCxxYrDuVNoyCidQ=;
        b=nJ5hOyqaMtrdOhJnx3LQrdR1/EPkFtTMCcMUoxqs+Tga/SjXCFPli4pJnQaQEfpWi/
         UaD/5VD2OuUd/8xoyTKjT8uLp/OCsNwERaAK6T37ViOSXPRKBmrVEVNhgnv/NM/GGyQL
         R9iSMlXACssKNXv9z/KvIqTf9UDhCARb+RZln9tEyb34eqgVvnFDBSQixbsFwVzCkUwq
         yf6GgeA9jJHezubE7wOu3bZJqPXsADGKS2TNEWop/aQdmQ2RxtisSM8+2w0307hI62qd
         ZwGx8pvvkB8MKMyAr/N+CSoccO0C5V93nAgB74bpE/xUQvifiozFna2s3wtS9qTYHQci
         uSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781783; x=1791386583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6cn97a2VxefS6h6oEWU5CpS/OstCxxYrDuVNoyCidQ=;
        b=ZPPHqrR/j8fDs0OwMrYRC3n8/ibGnL+RgW9wWwtams2ehQOPLBjsLjAnvkPADP7a4J
         YyDnGtSx969IEehUatyU4nsQCYf4AG5XxfHM2+90FgvoW2QbOgwjOA3pCKGuTUuIHysX
         zmQGZiaQUSDf7GfCfAyn4XEvUx1w2AtPG9SthEepSitMGZLbezn3ePHZBKDctPtS3XfA
         S+xFY0qg8lIhh2MCJwscUt+pSuHK++i5T3IW9U6KK1e+QWlXZiK6eFxCdwd5wFrZCltL
         DHx/Q8xlBEBmYwfyYJwiJNQV5SsBpiP75xLIojY3G1ywSzesHnWEdy1Rb8ZB+OPgf0sq
         afJg==
X-Forwarded-Encrypted: i=1; AKwUvByyw+8TWaJ7HdnZsqK2LaS7g8MFbjrETuZ3qdTdPGwrWqomu7H7zPSfVpLEg2DKGzGuyLV6b2435FIMmRPX0No=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYtm6LPUYfWTbMUbmQGUCquaR5lC7Wi3aWM83hRMoBLi2yVsTJ
	cZU02FkGKhItFHIS+WuktHglMkHPHRQ6+Cn7a/bWgvFN2XHxhEO3xosMYPeU2bwKjQ==
X-Gm-Gg: AYBFou0uvNMy1P7gS1wjxxbwTzsd1q+EgbawnTQO7nO+AoKmr3Wim0EHoLF9Qo84MQ/
	SR0FESztm3f/gjWPw98RwbAwDfR0w8WfKykAq6zazg2mIwTrjjXxHy0KR8xvOHspEIfYqhE5D11
	5xTJ6rsR5YtPLgIBfo52wLK13Gh2FGQkaIVl70ItrcutsxZ/7vEELWPrB+h3MOnipJvXjopwEd1
	/r1/W2M2oKSXS0rDG+XRS9bxmwkZLV6rYgfcns605pwnYXbBdaqg7Mm8BCfJ8I/GnhBJX1IKVB5
	jGn+BQAopBySOovBS+bKPTgL+92TrynI0V7AezoFcD1Fe5jwl/8LC6+CQTMco/bjGvgS/wXjlOY
	+6iSIhRKWEY38PIzUv8Lt0leX7gIUawgTDUtNjyB15HsprwiLMD5jabiv2ivYwkcVxhjTWzan1b
	x5z5qWH7gtLuK6ZgLbB03aaW2IWmJ+opX2t6iY1tZaqZo4JrDeqt8TNuIidTbsoA/UYIhurCKvG
	raXp5T3XklfTCimdffGSg==
X-Received: by 2002:a17:907:3fa5:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c2e237605f8mr170086166b.2.1790781782842;
        Wed, 30 Sep 2026 08:23:02 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce6499sm23874966b.33.2026.09.30.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:23:02 -0700 (PDT)
From: hengyul@cs.unc.edu
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>
Subject: [PATCH net 0/2] ipv6: route: fix adding routes via the loopback device
Date: Wed, 30 Sep 2026 11:22:27 -0400
Message-ID: <20260930152229.1453929-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Since commit 21ec92774d15 ("net: ipv6: fix panic when IPv4 route
references loopback IPv6 nexthop"), adding an IPv6 route via the
loopback device fails in cases that used to work, e.g. when the
loopback device is down, when a gateway is specified or when IPv6 is
disabled on the loopback device, although such routes are promoted to
reject routes afterwards. The commit was also backported to the stable
kernels down to 5.10.

Patch 1 restores the previous behavior for routes. IPv6 nexthop objects
and IPv4 routes with an IPv6 gateway keep the current behavior, so the
panic fixed by the above commit does not come back. Patch 2 adds tests
for these cases to fib_tests.sh.

Hengyu Liang (2):
  ipv6: route: do not validate nexthop of routes promoted to reject
    routes
  selftests: net: fib_tests: add tests for IPv6 routes via loopback
    device

 net/ipv6/route.c                         | 29 +++++++++++++++++-----
 tools/testing/selftests/net/fib_tests.sh | 31 +++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 7 deletions(-)

-- 
2.53.0

