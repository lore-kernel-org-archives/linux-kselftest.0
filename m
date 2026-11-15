Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725127;
	b=aRmcdylnysDTNqQVRYeTay/YxtIkA1sEOc/bWWAAFb3ve0dr1T5q+42r8q2b3k0wArjo
	 JLWjL7dvaQl+g9VJ2XJINfQQtB9PKEDKTB839dMQEx2otTVwsBQKxg2Xn8kKGGp85I31M
	 ZlFhmDryHLMBqYBfpOED/uw69zjhf/Zyxa2z6SFD2X0FoOaCBHGMqBCN3sNRfNd8XMdx6
	 YZWNXhL8pCBbb/jhjIYxskWCwiANkmN+YEQ6aEFEOTFGDCvd/IkTRR9euvTYXAQe4fe4m
	 AiwsfRGxnAgpAG/wYq7298NiMmiDJB74vfyfgisyvv5HDPeSN3QQrmbsbBG+tOd0aUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jbBpt+FJ8a8qGQezAUJGyx793S/s/ZwSaKkH+VjjeYU=;
	b=BuSdHYgm54fA1lJLzZHCzK+AMuoUE9b44XIR7Jnd9us+g0dMOXmSmLqatgUf+ZYc+1BW
	 qvpHmeL17o+HcB4kai6p3gus8l7iv/XzmBovc67dpEO/GZS6Kg64pj67BKaMam0SsvfTS
	 GYHF134a0yKTPH52Ajo/n+ES9V3yybplqGIYnb0KMybFC4oMBVM/RD04UfVV0XziDcpVv
	 MSpbcvzJIytOnQWOhRfWfZwcI4sFoWi5hrFazZq3/J79sNMQOnumB9RsL7t7NjzYbuLKP
	 95VBf8xoToxDIP2NST9R8pt8s0+3JddcNkc5XyH5oa8yzeb8w6GvBtiW8vXKD1RDTzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkOIAS2J;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC1606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 06:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkOIAS2J
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1603613f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725126; x=1795329926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbBpt+FJ8a8qGQezAUJGyx793S/s/ZwSaKkH+VjjeYU=;
        b=qkOIAS2J5dfRhEsOfY7uH9G91K9RXCbZa+s9wLCAP4VoHegeS862E7+8XAq9ER3GOG
         GXWzW5j2rGwrMY7ORSOAlNB19zj8Yt6g1GntL/2dPkZ8/U9TOVE8qJ4MP4KwDyz40Tjg
         daP4r1zQWxAN+w5XRvFj+wuz30nw0m/q0BaLIpqWlFzrRN68+M6Ibrf2j3Q8Uwnow+uw
         4ctrPSM3yp7pUoM6Uzu7jSeUqnw7eBzp0PHjlHQDLcc8dI9XgznELQw8n2wwqKQlHnz5
         XPJY9VqHgHiashmKvbyj4Hztn/pNUe+YsnnrzbZw8RqllSTLm3FoNNAPppHZ+R3OCX1I
         xsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725126; x=1795329926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbBpt+FJ8a8qGQezAUJGyx793S/s/ZwSaKkH+VjjeYU=;
        b=Jy8oFMY5dwUXytHpdFTA0gHZ2UxxpfDhpDplXRDv+qdTP+2oj21dvsck48VTMrDdkv
         5pCZrt/5OqodEH4Y73l+Z6BrZFpi4S0WUFbraYx2hghDlGXUNGoJ212DWtaNjOlYdcu9
         fYshXkSM7ABLtu/fZ14Aml7didMvz7CuPk3KwEjTO+fXOmz60gHRVkBC88SaK1gm5kE4
         53vD6M0BFxvgrjuBCj4H4N+5MgTBGLAtwVPxp9W1Cua669uj6X7DYtk+Vp5jxPqvNw5U
         49KBZXnEG3c7f4n+Q8oa7yLwdBv7ZLh62zBPteZgb2nkKDCuUsvwyu803wSZ5VTgEc0H
         WYGw==
