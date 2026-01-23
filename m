Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767A36CE0A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 04:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769141247; cv=none; b=p33FfQ31C5/nftSQR4iVO9kq49wv/iyRktV2M9EyAW38rQaVGs2RrO03azE0AX94iV5wpMQUfLlXgQ3aCi7HbGDCPchpSMneCX7O7cZoEBjpg5giAVTRSpvdeCqC4Bti1S2xnzn0kAsYArrtF9PnkSpThJzNvUWpRJ0w6sboLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769141247; c=relaxed/simple;
	bh=v6kZZe7ybcJOjR9F1ZeiyHnchWeMvm5tLOBTEA5FXpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jk2ERXtfcD4ZCkwizl2hDpDIDg6GuHg5AePhNpWLoi5NzgRIM8CS5Ywsu0SmYi5lKEh3D8BBwhY+HUbH4TQCE8ZS1FGVpiAdgpwyEAUxjEsaAXcx2bqd01egE43qsKVafD5stBue5PRP+uNMDiYb+N2IdJNbHDKEPXQAUuBnPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cPxbhWJP; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cPxbhWJP"
Message-ID: <a0ce1dab-7d7e-4b04-a033-4f0611090d34@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769141227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UdGSl1zFpyYo7ZLism+9vO/YeG3Eo+vsrATosec5nQ=;
	b=cPxbhWJPP5B2CyugGIqAuhz8oDEcxXLVkBcTMAYNhDWaNyc4IBpuNcwyu9xHAR5/66xOAn
	VnIPu6PvOBzokmE1gkoZCHpSmqOR6xzbaosA4w5U46YP19U45z8FyVR/AW0Qed6XS5F6GJ
	0qh+UnZQImb4WBhZ6DzaJeky9Ws4sio=
Date: Fri, 23 Jan 2026 12:06:45 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v7 2/9] libbpf: Add support for extended bpf
 syscall
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Jason Xing
 <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>,
 Mykyta Yatsenko <yatsenko@meta.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung
 <ameryhung@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 LKML <linux-kernel@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernel-patches-bot@fb.com
References: <20260123032445.125259-1-leon.hwang@linux.dev>
 <20260123032445.125259-3-leon.hwang@linux.dev>
 <CAADnVQJLz+nMHCZXUgy2MOxwFczEHNbG8ZUgfZeUY4yXFUKcNw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAADnVQJLz+nMHCZXUgy2MOxwFczEHNbG8ZUgfZeUY4yXFUKcNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 23/1/26 11:55, Alexei Starovoitov wrote:
> On Thu, Jan 22, 2026 at 7:25 PM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>>
>> +static int probe_bpf_syscall_common_attrs(int token_fd)
>> +{
>> +       int ret;
>> +
>> +       ret = probe_sys_bpf_ext();
>> +       return ret > 0;
>> +}
> 
> When you look at the above, what thoughts come to mind?
> 
> ... and please don't use ai for answers.

My initial thought was whether probe_fd() is needed here to handle and
close a returned fd, since the return value of probe_sys_bpf_ext() isn’t
obvious from the call site.

Thanks,
Leon

