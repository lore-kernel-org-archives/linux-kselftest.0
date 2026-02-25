Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC4A3921F2
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024165; cv=none; b=FtfbV6E5Y8yL9i/ZaSeDnWG1yL3pRKn9v+AzrrUrqM8V18OfBAUikh3RnstHiKoWM4FDQ2OLRP5HrqZp+IoLPKq1Y1uLAPThS3383FvqzwuB0gEGIazAk966qVHLdqvizpy/M94qeFqmjGAfS2q7zfkdXEtFEIg6LUA8y3NluNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024165; c=relaxed/simple;
	bh=cS4rdgedqlmqaWfxgVDuJfWd57QxOS/bBH2dVx9uI38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN8+CdNyO8GS/7DmZAgRe9JO9MkG0CLnR6nWC5WVWtFyQ2X0R61XopYy2aaarKk20VPRRBw/wujrkrqVoxx78/bPVOckxF05dX0POb7gXv4U/QSfd3vPBKSQNeiorKyMX4dkQMnSSIbKlOqj8j7b4+MuWR1GaStUCPWGaIFbru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V/8PsjCL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V/8PsjCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772024163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cS4rdgedqlmqaWfxgVDuJfWd57QxOS/bBH2dVx9uI38=;
	b=V/8PsjCLBmvuCxqhi7VPJf/cKY5sHcfK0zuu8KudtFTX36tP05G5ITQop+8LkePE0NwCJ1
	sctPpzaVXq/OFrDa2l6wOmx/6VeCUxItm1scYSojgP+9437AE+Wud/RE1PYyTp8dK4O27q
	Mz/O6TicaatabItzyFcRABOBWmyrETk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644--4gZuI3ZPsaweAwChCvgwg-1; Wed,
 25 Feb 2026 07:55:57 -0500
X-MC-Unique: -4gZuI3ZPsaweAwChCvgwg-1
X-Mimecast-MFC-AGG-ID: -4gZuI3ZPsaweAwChCvgwg_1772024155
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81A9E18004AD;
	Wed, 25 Feb 2026 12:55:54 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 75F603003D88;
	Wed, 25 Feb 2026 12:55:47 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 13:55:54 +0100 (CET)
Date: Wed, 25 Feb 2026 13:55:45 +0100
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
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 3/4] pid_namespace: allow opening pid_for_children
 before init was created
Message-ID: <aZ7xUYi4VFTxWzqG@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-4-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224164852.306583-4-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 02/24, Pavel Tikhomirov wrote:
>
> Note: I didn't find anything in copy_process() around setting the
> ->child_reaper which can influence the pid namespace, so it looks like
> the pid namespace is fully setup at the point when init sets
> ->child_reaper to receive more processes. Thus tasklist lock looks
> excess in pidns_for_children_get()'s ->child_reaper check and it should
> be safe not to have it in the corresponding check in alloc_pid()
> (introduced earlier in this series).

I think you are right.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

