Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267843;
	b=g+pZiwwDGNgwxqLHQhj6k3Tm72539MclH3+mvPXb2aZbirqvDpwIshllB/R09nhHUv3G
	 f26wcDrtRGdBzKqQrchhe9vK1fzFJk8/6YXORCXBbiQpppxFaGpaeLkGgUKy588MFFbaf
	 gTFOOcseqjK8x2ewbt1Vpr7C3megQCcKfnDF0d53IXXayij13u6hT1eJyVT9a3GFZqN9E
	 K3QGuMv6Gr4wLVN3zAxHV4HadydE2sZsExwa6vhW/nEUf4IRyYJzep5GRJlN2wbGYlewn
	 W7eIVRUIw2ZvqWnb1h8N8lQIPyaUBdoBqDTMxIpHzSHbs5iHvdItAAJ3iw54BWwUaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267843;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hWaXPrGDhyWCEUeKdoM63o7PKlFaYUkm9xCkqBAxeQ8=;
	b=edfcnqfEZJZgjOeb7n6QwymmZmMfInavuEi0uDCcqBADljDW+30Q7GzGRN9qH89nGkjq
	 ZBS4fe+15q0c1q9t4TZxU92RnrbZXxw/wJsFSNr56H6AvKnNsroXInmWWrGqSCEKU8BP4
	 dY5rC8lIMsxfQloBNq1wwmXH7GfCodnFqTs3hY3CvYr2vb5PLznwEYBsfwAcpHIiZfutJ
	 KGaPmbIT53SLDQh1gX4sdwOzZxnya1jeZjao9i3a4LeZ9TV+YbbY31WHaziAVXXMZxlw0
	 bqMirB1dAlX+IRd/FEoe2OhBPX2d0tiqMMRwaKJRrNld7Rjjdi429QctQx9Z+wC63wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W+8t3+4h;
	arc=none smtp.remote-ip=91.218.175.25
Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2D606A329
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D2D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W+8t3+4h
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Io8Za75LZDFiHR23Q0ReXlDPmUPWVZA1pjzJJhGltWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793267835; v=1; x=1793872635;
 b=W+8t3+4hzBuvDinHlL4/EKDxfKXJ4cubc1EvEM0vXLoktC0n9sSWJmPduSJC7rgYYU5smwZQ
 cSW/Bh7BxQrBADVQivNj+JWahrOFiESZrj9Jr4N8UEwkwbshany87jIUJB9D8FfYbLD5aTZGoO+
 WzvPqaCenb7HrvGiHq/D6bi0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cb8ab88aefdeb15;
	Thu, 29 Oct 2026 09:57:15 +0000
X-Mizu-Trace-ID: 1cb8ab88aefdeb15
X-Migadu-Flow: FLOW_OUT
Message-ID: <9145109e-0030-451b-9cca-d23eab30a826@linux.dev>
Date: Thu, 29 Oct 2026 17:57:05 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, josef@toxicopanda.com, axboe@kernel.dk,
 cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, cuitao@kylinos.cn, ameryhung@gmail.com,
 alexei.starovoitov@gmail.com
Subject: Re: [RFC PATCH v11 0/5] blk-iocost: BPF struct_ops cost model
To: Tejun Heo <tj@kernel.org>
References: <20261028143534.135968-1-cui.tao@linux.dev>
 <07deddf44be391f58d6c3f2e4843582b@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <07deddf44be391f58d6c3f2e4843582b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

Thank you for the review.

在 2026/10/29 04:09, Tejun Heo 写道:
> Hello, Tao.
> 
> Besides the restructuring agreed in my reply to Alexei, dropping
> iocg_init()/iocg_free() and moving everything into blk-iocost.c, the
> series still has problems, which I replied to on the patches. 
I'll rework the series accordingly: drop iocg_init()/iocg_free(),
remove the detach freeze, fold everything back into blk-iocost.c and
drop patch 1, reducing the series to four patches.

The cover
> letter is still long and narrates mechanics, and it still carries the
> v9 and v10 changelogs.
> 
I'll shorten it, focus on the motivation, and drop the v9/v10
changelogs.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

