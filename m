Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42534F259
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771774719; cv=none; b=SGlWSTpuGiF6YHytXDhBlP+yt2QmhsTWYEYkLMLXIjrIOCRid+PhNQjh1UXcY5qWFgwrRS8wzKT9tLBjJOzfq8Vz1itlApvW3tFEv3YRfhnNCLd9LvPmW8umkcY8poU/FXcReBeSuNQkvtfPByuFaUDUUx65YTbsxOXIcPLTvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771774719; c=relaxed/simple;
	bh=gokw9VKswMNmDkG640UqNZUw5Y4isY0FCdwYm44ip2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSQU4Z+ALX0KbmkGtHf1CfsGpXqIuab+SDmd+sUE2utSyVxvDmit5KfsQBL+NXGXE7jsDdzRxxEVPwbQncgoduEKAyGAsq+F82IzuJp+zCFZLEQvQwQe6O2sUKb+D0kmanicpdzjciUbhLMDT1Oq9A01muCwxEw+Vb+Bd8wLAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDuFPeOP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDuFPeOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771774716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVwf0mUY9YEcprI5Bl/Pa4G3ZzYnRp/WR44iIwoXjv4=;
	b=HDuFPeOPgKpRTAZFCAj8xjMGIss69U85hFyexRrJn2KlQiffd41/CpmpyFVKNvzAdHBBNR
	3NN/iqDNTkle07J7TIrCgAU+dsOgkQyKsAmBebin9xX7KcKk78Yh2ocCExumDihSZr8oa+
	fe+8hrwDkHzpKBI3i5Xxf8vvYJm4XLI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-267-Kbx0EiyrN9SalzJk7UU-Jg-1; Sun,
 22 Feb 2026 10:38:33 -0500
X-MC-Unique: Kbx0EiyrN9SalzJk7UU-Jg-1
X-Mimecast-MFC-AGG-ID: Kbx0EiyrN9SalzJk7UU-Jg_1771774711
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E99C19560B7;
	Sun, 22 Feb 2026 15:38:31 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3C68219560A7;
	Sun, 22 Feb 2026 15:38:26 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 22 Feb 2026 16:38:31 +0100 (CET)
Date: Sun, 22 Feb 2026 16:38:25 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] pid_namespace: allow opening pid_for_children before
 init was created
Message-ID: <aZsi8Z4Y2qqpdZGH@redhat.com>
References: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
 <20260220164559.2465466-2-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220164559.2465466-2-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Pavel,

Your patch doesn't apply to Linus's tree.

and in any case... can you avoid read_lock(tasklist) in alloc_pid() ?
This is really not good.

Oleg.

On 02/20, Pavel Tikhomirov wrote:
>
> This effectively gives us an ability to create the pid namespace init as
> a child of the process (setns-ed to the pid namespace) different to the
> process which created the pid namespace itself.
> 
> Original problem:
> 
> There is a cool set_tid feature in clone3() syscall, it allows you to
> create process with desired pids on multiple pid namespace levels. Which
> is useful to restore processes in CRIU for nested pid namespace case.
> 
> In nested container case we can potentially see this kind of pid/user
> namespace tree:
> 
>                             Process
>                           ┌─────────┐
>     User NS0 ──▶ Pid NS0 ──▶ Pid p0 │
>         │           │     │         │
>         ▼           ▼     │         │
>     User NS1 ──▶ Pid NS1 ──▶ Pid p1 │
>         │           │     │         │
>        ...         ...    │   ...   │
>         │           │     │         │
>         ▼           ▼     │         │
>     User NSn ──▶ Pid NSn ──▶ Pid pn │
>                           └─────────┘
> 
> So to create the "Process" and set pids {p0, p1, ... pn} for it on all
> pid namespace levels we can use clone3() syscall set_tid feature, BUT
> the syscall does not allow you to set pid on pid namespace levels you
> don't have permission to. So basically you have to be in "User NS0" when
> creating the "Process" to actually be able to set pids on all levels.
> 
> It is ok for almost any process, but with pid namespace init this does
> not work, as currently we can only create pid namespace init and the pid
> namespace itself simultaneously, so to make "Pid NSn" owned by "User
> NSn" we have to be in the "User NSn".
> 
> We can't possibly be in "User NS0" and "User NSn" at the same time,
> hence the problem.
> 
> Alternative solution:
> 
> Yes, for the case of pid namespace init we can use old and gold
> /proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
> it is much more complicated and introduces tons of extra code to do. It
> would be nice to make clone3() set_tid interface also aplicable to this
> corner case.
> 
> Implementation:
> 
> Now when anyone can setns to the pid namespace before the creation of
> init, and thus multiple processes can fork children to the pid
> namespace, we enforce that the first process created is always the init,
> and only allow other processes after the init passed the same steps as
> were previously required to allow to do setns.
> 
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
>  kernel/pid.c           | 10 +++++++++-
>  kernel/pid_namespace.c |  9 ---------
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/pid.c b/kernel/pid.c
> index a31771bc89c1..d549f08036ab 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -188,9 +188,15 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  	pid->level = ns->level;
>  
>  	for (i = ns->level; i >= 0; i--) {
> +		bool pidns_ready = true;
>  		int tid = 0;
>  		int pid_max = READ_ONCE(tmp->pid_max);
>  
> +		read_lock(&tasklist_lock);
> +		if (!tmp->child_reaper)
> +			pidns_ready = false;
> +		read_unlock(&tasklist_lock);
> +
>  		if (set_tid_size) {
>  			tid = set_tid[ns->level - i];
>  
> @@ -201,7 +207,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  			 * Also fail if a PID != 1 is requested and
>  			 * no PID 1 exists.
>  			 */
> -			if (tid != 1 && !tmp->child_reaper)
> +			if (tid != 1 && !pidns_ready)
>  				goto out_free;
>  			retval = -EPERM;
>  			if (!checkpoint_restore_ns_capable(tmp->user_ns))
> @@ -221,6 +227,8 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  			 */
>  			if (nr == -ENOSPC)
>  				nr = -EEXIST;
> +		} else if (!pidns_ready && idr_get_cursor(&tmp->idr) != 0) {
> +			nr = -EINVAL;
>  		} else {
>  			int pid_min = 1;
>  			/*
> diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
> index e48f5de41361..d36afc58ee1d 100644
> --- a/kernel/pid_namespace.c
> +++ b/kernel/pid_namespace.c
> @@ -369,15 +369,6 @@ static struct ns_common *pidns_for_children_get(struct task_struct *task)
>  	}
>  	task_unlock(task);
>  
> -	if (ns) {
> -		read_lock(&tasklist_lock);
> -		if (!ns->child_reaper) {
> -			put_pid_ns(ns);
> -			ns = NULL;
> -		}
> -		read_unlock(&tasklist_lock);
> -	}
> -
>  	return ns ? &ns->ns : NULL;
>  }
>  
> -- 
> 2.53.0
> 

