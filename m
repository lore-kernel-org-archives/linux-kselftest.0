From: penghao122@sina.com.cn (Peng Hao)
Date: Wed, 17 Oct 2018 09:41:25 -0400
Subject: [PATCH]  selftest/bpf : file resource leak
Message-ID: <1539783685-5549-1-git-send-email-penghao122@sina.com.cn>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017134125.C-qwNW_-VIQBfo_XOJZaHdFdmXvuKtBVFVgcFG3_2Xs@z>


From: Peng Hao <peng.hao2@zte.com.cn>

FILE pointer variable f is opened but never closed.

Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
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
