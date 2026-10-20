Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498826;
	b=guce62t6uvgZLL8B1L61exxU+zgZUG1WUNYZFZBBF7G9keHKRYDG57T955Zm04T0wGb2
	 x/c3E2eD4+nu5xFdLaJKISS6kbGjKeiazvHBay6qwGr5SPasLyxCm8N0SodDIQfPLvC64
	 ru0pE9caZfAwAoXYB4JnVVCuYn/Cj2yqNMJx1uIOJSxXUKTGwnrdz8GGH5Rgioa0eJuyK
	 VpBAJUqrUxDbHNPZ5przTsCzQIFufyqPVPzECBrVi8+N4KXo3Mg1Ui2jKocHMR1u+uvVv
	 C8PqGF7zmoKowCzVWn4VBAGhEGJrouSwFi+CoNR5GoQ34cHODvKMYKX89e6f2ccziDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498826;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NElDP+/LtIzOBKGOj7/b1eUU69rD1be4ecgd41kze+g=;
	b=LU3rcPn3RiqVLWGczIue/K5Tggf1m/Z1U1+PZYTfcaN39Fz3w2/ofjbnSXNSTJvXDyc+
	 p7IT1FwOTgAXg9eF+bsMYO1E1mfUwuMcuBSnx8dDuQqgRodOAQQn9T+miCtySMjXzqL+L
	 gnCkj9J4EsKea0YYByZRBsLKAN8aV0i7noT3f0ZHhv5v3IvyXUgNQoLwraWvHhm2GoPJc
	 b71LwyMkTtNLwT6CPlsJZjd1V1XTDav+vKinZj96pNmg4cF5gA8fsgQIQVOENB9+WExcz
	 fqt8yCvYkRBVG2ujsZaRRtRkzlhUaj+HMerOl/hE7yLQZhRK7TvHMXA7tsZcCO5IqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SQi16b+F;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1560A2634;
	Tue, 20 Oct 2026 12:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC1560A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=SQi16b+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=NElDP+/LtIzOBKGOj7/b1eUU69rD1be4ecgd41kze+g=;
	b=SQi16b+Fax/iMZudTGfodNc/h8gbLJ4vJfQruZKLucrxu4VxlBkc2ZbTM6K+tO
	kfQIn3h22+HWfydYxcjnIRs3M/gZ50jI1azZ20prUpcEmcFcHcNpP3TYL9M3Mql+
	ZbglxelrgFs3uD8Tw6M77hu1nXRWyfyBGvicU4OfGvCts=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDn+n9oXNdqB4r+Aw--.58039S2;
	Tue, 20 Oct 2026 20:19:53 +0800 (CST)
From: Xia Yan <yana06070@163.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net 2/2] selftests: net: check veth carrier after
 changing channel counts
Date: Tue, 20 Oct 2026 20:19:39 +0800
Message-Id: <179249872343.21684.7854076185953389263.carrier-selftest-review@163.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20261015085821.12725-2-yana06070@163.com>
References: <20261015085821.12725-1-yana06070@163.com>
 <20261015085821.12725-2-yana06070@163.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgDn+n9oXNdqB4r+Aw--.58039S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47WF1fCr4kAr4xJFyDGFg_yoWDtFX_ua
	yDAry8Wa12vF1Dua18Gr47WrZFka1UCry0vr4kCr13u340qrWkWFyvqF1ag3WIg39ayF1D
	A34Sv395Gr1S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjxnY5UUUUU==
X-CM-SenderInfo: p1dqtiawqxiqqrwthudrp/xtbC3wvBSGrXXGtaYgAA3v

Hi,

I checked the two selftest findings on the Sashiko dashboard:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/8081

The LOWER_UP coverage issue is valid. The test detects the original bug
through the running endpoint in the mixed up/down cases, but cannot read
the down endpoint's raw carrier state through IFF_LOWER_UP.

For v2, I have limited the assertions and commit description to LOWER_UP
on running endpoints and dropped the down/down cases. The test targets
the incorrect LOWER_UP reported by an up endpoint whose peer is down;
it does not claim to verify the raw carrier bit on a down endpoint.

I also changed the veth creation failure path to use log_test_skip().
An injected creation failure after a failed case confirmed that the SKIP
line no longer repeats the earlier error message and that the aggregate
failure is preserved.

I reran the revised test under the existing unpatched and patched UML
kernels: the four mixed up/down cases fail before the fix, and all six
cases pass after it. The driver diff is unchanged.

Thanks,
Xia Yan

