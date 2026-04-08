Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912936215A
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629316; cv=none; b=SYHWuLnLnFuzxuG7xjDA4D4f+ZZDA6+uJPS1OVLSQJFVaoyaArClS87LbHof/yW2h7FytVsLL0QcB7ue2MqD3EBJ3pQSdiKsRX4II/Jhv1Ys3NWjWMaRdRbvL/Owa0KlCpk5uecndiwW2dpSVZQ8JMoDoTdxJ9VFe3m8RUqYd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629316; c=relaxed/simple;
	bh=ws7lGY5DDx7cDa1bHI5ZlxYFjbZK7oocW2/1NSr3xtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TL5v6zre134z8Z1Vh4JQySgOXFxqpCqoZMMLCfRKkMQM23MGI3Ag4n98LLu3nNeb/zdlT0OTGtFVLHqwVI7h3fQTZz//fw+2eh54w/4cWsYst+TiHKSEbiOh29icCdcZOECpSxdpEin0KdzQIE5jI7s03MdWuMzUpGcCLmv/bPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MenQSDjX; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MenQSDjX"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82748257f5fso332120b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 23:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775629314; x=1776234114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptcHUH52MTJBYjzovgiwUsh2fxU5c/oxZodZTSTMLQs=;
        b=MenQSDjXUtM8ap+U73uxY02HlWfvIn1NSbjEXyExe4myMnNsiKsVumwkAoXogT2buY
         vKjLeIyIXiEaDRxUyGhI6qlA6jeyP/whN2UesGEF+tD1r2gbyRirhQD7q5SqJkdwH2LR
         DG7nvv5l2Jnqb5MhsZEVnpqhkewWayOjoPIt6oXVWRxFTs7UGe13FzlbFgZCSndThM4n
         5l0JRoGGxR6enrwaU8FLYh6CSf5Vdx/ZnLRorozfGakJ48D3IgKcqebZuooFAWA/hFL0
         63bDiQy88zVK09WqiVkypsESJOTIKOjqkpToI10NZg/hPRVkID6Ja1kDZUxENTzjNW/O
         OVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775629314; x=1776234114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptcHUH52MTJBYjzovgiwUsh2fxU5c/oxZodZTSTMLQs=;
        b=f87Udsx9HKqvvGqyT9D8o5NGQuQfIGNOIcQXr9a1hGEedfan/Va6vMuGGe+vpdW/8N
         hYzYJQkbWnAG3E6/5OzTaOhNktGvr6x0Ur9Ik2tImfqCFlk9jXRtczbJEj32OzaqDCjG
         K1kKwT2Pyd22TNu6PqNF9uswjvC8U5mdc4el0kWjaIRwAtmldQp/Dr4mk+m97UGUQweF
         aL6aP/da0uKkldwZX2WLW3jjWwnAN7IzpVN4fwYwoa1UI1xWkQIt1tiX5JgTmhPGnzvl
         V0hMIFeCeA9/aJJG4721VYOfwNnBnWlg5KLWNcnljWkzxlpoaGZwxN9dLR7GNkRMcqo6
         kDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvHRt0xI71qxcYNdALDa11t9iIs5mFF6upSYlfvbGzeRaA/gK+gZwPB4EvMQzuqcIc/tOaVhobJOrgVkDnQrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywot44vKgFuWkNXFdUNIOx12bdMTnXJ+018p630ZNRHLbGKjLTY
	8UergvVrssnG1b84cyJXTHHk1dFaAa3U1FYZfOMcdrNvl9VRpklWCEMc