X-Forwarded-Encrypted: i=1; AL+hErHnPkFrppOcxeYn+7jMlX9w2jhFzbo3AfqxImu870sIziirC09Gybw5NCFv9QILoxigDpnk3tVSlfJsjQ8tRTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82eEYxSuQWk6yLtvh5NY7ifnRwf3yJsl6r+DAK/AqQw5sEHgb0
	J0ok9QXXyXzPn5RNHs4v4hTij9tujGiC2NDa0zkFc8drT8B4RCNafMn7
X-Gm-Gg: AYBFou1aeKrdMkBQ/2Wqe+hybrU/pKFvxzmJrLRaD9X9j5TcxsmimhlASIDwASozuEH
	CMVWhndepKG173NS2KxVWXR2A2+IR6MLGK3jhQLDr06quVd8LUtsepYWQ2/4ANTp/OjKPNtAr7T
	u6ciZN3GQRCoyZUlYyafqruqo2qHppBjfuQW2K51ylgn9bOUO/JkgLixFKz7gibZT1ULQuAwvDp
	hsRUtJHGKonDRQwk4YXb31mLKq3Hbun5CNf5VToMZNwF8oksvu3vBYsTghY0lIdLaW1sj4+iQd7
	UJ5wHgFUTxhwGX7MwLReNQmsdhADQ5EVcP6XPLxpXAss7JxnJrzveDYx16RgtCejIavWg8BtMhz
	0eLrl1J5gxnIilv+AEdfXMLP8wOhKKRPU6IRbJueGv2esTMhSGiwMRMT5J6My0TUkYA3sws+n88
	cslbnKWeOjowZqyuqeZe+U41AqFzLmfcsZ/if94al/QnHEYhfbuNf+xFUP0ivs0U2PN0HiVa7q5
	ulrg2zSdKM03FzardC5/ep7id6LBQpKp5CO6ZzvtaRSUCJW6vcVC6gquZM5HRKcsYo8peszhBq+
	4r3eCF4l8FnilX/CyjW95EdOXi7E4/wDvvI3
X-Received: by 2002:a5d:588f:0:b0:48b:a4b:5a2c with SMTP id ffacd0b85a97d-49c6d4538fbmr17328911f8f.3.1794725125683;
        Sat, 14 Nov 2026 22:45:25 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:dc0a:bc51:e26f:5cf8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm14073284f8f.34.2026.11.14.22.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:45:24 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org,
	emil@etsalapatis.com,
	houtao1@huawei.com,
	linux-kselftest@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Check cpumask weight after population
Date: Sun, 15 Nov 2026 08:45:12 +0200
Message-ID: <33f2b92b2bf65dd349beb6aaef444c8053adeec1.1794724099.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794724099.git.thnkslprpt@gmail.com>
References: <cover.1794724099.git.thnkslprpt@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The populate selftest checks individual valid CPU bits, but it does
not check whether bits beyond nr_cpu_ids affect cpumask operations
that scan the entire final word.

Verify the weight after populating an alternating-bit source to
catch leftover invalid bits.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 tools/testing/selftests/bpf/progs/cpumask_success.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/cpumask_success.c b/tools/testing/selftests/bpf/progs/cpumask_success.c
index ddaba4318c57..09c0ee35d636 100644
--- a/tools/testing/selftests/bpf/progs/cpumask_success.c
+++ b/tools/testing/selftests/bpf/progs/cpumask_success.c
@@ -887,6 +887,9 @@ int BPF_PROG(test_populate, struct task_struct *task, u64 clone_flags)
 		break;
 	}
 
+	if (!err && bpf_cpumask_weight((const struct cpumask *)mask) != nr_cpus / 2)
+		err = 5;
+
 out:
 	bpf_cpumask_release(mask);
 
-- 
2.43.0

