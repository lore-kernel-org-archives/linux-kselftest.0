From: sashal at kernel.org (Sasha Levin)
Date: Tue,  4 Jun 2019 19:21:37 -0400
Subject: [PATCH AUTOSEL 5.1 27/60] selftests/bpf: fix bpf_get_current_task
In-Reply-To: <20190604232212.6753-1-sashal@kernel.org>
References: <20190604232212.6753-1-sashal@kernel.org>
Message-ID: <20190604232212.6753-27-sashal@kernel.org>

From: Alexei Starovoitov <ast at kernel.org>

[ Upstream commit 7ed4b4e60bb1dd3df7a45dfbde3a96efce9df7eb ]

Fix bpf_get_current_task() declaration.

Signed-off-by: Alexei Starovoitov <ast at kernel.org>
Acked-by: Andrii Nakryiko <andriin at fb.com>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/bpf_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bpf_helpers.h b/tools/testing/selftests/bpf/bpf_helpers.h
index c81fc350f7ad..a43a52cdd3f0 100644
--- a/tools/testing/selftests/bpf/bpf_helpers.h
+++ b/tools/testing/selftests/bpf/bpf_helpers.h
@@ -246,7 +246,7 @@ static int (*bpf_skb_change_type)(void *ctx, __u32 type) =
 	(void *) BPF_FUNC_skb_change_type;
 static unsigned int (*bpf_get_hash_recalc)(void *ctx) =
 	(void *) BPF_FUNC_get_hash_recalc;
-static unsigned long long (*bpf_get_current_task)(void *ctx) =
+static unsigned long long (*bpf_get_current_task)(void) =
 	(void *) BPF_FUNC_get_current_task;
 static int (*bpf_skb_change_tail)(void *ctx, __u32 len, __u64 flags) =
 	(void *) BPF_FUNC_skb_change_tail;
-- 
2.20.1
