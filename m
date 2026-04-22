Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F33446AD
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776894793; cv=none; b=n8CQH1VKvqxv49Fdg5+KIGOhcLiuCooK1zpaALY/pwvGOcYG/z+szonqHtf0O8uV/cqTnvVxmFTmLFGkq/xLefydbOu0x7ettzumxwHCR0/ck4RozeVVnL/NlgzLA6VXtbRvYrwMWzMICu5o4LgyzYIg0XrUaW0fwxFbSUWQo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776894793; c=relaxed/simple;
	bh=LXdewrHNEqF5/FU1tRdIKkldI8J3a3W8f2OKjntfn3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jg/a/l+oaPc/lvpZdSyzE0lcmhcWtduSYm/xqhIbzTvjm2uE5x28mnajM5sAUSvploywkEKu/uzJHpVD0SJK7LXAJv8TH6niQJbwk4xROFQrWxseI8ZkEavNfLUUzASh6LpRFlnPZoK+Id96ZmorLu8Za3fUPOGEqSCrkciae4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lId8Yp78; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lId8Yp78"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso47231715e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 14:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776894790; x=1777499590; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tt5yDNYvoUooMbGjjoJFOkr5ibuyilEwhAEtbKH4lg=;
        b=lId8Yp78hoq/3p05hnmYdBtPzNhjMFh23iPGa7BJ9VqpGEvKfLh0m+ecZSmbqKDOAJ
         Wdb0fitVdlGMzl17Ia5LYbRMEPUc56Argi//oQhoq6hPjcsuwuMtOt4GwQaOneNpNhqM
         ZdcUQJWeenTJ9cc3fkBRVn1kUMdie/4qQqy0d6rcjtqHEWpmC1xwC4UowP3Yh1x74p/9
         cMZ4BnMhMcPZfz+vyx2CaWPkoKx208baxROd+bh6T4dyGDkMFjWTkqTQxNLlixIvYKY/
         LrjVWBWY4x5rqRZOgccYfT3hEWgeOxxR8bWi43g2hJ9sVskBbH6k2Hn+OQpejf8GqSYg
         fatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776894790; x=1777499590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tt5yDNYvoUooMbGjjoJFOkr5ibuyilEwhAEtbKH4lg=;
        b=SqdGGiCE3scbAIN9DDnPJT7tGtJwSy+lDmVJhy4FN/4J5iBsr6DKEE4J1XoNi8/QyN
         bZer8Fq84tY3OVsZS/X0z/y9qSSrpI41lvZrZ3k7TYc5PvmetQezm4B9mKIX5q4utvim
         PoDqrdoJ17bkoi7FDEoTQA0G5pwboM+4ond31PHiKVXV8kXIw8h4LatBa3jUOYVu/fjQ
         S62yp2aqdKpkWG1BRr40GiaM/AGKeBUw7PJ20WyWlvRSUuNQqlLxFLSVp/N92tHQPk+Q
         F3hlFezo0gITk7dK//XZu80JljNmUL5iohHol++FjEna7jXchIr/H2qD2IkdgEO0N0WZ
         eb0w==
X-Forwarded-Encrypted: i=1; AFNElJ/XWDBaRtMaoJvzRNyWocmhUr9Scg2ghDcxXG+5LjgikbhZy4CZ2t42McIJ50khLhj+KfQJ8ozGYdB16AuVVmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRM3xdJvvFgBrXJuWHTeH+dInQ5vt89HTPcb2HSJ28nWJypMM
	rwBtpgpEebFyga12lFQ4ra1x6A3cB3xlOUFZNMhjUqVCHTA2NJMFwne2
X-Gm-Gg: AeBDievV71N47XuyMYh1+2AUZABqrPgkXbEr7yIQI7gH4VaUjJMp9RvAJZoffhw+VJd
	1qAwpDqoRdGTwUfBqbFzKn9pwSqfUHUny5mD/6R1V526vlyj9m2L91U8bYGHoWP39m6NC1SeNtP
	/psuNxCTgQVGRw3hIoZF6r/sobR5dmM+azyHftj1Lt/SzlFTTSFpj2JOPjZO1oFxXL1VD3DoyGy
	4w/deft7eYdeOUwwtiMmY5ODtNuaKKeQ28WVFd5UqD+HwApCRzTeOSH63HGS9RTes3Yu1Bk0QqW
	ufu7oCbRi00YWBS7wGSwaycy61ylJuyUyvGlCu0QWpv9Jio3hcNkSPHQckhQWdrsIbRWyJ7XfVp
	1TV0mznPp4fSkm4+O1qValFEHAJQP2qWsoXJXgHANAUc0EMn1n5KN8eX+zP1QrasbETrsqKsPvc
	J6k06hwnl27VeBseMjdpN9r4HIosIPPEBZgSB6rwcdc8NN4R/tm70wmTC887haq6m9AfacQtC60
	Vuxgw0klLON9y6Fj70yFVz4dSdO/8R4eFttsUKBa0NKdDAc8TKRQbhO60M9FozgVCgEQjsa61Mf
	t/Ny+/FffU8vQ9eRHbDzIlNsHIvhR+AcvZd54jUKlaoJ2Xwzz9V5
X-Received: by 2002:a05:600c:8b28:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48a5c230e78mr48544025e9.19.1776894790398;
        Wed, 22 Apr 2026 14:53:10 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00069634438ccb7ad1.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:696:3443:8ccb:7ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm578595275e9.4.2026.04.22.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:53:09 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:53:07 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, ebpf@linuxfoundation.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Alan Maguire <alan.maguire@oracle.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: drop xdping tool
Message-ID: <aelDQyrw6eo6USKB@mail.gmail.com>
References: <20260422-xdping-v2-0-c0f8ccedcf91@bootlin.com>
 <20260422-xdping-v2-2-c0f8ccedcf91@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422-xdping-v2-2-c0f8ccedcf91@bootlin.com>

On Wed, Apr 22, 2026 at 06:20:25PM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> As part of a larger cleanup effort in the bpf selftests directory,
> tests and scripts are either being converted to the test_progs framework
> (so they are executed automatically in bpf CI), or removed if not
> relevant for such integration.
> 
> The test_xdping.sh script (with the associated xdping.c) acts as a RTT
> measurement tool, by attaching two small xdp programs to two interfaces.
> Converting this test to test_progs may not make much sense:
> - RTT measurement does not really fit in the scope of a functional test,
>   this is rather about measuring some performance level.
> - there are other existing tests in test_progs that actively validate
>   XDP features like program attachment, return value processing, packet
>   modification, etc
> 
> Drop test_xdping.sh, the corresponding xdping.c userspace part, the
> xdping_kern.c program, and the shared header, xdping.h
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

> ---
>  tools/testing/selftests/bpf/.gitignore          |   1 -
>  tools/testing/selftests/bpf/Makefile            |   3 -
>  tools/testing/selftests/bpf/progs/xdping_kern.c | 183 -----------------
>  tools/testing/selftests/bpf/test_xdping.sh      | 103 ----------
>  tools/testing/selftests/bpf/xdping.c            | 254 ------------------------
>  tools/testing/selftests/bpf/xdping.h            |  13 --
>  6 files changed, 557 deletions(-)
> 

[...]
