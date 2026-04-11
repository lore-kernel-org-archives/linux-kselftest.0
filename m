Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C501D5CE0;
	Sat, 11 Apr 2026 00:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867639; cv=none; b=JcNi2dqAriCbr351z2TccJ5yzOZJXa/8/C2njrACYA1lJBcUEyZlqiBIJQUDgN3By3Nc1R60/yIrw9v3Y+xB1QcphhNJ56PngsgadF5tWk3oII3qzUmw/1Q6Z3TClXTGiwFIqe8CTpeD6MzlvJz4+15MPWbsd89i6Gj7Cts4j6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867639; c=relaxed/simple;
	bh=hZmYgx6N35U1PNa5aPxvldJ8w84iPx4xEepXwqPiJyc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-Id:
	 Content-Type:MIME-Version; b=DsDb8++sBA1m+TEdRiz0MnregLVRo9x0BX20m9JGFz00+aIhA/2hxZpO0HO6pYHROgwHw9MBJwxDc/R+n2p2iumWa5gW2z6b3pDcqZsRZK2VA+WHhOJYQYSkZ/8MMnGh7UMf2FMQx2PzzMom/Ow2D+RybCFCxGgFJGKgQCDqwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ccFpTkYf; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ccFpTkYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:Content-Type:
	MIME-Version; bh=aCJgJEXOOYWHgY+vNytWHl/rzVHq7HwxBHOyVe82DmA=;
	b=ccFpTkYf+NNEQqqas0+ovyu7moloK5CuGGhRQHcI5Pe7SmjZSFJHxpUKv3CPcq
	GIhvygyWa8hE1qVKt2BWo3IDL29h7s5udpi6UcQ8/VNvm76fzJ4xYqQB8hW8Uf5N
	IQ35PSh/9HZUexhR1JNVIJ3jRPjOZqcD9Vuv7hSE6CIXw=
Received: from 229.199.16.172.in-addr.arpa (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBnU9vVltlpBLjTEQ--.50831S2;
	Sat, 11 Apr 2026 08:33:30 +0800 (CST)
From: Cao Ruichuang <create0818@163.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Bobby Eshleman <bobby.eshleman@bytedance.com>, virtualization@lists.linux.dev,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v3] selftests: vsock: avoid races creating Unix socket paths
In-Reply-To: <20260410134733.1c10a183@kernel.org>
References: <177581562073.13887.468247298173578281@163.com>
 <20260410134733.1c10a183@kernel.org>
Date: Sat, 11 Apr 2026 08:33:25 +0800
Message-Id: <177586760504.23328.14397180554353198920@163.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wBnU9vVltlpBLjTEQ--.50831S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUPfHDUUUU
X-CM-SenderInfo: pfuht3jhqyimi6rwjhhfrp/xtbC5xqs5WnZltqNFwAA3S

Hi Jakub,

Thanks for the correction.

No, I do not have a concrete failure reproducer for this one.  My change
was based on the mktemp -u TOCTOU window in the selftest setup rather than
on a demonstrated flaky failure.

Given that, I agree this is not strong enough to keep reposting on the
netdev side.  I will stop here unless I can come back with a real repro.

I will also follow the netdev posting rules you mentioned for future
updates.

Thanks,
Cao Ruichuang

