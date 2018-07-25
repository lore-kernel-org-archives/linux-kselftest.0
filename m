From: ezequiel at collabora.com (Ezequiel Garcia)
Date: Wed, 25 Jul 2018 14:15:13 -0300
Subject: [PATCH v2 2/5] v4l2-mem2mem: Avoid v4l2_m2m_prepare_buf from
 scheduling a job
In-Reply-To: <20180725171516.11210-1-ezequiel@collabora.com>
References: <20180725171516.11210-1-ezequiel@collabora.com>
Message-ID: <20180725171516.11210-3-ezequiel@collabora.com>

There is no need for v4l2_m2m_prepare_buf to try to schedule a job,
as it only prepares a buffer, but does not queue or changes the
state of the queue.

Remove the call to v4l2_m2m_try_schedule from v4l2_m2m_prepare_buf.

Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index dfd796621b06..69a91c0030be 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -439,14 +439,9 @@ int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
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
