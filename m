Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CD03AE6E9
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497891; cv=none; b=lZJRSRvtf+9gG27bgLJk5ST4Eif7e5D8z4R6CTruLpRybVr5XcbaNo0As0gurxMPeM04bwWH+qalDp0+2EbuzZI64QMaSwOYKjSM6e5R50uhKTWHV2Re1dD+Y4IiFJTeSsLxVZbBMMpWQwYKueFW0NelNNjaS43DQy0OIakUmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497891; c=relaxed/simple;
	bh=lhKSffhkWzsZ0/8rfDC7YE2ivqQOUh/Jm8bDdf9qJW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtTExfs8pvG3RfAvlIkAxnfCsqYINYORUldJ8ESI+J7OOm0/Yo0mlQLEvMDoyZV9l+3c6cCrTmn/HoxiSB+2IJspp6bKGnDBrgtzE36EuSB2UOZjrHEWRK5ZWH+DJdj/VE+nfVHJtr7Tx25OMMtUkv1sqaUOuroOmAsdmf+zO5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tESaesU1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tESaesU1"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so240973a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 01:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783497885; x=1784102685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhKSffhkWzsZ0/8rfDC7YE2ivqQOUh/Jm8bDdf9qJW4=;
        b=tESaesU1raCpuNWf2JvAnEeXLHI8sUQcmt9PGuNv5NbzcwZYHvL6troiP83gF6gWI8
         NYcUj2N80mkAuGimeoTMcot4YlSmdqA/N3BFU9ofrgtB/fhL7J/uDmglEPxZhRzdWuYL
         dD9p/b+0lfeCjxAPW1AT5JEkQH1vz6xiKjxv7q+OuszVamrdoxraPLmEpV/MB+MAMK2g
         nilJV/I+veph0rnnV92UMTinF73W1/iObmDdTSH1dZJWQwUhjf+/9CssPM5pDC91+lNT
         XUhvu42LseRDdw8rw7xhxoTK9w4S7MNCPbmRPMt817MXLVUXDc0DfnkqsfeUnytQAq5k
         BMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497885; x=1784102685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhKSffhkWzsZ0/8rfDC7YE2ivqQOUh/Jm8bDdf9qJW4=;
        b=Wc13Kdv3iLDvK88BUzDbistgi7h8mYNFqcVtkcKNvTm6ogOnkDMkMWMLH+F1Q/tozC
         x9+BAw2ww82iSTn//SEqQKIwT18Q90FG5qLVDCgOLYJPjkpzsQ5iTeeVb1pDp4kkeKjm
         s+bAfqDPWTJ0kr3dGcdvphwSMsxIeHgvYSKGlWsHuVt+MwYzJJ9LND1C+QKuKkSWLDDd
         LFhv1bZpv4ldDaGAWkpQPaerS9n7vIx5LKqbvWpoNxw0Q0iFuB+PsHgCRiUdWFM0dF2U
         DEQqZ3a0BaiAMXBycFMzNHW8RtloPU3vP/iwLuxRXSgz4EMItKhQzYXS7JCwebfjKwli
         lAwg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx0fTFlIV1fxDSuv8HQsTZ9QL8dYvtl4HXFe+E81pilyX7DMEQ7lnLKb+WwYRgrX4mdEmGAzUCRzJ4/2ApeA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbta/ItYakvu+kTkPKU38k+wTjc2E4EcMNL/fNVhbBtsD2ANS
	RN7Q26OqBhjpvx+CqflScd3QZUNqgVpnkPSzUI9DGoCpIAkev7jpVKZA
X-Gm-Gg: AfdE7cmUHH+GBt6yjnFiXEZADE4/mz3DWFK5cl5IKFzGea9Hc1y/a4MaSmwl8ZQ2Q2P
	g4Qey48QoPQ71hk6vpuLG6EQ0sBPst1zav3wNo4NR2cXaciFFt3gr+bPMMu8HVndWMqVqc3czq4
	qKYQtBevlq3h0t+kxx696RkWpR6zCWS4XrwhkhfFF/fNw6CEH6fidP19p6RH6Fg9hnlQuz8lw+K
	8FITlbOA5d6h6uRfyotJG4ocJE7Opb5pBOKH/6o2mbOiB27yTAQVwH/z8ztTLqTeiWMAdJOghzH
	VrFm+Ju3F0u+eAQGZ8tn1wx7gOml85ZUxw1o8L+ax8uyxdjDgYOJ4xLH7VDyqMpQvWR6XUQE/nh
	GgrKjd24WF4FeQuPiJE9wkkWOpFbrsRxZEaiKuLdAt+HzRe/81TzYbfzWdbmLIbENbVm+kXQsVk
	owev1gVDcfxcPuF2VVsu9s2fGweWwPMO5NjhHX3r/DB9GH7phhyYbP3k3/vYO0
X-Received: by 2002:a05:6a20:1587:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3c0bd206b59mr1755177637.46.1783497885553;
        Wed, 08 Jul 2026 01:04:45 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm2220581eec.8.2026.07.08.01.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:04:45 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: toke@redhat.com,
	andrii@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net
Cc: a.s.protopopov@gmail.com,
	ameryhung@gmail.com,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	eddyz87@gmail.com,
	edumazet@google.com,
	emil@etsalapatis.com,
	eyal.birger@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	kuba@kernel.org,
	leon.hwang@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rongtao@cestc.cn,
	sdf@fomichev.me,
	shuah@kernel.org,
	song@kernel.org,
	yatsenko@meta.com,
	yonghong.song@linux.dev
Subject: Re: [PATCH bpf-next v6 1/3] bpf: Add BPF_FIB_LOOKUP_VLAN flag to bpf_fib_lookup() helper
Date: Wed,  8 Jul 2026 13:34:34 +0530
Message-ID: <20260708080434.732503-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704092159.1256823-2-avinash.duduskar@gmail.com>
References: <20260704092159.1256823-1-avinash.duduskar@gmail.com> <20260704092159.1256823-2-avinash.duduskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf ci bot flagged the VLAN_FAILURE re-issue advice in the uapi doc
here, and the finding is real. By the time the lookup fails,
params->tbid is gone (the h_vlan fields it shares storage with are
zeroed on entry to bpf_fib_set_fwd_params()) and params->mark is gone
on the resolved-neighbour path (overwritten by the smac output). A
program that follows the advice with the same struct and DIRECT|TBID or
MARK set runs the second lookup with a zero tbid or a garbage mark. The
selftests did not catch it because every arm re-initializes params,
which is the safe pattern.

Toke, the re-issue recovery came from
https://lore.kernel.org/all/87jyrwf9g1.fsf@toke.dk/, so before I
respin: my preference is to keep the mechanics and fix the sentence,
"repeat the lookup without the flag, re-initializing *params* first;
output fields overwrite the inputs they share storage with".
Overwriting inputs on the way out is the helper's existing behaviour on
every path (rt_metric lands on top of tos/flowinfo even on NO_NEIGH),
so one rule, re-initialize before any reuse, seems better than making
VLAN_FAILURE the only return code that preserves inputs. If you would
rather VLAN_FAILURE restore tbid and mark the way it already restores
ifindex, or lose the advice sentence entirely, I will do that instead.

Avi
