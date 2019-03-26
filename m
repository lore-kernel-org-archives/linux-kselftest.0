From: joel at joelfernandes.org (Joel Fernandes (Google))
Date: Tue, 26 Mar 2019 15:24:09 -0400
Subject: [PATCH v2 2/4] rcutree: Add checks for dynticks counters in
 rcu_is_cpu_rrupt_from_idle
In-Reply-To: <20190326192411.198070-1-joel@joelfernandes.org>
References: <20190326192411.198070-1-joel@joelfernandes.org>
Message-ID: <20190326192411.198070-2-joel@joelfernandes.org>

In the future we would like to combine the dynticks and dynticks_nesting
counters thus leading to simplifying the code. At the moment we cannot
do that due to concerns about usermode upcalls appearing to RCU as half
of an interrupt. Byungchul tried to do it in [1] but the
"half-interrupt" concern was raised. It is half because, what RCU
expects is rcu_irq_enter() and rcu_irq_exit() pairs when the usermode
exception happens. However, only rcu_irq_enter() is observed. This
concern may not be valid anymore, but at least it used to be the case.

Out of abundance of caution, Paul added warnings [2] in the RCU code
which if not fired by 2021 may allow us to assume that such
half-interrupt scenario cannot happen any more, which can lead to
simplification of this code.

Summary of the changes are the following:

(1) In preparation for this combination of counters in the future, we
first need to first be sure that rcu_rrupt_from_idle cannot be called
from anywhere but a hard-interrupt because previously, the comments
suggested otherwise so let us be sure. We discussed this here [3]. We
use the services of lockdep to accomplish this.

(2) Further rcu_rrupt_from_idle() is not explicit about how it is using
the counters which can lead to weird future bugs. This patch therefore
makes it more explicit about the specific counter values being tested

(3) Lastly, we check for counter underflows just to be sure these are
not happening, because the previous code in rcu_rrupt_from_idle() was
allowing the case where the counters can underflow, and the function
would still return true. Now we are checking for specific values so let
us be confident by additional checking, that such underflows don't
happen. Any case, if they do, we should fix them and the screaming
warning is appropriate. All these checks checks are NOOPs if PROVE_RCU
and PROVE_LOCKING are disabled.

[1] https://lore.kernel.org/patchwork/patch/952349/
[2] Commit e11ec65cc8d6 ("rcu: Add warning to detect half-interrupts")
[3] https://lore.kernel.org/lkml/20190312150514.GB249405 at google.com/

Cc: byungchul.park at lge.com
Cc: kernel-team at android.com
Cc: rcu at vger.kernel.org
Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 kernel/rcu/tree.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 9180158756d2..dbff8a274c46 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -381,16 +381,29 @@ static void __maybe_unused rcu_momentary_dyntick_idle(void)
 }
 
 /**
- * rcu_is_cpu_rrupt_from_idle - see if idle or immediately interrupted from idle
+ * rcu_is_cpu_rrupt_from_idle - see if interrupted from idle
  *
- * If the current CPU is idle or running at a first-level (not nested)
+ * If the current CPU is idle and running at a first-level (not nested)
  * interrupt from idle, return true.  The caller must have at least
  * disabled preemption.
  */
 static int rcu_is_cpu_rrupt_from_idle(void)
 {
-	return __this_cpu_read(rcu_data.dynticks_nesting) <= 0 &&
-	       __this_cpu_read(rcu_data.dynticks_nmi_nesting) <= 1;
+	/* Called only from within the scheduling-clock interrupt */
+	lockdep_assert_in_irq();
+
+	/* Check for counter underflows */
+	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nesting) < 0,
+			 "RCU dynticks_nesting counter underflow!");
+	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nmi_nesting) <= 0,
+			 "RCU dynticks_nmi_nesting counter underflow/zero!");
+
+	/* Are we at first interrupt nesting level? */
+	if (__this_cpu_read(rcu_data.dynticks_nmi_nesting) != 1)
+		return false;
+
+	/* Does CPU appear to be idle from an RCU standpoint? */
+	return __this_cpu_read(rcu_data.dynticks_nesting) == 0;
 }
 
 #define DEFAULT_RCU_BLIMIT 10     /* Maximum callbacks per rcu_do_batch. */
-- 
2.21.0.392.gf8f6787159e-goog
