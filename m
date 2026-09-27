Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245E3502A7
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492043; cv=none; b=PwV5YFXoOsYYmSLC31SgLl04+J0e5Jp5kgHVO5kZq5KBDtZRPkblBRc8GMrF9/n87OMgM4zwh3YNZ6OfUoMEPJT4diAyq7d0f6xq4w7ULNTL0FWhBir6FgGBn+97KKHlzdBdgodyTg3NZF3lLeSS0Ve/0bEs/7wGZ9rYo7hL+Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492043; c=relaxed/simple;
	bh=Rp2X+dx5hQ3lt91Pr5vYcPaasxyyoToGNSTmo5cX7rE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PW+XP5ObK7pC57keX4aecBD+6WyRofU+peVMZkgINQi9OJexAA65vm2w1FygQ2bak81sMuaLud4JZ1AZI/q09P6lg/FzCiJIZI6Ix629q8puu20Rs8aqh7E4InVf8QedowxTfqYwDKA6w/G7nE7vs0oyvZ4o34437TYaZSOQVxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVmgCx8I; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVmgCx8I"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1189369f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790492040; x=1791096840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blA64iov7PIlD+oGU3ZepcahACLOoCoJ8JGCVHSsjCo=;
        b=GVmgCx8IWI7BJwAGDmQqubdboZkfj9rKj+kWI/YizjieVCyI5F5r/LcTUzaBK8LZuv
         +Jkv0NEwqONlns2PLh9jel/dshFd7vQ3RpakjyBu3MoUQRlVB+nr+sC+uMspPrjWWKkW
         uV5T6rwrrco27Ro2bnNZsHhwFawMMdF5Umg5uNAwvO3hGeLH4cex/Im5CqxwTXwYjgyc
         uiJgyeZeqfUo0oJe5XNNpUBWoKwR/48ydQHVoUNCCoZmg5hJ9dI74lBlIa74TNmtAe4W
         kkVzpoiX9s39fxRLBfFgor7wv7C7CNutbf3mEqzOWYX1GomXigv0TmSTPlCT64V4Q/DA
         iTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492040; x=1791096840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blA64iov7PIlD+oGU3ZepcahACLOoCoJ8JGCVHSsjCo=;
        b=dTcTtBaRGe7zzu68vx2Q5QJCyH5VDoYxmk1SY9GfONmhiET7NS3G6dSpwMv+eb61mW
         PlxZL03mVOG1M4wyj80y6RsfLWg46rIB+V1edX/ewrjMM2W0EnNQPUtt9KZ7PIGsE1bD
         Y5iLyd9MePszNMpafmntKcoXC8VC/xmncH6x0T91vfrt9fLMRlYlOBlkZcvr+GYEJz0g
         RdPOABTdNNtntuxOy/RX02n7gaZJx4HKHOLH5fh5VCFxV/aUrOGj8pND2FDY6ltFQIYf
         i+a7wjSP6DO57v6T8tsI1sKbcDU0b2QAibbmnlqidCX8spoRy9YykHnAfhHe5vHbToDn
         NSdw==
X-Forwarded-Encrypted: i=1; AKwUvBwgXQXDC465/8pR7smjOijP3c9F1VwFBkethQUcvvMtzMGm9JOeSwQRY+b6Z9otDfk64yZdddtlQf+BbZAQhlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCcLtJpBTaLvdyaOg7obCJcz8SfL+GPGJb6tf2ePxoYwDLBID3
	TH1VNT2nmwcpIZYHe2+KILWk6uSfB0/8GyHICfYWAw/doY7xbHYTqK8R
X-Gm-Gg: AYBFou29qeMx1jy61DCsaHyK0o5wLrzKcmlbpx5bg/9VriJR0Hs3xy9ZHY3r1IQu39X
	bs4J2TduAhtLcq/MV0kTlBeLAbs8XhpnBSThGdy4g13eSAlTbZNShs4yuGy57nmW2noFiokGxWb
	mb7yoyfJhqEhplONZgvJQQzRQfnaU4M7nhNGNOE97jDT6GPlj7lewfQbRAcGMvzJIcOoJzBv0pJ
	J8VvqCuQJIkUqrxk+047ZzgY9umQA7gGPeKKj6kqYb1BfTFLdqZnb4zXybGkMAW7vDPqojvUHU3
	7qh8XZlymVlOIJNy196a0pAsMJ2G+jTDoubAKSlqezHv22YmaLUjJlubAbw9akpNKdAIEeo05KF
	J6E1ExMCd3T9sTGrcyRjYQfigKXFXV7DtPdf3Ca+O23MNDBrUOLVaE8DzNhQbKsqQBfijP3sEKW
	iFTv94UQsR12OUvpQ353Cs3YFkhdJSQAnFzMjKrcVWl70tn4LSZJZxG7KCHzSITsILLdJMkaIhF
	++F5XQ1LsWM4Brz4HCjgfYjqk9da4OZn0vRtf7bwg2Azw==
X-Received: by 2002:a05:6000:2504:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48871878daemr18432269f8f.57.1790492040099;
        Sat, 26 Sep 2026 23:54:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm26432209f8f.10.2026.09.26.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:53:59 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:53:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>, Ido
 Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/6] ipv6: reject a negative optlen in
 do_ipv6_getsockopt()
Message-ID: <20260927075358.129e5f65@pumpkin>
In-Reply-To: <arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
References: <20260925-sockopt_expand_out_v2-v1-0-c3ef2e3bb5c0@debian.org>
	<20260925-sockopt_expand_out_v2-v1-1-c3ef2e3bb5c0@debian.org>
	<arbE6i8JZrOs-DO9@devvm7509.cco0.facebook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 12:02:22 -0700
Stanislav Fomichev <sdf.kernel@gmail.com> wrote:

> On 09/25, Breno Leitao wrote:
> > IPv4's do_ip_getsockopt() rejects a negative optlen right after reading
> > it. do_ipv6_getsockopt() never has, and nothing downstream treats it as
> > an error either: len is an int, but every consumer compares it unsigned,
> > so -1 behaves as a huge value and each site clamps to its own reply
> > size.
> > 
> > 	len = min_t(unsigned int, sizeof(int), len);
> > 
> > So getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> > answers 4 bytes and reports 4, rather than failing.
> > 
> > This is a bug ready to bite us in the near future, let's get this fixed.
> > 
> > I've found this because testing the rest of the patch was returning
> > inconsistency when optlen = -1.  
> 
> If I can do getsockopt with len=-1 today and get 4 bytes back, isn't
> that a uapi and we are gonna break someone?
> 

Treating negative values as 4 goes way back into the pre-historic annals,
And I agree that there could be code out there that fails to set a value
so passes 'dirty stack' and it always works because it never passed 0..3.

I suspect all the per-protocol code ought to be passed an unsigned 'len'
(and return back a possibly modified value for the wrapper code to give
to the user).
Then you have somewhere:
	/* Historic bug compatibility */
	ulen = len >= 0 ? len : 4;

David
