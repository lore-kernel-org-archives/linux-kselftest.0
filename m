From: joelaf at google.com (Joel Fernandes)
Date: Tue, 29 May 2018 17:04:54 -0700
Subject: [PATCH v8 2/8] srcu: Add notrace variants of srcu_read_{lock,unlock}
In-Reply-To: <20180530000500.257225-1-joel@joelfernandes.org>
References: <20180530000500.257225-1-joel@joelfernandes.org>
Message-ID: <20180530000500.257225-3-joel@joelfernandes.org>

From: Paul McKenney <paulmck at linux.vnet.ibm.com>

This is needed for a future tracepoint patch that uses srcu, and to make
sure it doesn't call into lockdep.

tracepoint code already calls notrace variants for rcu_read_lock_sched
so this patch does the same for srcu which will be used in a later
patch. Keeps it consistent with rcu-sched.

[Joel: Added commit message]
Reviewed-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
Signed-off-by: Paul McKenney <paulmck at linux.vnet.ibm.com>
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 include/linux/srcu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index 33c1c698df09..2ec618979b20 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -161,6 +161,16 @@ static inline int srcu_read_lock(struct srcu_struct *sp) __acquires(sp)
 	return retval;
 }
 
+/* Used by tracing, cannot be traced and cannot invoke lockdep. */
+static inline notrace int
+srcu_read_lock_notrace(struct srcu_struct *sp) __acquires(sp)
+{
+	int retval;
+
+	retval = __srcu_read_lock(sp);
+	return retval;
+}
+
 /**
  * srcu_read_unlock - unregister a old reader from an SRCU-protected structure.
  * @sp: srcu_struct in which to unregister the old reader.
@@ -175,6 +185,13 @@ static inline void srcu_read_unlock(struct srcu_struct *sp, int idx)
 	__srcu_read_unlock(sp, idx);
 }
 
+/* Used by tracing, cannot be traced and cannot call lockdep. */
+static inline notrace void
+srcu_read_unlock_notrace(struct srcu_struct *sp, int idx) __releases(sp)
+{
+	__srcu_read_unlock(sp, idx);
+}
+
 /**
  * smp_mb__after_srcu_read_unlock - ensure full ordering after srcu_read_unlock
  *
-- 
2.17.0.921.gf22659ad46-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
