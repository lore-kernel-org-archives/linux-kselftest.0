From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Thu, 2 Aug 2018 10:02:05 +0200
Subject: [PATCH v3 3/4] v4l2-mem2mem: Avoid calling .device_run in
 v4l2_m2m_job_finish
In-Reply-To: <20180801215026.27809-4-ezequiel@collabora.com>
References: <20180801215026.27809-1-ezequiel@collabora.com>
 <20180801215026.27809-4-ezequiel@collabora.com>
Message-ID: <4dd7aafd-67cb-8f74-9b9f-9b880ca9888e@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180802080205.pT-mNEuaOQ15aF1gTRVuCJX_8qYQzh2IP1OAhCgeymc@z>

On 08/01/2018 11:50 PM, Ezequiel Garcia wrote:
> v4l2_m2m_job_finish() is typically called in interrupt context.
> 
> Some implementation of .device_run might sleep, and so it's
> desirable to avoid calling it directly from
> v4l2_m2m_job_finish(), thus avoiding .device_run from running
> in interrupt context.
> 
> Implement a deferred context that calls v4l2_m2m_try_run,
> and gets scheduled by v4l2_m2m_job_finish().
> 
> Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 36 +++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index da82d151dd20..0bf4deefa899 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -69,6 +69,7 @@ static const char * const m2m_entity_name[] = {
>   * @curr_ctx:		currently running instance
>   * @job_queue:		instances queued to run
>   * @job_spinlock:	protects job_queue
> + * @job_work:		worker to run queued jobs.
>   * @m2m_ops:		driver callbacks
>   */
>  struct v4l2_m2m_dev {
> @@ -85,6 +86,7 @@ struct v4l2_m2m_dev {
>  
>  	struct list_head	job_queue;
>  	spinlock_t		job_spinlock;
> +	struct work_struct	job_work;
>  
>  	const struct v4l2_m2m_ops *m2m_ops;
>  };
> @@ -224,10 +226,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  /**
>   * v4l2_m2m_try_run() - select next job to perform and run it if possible
>   * @m2m_dev: per-device context
> + * @try_lock: indicates if the queue lock should be taken

I don't like this bool. See more below.

>   *
>   * Get next transaction (if present) from the waiting jobs list and run it.
>   */
> -static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> +static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev, bool try_lock)
>  {
>  	unsigned long flags;
>  
> @@ -250,7 +253,20 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>  
>  	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> +
> +	/*
> +	 * A m2m context lock is taken only after a m2m context
> +	 * is picked from the queue and marked as running.
> +	 * The lock is only needed if v4l2_m2m_try_run is called
> +	 * from the async worker.
> +	 */
> +	if (try_lock && m2m_dev->curr_ctx->q_lock)
> +		mutex_lock(m2m_dev->curr_ctx->q_lock);
> +
>  	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +
> +	if (try_lock && m2m_dev->curr_ctx->q_lock)
> +		mutex_unlock(m2m_dev->curr_ctx->q_lock);
>  }
>  
>  /*
> @@ -340,10 +356,22 @@ void v4l2_m2m_try_schedule(struct v4l2_m2m_ctx *m2m_ctx)
>  	struct v4l2_m2m_dev *m2m_dev = m2m_ctx->m2m_dev;
>  
>  	__v4l2_m2m_try_queue(m2m_dev, m2m_ctx);
> -	v4l2_m2m_try_run(m2m_dev);
> +	v4l2_m2m_try_run(m2m_dev, false);

I would like to see a WARN_ON where you verify that q_lock is actually locked
(and this needs to be documented as well).

>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_try_schedule);
>  
> +/**
> + * v4l2_m2m_device_run_work() - run pending jobs for the context
> + * @work: Work structure used for scheduling the execution of this function.
> + */
> +static void v4l2_m2m_device_run_work(struct work_struct *work)
> +{
> +	struct v4l2_m2m_dev *m2m_dev =
> +		container_of(work, struct v4l2_m2m_dev, job_work);
> +
> +	v4l2_m2m_try_run(m2m_dev, true);

Just lock q_lock here around the try_run call. That's consistent with how
try_schedule works. No need to add an extra argument to try_run.

> +}
> +
>  /**
>   * v4l2_m2m_cancel_job() - cancel pending jobs for the context
>   * @m2m_ctx: m2m context with jobs to be canceled
> @@ -403,7 +431,8 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  	/* This instance might have more buffers ready, but since we do not
>  	 * allow more than one job on the job_queue per instance, each has
>  	 * to be scheduled separately after the previous one finishes. */
> -	v4l2_m2m_try_schedule(m2m_ctx);
> +	__v4l2_m2m_try_queue(m2m_dev, m2m_ctx);
> +	schedule_work(&m2m_dev->job_work);

You might want to add a comment here explaining why you need 'work' here.

>  }
>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
>  
> @@ -837,6 +866,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
>  	m2m_dev->m2m_ops = m2m_ops;
>  	INIT_LIST_HEAD(&m2m_dev->job_queue);
>  	spin_lock_init(&m2m_dev->job_spinlock);
> +	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
>  
>  	return m2m_dev;
>  }
> 

Regarding q_lock: I would like to see that made compulsory. So v4l2_mem2mem should check
that both queue lock pointers point to the same mutex and return an error if that's not
the case (I believe all m2m drivers use the same mutex already).

Also make sure that there are no drivers that set q_lock explicitly (mtk-vcodec does).

That way q_lock can be safely used here.

This will also allow us to simplify v4l2_ioctl_get_lock() in v4l2-ioctl.c:
v4l2_ioctl_m2m_queue_is_output() can be dropped since the lock for capture
and output is now the same.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
