Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE83ACF10
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024852; cv=none; b=IyvBsHEx+gndyJhQXIv2xknvZH6+5/CBrqu4pmB2vCojMKRkc9vUBNwDBYQaPQ+AKacRAUrWLwg4+AoLGORxmaPuIROfroES9t6qpbY3w146FsQBLTmR5OZmH5O1pIqikRjDnqU2zfrbhCw/wImGEninZRiQtCQ0t73MbqhZpyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024852; c=relaxed/simple;
	bh=Q2F0a1/I0evjMEXLNGJ/pUIJHGD/TW2VAOAzXXV180I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ3aYdMWLCPR0t27l1P3/yo8dNVsXV0ChIx2XXtAzykh74GGH2PZ7JfS3FznNAb45GNnF20zjpDHxFFUe+w3tkHyQx0oyNaZlsrFn9c/8PxkW7oxcoPxoVw2O5Aw2BtQ8N/fug03z2+acWP03IjH9nJ03ccxMm9vgch2gB8/QxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvzHi2h5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvzHi2h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772024851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2F0a1/I0evjMEXLNGJ/pUIJHGD/TW2VAOAzXXV180I=;
	b=TvzHi2h5Tzy/3D9sYir6BpnCZ0x9dDOtwVztXRb0fREehx/mvMO2fxCkEJeiKGR1yyT9Qk
	F+i10JlSth+pKs1X/6J1KruJ41C/nUXMp9ehUFO+Jv3g7939pv/Vwj1eWla45B2qtQGtqC
	GSjuh5ERcZ+th/oQ33GZ4XaT8frzMs8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-197-YmllfxCaPq-Bt1xXjL4iBQ-1; Wed,
 25 Feb 2026 08:07:19 -0500
X-MC-Unique: YmllfxCaPq-Bt1xXjL4iBQ-1
X-Mimecast-MFC-AGG-ID: YmllfxCaPq-Bt1xXjL4iBQ_1772024836
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF37D184543F;
	Wed, 25 Feb 2026 13:06:54 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 097EF1800666;
	Wed, 25 Feb 2026 13:06:46 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 14:06:54 +0100 (CET)
Date: Wed, 25 Feb 2026 14:06:45 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Andrei Vagin <avagin@gmail.com>, Christian Brauner <brauner@kernel.org>,
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
Message-ID: <aZ7z5XPAtptQVoW0@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
 <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
 <aZ67mwBEbRtdaWp2@redhat.com>
 <6269de34-203d-47b5-922b-342671573b7f@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6269de34-203d-47b5-922b-342671573b7f@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 02/25, Pavel Tikhomirov wrote:
>
> On 2/25/26 10:06, Oleg Nesterov wrote:
> > On 02/24, Andrei Vagin wrote:
> >>
> >> I don't think this is an issue right now, as we only allow one attempt
> >> to create the init. If that first attempt fails, free_pid will disable
> >> further PID allocations in the target namespace.
> >
> > Thanks, you are right!
>
> I guess it means that we should change the commit message a bit, e.g.: replace
> "Effectively leading ..." to "Though thanks to PIDNS_ADDING logic, free_pid()
> disables further pid allocation in this case and it does not lead to any real
> problem.".

Agreed,

> Please advise if I should resend the whole series (v4) for that?

This is a question for Andrew ;)

I guess you can just send a single [PATCH v4 2/4] in reply to v3, but it won't
hurt if you resend the whole series.

Oleg.

