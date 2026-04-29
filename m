Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6F388380;
	Wed, 29 Apr 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478974; cv=none; b=BZs+CrtC3YVQpblhJUJgmLfCEiSb+y3TpoqE0FD7Qjoj43Xx3xjTYhW6dKLasw39jrngPz6A877hY0QcEXWyeA3MkgJoYLGzJ86IUF5hUTeWS+PGQ1Fv7G+cb87oLWS1M53iP0AMXiSDOpDqzgnZc6VctdP05vdCECqlHTizlYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478974; c=relaxed/simple;
	bh=YRwRcoIBsmwrZXrPyKG/nwAreSLN8NA6X+3Jp1CR8vo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=bkPRa8PpP/+LltxAkIfFN03rr6FvXI3p/STFossrUzFzDDNShu+75MapULSj03cqyyMJYT22O1MSqPFCbOpnO0Md1UoWZ5JMpSxvcdh6xH6SadYOJb81xHklV9H8yAkWmBjwiL7YmQCdpbnV/2f5hxNC9ocuWLMkoUvK96LSjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=e5DIFpgN; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="e5DIFpgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1777478967; x=1809014967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YRwRcoIBsmwrZXrPyKG/nwAreSLN8NA6X+3Jp1CR8vo=;
  b=e5DIFpgNy1kjrOZ+1lKKTleRODCHnPaH6WIRFyVLxsKDhpl0doaHnZmK
   YcYMy9xmmN5Zuv7nO8rpRg75V7CivNTg2YD6iHMdgZR25Ovgah6PWEJnW
   8gP390wLY/wiVP+20NuCBWxZBKNGgfF4p6HJi9nZcffJh9TodJijK8Asd
   O1zsX1ikm+B6utw5Cnne926pqJtBwQZK5wqjCA66KcHVEO48KznwIfnXw
   K/aadH/MmUFU7mlel9coxN8VUazWUAL/FBZjHDg7S2/zYrN9KrozOAEcU
   tMF7m/0CQD5ZitsKbyOhaaqByfLuBvp0bF9//CAf1dGipGYCsCp5coxf+
   g==;
X-CSE-ConnectionGUID: bXtavwjUTueAlUgq+NUVsw==
X-CSE-MsgGUID: mqhWXzycS/qM4/rboxpmyQ==
X-IronPort-AV: E=Sophos;i="6.23,206,1770595200"; 
   d="scan'208";a="18470444"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 16:09:24 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:20097]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.153:2525] with esmtp (Farcaster)
 id d1ef6f99-9f13-4bff-ad6e-cd6a15c3730b; Wed, 29 Apr 2026 16:09:24 +0000 (UTC)
X-Farcaster-Flow-ID: d1ef6f99-9f13-4bff-ad6e-cd6a15c3730b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 29 Apr 2026 16:09:23 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 29 Apr 2026 16:09:22 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: Sun Jian <sun.jian.kdev@gmail.com>
CC: Bjoern Doebel <doebel@amazon.de>, <shuah@kernel.org>,
	<linux-kselftest@vger.kernel.org>, <kees@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux@weissschuh.net>
Subject: Re: [PATCH v2] selftests/harness: harness-selftest: cover XFAIL_ADD ctor ordering
Date: Wed, 29 Apr 2026 16:09:01 +0000
Message-ID: <afIsd/XYrxWAH1hM@dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260309101044.809074-1-sun.jian.kdev@gmail.com>
References: <20260309093752.808533-1-sun.jian.kdev@gmail.com> <20260309101044.809074-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
X-ClientProxiedBy: EX19D035UWA001.ant.amazon.com (10.13.139.101) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 06:10:44PM +0800, Sun Jian wrote:
> Add a fixture-based test with a single variant and mark it with
> XFAIL_ADD(). The test intentionally fails and is expected to be
> accounted as XFAIL, covering the constructor ordering dependency
> between TEST_F() registration and XFAIL_ADD() registration.
> =

> Suggested-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Tested-by: Bjoern Doebel <doebel@amazon.de>

Tested on Amazon Linux 2023 kernel 6.18.20 on both x86_64 and arm64.

Best,
Bjoern





Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

