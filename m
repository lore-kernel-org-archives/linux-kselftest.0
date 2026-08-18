Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6934430E0FE
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 23:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787094123; cv=none; b=NNFRT5LS9HwHpF4TuL556/Ns/DMgiQZzudvRU4CUFl6u+9EPDbeHM63XEMLpGviqwpxxISQ0FVAeS09vGW2hB8ZL6Zy6MmaOMnAJmVv4a9On7qm+KcGR1VRCSQ1k+DQv1qk9JP55w8agQ6wcGBJR5f8HD0D2usT1sGbxT7bMz9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787094123; c=relaxed/simple;
	bh=LFNPoDeeTwavqXDYvxKz/k1t7gN3cxa/PZ/r6DBfaz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUelhcvjxTENF8jN2IGwia4u0iJpockLfpzV1sKCyk662jUbdK9JSu5Yg8N6iiAbTgja9LZMSRFyr9Vnokk0vdIskt5JkEHzbSWgv9pvjLe5ExpQAGzQte0d28sx4zjRYMK4w2RvJKk1w8fb7XrDmfOuW97sPjVJ3XH31C1z8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/xOsERq; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/xOsERq"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccf2360620so2777005ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787094122; x=1787698922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jjfWQTULW6kpWj4uQcqe65fiA3Rop9X8RDu4HH8k3wc=;
        b=B/xOsERqIgCHWDOaMzy5GePw25OdJ9GeVqYJEzDQPsIyPRuRHWsfBJ7iAwZE4fZGC/
         l3fsT0PvL4SjsE49AnYsX1JiOi5gMeLe+nEvZK0AKBn+gx1GEp+8VJq2pHAGJjVqBS2n
         g/pasXB8FcgNvFReysZ8YVJQ91XHEnZEL9mnrSttJnjRKA9Kp5XDI+e6mYtqYk3/Wck0
         0Zr6QDaU9O20NrnyZCccqQYHXVpQePtC9oAum1JpSCQCiwFUBTFV4TsznhIz0wLeQ2lb
         jXRBR1ntij6h0j4ZYa8UtmMX/Oeq5dRwpSZTEHh1NOusZmHE/L/1SH66/yKgK8PMFVNG
         vUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787094122; x=1787698922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjfWQTULW6kpWj4uQcqe65fiA3Rop9X8RDu4HH8k3wc=;
        b=N0aEmlIqQXZGjBjgoMqDaO3dlTZ/i1KrZbA4/cUtnSuZSXVSPLes78RDZQvB9XXk/Z
         lF+I6YWAsm6xA1+1uE/8j5YvBGWaScHU8rogp0pa/vOnLCSpwbz12uX77/NaANAEGiNR
         dRT9QeyQKSWKWXyoA/2Gfict14IwLStuccI6K7wrxpP32r1Fcwnp4ilfPNjTMhX2KGxF
         FSdaX5Wd9ezDkZyKNLHNTl0AYKYZKSZv5QzSpBgvs4+PC9ocOwq5E6kH/96bzDXtCC5P
         Yp8WngNWEHp2NCjqOqjcEiusKAmrPVP79HDN7+neQ5hjZHidLOV6dCupEjlTeb7JmyLH
         knSg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/y85AGVEKIbvYXBRsfBdsDwy/XENjRuK6ogHRKaA1sT9gYWbdR3iXvic5WHMdkAa+OiU0xMY/IO2FTOOacXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfH7ob9UdKxkFdUSiHeAvXlO8/m60EXFllD99W/+iMOAt5T8Fk
	9JUmsZ102D+dzMjatF++/2u4fVTPhpubLUptQzBaJW9ZJqNyvxXRhTay
X-Gm-Gg: AR+sD13bPWepGVJTxl3XXw3olb5tu/yOpvIxBKiCodcaUe2Rb9mZck3y4MtRCOF0VOp
	I7MCnJ6qmRR8/wDAYxUKNANNcMR1L1mzgmQhb2ioBHkc9XFVtOivsF3Rc626PDpEKMBRAn7XuUS
	4BFllVWx1BIO8tsQI3j+nRlwcKCv65mRKpJpZ3fgaUsrcRDykRTTgUb2+BOVmY6MtBz5JMuTpnN
	sv9BX0Y4Qa/hxj79NLxfroKCs2T5JzfIRahiENx2HLULyhRcJ2I5FCxR/yB/fDquYF40z+K9PM3
	aVwapXLdA+Ii1n0zR5lO6myiyzylKUCbZNmTvtpuHiNW+6gw/h7UPwSXj8d2FmsTRwlKPFkRlem
	5ub9kWNAZBGhq6oRIvjOBYAjq3Mo/hIhpZMaxvdi/neAy7YKkfWUNE8s7UYPALZlQU5rbw0LcId
	4KwSngLlLQGIszLsXRZDPLvaqonh4gzwVrm93JiJf9/stnDrpvkrn6hLdJkPTIXCgUhsSXjknl1
	7HIvwMP
X-Received: by 2002:a17:902:f682:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d5fd41d626mr5840475ad.0.1787094121673;
        Tue, 18 Aug 2026 16:02:01 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb51sm456874eec.6.2026.08.18.16.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:02:01 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:01:58 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: kernel-team@meta.com, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>, linux-block@vger.kernel.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] block: add BPF kfuncs to read blkcg io.stat
Message-ID: <aoTkZhQDoaQKpPe3@devvm16600.scu0.facebook.com>
References: <20260817214205.723267-1-ziyang.meme@gmail.com>
 <20260817214205.723267-2-ziyang.meme@gmail.com>
 <aoSUob1s8WBQ3buO@slm.duckdns.org>
 <aoTdQeLZZuRirNHE@devvm16600.scu0.facebook.com>
 <aoTf7u20mo9s6ADj@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoTf7u20mo9s6ADj@slm.duckdns.org>

Hi Tejun,

On Tue, Aug 18, 2026 at 12:42:54PM -1000, Tejun Heo wrote:
>On Tue, Aug 18, 2026 at 03:31:29PM -0700, Ziyang Men wrote:
>> Ok I will add the casts bpf_get_blkcg() and bpf_put_blkcg(), and remove the
>> check of css->ss in above functoins.
>
>RCU_PROTECTED is probably better than get/put().

Yes we can make the blkcg* RCU_PROTECTED but then the bpf_blkcg_flush_stats()
needs to take the @cgroup* since it is SLEEPABLE. Does this work for you?

Best,
Ziyang

>
>Thanks.
>
>-- 
>tejun
