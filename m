From: ezequiel@collabora.com (Ezequiel Garcia)
Date: Wed,  1 Aug 2018 18:50:23 -0300
Subject: [PATCH v3 1/4] v4l2-mem2mem: Avoid v4l2_m2m_prepare_buf from
 scheduling a job
In-Reply-To: <20180801215026.27809-1-ezequiel@collabora.com>
References: <20180801215026.27809-1-ezequiel@collabora.com>
Message-ID: <20180801215026.27809-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180801215023.HOf2xo8yC_am0sRgN1JzvIXr6fje0rHxTBQXVmUMEdI@z>

There is no need for v4l2_m2m_prepare_buf to try to schedule a job,
as it only prepares a buffer, but does not queue or changes the
state of the queue.

Remove the call to v4l2_m2m_try_schedule from v4l2_m2m_prepare_buf.

Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0a93c5b173c2..efae845435c9 100644
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
