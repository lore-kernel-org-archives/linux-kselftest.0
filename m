Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C837BE87
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 06:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972995; cv=none; b=GLwvlRIlQ5BMA5bsjnP76O4wDq5/yQ1qK0Utgv/ch15DpYThnzKXUwMKzdHNlHXB/GjQ2AJ2m1pnU2xvZaLrKz+JIh6FaKASrFf8aBb/BePgslb3Xx2fJpKxzJmuc1vMCRATcdoqGpiX5KatqC0/fux5ryO6WNUi4zLq6bvCT6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972995; c=relaxed/simple;
	bh=y2lWQetm/SsebnOJSE3QoRjhYBxQyq/0WamEDnjb4yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSConPD+872uVtHAxEawz0VeonyQnamqDpH6t7mTABxM6DcArewl/6F7KXIpzDI0SVeFA3nREO4qn/0OMFPN8VtzRwO3SajFNyaiuUAT6/PwzkVg1Nve0NNpiLvv4kTEVqBQ0gItIcnVfder4rGHbcd7SGWFao2Iy1ETghJZNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BTMExvYC; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BTMExvYC"
Message-ID: <9b3f954f-fe5f-4aef-b290-30c4f92d4c11@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782972982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDYLqf+Bz2afmlLc3wTUZI08nGC+yoHSsm0rrmj/GnI=;
	b=BTMExvYCDuKm8tK3Te+da/XTfM+JPnBCEoiuOEjNspBRj1loKE65JDPq/sZ7LXx7FA64KU
	SavO6eKU9mU15zAR0hlhTdwkggiNTQC3wUuwzjvEx4xY9lqJUQw4cTtN2pZgeu75T6TOjg
	Ayq5vl38f8mubywdBYLymr9gLQs5/8E=
Date: Thu, 2 Jul 2026 14:16:08 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v8 4/9] libbpf: Add support for global percpu
 data
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
References: <20260629152406.52582-1-leon.hwang@linux.dev>
 <20260629152406.52582-5-leon.hwang@linux.dev>
 <CAEf4BzYVdP23ASHtAAzpuGH2Agx+aXRRxTsy6MZx0OgE+OffjA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAEf4BzYVdP23ASHtAAzpuGH2Agx+aXRRxTsy6MZx0OgE+OffjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/7/26 03:32, Andrii Nakryiko wrote:
> On Mon, Jun 29, 2026 at 8:25 AM Leon Hwang <leon.hwang@linux.dev> wrote:
[...]
>> @@ -1975,7 +1981,7 @@ bpf_object__init_internal_map(struct bpf_object *obj, enum libbpf_map_type type,
>>         map->sec_idx = sec_idx;
>>         map->sec_offset = 0;
>>         map->real_name = strdup(real_name);
>> -       map->name = internal_map_name(obj, real_name);
>> +       map->name = is_percpu ? strdup(real_name) : internal_map_name(obj, real_name);
> 
> nit: I'd probably pass type into internal_map_name() and let it handle
> all this in one place, consider that for follow up
> 
hmm, it is a true issue that 'map->name' must have the tail '\0'. And
strdup(real_name) does not guarantee the tail '\0'.

Will pass type into internal_map_name() instead.

Thanks,
Leon

