Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247274;
	b=uvQHWp/3/XdfSSTrKdMofdkKQnoCYPj7VonOUNn1jA/KmbifS6yJBV3W41KUG7KWPXYl
	 4TO3v8pH97UAemBH3eu+w7SXl8kj0UGvYYIaAJPlsN1IUyyVfn6OEhCHbHU1KCGnef/9d
	 0MDqgTfZj3loCdlECTHklV4s+sE5R4AzWTYE2mC20gCLHEOyHF4fGIN3uYuA+gSJvgzcV
	 qYla19VaAzTc9KQKW8n3ktuPfI2VAIkOBvdC6CwpcktH9EFcFCrUD2HgrKsSInaNquwA0
	 L1P9a/JxCIQmk766j/QHPKgmcOEp0piaIdSBJkyWN199BX0sE4e2DbNFIuU0HhJPYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247274;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=uqQObdUpHHYtUe+LeCHrZ/2wo3MZK4ZISN3fNU+Q+88=;
	b=2titx1xA2bYcyBC+qwE4UGODfdIfxW1YLs4BvP6Z22VBHl0Yz4QyB1QfjrZqX2oZe+y4
	 k/HFJfYvcZ5aDNVm9S+ixunWnLApmBxdiTG/0ypGyVcHUny6efUJiiR7kBXF2lWZrr7Rm
	 u6nSkymrPhZa7wmCKpViOC6Fdz0lbjXCwZeHsPXmK2UGRaJfVA6t39JHyNw3ZczIG2e6y
	 aGUUD1EmKU7WYN25MIclYxkjegjS7c9nxyNlfBjHKjC+5jl7JLpme9ZC6hgDVM6fzAmpv
	 Udcq3wjZqLSMlneFW992CyxnqiGavnuic/1y08x2tQhJLMSXbtP9odPZSLAY3IKnlMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQMorX+F;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F76606A332
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F76606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQMorX+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794247272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uqQObdUpHHYtUe+LeCHrZ/2wo3MZK4ZISN3fNU+Q+88=;
	b=eQMorX+F9GtVbPcHAHIeD0reK0hcqwMr0yPCfTofmI2rbS4OL+TCT/CiX+WJX1XDAHpVFG
	0IpuIMiBwkhq2lltGtIaZIlMOmc1zvvLjO1oRqwyzhJs9GLv+gwYd1J9nKFWv/xjsVmF0o
	kJnYugM8FfscU1o5MtK3u8WEEx7BvKg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-Q-0kTqdZPtqltUwQp3l6_g-1; Mon,
 09 Nov 2026 13:01:09 -0500
X-MC-Unique: Q-0kTqdZPtqltUwQp3l6_g-1
X-Mimecast-MFC-AGG-ID: Q-0kTqdZPtqltUwQp3l6_g_1794247265
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 179B1180075A;
	Mon,  9 Nov 2026 18:01:03 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 71C211956087;
	Mon,  9 Nov 2026 18:00:52 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  9 Nov 2026 19:01:02 +0100 (CET)
Date: Mon, 9 Nov 2026 19:00:51 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: kees@kernel.org, akpm@linux-foundation.org, david@kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, paul@paul-moore.com,
	jmorris@namei.org, shuah@kernel.org, brauner@kernel.org,
	alexjlzheng@tencent.com, jannh@google.com, jaime.saguillo@gmail.com,
	elver@google.com, blbllhy@gmail.com, bvanassche@acm.org,
	pjw@kernel.org, broonie@kernel.org, debug@rivosinc.com,
	tglx@kernel.org, aleksey.oladko@virtuozzo.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, morgan@kernel.org
Subject: Re: [RFC PATCH v2 2/3] security: Add PR_CAPBSET_DROP_MASK for
 process-wide bounding-set drops
Message-ID: <avIKUzCKAkfC-wuk@redhat.com>
References: <20260929130200.1638343-1-ruanjinjie@huawei.com>
 <20260929130200.1638343-3-ruanjinjie@huawei.com>
 <atjN3JX7sWx9kpQ5@hallyn.com>
 <avHfm5/mVtuN/oPW@hallyn.com>
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
In-Reply-To: <avHfm5/mVtuN/oPW@hallyn.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/09, Serge E. Hallyn wrote:
>
> Hi Oleg,
>
> please see below.  Do you have any issues with this use of sighand?

Hi Serge,

I already tried to look at this patch, but sorry, can't really comment.

I'll try to take another look, but can't promise much, I don't understand
the problem space (I could never reallly understand capabilites in details).

Oleg.

