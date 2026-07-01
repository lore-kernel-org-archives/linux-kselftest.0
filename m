Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B1C3E92BD
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896472; cv=none; b=Ly2OBonAJVcRFoabzZ1wag2ZbjXtsEfFPZh1Je0t8Cv4D1fKMDqAqjCW+1Tb4gi28yGJOWbpsWQVI6BFMttnUk86LKLNeG+WxK8N2uk3H77Nj/MVRJJ9TL9jGnLxaHXKhqMBFzW0nQHLVBhvJ1yPoQAWYaaCMJoigVj4W6Cz1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896472; c=relaxed/simple;
	bh=H2yu1v4BLA1CXFpBBWR+UOBqEFBs+Yl1kR9v6PncV2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfwFMYF+QB4vw5U4CSRoYcZV8vC4PVeaaOoHovvBiIAWl4UdS3dKQJX2yJHc6WmaFpty7j8o0JF7fndsooTKeAoAjLoYwBZVh+c//JM2SkN4IM/7DGpMTMiS1odpnPxL9GAl73kcuP23yl7fHYfi9lEZCFtsLgFlO9ELoHMagXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3iUoSrd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fvyvrm7s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3iUoSrd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fvyvrm7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782896470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aun8Zor665Yj5HaVE7uoEpAdyksulZLzu/u1QogbXXQ=;
	b=U3iUoSrdRZp3loWWwxN+d3ht1X4KfLzwVsdu+v9Z7Ox7M3OMM1y8rZ67pA+4GFLjc8Pm7I
	RgkEmj9q5g+k/ynzf9RiTKDMWbVa6mBFeN7c/hZQxK4pxUV7y13bxLCwNg4Ap5xyHhjHul
	/FKH62R7D4UcEGpXeAA9QTxK6WyYuDQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-vaJ6MiVnP-ur0r8Q8x-AVw-1; Wed, 01 Jul 2026 05:01:09 -0400
X-MC-Unique: vaJ6MiVnP-ur0r8Q8x-AVw-1
X-Mimecast-MFC-AGG-ID: vaJ6MiVnP-ur0r8Q8x-AVw_1782896468
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47162f83c75so1108723f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782896468; x=1783501268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aun8Zor665Yj5HaVE7uoEpAdyksulZLzu/u1QogbXXQ=;
        b=Fvyvrm7suS5GoNG4n/3K+ZvTPyj28o6ckplHNLvdAdlirvGvxV8DddUOL4xUnSZYfy
         BEvz0HL32PkCPKkzxuL74FqUNVEdqddLCbte/I0RZuhcBCi+yxn9e9dMIwxcGWXeKNrt
         O4jaclIz/tfQFQTwZblmS6Geh52/Q3XA7V6FZKEa5PitJFf+iv981rfFXO4lJQOPoq8k
         BIc5MfggskPUS66Zx8YlehS+CsbQOZS2xduMAMLx5TqN9iV5MQ3DvRmKVO1NfBrBuCTF
         aA6wXtYsDIaBq34X01YVzfcqGOcUMfIGzcOCwJRndhrxDa37xuRZGAMT5e32QTdWy4zl
         SKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896468; x=1783501268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aun8Zor665Yj5HaVE7uoEpAdyksulZLzu/u1QogbXXQ=;
        b=Gi9cKvlpSdA4LJD7pduW86gKbmM5lX2yM2iwZpC8iwYdoUzCIGZkKfYB/ZQ/a9H9Xt
         XxPZdXC8kTk4B8HJrXj2gF9Ejn5xVaWs883H0rghHw41iM/lPuNAq/cplcsL5Q4XVbLG
         ZmnRPDSYXQvI0LUoWqLyX91auZhZU/BauwtJsnQvb6NVw8MHfxJahbhsbBP/0fDKgO2J
         0ypBq0SPjLCwZr+KAJInK+C/X5lT8n+MpOkDckWT3jSoMacdma8z9+AQyLc7QRQp7WU/
         +6oBU5vzVzj3N6PSJ0cwD7aaMCv5Ex6Mfwiktbk3RwqoqWYGBLqwEAcRFrgxTspzTraY
         k42Q==
X-Forwarded-Encrypted: i=1; AHgh+RriZmUcYq3k5NCsFKi9ZBpKs/2z9pBSf+mrDheXte3tNKaasO531RE93lfFFrmZoTH1VqP4U440Ss4LTfpefz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeHgjmxgb+uEWorN+CcSg4kWWxyDDFe1S/+TBaTFnOoOlPWgQ
	sIgW6KGuHCD05kbcAycFZoug4lo95fsgsh5QwPT0jemcEajBiwo6W45huKKEroj4aJRmUJ6sofo
	NGOHGGoGd7grE6jNHzeHALmGHy7em7UYZiVXcunwj+HJlF/L/sSKk58sKvITxMUnT/WLqmg==
