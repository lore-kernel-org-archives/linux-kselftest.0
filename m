Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D3394792
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250372; cv=none; b=t8SnvkKebpHNMyQq+T4jj38Mo4e7d726vwgCNNr7AOX71KKnhJWK0U2kd4bbSZfFIOP5LgwXdt+4bQwAlLNu+VpN9Oh2FKnMyLKX6ygUhp4UlSWVdJ/LOb3Hh6D1lQ+YzAkG3XOaqYsRltuOkEtc/4q7Xed5KxvbO8CHzp6BKeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250372; c=relaxed/simple;
	bh=nnAozmGFGvra2/iHSnITRelsom7JJlpRVcniFLhBxb8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bXLbp1ZFW/rDwe62w9YfKMwSeaSA7Y1A2aqEqjYvQ1fx7ErCoEnLrHXHzeK6VyLrDxtsEzVkB0nhvW2KSNqN8AuSiv+Tln6WFJDtq808rTwjGLrEQucWPqq5RQ80hyPUtsb3IOchut6lNdnqf1qTw9WQgCHrjZU8hhTXvlyl4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FskHZCyo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FskHZCyo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso2246365ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250370; x=1787855170; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bBdyTAiG5JcLvXihuDX4B1484e1I/74jJ2owtdoOkdU=;
        b=FskHZCyoimRhmYfmcx9en4QwnfGw+V7UqcDZa4abfTikJEKrK4NnLDeQMUXb859qwb
         bZGcQGWrOHUUMCDghk05ViZoWUekvTMfcdxkE0jTO5XIpEaKcTvg6DstTYEu1jTIB1bE
         UBWS6EeITrx2QZ9yR77w10A+4Q69ptgNRn1ZuJMsacUlgrYrnDF5DOuV4QPeVk6v9sG8
         sPtDhWLYOkq/NEUWBRk1hlVb53jkptuE+/xMh3yh5NC/l0XcDn8FB75/G7h/FQWG4kPL
         ZE7LXww+GFS0OuzCWMthe2OC/KdPT61YF3Ks75TSSKU7jnRUbCs2YocwaJY19V+lz2M0
         dZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250370; x=1787855170;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBdyTAiG5JcLvXihuDX4B1484e1I/74jJ2owtdoOkdU=;
        b=OS5NQlillWQfnjw4qgyqUkfo9TooGbd6RrgZ++bZt8Ho0hfWvS2PYErLNdZga5Tnl7
         KkhTa3x0V0WhVBrenIYx0Sfdgg7nLberuMZf4hh9fzZ4eu+2Ys5TBzq3njqZJM5gC7iI
         zpXH5ENF/bqVjVf1+TCdQQ8kpjdWXCzFoFtsk+dLKth/wLXA7ADG3z5nG4XRMZIDiBRi
         Bh214z4w1bAXK6frkvbXeWyYeCCZR91AKnC2EX7CbQrI0WZaDvcWyWbvVYhD12kj88Iz
         vQWA4gOv+hYfVb1twyEHaDR1SiEZ9JEtYYuNRctgRSjZFSxc/sF6J340/8sAs9OQi43d
         D5sg==
X-Forwarded-Encrypted: i=1; AHgh+Rrr2/dtZX2xmhulLvsKnaht/1QEK1+yYr0yfsxuFDumeAg3AZRAqtPDdyIiBsjdbjzkuuczOxWWXHZD8D41JPw=@vger.kernel.org
X-Gm-Message-State: AFuF++kD3LUANdJBt9zayZpdZxPhc674bO5pmyzK+KnZ+pqKU/LczocF
	lxeyWUq+KiF+4jp/WwfoT5qtG21BBHxnXwmRCbajCuLW2IbJVS0FPw/q
X-Gm-Gg: AR+sD13dCQ15dNLSUVsVcQqBK4QrabhdtnA66nomXoIOutHqyOLkSXRf8jflb6FyGgA
	9qsHA2xT/PudqLJ2SBX0WTVM83xfDQvNQopedoIWNcuSs/l6N45CM6tt6hGbnbVJdJzerNx6QdA
	0fNoQ3CQA/WViTLUFkLdRnOHsDTGmrC9UVw1iKuzJ2gU/pZgCYnkdWxiKlm7F3BtjdEbJcx8G2B
	6XLnWabuJJkQpzMTqQK4+2Q6n+mZU7iVH5qqvVLmE2TJelqfzzTJ96BycJtp/2NZ01TjY5gDjzJ
	AXLWXboiTa/Wr1fhFKtX4WCVphZebtBEole2goF86FlHvk/J92LHfZuJlMCvQk9ZBh7zSo6P/IU
	dJZ92eH3ex9ZPIO/OZAaLf8SBv0FKTdeUc7KTd2rO3HpOdpEVl5594VnC1Q+BejrE4RPRnwwEE0
	8u+OOxOnEeVmYGJ1f2Mx2PmGBFinUDJx08C80FQFo80KjeAQCmME8QLLt3VHDS0CmcCZvbvxfTT
	sNNmX1LoMZQWtdlP8HtpuAWx/wqtnM0RyH/jAI5EbH+Cg==
X-Received: by 2002:a17:903:2bcb:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2d64adaa1a2mr12318115ad.3.1787250370136;
        Thu, 20 Aug 2026 11:26:10 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:89bc:48d2:9457:6223? ([2620:10d:c090:500::6:c5ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf1970b0sm19018150eec.29.2026.08.20.11.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:26:09 -0700 (PDT)
Message-ID: <502518ed7ac143e2d9e4f588ab33c5c7c1566b84.camel@gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Add reg-invariants test for
 speculative pointer arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa	 <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai	
 <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, Paul Chaignon	
 <paul.chaignon@gmail.com>, Amery Hung <ameryhung@gmail.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, Daniel Wade <danjwade95@gmail.com>, KaFai Wan	
 <kafai.wan@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Date: Thu, 20 Aug 2026 11:26:07 -0700
In-Reply-To: <20260819125840.286434-2-jiayuan.chen@linux.dev>
References: <20260819125840.286434-1-jiayuan.chen@linux.dev>
	 <20260819125840.286434-2-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-08-19 at 20:58 +0800, Jiayuan Chen wrote:
> An unprivileged socket filter does variable pointer arithmetic on a
> PTR_TO_MAP_VALUE whose offset collapses to a constant. The Spectre-v1
> speculative path used to snapshot the pointer with a const offset and an
> unbounded r32, which tripped reg_bounds_sanity_check() on the following
> register move.
>=20
> Mark the test __success_unpriv (the speculative path only runs
> unprivileged) and flag it BPF_F_TEST_REG_INVARIANTS so the invariant
> violation becomes a hard load failure. The unprivileged run fails without
> the verifier fix and passes with it:
>=20
>   verifier_bounds/spec_ptr_alu_const_offset @unpriv:FAIL   # without fix
>   verifier_bounds/spec_ptr_alu_const_offset @unpriv:OK     # with fix
>=20
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

...
