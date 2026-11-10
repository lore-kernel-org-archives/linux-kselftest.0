Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311409;
	b=NvtQgSIOyYHic3RdP7SYELF+WTny438sZrnZK8ZPLIRsLUjS7b4JXaHYgoAxF3tC4H/+
	 0sONYFTKd6hWZyPj8HMPe5C5ghzYqXFVtHp4berdgvaYb2IyUyESCEXPLXFO32SK6w+0o
	 Lo2RH3SikK2tRAWqkAjVSnHv5Pho6qa6Z8AzHpy9+2mPw4gG5PQvf/wbj6xZJPx/CYy+e
	 IbXoQI5FlgAG8OKcCI0VQOj6YVPo+OlsotLvVof1LG07UwTTVEPsfJgn2GNd9yjgDWzK0
	 t9HU33R/0aAT35tQkMbQWlE4QPuBEM3leMW9Svb4hVd1XRR6Z/OK/ena69Yy8fDrc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311409;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SiUmjda1rou75Qdy1qEqvd78mTv+gHYp/EbdWyUqWuc=;
	b=Rw2Gy12DTfrh+OUVdkEXqdQl7r0rEiXWt+keDrMjoz5XmNMuWQbJkRPT9nIzo22pmcf6
	 eMZAmI9RoA5co/uVYcfYtdX57GeNoe7jW9BOI4Q1DhE/TBwfTRKC8PyuYSYCuPxHBv2HB
	 MP0MGHCxa5ii0XbAfMnTv01/JjGEf7Uqmzq3b062KLse3YOxpZs/S1KIWb8WemhtwIrQM
	 YJVr4pFUiiaXzvpb5TS/cnbiEI4IWMuo0L+E2PrxRGLmTG3zJ8Pgd+7qcSEtPqh+V2eNz
	 IGNDiiqZQsJYgCH3QmiJfZkqmqz96PsnQGMWtlCW+zMWuK+bFFdZby5lF7RLlN025bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jVIbUfnY;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FE160A2629;
	Tue, 10 Nov 2026 11:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FE160A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jVIbUfnY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jVIbUfnYLWPfDlsFAX4Mrp3e5u2NXXLyvH5/oiaEjD4L/GLPComTWGrmY58rCxErUrMghyn00Modx
	 b+/Q3BqunHD/MWfNPE7GZpxGo/TyyoInHUc3dakqQdGoR5XS3pppoVIfNuVfpEP+t2E4ihnNKEnlq1
	 mLvXpdgjsBDzDrwk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af304e9450-cc9c9;
	Tue, 10 Nov 2026 19:50:04 +0800 (CST)
X-RM-TRANSID:2ee56af304e9450-cc9c9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.27] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af304eb538-b442e;
	Tue, 10 Nov 2026 19:50:04 +0800 (CST)
X-RM-TRANSID:2ee16af304eb538-b442e
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>, netdev@vger.kernel.org
Cc: willemb@google.com, kuba@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, yana06070@163.com
Subject: Re: [PATCH net] selftests: net: udpgso_bench_tx: honor CPU zero in
 the affinity option
Date: Tue, 10 Nov 2026 19:50:02 +0800
Message-ID: <1794311402000.8261.5604720993758809475@cmss.chinamobile.com>
In-Reply-To: <20261110033920.49267-1-xujingjing@cmss.chinamobile.com>
References: <20261110033920.49267-1-xujingjing@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 11/10/26 03:39, Jingjing Xu wrote:
> Testing cfg_cpu > 0 ignores an explicit -C 0, so the
> benchmark can run on other CPUs despite the requested pinning.

Looks right. cfg_cpu defaults to -1 and set_cpu() treats 0 like any
other CPU number, so ">= 0" honors -C 0 without changing the
default. 3a687bef148d added the option and the "> 0" test together,
so the Fixes tag is accurate.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


