Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE293ACEEF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022293; cv=none; b=N44QNFoGbIQ6jBulPIa/yW2fG6y8agzmIdr2xwuAVYuwlEEfri1PCMXi/rh7xCktf2z2IMTKnHHbeSfn86uwBGoCo5mbW8LdTmVxnaw9nftVrdR+PBfgSZ0YnPijLUR/oaEqQDQxrg8il/9kTk3qqBllg7xqHfYmUxCJBikNsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022293; c=relaxed/simple;
	bh=U257YdxdwDD5/SgQz18TMn2ak9cgpijlpsO3hFbhA88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR9Lovy/uc6IPK963W0wp/oo2hfnm0h+QmBKR9chhvzrhAgeByu+BEQGN+TGA0AE4fBPNT2kzOMWRmRP8cEgN42uEvKuS8JEssYOcoUqmSQLOFMCBOXe2NNNPel3j7Qa2sCqCBzi9dU0d2sua5ANjyscxPEMLzI0bcVHbHXVdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkSZ4nu9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkSZ4nu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772022290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U257YdxdwDD5/SgQz18TMn2ak9cgpijlpsO3hFbhA88=;
	b=RkSZ4nu9iwjUGhjIyUmTT40jC31FVaUEPNewDyTjv1jh/JWHC+XO8mFbjU29tvGqkkFIch
	nUTd4g9297mFAEIIqA9ipx51/8yXHAVCZCSJYi36Zh/uiuTiGEn4ilVOGkhEYDodt6+xrn
	4tNniQ+Bpb/3kmEsK9MWy13lCZ3Gc+U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-N0jqdGwYP0SRQhDomDtz2A-1; Wed,
 25 Feb 2026 07:24:46 -0500
X-MC-Unique: N0jqdGwYP0SRQhDomDtz2A-1
X-Mimecast-MFC-AGG-ID: N0jqdGwYP0SRQhDomDtz2A_1772022284
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D83A1800464;
	Wed, 25 Feb 2026 12:24:43 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2B60319560A2;
	Wed, 25 Feb 2026 12:24:35 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 25 Feb 2026 13:24:43 +0100 (CET)
Date: Wed, 25 Feb 2026 13:24:34 +0100
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
Subject: Re: [PATCH v3 1/4] pid_namespace: avoid optimization of accesses to
 ->child_reaper
Message-ID: <aZ7qAl6XCweViRY5@redhat.com>
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com>
 <20260224164852.306583-2-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224164852.306583-2-ptikhomirov@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/24, Pavel Tikhomirov wrote:
>
> Also let's add ASSERT_EXCLUSIVE_WRITER before write to identify to KCSAN
> that we don't expect any concurrent ->child_reaper modifications, and
> those must be detected.

Not sure this makes a lot of sense in this case, but I won't argue.

> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Acked-by: Oleg Nesterov <oleg@redhat.com>

