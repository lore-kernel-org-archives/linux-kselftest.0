Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA601A6813
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783383476; cv=none; b=JkcPxR30MecG0LunG0MTfe+d1T7myx4Tsa1ZeNbPNUkUVYtVZ5/3PbXxY361GxEaFhJQPbwqtpjKpsKXgG6tyQTn9gdbcOV3DAOzX8W49LSLIXXJgt1LyRuAm+1fcC+bAKcHXJEKfaygrH9j52rhv2Y0yZUmJ1K6ToOw2Mi1H3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783383476; c=relaxed/simple;
	bh=af72MIiNPASyMrPenWUlckSQNn+OURdtih1H9LpKlI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LuqzwfvADIkm0I6+QlD4vj6g+jHBkzAs0cRtZTfi6Fm/EysjYD9GnKwBH+SmOsF4HFmJMtIJ5ykySKniB3TiO8xthhkkGtOnAOX8WJoVb9BjgMKe4BmEKh2+rqrvnfRwSwBgqv4SqovjbPYjwvsV49QVRg3QZBmLnK3ZH4Qr4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2UChFPG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2UChFPG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso1676026a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 17:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783383474; x=1783988274; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NlYk0sNL0UkMJvtmh539AMWShHtruvV8sV0IdItG1l0=;
        b=P2UChFPGk+gSselBw1l9QAitcDVL1UVr1rYuMfJAJp/H02DWIazkdCjUUQTqDHR+wE
         gsPUm8oUz0Zdppyc1D7a6HBcy/zWtuvdA4up6FOx7SN3MJD5HSFAoBCvO9DumA5mg0Lw
         a42EdP/KKa3XN/SOvd+wF5IuQrDFnPPrZJOouz0o952YAmIypE1+6eyCRtyWTv7I0n+R
         u8tKEWp751lwecHjOhLXsn2Q/pxCtAVVWWyCaIYGu8wO3+zG4YOwwSiEhFgeKp4XFoo+
         A8LwOVhCR0g0Os0yfMwZVSfh4fhRqxbQa51HnhL2FnR8wYxvWBW/MSwOnOfutcQjzdK+
         f0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783383474; x=1783988274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlYk0sNL0UkMJvtmh539AMWShHtruvV8sV0IdItG1l0=;
        b=MWUJaU7jWa8IUYzz8tQDNYvpOFAa6YxCuwGaqi4u1m4diFhtpHjr0tlnxOz86fQ5++
         o+0hCsXW5nkzXuhRn1tP/ji1I5XhfVRAlbvBJWdmeXFTvU24DCxvsnuUCKzkcWXfW2Bz
         zBepty24MJcIt3L2Ji9GfvVaRu3sPH2t2tp/YxHTyETBnbLY6HvqnQmP+SIg12axfhUU
         7T02A2/nhIiHusRl+dkUzfZgW79mL5Ta1p4QN/Qpw8l2q3TLEuxDqkOurQzgC6OBzkAZ
         cbh2rDxJHum8YoCAVpnKx9TgcnA3PLXNL01OfA0NvCDHQp02KuzqNsojwZXmNCOzwAal
         JnXw==
X-Forwarded-Encrypted: i=1; AHgh+RqyQ25WdQhLVZblhE7Hjwf7KrkybBstcnZS0rDn8IFGmIAz512m3PL/ixAbsHzMwSLRwmv1YgIFFDJ999D6diY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLa55lXuBsFqNNyIVy8pF5mj/7Mlx2bmrhnzNlNKFHLefGIRqN
	rnjwdKQpMKsaW7quU73tmp3pr4eya1Xrf0/xzB28vq5eB0YIE2fzA/vt3nUk+zCP
