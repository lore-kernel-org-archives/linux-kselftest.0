Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96861CA5A
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 02:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781923478; cv=none; b=fnzC7puZu8lDZz4Gbt4pr2HXtFqV8ZKHI+Hn3sGoTt+zpi8ie0TfUYt+URmcwhV49L06jjBRoIGrYIGe1gQFkAhWejy9fE0gnbt6ZB/sUcQ92m2dOD58I/lR7BZlLfcMbIQXCg3KKGltFpIC79UhMtvwewNGf6j+CDyIDg/ruGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781923478; c=relaxed/simple;
	bh=NP4quYUiUG5ir6Lfp/c0pxMjxtMtKmPdVnpeYKXlUh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=so1j013Njz5tn51T9R5vLqceY9SLHO55+YZ+OpJGcWk/rFtT0JXIF+LQjut2SFSBOPxvjFg8JU77UC3IVeSgs5Ea8AlFN8tsDxvus9dCD9HkhZR01wBxbi4Q4y7q/Ootz9R1fxNjbvjVkrFe4j6613Swx1GqF+nZDzkLvk0LPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv1hXSxK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv1hXSxK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so1281580a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781923476; x=1782528276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tEtBLcfn+4nL/oLFXcmstWWRDWBHHiHGLWZQy1ZHB3Y=;
        b=Dv1hXSxKUXJ9TVQynNVZA6sCZscNGNjyUl8o1fETyyQSirtnuAPVeKpX5BoLCbWuVC
         md18EqGZZovQGbvXGFqTDG+WpsXkUZVlX1BhQy28REFKzmtq6zw/zfEzqVQA4J5KQSgp
         bes/khJf490M9lrJm66nWmRTSmIe35AuV2d67ClIhGOFbAfARQ4Vd0UR0EhbkADcrwbQ
         BLkySwSFMcWaQvrfOINQzmOUsFphR5ue/T8PVVgJQYSUaU3LAI+zcQnuAbAdHlHoG65P
         a1OBGs3Ih+i0rA6vJ11aqEjeltGVp3twUfLPyDkpFMCQ9u/SNo6JeVGPzNd4mQH2eHcc
         pqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781923476; x=1782528276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEtBLcfn+4nL/oLFXcmstWWRDWBHHiHGLWZQy1ZHB3Y=;
        b=AHzF/Ad0CGOrTdYlJT/1vJEnNRK+xkIUX8adnLYH8ZUNTzDsc1A5gdg/3aDBbJ+IbD
         +c031qYzChKumHivHU/lFklQBDW4DdKX+cK3tZCjgIKwFf3IwjS59LT7ZWmQ2/o2T9kj
         hzP3Ln3+SXBtiOYXRAb2UAptoO/3KtER9aJ4LVvLlpS08Oo6ntn54c8ITtbWisOvip4X
         6864J8wkAyN8kbVKjs+0MqW7msvESusmYzMP+I87Y0AyNDaU/UTBIN8l0veiRrXZmejW
         9B3fBT8tGVCfMpG1rxsYmqU8bmtfItaAXzxdmQa7TOIQaxJkv4aq2XiONdj6mdQWr5vy
         3FCg==
X-Forwarded-Encrypted: i=1; AFNElJ+vPEXTZvjH5ccQpUsNZTuLdlrbyvZOdvsLU4ULF2WOl40xR/H/rrNVk5FVVD0laKO5V/k3qfvLoikaG1GX6K4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQ19YCqUdcnTn4xg91SnUq51iEohRDSB9W9jRJs6pKZBd2qgg
	BnJ8YZL1WFLcF3C1wnFyf76t+/b2cQvNkXwT2Oo1sgwdF5u8TzLOcgu4
X-Gm-Gg: AfdE7clLNKdcNE+opla7QI32rZmXLaRd8VWQfPR4tYS2onIARLtfsVxEsoRuECMAz63
	WXY2seZnr4P+ZTROOELsRH6WU5gg0x34R/LLdnZkMYehzuE+IIuQSybcEpXerMZm8+U75qsEDe1
	XdxA+MNVbomT8Pbj03h/RHgx6ASi8Hdci41MB4fih82pxueKUhRB//fOIvQlXNMk+JGihztSuBY
	oT++izMvN1AsqelgU888vXSjroESBbYGoZjv+gewsRhosxAYAIwUitMOPbXBTzf5ZZDpoZ5Y/RY
	24aZDlGFId0nRxL3rslrrkbsfxXQCDLbnsh/TsPxjg25OMNqX7qIKexd3bw31Cf1eVGdh539z95
	HCrcjIcdJIGR+VtdXzh6A5LDqcIgR70plu00G/ydlD/WUfvqcHba0lKXAMCcpZ8ONSeCVMMqoN2
	TG22ZxPZ3/tKHf5FyWO4c7SgimCWY71TpQ0nraUh8dL9VOIWlvjlU=
X-Received: by 2002:a17:90a:f94f:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-37d15dce559mr6675282a91.1.1781923475789;
        Fri, 19 Jun 2026 19:44:35 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1600975asm1087971a91.0.2026.06.19.19.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 19:44:35 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Bobby Eshleman <bobby.eshleman@bytedance.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v5 0/3] bpf, sockmap: reject a packet-modifying SK_SKB stream parser
Date: Sat, 20 Jun 2026 02:44:15 +0000
Message-ID: <20260620024423.4141004-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A BPF_PROG_TYPE_SK_SKB stream parser runs on strparser's message head,
which can chain skbs through frag_list. A parser that resizes the skb
frees the frag_list segments that strparser still tracks through
skb_nextp, leading to a use-after-free.

A stream parser is only meant to measure the next message, not to modify
the packet, so reject a packet-modifying parser at attach time.

v5:
 - target bpf-next instead of bpf
 - add Reviewed-by tag (Jiayuan Chen)

v4:
 - https://lore.kernel.org/all/20260619062959.3277612-1-rhkrqnwk98@gmail.com/

v3:
 - https://lore.kernel.org/all/20260618102718.2331468-1-rhkrqnwk98@gmail.com/

v2:
 - https://lore.kernel.org/all/20260612123553.2724240-1-rhkrqnwk98@gmail.com/

v1:
 - https://lore.kernel.org/all/20260609112316.3685738-1-rhkrqnwk98@gmail.com/

Sechang Lim (3):
  selftests/bpf: don't modify the skb in the strparser parser prog
  bpf, sockmap: reject a packet-modifying SK_SKB stream parser
  selftests/bpf: test rejection of a packet-modifying SK_SKB stream
    parser

 net/core/sock_map.c                           | 20 ++++++++++++
 .../selftests/bpf/prog_tests/sockmap_strp.c   | 31 +++++++++++++++++++
 .../selftests/bpf/progs/sockmap_parse_prog.c  | 22 -------------
 .../selftests/bpf/progs/test_sockmap_strp.c   |  7 +++++
 4 files changed, 58 insertions(+), 22 deletions(-)

-- 
2.43.0

