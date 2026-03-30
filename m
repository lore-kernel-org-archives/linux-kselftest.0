Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C53D6CBB
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878780; cv=none; b=mBGTRo+vkofoMdAcvmZWRMtoa1CurzgI4LJDSRcjWy0LiZCOoIIMGUUUSnfvA8RLEnvAVRrdtesaoeJyq+jSDKhEkgRoT5Skq6lUHJ/ATMnhU/BqL+V6HVKSjZzEOXeuwjvr/UErxYhdNDu5JCn5LVm0Z/K6Verp9wU6W4RobU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878780; c=relaxed/simple;
	bh=Gm2aosWWnsY0BfZjNyWIoXrhhDu7CTIsgRg9k/wfjHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6QOhz/Szf45aQbBL9l6mhcm67uWINr0VwXwSanqzS8smo2ZJB18Obl0nKAj3fW5LHwNkWvBHl/Phq1ChD3EiklYWYeGsK0KmKBUce5fVStbmld+GMZd5JXtgk46qcoAnxLNEMNCl8+t24Rb1v40kJtsEgPRNDsFui8K/1fWdDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G/9Tf8G9; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G/9Tf8G9"
Message-ID: <376fa765-5a01-42fa-bd8e-98e04b595665@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774878761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJr2Wa1zPLoOBSP14xPgfxrUNKyteWBbxfSVWNbjPqM=;
	b=G/9Tf8G9CWSSeV0qyfmD+/VqcbHHjw32HBx1d9PxDls52ZqlmZCwFNUOlsPlOyNv8p9JPU
	3pxyZkwreouJRWRWm1sPu2Is7fGQ8vG7iXmGohOpvOHhWGBNpTmFzUacnSOTteoe3iClIl
	H/0AQz5nVfXME5XTs8dlVss6dAkWync=
Date: Mon, 30 Mar 2026 21:52:24 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Fix abuse of kprobe_write_ctx via
 freplace
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Feng Yang <yangfeng@kylinos.cn>, Toke Hoiland-Jorgensen <toke@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
References: <20260326141718.17731-1-leon.hwang@linux.dev>
 <20260326141718.17731-2-leon.hwang@linux.dev> <acpCTrpd-hak9S0y@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <acpCTrpd-hak9S0y@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/3/30 17:28, Jiri Olsa wrote:
> On Thu, Mar 26, 2026 at 10:17:17PM +0800, Leon Hwang wrote:
[...]
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index 51ade3cde8bb..1dd2ea076d8b 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -3733,6 +3733,11 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
>>  		tr = prog->aux->dst_trampoline;
>>  		tgt_prog = prog->aux->dst_prog;
>>  	}
> 
> could you please put some comment in here explaining the check, with that
> 

Sure, will add such comment:

	/*
	 * It is to prevent modifying struct pt_regs via kprobe_write_ctx=true
	 * freplace prog. Without this check, kprobe_write_ctx=true freplace
	 * prog is allowed to attach to kprobe_write_ctx=false kprobe prog, and
	 * then modify the registers of the kprobe prog's target kernel
	 * function.
	 *
	 * This also blocks the combination of uprobe+freplace, because it is
	 * unable to recognize the use of the tgt_prog as an uprobe or a kprobe
	 * by tgt_prog itself. At attach time, uprobe/kprobe is recognized by
	 * the target perf event flags in __perf_event_set_bpf_prog().
	 */

> Acked-by: Jiri Olsa <jolsa@kernel.org>
> 

Thanks for your review.

Thanks,
Leon

