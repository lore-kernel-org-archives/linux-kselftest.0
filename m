Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376340D579
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850651; cv=none; b=fAXVFt+Lxn8hM4vAz9jVNfm14l/xqvJrHEvxxnQpEOsZdanvEF0mSjkvFuf6H+R6oNVUBOhinAsu9W6CrseIEtcYL/IVX3SFbKOzZAP3x+N1Er5iwW/nhoA99HB9hf+W5l8wUs2i3oZp1dCqJM6rPugUJFXvFk92a3ZIaBDp/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850651; c=relaxed/simple;
	bh=JMv1VF0ekCwbw9SWvhd6zEKji0osX8O3WfZ/H6jfaoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmeC7/p3eyS+yiRXalL82he8LkaAwnd6nEvMBEYnzsHhes7kusgvOzk/qOdm+oqJc5ZrF8hq9bpwo1SilrlLjoE3ilaRHlz9L+C0BIEQv/3jBxmaQEXyKVRbFg9CxtrZrpAd3aAg0Pr7H1Xukp216HxmHLA3Mp4Sq/OjS2db+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nilrkEAu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nilrkEAu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422f395a4aso1194030b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781850649; x=1782455449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpvtH/MELQ6WeOgVZKeeEGkQECkK0rlO9TvkyMUA8ZQ=;
        b=nilrkEAuWoJ7MFTezcUlCY7ckcxMgAfp1VNp7b+63JIlpE+xhvs8n9sLM2vHIMQQVj
         88twXW4UDh+1TRfsnUn4W5IxNTG3ApRtfmX4jLrfRgKeAHfIlQlX+jWrx6sXVBMsJnhg
         RF5w4Fx/BfzOylBFVEPjFpcIpZtCM+Y3kxTBhugjjeZ6N7vkkBeuavKpHgrhDUt/B8xh
         +dngGk9DwiuQ7hHfOVPfhuOTWFL/I7wxmV1DHfBSCjcyZfwqUge0cWt7X1bNBZhdx6FU
         UCaREDVwyfe/TM+o7ADplmB1lY2RH+1RndD3tiu66myP+Ho8GvfpUuaOqB+rAx/DtBK8
         AdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850649; x=1782455449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vpvtH/MELQ6WeOgVZKeeEGkQECkK0rlO9TvkyMUA8ZQ=;
        b=bpJhwcfGdoF1jl1/bgFxu8BtSipjd0vp4i6RX4nJEPgIQHkLasHkUUwz2Y2NlsL6qO
         O7KFAcX7P7TGFIAwT3zqXHiON2xCtFqh8BSsp3V5t7W7WgvSM070nkp9Os85K1AKgCv4
         AfCLCppNBjyuG2KhORjGPjsyoPlL4Bb8djiLpQ85XKSO0AMG35BPUJeVwR278q4Pug7f
         64LZj6AuRpZZn9osL6u6MFmozNx0aJmADHwNSUZ7E6rCXEG+yr0YOJAkCX115Ii4Vppn
         iDKAukjqMPOs4dJ7WNIaMc/tx4UBrinsxUw+bVPkhSPorEBoti6mvy8G0H0Qr2zeiuHx
         WK9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EoV+MbmDIWh6eMtyydechckDIYhEAFd4op976R+AFFaxRYR2ZmMi5W5mfAflZTQFZScZ8Pu6rvoyULh4hYhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXR5iHr/hUSzZLAZ+JIbU7uqV0SH6te7spojpoLM2Lga6D3hSF
	xneUTMkQxy5FAvul8h+yt/soFQ2JEbWWPDXiLD3x5lk/I2l9DktOtkXb
X-Gm-Gg: AfdE7cmhL+2LX3pp1NF9WWywv+Mr79AZLCl4bxoI6PC388r3duGFtRpzfYzGWIrSkbr
	xM96tlSlgiOe8PwJvPDXU8Xye8fZ5vPyr/sKJLkwlgFLstEEKBU6RhmtMsrUZKQ436KdZfsAVcg
	TtES/XPuSm0RqYwncd0vcNmGcnaTfJU6e8IseQWMwDbYWj+a1SBrkred9bDrEHzt3pXVW2q6b+Q
	Z88E6yihlKUY7hzIafwzQiPm+O58ZzdzesXHMU5P9XG1sxelEGEUVgBbdmPOv3AUvYbAMsWH+Z0
	wDFWwU1XGVq5tLIEEKwbtAKCqvK0nwe7FXdXQdvyFvu77HmUOpbTbUpxdLLqzTR72JBGTUXUcEA
	dhCHcf0aCud+VtDXRLNU8+aYyB3m1CKLGR9USAFL+WdmM7hq5JJWZgmM2o4EOklMR0OrWsXw+Ch
	zKx4UXcCTJR27GUF0Z1boSukxse7+wvdvmx9IXLC8HbI75+fGra00=
X-Received: by 2002:a05:6a00:418a:b0:82f:51e8:b38e with SMTP id d2e1a72fcca58-845502b9401mr1949687b3a.24.1781850649563;
        Thu, 18 Jun 2026 23:30:49 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382b886sm1380096b3a.51.2026.06.18.23.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:30:49 -0700 (PDT)
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
Subject: [PATCH bpf v4 1/3] selftests/bpf: don't modify the skb in the strparser parser prog
Date: Fri, 19 Jun 2026 06:29:50 +0000
Message-ID: <20260619062959.3277612-2-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
References: <20260619062959.3277612-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sockmap_parse_prog.c is attached as an SK_SKB stream parser and modifies
the skb. It calls bpf_skb_pull_data() and writes a byte into the packet.
A stream parser runs on strparser's message head and must not modify it.
A resize frees the frag_list segments strparser still tracks, leading to
a use-after-free.

Make the parser read-only. It only needs to return the message length,
which keeps it attaching once packet-modifying parsers are rejected.

Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 .../selftests/bpf/progs/sockmap_parse_prog.c  | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c b/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
index c9abfe3a11af..56e9aebf05f2 100644
--- a/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
+++ b/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
@@ -5,28 +5,6 @@
 SEC("sk_skb1")
 int bpf_prog1(struct __sk_buff *skb)
 {
-	void *data_end = (void *)(long) skb->data_end;
-	void *data = (void *)(long) skb->data;
-	__u8 *d = data;
-	int err;
-
-	if (data + 10 > data_end) {
-		err = bpf_skb_pull_data(skb, 10);
-		if (err)
-			return SK_DROP;
-
-		data_end = (void *)(long)skb->data_end;
-		data = (void *)(long)skb->data;
-		if (data + 10 > data_end)
-			return SK_DROP;
-	}
-
-	/* This write/read is a bit pointless but tests the verifier and
-	 * strparser handler for read/write pkt data and access into sk
-	 * fields.
-	 */
-	d = data;
-	d[7] = 1;
 	return skb->len;
 }
 
-- 
2.43.0

