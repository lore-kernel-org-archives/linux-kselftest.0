Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749601;
	b=sDPjIou5O9SVcn52bZmM5oCSYrzzycTKxaPgy7twdArPuE6+aOccJAHNOs8LI6AxwMnP
	 Ah5ksWmWQCkyYM3ChD45bUYCqDm9jU1GinL3Y4KVrXik6bwgYDso4A84TcwgcMJoQTtGi
	 KzKTNpzIpPlXEbVcPk1QlLtgpGQdVNxndm++/5xWQqkqC0LMe9q7BtUrywmx3B2fBQAOc
	 Ona73A+1p+HbgzCpROsABPeUv3dVfFZ5iJSuWpYQzVT4bBrEiKKuM++emt69hMW5bbbEb
	 mXSzFBr1CUMQ9TlTKGw9hz5+7QnF1WJNd65xCnIBT+vmLKtFtLDL8WFuHPz8nQOhdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749601;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uPirOmTrSzR+qJbbu6ot8AJCfXQYDzCgUX4JayMeJqY=;
	b=GoYSNauC7gJ0/fNDFNEA9+jpOMe3eN2LtnmaLJ3kVITYgwhqsVWlcPL/Cnf+Gxs3DhPW
	 /LduDv1ll/8cqJq/HYhWqUEkvoe2c2J+cdxceby4PWpJLSiEtJTGtFyRgXbZAPF7KNT4N
	 a8nR2CsyCX9a4ZLruGCXo4u0076Ojsy4vLcghkgNcq76peI3XBIIJVxaEKs5fYqhiPqsk
	 Z9eYjo+4+sLqtncmF6uNwoT4LWWYz/nr6WlGUKAYssMPbLRh5vT/PiHCCkcukoJDTozGQ
	 RI0L2RcY61Xeu3iCw7PHTzcq+JpRNnKubiJkHbSQngtxHWWdcsEULioUtxMe559JiuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A1606EEBD
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9A1606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1mASqXNaXoMjNQ3SMMIKGa4jpTD7lgU+gHYsGfukTD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793749592; v=1; x=1794354392;
 b=KpKAPSYGEs9xzCE/nniJ+D+PcFDzoE48xaJeKxYfna/UkNhwiNx6iPbsfUjBnSZo/KSk4gWZ
 MXzJ0L9NeSEuA80HOG9jmGCXPRSBuyMsKn7W22a/6aB2cG9U0B/iqK9LHyKrgdFA0fyIwbzVj47
 yZq0Pma41EhlOOBJnBYTiYTo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 353126e08cf0d14c;
	Tue, 03 Nov 2026 23:46:31 +0000
X-Mizu-Trace-ID: 353126e08cf0d14c
X-Migadu-Flow: FLOW_OUT
Message-ID: <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
Date: Tue, 3 Nov 2026 15:46:27 -0800
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
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 mikeba@sentinelone.com, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
Content-Language: en-US
From: JP Kobryn <jp.kobryn@linux.dev>
In-Reply-To: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:22 PM, Alexei Starovoitov wrote:
> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:
> 
>> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
>> preferred fix for fentry/fexit, or would you prefer a different
>> mechanism for reconciling preemptible execution with prog->active and
>> the per-CPU private stack?
> 
> No.
> We cannot disable preemption, since progs are not short
> with may_goto they can take 1/4 sec.


Seeing this issue as well. This patch opts in ALL non-sleepable programs
with trampolines. Alexei, would your thoughts be the same if there was
an opt-in approach, like a libbpf annotation "fentry.nonpreempt", for
select programs? A patch like this could then check if
program->nonpreempt is set.
