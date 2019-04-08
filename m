From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Mon,  8 Apr 2019 17:28:55 -0400
Subject: [PATCH v6 2/2] init/config: Do not select BUILD_BIN2C for IKCONFIG
In-Reply-To: <20190408212855.233198-1-joel@joelfernandes.org>
References: <20190408212855.233198-1-joel@joelfernandes.org>
Message-ID: <20190408212855.233198-2-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408212855.oaHuVdVahPx5Zf6HI6focI2IIb-TNpSb3Xw4b22Lewk@z>

Since commit 13610aa908dc ("kernel/configs: use .incbin directive to
embed config_data.gz"), IKCONFIG no longer uses BUILD_BIN2C so prevent
it from being selected in Kconfig.

Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index ea75bfbf7dfa..ffcb2f90543f 100644
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
2.21.0.392.gf8f6787159e-goog
