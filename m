Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623029;
	b=FcCrqcpGF8/TDAjiJe6XaqGIiMF1meX81roEjgOI3ZD8RS2z7Fx8oCia+zYqW1q9yH//
	 0ILKGipWqin61N0hm3HT5frzJ4M8kAOg4cgUkiLBSgW9azPc8Z/S4u1XlFr1hCo3jpSiG
	 pYD6qqjW594iEADcRKt4gSzDqBAHVZ1iRiGgdT//co4B7V85Z9YjPi0Ay/6HZwmxdyED+
	 8XlcW8NJh+aetQV0q1a9oFyMHmJ+F0aLLp3rBKkYPervcnxXdEel06ZRmTKper8C2nS0s
	 II1M2yaEchUo0cjLWHgpeC/MV1teuukXnSOjREqxZVBKD/lvJVzgCGzm3+ui+Nc0bAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
	b=BzgjkufpRixeUyRYTHiYrWJIjeem2GphkHytBIrHi7I5eIz0C8Rb5AKX5/oemOLAnpoz
	 Ubm0pjeaQIJSDqVghDjkiThoEu/dgUSnpvVhbnJhQtQ7TuAPJxcuz58CQxDTNahRWvt8O
	 T0lb9bm5IeWCr7sXTztjtL2Klt3H1rTZVC1TTdzjAsUM6odyFMV3gWeKDLDtCdTYD+yzx
	 zMrcVsEQRFZDymNTyGbgPnrXdRAKnZI8suI8Nx1FcXZbCsbQQNRRH0DFDKLOHKkLAktoC
	 DNDi+kMeUFwzQyE5XJMiWC4gaRE+UTMSj7nWT0ltIfhLPRUOKQo9YW0H4njJ4c8mQgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvfS7rY5;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FD606A338
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01FD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvfS7rY5
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so5521613eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623028; x=1794227828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
        b=UvfS7rY5xoMCyzIjp8URThf1WnyL9SRo3oRA9q6a4+i6rBO3La1sR1ZLXpsw16dUtG
         GQ7dv4C25qefwMqVETPIyu7hwbbUxrBICSY+fcT4RF32ADFhrzO6ORqoBa1hZhS8W1zU
         wtp+bb84P5Q4RZPpp/DjQEDrvQiXExSMtaCypR7TzKBcggo+wnXWRyAkBo8CtnJiCvTy
         i0Dk/8C6JkxYz7ND5HvqrJoa0AFFPda7JEw+iggns4Lp1HL+zxX5ZpRZaUDQx/oRgf1j
         zR8lYCMDavas7noWIIgsKpxiGty8ygKH5ygr6B1aBoFkb8cm87pqbArjWSniQm/G//mg
         PQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623028; x=1794227828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jiUaz4f9o+mDn4Avtd7lFhAHvXfThjVzdbQTeYRRX+0=;
        b=rpIUa0zJA5SVHc79Sqna1b4j0YQOg0v0b3xM7IV6zTj++EvTIgKbnQbydM2SgLbEV1
         hCD31whhOaIWfjLZ4Ax5ta/X+CMp5/37DnjBHmUQBk/QvzPtHvBREqpnnk8YZXnef/O+
         ax8RW+8NTcZeTy8DoyUlQ2Yo6ot8hmec1H6taJTLEbxDf4LHwt+P1Ow4fEhs/3e2l4Vi
         JwSgX/SB0wQnBEf1/P+s3veETyepgpd4ix0PupxUOPFQN8NClLuMlAGS9ZmCaa1bDLwY
         uoJUr+wfyMQx2/3kt7NN8Z0a3O94oQEz4dtW1/r7ldvoLerP25jiF+v9AuW12Mgps1kj
         cPWg==
X-Forwarded-Encrypted: i=1; AKwUvBw/AuWugO1qUUCPo5FryvWNRHo1smUtnRDK2hcwI6DbKcHNpKM0Rk7NOXQwr8hmoab/q5FHHFO60EXgAfZmR0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0gnsE2F6/M//1h+OUbNeHaeGlCCCmo4pJ8538byOxAoIorZQ1
	AIM6sKQQPIA/O9Z28sKujKi2jrW/FoLPXDOrZLDRfNnjtTWro5jDrstQ
