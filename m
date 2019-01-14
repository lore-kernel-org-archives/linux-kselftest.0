From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:34 +0100
Subject: [PATCH 02/12] selftests: Fix output directory with O=
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-3-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135134.41guAJIGYbo6O6oPvJAmNT6jgx6cyfspi7PttXyKsnQ@z>

When building kselftest in a separate output directory, the individual
test directories end up in the root of the output directory, instead of
under tools/testing/selftests/.

Fix this by passing the expected path to the make subprocess.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 088059312237b5d5..ed7c1ea324e97ac2 100644
--- a/Makefile
+++ b/Makefile
@@ -1191,11 +1191,11 @@ endif
 
 PHONY += kselftest
 kselftest:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests O=$(abspath $(objtree)/tools/testing/selftests)
 
 PHONY += kselftest-clean
 kselftest-clean:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean O=$(abspath $(objtree)/tools/testing/selftests)
 
 PHONY += kselftest-merge
 kselftest-merge:
-- 
2.17.1
