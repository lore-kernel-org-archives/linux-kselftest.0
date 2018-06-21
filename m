From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 21 Jun 2018 15:32:31 -0700
Subject: [PATCH v9 2/7] srcu: Add notrace variant of srcu_dereference
In-Reply-To: <20180621223236.211495-1-joel@joelfernandes.org>
References: <20180621223236.211495-1-joel@joelfernandes.org>
Message-ID: <20180621223236.211495-3-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180621223231.aiu2dxQA2OfkPiKJiIWkQ56crqwLROopN6CdziXPTro@z>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

In the last patch in this series, we are making lockdep register hooks
onto the irq_{disable,enable} tracepoints. These tracepoints use the
_rcuidle tracepoint variant. In this series we switch the _rcuidle
tracepoint callers to use SRCU instead of sched-RCU. Inorder to
dereference the pointer to the probe functions, we could call
srcu_dereference, however this API will call back into lockdep to check
if the lock is held *before* the lockdep probe hooks have a chance to
run and annotate the IRQ enabled/disabled state.

For this reason we need a notrace variant of srcu_dereference since
otherwise we get lockdep splats. This patch adds the needed
srcu_dereference_notrace variant.

Reviewed-by: Paul E. McKenney <paulmck at linux.vnet.ibm.com>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 include/linux/srcu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index 3e72a291c401..67135d4a8a30 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -169,6 +169,11 @@ static inline int srcu_read_lock_held(const struct srcu_struct *sp)
  */
 #define srcu_dereference(p, sp) srcu_dereference_check((p), (sp), 0)
 
+/**
+ * srcu_dereference_notrace - no tracing and no lockdep calls from here
+ */
+#define srcu_dereference_notrace(p, sp) srcu_dereference_check((p), (sp), 1)
+
 /**
  * srcu_read_lock - register a new reader for an SRCU-protected structure.
  * @sp: srcu_struct in which to register the new reader.
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
