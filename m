Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268259;
	b=5f84Kp0wOjpQA3B2tHsHjacO0T00Kq3HCYY5DfwbAVBqedIG2aq9xY+XBErJeXNLr/Hw
	 ejFP4XKOz5bZGEJLVolAW3S7eB0YKgglVxP4JiKbEjc2NxBsUvMs3lE9K1SByCaoXe+pb
	 wgN8PtdEl79UvjE75V6GLb1u+aThiyJ4ks3wNDoLpZFFiht/yXqFj7ktDPoj0SHvSrMEr
	 BLFphOH3liyae1j/ylfV++4z27jDa5Ul+ktn3BeXi2/4w7+nAHFqH+s1QIDRALU6eEidw
	 8XFwfERMxhB8AWtWpWYvNc2iMoT42lVablkVwrsPF/hdFxML5KppVRECKlIm21l7T2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268259;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LB/73nfCAHiY8ms6QFBHreSDwl9iYXEvUDaC3DV6Zu0=;
	b=XJEf530fUEBgxRFQyiZzQ8l+RhQjzdEIki9KfFjP5cbcKUovuNBTioyntBDXzxZjJLdy
	 g4nLVUkwRoF1b4NdGCqbPkFs4YPpowMPNvbqb2a3X0/AJddVq48lfwR/yP6a6iWGW8Qez
	 HFo++VNagUbEfOaG3utxRqMncOvbK0eGfAY28qCRDfuBJWgaNf7eD4JSiQ7AZxFbHt81U
	 N3eYaqgjmShklnXEEN4ll8pzh/oI82qdSifkQ8Pz/rz3noSg/G13tJRnKFUcKaKa2lu90
	 hVh2kx30RheaZsRdGVDq3YKQarQXxf1YL/IfXNIwqls/rs0N1rXBOe8o9ML8KMXGczQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTU78u7k;
	arc=none smtp.remote-ip=95.215.58.224
Received: from mta1.migadu.com (out-224.mta1.migadu.com [95.215.58.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE762606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 10:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE762606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTU78u7k
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BAYzLGPgGf5837fXM6g/DklP8VVuXY5OJdBGwkWAxDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793268256; v=1; x=1793873056;
 b=nTU78u7kXKe6fJXb4mdOo3cLUl1W8+j6jW23IQ8ZbftY929IH6CvYEOhwBSWyHqCv+6MADeL
 2mrGTD319VdqsFjeEqhWqGRa4AjJGEDt/ItJM5qhr9Mwnnrm7QD6V7fU+Lg1W90HpEWDpC/q9Re
 LUdXm7lMRptxlcA5rq9RRANU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9324b428c442bf0e;
	Thu, 29 Oct 2026 10:04:15 +0000
X-Mizu-Trace-ID: 9324b428c442bf0e
X-Migadu-Flow: FLOW_OUT
Message-ID: <d06638d4-72fd-4b35-9d78-a2e45856d83b@linux.dev>
Date: Thu, 29 Oct 2026 18:04:07 +0800
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
Subject: Re: [PATCH 1/5] blk-iocost: move shared definitions to blk-iocost.h
To: Tejun Heo <tj@kernel.org>
References: <20261028143534.135968-1-cui.tao@linux.dev>
 <20261028143534.135968-2-cui.tao@linux.dev>
 <3f51067b3d4d549e8414bc19bb612cb5@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <3f51067b3d4d549e8414bc19bb612cb5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

在 2026/10/29 04:09, Tejun Heo 写道:
> Hello, Tao.
> 
> On Wed, Oct 28, 2026 at 10:35:30PM +0800, Tao Cui wrote:
>> -static struct blkcg_policy blkcg_policy_iocost;
>> -
>> -/* accessors and helpers */
>> -static struct ioc *rqos_to_ioc(struct rq_qos *rqos)
> 
> This isn't a pure move. The comment is dropped here.
> 
>>  }
>>
>> -
>>  static int ioc_weight_show(struct seq_file *sf, void *v)
> 
> The blank line removal is unrelated to the move.
> 
>> +	bool				user_qos_params:1;
>> +	bool				user_cost_model:1;
>> +
>> +};
> 
> The blank line is new, and 2/5 then replaces it.
> 

Dropping patch 1 resolves all three: v12 folds the definitions back
into blk-iocost.c with the original comments and spacing intact, so
there is no move left to keep pure.

Sorry, I should have caught these before posting.

Thanks,
Tao

> Thanks.
> 
> --
> tejun

