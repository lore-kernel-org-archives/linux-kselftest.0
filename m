Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D83F20E3;
	Wed, 22 Apr 2026 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776887114; cv=none; b=clt228x/CMRXepK0MsmLIVqM9otT6ZjubS1xEKdcRrXHv3hnFiqYQVcvRx6giwRx8NQvnDD3VnCrGsy5wVn5MLFgXF+0qSZJt2UXBZroGETOzB3iNfJz+SVAPDkYrM/7ciXohal/ft3jPOHmYpsaOFdmmpkIu/EXkE1YiKoBHS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776887114; c=relaxed/simple;
	bh=zOD4+ez2La3MDMjPq9tHjAMj4pkdZwGX+OCxK9Xcsqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=X7HZt0OOHRjMGG5oVv5JEKWP+I/IZ/iidmJbvtieGnzk52Y7GIweswWUQPDwMUrIH4bt+6Q+NEbP2pyker3CwWBOmRrlj3zk93F7p3Adt05fqBgqSD0HVjXBR83TX97iK4e08s2q1eW1cA7vc8FJnmkSPjYguC/E1Oi7KE9diho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Dr5yVbU3; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Dr5yVbU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776887113; x=1808423113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3Ew7GWl4hFk7DGEDfzxq4i/SILfoOPlGFgcShS4Xvc=;
  b=Dr5yVbU3dKBUYV46s+4qUrrWHc75cWviE0v6hYwKzh2MlyxzzDReX1Nx
   87FzHha5RXrFd01s4g35apbwL1/77LPo/fSmE+WU6crR0aTXMIBMDcu7M
   N8OlSSZmpewwSuf/oqRv+Yjb+qQdE8TfCnHL3LXk+QbXr9oTTN94DAkRT
   wLcNrCTMn0nxBP83mTa8mV28cyfXFRxvx6Sl7JTbq9RzI3f1bY/uH0Tni
   cCniXRHk0JK5h2T1GGjagX/mgpF9RisU9j7S7yd0snJgseffGmlzeOIMp
   LUi2W6MKv1OqI1wrAkhRucsxRWNDGwYSwFsvRjB/2SQ8GrAC6Qf4cOGSW
   A==;
X-CSE-ConnectionGUID: BaH4UvB3RryO4tQ7O5rThw==
X-CSE-MsgGUID: GQKMfITMRIyD9op1/OiSsg==
X-IronPort-AV: E=Sophos;i="6.23,193,1770595200"; 
   d="scan'208";a="17985208"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 19:45:09 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:31246]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.227:2525] with esmtp (Farcaster)
 id 3f3692eb-30ab-4061-bfd4-d9ea74ca80e9; Wed, 22 Apr 2026 19:45:09 +0000 (UTC)
X-Farcaster-Flow-ID: 3f3692eb-30ab-4061-bfd4-d9ea74ca80e9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 22 Apr 2026 19:45:05 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 22 Apr 2026 19:45:04 +0000
From: Bjoern Doebel <doebel@amazon.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: Bjoern Doebel <doebel@dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com>,
	Bjoern Doebel <doebel@amazon.com>, Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, "open list:NAMESPACES:"
	<linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/pid_namespace: compute pid_max test limits dynamically
Date: Wed, 22 Apr 2026 19:44:17 +0000
Message-ID: <aekk2daigQjwrtzq@dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <301ac97e-3f7f-4979-92b0-d5124ff571a7@virtuozzo.com>
References: <20260421194344.2981537-1-doebel@amazon.com> <301ac97e-3f7f-4979-92b0-d5124ff571a7@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Transfer-Encoding: 7bit

From: Bjoern Doebel <doebel@dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com>

On Wed, Apr 22, 2026 at 03:00:12PM +0200, Pavel Tikhomirov wrote:
> Why 24? Since val is int and longest int is INT_MIN, which has 11 characters, so 12 should be enough.

That's true, changing it to buf[12].

> Maybe we can simplify things by using global variable instead of pushing 
> argument everywhere?
> 
> There is also FIXTURE_SETUP/TEST_F which can probably be combined with global variable 
> too. Plus you can try to avoid calling pid_min() multiple times.

Done, thanks for pointing me at the right infrastructure.

Sending v2.

Bjoern




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

