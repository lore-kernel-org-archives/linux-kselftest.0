From: ezequiel at collabora.com (Ezequiel Garcia)
Date: Thu,  2 Aug 2018 17:48:45 -0300
Subject: [PATCH v4 1/6] mem2mem: Require capture and output mutexes to match
In-Reply-To: <20180802204850.31633-1-ezequiel@collabora.com>
References: <20180802204850.31633-1-ezequiel@collabora.com>
Message-ID: <20180802204850.31633-2-ezequiel@collabora.com>

Currently, all the mem2mem driver either use a single mutex
to lock the capture and output videobuf2 queues, or don't
set any mutex.

This means the mutexes match, and so the mem2mem framework
is able to set the m2m context lock.

Enforce this by making it mandatory for drivers to set
the same capture and output mutex, or not set any mutex at all.

Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0a93c5b173c2..b7005894292c 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -887,12 +887,14 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
 	if (ret)
 		goto err;
 	/*
-	 * If both queues use same mutex assign it as the common buffer
-	 * queues lock to the m2m context. This lock is used in the
-	 * v4l2_m2m_ioctl_* helpers.
+	 * Both queues should use same the mutex to lock the m2m context.
+	 * This lock is used in some v4l2_m2m_* helpers.
 	 */
-	if (out_q_ctx->q.lock == cap_q_ctx->q.lock)
-		m2m_ctx->q_lock = out_q_ctx->q.lock;
+	if (WARN_ON(out_q_ctx->q.lock != cap_q_ctx->q.lock)) {
+		ret = -EINVAL;
+		goto err;
+	}
+	m2m_ctx->q_lock = out_q_ctx->q.lock;
 
 	return m2m_ctx;
 err:
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
