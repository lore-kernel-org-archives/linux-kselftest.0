Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433310;
	b=GWOIYNdK1XTAEWq6ExWwoVzvF7yHRqYJXyLe/xP4Cgmn9H8LCJIIjaUk43rd5uXpF2j4
	 ea1KGdH0We6G5t1kattfWbANoy0W8+xip4vBvJqVQsrPWrTcBcNYwlTkBsruMUIjjqX2Z
	 GO9iFniYI/l7eCq2/2BZ5l0ATwON2qVOqZLzxzofyxKNAhPaGKKPNCe6IMBFHA+owcK45
	 3hG0ZI6Ump0Zf8CVtt5aC12A7zzEbDfbJyVoyPSdofvUdiqogCFr/qzl/iPs7sHaknnGC
	 aMpqdJq9fYKNtYz2KXitdi597qlYLUDiudaLE9vtPI+mrU6fMf2BQM7nq0m+J9HFPhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
	b=KVic+IOA6AXXAkzmxKhFk8wfmDzl9q7WqioO+ixZEmwkYeHTZV3Ia/K9553Bl2isHMzc
	 3A8TDwXvCSPp5CvWqeelhBhxrq3BGk5rAzAncw7crpC9+HU/+TxlC4Kfb2XGo5z+w7qSq
	 4vmrfWY6IimJJYl1ERxQrXnSVW16JIUs50nfxmfD78nv7BLX5VIIG/DZDMzQmRgEA0njk
	 MhTIwtXe2maigRLc5BU4A/2zCgVTclI0hdkaW/b5a3k3DTVOizEkDtUCAU2Lc/Ke46QYl
	 PlK0PLldgvm67w1Zc9ddA4oTkyJMRdFVwbv7KY9NFdL7jq4jJTCNiAWunSgY+gd5Caw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=F4Iqknel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40526606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 21:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40526606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=F4Iqknel
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f1fso2877271eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:41:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794433309; cv=none;
        d=google.com; s=arc-20260327;
        b=O9OmGmwGTa+zajYSLCTpOy60hqPaCLqY5Pc7UH1mNmEaSt1j0eD9TNYoaAmAT4hxc/
         7/0gxQlwyYu5xDbKNFiu0Z9ZWEqqeffCjjycYsqwSrZisQjSc5NaURB2HA5oTYyqoBTV
         NGACENctewRFY3oUhKVoV0U5Ce24UczNMZ9Rga8DGfHgil6vydgYvTtCec9JgZSVqOpL
         sl8AFpVQD0AMLje8kBwgAoXh0djwhbSEXXkFRRiIq4GJGbXdUkdkmH2Yt29nWltllNoG
         XBAAzG6Rh2Q0yfjJBa45AG7TAM2mTuWUifGRCebcPtG9/QdTtpNIlRen/hLKVD9sHwmF
         N7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        fh=vavpBgqSkjpR0o2/p3jGJHcx78joDxbckn+V7tq9WHc=;
        b=k1dmvIAE+7YKnDwI+fTgLj6bNREZzm+OpLZjT0slAoHcN6APV8ey1Bv5FUcLRC4q3l
         q0hAdp4Ym/GTGD2d8zE623a/4KikqbUSNTLDROgA26tV+OW6IPZCfW0jCFSgs3O2tB1R
         LRoRuCLE3UugYK8B0dWrtSsjUggI00sMTMQjtcKAPG3Ov+QvonOYuLc/w5WDzgQkwszC
         hecIqVy0rOC8tynrcPz9DKz4SeUaBisovQ3IuxsUVWUqTtygYmDkszFNBuQKjqteIBn6
         bzeogH6fOcOHMQC8NVP8ZYjLvUyyk2+zIP9j0aaljmQwCvIXPaLT4tbSp+EOVTRnelI5
         pbBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794433309; x=1795038109; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        b=F4IqknelR9U1Z90dhMwR0D1pwxqtvZB8DQWKsM/7pekMNvXH3BUQPt18aS0+PmM60o
         FmOlo7M3dSJEGVXBSRxxFZ72Xpju7KdBtpDEBRc8cRLSsHdXEHOfO05mkyel7IqTfSll
         IKkySwdEkEi1fHjMI5JzdxK+ikucIaoJkH+tl9UetAAXs88zGYQwEHCUo6ycT+56wnN5
         aHfCPaV7zf/R6JzzhuNpccH42WKrl5Qmg2dPkCPFYGgPM0vjObTWRnccnQk8gREUwund
         95QJEfY8ciOcidLK5/u0kF0O9RWV4PH7Iyr59LtTkFj5pS8lMCbuwP/9byeDXW5kxxQB
         o/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433309; x=1795038109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3NsBH7dbDhUWpFoVCuwiBWZEyjMNzIdlKNXXp/dwQk=;
        b=xlcqcBN+xPvG3x9w6+vdijEkHTfdpUa1vjurGszgETwpfhV+9J9+2APLWam4TSiJMJ
         Q50Vn+cg+KvyUYTANhgIwfz6t5+RSPo7ETgvKxshANlb49VLYUOio/MnLrOjP7kbN5i4
         K/x1rQRuUvP5eDbz7SlkwlCzQlI4TN4Utf1xfUMWA2wwpzs/HH6jvoaHgV8BphjqyF0I
         6Ofa36KqLrOlvwBUBBDNwCnaACTYouca6HUQPi51uW9Nj5UokDQP1JznrO4E2Xfvn1eV
         rpPdkK9uAj9u7rm9MoiW9AyzQNdwJXPdExsTkapRUFtGNwrRDHU5vgbpsysWvV2Wba9b
         gphQ==
