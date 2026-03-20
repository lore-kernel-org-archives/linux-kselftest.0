Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7915B38D016
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006496; cv=none; b=B/jXLuehiki9bSixfwFtVoXNsVyEXdviKG/vy/E+gT8TZRYt01tMsppWUVJLHqyuP8J+H6regtvyEjD6Vtyx5URJ5C4MAcWYSwakz5GIcsI4OyufNF8SaWbuzOntROfI1WwKFyncjLePQ3Yp9xiParhlxTYfT0le0fkq1DCBGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006496; c=relaxed/simple;
	bh=XNytlImA8FiqJPbGYO8Rr1KbGrdsMdMRsDBUv/IiWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaiH3936K/lA4nlM4WOUVtNg5grM2PlBH+SWaLdCFOyXqBu6lSk1Z/7YHZBeMGqTI3BKHJpEnAF8tehS0p7nvMf538wnJfgepJDzJx2dK/Lakn4qeEZtvzEPASAg3Av+IvqWccGjdojal8Vwh1y+rAF1Wn/TJIBzOBbOxL+cetU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFfhqtIq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qZd2R/Qp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFfhqtIq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qZd2R/Qp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774006493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/XAFuMj8200/2Yl3T2tu1n7OQ463xMtcQ3l4BrZLY4E=;
	b=bFfhqtIqeBuElOI+hN5D54U35GC8X9VERCpC2ZNHsRKqiKBy4DWxVtwsUYT/lt0/4ev+ft
	igUXOg3zmrqSsp1vt48vbcPHiZFwIQh9e+tlDg/kb2PPCpvMsPr48tCvZ2AQpMYiTaDS+4
	eW4Rbe7LnhcvNPiYtByDZsMsit+4rTI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-8zh0HVDDPfqEcJM872s4jg-1; Fri, 20 Mar 2026 07:34:52 -0400
X-MC-Unique: 8zh0HVDDPfqEcJM872s4jg-1
X-Mimecast-MFC-AGG-ID: 8zh0HVDDPfqEcJM872s4jg_1774006491
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so17792245ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774006491; x=1774611291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/XAFuMj8200/2Yl3T2tu1n7OQ463xMtcQ3l4BrZLY4E=;
        b=qZd2R/QppXgvzsjeSwXMnFCJKiDMXqVHWZUuU0kzaP8uo44u4XSU5lJIU6o8nLQuVS
         li84ftjS3fLEfQTHqXATa3xjLbfJnL2NpCbBMyx2EbUtvAOo2mnqNii56sKilAzdlxjr
         4mcrM6OQvLm6AWXcsGLbaDL91itBNTik6yYA3sg5FQeWpVfB00fncAqPLLGFZK06RO1n
         BfNgObTLAM/AZQ7/tO9qKCruwdu6RF+0413qUmML6NAc8zmDBH3U8Gf1XMKlQBSdYjd1
         XW4jqq+IeVyoGXpdTMecWPkmWLDAaOqUDF+1pEeJlT1r0obX3cRoSBnfZEuPHdHpTVyY
         sl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006491; x=1774611291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XAFuMj8200/2Yl3T2tu1n7OQ463xMtcQ3l4BrZLY4E=;
        b=d1Gb5J0JSjK6pztL9lqr2KjaPShhP3laKsoRzUbH1grn8fY0vIG4sRHou33Uzbp19J
         riigh7Kfk/5tZKOhONBszxEHGk4IONdvoNhoP8VgRoOq9eQJX0mqsUbup4f4eH5Nnc1z
         zXaaSv14o+ezr7VSwwNTCKx1y+XaogzfA8oimMo9ttLXFZGkLW/4l5MGdE78LXZ+nHwv
         8FeG14EmZERiTe9HYelPOhf+SMMMOtJ3Itc7oHhPYhCyjg9CyoYKJBIFzfK/de8wCOrb
         ACaT6j/GtwsW0Ecoc2+XLUnUOjBbvQX0AYAYDAWwnbbPBC1Gj2RX97O46p/3LA2B5tex
         G9jg==
X-Forwarded-Encrypted: i=1; AJvYcCXnw0MzMwHTUdVV/Z+zOjYr2YpuKLMRVQ3BrywNJ0+SxbuTxtx4MlrjW6+UCsGMDl7O6H3Xz50p8fC1c8QNYQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYlQNclVPqOpFARL97gLf4uH685jgQ1afdzPTeP9r2l8iv8PeP
	lx/4Jm7hm9bOjvRq3e64QMSBldml2TeHJ0R6rOTdzHfEdroNL1u9uBcQMM7P6c8w/V7wCyUOuoe
	twOyVq5Egs0H0gh6H9mLI+MUmk/45X0av0xsVh08xOXsTP7CLtDchLhqk5RmPyJRnw5OkSw==
X-Gm-Gg: ATEYQzyeEEqovcIWz9x/zr/qu3PEWdNfMhMGIk2aNgRu/7W4KgF1I/Zulczt4pY44DT
	wYg3HpCrkktzLx8KQCyb7fjtb9YN/EA8/eZXI0r6CrRxnLkF7lMaIz7/NEkUMPBHP59Zv9/w3QV
	ZN7efzn42dLyjK01ZR2gXxden0PDICFlrh/YkP+qAHvpW/Dca8jtIB9pDHa1B+F/6sN0uOmyCC8
	8NOsiuJJpircLr6P298MG2+jtAiQORxRUIbkPtHILYwLHi1UX3KXNr2R3e7HPJ1zcRZtBwrbxts
	IHhRhd/t/HSll7qRjo0aA+ghnbdl5vbdyG8urPQYK1vRUfSxcOBf47XUFU1jGJm/3OEe539O+xC
	wyvQeV9GplD0JX9pkWQ==
X-Received: by 2002:a17:902:c40f:b0:2ae:4d6b:b2c7 with SMTP id d9443c01a7336-2b0827564dfmr22400385ad.9.1774006491339;
        Fri, 20 Mar 2026 04:34:51 -0700 (PDT)
X-Received: by 2002:a17:902:c40f:b0:2ae:4d6b:b2c7 with SMTP id d9443c01a7336-2b0827564dfmr22400125ad.9.1774006490957;
        Fri, 20 Mar 2026 04:34:50 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm19628795ad.75.2026.03.20.04.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:34:50 -0700 (PDT)
Date: Fri, 20 Mar 2026 19:34:48 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH 3/7] selftests: memcg: Iterate pages based on the actual
 page size
Message-ID: <ab0w2PCcYBEKxm2B@redhat.com>
References: <20260319173752.1472864-1-longman@redhat.com>
 <20260319173752.1472864-4-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319173752.1472864-4-longman@redhat.com>

On Thu, Mar 19, 2026 at 01:37:48PM -0400, Waiman Long wrote:
> The current test_memcontrol test fault in memory by write a value
> to the start of a page based on the default value of 4k page size.
> Micro-optimize it by using the actual system page size to do the
> iteration.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

