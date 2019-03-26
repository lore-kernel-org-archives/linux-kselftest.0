From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Tue, 26 Mar 2019 15:24:08 -0400
Subject: [PATCH v2 1/4] lockdep: Add assertion to check if in an interrupt
Message-ID: <20190326192411.198070-1-joel@joelfernandes.org>

In rcu_rrupt_from_idle, we want to check if it is called from within an
interrupt, but want to do such checking only for debug builds. lockdep
already tracks when we enter an interrupt. Let us expose it as an
assertion macro so it can be used to assert this.

Suggested-by: Steven Rostedt <rostedt at goodmis.org>
Cc: kernel-team at android.com
Cc: rcu at vger.kernel.org
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>

---
 include/linux/lockdep.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index c5335df2372f..d24f564823d3 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -601,11 +601,18 @@ do {									\
 			  "IRQs not disabled as expected\n");		\
 	} while (0)
 
+#define lockdep_assert_in_irq() do {					\
+		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
+			  !current->hardirq_context,			\
+			  "Not in hardirq as expected\n");		\
+	} while (0)
+
 #else
 # define might_lock(lock) do { } while (0)
 # define might_lock_read(lock) do { } while (0)
 # define lockdep_assert_irqs_enabled() do { } while (0)
 # define lockdep_assert_irqs_disabled() do { } while (0)
+# define lockdep_assert_in_irq() do { } while (0)
 #endif
 
 #ifdef CONFIG_LOCKDEP
-- 
2.21.0.392.gf8f6787159e-goog
