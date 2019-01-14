From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 14 Jan 2019 14:51:35 +0100
Subject: [PATCH 03/12] selftests: Fix header install directory with O=
In-Reply-To: <20190114135144.26096-1-geert+renesas@glider.be>
References: <20190114135144.26096-1-geert+renesas@glider.be>
Message-ID: <20190114135144.26096-4-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190114135135.NYp_aA41Eul-vOmAivvI0_aHeWn3n4lRzq8_Sqti54M@z>

When building kselftest in a separate output directory, the kernel
headers are still installed in the source directory, instead of in the
specified output directory.

Fix this by passing the expected path to the make subprocess.

Signed-off-by: Geert Uytterhoeven <geert+renesas at glider.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ed7c1ea324e97ac2..5355033dda6ed1ea 100644
--- a/Makefile
+++ b/Makefile
@@ -1191,7 +1191,7 @@ endif
 
 PHONY += kselftest
 kselftest:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests O=$(abspath $(objtree)/tools/testing/selftests)
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests O=$(abspath $(objtree)/tools/testing/selftests) INSTALL_HDR_PATH=$(abspath $(INSTALL_HDR_PATH))
 
 PHONY += kselftest-clean
 kselftest-clean:
-- 
2.17.1
