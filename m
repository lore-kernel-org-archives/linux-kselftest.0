Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013259;
	b=DrcuizfbHcGQ549jG2wX5o+xdog+9IDGwzHkP8/k2E7/iC8oLeEpFi2mTPW4oVx3zmFB
	 /8umX77XVI1xmleA+e4OmgIsMThlCVc41L3fLAQDV03pkjTh305mEuSEDv4Gv6F5h+BCg
	 S5/K5D7PkPwVF0serWXlQ5Du7WuZVcl2XdZNUgi8yrdGM9QMLhMXYwNUuaRmVq571Kuxs
	 zZduPv79Oeefi9svlk+gjRdH6f+Hya0ilhk49CmFAPFpNDFWQPYKRm6qVia3cA/e3yZtW
	 iBaTktIrBooljzOmLIS7nY2q1ZD5I/+JRWBwgbvsM01rmVEbZi0EpfmUdHY9rRmyPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
	b=FNvjLP9E4AZjKBK80UeN76kjHUCCZBCDxmVv1JcKmo410g7kzXLJXIBuSkPRp3ZxQ7BX
	 QSb95JcsnwnsnbdPQ36Iki5yNUzbYFod2DRQHkI+cPnUpsfCSZoboi/I+o8RhdCvRpP2X
	 cyJ/MT/AeZ3hU7e/IKfASBWkcgaIIEZHSNvmujolkxfXpM4RcNesQ7RJW2GAxxmANbOr1
	 p1KcMt0Up67eKSQsRzc9uXxjadXA0FDYjMETkzjnojeTbfU8huQl6CX3J4Ijk3xa2Alof
	 ui60cgX+mWU4YsbYoSB4rrTNBXA/zLtIbas7OJC9ee8WeF2/o3jQ6s64wBWgESnLx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mce3LPT5;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD960A2615
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FD960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mce3LPT5
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94961ed97bcso130465485a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795013258; x=1795618058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
        b=mce3LPT5oG7C8F/QlXxfra+ftcUqbbosr68KVWr4liElvzqRdfBEqD/aEKIHceO+Aj
         +7TrSS0VWnGw72sCUYxtMjkg2MrGffSmsRtSP06tlj7q26d8E2nSTu4Z0BSvWs0M5cd8
         KB4LmsGi40TprWi9Dp8BnOyTEmFGkNYhFFanczHDzzKTNXuNvSPbFVnO0PIil/6+GCbK
         TBiO4Rkq/COIB6DJcfaHVgLG+7qjvdh1LPzUR7FonRPcRWRDNzUcdJW0Rcnl2JL9lKHC
         h5D0d4zczwBfyJqPh8GSUOsTeJtA1998BdswYK4nrDfVV55D9/VxOJDtpGtoQt8e5N5W
         k9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013258; x=1795618058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgtmGgLwdp7YHZZLZXtmuM3LeEAEVVcvQiETOOFbu8o=;
        b=nmPu4u21u5UaJPqMH43SoSlWY9rq9LFBV3E9fslqHvxs17t1K/yuCLxQJtsBXSTmlz
         Ywi8kJ7IjHEAeQ9HxP1Owuu0Lg/2QFiSAWXretNE1V+Mao3DFF4UDMtSUTtI4G64+jUo
         +fHYqotjX8ql/0pbKd+ClaHwnbeS3RXQsDaxfXwG71DuLecYp5jjM70U+9WXUzKisaKp
         vP9U8+/G+bSq800hdTNvXUvYlTTXdFXrwPpmkWYsbC53+BxBAlPXc6MNJ+74n3k4EEI3
         CZWY4/Y0RKesH643PUDGwkYVJm0qNdvYcnadGrV2PstBEh4oQwR0/dJsvVQx2pcGMVfG
         STsQ==
X-Forwarded-Encrypted: i=1; AL+hErGYw4jEB+cZ2Ta6uBVCqLbXc2qPBK2kgbppunbomOjR/f9D9twH7TFcs9XXubHKzc5iR4UPMypiyipvfdbsW88=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kKqcQL1Q34p1wALsj/+ks7JkutO8keIe5OTGTowatMzGhFV4L
	W5AWBSNXipvvlt2b7WG5XI8yX0bM7R4DP7IsPINX+Y04bErMcqdWMoPwxB8oUNNFTsZ2txig2Dn
	9RYy4aP0=
