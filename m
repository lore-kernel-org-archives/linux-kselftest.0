Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C4A347508
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 06:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775973857; cv=none; b=Iwwu6Y0Q7MratuiT1RKeXQCJQyjKy4p7/I72LRvGE7VQVA7rFKhUinYQh41UIQ2aFB8ZDy9NGYmMrwGFQrkTpDkXdCFhm2gZR04NT8bgMWkZbfI3fO8c5n7+BvUoz0fAXHg2GS4f4hqM8s8N4QoOGLcSxMmXMx3cNqcLOVytR/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775973857; c=relaxed/simple;
	bh=HkcF/gdsFf7bZ+yj2OkU1FINpafuDEY/gnd/Z5PA6es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olylsaPdj/QC/7NqR7Mo4oV8bJ6KHWf9F75gBmqyDSEXFK3kwzTNLndajbBjOiMaQtte/hfmk0YHvsKEUwWs0/gyt9WdaCXNNEeYd7Iug4gV6CQzszKWPWbuQadSx9YjGBAt6geIHnLrMby643V2qcB+qiZUJ4oNRfTwLJILbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu3vxHGY; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu3vxHGY"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso1594980b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775973856; x=1776578656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y7uM2hTZN+vzJGI+23DWwA0Rsh8MoapnFXCJYwKTPw=;
        b=mu3vxHGYosOfo0RF3tlE0ccRr9HyXhzA/bIjEDlIkKtz4RlbbhIv2zjH+m7yqqmvoH
         6YiCLhKobAkCZUEPWy8c20AzFULEU9g9NmOpH2NOdRlNKBUOMKxcVMQ7JaFiDDZuaKix
         biyAUOWQG0Ik88GbhO+zAq2UgqcFacMcWb4CM4vmfHt/xCzrbouTnyvsXSBlh96+80cA
         JlRcgzDA2iilVSUZy39Y6IF98SCioySJtBjNSycmwySoBHyHyuZ1PzkA58etZe1Cnpu0
         sbEC71EWayHlkL7Ri2B9pL1p6bx8tC1YAc8bzK3iC27Amj67It06rFbWEXEkyP74OruG
         FiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775973856; x=1776578656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4y7uM2hTZN+vzJGI+23DWwA0Rsh8MoapnFXCJYwKTPw=;
        b=mdg/40nXiqpQIHbznBOA+FWalxBcI9Opvo/cEwUB1wwavX6tAzpFu6oUH0frG4Tv0n
         +6PU7dZT5u0iXMfdGsTfp3R9uDV6TNq7e84VVlirfsWt9zjl29O62SxIJD+jX6nfHXrj
         0NoBbUuo/G4rGsnZcPULj5TWMYiW7dEjbDa7p7OqNNlcymQoRLxPvss8JGye2vSIG6Vs
         jlJduN0kga1cs2Ivt/TNrNAbSH5XNqC1KP5WTP49RqOLzYvA6d2DBk+RH5C8Qjw8iskd
         wxfTPGo9vD+FzXWuDdJQhhbAuqFK/0vlEI62SbIGfLb6w6015gJ/jlRHF7yNQV08bVw6
         KMBA==
X-Forwarded-Encrypted: i=1; AJvYcCXpy/h3xAq4zoVPn+YKXrtVzexLcZju5+WSvGCUzzeJXTG2xY+GQk/A7Ar2qmOFMGhYkMlmemWmzOA7XXiKj/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+tmdFpkQfTO5vjRdcd3W65WYXwPxDwUhcGBz4wdjJDEOp+es
	acfsMD6eOhnVhBChi3D9SE6gYz7YwnExYFyZBxyzYyCfPL/kvPEy8pNe
X-Gm-Gg: AeBDievSXsLt6r4rQY/4fV/TXfnzk/BZesAKfbpV3LBDHyNhDm5LL5E5RbJR6RMKNA/
	w3xP+o7CiHVHE/1cT4o4MOimHOiaVsYcsb59/wLgE5LJZ9S2hW6MzF+Zk8IfmVdzI33/x56KDJo
	TeT7FCLLOrcwvAGumeKRbo6LQS/NfOKD1tgk/AFj3fLbOHu+kS6tiqZhjNJ1sxNPkzS2uWwyheN
	kWveY+bj8YFwnwlsH1wXXaIKkWWDEr1wDYL5zgiOXUnGQU+4XPkzT8o6hxP9ZxVVWSi5VrUmEgV
	L3QC84CsLn9eeiRt3g8UlS/vivPgWe2RX5Bo9hXb0e6rcwNl28YFB6jTTHR6okbW6UCweZl3ytw
	4NsIQeyP0zlAzEjnJZ0wNMDpad+Q8WvRq0Qf3zU0SMqVOrtmuDj1ece7LLdcybrbk3ahAwmWz4o
	mZM9vKfg6uRT++TvUUBtPW
X-Received: by 2002:a05:6a00:4406:b0:821:810d:e0c2 with SMTP id d2e1a72fcca58-82dd8b5e932mr11080541b3a.26.1775973856158;
        Sat, 11 Apr 2026 23:04:16 -0700 (PDT)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b251esm7072645b3a.37.2026.04.11.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:04:15 -0700 (PDT)
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
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 3/3] bpftool: add missing fsession to the usage and docs of bpftool
Date: Sun, 12 Apr 2026 14:03:46 +0800
Message-ID: <20260412060346.142007-4-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412060346.142007-1-dongml2@chinatelecom.cn>
References: <20260412060346.142007-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the fsession attach type to the usage of bpftool in do_help().
Meanwhile, add it to the bash-completion and bpftool-prog.rst too.

Acked-by: Leon Hwang <leon.hwang@linux.dev>
Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
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

