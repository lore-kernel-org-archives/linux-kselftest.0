Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285935;
	b=pEj6YO8DwsOA64qgo1B9vZ8RpX4Ke+x2czRY3pE1wSWEMVCQs9r/CImdQGuKYib+YYgF
	 m9nMJ5MsfLCuiv5ZN2R8ahQgFjsK+FXxNdNsKQKbc8rldpFNZxnhMCgzzN07sOzhzrjtf
	 4fz17v2BgaYVGfAsCVCJhIixjUk8N2mSG9/Ecbi8vQUnnYafPW7k6r29OY4/yv4RFeWEZ
	 eI01MO+jakD9hFFeOZ+BQOkosJBpB3Y5gwlpvhyWuSTbzq8qkJljiSzw1BYDKU6NqoQUg
	 8OgAxEllIfVI/6VwzLvU+fWMPq+XesuTla4jBDv3PYs54TcylJ+l4edMGMYjLyqKpug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
	b=gsFsDysAvk+X4GhMLtmRQ2lkUn3nLVEVNeZG+A2oPTeLPuCixxQCvGLmJg3Gb/iWcK/U
	 +6ghb9dvTWc6rW0RD3ZcMlTN95x5ZBq4mt71SEiD9+WfS6/vIMvTaJnH2gYwkg7M07ARB
	 /ZbPT22q6G/TOCPJ2Duiw3Apuy0x8XhGokCA34hrIG/dg0g+XLP0KRVF+La/43icu5jOJ
	 hv5zSU8CTh1eWmDLQ+hCejAOjqvQzfAPfmhMMqwmIHmnpv7Oo8bvmhgHhUQF4lXEjy60o
	 YtXoyu8ePhlso3UQEHc9mM6xUQKQ1xtzg0DxQbQFAcQWo6OWsq9pKLleheSvcCurj8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288AF606A320
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so819601c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285934; x=1795890734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=DaghztvbDwmLFkrHuo7a/sJTEMIbMPmqTCllt3YXXs5/QvBXSOdXJqhVDvN8JLxAn0
         Vriw8/p4M1Guwy4T73CnQNyFoXuwNeLiyfkeQxsU6imRnXU9tQehTBTNWUntjRpNOnmt
         81VjVdUMTWUnSOsb6oSsyLdzYGp1/peaaANrZO6Z0YHZRiHJmCYVw7lm+R+1lAM23u0B
         2XQ+EBzTODDyCbn7xTfv0qbjMsNI0g0OwlLQ9b6SaiVFY0RhrvKqDHIKkpGzbbRioG7Z
         5TG/C2jVnysrVLiW9jEyHjBQO8xtX71626/ZYM761cudpBrdY6lAEgVsCBaRu6WR/0Or
         mQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285934; x=1795890734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=uu8u2m6oqNxBA6gPcMfSp69Ebm3OLjLGulUVgUh/7VI67MDNl6CVOqa2J1YUGE1epD
         93/Pr1/Zc+54ZwvU4bCkfoY7cXK229/H3zIxmHPM1U0cLHFmQZqLBomZmXH4RDf+zjYW
         snP/i9RUGe229JfK0WvRetZ4Jgxwkrj0934cqTUYxxoif2x7eYVx4Oi6MvLE0FwZaVob
         oVCtvBTejq6VwOtqT0vVwP9Z0qYDw/Enk5SLJKH8zInV/+gys0TX3g9yn7Gqfr7x/4AR
         vu7xRN7Jxnmv+En6o7SB3q/GBjnX/eqpP+8M7XS6g3tklCgDLdngmEpK/OSDzgZzQ5Vh
         ixjA==
X-Forwarded-Encrypted: i=1; AL+hErGtsjgiuzo+r0IfvIi7sbnKtRb4ZXcIs0tetiL2YxNV8mPUN8LoM3/JzWaaqhPVFaAlypQUc6TN7MPvOfnzN74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MxnOwh1iuAlRTwgD7/rID5y8zNe7iIfNGxRUKh5mEhXnTzV+S
	fMBjVNoS8+iPPTZAHHp7RsaFzTN2SozzsVUEXHm1KBa1U9q0xzr9ZQT2i28NgPaL9gVbD1ZnmaQ
	GVK3iJw==
X-Received: from dlbrl27.prod.google.com ([2002:a05:7022:f51b:b0:1b2:375c:827])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f516:b0:1b5:1a41:f3b6
 with SMTP id a92af1059eb24-1b5567b4783mr5725838c88.4.1795285933762; Sat, 21
 Nov 2026 10:32:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:32:13 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
Message-ID: <awHjn5AXWjW2qMPw@google.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: document black hole detection for tcp_mtu_probing
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:52 +0800, Yongjian Wang wrote:
> ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
> 
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