X-Gm-Gg: AYBFou2aw+pDFqQvvcuSPcQUiyoUDgHZ8Hbmu8XTEDS9sOZuZGiJitYeOniz+CVDhzH
	ztIh4lDgEfenC8uiQAGJ/vfBQOpY37ozvPBSP4mzrjbKm01j1GzH7sFiSEASK5oPTu0CDtWcAAc
	A6op/cZ5v/zObMpjLvHtqKZqfuoSwZpG/Po9sD0UUL/j6WknP6oc03fN58a1TQIkDYQXcWtmdUu
	+3qDHSZMlB6Xy8GiVF+ALYEiSm0vK/hMW2NWC8zdH/32w8egZdkdltYHzqejTKvtX82YFHC116U
	x37TQX/L5H/U/eteFVl6c0bYwKRyKHtAZVpZts/7/RISUa0MlhfCodkzYaTr773F3LROY5U5SHk
	TGtXkHLoSCY1D+gkqvXDTLiAvBgCNhfYpMa6I1wX/+j+4Guz5ipeXM0Z2xe07ldigDjcZ9FBFAr
	B6GA+iKHNZITOUIToRNx7r6pC3m6fRSOdgpca9xMEaqjjbkrDC7QwFZfZUnR++A2H2/e4RvTsW4
	4up3wC3/3YFvzI+eRIZJv0RlHt+TvyUHp9hX6P5N4HH1VvUHIZ1THhipisAGerMH8/ib70MizZs
	0QkCcIvxKseBpmpjXc68Yki/wHwPHKtrRIKuPaVIjprUghI=
X-Received: by 2002:a05:620a:880a:b0:93c:b5fd:f33f with SMTP id af79cd13be357-94999722106mr491978585a.27.1795013257845;
        Wed, 18 Nov 2026 06:47:37 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b81d4a0sm193898585a.43.2026.11.18.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:47:37 -0800 (PST)
Date: Wed, 18 Nov 2026 14:47:34 +0000
From: Josef Bacik <josef@toxicpanda.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@amacapital.net>, Ben Segall <bsegall@google.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, John Johansen <john.johansen@canonical.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, 
	Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, Paul Moore <paul@paul-moore.com>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Peter Zijlstra <peterz@infradead.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Serge Hallyn <sergeh@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Suren Baghdasaryan <surenb@google.com>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Zygmunt Krynicki <zygmunt.krynicki@canonical.com>, alex@amutable.com
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
Message-ID: <wdwc3b5edgtgvrgqfhlzhrachr5hrqb7ahipcuqdz5pffxlc5b@662cpwhxwjer>
References: <20261117231352.3816603-1-jarkko@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117231352.3816603-1-jarkko@kernel.org>

On Wed, Nov 18, 2026 at 01:13:39AM +0200, Jarkko Sakkinen wrote:
> OVERVIEW
> ========
> 
> A root namespace (rootns) is a kernel object backed by a file descriptor
> that binds together:
> 
> 1. A full or partial set of detached namespaces.
> 2. A dedicated PID namespace for spawning processes into, signaling
>    members, and polling or waiting on PID 1 exit.
> 3. An initially empty mount namespace (CLONE_EMPTY_MNTNS) that must be
>    populated before going live, without inheriting host mount-tree
>    ancestors.

This is what cells is doing https://lwn.net/Articles/1102593/, you may
want to take a look at that work. Christian, Lennart, Alex, myself
and others are working towards this in a more wholistic way. There's a
lot more that goes into this outside of just the object itself. I've got
my version deployed inside Anthropic for securing containers and I've
tripped over a lot of pre-work that needs to come because we can tackle
this. Alex has my rough outline for kuid64 for example, which is
necessary for making sure we don't overlap UID's on the system and
create holes this way. The cells work/anything that wants to have clear
security boundaries is going to require that as a pre-requisite. If
you'd like I can include you in our planning so we can get something
that will solve all of our problems. Thanks,

Josef
