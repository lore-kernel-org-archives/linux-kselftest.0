Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190541;
	b=X4AC01Xoi4amPslZJz01Jyfx1h8g52QaFwWqtOSxhZRs8WJNZzU8SWq6DBW/stE5C4Y4
	 j98n2f7pzqH5tkfjAIbbAHmIMa29+vb00+LjxMkM/Fig/c1C7ohApk+Y/9cbWy6g6zyzE
	 HtR5bdHZGmSDssRPupM9wPidtKL/pVyt2V5F7AUaPECel40KHg4PTYXtZhW/Js6Lt/6Yt
	 8SwSYnSDvcD4Y6iEMyzpPoXNKgnFMAinuWPgGJu2NviWBicWOrXxhBfQLcJsVQ/oljhLT
	 R8oum/ttqA4paFBbdGvbCfFvMWFwbQfqPw6p4ffRhTzOjNAtEXaPKSjMAkEpjuheEYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190541;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=42Bgp9QK8SxMu4RaMFo7ITDdz1xu9H4f5I3RqLrzFX8=;
	b=zoIsWW4rJMsdaWzx2nyaIRak42x6gXe+QRYtQUe7hC2/su76tNShwpa2vCnP+UpUnWc/
	 3hVp7HbLcF+iQfA87WbKB1axXplcK+fQQGR55Mwn8DINV2HWUNNTlIff5L/MPYMYsCjgd
	 GczVsWbJVqYTLLgUwWhd4Sm4OrRBHzO9gOmRZAGDsrJ/7EY3eUPajemp0rMY8UMtOXpiN
	 qGM073/nAylYG4k51w9ITw3v06davZxm6b/XiMiPkrHNxGSMw6BlJ3lLC5C+f5uTe+s1A
	 HmAnrO5M8GyuFzEyEU4KLhjMW4u9MUAQnB+6ZKI1KIYmMZjwWf8RJ3F7InJQbrFG4fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CkqQONWS;
	arc=none smtp.remote-ip=95.215.58.106
Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A538606A325
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 02:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A538606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CkqQONWS
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=42Bgp9QK8SxMu4RaMFo7ITDdz1xu9H4f5I3RqLrzFX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794190538; v=1; x=1794795338;
 b=CkqQONWSG9KB95QZktl/P5f9lasdYz+ixAT14Lq8aTrrFSgJ17oYYEQUzmXfkUVsDouGzGV/
 eFJImttXCM8vc5OiFQrrf+e+SETMZvZLsTb8q2lAdmK2kg1jkvotRh+G26Vvm+JW++zcLNsLoNV
 Rgi/Q4atLWoumpAfVrv9EcPs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f4563db198ec34e;
	Mon, 09 Nov 2026 02:15:37 +0000
X-Mizu-Trace-ID: 8f4563db198ec34e
X-Migadu-Flow: FLOW_OUT
Message-ID: <47eae9bc-6d8b-4b73-8fe7-869753ef9600@linux.dev>
Date: Mon, 9 Nov 2026 10:15:21 +0800
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
Subject: Re: [PATCH bpf-next v3 2/8] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
To: Michal Luczaj <mhal@rbox.co>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Eric Dumazet
 <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <20261107-sockmap-update-limit-iter-v3-2-7c0bad1ad036@rbox.co>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-2-7c0bad1ad036@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/8/26 1:58 AM, Michal Luczaj wrote:
> Among tracing progs, allow only iter/sockmap to update sockmaps and
> sockhashes. Previously, any BPF_TRACE_ITER program could perform these
> updates, which caused locking issues in specific scenarios [1][2][3]. This
> tightening is part of the broader effort to lock down the BPF API [4].
>
> [1]: commit 4d328dd69538 ("bpf, sockmap: Fix af_unix iter deadlock")
> [2]: commit 64c2f93fc325 ("bpf, sockmap: Take state lock for af_unix iter")
> [3]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
> [4]: https://msgid.link/akRZ_e7DJh2aP-2i@john-p8
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

