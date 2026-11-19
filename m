Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091800;
	b=MEDuUHysK4fODHZwuKMNtuN/dr1zn4ER2fe1DQ9Jw5UP40STSGuJh5Z/NvxjpW17ncT9
	 ATYNhy1pel8mzO0rVuWiUqptIGU4r0gLDWvLLsUu9xqTOnezi8Bhjp5Mclv9I4e3J2oqI
	 gGbNEYgj58U0LIyQVC9TBQlmEeejB4AwaZiPg0og50K9PDtK1Y+enITppWTlSm3EOQEe+
	 D2DR6wq7aif+hOdWZ2C3JNzLFqMDYKzC5t5PKQLVzVvlM3YDlYWjJRq0l6CnVEO6PSvcn
	 gQnDMP8V7OzGh27WJheXDiZtZD4mcQaIvNet3gY0NYQj0RG0YRCCMSaQ2JYPM9zZrbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091800;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z3UaETqrvFfA005xDH3cLACWIQAJP32vQKwKRzUivqI=;
	b=myzrPYb68l2QfnLk4E0yDKzNQaGKD1nGEf1WWfW8Tdi2EZ2DtB3YRzEF5NUtfIvj0Ab+
	 6XCPz7+tkl7eGTfMbe5Y6UlS7BGp52JjEio3A8JmCzbmXjSRiLwjGEzgYYTqt2L9H/cW1
	 DCG10pUrr3ko+n5PJHcwxT9V8zqwIevWkO4tFV98abNLbK8rDqxiUsrMoc1eKaNhINXpR
	 PIPBTj6F+wS570ZDvk/4M+ACly13q5088KRWeTsx6U8cdNmgYZcJZVAqdtpme1KKw3FII
	 tUJ0wL1E0+L2bDaGOO2fDCam+dVh+7a2Pw4PFfYh4bkN1HDQHGPq6lLd3QsinHmdRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lC6uMZzr;
	arc=none smtp.remote-ip=91.218.175.241
Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4239606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4239606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lC6uMZzr
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z3UaETqrvFfA005xDH3cLACWIQAJP32vQKwKRzUivqI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795091797; v=1; x=1795696597;
 b=lC6uMZzr3ePKQeAmTHxIhjRO54prPfHzsGIGlwdxiRYK/x13orsA38lW/OKGvJ2UJwbnLaGu
 IJaqHUFanrC7+JPI1DpsvL2OT+FfjO6qijHirmQdj3INbUcFwvjLFj1Rdau0Gt/Mp99dF9OE8i1
 8w25qsNQUOiPVzeU3R/Bc0xs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22a63bec1e9ad1bd;
	Thu, 19 Nov 2026 12:36:37 +0000
X-Mizu-Trace-ID: 22a63bec1e9ad1bd
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pratyush@kernel.org,
	ardb@kernel.org
Cc: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	shuah@kernel.org,
	ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v6 1/8] efi: Pass KHO state to the next kernel in a configuration table
Date: Thu, 19 Nov 2026 21:36:31 +0900
Message-ID: <20261119123631.11165-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2vxzecch3x6k.fsf@kernel.org>
References: <2vxzecch3x6k.fsf@kernel.org>
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

Hi Pratyush,

On Thu, Nov 19 2026, Pratyush Yadav wrote:
> Do we even care about non-EFI boot? I'd say ignore that for now until
> someone comes with a real use case for KHO on such systems.

OK. The fallback is only the existing setup_data path, kept when the
table is missing. I won't spend more effort on non-EFI boot, and
whether to remove setup_data can be decided in the x86 series.

> This should be a follow up series. Don't get your series get caught up
> in x86 changes.

Will do. v7 will keep the table common with LoongArch as the only
user, and the x86 patches will follow as a separate series.

> Sounds good to me. You will still need to chase Ard for an ACK on the
> generic EFI table though.

Ard, you asked whether this could be an arch table handled in the
LoongArch code. Pratyush would like a common table that x86 can move to
later, and the x86 prototype above used the same table without changing
its layout. Would you be OK with keeping it in drivers/firmware/efi/
for v7? If you would still rather have it in arch/loongarch/ until the
x86 series lands, I will move it there for v7.

Thanks,
George
