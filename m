Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465660;
	b=L8Yd4c/ifxMbcHQMML3wxsPHFOJR44wL6v4iZCqFwOagBtgBP/W/AgACEdgViCcSfn6d
	 vFMdIUcmuwf6JX1I6uzXpYJSciP8sQNubZn7NHa7770r7weBb2Bj8YWy8n5xScGAI6Nw3
	 Sjcc7rpzgIeSGInZskir5tNi4kWPSQb1RWqpC8hWqig64h5fXV2M364a9uxdC+r/dX8wy
	 cVTgmTtqrS/EczhbjQzSsenqTgKaz0ZXq+ug1fS6w2kjUvpX7Qky8ohdULdCQW6Qxvnl4
	 ciDGGAEs9Q7JWg+fMPVBLOhtpSA2+vtV5BTaZcjIPPHN8Jus5+LQUzg5ejs8QkhON+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465660;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
	b=4+XF+IGtykWkeoxR/RwOMqEPRB0yXMMKwEcQ7DdGx3FY5Ud+YyHFKpOa4SbtfXPIAkoi
	 Adf/HRCqOp6unQ9cJP3y+4A+aP9WpZlHzbv0aHoeN3IA4Zybsp6Fa49u+Hyi5n02SO1Sr
	 6ncZiSEQngVLQ+f2Jvva9eDDMUjHM1lZGSwow5Yz9S/cNxg4yW7gdrqacFENhH8yQ98f7
	 i/yIUMu1TZheRb96BzBlvTq+OEvw6NkiqwU8CSLyCX065G+l43K5wUUbAKyyWh0LcA1f4
	 GaXmlj2qYT8w9veaXtjh34ugpUIqGbO7zWkUEf0TH/T0+j9//d9nFZ19MenRAMTu0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OyPZjAqe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZtPfFQBc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5F9606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 06:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5F9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OyPZjAqe;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZtPfFQBc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794465658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
	b=OyPZjAqeZ4C295wMwuJ91saWYjokVhEHzfEaMFdy3a1GVeo46kGVTjH86hEV3hDoZQvNQS
	f4MMCSztRPT0yXDBdTZKHOfCj0nEQMiPNuVwRh+LEmhWgmMyC6BH3D13IymFFLXK0tbcVH
	9xDTCKvMtgvhmRyv+TO9THOEQATIA10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-r67Z1NtWMreeX5VVzL00RQ-1; Thu, 12 Nov 2026 01:40:57 -0500
X-MC-Unique: r67Z1NtWMreeX5VVzL00RQ-1
X-Mimecast-MFC-AGG-ID: r67Z1NtWMreeX5VVzL00RQ_1794465656
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4902ce85f72so3021109f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794465656; x=1795070456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
        b=ZtPfFQBcpCF6197DbyyHLCxXyaVxz/UY4xcVByKJ74+PW7vqdZZNX1Z1hLEUok9+xZ
         wnih+IBWhwWc/U1wNZYdnAYhsLDQw78ZsdaFXPNuB+MSXUJN3NhImiCuOBgYXPaIxqFf
         +LfhmRZW62+yI6InGwr7JNWhZHGgGIuf9DEqZ9doz61ssCiK9+BahMHs8rJn1HNrdcfR
         CfLuzCANLGo5LiGEW3rE7OitiigUkOAwWpED/2QgA1BAGGs85OqaU6LKhZPjoy2lg8tF
         XB8cPijK1cS4ZXfcH0iteD8Ccv3CwriOrVvH7sfq6yfW4wTZenmKfQsJ9LMcpTIoZVTV
         HD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465656; x=1795070456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vDJ3Ou7xzCxze/52XPwkTIU2JyVZ1LI+BGZWXtekYc=;
        b=IhzEUom3Ix4aeXKVpGhPNI4lec4oItoIgugmH46huGDl96kd/G0GHzIK71VqzbaEB+
         rCgUy8HMNYMINY9DKUC1IpxJYXMc0Gbys18S16UaAcpgoJJWHPkSJ4Yy45VlDJqm5vmi
         dOw8U5cavXvcJ4aiQFd5iWzC/o8QJHIU2ILufbtFWbTqDnLeNrVAbpRadc6nmuynzqKp
         Tys1qDMFI4CQCS4wrTttnRKaXkBBNCddbKlU+YjC/G+a63CeLWIOqHE259kFiAD/KQFq
         JwuSx3uOE1Y9Cd44rZ0Z1kURDSK8yzAXQsNiBNasHySa8/udNlFc/VXh4ukeRejwbS14
         OFLw==
