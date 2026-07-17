Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D327F75C
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266137; cv=none; b=sARYcThHgJuRT/Swl+NHre806Ts7buKSYlyEKKVCYTJN/RUBv4WBVAA1pqrQlMqoXsojwLid0vqYt6c1S9UDi+DCEo/7Xd1fpNQwYM8xzC0liXuUyCtGTpq78ibvhdGwh/uZVJDWbCLAZdCH49QcuPmY5A8Nr1IWFHXUjDkVozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266137; c=relaxed/simple;
	bh=UyKiW05dVXYoFQ4Ai8D5OcIFbFdmYd+XQyJ2dNyrYLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jp2k6vOVQllwLOKU6IdTWKIAABi4I9VhNiNjH+DL6WhBGVAwmH0fI3eMWDSsWCANDXKWrcmrTfsxJmBYkmrL2OsYS1mbuqzT1O7KRit/veLfjnKO38m/kjHet29v3+83N2bL9LZVgsHsAotm7Buc8LNB41tbRRYxAx4XCGS7gHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z6g+u74T; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z6g+u74T"
Message-ID: <ae2ceb0f-0b83-4490-9c4c-d070df6fb869@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784266130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2nO73VJbZLJZXD8mdV6AAwLiCRSAIePc9vguBMw4As=;
	b=Z6g+u74TnVi4465cV97afGX2kKVoJSfKGw6ZaL4GnXEFj9qUYIvBr7AncmR3dfamwMBUKf
	jTz7p0W/8jKWT5ZbIEgGyNAVO9yfGDSA7/Se6rUY6vMV/qTYzkTZvSYwwjEbE1bKnosn28
	npObmadLk0pqZZjlqTY0kq9sr3ijx/I=
Date: Fri, 17 Jul 2026 13:28:37 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v10 1/9] bpf: Drop duplicate blank lines in
 verifier
To: Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-2-leon.hwang@linux.dev>
 <DK0L4ONMR16L.29VHFM0R991ZH@etsalapatis.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <DK0L4ONMR16L.29VHFM0R991ZH@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 17/7/26 13:08, Emil Tsalapatis wrote:
> On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
>> There are many adjacent blank lines in the verifier that have accumulated
>> over time.
>>
>> Drop them for cleanup.
>>
>> No functional changes intended.
> 
> 
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

Thanks for your review.

> 
> What about the files we factored out of the verifier? E.g., backtrack.c
> also has the same issue.


Probably, I can post a patch to clean all adjacent blank lines in
kernel/bpf/ when posting another series.

Thanks,
Leon

> [...]

