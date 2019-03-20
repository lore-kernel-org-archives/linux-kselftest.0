From: joel@joelfernandes.org (Joel Fernandes (Google))
Date: Wed, 20 Mar 2019 12:31:16 -0400
Subject: [PATCH v5 3/3] init/config: Do not select BUILD_BIN2C for IKCONFIG
In-Reply-To: <20190320163116.39275-1-joel@joelfernandes.org>
References: <20190320163116.39275-1-joel@joelfernandes.org>
Message-ID: <20190320163116.39275-3-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320163116.qfvlgNkP6PPUkqVKMCiJ0nCCtui0JY_N4M4CkbZvIj0@z>

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
2.21.0.225.g810b269d1ac-goog
