Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33642146588
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779319; cv=none; b=VVDko1F9m3aKYt0/W4VKTLnzBzhWFnxcjejAZMVCK3hzA7JSTr1l+964P/Zp44hVxBnSjqnfF7kWn4tak4M8ZZHnSsON0m92NFhhBAUqr2IQSEZHlcH28vKJENCM1ICAy7tyBTN83fjVlhsakxBqhNxA7oAEH0xB6ETidlAcKzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779319; c=relaxed/simple;
	bh=Sa11091frtdB7X7+J4H+SzAKyN2hdw6VhNJdlFVuCVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4eKUFG80t1GwmednFFLKKU4vr4uTSmrdTuWESRIw4E9AOSqe5AxwJiep8YdCYE6pqRAzQOhw0MOsaF/odReK3k8ZJyRa5ES4+J03lQWqD1H+Jpn4COBk09gOFTxbmbvbigRYVg1DmmizNEjaUdUbq9vQ+Ey2Qs/fiCx4yCJfhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFJfDmh3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFJfDmh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771779317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sa11091frtdB7X7+J4H+SzAKyN2hdw6VhNJdlFVuCVU=;
	b=AFJfDmh3oQ2MOpTy2MDwbOMSghUpBxiQi5SEzk2Bp/p71ipfeOCwhL/ltmsgUfuT5WK2Dd
	TBjOGS/pToeJBJ6WD6meundrbpq16CEGY7XJTdEToQ+4oMDlDcrZV4GYjZmK69rR4R/5mk
	TPo2zTXCcg4D3JVFB9gyMSrxAMyJ9XA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-R6vyK2cQPtuq2PRdmIf5pQ-1; Sun,
 22 Feb 2026 11:55:13 -0500
X-MC-Unique: R6vyK2cQPtuq2PRdmIf5pQ-1
X-Mimecast-MFC-AGG-ID: R6vyK2cQPtuq2PRdmIf5pQ_1771779312
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E03BB1956089;
	Sun, 22 Feb 2026 16:55:11 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AA1BD19560A3;
	Sun, 22 Feb 2026 16:55:07 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 22 Feb 2026 17:55:11 +0100 (CET)
Date: Sun, 22 Feb 2026 17:55:05 +0100
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
Message-ID: <aZs06UgTFYg_ctlN@redhat.com>
References: <20260220164559.2465466-1-ptikhomirov@virtuozzo.com>
 <20260220164559.2465466-2-ptikhomirov@virtuozzo.com>
 <aZsi8Z4Y2qqpdZGH@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZsi8Z4Y2qqpdZGH@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/22, Oleg Nesterov wrote:
>
> Pavel,
>
> Your patch doesn't apply to Linus's tree.
>
> and in any case... can you avoid read_lock(tasklist) in alloc_pid() ?
> This is really not good.

I'm afraid I am totally confused, but it looks unnecessary.

Once ->child_reaper is set, it can be changed but not cleared.
This means that pidns_for_children_get() doesn't need tasklist too.

However. With or without this patch, we probably need WRITE_ONCE()
in find_child_reaper() and copy_process() + READ_ONCE() in alloc_pid()
to avoid the possible warnings from KCSAN.

No?

Oleg.

