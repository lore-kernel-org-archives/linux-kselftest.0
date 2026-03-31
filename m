Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18740710B
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974742; cv=none; b=tDZdlym2RtCycbouDBq3A5QqT7QV+/SWGEHgw0+D7oSA9yfnhXNJOeC7n4npZclKYDoIiCvet3GW8DH7OCgN5qUqdneEf6IheJBJUccEv/jFiQokyhEfnmdg9EQM+kaj+hFm4514sOzsQsPNpeUN4QNuiyv/daLiYC9+iT4V5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974742; c=relaxed/simple;
	bh=qhDhiwW6cB+BzXq4YHEOSQ/big1+vA+5eaaG+QtMGV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lajaf8QQ23wfuDC2uKHAiWyZsvedDYl2jQpsJyIJBy3Gh/dwLLDTtB9RchUBm3WEk94LNLeUM4b9Gvy7nT5cYP0//XX529RU3KwWtHjFW0cWrr4NKSkE51J9fSKk+XWIy/l52hiNwFux7+MNOjiaX364kgPVpNvLpZOwonq0usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EmPin/57; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EmPin/57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774974740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MAqzCf42QLu8TV8j9Wj61ROnuwrNN7bkpugWVreJh8=;
	b=EmPin/57YC7Zg5EQjLJmj7g+z8In4/qTLQrL3ID/7UYIQp9PnUUuyjRv7mm+hTLKj50V+8
	HeEW1/+YUiYstzypXESMV1ilr2UnLkbgl6PqVrREWlpsUd+QlwCblPM3v7mD8STfUDJqt9
	h7lsJb9uGYZBRP2xN07eAuv2XTKWUX4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-ON8EvXtePNOdxzNh7juJ0A-1; Tue,
 31 Mar 2026 12:32:14 -0400
X-MC-Unique: ON8EvXtePNOdxzNh7juJ0A-1
X-Mimecast-MFC-AGG-ID: ON8EvXtePNOdxzNh7juJ0A_1774974731
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5686C180049D;
	Tue, 31 Mar 2026 16:32:11 +0000 (UTC)
Received: from fedora (unknown [10.22.81.166])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A92019560AB;
	Tue, 31 Mar 2026 16:32:09 +0000 (UTC)
Date: Tue, 31 Mar 2026 12:32:07 -0400
From: Audra Mitchell <audra@redhat.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, "David Hildenbrand (Arm)" <david@kernel.org>,
	linux-kselftest@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <acv3B8ah8toDYYlP@fedora>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
 <abludfGu4upPcyRI@fedora>
 <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
 <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>
 <f00dce3f-d6dd-477e-bac5-b9b8253b03ba@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f00dce3f-d6dd-477e-bac5-b9b8253b03ba@lucifer.local>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Mar 27, 2026 at 11:14:04AM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Fri, Mar 27, 2026 at 10:52:24AM +0000, Lorenzo Stoakes (Oracle) wrote:
> > OK again I'm starting to think we just shouldn't support fix-patches at all any
> > more.
> >
> > This is an example  of a change being done in a fix-patch that's _really_
> > causing issues.

Yeah, this is my bad. I built my test patches, but didn't verify on David's.
I will also take full responsibility, I rarely push upstream fixes- which is
not an excuse.

> 
> Thoughts?...

I think all your suggestions are great, but I also don't believe I am the
intended recipient =)

I intend to push a V3, but it's going to a few more days as I have some other
things that got put on my plate that are a higher priority.

Thanks!

