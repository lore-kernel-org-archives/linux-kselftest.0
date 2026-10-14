Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB76492E5A
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014234; cv=none; b=NGe9IdLmUXbW0/rJMNNJFOwWieXrTEQTRBcXRGuQ8+pMDsDGZWY9qghU3cXOK6hliYAZ59tmHjX8uNDQKmFLgMl0iQ8a+Z/PEuiAKa7IC5lMypb4Lb9WwbnLT80yIGLYEvehtJDc9Tezry8QTbg+gICTCX7l5kw7dRC1VrfR7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014234; c=relaxed/simple;
	bh=EtI4ggX6siZdDxX9QVbhUXdUUm5AbMI5AMTmaI9v0aE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUDL8aqcdqkQaLook0q/vkFrmY28WgPvVBNoY4vURhHceX4ewX6h5lJZ4AO/zjXnjJCpdq8m6bCmeTKOfRlJIrEB+FiizFbaTnrrKze7umYDB0IxHiAN8zlCJUiUP6btvd+iyntia2SKLEBWy1jHRmtoIxYrqCcMzzDll+IXPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcOmMhs5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcOmMhs5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c5358fc28so762418f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014231; x=1792619031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8tvaxXme3A+GDB6mr5zX35hOYWPVi2nagWE6JeKbsfg=;
        b=GcOmMhs5w4i7JvGV6NVgmD99o62uNFPFKbnY3cxij55UKVRb3igVj9Z0wpJpDUQya8
         csg8cJRJ9zGgHChl+8ssUEa6AiVVOTQRkeIyiOl2iXel95aApeq9BCWKtIUtnX1ywGSy
         5FS3Sx2prEye6NwGo32GBgO4ZL2H3ApJOdXz1g4RlcV3tuPbfoSuZX90XhZnliJYBsF9
         cRStg173NunbpLtSm1KsIkDvbNaRrTpLcrwZNVrIn+SrAq50CP9Y9bLOtpyTlI/0FY/5
         qI0ltlP91IT0rP/65aVLV3z6dxlDz3H9EmFrC7FsDmqwwiBqIWtXdywq4SEyfd8zSN2l
         MSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014231; x=1792619031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tvaxXme3A+GDB6mr5zX35hOYWPVi2nagWE6JeKbsfg=;
        b=ZFVOTWizT7elPkuzSTmgxPP9LKDtj6EOC9tom0eeHPVsZ/dKrbmQy2Z2fyDB9heuIl
         i/ILQma/opeOX23ikOPWHTAGXzA73Qw4P1zPQlAVUhC94Psn7pDlIpFoJ0ZYbAULQ1dY
         goLnsoll3k4dfDtFbVQy5AAg5gvWvJ60CHdQI9VTdY3BkBZ59f9RThdRo28exShgTiq/
         9sjHS9Um+FuKPgnpDdOKxbKJk5kTo3a6oy/ixUP7fIPYV6FWFOeI+Dfxmbia3JDk7KBh
         zlGMn8ertD0fHMqip4dZXWDK2CbSNo2twW5qMHqfEe8kPn6ZxxKGkqO/145Tv6Zuh+K0
         ShLA==
X-Forwarded-Encrypted: i=1; AKwUvBzE2DtBld6SDpb+XcUjPrEzjNfHD1bDzd9X/nhmozZI0M9eTDpX5aFYQBxzQDTjaJ2Utz1oMEMnyV3aWybyKl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlNRizXq0iYuFoYXjGtXw0tk0EX3lE+xcTsm8eItMseMkHjv4n
	gWTAcfg3Kd3Z/1OMn4GmMPHWikEpBB8m+Ht9v1O/WDTOUwbvLc+Dcgxx
X-Gm-Gg: AYBFou234czL768MO4UYHURUAEJYsoYSRig8uuwQpb5uKl0AO9IRKG2VEFzSQMqMez4
	QgWGyKQwKCee4khouzlJG23rz9PA6yCdIv4Z3ftuIx6rBt0zZkEekUyFLpwqsc0AR0vVfvtD6YR
	byy4wsz6pi8NOWCSLxUUooifSzmYck7d3FI7+Kukupl8JQ97IXZrlRtWKmcYcphbtvWjSQAXL3G
	WWhUW/M2nN78DdowQMhtlfiWfxp3wa1f27aizy3heJxzkn2tD1OUH5KMHzDQXcZXyKrRjazbEMa
	xqH+dlLQXi12XyboYJSsPB/GCW2pqTaXj8liM39QK/HuiiNlrnObv7/GcG7i3xcEht//RRFeHkl
	qbVg1uZR3tKlARppR99t8BaJMI0eUslJGu0ECNN3W1fZRvodnjyWjrUnH/QpKDmfXmcn23aPg0q
	/m7AZt3hnb13j2bSXGvczds+3gKa3qT6U+h7t9uI18CvLqsm616HN7s2cYKA==
X-Received: by 2002:a05:6000:2686:b0:48d:f3f8:f910 with SMTP id ffacd0b85a97d-48df3f8f995mr500636f8f.34.1792014231493;
        Wed, 14 Oct 2026 14:43:51 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df2619703sm1681492f8f.24.2026.10.14.14.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:43:51 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:43:48 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 14/21] bpf: Add tracing_multi link info
 support for bpf progs
Message-ID: <as_3lHuqBSVQMiB5@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-15-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-15-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:16PM +0800, Leon Hwang wrote:
> Show bpf prog info in the link info.
> 
> $ bpftool link
> 9: tracing_multi  prog 25
> 	attach_type trace_fsession_multi  btf_obj_id 1  count 2
> 	prog_id          func_btf_id      addr             cookie           func [module]
> 	21               4                ffffffffc080064c 16706819         target_1 [bpf]
> 	22               5                ffffffffc08006d4 16706819         target_2 [bpf]
> 	pids test_progs(98)
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/uapi/linux/bpf.h       |  7 +++-
>  kernel/trace/bpf_trace.c       | 26 ++++++++++----
>  tools/bpf/bpftool/link.c       | 63 +++++++++++++++++++++++++++-------

I think you should split the bpftool change into separate patch

jirka
