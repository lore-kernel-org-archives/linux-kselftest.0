Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39931F985
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779554981; cv=none; b=AAoMLuuly32R68KicoiE2afYVJztvC9vUsMNOXhjOaeDClxJJ22vrgPE3F0ZTs56l4otDfdzQ+n46Ka/7+wfDb+NSPWIEdDKj9dzSB/Av8os5FKta8SDDkpiu8OaCiYY5HE7CwVTHWmOA+amatvwSDT7U7rA3NZG6M9fbHQVtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779554981; c=relaxed/simple;
	bh=tJOW8IbBfROkYsczfidt+hU/NZczo89lfIVKC2uVV8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEkAzyDkypVmFWKnbpCEcjto5SnzzjiVo//fvoQ9MJVpoRJsUUGuNrGtHojqv4TIkdd6kg2wELzVHKthPF04FltqoUlyVrB5HVYAhkCkUevGdtUSYtx992gI0RbDCtd7MMSxbw6td7e8jTZHXQ5QDd8UesOv1dDavAbJ/rDE1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NIBgBeFw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NIBgBeFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779554979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tJOW8IbBfROkYsczfidt+hU/NZczo89lfIVKC2uVV8E=;
	b=NIBgBeFwBwWYS5uq9kh1HBF6bwBbvUB8LBgglV31d9OWE1OFzyE3MnDWpfVSBnGlqyOuur
	1gw9lqaIeNOnZA+s1svQjDx05Yvk3LFkJiM1+hLt8HQNITRTX0ajCq3nNhAKiSl6TJjM1v
	7gDtuj9MGFNrKul65ddnX8sgKRHujw4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-cA6n9uH2MduqzaiXzBY3Kg-1; Sat,
 23 May 2026 12:49:33 -0400
X-MC-Unique: cA6n9uH2MduqzaiXzBY3Kg-1
X-Mimecast-MFC-AGG-ID: cA6n9uH2MduqzaiXzBY3Kg_1779554971
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 49D1019560B7;
	Sat, 23 May 2026 16:49:31 +0000 (UTC)
Received: from fedora (unknown [10.44.48.14])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1FDD1300019F;
	Sat, 23 May 2026 16:49:25 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 23 May 2026 18:49:30 +0200 (CEST)
Date: Sat, 23 May 2026 18:49:24 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Shuah Khan <shuah@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, shakeel.butt@linux.dev,
	jlayton@kernel.org, axboe@kernel.dk, kernel-team@meta.com
Subject: Re: [PATCH v2 2/2] selftests/pipe: add pipe_bench microbenchmark
Message-ID: <ahHalOM2Isn1vghq@redhat.com>
References: <20260522-fix_pipe-v2-0-a8b35a78244e@debian.org>
 <20260522-fix_pipe-v2-2-a8b35a78244e@debian.org>
 <ahHZPLqAPXhobCQn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahHZPLqAPXhobCQn@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 05/23, Oleg Nesterov wrote:
>
> The more tests the better... but since it comes as 2/2, perhaps the changelog
> could mention the difference before/after 1/2 according to this test?

Ah, I didn't read 0/2, sorry for the noise ;)

Oleg.