X-Gm-Gg: AfdE7cmAf2bwZW5LzX/5YSC68NNsUtXZUn7Gvjb0UFRqfrlSxV/z7az4hZ7U59CwwJU
	8ovoZIHlv9HbvnH+N/7fUUUWbKqvWpgwBOP1tAlv3ia2UfrNo4cPtUm4FFOCEO+/8hSDudrypF3
	Irdr3btToafmsfXG4ULXDuiLtrjHx4cRLJ22wt07AXRi9OQ2/PDka/14mBD6WHQckedF5QrolBJ
	SmU/L5WeqhLMWXzq2AVbJ2V88vD7U9+NLpRgk+zcGSiWRadqEzpL6jNf8pp3G6WFtn2Q/pxz7kz
	ux3Vct868b/m3DsjeC3U0Hvq5jISRFfn4y4kL4Glca65iWd0Yzo105GGOl6hSL6dHBfHwTlHfO3
	l/IICBEkWVQFc9qFji+XP0Et0ZXSE/ZTJcRAFiCevSQ==
X-Received: by 2002:a05:6000:2c04:b0:475:f0c2:75b3 with SMTP id ffacd0b85a97d-477469108dfmr1356078f8f.30.1782896449031;
        Wed, 01 Jul 2026 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:6000:2c04:b0:475:f0c2:75b3 with SMTP id ffacd0b85a97d-477469108dfmr1353851f8f.30.1782896433637;
        Wed, 01 Jul 2026 02:00:33 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.133.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643ce016sm15420805f8f.16.2026.07.01.02.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:00:32 -0700 (PDT)
Date: Wed, 1 Jul 2026 11:00:31 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>
Subject: Re: [PATCH-next v9 01/11] cgroup/cpuset: Make nr_deadline_tasks an
 atomic_t
Message-ID: <akTXLwtz_pYM79wk@jlelli-thinkpadt14gen4.remote.csb>
References: <20260630033344.352702-1-longman@redhat.com>
 <20260630033344.352702-2-longman@redhat.com>
 <akPMKXppWM74-m9a@jlelli-thinkpadt14gen4.remote.csb>
 <e4ab9944-4687-45be-9935-4ad29f2a923c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ab9944-4687-45be-9935-4ad29f2a923c@redhat.com>

On 30/06/26 13:56, Waiman Long wrote:
> 
> On 6/30/26 10:01 AM, Juri Lelli wrote:
> > Hi Waiman,
> > 
> > On 29/06/26 23:33, Waiman Long wrote:
> > > The nr_deadline_tasks variable in the cpuset structure was introduced by
> > > commit 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task
> > > in cpusets"). It is reported by sashiko [1] that nr_deadline_tasks
> > > can currently be modified by inc_dl_tasks_cs() under rq->lock and
> > > by cpuset_attach() under cpuset_mutex. So if both updates happen
> > > simultaneously, the nr_deadline_tasks variable can be corrupted leading
> > > to incorrect operations down the road.
> > > 
> > > Fix that by changing its type to atomic_t so that nr_deadline_tasks are
> > > always atomically updated.
> > > 
> > > [1] https://sashiko.dev/#/patchset/20260626181923.133658-1-longman%40redhat.comk
> > > 
> > > Fixes: 6c24849f5515 ("sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets")
> > > Signed-off-by: Waiman Long <longman@redhat.com>
> > > ---
> > Looks like Sashiko is yet not completely happy with this:
> > 
> > https://sashiko.dev/#/patchset/20260630033344.352702-1-longman%40redhat.com
> > 
> > I actually wondered the same and couldn't convince myself we don't
> > actually have that problem with the window between sched_setscheduler()
> > and cpuset_attach(). If issue is confirmed, not sure if wait_attach_
> > done_lock() could help here as well? It's kind of a big lock for the
> > scheduler, but maybe only affecting DEADLINE tasks and if migrations
> > are ongoing.
> 
> Yes, I am aware of that. This patch can only partially close the race
> window. It doesn't completely eliminate it.
> 
> My current thought is for inc_dl_tasks_cs() to check if the in_progress flag
> is set. If so, it sets another flag for cpuset_attach() to double check the
> DL data for consistency. It will be a rather complicated solution in order
> to eliminate the race window. So I am postponing it to a later time when I
> have more free time to think about it.

Ah yes of course, makes sense.

Thanks!
Juri

