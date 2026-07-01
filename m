Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22713C585C
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 22:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946780; cv=none; b=j/yBeB/r8pLHNe4QXNrNI6aJcqYa0UuCbPZXYjmxAG2cI8SrGAEFgEWgGASPTNDugQZHzWejccFJo/hFjeMOPaJATq/35DdWpdZ7+wlr2aXtqB5haQAk39MW72m7PuPT47mFF1hz4qaUVXe1178HUCbX/kj2vhG5Ku1fpIkthI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946780; c=relaxed/simple;
	bh=b7hCX9/rBhLq6D0U13TWkBKOZW1C8WElJk7v2c6wHGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTj1T7EsFicGeclTYzuBTFU47QPg5+ym1+VEqeDv0h5rM5dxiZck2ZR7O00shM1JpbSYbzEh9OkkDDqtWP2BD6xBHokwSv7p4tPBpvXv5b8oZD+Ip3jqOvX7jHEBGeRtc8/lK5eJk1Byk77G0vmGcX+8CAx4zLRc8ZFfPVLkcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYgHKdg0; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYgHKdg0"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso347456a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 15:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946778; x=1783551578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=giEqW7q9VcfExLik9phOW3EsB4XFWvu/oaZfoJVW5+M=;
        b=SYgHKdg0agRvsDKUClXirSvqPSa/5BPj4Jj6Eks6GD/km9VzI+nGMDdddeYngntAdL
         EMIeQUSlXJjct7AwQlCMlWBGeOHuD09kFn09YOAYlcMysFbjhLTMBO+wXluTBU7rbF8Q
         /LIolGkD5Ygl3CmBCj12elvVQ6rMnJd8JJ/NHzwaNWRL72+kGzaTDypC56EhQ3N4CeiP
         Tf52tt3FgfoalUPrE5sYNQGg7l8vYoRkyWgjs2W32v09W47nhWRCsQ9u7rJ56wtU9rSt
         JgWnDvgTAxhsgucvdLaPvzxYZmkgZebIIedqQDN5Af8w+pkpVlU4BhsFghcq6a2gjLp9
         /4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946778; x=1783551578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=giEqW7q9VcfExLik9phOW3EsB4XFWvu/oaZfoJVW5+M=;
        b=Sa5N8qcL4M7/3oZheEuP5dnHDH2Sc8kIsXmZ7104oGr0T4NhkV2S8o7NkKJAjckRpb
         4hMjZhvgHPHv9hOoK6a9nzzgs8kxEO585e53hRnRGHW/vY1WuZQdDscHXcXhtAGkvuLw
         GIxK6KQ7DxG/iapXSmX0sOh8KBscA8mYOBGOzMU7i23U9jCSNtbrtyKyLsis6v4ZtJA6
         farq1LSJoeX5KZFDWNTfrZpO0qrEg7htgDchBl+7X+61B9JuoHCnT9jfUgg0PUTRuthq
         EPzXJRnIvNFN2zhAyNl2zGzWcuA0qaMgi9VGo3bIHWHQXNjTKUONsELpNwzVSZCp8zU4
         SA6g==
X-Forwarded-Encrypted: i=1; AFNElJ+82e7V+qVNUU0WGIIEEZFEJSPR/Kh6CqXE6NCeRAv4750qS3oP6aQDJ4gziBrD/SgP8jttee4VA7YpzeJyT0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO65fH0UFOK4wMwDCCQJIj5VpNecoETZf2i2fHIYQFWR5qj9Uq
	pADPm5qJvnYo5I2BdjWkrkBOsX+f9VjmiYgFTNjUj+pEQN7xEwsY7+mP
