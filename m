Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077103;
	b=gVJjoBgqnS+RaDV2nrK4g/a0DgaMhWBxVQSN7h8K8nOvqa3eKcgFWHWSbZ7jBU68zyNk
	 9kkxwYSI7Pv0qNvNHz6x1SRzvU5RoXQy0uWiGomAuy2L7WnvZcOkiyIm+mdMY7yC95wOB
	 80+lPfKBq39Mc8qBCbeZpaxq4ME6TR85+J7GfcZt4aWytYabAVDEG24A1yvCb9o8aumK5
	 mCP2L3nFsWR3dKFhrhAwMHptLElbl/FQstvnh4QoRg8GYUOAD1s1MR+9i2hokxwxS77Su
	 r2GpvvhM1qBXWim6x7IVuK8jFSAcdmsoT7JOqNul66ipjAdBH6izQR6UY/+yW+1B8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
	b=hbVT6d5r6ZMkWY4RNrEWQvrVn77aFZRhsccYAB1u5hLYyBcuogwPfhZYDKHtXS7RisN0
	 PKDfcRxach8MvrePLWczuZZf4t9VKOSL2UdBg8LLF16UgQ/GV3GYZwtJ0yhe8P8w+zM5g
	 /SenQcJX8zw3CH1zBhIJyaJ1I/MW42ioPtgPtYIVbry4Cs73vGK0fQ4R6JREftMqxCQp2
	 x1PPPbhy7U1QeOdzDzrg8zZL9hBq05yqSUhFkh3clVIAZz3EaWXU4sgHDtnOV8BmMxCkh
	 ciWnGa7yduJ1NQ8Ln5UQtsz3UQgNU96eDyvhnUqQRdQot/X5AespV27BmTqFq9J+3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=GkNciejQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D15606EEBF
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D15606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=GkNciejQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2683731eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 10:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794077102; x=1794681902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
        b=GkNciejQJ/Z72Y1u1tTkdWG7r+DlIGafrtg6x1vnSUWnbKDtUfo4oXs8nuXxWCrwuE
         1Dy4hbpxEU32Af0gjzGbD0e2A0xxeEkRgrPUDg8BceJKkqVQ35gtFLG1aIZabKzUWEuL
         yD6pG/+159wzmKJ09bBLUlbQEO7IJQtnE1BpCAw2aE0oIMYk76pwDRK+tIO/8hSm1fO9
         b55XlHUryrYD7WHEQdA9L3ffKEBDpFwDpkdSZd0y90CIVoUyKP6MD75ClHAiwVraWrMh
         R1qBZx9fKz9+Vktmacea83L8gsjhpaWjMn8w941CjassP+0a7V9D2Jnw91zbdqUkRSgk
         7/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077102; x=1794681902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhdhbpDGmd7gIfxOVLBlem2mFmloT/DJ5ctenjojXQM=;
        b=Pb+JCmW0ZcnZU5ukhh+YBIq47VwP2gfQqyLb7+g4iOsNKGnbd+tcozxakAJW4pglIe
         Gk96Ct+mXxgbHhtA4a325aNrc/tk6HiOBV5uiefjrhpCOzhhOIytw+JkbQh69VjO61ZR
         bg/toK9b7yGHPPCheFr2qwjVgwQ/9jizS7A1W4FmpGpOrSAQ6ekcGpB+ePPKe8T07HWx
         TDfKM086RRl4ZAg/vyuMk5QXvyJkpcV/pJuJqUJjmLg0zwbDxzc0w5htUJ03XBlnWnKE
         YwB2HDzPtqCD6JdUEu1YVEubKe7PC8rczYeBu++cXNqSrc72wYwWwCMV+wtA/cMjdyDt
         z2gw==
X-Forwarded-Encrypted: i=1; AL+hErG9stg8CkdF+NA4L1Yt/MqkqxAKJlvRXyaN9mjr7BcMv9JzmVKp0oeqYciRtmBuObGKgj9f4+tIspg/pnm8qC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qzobV1RKAiI27BErNWXpqrj56zbEJ+6Q9bdlp5ZejiIrj/9vA
	FeHAIL/ZQ0+uLFfqZrWfZK+7mjMRy0R/4GAFOcC5dvELu8p20b7Udu6AfnpSRAyw2uE=
X-Gm-Gg: AYBFou3DAGmGWN8MeVcHJhXyS8gt/RJD5mF0Iq126nIPdE/vg5Jz11rqgY0/PW1SLAs
	WeeMnKvkgEn0tUmFKKUv/4moA75usaCxQSiAJJdrLHlsno2qI6wHCrp47PqQI8PG5U2b6SlPatc
	RXEM/zlEd/P+yLSZXKyfWSx/IbG/Fft5pAuPYmgdb6b123lmFnmvPDJkB9mq3pEZLbnxAb0p6dV
	awH57yTq6Ru7r8ofGez8LwZ0MLhH0WGb041/lBUDTbsccSlXKd60w+OidF6h+hjggbKzhajWtnj
	tJueHgfHxKvBkVpEiUNh08WYKz33TI2aGrAEwqKPQg670yuaure/tAZuhei3CinksdZjogg7CMh
	cy0oSzCyTWldeWRVP3nB3OzFVR28wQF/O8lVISV3j+tOiZHblOgtA/leNCCoSc/UhHbM0WcEX1V
	OyKsPmj0OvZTLonKzyY0tCruGTrLZVX70cZMkztXjLe7/od2qvtpDc36I9Hkfx1qyGH2bVSqLZ1
	AHkpwiFpUSvg3CIpAlRmvvD1U5JPi3yDle1pJ5ZNUKJEfFDX4qy1f+8sTFzVAw94IZKzaWwhbBU
	6GT0wp6nGh6CHIYVk+rZoUfhYX3fdOEpwG5kM4EcAfcg9GO0uAnPOacJja7Pd3Rgkt7O9n0=
X-Received: by 2002:a05:7301:1601:b0:36e:dd5:fb08 with SMTP id 5a478bee46e88-36f773f7c7fmr8246456eec.40.1794077102206;
        Sat, 07 Nov 2026 10:45:02 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm17286897eec.9.2026.11.07.10.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:45:01 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	brett.creeley@amd.com,
	sgoutham@marvell.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org,
	Ido Schimmel <idosch@nvidia.com>,
	Satish Kharat <satishkh@cisco.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH net-next 9/9] MAINTAINERS: amt: cover the offload header and netdevsim provider
Date: Sat,  7 Nov 2026 18:44:37 +0000
Message-ID: <20261107184437.2783174-10-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107184437.2783174-1-omar@blockcast.net>
References: <20261107184437.2783174-1-omar@blockcast.net>
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

The AMT entry does not list include/net/amt_offload.h or the netdevsim
reference provider drivers/net/netdevsim/amt.c, so get_maintainer.pl
does not find the AMT maintainer for changes to either. Add both.
tools/testing/selftests/net/amt_offload.sh is covered by the entry's
amt*.sh pattern, which the IPv6 outer transport series adds.

drivers/net/netdevsim/amt.c stays under the NETDEVSIM entry as well,
through its existing drivers/net/netdevsim/* pattern, so the netdevsim
maintainer is still found for it.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b01fdeee6..f6d5b471f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1404,6 +1404,8 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	drivers/net/netdevsim/amt.c
+F:	include/net/amt_offload.h
 F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
-- 
2.43.0

