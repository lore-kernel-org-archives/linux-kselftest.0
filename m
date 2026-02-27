Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7221339B1
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193756; cv=none; b=JKfOSo05UXMgMtGAdL4XMVf6UpiQoF4Cnv5a4ykVQlO205OALa+eBYMP1D46Q6vqjIBvJ3vz/FX9BLxI4IJFmfsT15pXFWmmZCdZdQlnNLWBkDa8ChkR5dXsmTcAi801GyXvscsYdUyefnLJuFJbel0VVuYmCDEf2kmBCNtmrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193756; c=relaxed/simple;
	bh=EIWp3qIMPX5aP+RokhyI9mN9EkmEovvbuxX1RuRSua4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VztFDupufI78fZyUcaQ08YhL2CZ/4NrwrbCjKmQkBDBk+HQNnNikVikfRMzpG0J2su9o8dxRnbfci3ezWBJxoc7euNjIm3HOPh1QQm22KhW50xzet0ro9VFvNR/8wJFDg9Z/u1bBlpP1tSrkeugJToX9C0JQ4sJhYWRCBNQMjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DfoRdu8f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DfoRdu8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772193754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ARsZZaJbz4Se7XeH2kij1cdc9Sgjng1W/WgzOfkjGow=;
	b=DfoRdu8fX4dq9rsBr0NDLtL1LmFxr9XcUkUUKJXCRIaXsep0WH9HOkFCnyKJZi03xL6uVQ
	QMWvZlRHma2VcZn2UmtV//ol1v2lsXZSr4edWE6Zdv/emY51DQh7LZwWlR7tBCtE1FPQK0
	0/BKDMMXDbx+kYRk5e9zQMe2RulVnY8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-CIEq5yPeNk-cclyWlY572w-1; Fri,
 27 Feb 2026 07:02:33 -0500
X-MC-Unique: CIEq5yPeNk-cclyWlY572w-1
X-Mimecast-MFC-AGG-ID: CIEq5yPeNk-cclyWlY572w_1772193751
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 259E2186096A;
	Fri, 27 Feb 2026 12:02:13 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BC68C19540E9;
	Fri, 27 Feb 2026 12:02:05 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 27 Feb 2026 13:02:12 +0100 (CET)
Date: Fri, 27 Feb 2026 13:02:03 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] pid: make sub-init creation retryable
Message-ID: <aaGHu3ixbw9Y7kFj@redhat.com>
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Andrew,

On top of Pavel's series but but doesn't depend on it.
Can be applied before or after.

Oleg.
---

 kernel/fork.c |  6 +++++-
 kernel/pid.c  | 18 +++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

