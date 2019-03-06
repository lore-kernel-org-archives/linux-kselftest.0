From: tobin@kernel.org (Tobin C. Harding)
Date: Thu,  7 Mar 2019 08:42:20 +1100
Subject: [PATCH v3 1/7] lib/test_printf: Add empty module_exit function
In-Reply-To: <20190306214226.14598-1-tobin@kernel.org>
References: <20190306214226.14598-1-tobin@kernel.org>
Message-ID: <20190306214226.14598-2-tobin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306214220.vfoTrWc7uZVvpvweW5HmK9Yr7Up0MxsKJFmOP53NcsE@z>

Currently the test_printf module does not have an exit function, this
prevents the module from being unloaded.  If we cannot unload the
module we cannot run the tests a second time.

Add an empty exit function.

Signed-off-by: Tobin C. Harding <tobin at kernel.org>
---
 lib/test_printf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/test_printf.c b/lib/test_printf.c
index 659b6cc0d483..601e8519319a 100644
--- a/lib/test_printf.c
+++ b/lib/test_printf.c
@@ -615,5 +615,11 @@ test_printf_init(void)
 
 module_init(test_printf_init);
 
+static void __exit test_printf_exit(void)
+{
+}
+
+module_exit(test_printf_exit);
+
 MODULE_AUTHOR("Rasmus Villemoes <linux at rasmusvillemoes.dk>");
 MODULE_LICENSE("GPL");
-- 
2.20.1