X-Forwarded-Encrypted: i=1; AL+hErECR6BxjEhZ+HpeyuEbVQXZLJ3WnI3//MA1CTVA8GdzkZKys8PyrnWk1bt6olSpqBgldmy5rQgLJMnuW/wMmqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OZZoHgYeEfV4JRVFU98DCoDz9fT8dqqh5+vuswYC2+GboQN82
	uedjWliQ68MDzTYnrTYRACDu6F9SNoqWfiOP/L+sZs+wi1S4vq9GR6XVnQxg71FNbMHCnEAxkZ9
	4fBDFDahXzhI8KW6iEC/ozv4mMX5J8+49crGZ4sf7Fw==
X-Gm-Gg: AYBFou0d+0/hWU/RpGN4Y1M+2hnVJQOWUquFbJMLKtYu3njLP6JJ6AvkaoRUaP40D4U
	pAcu+kDTTkABvkps7yEP4QbywMCdOehMF03qJfErDJq9KT9O1ZYZRHcFo3U0zk4UXU698uTF+3U
	E+vEABZ96iLA7ZKsaWXh4R7AUbGC5j0IOImec5yD0KdnZhTar8fflMfCHIfdADqSGvmVaoqP1jR
	tEFCOdSnE+RtbcKhySsER4HOi0bNVDv/J3lHEFzROSN0HEPV1AlSLV3Sed4pbegOgB0By42osLg
	//byMLET8WX3EFjbRWiN+XYk52ij4ITQ61y7gLLKW7nTuZz3KWGMlJSIhqq/xflaZfw2E2LgNOX
	vRnlHvtmmfQS/SkuZkEqSDhPqlwCOUgNYkKSthYdzp2Hmk5136zKFJAYoax5VDyl8h71bMMgWJl
	rXP+GsfLpSQg==
X-Received: by 2002:a05:6820:441b:b0:6d8:ccbf:a7c2 with SMTP id
 006d021491bc7-7191797df4fmr2278556eaf.68.1794433304290; Wed, 11 Nov 2026
 13:41:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com> <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com> <avTOvr+yy+2j8xrQ@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
 <avTSBFpR2t7PO9tx@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
In-Reply-To: <avTSBFpR2t7PO9tx@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 21:41:32 +0000
X-Gm-Features: AclHuK9Lzd82c8LN3lRJw2ClwKtYPqt-3w9VlW5CxKeZCzjufsRqZ2sayCWq8TY
Message-ID: <CAG4wq-d+LtEi-omGwzgqx14rCp_4J9HztGMpa8ioMsviaPw+ZQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
To: David Keogh <dkeogh@amazon.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>, 
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
	Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 08:37:24PM +0000, David Keogh wrote:
> Our TC egress programs are not attached individually. A loader keeps
> a chain: only the head is attached to the NIC, and the rest, including
> the program that encapsulates, are reached by bpf_tail_call through a
> prog array. The head can change as programs are added and removed.
[...]
> For the BPF-side declaration to cover the TC egress case, it needs to
> account for tail call targets. Tianyi, how were you planning to handle
> a program that is only reached by tail call?

Thanks for checking how your hosts run the program.

My current plan is that the kernel reads the tag only from the program
that is attached with tcx. One way to use it is for the loader to tag
the head with the largest headroom that any program in the chain can
push. The tag describes the whole chain, so it does not matter that
the head pushes no headers itself. When the loader replaces the head,
the new head carries the tag and the kernel reads it again.

- The value can be larger than needed for some packets, because the
  tail call targets push headers of different lengths.
- Auto-tuning has its own problems, as stated in my previous reply
  [1].

I cannot find a solution where the value is always set correctly and
no UAPI is needed. What I can do is keep this UAPI minimal.

By the way, I plan to support tcx only in this series. A tcx program
is attached to one device, so the kernel knows which device to update
on attach. A cls_bpf filter can sit in a tc block that is shared by
several devices, which is harder to handle.

Let me know if this plan does not work for you. I plan to post v2
around next Monday.

[1] https://lore.kernel.org/all/20261108214356.95406-1-tianyi@cloudflare.com/

Thanks,
Tianyi
