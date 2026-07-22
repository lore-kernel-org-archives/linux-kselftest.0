Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A44D2EC4
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720311; cv=none; b=gKhPkmVrS+d7nGdjJWn6rpPVcbYDCbad57Ow9dacRfghAqOFd2zwRYEA16eokH9OwIK88V+ZNaEsYGdcNPTny2mw2rK6nxEGxjGAyVfby0ILHthvDcBc8i0V02e0wef5B+CTQVsbDTvQv8AvXU1f6V4f/Sq0AbFO4fjFRUk1AsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720311; c=relaxed/simple;
	bh=4SUTil00fqpgPAucthU6HTl2XlqWFfYKnVVCbAIsH5c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEiCCSymL+r5owU5gb/nSNZ3mJAEBAo5G5MrrGOzXBzgS93sfPw97i+d2L26bX/oVcMgMDvQa1rS1I2vpnw1ed+vkkKeL3balzfwIGN777qlLkdpIbyhMaoBt13F3au+Ug+0EBxYTPDhhkdFH6NN+a3D1jA63gzSMnNP1YxjE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJeV4egu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJeV4egu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceae1ed204so104255085ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784720307; x=1785325107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lz8wSJ72VvS/5HxQLoKKzBsvogEF0aAdv/0SLjzmBu8=;
        b=tJeV4eguW8FAaVkaKySpnAOrvCIjeRyybgvPdJmZscFO/Yk097+TE1rGHmf1gRu8v3
         V6CetvUQmLlRegbznt3g3WqraoaKpx9yVbf9r98EBx++RA0X0mWsxhjhDToVnho+PcaN
         rPw91ci6f7Kwm1V5VZQO13FPSAxEH6etsR5vVQ1KiWYhflb9AHWqOgztS5I2+ZQtBsBo
         mQ0v/6b/UsldAr4h7dAVW6HNIz1dhpxno8KJqXJz9DahTdReSA0WQWtZtl76d0o8p72h
         Y+NA8NeElGpRIF9aX+YbpvL8VaC/wZ5Rv7Fhc/zdK5YfyfEN717ObgOipH6bxY9YgI9v
         u6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784720307; x=1785325107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lz8wSJ72VvS/5HxQLoKKzBsvogEF0aAdv/0SLjzmBu8=;
        b=ouoNyWj0rciTxMDxEb+XTr+h2mqT3R4ceOhGVF3L9bDgnvbdvt8lXFyTxFUa5hxo4c
         BmruU7PCaVzeb6rjrFgV7BPRu8sA/SkWfrlQ+S9uD36LIgSOkIHx2VJ0Cy8AcpUEX4pd
         eakW7xjtq5sab7I4pG5sapy5PD4Ot0g8Tqu6J8XWOvHFwsLARDeNcErCLIQkJyWZ9JgP
         WP1LLsVZH/AvzrK4nE39beZhAU9hD39BiObhh4RbYLpyi5yZj+krjTs2rk3EOvMMVwwm
         EOctvVkvPkzLDDANY71U4mXppD9JomtBOmB/c2S+A86M5La4lHH7H2tOPjGgTYYNVbWc
         mgRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5C0ecSwdBnnPFt9DlBfjBre780cSqqUOX4g9GR+plIxm1r9p6riB+43er5+TXC3YpAZrPurNqBHJtOpK0E5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYg8y0IYbur4EXC3jR2HGOrl0IFH6OuENjCEM7U0J0TWwyxc8r
	VtO1oYz1d/tQxprZyXX5W8QYiT5ulGDx5zXuWEyA3r/sCZY5zT4ksZSF
X-Gm-Gg: AR+sD10+ksVJLtH0g3k1Y0jflfMdcK+mGVIBBZWUyomKfxipX47L59pM+7qifm5aBZe
	JONhNzOYSKQ32BzS4nN+lCa4GV7y31Cp1O/5GGMh7GMMrnBpi+enJyypdEs8W7yLp2QslFqb14p
	hqRl0Uzxt3nFBrdxzyYxZlvSdKuL6Dd3eWzdEyTccJogPw/Wizc60v0UTAib46pUaxZPa6D0YJi
	C8PGEPyD3qVuXjgWJHjOAPkjHtkiizOhkqjZ1VdoJ1l23tr0LsPfZZtyP+6sLBy/gmpnp4U2bBF
	R1aylJS0XRe+wkQ28PPH0tmnc3uXY/tMtMsycK/4939WQZKJ3iVkM0b8EWaXj2PzXX3L5U87El2
	iQ6Qml1iR5/1osde8rC3bh/IOgR3ehYVaFzP1agYeoJW3y92/kD6JFYeq05vyNWf8o5ycvkmOay
	/iqD0zJSh/kx9POMARwnvnM8HGJvMP7qvUWCZel+UKknX6vIVB1upzVxOpx2s/qf48hlB0qEV8s
	+Kf575ztdo=
X-Received: by 2002:a17:903:1b2e:b0:2ca:281:27f9 with SMTP id d9443c01a7336-2cf349978f5mr237336055ad.27.1784720307137;
        Wed, 22 Jul 2026 04:38:27 -0700 (PDT)
Received: from kali ([115.131.60.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31383bsm13110205ad.59.2026.07.22.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:38:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 21:08:09 +0930
From: Daniel Wade <danjwade95@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next v3 0/3] bpf: Preserve pointer state for commuted arithmetic
Message-ID: <20260722210809.382642@kali>
In-Reply-To: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Eduard, Yiyang,

Thanks for the pointer. I independently tested Yiyang's v3 series on the
source-matched f105f3631d51 base with the same kernel config used for my
original report.

Before the series, my impact witness reached chosen-address kernel
read/write and changed UID/GID 65534 with CAP_BPF and CAP_PERFMON to
UID/GID 0 in 3/3 runs. With all three v3 patches applied, the intended
untrusted-pointer positive control still passed, while the impact program
was rejected at "R0 pointer += pointer prohibited" before any address leak
or privilege transition in 3/3 runs.

I also ran the three focused cases added by the v3 series. All passed:

  mem_rdonly_untrusted/ldx_is_ok_commuted_addr
  dynptr/dynptr_slice_commuted_invalidate
  verifier_basic_stack/stack pointer arithmetic preserves frame number

Given that the affected code has shipped and the issue reaches kernel
read/write from a CAP_BPF and CAP_PERFMON context, should this be routed
through bpf and marked for stable rather than bpf-next?

For the v3 series:

Tested-by: Daniel Wade <danjwade95@gmail.com>

Regards,
Daniel

