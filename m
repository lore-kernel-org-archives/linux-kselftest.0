Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26EE38E108
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771934973; cv=none; b=XB5+IdOlRQuoU0YK6adIfw7SL5JIJZfMofRJ5asd+UtctIrZH2/VlKA7H/2BNsEw2yx3gP42woTHjPR9+8j3IqPvX5ZB3ccIUVzdpOMaHUtQUnrqDB/8pw3JccNmVaYAPDvuc8lMIpvrRjvcmQGNaIFfbKXZdz1IOLGvR0b5QRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771934973; c=relaxed/simple;
	bh=g/pIDynk3fPG+RKWwmd41DN+mP8lsh6HXGTPBcOnqfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTrkSXJnM6BGcvFwaYt6GlT0ugMNPgT8ZMMMtMp+DHyHUnnGJ5v5njGAHkmlsyv/CHNYrx/a97OxA6HvARatQz+Yj66lkHK6x80nuUkL/3I50Hd1d58lsNUZ+i4ePvhM6FbqsPXtBqcv2U+D+m78exIfMuys4e28BLJwkFXiZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YM3GefOx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YM3GefOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771934970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PTr9nXa9KbUpiMsj0WnWMiP0h7dOygixjZL8t8aHz0g=;
	b=YM3GefOxoe1o2vOuE4SwDig9dFsr/CQVt1uzyUFoE5vx+Z346aRd4mY9vGfa1YVMnxjpce
	yr34g+fO3C6KAsn35krSeyx6n12yvPCUTr8NMSF917P2xhMPCwHDp8gvgly+2lowfwZoD1
	3u7Ho4vLpsn2YAh8e3HOCodG3Lqy8fE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-2sEWge5BN8--rE-jKOcfZQ-1; Tue,
 24 Feb 2026 07:09:25 -0500
X-MC-Unique: 2sEWge5BN8--rE-jKOcfZQ-1
X-Mimecast-MFC-AGG-ID: 2sEWge5BN8--rE-jKOcfZQ_1771934963
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2F241956067;
	Tue, 24 Feb 2026 12:09:21 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2484830001BB;
	Tue, 24 Feb 2026 12:09:14 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 24 Feb 2026 13:09:21 +0100 (CET)
Date: Tue, 24 Feb 2026 13:09:13 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH v2 1/2] pid_namespace: allow opening pid_for_children
 before init was created
Message-ID: <aZ2U6TwK7rQtkTvT@redhat.com>
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
 <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 02/23, Pavel Tikhomirov wrote:
>
> To avoid possible problems related to cpu/compiler optimizations around
> ->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
> everywhere we write it and use READ_ONCE everywhere we read it without
> explicit lock.

Yes, this is what I meant... but I can never recall if READ_ONCE() alone
is enough to make KCSAN happy...

I won't insist, but I think it would be better to do this in a separate
change for documenation purposes and for discussion.

> @@ -247,8 +247,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
>  			 * alreay in use. Return EEXIST in that case.
>  			 */
>  			if (nr == -ENOSPC)
> -
>  				nr = -EEXIST;
> +		} else if (!READ_ONCE(tmp->child_reaper) && idr_get_cursor(&tmp->idr) != 0) {
> +			nr = -EINVAL;
>  		} else {

Oh, this doesn't look clear/clean... This even looks racy even if it is not.
Can you move this check into the "else" branch which does another get_cursor
and unify this check with the RESERVED_PIDS check?

Either way, I don't like the fact we check ->child_reaper != NULL twice.
Perhaps something like the preparational patch below makes sense ? Not
sure this is actually better...

Oleg.

--- x/kernel/pid.c
+++ x/kernel/pid.c
@@ -215,12 +215,6 @@ struct pid *alloc_pid(struct pid_namespa
 			retval = -EINVAL;
 			if (tid < 1 || tid >= pid_max[ns->level - i])
 				goto out_abort;
-			/*
-			 * Also fail if a PID != 1 is requested and
-			 * no PID 1 exists.
-			 */
-			if (tid != 1 && !tmp->child_reaper)
-				goto out_abort;
 			retval = -EPERM;
 			if (!checkpoint_restore_ns_capable(tmp->user_ns))
 				goto out_abort;
@@ -299,6 +293,11 @@ struct pid *alloc_pid(struct pid_namespa
 		tmp = tmp->parent;
 		i--;
 		retried_preload = false;
+
+		if (!READ_ONCE(tmp->child_reaper) && nr != 1) {
+			retval = -EINVAL;
+			goto out_free;
+		}
 	}
 
 	/*

