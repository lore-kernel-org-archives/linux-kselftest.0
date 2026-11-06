Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936542;
	b=mviVgyrt6eNLOeK8hFgTg4+TV2kvZ8GW1QhT3daucFSjVSPWrZs2FLm1oF/IStQexQnT
	 cFK2pAUVj6/i2sDwl06THesc+w9NOcNwxZTwk6aBRzdnMYXSELerKn1TWWcYpOpeco5UW
	 j4T5xsFf7EQpl+ss9IH2xtrc2yK3JlTBm6b36sjC0ZYSmfLzb5kVh90mMygBa5YNUn7d6
	 h7eVbVRJStGNB0vJg4YnPud/noIA4IzsWyDf0j5EQzCxT8LCpZIUubu4p05Yhjrj60Len
	 /TFcwynY/kYaF1m6jD/uBXaDkFlY8nzrtF9Uciwectxkfwqs2JTzreAPwuGXeaaprKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936542;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=C3bbcV4jOv7yHyE1B1LNNqja0PzYKDvjOLb3BlCeaAM=;
	b=GckeoZMyKumrDKTzkiOAR42Xyx+Mlhtc72029jOmXrDcZBEGPJSBZP0nxwmKoZVesCbN
	 M5p2ivVTf8ZVuZeceUtBzuIzGPPgVqRvOOeuIzDgDyQ+8Rbly7XrhNyaG4FhGw2KB19VN
	 1anl0sXonMljP81fgIjpxPASppyj2xS20QTMleuabiOAAANJoDss7/7N+1XMAbva7+0tQ
	 /w8ulpi3tCVVp7USzZFAcswAW5YFb/fPaxLZnqi9vH33uiQf80vPMo5jnUORCDq30fiVe
	 /BO34XATIhha+SrOSu/Mhef46oE2e/f+zrn1Ar7DVTwQUTEeO3w2Tl8dJNjUqyoZYig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TC+CnXRP;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004FB606A31B;
	Fri,  6 Nov 2026 03:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TC+CnXRP
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793936536; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=C3bbcV4jOv7yHyE1B1LNNqja0PzYKDvjOLb3BlCeaAM=;
	b=TC+CnXRPGCtS8jx6esP5Ogbm1K+gBcnD/K54itEsLgXIhnnnPxI6efUxs5sF5wabteu+1sLrmoaG7NH2Mp1Yj1Xm2fRAzyFEfg38PTn6LCji8ldDGQ1Up562XW4u0iUevm55wLpKSG3RnQG/8sPxPyZdhVyOIGQhs6S3HovE2Ss=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEAEe5H_1793936513;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEAEe5H_1793936513 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 11:42:15 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: rppt@kernel.org
Cc: alex@ghiti.fr,
	graf@amazon.com,
	guoren@kernel.org,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pasha.tatashin@soleen.com,
	pjw@kernel.org,
	pratyush@kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH v2 1/5] kho: Do not translate the handover FDT address in is_kho_boot()
Date: Fri,  6 Nov 2026 11:41:40 +0800
Message-ID: <20261106034153.1462-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aux_dPnvXk3LYDxs@kernel.org>
References: <20261103080926.2079-1-cp0613@linux.alibaba.com> <20261103080926.2079-2-cp0613@linux.alibaba.com> <aux_dPnvXk3LYDxs@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

> There was very similar patch:
> https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com
> and while both Greg's and your patch are correct they both have that wall
> of text with too many details commit messages that I don't like.

Hi Mike,

Thanks for the pointer. Greg's change is the same one，and his post
predates the fix in my series and already has Pratyush's review tag
on it. I will drop patch 1 in the next revision.

On the commit messages: they do restate what the diff already shows.
That comes out, and I will trim the other patches in the series the
same way.

Best regards,
Chen