X-Gm-Gg: AeBDieu/TnTCnd+tRJbiVKwNaq8uji070N+qMv5luEpFFjtCJqgSpxNdZIVo3eBWLpc
	Mej0UQRhn/ozJdT1f2eidjdLSGvHbo+paw7+c9J7ERILlxHDhA7a4w4vAO7m9TiEs9gKXUZ8bGf
	ddBkNCoyGdnmr2hX7E7KpNX5kHlM6KphVc1f2cadoh0L6nNVj8kLGj+RJFYCJVySJ7HFBQfxTni
	EOCHiCyUM3OixPZRSBsVr+Pdy4cFB6b9CinfA8t2VonJX6O6665mzsSzAWXZccJ2e3FTQdUbRi/
	GE0rVcmahWKhm9GMPKj7Fl1B4EBGMzp5Lmr6YmEiSMM8UfTa0cN9hq9kV7RGWI3TQ6z34d677sk
	rCFqU4d930Szb7meJtOLc1QVGFdTfDdqmtAcLwCyKgfsCYVOmBA1wEUHkp6X6okApU7qJ20HwAb
	fy1hqlS1+9x34JMAdCoIeD
X-Received: by 2002:a05:6a00:1ca2:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-82d0023fdbcmr18985149b3a.13.1775629314258;
        Tue, 07 Apr 2026 23:21:54 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b60199sm17827638b3a.25.2026.04.07.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:21:53 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 3/3] bpftool: add missing fsession to the usage and docs of bpftool
Date: Wed,  8 Apr 2026 14:21:09 +0800
Message-ID: <20260408062109.386083-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408062109.386083-1-dongml2@chinatelecom.cn>
References: <20260408062109.386083-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fsession attach type to the usage of bpftool in do_help().
Meanwhile, add it to the bash-completion and bpftool-prog.rst too.

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
Acked-by: Leon Hwang <leon.hwang@linux.dev>
---
 tools/bpf/bpftool/Documentation/bpftool-prog.rst | 2 +-
 tools/bpf/bpftool/bash-completion/bpftool        | 2 +-
 tools/bpf/bpftool/prog.c                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index 35aeeaf5f711..90fa2a48cc26 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -54,7 +54,7 @@ PROG COMMANDS
 |     **cgroup/sendmsg4** | **cgroup/sendmsg6** | **cgroup/sendmsg_unix** |
 |     **cgroup/recvmsg4** | **cgroup/recvmsg6** | **cgroup/recvmsg_unix** | **cgroup/sysctl** |
 |     **cgroup/getsockopt** | **cgroup/setsockopt** | **cgroup/sock_release** |
-|     **struct_ops** | **fentry** | **fexit** | **freplace** | **sk_lookup**
+|     **struct_ops** | **fentry** | **fexit** | **fsession** | **freplace** | **sk_lookup**
 | }
 | *ATTACH_TYPE* := {
 |     **sk_msg_verdict** | **sk_skb_verdict** | **sk_skb_stream_verdict** |
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index babb0d4e9753..75cbcb512eba 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -501,7 +501,7 @@ _bpftool()
                                 cgroup/post_bind4 cgroup/post_bind6 \
                                 cgroup/sysctl cgroup/getsockopt \
                                 cgroup/setsockopt cgroup/sock_release struct_ops \
-                                fentry fexit freplace sk_lookup'
+                                fentry fexit fsession freplace sk_lookup'
                             COMPREPLY=( $( compgen -W "$BPFTOOL_PROG_LOAD_TYPES" -- "$cur" ) )
                             return 0
                             ;;
diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
index 6daf19809ca4..a9f730d407a9 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -2583,7 +2583,7 @@ static int do_help(int argc, char **argv)
 		"                 cgroup/getsockname_unix | cgroup/sendmsg4 | cgroup/sendmsg6 |\n"
 		"                 cgroup/sendmsg_unix | cgroup/recvmsg4 | cgroup/recvmsg6 | cgroup/recvmsg_unix |\n"
 		"                 cgroup/getsockopt | cgroup/setsockopt | cgroup/sock_release |\n"
-		"                 struct_ops | fentry | fexit | freplace | sk_lookup }\n"
+		"                 struct_ops | fentry | fexit | fsession | freplace | sk_lookup }\n"
 		"       ATTACH_TYPE := { sk_msg_verdict | sk_skb_verdict | sk_skb_stream_verdict |\n"
 		"                        sk_skb_stream_parser | flow_dissector }\n"
 		"       METRIC := { cycles | instructions | l1d_loads | llc_misses | itlb_misses | dtlb_misses }\n"
-- 
2.53.0

