Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F51372B28
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772010415; cv=none; b=lvY/sq06iw+oexxgz+uhztjm881URJRKLOMs09d/h/8PO4pcefhj/TeS2f3TRVoNGWKWK0ecZvy1SC69NY3n22FMbpGKizgKTwxdPZ9F68/oEtZIukrOmy5FLxMRkphxDUxb1Jp6DqjP2+YMvByaQTGfaiSBCb4y6BjtkR/ycZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772010415; c=relaxed/simple;
	bh=O0DRB/Iug654IDwh9fcomOd21KMpdimZxp5YnPRDZWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3rgWXCuLIg/3mbvECSIgjYOmB+qhhylT/q4ycoQaWSjMkJTPtm6ShHGYnS629oX4ifzXsj8jfgdckzkvzWzQfEGHZOKVpDPnUKSMFC/a/yWl+gozDrgYquSTyJ1K87oaSv2kqWn4QQKkVRZjn0ta96Q+mmtwt6mpaNP5B59vhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PvUihXvx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PvUihXvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772010411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RliNJDMPHzMaCR4/F0Oj9BKYQtfjCgzIq+mkuXnfmjk=;
	b=PvUihXvxMngPOlexf2Q1r4sPkcWTa3Od6zfjgG1LGOtEH6D8INaePdKGFuXzRGaNOiX2zR
	h43vAHFsEW304ri6CSh3XPD7OZ7Lt4QjUFT900ZfXDYLlzgmiFTaxv1HzZkWHQrAZHoEQT
	0I8JoxP1D09Q8AOEueIFmQr0dXQ7wxA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-6nbU5-zRMO2AiVEw27LReQ-1; Wed,
 25 Feb 2026 04:06:47 -0500
X-MC-Unique: 6nbU5-zRMO2AiVEw27LReQ-1
X-Mimecast-MFC-AGG-ID: 6nbU5-zRMO2AiVEw27LReQ_1772010405
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7ACCB1956068;
	Wed, 25 Feb 2026 09:06:44 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B05BB1800352;
	Wed, 25 Feb 2026 09:06:37 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 10:06:44 +0100 (CET)
Date: Wed, 25 Feb 2026 10:06:35 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrei Vagin <avagin@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
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
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pid: check init is created first after idr alloc
Message-ID: <aZ67mwBEbRtdaWp2@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 02/24, Andrei Vagin wrote:
>
> On Tue, Feb 24, 2026 at 9:02 AM Pavel Tikhomirov
> <ptikhomirov@virtuozzo.com> wrote:
> >
> > This moves the condition (tid != 1 && !tmp->child_reaper) to after idr
> > alloc, so it not only covers that first process in pid namespace has pid
> > 1 in case of clone3(set_tid) requesting wrong pid, but also if idr
> > itself gives wrong pid for some reason.
> >
> > This could've been the case before this patch, when creating first
> > process the alloc_pid()->pidfs_add_pid() code path fails, so that the
> > idr->idr_next is non zero anymore and next process calling to
> > alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Effectively
> > leading to init-less pid namespace, which is a bug.
>
> I don't think this is an issue right now, as we only allow one attempt
> to create the init. If that first attempt fails, free_pid will disable
> further PID allocations in the target namespace.

Thanks, you are right!

> This isn't directly related to this patch, but why do we check
> "ns->pid_allocated & PIDNS_ADDING" after allocating all pids?  Wouldn't
> it be more reasonable to do that right after taking the pidmap_lock?

Perhaps, but alloc_pid() can drop pidmap_lock and retry, so we will
need to re-check PIDNS_ADDING.

Oleg.

