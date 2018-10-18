From: peng.hao2 at zte.com.cn (Peng Hao)
Date: Thu, 18 Oct 2018 23:18:36 +0800
Subject: [PATCH bpf-next]  selftests/bpf: fix file resource leak
Message-ID: <1539875916-28560-1-git-send-email-peng.hao2@zte.com.cn>

FILE pointer variable f is opened but never closed.

Signed-off-by:Peng Hao <peng.hao2 at zte.com.cn>
---
 tools/testing/selftests/bpf/trace_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index cabe2a3..a3d1dac 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -41,6 +41,7 @@ int load_kallsyms(void)
 		syms[i].name = strdup(func);
 		i++;
 	}
+	fclose(f);
 	sym_cnt = i;
 	qsort(syms, sym_cnt, sizeof(struct ksym), ksym_cmp);
 	return 0;
-- 
1.8.3.1
