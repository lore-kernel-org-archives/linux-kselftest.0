Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D945BE3
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850645; cv=none; b=XoYQac4qIgkdgGb3skthaH1TkZ6nHXw0V7CzY1RzyC3CQ22yrCw7z8YCGIbXll2ymcQX92AMxFWb6dYT2DwNfl517ryLtLvUh5U1qHzP1cUKqUNbuiBmoV9L7GulgMeGHEq3CD8c9YgjK913RVUk9a7w87lNcMTeUuBLX1mfXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850645; c=relaxed/simple;
	bh=TqQB867N86wSav4oIi3xoeqdmuIgWtWi0oXKIdYe2EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oj057NV1pysrtQrxGpDx6u7kxQjHGr/LAXh1KNLRN84qePMp42u9nVMhfjJxUF7c/wViGCSN/z9D+KUF5svaL/1OfjfNlN4QXLqWyLmo9J89/lbBWXV5c1UUx9vJb1aFsfnf+xZADRqPQz6/jnuyJ3V0GcrNe6af+W91HSptzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca/8b/f3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca/8b/f3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8452a597afcso1053984b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781850644; x=1782455444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1/ArZBR8AclmPo2AgBuJ0LqA7c+rabIabH9ua++1ms=;
        b=ca/8b/f3/E8ohvuXtS3L5Hrv1r+ikHr72uMY3Q9DGv/viCyjrs78XSNaBRyFs+4/NM
         EHBLWEuEWP31lHXzMMDljO8fEeQ/fntQHRjhlfDMMloNL+51qLRKjwicGqtizAPx7lsu
         UxKCxxW9RFWoY3bZOfRs5eBD9AvHn7Cn0eZg75aGYKoEzNs9+xF/p/5Pwl0Im4HRz08O
         xWakTuJdEoEdcbtbiiBFAfInz/q4xXW7F4DMywZBllwhgSvDM6eDC2xWX5mITRMEg067
         SP3p5LzxljLCVigXuVY69XFtLkjqFtQiHtsQe24ggVJBDqE/lwQ6giilFr1nUnQ38doG
         s4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850644; x=1782455444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1/ArZBR8AclmPo2AgBuJ0LqA7c+rabIabH9ua++1ms=;
        b=sTbmF87fbL8v4czcfz3ZadH8XFqEwzsu9ryFOT+XeV0KjrV7IVtqx5knY4AvsEYmgt
         VW70Dd00YeFLBr+qVoyOZBI1ZthB6QIyzEquD3xSiVf7uRyDOxdwhtp345y0swWf4egc
         5vRtOLx7TUTh5YgJeB3Ixa2wSDPXpujLuB6vXtZDNJRkzB9ZFGG0ImDRy59BrmryVy3I
         twpX2stax0IAKXOHMh3f/xiAh/OPrzTVWqTx9J+FiqcsbtQaZ0ER9bSsHMh1HQsiRQaE
         2lzSEH6tHpPU9ovrLshH+wHlI6eLsnM3rz6pcmGVNfeXZZabUhKBbIj4kiQVGKAEnLRr
         0x2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/r92xO4bfTiG82YSCEQXDpakpbYabwmVlRD1ZxOzunSK8rzxF94Jfwg5OPci4xnFxIKAkjj6ZS7HG4mlz8F0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRdJIQ5PnCBIH+wNm7H/WcMMMyy2JZ7XYLSCuzD7hgbAB3zlYN
	RdChZH88Zcqrz982phgvt/YeI2R4yamzKlu5cKlfzWAeLQVrioywyZR6
X-Gm-Gg: AfdE7cnueFpRBtX8z6iqT0tWVXJ8jAbQ3/J3lLM4rbXP5H/uQNmIWTtmQ87qHSxmWc6
	W/ftSaLRwgzdumxZ0G6LzIlC7IBG+fm7yxgRFvX12q2Pq1K3/ARpDGTXd+u99o33iFNudETsAQ7
	DK0LBMUAmJxrUnBLt8fuQsE6S15C52ChgeF+xm6iFlRFleWLOrPHo4FpfisDe7zA5V32HJcPRvL
	nPqnmI2UWxlABwDI6lzzd8k9i9KfUtgZ3ZTp/be1WOFmskhzvKRn+oa/q46AgUZW0S4x+xxeZTi
	Z5nelYrWrKeEOm4YtwO2/nWBAqrgvM5sYJziEA2piqFkNcbsYi9Qrn5SMhlUhmAIG2Cb32glCqs
	+QQU+tWXGzwv6g/1JV3sx1PWQCc8Afo7jf4HhPAHrJAEP8UVMiNV6uTIJ7Y+HtLgHE+DZriNq9W
	Lt3wilwcciU9oVjFu/TU2CXX2bhNs1uMCTiC7L05pyQwKWOUp2CDA=
X-Received: by 2002:a05:6a00:1a8f:b0:845:3ffb:ac2c with SMTP id d2e1a72fcca58-845508d71bcmr2333443b3a.46.1781850643354;
        Thu, 18 Jun 2026 23:30:43 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382b886sm1380096b3a.51.2026.06.18.23.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:30:42 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v4 0/3] bpf, sockmap: reject a packet-modifying SK_SKB stream parser
Date: Fri, 19 Jun 2026 06:29:49 +0000
Message-ID: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
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

v4:
 - drop the Fixes tag (Jiayuan Chen)
 - drop the unsafe skb modification from the test prog (John Fastabend)

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