X-Gm-Gg: AfdE7cl8jbOo7FCnIVRU7z9gixzQAyInIYA9C1QWPCrHJi1AEmolGt3QXaDdBRTeU3h
	F4FYSwQUa3K2chNoVpKRCOAbApgW3uQdTvu8cqDW/otTnSNMv/8hdXJzvdUHIkqCrw+4fzGU6mB
	3rJ0eL7oAp7UGSNrZfRVmD+wsTmbrOnCBoWVjBggdd6UVPFx2DCSZGHleqjB6S/68z/Odpd3sKE
	4+kFMH1hxfSSMoeGVxl5KTlsV/kdAVQkuex4WjRPtxJ6HumQhdLKe3vj5io40H7WjTtGkvaYe6c
	k24s669HV2N0F2+Sa1RV0Ropw9ve4ZNdbRIN9Jb8cjYIbV0IfTkkfm0zWwOnH22HbydiKhe2xua
	jNsOZYXYRHD9wOe3xp2sCGbKYnfZr0of3BhvUWKyhidpr/wdjQ13gFhqew43k0iA163yc8xOb4U
	ZClWZJVffGYQ==
X-Received: by 2002:a05:6a20:4310:b0:3bf:c12c:2ecf with SMTP id adf61e73a8af0-3bff430fae9mr2922510637.59.1782946777855;
        Wed, 01 Jul 2026 15:59:37 -0700 (PDT)
Received: from john-p8 ([98.97.43.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm442748a12.6.2026.07.01.15.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:59:37 -0700 (PDT)
Date: Wed, 1 Jul 2026 15:59:35 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Michal Luczaj <mhal@rbox.co>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Cong Wang <cong.wang@bytedance.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/4] bpf, sockmap: Reject unhashed UDP sockets on
 sockmap update
Message-ID: <akWbxAwIhjJdPtjA@john-p8>
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
 <20260626-sockmap-lookup-udp-leak-v2-1-7e7e201c951a@rbox.co>
 <87pl1937c7.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87pl1937c7.fsf@cloudflare.com>

On Mon, Jun 29, 2026 at 01:38:00PM +0200, Jakub Sitnicki wrote:
>On Fri, Jun 26, 2026 at 10:36 PM +02, Michal Luczaj wrote:
>> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
>> sk_is_refcounted(unbound) = true, while sk_is_refcounted(bound) = false.
>>
>> Because sockmap accepts unbound UDP sockets, a BPF program can increment a
>> socket's refcount via lookup. If the socket is subsequently bound, the
>> transition from unbound to bound causes bpf_sk_release() to skip the
>> decrement of the refcount, causing a memory leak.
>>
>> unreferenced object 0xffff88810bc2eb40 (size 1984):
>>   comm "test_progs", pid 2451, jiffies 4295320596
>>   hex dump (first 32 bytes):
>>     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ................
>>     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
>>   backtrace (crc bdee079d):
>>     kmem_cache_alloc_noprof+0x557/0x660
>>     sk_prot_alloc+0x69/0x240
>>     sk_alloc+0x30/0x460
>>     inet_create+0x2ce/0xf80
>>     __sock_create+0x25b/0x5c0
>>     __sys_socket+0x119/0x1d0
>>     __x64_sys_socket+0x72/0xd0
>>     do_syscall_64+0xa1/0x5f0
>>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>
>> Instead of special-casing for refcounted sockets, reject unhashed UDP
>> sockets during sockmap updates, as there is no benefit to supporting those.
>> This effectively reverts the commit under Fixes, with two exceptions:
>>
>> 1. sock_map_sk_state_allowed() maintains a fall-through `return true`.
>> 2. In the spirit of commit b8b8315e39ff ("bpf, sockmap: Remove unhash
>>    handler for BPF sockmap usage"), the proto::unhash BPF handler is not
>>    reintroduced.
>>
>> Historical note: this issue is related to commit 67312adc96b5 ("bpf: reject
>> unhashed sockets in bpf_sk_assign").
>>
>> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagram sockets")
>> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
>> ---
>
>Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>

For me as well.

Reviewed-by: John Fastabend <john.fastabend@gmail.com>
