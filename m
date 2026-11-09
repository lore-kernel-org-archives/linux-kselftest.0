Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249250;
	b=LonYG30XoHR02R5bk8dBZphqHLtrUmwY0VnW25PYsxZYx9P87QC4dSpMRn6MSnSq7XAD
	 Ok1hliy+N83lOMpdocUghgOCkkOA9SLAA29N7oPqkFYjzEuoTc80KBWuXD8gKEWSJjcpe
	 QQZRdIR0g3HxNgReDtq0xU05ZdUnf5nrlyUdx3GYpW90tZ/rP2BJdXSBic74zH6QNUCoc
	 j4OlVgYE/mHAA5OME6g7bQdefz4ZgG1ky4BVeHl4/R7w/q9tZlVPgqsXOS0HRXFblgkZc
	 S5Xze0oLpXO/sHDAJHKvJ3jdhYJLQeJ6six7ye2xjpxfRfqgeS0rF81xKygp+1buksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249250;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z1IjdLbHYZ7qKRSyRthU4W9TJM5qSh5ZZeJVqfj/hQ0=;
	b=wCGZZZnK6M1UJIHvUY/aDW+NVlWUwXwegwB3gW2QLLxhNyCtvK6izC+qgl+8ghjy69Ek
	 ou3n8KgSi16Xmy/0CuU1R0/N3oqlK4A11aRYWLU6P6pCz3j/JiQJ1iPhH/O3X0mXdtsUU
	 pG5WlIQvZTKkhqK7qEQpkadmND31PUpu2ajLU3K79tgU66HPw64X9SJ2SdA1/9kv0myMP
	 OV4OZfQvjIukJIaFjr9B08y02lDM31G3AEOc92xOGrtCn31JvC/PfoU3caNAo3AnsBJ1C
	 dC5RPTVGU8INDdBYigv2UQ1GdjNxDOb8ypFnU1dYpZqo/PGL/ojNcM4g8Cn/qmSzDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X2mga4jw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7345A606A5C3;
	Mon,  9 Nov 2026 18:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7345A606A5C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X2mga4jw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61F8D1477;
	Mon,  9 Nov 2026 10:34:06 -0800 (PST)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F553F85F;
	Mon,  9 Nov 2026 10:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794249249; bh=Z1IjdLbHYZ7qKRSyRthU4W9TJM5qSh5ZZeJVqfj/hQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2mga4jwWgvDv6JhIWb2JVzgQW6sMxPzZb70lDw+GX/u/CpVzmi54yvwb/5etziJq
	 AnH5TOt8MVwhST+RmGaAVAFCmNUSjNmsPaR9oJ04z8VPLFtrmLYadat6t68MuEkz6I
	 QkXWV8P24/CblD+WEda+UuEg11ISnRlc4p8Fr/b8=
From: Bill Roberts <bill.roberts@arm.com>
To: bill.roberts@arm.com,
	dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com
Cc: bp@alien8.de,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	mingo@redhat.com,
	shuah@kernel.org,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH RESEND v2 2/2] selftest/x86: test ARCH_SHSTK_UNLOCK
Date: Mon,  9 Nov 2026 12:34:08 -0600
Message-ID: <20261109183408.254221-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102181708.29178-2-bill.roberts@arm.com>
References: <20261102181708.29178-2-bill.roberts@arm.com>
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

Hi,

Just following up on this series to see if there are any outstanding
concerns or if anything else is needed before it can be picked up.

Thanks,
Bill