X-Gm-Gg: AYBFou2SsF0HCqBhL4yi/4csSUNeMpeShcb2bskWhxDbUahouB6eiKHHG0zhms5ncEy
	5XKbs3Cye20lVanUz9lm3ZhNkmq2KtcTzvPAsLYhMsCySlXjgQPrlXTDBrfWrJFvR71A/H0VE52
	2eBpqBbMMMdMHmrGdfWeqrQ68vCYvWqQhUe4FoFHEAVAsY6PSYGlquIG7N2zC2XC0QV6FSwnjcc
	IiQ8oqPSAzyvTqSdidzb58QzuyzX3HLr48ZiopnAV5RQXVmW+WXOuJ6GKUsSFijwY0Os+LyNoTq
	Z5gDyP8YQlEvhB0UlSUJzVIp3u6w2QeINIYJxt030auxUD04n++CWq2GXPZ+btVgykxPR2q41Fb
	iQu47kstY+gVVz9V3rIM9abf8TfMRciy+BguBYhmDXEk6V/YlzshI1OLNVzMkrGki7/ElegOlab
	HvrOmAparb3BtF9nf1kNuMmjNOMj5w4papmKQybQ2E3YEKLbTiblMSSsQQEhdt9N0ZkoCC3/Jtr
	pv9N4+q/mxVsWsCJIUpZz9VDczvGsSkS6bctNsU51ClmQO+5xq+rDfk7XKgYNPOo9tBtHJ5vrYw
	F1v7WSyVZOUfOb5InJDQ5tCj
X-Received: by 2002:a05:7300:c8c2:b0:36a:117:522a with SMTP id 5a478bee46e88-36a423bf71cmr15537738eec.22.1793623027994;
        Mon, 02 Nov 2026 04:37:07 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:07 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/5] bpf: Fix three bugs around constant blinding
 and nop removal
Date: Mon, 02 Nov 2026 07:37:00 -0500
Message-Id: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyD6GoC/x3LQQqDMBBG4avIrB0wobHoVYqLan51oIwhU4og3
 r3R5ePxHWTIAqO+OijjJyablnB1RdP61gUssTT5xrfONZ7HNPP4EY2sWzKeZYcxHgGdi22YnoE
 KTRn3KPJFl1DsXxrO8w9Md1K1cAAAAA==
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Alexei listed three bugs that were in the tree before the patch list
series [1]. Each patch fixes one, the last two add tests:

  bug                                                  fix   test
  line info stays blinded when the JIT falls back      1     -
  removing a nospec jump as a nop drops its barrier    2     4
  log_true_size misses an error from blinding          3     5

Patch 1 needs a JIT failure behind blinding with
CONFIG_BPF_JIT_ALWAYS_ON=n, which a selftest can't cause, so its log
shows a run with fail-nth instead. Each bug shows up on bpf-next and is
gone with its fix. test_verifier and test_progs show no new failures.

[1] https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (5):
      bpf: Put the line info back when the JIT falls back after blinding
      bpf: Keep the barrier of a nospec insn when removing nops
      bpf: Finalize the verifier log after the runtime is selected
      selftests/bpf: Cover a nospec jump that becomes a nop
      selftests/bpf: Test log_true_size with an error from blinding

 include/linux/bpf.h                                |  6 +++
 kernel/bpf/core.c                                  | 29 ++++++++++-
 kernel/bpf/fixups.c                                |  3 +-
 kernel/bpf/verifier.c                              | 13 +++--
 .../selftests/bpf/prog_tests/blinding_log.c        | 59 ++++++++++++++++++++++
 .../testing/selftests/bpf/progs/verifier_unpriv.c  | 35 +++++++++++++
 6 files changed, 138 insertions(+), 7 deletions(-)
---
base-commit: cd5bc55288d4fd999595c8f2af6a5408cbe92a52
change-id: 20261102-bpf-blind-nops-fixes-e45e91d65c75

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

