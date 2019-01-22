From: christophe.leroy at c-s.fr (Christophe Leroy)
Date: Tue, 22 Jan 2019 13:54:57 +0000 (UTC)
Subject: [PATCH] powerpc/selftest: fix type of mftb() in null_syscall
Message-ID: <3c3638c1ece313ad3fa0a850f9a98a635ebe688a.1548165236.git.christophe.leroy@c-s.fr>

All callers of mftb() expect 'unsigned long', and the function itself
only returns lower part of the TB so it really is 'unsigned long'
not 'unsigned long long'

Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
---
 tools/testing/selftests/powerpc/benchmarks/null_syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/null_syscall.c b/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
index ecc14d68e101..908de689a902 100644
--- a/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
+++ b/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
@@ -25,7 +25,7 @@ unsigned long long clock_frequency;
 unsigned long long timebase_frequency;
 double timebase_multiplier;
 
-static inline unsigned long long mftb(void)
+static inline unsigned long mftb(void)
 {
 	unsigned long low;
 
-- 
2.13.3
