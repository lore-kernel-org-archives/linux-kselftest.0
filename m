From: ezequiel@collabora.com (Ezequiel Garcia)
Date: Thu,  2 Aug 2018 17:48:46 -0300
Subject: [PATCH v4 2/6] v4l2-ioctl.c: simplify locking for m2m devices
In-Reply-To: <20180802204850.31633-1-ezequiel@collabora.com>
References: <20180802204850.31633-1-ezequiel@collabora.com>
Message-ID: <20180802204850.31633-3-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180802204846.WbTQI4JXsf2vX74jjY3V8lMajfpBmhLQfRAdhtHLkXo@z>

Now that the mutexes for output and capture vb2 queues match,
it is possible to refer to the context q_lock as the
m2m lock for a given m2m context.

Remove the output/capture lock selection.

Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 47 ++--------------------------
 1 file changed, 2 insertions(+), 45 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 54afc9c7ee6e..c46c455df652 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2677,45 +2677,6 @@ static bool v4l2_is_known_ioctl(unsigned int cmd)
 	return v4l2_ioctls[_IOC_NR(cmd)].ioctl == cmd;
 }
 
-#if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
-static bool v4l2_ioctl_m2m_queue_is_output(unsigned int cmd, void *arg)
-{
-	switch (cmd) {
-	case VIDIOC_CREATE_BUFS: {
-		struct v4l2_create_buffers *cbufs = arg;
-
-		return V4L2_TYPE_IS_OUTPUT(cbufs->format.type);
-	}
-	case VIDIOC_REQBUFS: {
-		struct v4l2_requestbuffers *rbufs = arg;
-
-		return V4L2_TYPE_IS_OUTPUT(rbufs->type);
-	}
-	case VIDIOC_QBUF:
-	case VIDIOC_DQBUF:
-	case VIDIOC_QUERYBUF:
-	case VIDIOC_PREPARE_BUF: {
-		struct v4l2_buffer *buf = arg;
-
-		return V4L2_TYPE_IS_OUTPUT(buf->type);
-	}
-	case VIDIOC_EXPBUF: {
-		struct v4l2_exportbuffer *expbuf = arg;
-
-		return V4L2_TYPE_IS_OUTPUT(expbuf->type);
-	}
-	case VIDIOC_STREAMON:
-	case VIDIOC_STREAMOFF: {
-		int *type = arg;
-
-		return V4L2_TYPE_IS_OUTPUT(*type);
-	}
-	default:
-		return false;
-	}
-}
-#endif
-
 static struct mutex *v4l2_ioctl_get_lock(struct video_device *vdev,
 					 struct v4l2_fh *vfh, unsigned int cmd,
 					 void *arg)
@@ -2725,12 +2686,8 @@ static struct mutex *v4l2_ioctl_get_lock(struct video_device *vdev,
 #if IS_ENABLED(CONFIG_V4L2_MEM2MEM_DEV)
 	if (vfh && vfh->m2m_ctx &&
 	    (v4l2_ioctls[_IOC_NR(cmd)].flags & INFO_FL_QUEUE)) {
-		bool is_output = v4l2_ioctl_m2m_queue_is_output(cmd, arg);
-		struct v4l2_m2m_queue_ctx *ctx = is_output ?
-			&vfh->m2m_ctx->out_q_ctx : &vfh->m2m_ctx->cap_q_ctx;
-
-		if (ctx->q.lock)
-			return ctx->q.lock;
+		if (vfh->m2m_ctx->q_lock)
+			return vfh->m2m_ctx->q_lock;
 	}
 #endif
 	if (vdev->queue && vdev->queue->lock &&
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
