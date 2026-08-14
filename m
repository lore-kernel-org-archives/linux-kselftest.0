Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EFC471427
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728753; cv=none; b=AUNSZ4a662yX3GWH5FGHVy7Yml0csLnhmsmoux+okdx8fHq7ItVkHP+Z2Pn/6Jt0cBZWQNbH5k7M/ojrc2Pa7m9syre+URifpBvGIpUDCFxE127+kVrN154BxiaExf1uNISFQslOdi3v21gLdCmO/3i1mFuewYGVXrEPB5TjV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728753; c=relaxed/simple;
	bh=6eg5iK9Wh0Mztz4qPr5pfLrpFWL3XX1TC5WuxJ3RglU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUNdpktYeViaRcfK6O4oDJ2uUT/iqP5EARY+9Z3BwybjzHE9PMAsET4yD1d10L6VzG/QNwG6Oc3ajAHRRe0XimdDvEZRlV9YVDNh3XZMHlwNE3wy/BH2wzZYc/2Dgd/H1JZUkb46GvV5AO8qaI9Xt63ZgbXcgKWnp3kRhbaxrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MIq8nMgD; arc=none smtp.client-ip=95.215.58.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MIq8nMgD"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6eg5iK9Wh0Mztz4qPr5pfLrpFWL3XX1TC5WuxJ3RglU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786728749; v=1; x=1787333549;
 b=MIq8nMgDN0B0O2SLkj/JKtfYoRHg1ECuuKBFRaseCsEF4z6kBJR38iFQyPLqU9YWmIkQsJ6o
 LJmvudK3l7lijZ/PVE2tF1IPssKlwD13B9GxK2HWLBX61yD+fNZ+7or1cqZGDE0n6PbpcDXodc8
 2Kl4UKjEMCB+KI+8V59pxCJA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from .linux.dev (117.20.149.103)
	by smtp.migadu.com with ESMTPS id 9bf8deab0aed9a07;
	Fri, 14 Aug 2026 17:32:29 +0000
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 1/5] bpf: Drop duplicate blank line in verifier
Date: Sat, 15 Aug 2026 01:32:02 +0800
Message-ID: <20260814173206.93082-2-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814173206.93082-1-leon.hwang@linux.dev>
References: <20260814173206.93082-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a duplicate blank line in verifier for cleanup.

No functional change intended.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/verifier.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 6ac1afced20b..81eae8f70acd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12113,7 +12113,6 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_call_arg_me
 			ref_tname = btf_name_by_offset(btf, ref_t->name_off);
 		}
 
-
 		if (bpf_register_is_null(reg) && type_may_be_null(kf_arg_type))
 			continue;
 
-- 
2.55.0

