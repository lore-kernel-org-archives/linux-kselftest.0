From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:42 +0100
Subject: [PATCH 10/12] selftests: intel_pstate: Remove unused header
 dependency rule
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-11-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135142.CHlxMsIN1oHhgvXABNNwG8Jc1rWJe93l03b8XvZf_Yc@z>

The intel_pstate test doesn't contain any header files, so there is no
need to declare a rule for header dependencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 tools/testing/selftests/intel_pstate/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 7340fd6a9a9f2cbd..3f51f9226286f661 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -12,5 +12,3 @@ endif
 TEST_PROGS := run.sh
 
 include ../lib.mk
-
-$(TEST_GEN_FILES): $(HEADERS)
-- 
2.17.1
