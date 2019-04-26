From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Fri, 26 Apr 2019 15:04:30 -0400
Subject: [PATCH v7 resend 2/2] init/config: Do not select BUILD_BIN2C for
 IKCONFIG
In-Reply-To: <20190426190430.172543-1-joel@joelfernandes.org>
References: <20190426190430.172543-1-joel@joelfernandes.org>
Message-ID: <20190426190430.172543-2-joel@joelfernandes.org>

Since commit 13610aa908dc ("kernel/configs: use .incbin directive to
embed config_data.gz"), IKCONFIG no longer uses BUILD_BIN2C so prevent
it from being selected in Kconfig.

Reviewed-by: Masahiro Yamada <yamada.masahiro at socionext.com>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 47c0db6e63a5..26a364a95b57 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -562,7 +562,6 @@ config BUILD_BIN2C
 
 config IKCONFIG
 	tristate "Kernel .config support"
-	select BUILD_BIN2C
 	---help---
 	  This option enables the complete Linux kernel ".config" file
 	  contents to be saved in the kernel. It provides documentation
-- 
2.21.0.593.g511ec345e18-goog
