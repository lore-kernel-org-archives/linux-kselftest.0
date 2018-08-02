From: ezequiel@collabora.com (Ezequiel Garcia)
Date: Thu,  2 Aug 2018 17:48:48 -0300
Subject: [PATCH v4 4/6] v4l2-mem2mem: Simplify exiting the function in
 __v4l2_m2m_try_schedule
In-Reply-To: <20180802204850.31633-1-ezequiel@collabora.com>
References: <20180802204850.31633-1-ezequiel@collabora.com>
Message-ID: <20180802204850.31633-5-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180802204848.dB_8qwA6-uC8K7R_doHtlaKyxK6LEGHkama-syWVDmg@z>

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The __v4l2_m2m_try_schedule function acquires and releases multiple
spinlocks. Simplify unlocking the job lock by adding labels to unlock
the lock and exit the function.

Signed-off-by: Sakari Ailus <sakari.ailus at linux.intel.com>
Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 29 ++++++++++++--------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 6bdbdbfa8e6c..04e2c8357863 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -279,51 +279,48 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
 
 	/* If the context is aborted then don't schedule it */
 	if (m2m_ctx->job_flags & TRANS_ABORT) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("Aborted context\n");
-		return;
+		goto job_unlock;
 	}
 
 	if (m2m_ctx->job_flags & TRANS_QUEUED) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("On job queue already\n");
-		return;
+		goto job_unlock;
 	}
 
 	spin_lock_irqsave(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
 	if (list_empty(&m2m_ctx->out_q_ctx.rdy_queue)
 	    && !m2m_ctx->out_q_ctx.buffered) {
-		spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock,
-					flags_out);
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("No input buffers available\n");
-		return;
+		goto out_unlock;
 	}
 	spin_lock_irqsave(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
 	if (list_empty(&m2m_ctx->cap_q_ctx.rdy_queue)
 	    && !m2m_ctx->cap_q_ctx.buffered) {
-		spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock,
-					flags_cap);
-		spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock,
-					flags_out);
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("No output buffers available\n");
-		return;
+		goto cap_unlock;
 	}
 	spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
 	spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
 
 	if (m2m_dev->m2m_ops->job_ready
 		&& (!m2m_dev->m2m_ops->job_ready(m2m_ctx->priv))) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 		dprintk("Driver not ready\n");
-		return;
+		goto job_unlock;
 	}
 
 	list_add_tail(&m2m_ctx->queue, &m2m_dev->job_queue);
 	m2m_ctx->job_flags |= TRANS_QUEUED;
 
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
+	return;
+
+cap_unlock:
+	spin_unlock_irqrestore(&m2m_ctx->cap_q_ctx.rdy_spinlock, flags_cap);
+out_unlock:
+	spin_unlock_irqrestore(&m2m_ctx->out_q_ctx.rdy_spinlock, flags_out);
+job_unlock:
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 }
 
 /**
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
