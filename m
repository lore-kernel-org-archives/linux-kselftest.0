Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE73D9DB9
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344313; cv=none; b=Zyuew7v3T4ygF8d6sIeiInEn3NWbbOF1B2xmaLzFWdYOJINYnOIUUSknTycUwjUFlsQjRkZMh2kN3JKAn7IVw+S8d3srKyvB8T+bA5YObi0X+pIqlmZOpEyu49UVsxvCX0wBU160Z0Mm5zXBGAjSWB6jW2lerX1uvIeqKtC/WoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344313; c=relaxed/simple;
	bh=GOHKkCyufDj5Mq1KuerQJVS9wfLzVVIfOSUspWw4DjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAT4baM6chCPxj/sJEe3d6Ks1AU2xyH7NGzv3hpuCdexIvEB/s9CQNiEDjDtfzN7YquOFFaoiMYE79VI2l7AbD7SmqfNZ21sojtHqRFJtthllmSguJA6lvCYxNad75NqTaDpqdUF50WnFCQhH11Dz+2MJv4kpenNM6URwH0HFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mffNlHl7; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mffNlHl7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774344294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4jO0r5IecUJmIv4mTdACpfNf45qDaGIFDmDLsFFOhuE=;
	b=mffNlHl7ozuGlVKvGEH8JVLcF1n2qFV+xGOznYZFgt3Bp1hjKbNKt4hUr9cnGKOIj/HdJo
	QeTeW8g7e9tgvKeuctGvXehtfqOzPbUZDjYsqE1vsvIc4t0may8lSUNlFeDaFA6bcB9tWV
	OsI/xQudqqzQO7n0EG+bQzIaO/NKiFM=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>, ast@kernel.org,
 olsajiri@gmail.com, Leon Hwang <leon.hwang@linux.dev>
Cc: daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH bpf-next v2] selftests/bpf: test access to ringbuf position with
 map pointer
Date: Tue, 24 Mar 2026 17:24:43 +0800
Message-ID: <1949963.tdWV9SEqCh@7940hx>
In-Reply-To: <d749228d-15b8-4487-8c2f-604b9d5d4316@linux.dev>
References:
 <20260323021839.101316-1-dongml2@chinatelecom.cn>
 <d749228d-15b8-4487-8c2f-604b9d5d4316@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Migadu-Flow: FLOW_OUT

On 2026/3/24 10:53 Leon Hwang <leon.hwang@linux.dev> write:
> On 23/3/26 10:18, Menglong Dong wrote:
> > Add the testing to access the bpf_ringbuf with the map pointer.
> > "consumer_pos" and "producer_pos" is accessed in this testing. We reserve
> > 128 bytes in the ringbuf to test the producer_pos, which should be
> > "128 + 8", and the "8" is BPF_RINGBUF_HDR_SZ.
> > 
> > It will be helpful if we want to evaluate the usage of the ringbuf in bpf
> > prog with the consumer and producer position.
> > 
> 
> 128 is a plain test for ringbuf, like those in
> ringbuf_overwrite_mode_subtest().
> 
> The reserved size can be 0; however, a test for it is missing. It would
> be better to add a test against 0-size here or there.
> 
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> 
> Acked-by: Leon Hwang <leon.hwang@linux.dev>
> 
> One nit below.
> 
> > ---
[...]
> > +
> 
> NIT: Use BPF_RINGBUF_HDR_SZ directly. Is it missing in vmlinux.h?

Yeah, it is available in vmlinux.h, I should use it directly. I'll
respin a V3.

Thanks!
Menglong Dong

> 
> Thanks,
> Leon
> 
> >  	return 1;
> >  }
> >  
> 
> 
> 