X-Forwarded-Encrypted: i=1; AL+hErE7f06cm5c6UINyiVAtGetHxpRbeNcd9l1smhMKzqL4W4KWTD0V7kG1DfddVoPqV29/yEw1wgnZXiWNkkd/sbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YWMr3gSkrf080qNBsssClFjqPnf91dRWUQUGHk71dCJrTUlh6
	Ko5fsP2g/blvV+tMAknjA4DHoUT9xlPN7uatJtSEue919o/EMWwUgRqEF6v/8kLkWjv5N1SDTOe
	7f8IzkxIK3SLysGaipscFvy/CwNXql6Vrs0FR0Zd5PILR3hnpQOrAXRXPGvowCGrANf1xgA==
X-Gm-Gg: AYBFou1tf1cKMMMVGfRTI9OQ7pMjKb/66zy+n7sOoJEEKa3Z/bXM6T55LU2H6S0eWHu
	zqlSnHn+F8uEDjP1XJushr7CT+ya2CuBeNo9IAIy66YeGSxoZTJkoyF9ARgV1EvqdGdjPr87NdU
	eOidqufSHijoCtyDp6SaS3I30QHGeh7S/W7e5Vle6y/QNKfLcCEXUwGApkXrR5C5XzQTXdj4YlE
	BMiHQVKci4XIT0Iw9BC2Zz7w9E7Gl+wCcC+D0gjvjDW9c4eRM4rydKgd4H6JD4bj5DgJHoUM0Gw
	ssNl0VysUead3Q2uxEK9tCW/Ky8XN0J2vq+mn1bTho6lQFd6cLfYtNKziJV/ZBP0tBjw3FC+2bZ
	++yoLB5n19+81ju49SVoV6b978rFy73G0bf47u9UTVy7n1SxfJq7ymGPULDE08SC7p9WI3wbzui
	iKu+Q=
X-Received: by 2002:a5d:6f16:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-499c792ec97mr7218185f8f.45.1794465656008;
        Wed, 11 Nov 2026 22:40:56 -0800 (PST)
X-Received: by 2002:a5d:6f16:0:b0:491:6b1b:7f25 with SMTP id ffacd0b85a97d-499c792ec97mr7218131f8f.45.1794465655658;
        Wed, 11 Nov 2026 22:40:55 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm15226028f8f.23.2026.11.11.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:40:54 -0800 (PST)
Date: Thu, 12 Nov 2026 07:40:52 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 17/29] sched/deadline: Leave a dying task out of a
 rebuild of the accounting
Message-ID: <avVfdI8NRaLN0ZHH@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-18-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108185406.1549770-18-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A rebuild of the root domains' accounting takes the pi_lock of each
> deadline task, not its rq lock. A dying task past its 0-lag time
> releases its bandwidth at its last schedule. It holds its rq lock there,
> not its pi_lock. Then it clears dl_bw. The rebuild can find the task
> between the two steps.
> 
> In this diagram, T is a deadline task that exits on CPU 0 past its 0-lag
> time. bw is its dl_bw. CPU 1 rebuilds the accounting:
> 
>   CPU 0 (T)                                  CPU 1 (rebuild)
> 
>   do_task_dead(): TASK_DEAD, under pi_lock
>   __schedule(): T's rq lock taken
>     task_non_contending(T)
>       dl_task_release_bw(T)
>         total_bw -= bw
>         dl_bw_gen recorded
>         record cleared
>                                              dl_rebuild_rd_accounting()
>                                                dl_clear_root_domains()
>                                                  dl_bw_gen++
>                                                  total_bw reset
>                                                dl_add_task_root_domain(T)
>                                                  T's pi_lock taken
>                                                  dl_bw != 0, dl_bw_gen old
>                                                  total_bw += bw
>       __dl_clear_params(T): dl_bw = 0
> 
> dl_bw_gen does not help, since the release came before the rebuild. The
> rebuild would count a bandwidth that nothing releases again. The root
> domain would then refuse deadline tasks it has room for, until the next
> rebuild.
> 
> Fix this with the record of the bandwidth, dl_bw_cpu. The release
> clears it under dl_departed_lock, which the walk holds. So leave out a
> dead task with no record. A dead task with a record has not reached its
> last schedule. The walk counts it as a live task. That schedule then
> releases the bandwidth, or puts the task on the departed list. A dead
> task on the departed list keeps its bandwidth until its timer, and the
> rebuild counts it as before.
> 
> The Sashiko AI review of v2 of this series found this window. Its review
> of v4 found a gap in the first version of this fix. That version also
> left out a task between TASK_DEAD and its last schedule, with its 0-lag
> time ahead.
> 
> Fixes: f9a25f776d78 ("cpusets: Rebuild root domain deadline accounting information")

It's kind of minor, but I'm not sure the above Fixes is right. This
patch alone can't be applied to fix the referenced commit, it needs the
(at least 2?) preceeding patches.

> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Other than that,

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