X-Gm-Gg: AfdE7ckaAz5QG/aYYOEmoEBydCgKEe72N6kx75YKeH5BnqgLgjb0H/LLd1lwIxjqPAo
	Y7Qd/608VFpycURnl2G9J/gYXvMnv2DgxW/4rZVEFgze/Bck+wYEq6T8DHK1hNz72y6cBdXVtha
	lzbiX1eSXwSy0ecn6/x2vQh23Ot5Rpuw9GjDRg4drULwbqddkEYW32YEoI+T1jsmQPNqTu9X/t8
	pbSqAoq/57o3dOPMrGfE54PqUnXLNIRiwDv6fV7OGUndMyVH3HwJo+CAbW7WtVu8kREe4mowTz+
	2PehBaNRg6TbWdaJNqJ/8gK9LpWP+haEiBUr6A2uuxjiiuqV9K/7Jo6dpNIA91evCE80u+EeXvJ
	XKqJJGjxKwry/5dv3IPZsuM3FD6EpEj45J+Vese9amBpWrX2OZ5jivDtwMBG6mL8C0MyBxyzdf/
	oyMF5+amHbn7ODYAohw1/ruudVODtjrd9j1egPEhr0u5YQicfDrX93dhsNi2JpCD/jW32iFg==
X-Received: by 2002:a17:90b:1845:b0:37f:9cdf:f0ad with SMTP id 98e67ed59e1d1-38757d76999mr2730666a91.28.1783383474243;
        Mon, 06 Jul 2026 17:17:54 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:275a:65bb:602c:da1d? ([2620:10d:c090:500::1:7696])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a89a89sm1783645eec.20.2026.07.06.17.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:17:53 -0700 (PDT)
Message-ID: <bc12730fe6eccde10d36e6544607ae2464357e05.camel@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: compare BPF and memory.stat memcg
 stat readers
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ziyang Men <ziyang.meme@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>,
 bpf@vger.kernel.org, shakeel.butt@linux.dev
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>,  Shuah Khan <shuah@kernel.org>, Roman
 Gushchin <roman.gushchin@linux.dev>, kernel-team@meta.com, 
	linux-mm@kvack.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org, Shakeel
 Butt <shakeel.butt@linux.dev>
Date: Mon, 06 Jul 2026 17:17:50 -0700
In-Reply-To: <20260704045617.487664-1-ziyang.meme@gmail.com>
References: <20260704045617.487664-1-ziyang.meme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-07-03 at 21:56 -0700, Ziyang Men wrote:

[...]

Hi Ziyang,

I'm a bit hesitant adding 2.5K lines of code to the BPF selftests,
as this code would need to be (a) maintained, (b) run at each CI invocation=
.
Hence, the tests added need to be relevant for the BPF sub-system.

Regarding the benchmarking part, as you state yourself:

  > In my testing (a 60-CPU VM) the BPF path is roughly an order of magnitu=
de
  > faster than the per-cgroup memory.stat parse for a whole-tree scan, mai=
nly
  > because it avoids the per-cgroup open/read and string parsing.

With this, I think the benchmarking code can be dropped altogether.

Next, the three memcg_stat_{reader,churn,churn_percpu}.c files share a
lot of utility code almost verbatim (e.g. tree definition/construction).
Such duplication should be avoided.

Finally, from the BPF point of view the test exercises the following functi=
onality:
- kfuncs:
  - bpf_mem_cgroup_page_state
  - bpf_mem_cgroup_vm_events
  - bpf_put_mem_cgroup
  - bpf_get_mem_cgroup
- main iterator logic.

All kfuncs but bpf_get_mem_cgroup() are thin wrappers around mm/memcontrol.=
c code,
all kfuncs including the bpf_get_mem_cgroup() are already exercised in the =
selftests.
The iterator logic itself is covered by 8 sub-tests in the prog_tests/cgrou=
p_iter.c.
Hence two questions:
- What do these new tests add in terms of tests coverage?
- Why do BPF selftests need to exercise the churn and churn_percpu scenario=
s?

Shakeel, could you please comment as well?

Thanks,
Eduard.

[...]
