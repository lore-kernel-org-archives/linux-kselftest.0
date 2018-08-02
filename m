From: ezequiel at collabora.com (Ezequiel Garcia)
Date: Thu,  2 Aug 2018 17:48:47 -0300
Subject: [PATCH v4 3/6] v4l2-mem2mem: Avoid v4l2_m2m_prepare_buf from
 scheduling a job
In-Reply-To: <20180802204850.31633-1-ezequiel@collabora.com>
References: <20180802204850.31633-1-ezequiel@collabora.com>
Message-ID: <20180802204850.31633-4-ezequiel@collabora.com>

There is no need for v4l2_m2m_prepare_buf to try to schedule a job,
as it only prepares a buffer, but does not queue or changes the
state of the queue.

Remove the call to v4l2_m2m_try_schedule from v4l2_m2m_prepare_buf.

Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index b7005894292c..6bdbdbfa8e6c 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -481,14 +481,9 @@ int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			 struct v4l2_buffer *buf)
 {
 	struct vb2_queue *vq;
-	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
-	ret = vb2_prepare_buf(vq, buf);
-	if (!ret)
-		v4l2_m2m_try_schedule(m2m_ctx);
-
-	return ret;
+	return vb2_prepare_buf(vq, buf);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_prepare_buf);
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
