Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B443D4FA
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831266; cv=none; b=VJX4iThE0S5UfFF8zmaT4OTUp4mirxQJ+KuCiX3HIfGD1Lgyeg4652rbqhE5EleOaRZpg51onMMyMbBSkgXX0nUiJuJadLcVVkxmadO73B+Thv+X3BgKS1u1JmBx/BRyyTq2aQn7biLCLAJLeyzWB8olIUVsB/F4vmJKNZdXoTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831266; c=relaxed/simple;
	bh=mvMluMulz8TsazPI0k8zL2aMZtsqN5Gi7GN9fqtNkKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrIomC7hnagJxNa28ffwFT9kMVAuIfuv4gSiQ4YW0Z54miJfXkCfpa4kZ+T5xWCE2FwOx6yNHqISSAi23hEB3K7XNc/XhLZAlTNTziodmkNvgB4iE873DnxNZzrIeJnyfg/2u2xFEetFAEPX2QW/mhQP70Wdbfq30oGlGDN3z30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo5H2nrT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo5H2nrT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37ff436a048so1282555a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831264; x=1783436064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=px0Wcp6VhD6xZWRvmlTtSAYT6tdeg+tqH+zTVPz9ZEg=;
        b=Zo5H2nrTXqjMYGMdJPP50uZUExrQFXD75XRkt7ocVE6oac4J4tN2zkkf9h8s5ty3oK
         xcKO3yH5g6VpqT92aZgPdQ81KxtbW4Mc86s9h75HzFqRZkmIgX7HZLdyqWf9kaDI+QRy
         kslQlRdZIQY3AKaPbViHeYasYakmEJEpXzy+LAFPMXfLVgDphgMbu53cncAWEbPLiV6p
         3zBglHAqZA9vq2XSUBos1c+YGOixmSDBe6USxnDxmsq99x4wOSbjTrCXvBdMxnUF4zyg
         B8W8uXwQN+YJoMIW65UdV8fZQ39SMHU16WOSJW8apPnUwg1YxFLg0ePJLOOZBYNjUsMp
         CzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831264; x=1783436064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px0Wcp6VhD6xZWRvmlTtSAYT6tdeg+tqH+zTVPz9ZEg=;
        b=GwLYQfU7sagztZYW5Por+MFFbNWarCMcTjP3C+Rfyf7qOTjOXGcwvWoW50FUlVaZJZ
         7wFRpCFVtOZjC7raoaJxNY32wSDoQtZL5Rsibbb8a+ShkB/jiqx99DFaxqrLPxffGknM
         cNDLJN3L8rZL7ta0BkPmORJrXcDq9THlFY32OCo1rWdtIheoowGVpta4+n6ZecBIHaEU
         rT4zEgUomRqLpa5L5LwtexLBPLZgGFmuD18mMo1R3Avazs8Q8oaKXElNZDHeWDZd1hEs
         ZkX8ZmyH7YFNtyYbEUllZ6vcdkf5zueCno+0MzYYyEU7uu9EwcFigRYYSv3ugqEJiDLP
         i/1g==
X-Forwarded-Encrypted: i=1; AHgh+RpeX4Xv0WDNdj9ZqM7l6byCcAgqNtpKCDGiiWFmU0pR1UuzcWVaVPkJfZMZvUFQCu5DZH1dGVFpSdGideCgkTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFVHrQtlXPtzsRvPABE4DA6cO46k8K/tK+bYQQOj/JEQJYdoGW
	Nb6dsIh63Ns5bDgHBFHxq1aVCnh4uKNH/E7izHd/0TmsZ/77jJR9zdUR
X-Gm-Gg: AfdE7cnAJlje/NeDrUE5pjdagreGRfpdyx0pewsEte5ekePRb89fc58Fj6kuAmoGXGP
	mw3yz8G8STvntiIsLoV73XA1CCQbmWvLtHvrEZeK3pXNivp8pnIiCrCc3P0o00gH+I0Uxkpu5Dr
	UPgqL6QPzAbzuKDgOt/3frYreeCUZzl8O702yBb85ilL5ScpXnTNxW0OwtToBPV2zr6KkSEMirD
	ASUwzFO589+YDqQflMFl54wOsbfqSAQcJ20Vuk9tHdACwnkWDsTFSva0Nt7MHa8I48I3g8F0oXw
	0glepLoS87TEVPP8csM6GNfRvHE3Le2omBk+/GFOuRX3heqoBuGESiod9Gl66ByrEPDPXF0LltW
	4yJVdGaOmBfRwPtJub5YsCBFRqp1ws6d/f1zmkDeR8vHVRyZpsftU66BZ4C/jVQIPgitlnpi1BV
	HOV3LWtDRucKRNqh4X99w8JbLTuTN3yge/TmU6yLcZXqPUar6Ck0W88Ud3k/DAGQ==
X-Received: by 2002:a17:90b:3c08:b0:368:78da:803 with SMTP id 98e67ed59e1d1-38052583a4emr2912925a91.12.1782831264127;
        Tue, 30 Jun 2026 07:54:24 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095b684basm20122a91.1.2026.06.30.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:54:23 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Varun R Mallya <varunrmallya@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v4 0/2] bpf, sockmap: disallow sockmap mutation from tc, xdp, socket_filter and flow_dissector
Date: Tue, 30 Jun 2026 14:54:04 +0000
Message-ID: <20260630145410.3648099-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A tc, xdp, socket_filter or flow_dissector program updating or deleting
a sockmap deadlocks on stab->lock vs sk_callback_lock and has no reason
to. Patch 1 disallows it in may_update_sockmap(); patch 2 drops the
selftests that exercised it.

v4:
 - also drop BPF_PROG_TYPE_SOCKET_FILTER (John Fastabend)

v3:
 - https://lore.kernel.org/all/20260629172704.1302218-1-rhkrqnwk98@gmail.com/

v2:
 - https://lore.kernel.org/all/20260620034632.2308-1-rhkrqnwk98@gmail.com/

v1:
 - https://lore.kernel.org/all/20260616091153.2966617-1-rhkrqnwk98@gmail.com/

Sechang Lim (2):
  bpf, sockmap: disallow update and delete from tc, xdp, socket_filter
    and flow_dissector
  selftests/bpf: drop tc/xdp/flow_dissector/socket_filter sockmap
    mutation tests

 kernel/bpf/verifier.c                         |  5 --
 .../selftests/bpf/prog_tests/fexit_bpf2bpf.c  | 13 -----
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 52 -------------------
 .../bpf/progs/freplace_cls_redirect.c         | 34 ------------
 .../selftests/bpf/progs/test_sockmap_update.c | 48 -----------------
 .../bpf/progs/verifier_sockmap_mutate.c       | 12 ++---
 6 files changed, 6 insertions(+), 158 deletions(-)
 delete mode 100644 tools/testing/selftests/bpf/progs/freplace_cls_redirect.c
 delete mode 100644 tools/testing/selftests/bpf/progs/test_sockmap_update.c

-- 
2.43.0

