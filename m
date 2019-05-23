From: oleg@redhat.com (Oleg Nesterov)
Date: Thu, 23 May 2019 18:20:05 +0200
Subject: [PATCH v2 1/2] open: add close_range()
In-Reply-To: <20190523154747.15162-2-christian@brauner.io>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-2-christian@brauner.io>
Message-ID: <20190523162004.GC23070@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523162005.Li9TfqHgEilAq34Z07l2vtlmMH9q9C8ERE6tzbCZt7w@z>

On 05/23, Christian Brauner wrote:
>
> +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> +{
> +	unsigned int cur_max;
> +
> +	if (fd > max_fd)
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	cur_max = files_fdtable(files)->max_fds;
> +	rcu_read_unlock();
> +
> +	/* cap to last valid index into fdtable */
> +	max_fd = max(max_fd, (cur_max - 1));
                 ^^^

Hmm. min() ?

Oleg.
